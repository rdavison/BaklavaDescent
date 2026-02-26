# ChocolateDescent OxCaml Port Worklog

## Session Goal
Start an incremental, function-by-function port from C/C++ to OxCaml with strong correctness checks and low integration risk.

## High-Level Strategy Chosen
- Do not attempt a big-bang rewrite.
- Start with pure fixed-point math functions.
- Keep engine behavior stable by introducing an optional Ox bridge (`USE_OX_BRIDGE`).
- Add differential testing so C and Ox implementations are compared continuously.

## Timeline of Work

### 1) Repo reconnaissance and feasibility checks
- Mapped codebase/build structure (`2d`, `3d`, `main_d1`, `main_d2`, `platform`, `vecmat`, etc.).
- Confirmed process entry and engine entrypoint chain:
  - platform main -> `D_DescentMain`.
- Identified fixed-point math (`fix`) and `vecmat` as first low-risk targets.
- Confirmed toolchain on machine:
  - `ocamlc 5.4.0`, `opam 2.5.0`, `dune 3.20.2`, Core/Base packages installed.

### 2) Initial Ox bridge scaffold
- Added `ox/` and `scripts/ox/` scaffolding.
- Implemented first Ox callbacks:
  - `i2f`, `f2i`, `fixmul`, `fixdiv`.
- Added C bridge wrappers and startup function.
- Built first bridge artifacts and smoke scripts.

### 3) Corrected embedding model
- Reworked bridge from executable-loading idea to proper embedded runtime model:
  - Build Ox object (`math_bridge_complete.o`) and link it into C/C++.
- Added smoke test executable comparing C vs Ox for `fixmul/fixdiv`.
- Verified smoke test passes.

### 4) Naming and documentation improvements
- Clarified naming convention:
  - `cd_ox_*` (`cd` = ChocolateDescent namespace).
- Added explanatory comments to Ox bridge file describing fixed-point behavior and callback registration.

### 5) Engine integration (strict mode)
- Implemented strict initialization behavior:
  - `cd_ox_init_runtime(argv[0])` on startup.
  - Fail fast if Ox runtime/callback lookup fails.
  - No silent fallback behavior for bridge calls.
- Wired first real engine call site behind `USE_OX_BRIDGE`:
  - `vecmat::vm_vec_scale` uses `cd_ox_fixmul`.
- Added runtime verification markers:
  - `[OX] OxCaml bridge runtime initialized.`
  - `[OX] vm_vec_scale using cd_ox_fixmul.`

### 6) CMake integration for optional bridge builds
- Added `USE_OX_BRIDGE` CMake option.
- Added Ox bridge object build step into CMake graph.
- Linked bridge code/object conditionally into `ChocolateDescent` targets.
- Validated configure/build with explicit OpenAL soft paths on macOS.

### 7) End-to-end runtime verification with real assets
- Verified required game files present.
- Confirmed game run with Ox-enabled build and observed `[OX]` markers in runtime output.
- This confirmed actual in-engine Ox calls are executed.

### 8) Differential harness direction and design decisions
- Decided against brittle include-path hacks.
- Migrated dune project root to repository root for cleaner include semantics.
- Chose Alt 2 architecture for correctness:
  - CMake-built C oracle (`libc_oracle.a`) as trusted reference.
  - Ox `ppx_expect` tests link to oracle via FFI stubs.

### 9) C oracle + ppx_expect parity harness
- Added C oracle library:
  - `ox/oracle/c_oracle.{h,cpp}`.
- Added scripts:
  - `scripts/ox/build_c_oracle.sh`
  - `scripts/ox/run_expect_tests.sh`.
- Added expect tests comparing C oracle vs Ox.
- Introduced shared Ox implementation module:
  - `ox/ox_math.ml`.

### 10) First semantic bug found and fixed via differential tests
- Harness found mismatch in `fixdiv` overflow behavior.
- Root cause:
  - C semantics cast to `int32_t` (wrap), Ox version initially returned unwrapped OCaml int.
- Fixed Ox semantics by explicitly emulating int32 wrap behavior.
- Re-ran parity tests to green.

### 11) Step 1 parity expansion completed
- Extended C-oracle parity coverage to:
  - `i2f`
  - `f2i`
  - `fixmuldiv`
  - plus existing `fixmul`, `fixdiv`
- Updated expect snapshots to actual C-oracle outputs.
- Full parity suite passes.

## Key Lessons Learned
- Differential testing paid off immediately by exposing overflow/cast semantic drift.
- Strict init + fail-fast behavior simplifies reasoning during incremental porting.
- For this repo, CMake-built oracle + dune tests is more robust than trying to make dune own all C dependencies.
- For faithful ports, numeric edge semantics (especially overflow/sign/wrap) are as important as nominal formulas.

## Current State
- Ox bridge is integrated and can run in-game (`USE_OX_BRIDGE`).
- First real math path in engine is routed through Ox (`vm_vec_scale` via `cd_ox_fixmul`).
- Deterministic parity test harness exists and is passing for:
  - `i2f`, `f2i`, `fixmul`, `fixdiv`, `fixmuldiv`.
- Deterministic randomized differential tests are now in place and passing (5000 cases each) for:
  - `fixmul`, `fixdiv`, `fixmuldiv`.

## Next Work (Step 3)
- Add additional pure fixed-point functions to the C oracle + Ox parity suite (e.g. `fix_sqrt` or carefully selected helpers).
- Introduce first stateful differential test using snapshot/reset semantics for C vs Ox.
- Keep randomized tests deterministic by seed and report:
  - case count
  - mismatch count
  - first mismatch (if any)

## Session Update (February 26, 2026)

### 12) Large parity expansion after Step 1
- Added many additional C-oracle vs Ox parity ports with fixed-case and randomized tests.
- Kept test execution single-process (`dune runtest ox/tests --no-buffer -j 1`) to avoid dune lock/process contention.
- Continued explicit, typed equality in tests (no `Poly.equal`) and retained Core/Base-first style.

### 13) New math/vector/matrix ports completed
- Fixed-point:
  - `fix_sqrt`.
- Vector exact/quick operations:
  - `vm_vec_mag`, `vm_vec_dist`.
  - `vm_vec_copy_normalize`, `vm_vec_normalize`, `vm_vec_normalized_dir`.
  - `vm_vec_normal`.
- Matrix/rotation operations:
  - `vm_vec_rotate`.
  - `vm_transpose_matrix`, `vm_copy_transpose_matrix`.
  - `vm_matrix_x_matrix`.
  - `vm_vector_2_matrix` (including optional up/right vector semantics matching C `NULL` behavior).
  - `sincos_2_matrix`.

### 14) Harness/oracle improvements made during expansion
- Extended C oracle (`ox/oracle/c_oracle.{h,cpp}`) for each newly ported function.
- Extended OCaml FFI stubs (`ox/tests/c_fix_stubs.cpp`) for each new oracle entrypoint.
- Added matrix-aware and option-aware parity helpers/generators in `ox/tests/parity_expect.ml`.
- Added constrained/randomized generators for overflow-sensitive paths where C behavior can become pathological.

### 15) Commit trail for this expansion
- `7e31765` Port `vm_vec_rotate` and matrix transpose parity tests.
- `b3fa912` Port `vm_matrix_x_matrix` with C parity coverage.
- `201acf1` Port `fix_sqrt` with differential parity tests.
- `6e55959` Port `vm_vec_mag` and `vm_vec_dist` with parity tests.
- `5696517` Port exact vector normalize operations with parity tests.
- `9fda811` Port `vm_vec_normal` with constrained parity fuzzing.
- `801059a` Port `vm_vector_2_matrix` with option-aware parity tests.
- `1d36e61` Port `sincos_2_matrix` with differential matrix tests.

### 16) Current state (updated)
- Ox bridge is live in-engine for routed functions.
- Parity suite now covers a substantial set of fixed-point, vector, and matrix primitives.
- Every new function above has both deterministic examples and seeded randomized differential checks, and is green.

### 17) Proposed next step (Step 4)
- Start porting angle/trig stack consumers that sit on top of the now-ported primitives:
  - `vm_angles_2_matrix`.
  - `vm_vec_ang_2_matrix`.
  - potentially `vm_vec_delta_ang_norm` / `vm_vec_delta_ang` after table-backed trig parity choices are finalized.

### 18) Step 4 progress: angle-to-matrix ports completed
- Implemented in Ox:
  - `fix_sincos`-equivalent interpolation behavior (table-sample semantics reproduced in Ox via canonical sampled sine values).
  - `vm_angles_2_matrix`.
  - `vm_vec_ang_2_matrix`.
- Extended C oracle:
  - `c_oracle_vm_angles_2_matrix`.
  - `c_oracle_vm_vec_ang_2_matrix`.
- Extended parity FFI stubs and expect tests:
  - deterministic examples and seeded randomized differential tests for both new functions.
- Verification:
  - `scripts/ox/build_c_oracle.sh` passes.
  - `dune runtest ox/tests --no-buffer -j 1` passes.

### 19) Continued angle stack: delta-angle ports completed
- Implemented in Ox:
  - `fix_acos`-equivalent interpolation behavior (table-sample semantics reproduced in Ox via canonical sampled acos values).
  - `vm_vec_delta_ang_norm` (optional signedness vector behavior preserved).
  - `vm_vec_delta_ang` (normalize-then-delegate behavior preserved).
- Extended C oracle:
  - `c_oracle_vm_vec_delta_ang_norm`.
  - `c_oracle_vm_vec_delta_ang`.
- Extended parity harness:
  - option-aware scalar helpers and generators for `(v0, v1, fvec option)` cases.
  - deterministic and seeded randomized parity tests for both new functions.
- Verification:
  - `scripts/ox/build_c_oracle.sh` passes.
  - `dune runtest ox/tests --no-buffer -j 1` passes.

### 20) Trig inverse + angle extraction ports completed
- Implemented in Ox:
  - `fix_asin`.
  - `fix_atan2`.
  - `vm_extract_angles_vector_normalized`.
  - `vm_extract_angles_matrix`.
- Extended C oracle:
  - `c_oracle_fix_asin`.
  - `c_oracle_fix_atan2`.
  - `c_oracle_vm_extract_angles_vector_normalized`.
  - `c_oracle_vm_extract_angles_matrix`.
- Extended parity harness:
  - new scalar parity tests for `fix_asin` and `fix_atan2` (deterministic + randomized).
  - new angle-extraction parity tests for vector-normalized and matrix variants (deterministic + randomized).
- Important bug caught and fixed:
  - Ox `fix_atan2` initially used wrapped 32-bit absolute values for branch selection, which diverged from C `labs` semantics for `INT_MIN` edge cases.
  - Fixed by using non-wrapping absolute-value comparison (`int64`-based) in Ox, restoring parity.
- Verification:
  - `scripts/ox/build_c_oracle.sh` passes.
  - `dune runtest ox/tests --no-buffer -j 1` passes.

### 21) Stateful angle extraction vector parity completed (`vm_extract_angles_vector`)
- Implemented in Ox:
  - `vm_extract_angles_vector (p,b,h) v`.
  - Behavior matches C: normalize input vector; if non-zero, compute fresh angles; if zero, preserve existing angle state.
- Extended C oracle:
  - `c_oracle_vm_extract_angles_vector`.
- Extended parity FFI:
  - `caml_c_vm_extract_angles_vector` (+ bytecode wrapper).
- Extended parity tests:
  - deterministic stateful test cases for `(initial_ang3, vec3)`.
  - seeded randomized differential test (`5000` cases).
- Important mismatch found and fixed:
  - Randomized parity initially reported `45/5000` mismatches.
  - Root cause: Ox fallback path returned raw `(p,b,h)` values without `fixang` wrapping, while C always preserves `int16`-wrapped state.
  - Fix: fallback path now returns `vm_angvec_make p b h`.
- Verification:
  - `scripts/ox/build_c_oracle.sh` passes.
  - `dune runtest ox/tests --no-buffer -j 1` passes.

### 22) Added pure trig helper parity: `fix_fastsincos`
- Implemented in Ox:
  - `fix_fastsincos a` (table lookup without interpolation, matching C `fix_fastsincos`).
- Extended C oracle:
  - `c_oracle_fix_fastsincos(int32_t a, int32_t* s, int32_t* c)`.
- Extended parity FFI:
  - `caml_c_fix_fastsincos`.
- Extended parity harness:
  - added pair-valued parity helpers (`check_unop_pair`, `run_random_unop_pair`).
  - deterministic and seeded randomized differential tests for `fix_fastsincos`.
- Verification:
  - `scripts/ox/build_c_oracle.sh` passes.
  - `dune runtest ox/tests --no-buffer -j 1` passes.

### 23) Added inverse-square-root parity: `fix_isqrt`
- Implemented in Ox:
  - `fix_isqrt a` with the same iterative Newton-style refinement used by C.
  - added `isqrt_guess_lut_entry` derivation using the canonical table formula:
    - index `0` => `0x80000000`
    - index `i>0` => `floor(16777216 / sqrt(i))`
- Extended C oracle:
  - `c_oracle_fix_isqrt`.
- Extended parity FFI:
  - `caml_c_fix_isqrt`.
- Extended parity harness:
  - deterministic parity cases for `fix_isqrt`.
  - seeded randomized parity using a non-negative generator (`fix_nonneg_gen`) to stay within defined input domain.
  - generalized unop randomized helper to accept custom generators (`run_random_unop_with_gen`).
- Verification:
  - `scripts/ox/build_c_oracle.sh` passes.
  - `dune runtest ox/tests --no-buffer -j 1` passes.

### 24) Added direct parity for existing inverse/trig helpers (`fix_sincos`, `fix_acos`)
- Exposed oracle internals as public C-oracle entrypoints:
  - `c_oracle_fix_sincos`
  - `c_oracle_fix_acos`
- Extended parity FFI:
  - `caml_c_fix_sincos`
  - `caml_c_fix_acos`
- Extended parity harness:
  - deterministic + randomized differential tests for `fix_sincos` (pair output).
  - deterministic + randomized differential tests for `fix_acos`.
- Outcome:
  - confirms that direct helper behavior remains aligned, not only via downstream consumers.
- Verification:
  - `scripts/ox/build_c_oracle.sh` passes.
  - `dune runtest ox/tests --no-buffer -j 1` passes.

### 25) First in-engine trig routing: `fix_sincos` via Ox bridge
- Routed runtime callsite:
  - `fix/fix.cpp::fix_sincos` now calls `cd_ox_fix_sincos` when `USE_OX_BRIDGE` is enabled.
  - Added one-time runtime log marker:
    - `[OX] fix_sincos using cd_ox_fix_sincos.`
- Extended bridge surface:
  - C API: `cd_ox_fix_sincos(int32_t a, int32_t* s, int32_t* c)`.
  - Runtime callback registration/lookup:
    - registered `cd_fix_sincos` in `ox/math_bridge.ml`.
    - required callback presence during bridge init (`cd_ox_require_ready` / `cd_ox_is_ready`).
- Build-system fix discovered during integration:
  - `scripts/ox/build_bridge.sh` previously compiled only `math_bridge.ml`, which can fail to resolve `Ox_math`.
  - Updated bridge build to compile/link both:
    - `ox/ox_math.ml`
    - `ox/math_bridge.ml`
  - Added `-I "$OX_DIR"` so module interfaces resolve reliably.
- Verification:
  - `cmake --build build-ox -j` passes with `USE_OX_BRIDGE=ON`.
  - `dune runtest ox/tests --no-buffer -j 1` passes.
  - Runtime startup confirms bridge init (`[OX] OxCaml bridge runtime initialized.`).

### 26) Expanded in-engine Ox routing for fix/trig helpers
- Routed additional runtime callsites in `fix/fix.cpp` (guarded by `USE_OX_BRIDGE`):
  - `fix_sqrt` -> `cd_ox_fix_sqrt`
  - `fix_isqrt` -> `cd_ox_fix_isqrt`
  - `fix_asin` -> `cd_ox_fix_asin`
  - `fix_acos` -> `cd_ox_fix_acos`
  - `fix_atan2` -> `cd_ox_fix_atan2`
  - `fix_fastsincos` -> `cd_ox_fix_fastsincos`
- Added one-time runtime markers for each routed function to confirm live execution path selection in game logs.
- Extended bridge surface in `ox/bridge.h` + `ox/bridge.c`:
  - new exported wrappers for all above functions.
  - callback resolution via `caml_named_value` for:
    - `cd_fix_sqrt`, `cd_fix_isqrt`, `cd_fix_asin`, `cd_fix_acos`, `cd_fix_atan2`, `cd_fix_fastsincos`.
  - readiness checks updated so bridge init fails fast if any required callback is missing.
- Extended Ox callback registration in `ox/math_bridge.ml` for the new callback names.
- Important safety fix:
  - `cd_ox_fix_sincos` and `cd_ox_fix_fastsincos` now respect nullable output pointers (`s`/`c`), matching C API contracts and avoiding null dereference risk.
- Verification:
  - `dune runtest ox/tests --no-buffer -j 1` passes.
  - `cmake --build build-ox -j` passes.

### 27) Wired first vector-arithmetic batch through Ox bridge
- Routed additional runtime callsites in `vecmat/vecmat.cpp` (guarded by `USE_OX_BRIDGE`):
  - `vm_vec_add`
  - `vm_vec_sub`
  - `vm_vec_add2`
  - `vm_vec_sub2`
  - `vm_vec_avg`
  - `vm_vec_avg4`
  - `vm_vec_copy_scale`
  - `vm_vec_scale_add`
  - `vm_vec_scale_add2`
  - `vm_vec_scale2`
- Added one-time runtime markers for each routed function:
  - `[OX] vm_vec_* using cd_ox_vm_vec_*`
- Extended bridge surface in `ox/bridge.h` + `ox/bridge.c`:
  - new vector wrappers returning `(x,y,z)` via out-pointers.
  - callback names resolved via `caml_named_value`:
    - `cd_vm_vec_add`, `cd_vm_vec_sub`, `cd_vm_vec_add2`, `cd_vm_vec_sub2`
    - `cd_vm_vec_avg`, `cd_vm_vec_avg4`
    - `cd_vm_vec_copy_scale`, `cd_vm_vec_scale_add`, `cd_vm_vec_scale_add2`, `cd_vm_vec_scale2`
  - readiness checks updated to require these callbacks before bridge is considered ready.
- Extended Ox callback registration in `ox/math_bridge.ml`:
  - added C-friendly wrappers that flatten tuple-based Ox APIs into integer-arity callbacks for C.
- Verification:
  - `dune runtest ox/tests --no-buffer -j 1` passes.
  - `cmake --build build-ox -j` passes.

### 28) Added internal helper parity (`long_sqrt`, `quad_sqrt`, `fixquadadjust`) and fixed a real Ox bug
- Extended C oracle API in `ox/oracle/c_oracle.{h,cpp}`:
  - `c_oracle_long_sqrt(int32_t a)`
  - `c_oracle_quad_sqrt(int64_t q)`
  - `c_oracle_fixquadadjust(int64_t q)`
- Extended parity stubs in `ox/tests/c_fix_stubs.cpp`:
  - `caml_c_long_sqrt`
  - `caml_c_quad_sqrt`
  - `caml_c_fixquadadjust`
- Extended parity harness in `ox/tests/parity_expect.ml`:
  - deterministic parity tests for:
    - `long_sqrt`
    - `quad_sqrt`
    - `fixquadadjust`
  - seeded randomized differential tests for the same helper set.
  - added `int64`-input parity helper + generator (`check_unop_i64`, `run_random_unop_i64`, `int64_gen`).
- Important bug discovered and fixed:
  - Randomized `quad_sqrt` differential tests found mismatches at high `int64` values.
  - Root cause: `Ox_math.quad_sqrt` compared `mid * mid` in `int64`, which overflows near `Int64.max_value`.
  - Fix: switched to overflow-safe comparison `mid <= q / mid` and started binary search at `lo=1`.
  - Result: `quad_sqrt` parity now matches C-oracle behavior (including wrapped int32 ABI in the test bridge).
- Verification:
  - `scripts/ox/build_c_oracle.sh` passes.
  - `dune runtest ox/tests --no-buffer -j 1` passes.
  - `cmake --build build-ox -j` passes.

### 29) Added direct parity for internal vector scaling helper: `check_vec`
- Exposed C-oracle helper in `ox/oracle/c_oracle.{h,cpp}`:
  - `c_oracle_vm_check_vec(c_oracle_vec3* v)`
  - This is the same internal helper used by oracle `vm_vec_perp`.
- Extended parity stub surface in `ox/tests/c_fix_stubs.cpp`:
  - added `caml_c_vm_check_vec` (tuple-returning vec3 wrapper).
- Extended parity harness in `ox/tests/parity_expect.ml`:
  - new extern binding `c_vm_check_vec`.
  - deterministic parity cases covering:
    - zero vector
    - tiny vectors (underflow/normalize-up path)
    - moderate vectors
    - large vectors (scale-down path)
  - seeded randomized differential test:
    - `randomized vm_check_vec parity C vs Ox` using `vec3_mag_safe_gen`.
- Outcome:
  - confirms Ox `check_vec` helper matches C behavior directly, not just indirectly through `vm_vec_perp`.
- Verification:
  - `scripts/ox/build_c_oracle.sh` passes.
  - `dune runtest ox/tests --no-buffer -j 1` passes.
  - `cmake --build build-ox -j` passes.
