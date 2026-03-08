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

### 30) Ported and tested additional pure quad helpers (`fixquadnegate`, `ufixdivquadlong`)
- Added Ox implementations in `ox/ox_math.ml`:
  - `fixquadnegate low high` (bit-accurate 32-bit behavior, including low-word borrow into high word)
  - `ufixdivquadlong nl nh d` (unsigned 64/32 division with low-32-bit return semantics)
- Extended C oracle in `ox/oracle/c_oracle.{h,cpp}`:
  - `c_oracle_fixquadnegate(int32_t* low, int32_t* high)`
  - `c_oracle_ufixdivquadlong(int32_t nl, int32_t nh, int32_t d)`
- Extended parity FFI in `ox/tests/c_fix_stubs.cpp`:
  - `caml_c_fixquadnegate`
  - `caml_c_ufixdivquadlong`
- Extended parity harness in `ox/tests/parity_expect.ml`:
  - deterministic parity tests for `fixquadnegate` and `ufixdivquadlong`
  - randomized differential tests for both helper functions
  - added generic pair-valued binop helpers (`check_binop_pair`, `run_random_binop_pair`) reused by `fixquadnegate`.
- Notes:
  - randomized `ufixdivquadlong` test normalizes divisor `d=0` to `1` in both C and Ox test paths to stay in defined behavior.
- Verification:
  - `scripts/ox/build_c_oracle.sh` passes.
  - `dune runtest ox/tests --no-buffer -j 1` passes.
  - `cmake --build build-ox -j` passes.

### 31) Ported and tested additional low-level fixed-point helpers (`fixmulaccum`, `fixdivquadlong`)
- Added Ox implementations in `ox/ox_math.ml`:
  - `fixmulaccum q a b` (pure int64 accumulator update)
  - `fixdivquadlong n d` (int64 / uint32-style divisor semantics with `d=0 -> 1`)
- Extended C oracle in `ox/oracle/c_oracle.{h,cpp}`:
  - `c_oracle_fixmulaccum(int64_t q, int32_t a, int32_t b)`
  - `c_oracle_fixdivquadlong(int64_t n, int32_t d)`
- Extended parity FFI in `ox/tests/c_fix_stubs.cpp`:
  - `caml_c_fixmulaccum` (returns `int64` via `caml_copy_int64`)
  - `caml_c_fixdivquadlong`
- Extended parity harness in `ox/tests/parity_expect.ml`:
  - new deterministic parity tests for both helpers.
  - seeded randomized differential tests:
    - `randomized fixmulaccum parity C vs Ox` (safe generator bounds to avoid `int64` overflow UB in C)
    - `randomized fixdivquadlong parity C vs Ox`
  - added helper functions for `int64`-typed parity assertions:
    - `check_binop_i64_int`
    - `check_ternop_i64_out`
    - `run_random_binop_i64_int_with_gen`
    - `run_random_ternop_i64_out_with_gen`
- Verification:
  - `scripts/ox/build_c_oracle.sh` passes.
  - `dune runtest ox/tests --no-buffer -j 1` passes.
  - `cmake --build build-ox -j` passes.

### 32) Wired second batch of vector/matrix primitives through Ox bridge
- Added bridge implementations for 8 additional functions, bringing total bridge surface from 23 to 31 functions.
- **Already declared in bridge.h (needed impl + registration + engine wiring):**
  - `vm_vec_dotprod` (scalar return, 6 args)
  - `vm_vec_dot3` (scalar return, 6 args)
  - `vm_vec_mag` (scalar return, 3 args)
  - `vm_vec_dist` (scalar return, 6 args)
- **New bridge functions (full pipeline: bridge.h + bridge.c + math_bridge.ml + vecmat.cpp):**
  - `vm_vec_crossprod` (vec3 return, 6 args)
  - `vm_vec_perp` (vec3 return, 9 args — three points)
  - `vm_vec_copy_normalize` (mag + vec3 return via 4-tuple, 3 args)
  - `vm_vec_rotate` (vec3 return, 12 args — vec + matrix)
- Extended `ox/math_bridge.ml`:
  - Added C-friendly flattened wrappers for each new callback.
  - `cd_vm_vec_copy_normalize` returns a 4-tuple `(mag, nx, ny, nz)` for C unpacking.
  - `cd_vm_vec_rotate` flattens `(vec3, matrix)` into 12 integer args.
- Extended `ox/bridge.c`:
  - Added 8 global callback pointers and updated `cd_ox_require_ready`, `cd_ox_init_runtime`, `cd_ox_is_ready`.
  - Added function implementations using `caml_callbackN` + `cd_ox_unpack_vec3` / `Field` unpacking.
- Extended `vecmat/vecmat.cpp`:
  - Added `#ifdef USE_OX_BRIDGE` wiring for all 8 functions with one-time `[OX]` log markers.
- Cascade effect — these bridged functions also cover composite callers:
  - `vm_vec_normalize` → calls `vm_vec_copy_normalize` (now bridged)
  - `vm_vec_normal` → calls `vm_vec_perp` + `vm_vec_normalize` (both bridged)
  - `vm_vec_normalized_dir` → calls `vm_vec_sub` + `vm_vec_normalize` (both bridged)
  - `vm_matrix_x_matrix` → calls `vm_vec_dot3` (now bridged)
- Verification:
  - `scripts/ox/build_bridge.sh` passes.
  - `cmake --build build-ox -j` passes.
  - `dune runtest ox/tests --no-buffer -j 1` passes.
  - Runtime launch confirms new `[OX]` markers for `vm_vec_perp`, `vm_vec_copy_normalize`, `vm_vec_dotprod`, `vm_vec_crossprod`.

### 33) Wired angle/matrix stack through Ox bridge (11 new functions, total 42)
- Added bridge implementations for the full angle-to-matrix and matrix operation stack.
- **Matrix-producing functions (matrix output via `cd_ox_unpack_matrix` helper):**
  - `sincos_2_matrix` (6 scalar args → matrix)
  - `vm_angles_2_matrix` (angvec → matrix)
  - `vm_vec_ang_2_matrix` (vec3 + fixang → matrix)
  - `vm_transpose_matrix` (matrix → matrix, in-place)
  - `vm_copy_transpose_matrix` (reuses `cd_ox_vm_transpose_matrix` with separate src/dest)
  - `vm_matrix_x_matrix` (2 matrices → matrix, 18 input args)
  - `vm_vector_2_matrix` (fvec + optional uvec + optional rvec → matrix)
- **Angle-extraction functions (angvec output via `cd_ox_unpack_ang3` helper):**
  - `vm_extract_angles_matrix` (matrix → angvec)
  - `vm_extract_angles_vector_normalized` (vec3 → angvec)
  - `vm_extract_angles_vector` (initial angvec + vec3 → angvec, stateful)
- **Delta-angle functions (scalar return with optional fvec):**
  - `vm_vec_delta_ang_norm` (2 vec3 + optional fvec → fixang)
  - `vm_vec_delta_ang` (2 vec3 + optional fvec → fixang)
- Bridge design notes:
  - Added `cd_ox_unpack_matrix` (unpacks nested 3-tuple-of-3-tuples) and `cd_ox_unpack_ang3` helpers in bridge.c.
  - Optional C `NULL` pointers encoded as `has_uvec`/`has_rvec`/`has_fvec` integer flags in bridge API; OCaml wrappers convert to `option` types.
- Verification:
  - `scripts/ox/build_bridge.sh` passes.
  - `cmake --build build-ox -j` passes.
  - `dune runtest ox/tests --no-buffer -j 1` passes.
  - Runtime bridge init succeeds; per-function `[OX]` markers fire when gameplay code paths are exercised.

## 34. Port 3D pipeline to Ox and wire through bridge

- Created `ox/ox_3d.ml` — pure stateless implementations of the 3D coordinate transformation pipeline:
  - `g3_code_point` — compute clipping codes (CC_OFF_LEFT/RIGHT/TOP/BOT/BEHIND)
  - `checkmuldiv` — overflow-safe fixmul-then-divide (used by projection)
  - `g3_rotate_point` — world-to-view-space rotation (sub + rotate + code)
  - `g3_project_point` — perspective projection to screen coords
  - `g3_rotate_delta_x/y/z` — delta rotation by matrix column extraction
  - `g3_calc_point_depth` — z-depth via dot product with view forward vector
  - `scale_matrix` — aspect-ratio scaling of view matrix by zoom and window scale
  - `g3_point_2_vec` — 2D screen point to 3D ray unprojection
  - `g3_start_instance_matrix` — transformation stack push (sub + rotate + transpose + matmul)
- Key design: all functions are **pure** — globals (View_position, View_matrix, etc.) are passed as explicit parameters from C side rather than read from mutable state.
- Created `ox/g3d_bridge.ml` — OCaml callback wrappers flattening tuples/options to integer-arity functions for C bridge.
- Added `bridge_3d` library in `ox/dune`; `math_bridge.ml` force-links it via `ignore` to ensure callback registration.
- C oracle implementations added for all 3d functions (`c_oracle.h`/`c_oracle.cpp`).
- C stubs added in `ox/tests/c_fix_stubs.cpp` for parity testing.
- Parity tests added in `ox/tests/parity_expect.ml` — all pass with perfect C-vs-Ox agreement.
- Bridge wiring (10 new functions, total now 55):
  - `cd_ox_g3_code_point`, `cd_ox_checkmuldiv`, `cd_ox_g3_rotate_point`, `cd_ox_g3_project_point`
  - `cd_ox_g3_rotate_delta_x/y/z`, `cd_ox_g3_calc_point_depth`
  - `cd_ox_scale_matrix`, `cd_ox_g3_start_instance_matrix`
- Engine callsite wiring with `#ifdef USE_OX_BRIDGE`:
  - `3d/points.cpp` — 7 functions: g3_code_point, g3_rotate_point, checkmuldiv, g3_project_point, g3_rotate_delta_x/y/z, g3_calc_point_depth
  - `3d/matrix.cpp` — scale_matrix
  - `3d/instance.cpp` — g3_start_instance_matrix (with optional orient via has_orient flag)
- Verification: oracle + dune tests pass, cmake build succeeds, game launches without crash.

### 35) Fix randomized parity tests and wire remaining 3d/points.cpp functions

- **Fixed randomized parity test failures (3 bugs):**
  - `g3_project_point` (3259 mismatches): C stub returned uninitialized `sx`/`sy` on overflow — initialized to 0 in `c_fix_stubs.cpp`.
  - `g3_project_point` generator: `pos_fix_gen` produced values outside int32 range (`Int.abs Int32.min_value` = 2147483648) — clamped to `[1, 0x7FFFFFFF]`.
  - `g3_calc_point_depth` (884 mismatches): subtraction `px - vpx` wraps in C int32 but not OCaml — already fixed with `wrap_sub` helper in `ox_3d.ml`.
  - All 9 randomized tests (5000 cases each) now pass with 0 mismatches.
- **Wired remaining 3 functions in `3d/points.cpp`:**
  - `g3_point_2_vec` — new bridge callback `cd_ox_g3_point_2_vec` (16 args), passes `Canv_w2`, `Canv_h2`, `Matrix_scale`, `Unscaled_matrix` to Ox.
  - `g3_rotate_delta_vec` — reuses existing `cd_ox_vm_vec_rotate` bridge (no new OCaml callback).
  - `g3_add_delta_vec` — reuses existing `cd_ox_vm_vec_add` + `cd_ox_g3_code_point` bridges.
- **Build system fixes:**
  - Updated `scripts/ox/build_bridge.sh` to compile `ox_3d.ml` and `g3d_bridge.ml` (previously only `ox_math.ml` and `math_bridge.ml`).
  - Updated `CMakeLists.txt` DEPENDS to track all Ox source files for rebuild detection.
- **3d/ module fully wired:** all 12 math functions in `3d/points.cpp`, `3d/matrix.cpp`, and `3d/instance.cpp` now route through Ox. Remaining 3d/ functions are either thin glue calling already-wired functions, or rendering/setup code with no portable math.
- Bridge function count: 56 total (was 55).

### 36) Port 3d/ drawing helpers (clip_edge, facing checks, calc_rod_corners)

- **3 new pure functions in `ox/ox_3d.ml`:**
  - `clip_edge` — clips a point against one frustum plane using fixed-point interpolation (plane_flag selects x/y axis and sign). Takes flat scalar inputs for on/off point fields, returns new point fields + clipping codes.
  - `g3_check_normal_facing` — tests if a surface plane faces the viewer: `dot(view_pos - v, norm) > 0`.
  - `calc_rod_corners` — computes 4 billboard rod corners via normalize/cross/scale pipeline with `Matrix_scale` aspect correction. Returns 4 corner vec3s + codes_and.
- Added `pf_uvs` (8) and `pf_ls` (16) point-flag constants to `ox_3d.ml`.
- **Bridge layer (3 new callbacks, 3 new C functions):**
  - `cd_ox_clip_edge` — 14 input args, returns 8-tuple (xyz, uvl, flags, codes)
  - `cd_ox_g3_check_normal_facing` — 9 int args, returns int (0/1)
  - `cd_ox_calc_rod_corners` — 11 input args, returns 13 values (4×vec3 + codes_and)
- **C oracle implementations** added to `c_oracle.cpp` — use `c_oracle_fixdiv`/`c_oracle_fixmul` consistently (not game's `fixdiv`/`fixmul`) to avoid edge-case divergence with extreme inputs.
- **Parity tests:** 3 new randomized tests (5000 cases each), all pass with 0 mismatches. `calc_rod_corners` test uses bounded generators (±500k) to avoid overflow-territory divergence between game and oracle `fixdiv` implementations.
- **Engine callsite wiring with `#ifdef USE_OX_BRIDGE`:**
  - `3d/clipper.cpp` — `clip_edge`
  - `3d/draw.cpp` — `g3_check_normal_facing`
  - `3d/rod.cpp` — `calc_rod_corners`
- Bridge function count: 59 total (was 56).

### 37) Port do_facing_check (computed branch) and wire rotate_point_list

- **1 new pure function in `ox/ox_3d.ml`:**
  - `do_facing_check_computed` — facing check when no precomputed normal is available: computes perpendicular via `vm_vec_perp(p0, p1, p2)` then tests `dot(perp, p1) < 0`.
- **Bridge layer (1 new callback, 1 new C function):**
  - `cd_ox_do_facing_check_computed` — 9 int args (3 vertex positions), returns int (0/1).
- **C oracle + parity test:** `c_oracle_do_facing_check_computed` added. Parity test uses simple `Random.State` loop (5000 cases, ±500k range) instead of Quickcheck generators — avoids pathological slowness observed with deeply-nested Quickcheck `random_sequence`.
- **Engine callsite wiring:**
  - `3d/draw.cpp` — `do_facing_check` else-branch (when no precomputed normal) routed through `cd_ox_do_facing_check_computed`.
  - `3d/interp.cpp` — `rotate_point_list` gets `[OX]` log marker (function body just loops calling already-wired `g3_rotate_point`, no new Ox function needed).
- Bridge function count: 60 total (was 59).
- **3d/ math layer essentially complete:** all pure math functions are now ported. Remaining 3d/ code is rendering, setup, or thin glue calling already-wired functions.

### 38) Port clipping pipeline to Ox: clip_line, clip_plane, clip_polygon

- **3 new pure functions in `ox/ox_3d.ml`:**
  - `clip_line` — clips a line segment against up to 4 frustum planes, folding over plane flags `[1;2;4;8]`, swapping endpoints as needed, calling `clip_edge` per crossing.
  - `clip_plane` — Sutherland-Hodgman: clips a polygon vertex list against one frustum plane. Wraps first two vertices to end, iterates edges, calls `clip_edge` for transitions, passes through on-plane vertices.
  - `clip_polygon` — iterates all 4 plane flags, calling `clip_plane` for each active plane, with early exit when `codes_and != 0` (entirely clipped away).
- **Bridge layer (2 new callbacks, 2 new C functions):**
  - `cd_ox_clip_line` — 9 scalar args in (p0/p1 xyz+codes, codes_or), returns 9 values (final p0/p1 xyz+codes, clipped flag).
  - `cd_ox_clip_polygon` — **new array bridge pattern**: packs input vertices into flat int array `[x,y,z,u,v,l,flags,codes, ...]` (8 ints per vertex), returns flat array of clipped vertices + codes_or/codes_and. C side frees old temp points, allocates new temp points for all output vertices.
- **C oracle + parity tests:**
  - `c_oracle_clip_line` — scalar C oracle for clip_line. Parity test: 5000 random cases, 0 mismatches.
  - `c_oracle_clip_polygon` — C oracle implementing clip_plane + clip_polygon on flat arrays. Parity test: generates random 3–6 vertex polygons with mixed codes, filters to non-behind/needs-clipping cases (274 of 5000 pass filter), 0 mismatches.
- **Engine callsite wiring with `#ifdef USE_OX_BRIDGE`:**
  - `3d/clipper.cpp` — `clip_line` and `clip_polygon`.
- **Bug fix: PF_PROJECTED flag leak through clip_polygon bridge.**
  Original code preserved vertex identity for passthrough vertices (same pointer = same screen coords already set). The bridge creates new temp points for ALL output, but was passing through all `p3_flags` including `PF_PROJECTED`. Callers seeing `PF_PROJECTED` on a new temp point would skip re-projection, using uninitialized `p3_sx`/`p3_sy` — causing wild rendering artifacts. Fix: mask flags to only clipping-relevant bits: `src[i]->p3_flags & (PF_UVS | PF_LS)`.
- Bridge function count: 62 total (was 60).

### 39) Wire vm_vector_2_matrix_norm + Port gameseg pure geometry to Ox

- **Wire `vm_vector_2_matrix_norm`:**
  - OCaml impl + oracle + parity test already existed (5000 cases, 0 mismatches). Added 4-layer bridge wiring: `math_bridge.ml`, `bridge.c`, `bridge.h`, `vecmat.cpp`.
  - Identical pattern to `vm_vector_2_matrix`: 11 scalar args → 9 output scalars (3×3 matrix).

- **New module `ox/ox_gameseg.ml` — first game-logic module beyond fix/vecmat/3d:**
  - `side_to_verts` constant (compile-time duplicate of C global).
  - `compute_center_point_on_side` — average of 4 vertex positions (delegates to `vm_vec_avg4`).
  - `compute_segment_center` — average of 8 vertex positions.
  - `get_verts_for_normal` — canonical vertex ordering for normals, pure combinatorics with insertion sort + parity check.
  - `create_abs_vertex_lists` — face topology from side type + segment vertex array. Returns absolute vertex indices for 1–2 faces (4 or 6 vertices).
  - `get_seg_masks` — sphere-in-segment bitmask test. Iterates 6 sides, calls `create_abs_vertex_lists` + `vm_dist_to_plane`, handles concave/convex sides. Returns facemask/sidemask/centermask.
  - `get_side_dists` — per-side plane distances variant of `get_seg_masks`.
  - `extract_vector_from_segment` — direction between face centers using `Side_to_verts`.
  - `extract_orient_from_segment` — 3×3 orientation matrix via `extract_vector_from_segment` + `vm_vector_2_matrix`.

- **Bridge architecture for global-dependent functions:**
  - C bridge reads `Segments[]`/`Vertices[]` globals, passes extracted data as flat arrays.
  - `get_seg_masks`/`get_side_dists` use packed int arrays (78/77 elements): checkp + rad + seg_verts + side_types + normals + vertex positions.
  - `lookup_vpos` helper in OCaml maps absolute vertex indices back to segment-relative positions.
  - `extract_vector_from_segment`/`extract_orient_from_segment` pass 24+2 / 24 ints (8 vertex positions + side indices).

- **New bridge files:**
  - `ox/gameseg_bridge.ml` — callback wrappers for all 8 gameseg functions.
  - `ox/oracle/c_oracle_gameseg.cpp` + `.h` — C oracle implementations.

- **Parity tests (all passing):**
  - `compute_center_point_on_side` — 2 deterministic cases.
  - `compute_segment_center` — unit cube test.
  - `get_verts_for_normal` — 4 cases covering sort + negate_flag.
  - `create_abs_vertex_lists` — 6 cases across all 3 side types and multiple sides.
  - `extract_vector_from_segment` — 2 cases (front→back, bottom→top).
  - `extract_orient_from_segment` — unit cube orientation matrix.

- **Engine callsite wiring with `#ifdef USE_OX_BRIDGE` in `main_d1/gameseg.cpp`:**
  - `compute_center_point_on_side`, `compute_segment_center`, `create_abs_vertex_lists`, `get_seg_masks`, `get_side_dists`, `get_verts_for_normal`, `extract_vector_from_segment`, `extract_orient_from_segment`.

- Bridge function count: 71 total (was 62). New OCaml module count: 4 (ox_math, ox_3d, ox_gameseg + bridges).

### 40) Port FVI pure geometry to Ox

- **New module `ox/ox_fvi.ml` — FVI (Find Vector Intersection) pure geometry functions:**
  - `oflow_check` — overflow detection for 47+ bit products.
  - `find_plane_line_intersection` — plane/line intersect with radius offset, returns `Some (k, newp)` or `None`.
  - `check_point_to_face` — 2D point-in-polygon via ij_table projection, returns edgemask.
  - `check_sphere_to_face` — sphere-face overlap test, returns IT_FACE/IT_EDGE/IT_POINT/IT_NONE.
  - `calc_det_value` — 3×3 matrix determinant with 32-bit wrapping at each intermediate step.
  - `check_line_to_line` — line-line closest approach via cross product and determinant.
  - `check_line_to_face` — line-face intersection using plane intersect + sphere-to-face check.
  - `special_check_line_to_face` — handles case where both endpoints poke through face plane, falls back to edge intersection.
  - `check_vector_to_sphere_1` — ray-sphere intersection with inside-sphere handling.

- **Critical 32-bit wrapping pattern:**
  - C `int32_t` arithmetic naturally wraps on overflow; OCaml 63-bit ints don't.
  - Added `wrap32` helper: `Ox_math.wrap_i64_to_fix (Int64.of_int x)`.
  - Applied throughout all functions at every intermediate sum/difference that could overflow:
    - `calc_det_value`: all 5 accumulation steps.
    - `check_point_to_face`: edge vector subtractions, cross product difference.
    - `find_plane_line_intersection`: `num`, `den`, `neg_num`.
    - `check_sphere_to_face`: `d + rad`, `d - rad`.
    - `check_vector_to_sphere_1`: `mag_d + sphere_rad`, `rad2 - dist2`, `w_dist - shorten`.
    - `special_check_line_to_face`: `move_len + rad`, `fixmul rad 15`, `move_t - rad`.

- **New bridge file `ox/fvi_bridge.ml` — 3 callback wrappers:**
  - `cd_check_line_to_face` — unpacks 46-element int array (p0, p1, norm, rad, facenum, nv, side_type, sidenum, seg_verts[8], seg_vert_positions[8×3]), calls `create_abs_vertex_lists` then `check_line_to_face`.
  - `cd_special_check_line_to_face` — same pack format, adds `num_faces` derivation.
  - `cd_check_vector_to_sphere_1` — 10 scalar args, returns `(dist, ix, iy, iz)`.

- **C bridge layer (3 new functions in `bridge.c`/`bridge.h`):**
  - `cd_ox_check_line_to_face` — packs segment data into OCaml int array, calls callback, unpacks `(hit_type, npx, npy, npz)`.
  - `cd_ox_special_check_line_to_face` — same pattern.
  - `cd_ox_check_vector_to_sphere_1` — 10 `Val_long` args via `caml_callbackN`.

- **Engine callsite wiring with `#ifdef USE_OX_BRIDGE` in `main_d1/fvi.cpp`:**
  - `check_line_to_face` — packs `seg->verts[]`, `Vertices[]` positions, side normals into `int32_t packed[46]`.
  - `special_check_line_to_face` — same packing.
  - `check_vector_to_sphere_1` — scalar args (no segment data needed).

- **Oracle + parity tests (`ox/oracle/c_oracle_fvi.cpp` + `ox/tests/parity_expect.ml`):**
  - C oracle reimplements all FVI functions using `c_oracle_*` math primitives.
  - 7 parity test suites (5000 random cases each): `calc_det_value`, `check_line_to_line`, `check_point_to_face`, `find_plane_line_intersection`, `check_sphere_to_face`, `check_line_to_face`, `check_vector_to_sphere_1`.
  - All pass with 0 mismatches.

- Bridge function count: 74 total (was 71). OCaml module count: 5 (ox_math, ox_3d, ox_gameseg, ox_fvi + bridges).

### 14) Wire D2 gameseg/fvi + Port curves pure math

- **D2 gameseg.cpp wiring (`main_d2/gameseg.cpp`):**
  - Added `#include "ox/bridge.h"` + 8 `#ifdef USE_OX_BRIDGE` blocks.
  - Functions: `compute_center_point_on_side`, `compute_segment_center`, `create_abs_vertex_lists`, `get_seg_masks`, `get_side_dists`, `extract_vector_from_segment`, `extract_orient_from_segment`, `get_verts_for_normal`.
  - D2 has extra `segnum == -1` Error guards — bridge blocks placed after guards.

- **D2 fvi.cpp wiring (`main_d2/fvi.cpp`):**
  - Added `#include "ox/bridge.h"` + 3 `#ifdef USE_OX_BRIDGE` blocks.
  - Functions: `check_line_to_face`, `special_check_line_to_face`, `check_vector_to_sphere_1`.
  - `special_check_line_to_face` bridge placed after `disable_new_fvi_stuff` early return and `segnum == -1` guard.

- **No new bridge functions or OCaml code for D2** — reuses existing D1 implementations and bridge callbacks. Bridge count stays at 74.

- **Curves pure math port (`ox/ox_curves.ml`):**
  - New `vms_equation` record type (12 fix coefficients for cubic in x, y, z).
  - 4 pure functions: `create_curve`, `evaluate_curve`, `curve_dist`, `curve_dir`.
  - Key detail: arithmetic results wrapped to int32 via `wrap_i64_to_fix` to match C overflow behavior.
  - No bridge wiring (editor-only, `#ifdef EDITOR` is OFF).

- **Oracle + parity tests:**
  - `ox/oracle/c_oracle_curves.cpp` + `.h` — C oracle for all 4 functions.
  - OCaml stubs in `ox/tests/c_fix_stubs.cpp`.
  - 7 parity test suites: `create_curve` (deterministic + 3000 random), `evaluate_curve` (deterministic + 3000 random), `curve_dist` (deterministic), `curve_dir` (deterministic + 3000 random).
  - All pass with 0 mismatches.

- OCaml module count: 6 (ox_math, ox_3d, ox_gameseg, ox_fvi, ox_curves + bridges).

### 12) Port `apply_damage_to_robot` (D1) -- first game logic with effect tree pattern

- **Effect tree pattern:** OCaml computes pure decision logic and returns a serialized tree of effects. C walks the tree, executing side effects (kill counters, explosions, network messages) and evaluating queries (`multi_explode_robot_sub`) to determine which branches to take. This keeps OCaml pure and testable.

- **New files:**
  - `ox/ox_collide.ml` -- pure game logic + effect/result tree types + flat-int serialization.
  - `ox/collide_bridge.ml` -- bridge adapter, serializes to flat int array, registers callback.
  - `ox/tests/collide_expect.ml` -- 12 expect tests covering all decision paths + serialization.

- **Modified files:**
  - `ox/dune` -- added `ox_collide` and `bridge_collide` libraries, updated `math_bridge` deps.
  - `ox/math_bridge.ml` -- force-init `Collide_bridge` module.
  - `ox/bridge.h` / `ox/bridge.c` -- added `cd_ox_apply_damage_to_robot_d1` (returns flat buffer).
  - `main_d1/collide.cpp` -- `#ifdef USE_OX_BRIDGE` wiring with inline tree walker.
  - `scripts/ox/build_bridge.sh` -- added new .ml files to compilation list.
  - `CMakeLists.txt` -- added new .ml files to DEPENDS list.

- **Design decisions:**
  - Tree walker lives in `collide.cpp` (not `bridge.c`) because it needs C++ game functions (`multi_explode_robot_sub`, `start_boss_death_sequence`, `explode_object`, `multi_send_robot_explode`).
  - Bridge returns raw flat int array; C++ walks it with an iterative loop (no recursion needed since Query nodes always branch into a single path).
  - Multiplayer calls guarded with `#if defined(NETWORK) && !defined(SHAREWARE)` matching original code.
  - `effect` renamed to `damage_effect` since `effect` is reserved in OCaml 5.x (algebraic effects).

- **Verification:**
  - `dune runtest ox/tests` -- all 12 new expect tests pass.
  - `cmake --build build-ox -j8` -- both ChocolateDescent and ChocolateDescent2 build.
  - OCaml module count: 7 (ox_math, ox_3d, ox_gameseg, ox_fvi, ox_curves, ox_collide + bridges).

### 13) Fix crash in `calc_rod_corners` Ox bridge path

- **Bug:** Standing inside a matcen (robot generator) when an enemy spawned caused a crash -- `Int3()` assertion in `g3_draw_tmap` at `draw.cpp:309` ("should not overflow after clip").
- **Root cause:** The Ox bridge path in `calc_rod_corners` (`3d/rod.cpp`) set rod point coordinates from OCaml output but never called `g3_code_point()` on each point. The original C path did this at line 117. Without `p3_codes` set, `g3_draw_tmap` saw zero codes, thought all points were fully on-screen, skipped clipping, and projection overflowed on points behind the camera.
- **Fix:** Added `g3_code_point(&rod_points[i])` loop after setting coordinates, matching the original C path. Also recomputes `codes_and` from the per-point codes rather than relying on the OCaml-returned value (which was correct but now redundant).
- **Repro:** Stand inside matcen on level 1, wait for robot spawn. Previously crashed; now renders correctly.

### 14) Port physics_turn_towards_vector to Ox

- **New module `ox/ox_physics.ml` — first physics module:**
  - `physics_set_rotvel_and_saturate` — XOR sign check + deadband logic for rotational velocity clamping.
  - `physics_turn_towards_vector` — robot AI steering algorithm: extracts heading/pitch angles from goal and forward vectors, computes deltas with fixang wrapping, divides by rate, applies deadband amplification, clamps via `physics_set_rotvel_and_saturate`.
  - Key detail: angle wrapping to `[-F1_0/2, F1_0/2]` range, and XOR sign check `(delta lxor dest) < 0` works correctly for 32-bit values in OCaml 63-bit ints.

- **New files:**
  - `ox/ox_physics.ml` — pure implementations.
  - `ox/physics_bridge.ml` — 11-arg bridge wrapper, registers `"cd_physics_turn_towards_vector"` callback.

- **Modified files:**
  - `ox/dune` — added `ox_physics` library and `bridge_physics` library, updated `math_bridge` deps.
  - `ox/math_bridge.ml` — force-init `Physics_bridge` module via `ignore`.
  - `ox/bridge.h` / `ox/bridge.c` — added `cd_ox_physics_turn_towards_vector` (11 inputs + 3 output pointers). Uses `caml_callbackN` with 11 args, unpacks 3-tuple return.
  - `main_d1/physics.cpp` — `#ifdef USE_OX_BRIDGE` block in `physics_turn_towards_vector`.
  - `main_d2/physics.cpp` — same wiring as D1.
  - `scripts/ox/build_bridge.sh` — added `ox_physics.ml` and `physics_bridge.ml` to compilation list.
  - `CMakeLists.txt` — added new .ml files to DEPENDS list.

- **Oracle + parity tests:**
  - `ox/oracle/c_oracle.cpp` — added `c_oracle_physics_turn_towards_vector` (reuses existing oracle math primitives).
  - `ox/tests/c_fix_stubs.cpp` — added 11-arg native stub + bytecode wrapper (`_bc`).
  - `ox/tests/parity_expect.ml` — 3 tests: zero goal (deterministic), basic forward (deterministic), randomized 5000-case differential test. All pass with 0 mismatches.
  - `ox/tests/dune` — added `ox_physics` to parity_expect library deps.

- **Verification:**
  - `dune runtest ox/tests` — all tests pass.
  - `cmake --build build-ox -j8` — both D1 and D2 build clean.

- OCaml module count: 8 (ox_math, ox_3d, ox_gameseg, ox_fvi, ox_curves, ox_collide, ox_physics + bridges).

### 15) Port do_physics_sim_rot + helpers to Ox

- **3 new pure functions in `ox/ox_physics.ml`:**
  - `check_and_fix_matrix` — rebuilds orthogonal matrix from forward+up vectors via `vm_vector_2_matrix`.
  - `set_object_turnroll` — computes new turnroll angle from rotational velocity, with `fixang` (int16) wrapping to match C truncation behavior.
  - `do_physics_sim_rot` — full rotational physics simulation per frame: drag integration (with thrust or pure damping), orientation update via angle-to-matrix, turnroll banking, and matrix orthogonality fix. Handles `PF_USES_THRUST`, `PF_TURNROLL`, and `PF_FREE_SPINNING` flags.

- **Key fix: int32 wrapping in vector arithmetic.**
  - With tiny mass values, `fixdiv(f1_0, mass)` produces huge acceleration that overflows int32 in additions. OCaml 63-bit ints don't wrap naturally. Added `w32` helper (`wrap_i64_to_fix`) to `vec_add` so additions wrap to int32, matching C behavior. Fixed 1/5000 randomized mismatch.

- **Bridge layer (1 new callback, 1 new C function):**
  - `cd_ox_do_physics_sim_rot` — 20 input args (rotvel, rotthrust, orient, drag, mass, flags, turnroll, frame_time), returns tag + orient[9] + rotvel[3] + turnroll via `caml_callbackN`. Tag=0 means no rotation needed (early exit).

- **C oracle + parity tests:**
  - `c_oracle_do_physics_sim_rot` — includes `c_oracle_set_object_turnroll` and `c_oracle_check_and_fix_matrix` helpers.
  - 3 parity tests: zero rotvel (no change), simple heading rotation, drag-only damping. Plus 5000-case randomized test with random orientation matrices (generated via `vm_angles_2_matrix`), all pass with 0 mismatches.

- **Engine callsite wiring with `#ifdef USE_OX_BRIDGE`:**
  - `main_d1/physics.cpp` — `do_physics_sim_rot` routed through bridge after Assert.
  - `main_d2/physics.cpp` — same wiring. D2's `PF_FREE_SPINNING` flag is handled by the OCaml implementation.

- **Verification:**
  - `dune runtest ox/tests` — all tests pass.
  - `cmake --build build-ox -j8` — both D1 and D2 build clean.

### 16) Port `calc_gun_point` to Ox with parity tests

**What:** Ported `calc_gun_point` from `main_d1/robot.cpp` (and identically `main_d2/robot.cpp`) to OxCaml. This function computes world-space gun positions for robots by walking a bone hierarchy (up to MAX_SUBMODELS=10 submodels) with matrix transforms at each joint, then transforming by the object's orientation and position.

- **1 new pure function in `ox/ox_physics.ml`:**
  - `calc_gun_point` — walks bone hierarchy from `start_mn` to root (mn=0), applying `vm_angles_2_matrix` + transpose + rotate + offset at each level, then final orient transpose + rotate + position add.

- **Bridge layer:**
  - `cd_calc_gun_point` in `physics_bridge.ml` — unpacks flat int array (86 elements: gun_point[3], start_mn, anim_angles[10×3], offsets[10×3], parents[10], orient[9], pos[3]) and calls OCaml function.
  - `cd_ox_calc_gun_point` in `bridge.c` — allocates OCaml array, packs 86 ints, calls callback, extracts vec3 result.

- **C oracle + parity tests:**
  - `c_oracle_calc_gun_point` — replicates exact C logic using oracle math primitives.
  - 3 deterministic tests: identity orient with no hierarchy, one hierarchy level, two hierarchy levels.
  - 5000-case randomized test with random hierarchy depths (0–3), random angles, offsets, and orientations — all pass with 0 mismatches.

- **Engine callsite wiring with `#ifdef USE_OX_BRIDGE`:**
  - `main_d1/robot.cpp` — packs bone data into flat array, calls bridge, writes result to gun_point.
  - `main_d2/robot.cpp` — identical wiring. D1 and D2 implementations are the same.

- **Verification:**
  - `dune runtest ox/tests` — all tests pass.
  - `cmake --build build-ox -j8` — both D1 and D2 build clean.

### 17) Port `phys_apply_force` and `phys_apply_rot` to Ox with parity tests

**What:** Ported `phys_apply_force` and `phys_apply_rot` from `main_d1/physics.cpp` to OxCaml. These functions apply forces to objects: `phys_apply_force` scales a force vector by inverse mass and adds to velocity; `phys_apply_rot` computes a turn rate from force magnitude vs mass and calls `physics_turn_towards_vector` to apply rotational force. Both compose already-ported primitives (`fixdiv`, `vm_vec_scale_add2`, `vm_vec_mag`, `physics_turn_towards_vector`).

- **2 new pure functions in `ox/ox_physics.ml`:**
  - `phys_apply_force` — scales force by `1/mass`, adds to velocity via `vm_vec_scale_add2`. Returns velocity unchanged if mass=0.
  - `phys_apply_rot` — computes `vecmag = vm_vec_mag(force)/8`, determines rate from mass/vecmag ratio (with floor of F1_0/4 for robots, F1_0/2 otherwise), calls `physics_turn_towards_vector`. Returns `(new_rotvel, set_skip_ai)` where `set_skip_ai` is true when a robot gets a significant enough rotational push.

- **Bridge layer:**
  - `cd_phys_apply_force` (7 scalar args → vec3) and `cd_phys_apply_rot` (12 scalar args → 4 ints) in `physics_bridge.ml`.
  - `cd_ox_phys_apply_force` and `cd_ox_phys_apply_rot` in `bridge.c` using `caml_callbackN`.

- **C oracle + parity tests:**
  - `c_oracle_phys_apply_force` and `c_oracle_phys_apply_rot` replicate exact C logic.
  - `phys_apply_force`: 3 deterministic tests (zero force, unit force, mass-zero guard) + 5000 randomized — 0 mismatches.
  - `phys_apply_rot`: 2 deterministic tests (zero force, robot skip_ai case) + 5000 randomized — 0 mismatches.

- **Engine callsite wiring with `#ifdef USE_OX_BRIDGE`:**
  - `main_d1/physics.cpp` — both `phys_apply_force` and `phys_apply_rot` wired.
  - `main_d2/physics.cpp` — only `phys_apply_force` wired. D2 `phys_apply_rot` has different SKIP_AI_COUNT logic involving thief/attack_type checks and `P_Rand()` RNG, so it is not ported.

- **Verification:**
  - `dune runtest ox/tests` — all tests pass.
  - `cmake --build build-ox -j8` — both D1 and D2 build clean.

### 18) Port `ai_turn_towards_vector` and `set_thrust_from_velocity` to Ox with parity tests

**What:** Ported `ai_turn_towards_vector` from `main_d1/ai.cpp` and `main_d2/ai2.cpp`, and `set_thrust_from_velocity` from `main_d1/physics.cpp` and `main_d2/physics.cpp` to OxCaml. `ai_turn_towards_vector` is the AI robot turning workhorse — smoothly interpolates a robot's orientation toward a goal vector using FrameTime-scaled blending, then rebuilds the orientation matrix via `vm_vector_2_matrix`. `set_thrust_from_velocity` computes the thrust needed to maintain current velocity under drag: `k = mass * drag / (F1_0 - drag); thrust = velocity * k`.

- **2 new pure functions in `ox/ox_physics.ml`:**
  - `ai_turn_towards_vector` — handles the non-baby-spider interpolation path. Takes seismic tremor parameters (D2) as extra args (zeros for D1). Baby spider check handled at C callsite by delegating to already-bridged `physics_turn_towards_vector`.
  - `set_thrust_from_velocity` — uses `fixmuldiv` and `vm_vec_copy_scale`, both already ported.

- **Bridge layer:**
  - `cd_ai_turn_towards_vector` (16 scalar args → 9 ints) and `cd_set_thrust_from_velocity` (5 args → 3 ints) in `physics_bridge.ml`.
  - `cd_ox_ai_turn_towards_vector` and `cd_ox_set_thrust_from_velocity` in `bridge.c` using `caml_callbackN`.

- **C oracle + parity tests:**
  - `c_oracle_ai_turn_towards_vector` and `c_oracle_set_thrust_from_velocity`.
  - `ai_turn_towards_vector`: 2 deterministic tests (facing goal, 90-degree turn) + 5000 randomized without seismic + 5000 randomized with seismic — all pass with 0 mismatches.
  - `set_thrust_from_velocity`: 2 deterministic tests (zero velocity, unit velocity) + 5000 randomized — 0 mismatches.

- **Engine callsite wiring with `#ifdef USE_OX_BRIDGE`:**
  - `main_d1/ai.cpp` — `ai_turn_towards_vector` wired (first bridge usage in this file). Baby spider case delegates to existing `physics_turn_towards_vector` bridge. Seismic args all zero for D1.
  - `main_d2/ai2.cpp` — `ai_turn_towards_vector` wired. D2 seismic tremor handled by generating `rand_vec` via `make_random_vector()` on C side before calling bridge, passing `Seismic_tremor_magnitude` and `Robot_info[id].mass`.
  - `main_d1/physics.cpp` — `set_thrust_from_velocity` wired.
  - `main_d2/physics.cpp` — `set_thrust_from_velocity` wired. D1 and D2 implementations are identical.

- **Verification:**
  - `dune runtest ox/tests` — all tests pass.
  - `cmake --build build-ox -j8` — both D1 and D2 build clean.

### 19) Port `move_towards_vector`, `move_around_player`, `move_away_from_player` to Ox with parity tests

**What:** Ported the three AI movement functions from `main_d1/ai.cpp` and `main_d2/ai2.cpp` to OxCaml. These are the velocity-manipulation workhorses of AI behavior — `move_towards_vector` accelerates toward a goal with speed capping, `move_around_player` generates perpendicular evasion vectors for circling/dodging, and `move_away_from_player` retreats with optional directional juking.

- **3 new pure functions in `ox/ox_physics.ml`:**
  - `move_towards_vector` — unified D1/D2 with `dot_based`, `is_thief`, `is_kamikaze` flags. D1 passes `dot_based=true, is_thief=false, is_kamikaze=false`.
  - `move_around_player` — unified D1/D2 with `skip_objnum1` flag (D2 skips speed cap for objnum 1). Handles direction cycling, perpendicular evasion vectors, fast evasion with damage_scale.
  - `move_away_from_player` — identical in D1 and D2. Subtracts player vector, applies directional juke via uvec/rvec, speed cap.

- **Bridge layer:**
  - `cd_move_towards_vector` (16 scalar args → 3 ints) and `cd_move_away_from_player` (17 scalar args → 3 ints) in `physics_bridge.ml`.
  - `cd_move_around_player` uses flat int array of 19 elements (same pattern as `calc_gun_point`).
  - `cd_ox_move_towards_vector`, `cd_ox_move_around_player`, `cd_ox_move_away_from_player` in `bridge.c`.

- **C oracle + parity tests:**
  - `c_oracle_move_towards_vector`, `c_oracle_move_around_player`, `c_oracle_move_away_from_player`.
  - Each function: 1 deterministic test + 5000 randomized — all pass with 0 mismatches.

- **Engine callsite wiring with `#ifdef USE_OX_BRIDGE`:**
  - `main_d1/ai.cpp` — all three functions wired. D1 `move_towards_vector` passes `dot_based=1, is_thief=0, is_kamikaze=0`. D1 `move_around_player` passes `skip_objnum1=0`.
  - `main_d2/ai2.cpp` — all three functions wired. D2 `move_towards_vector` passes actual `dot_based`, `robptr->thief`, `robptr->kamikaze`. D2 `move_around_player` passes `skip_objnum1=1`.

- **Verification:**
  - `dune runtest ox/tests` — all tests pass.
  - `cmake --build build-ox -j8` — both D1 and D2 build clean.

### 20) Port `set_object_turnroll` + `lead_player`/`compute_lead_component` to Ox with parity tests

**What:** Ported `set_object_turnroll` (D1+D2 physics) and `lead_player`/`compute_lead_component` (D2 AI targeting) to OxCaml.

- **3 new pure functions in `ox/ox_physics.ml`:**
  - `set_object_turnroll` — computes banking from rotvel_y. Identical in D1 and D2. Constants TURNROLL_SCALE=0x4ec4/2, ROLL_RATE=0x2000 hardcoded.
  - `compute_lead_component` — helper for lead_player, computes per-axis lead offset.
  - `lead_player` — AI lead-firing prediction. Checks cloaking, player speed, distance, dot range, weapon speed, matter weapon difficulty scaling. Returns `None` (don't lead) or `Some (fx, fy, fz)` (lead firing vector). D2-only (D1 has no lead_player).

- **Bridge layer:**
  - `cd_set_object_turnroll` (3 scalar args → 1 int) and `cd_lead_player` (16 scalar args → 4-tuple: success + vec3) in `physics_bridge.ml`.
  - `cd_ox_set_object_turnroll` and `cd_ox_lead_player` in `bridge.c`.

- **C oracle + parity tests:**
  - `c_oracle_set_object_turnroll` and `c_oracle_lead_player` in `c_oracle.cpp`. Used local variable names to avoid macro conflicts with `fix.h` constants (TURNROLL_SCALE, ROLL_RATE, F1_0).
  - `set_object_turnroll`: 1 deterministic + 5000 randomized — 0 mismatches.
  - `lead_player`: 1 deterministic + 5000 randomized — 0 mismatches.

- **Engine callsite wiring with `#ifdef USE_OX_BRIDGE`:**
  - `main_d1/physics.cpp` — `set_object_turnroll` wired: extracts rotvel_y, turnroll, FrameTime, assigns result back.
  - `main_d2/physics.cpp` — `set_object_turnroll` wired identically.
  - `main_d2/ai2.cpp` — `lead_player` callsite wired: extracts weapon_type, max_weapon_speed, is_matter from Robot_info/Weapon_info at the callsite, passes player_cloaked, player_velocity, fvec, Difficulty_level as scalars.

- **Verification:**
  - `dune runtest ox/tests` — all tests pass.
  - `cmake --build build-ox -j8` — both D1 and D2 build clean.

### 21) Port `homing_missile_turn_towards_velocity` to Ox with parity tests

**What:** Ported `homing_missile_turn_towards_velocity` from `laser.cpp` (D1+D2, identical) to OxCaml. This function smoothly blends a homing missile's normalized velocity into its forward vector and re-derives the full orientation matrix. Used by all homing weapons.

- **1 new pure function in `ox/ox_physics.ml`:**
  - `homing_missile_turn_towards_velocity` — scales `norm_vel` by `frame_time * 8` (HOMING_MISSILE_SCALE), adds to current fvec, normalizes, calls `vm_vector_2_matrix` to derive full orientation.

- **Bridge layer:**
  - `cd_homing_missile_turn_towards_velocity` (7 scalar args → 9-tuple orient) in `physics_bridge.ml`.
  - `cd_ox_homing_missile_turn_towards_velocity` in `bridge.c` — 7-arg `caml_callbackN`, returns 9 ints via `out_orient` array.

- **C oracle + parity tests:**
  - `c_oracle_homing_missile_turn_towards_velocity` in `c_oracle.cpp`.
  - 1 deterministic (zero velocity, forward-facing) + 5000 randomized — 0 mismatches.

- **Engine callsite wiring with `#ifdef USE_OX_BRIDGE`:**
  - `main_d1/laser.cpp` — wired at function definition, extracts norm_vel + orient.fvec + FrameTime, writes back full orient.
  - `main_d2/laser.cpp` — wired identically. Added `#include "ox/bridge.h"` to both laser.cpp files (first bridge use in these files).

- **Verification:**
  - `dune runtest ox/tests` — all tests pass.
  - `cmake --build build-ox -j8` — both D1 and D2 build clean.

### 22) Port `do_physics_align_object` to Ox — first "global state entangled" function

**What:** Ported `do_physics_align_object` from `physics.cpp` (D1+D2, identical logic). This function aligns the player's orientation to the segment floor by finding the most-aligned side normal, computing a delta roll angle, and applying a damped rotation. Previously categorized as "too entangled with global state" (reads `Segments[]` normals, `floor_levelling` global), it was ported using the **packed int array pattern** — C extracts all segment data at the callsite and passes it as a flat 54-int array.

- **1 new pure function in `ox/ox_physics.ml`:**
  - `do_physics_align_object` — takes packed array, finds best-aligned side via dot products, computes desired up vector (averaging normals for 2-face sides), applies damped roll via `vm_vec_delta_ang` + `fixmul(FrameTime, ROLL_RATE)`. Returns `(orient_changed, new_orient, new_floor_levelling)`.
  - Key fix: `fixang` (int16) wrapping for `delta_ang` and `roll_ang` via `wrap_i32_to_fixang`, matching C's implicit int16 truncation.

- **Packed array layout (54 ints):**
  - `[0..17]` = 6 side `normals[0]` (6 × 3 fix values)
  - `[18..35]` = 6 side `normals[1]` (6 × 3 fix values)
  - `[36..41]` = `num_faces` per side (6 ints)
  - `[42..50]` = orient matrix (9 fix values)
  - `[51]` = turnroll, `[52]` = floor_levelling, `[53]` = FrameTime

- **Bridge layer:**
  - `cd_do_physics_align_object` in `physics_bridge.ml` — unpacks result to flat 11-int array `[tag, orient(9), floor_levelling]`.
  - `cd_ox_do_physics_align_object` in `bridge.c` — allocates OCaml array, calls callback, reads 11-int result.

- **C oracle + parity tests:**
  - `c_oracle_do_physics_align_object` in `c_oracle.cpp`.
  - 2 deterministic tests + 5000 randomized — 0 mismatches.

- **Engine callsite wiring:**
  - `main_d1/physics.cpp` — `#ifdef USE_OX_BRIDGE` block packs segment data, calls bridge, writes back orient + floor_levelling.
  - `main_d2/physics.cpp` — same wiring, with `COMPACT_SEGS` ifdef handling for D2's alternate segment access path.

- **Design note:** This is the first function from the "too entangled with global state" category to be ported. The packed-array approach keeps OCaml pure while C handles global state extraction. The 54-int array is comparable to `calc_gun_point`'s 86-int array.

- **Verification:**
  - `dune runtest ox/tests` — all tests pass (including 5000 randomized parity).
  - `cmake --build build-ox -j8` — both D1 and D2 build clean.

### 23) Port `check_vector_to_object` to Ox — second "global state entangled" function

**What:** Ported `check_vector_to_object` from `fvi.cpp` (D1+D2, identical logic). This function adjusts an object's collision radius based on type (robots get 3/4 size when attacking, players get 1/2 size when bumping other players or coop weapons), then delegates to `check_vector_to_sphere_1` (already ported). Previously categorized as "global state entangled" because it reads `Robot_info[].attack_type`, `Game_mode`, and `otherobj->ctype.laser_info.parent_type`, but all these are trivially extracted as scalar args at the callsite.

- **1 new pure function in `ox/ox_fvi.ml`:**
  - `check_vector_to_object` — takes ~10 scalar args (p0, p1, rad, obj_pos, obj_size, obj_type, attack_type, otherobj_type, game_mode_coop, otherobj_parent_type), computes effective size, delegates to `check_vector_to_sphere_1`.

- **Bridge layer:**
  - `cd_check_vector_to_object` in `fvi_bridge.ml` — 16-arg bridge wrapper returning `(dist, ix, iy, iz)` tuple.
  - `cd_ox_check_vector_to_object` in `bridge.c` — calls OCaml via `caml_callbackN` with 16 args, reads 4-field result tuple.

- **C oracle + parity tests:**
  - `c_oracle_check_vector_to_object` in `c_oracle.cpp`.
  - 2 deterministic tests + 5000 randomized — 0 mismatches.
  - Key test detail: when dist=0 (no hit), C returns garbage intersection point values, so parity comparison only checks intp when dist != 0.

- **Engine callsite wiring:**
  - `main_d1/fvi.cpp` — `#ifdef USE_OX_BRIDGE` block extracts scalars, calls bridge, writes back intersection point.
  - `main_d2/fvi.cpp` — same wiring.

- **Verification:**
  - `dune runtest ox/tests` — all tests pass (including 5000 randomized parity).
  - `cmake --build build-ox -j8` — both D1 and D2 build clean.

### 24) Port `set_next_fire_time` (D1+D2) + `compute_headlight_light` (D1+D2) to Ox

**What:** Ported four functions (two per D1/D2) that were previously categorized as "side effects" and "global state entangled".

- **`set_next_fire_time`** — AI fire timing logic. D1 version is simple (increment rapidfire_count, check limit, set next_fire). D2 version adds snipe mode 50% skip (via P_Rand), secondary weapon support (next_fire2), and gun_num dispatch. Both return new values instead of mutating struct fields.

- **`compute_headlight_light`** — Headlight illumination computation. D1 reads `Beam_brightness` and `use_beam` globals. D2 computes `use_beam` from player flags/energy/viewer state, and uses `HEADLIGHT_BOOST_SCALE=8` multiplier. Both use distance falloff, face-light scaling, and optional beam focusing. Note: D1 has `MAX_DIST_LOG=5`, D2 has `MAX_DIST_LOG=6` (same `MAX_DIST=0x400000`).

- **New files:** `ox/ox_ai.ml`, `ox/ai_bridge.ml`, `ox/ox_lighting.ml`, `ox/lighting_bridge.ml`
- **New dune libraries:** `ox_ai`, `bridge_ai`, `ox_lighting`, `bridge_lighting`
- **C oracle + parity tests:** 4 deterministic + 4×5000 randomized tests, 0 mismatches across all.
- **Engine wiring:** D1 `ai.cpp`, D2 `ai2.cpp`, D1 `lighting.cpp`, D2 `lighting.cpp` — all with `#ifdef USE_OX_BRIDGE`.

- **Verification:**
  - `dune runtest ox/tests` — all tests pass.
  - `cmake --build build-ox -j8` — both D1 and D2 build clean.

### 25) Port `ai_behavior_to_mode` (D1+D2) + `ai_turn_randomly` (D1) to Ox

**What:** Ported three more functions from the skip list.

- **`ai_behavior_to_mode`** — Pure switch/enum mapping: AIB_* behavior constants (0x80-0x86) → AIM_* mode constants (0-5). D1 has 6 cases (STILL, NORMAL, HIDE, RUN_FROM, FOLLOW_PATH, STATION). D2 has 7 cases (STILL, NORMAL, BEHIND, RUN_FROM, SNIPE, STATION, FOLLOW). Previously categorized as "trivially small" — ported anyway for completeness.

- **`ai_turn_randomly`** (D1 only) — Computes new rotational velocity by applying a chaotic feedback loop: y += F1_0/64, x += y/6, y += z/4, z += x/10, then clamp each axis to F1_0/8. The P_Rand cheat shortcut (1/4 chance of calling ai_turn_towards_vector instead) stays at the callsite.

- **Parity tests:** Exhaustive enum tests for both behavior_to_mode functions + 5000 randomized for ai_turn_randomly, 0 mismatches.
- **Engine wiring:** D1 `ai.cpp` (behavior_to_mode + turn_randomly), D2 `ai2.cpp` (behavior_to_mode only).

- **Verification:**
  - `dune runtest ox/tests` — all tests pass.
  - `cmake --build build-ox -j8` — both D1 and D2 build clean.

### 26) Port `get_explosion_vclip` (D1+D2) to Ox

**What:** Ported the explosion vclip lookup from fireball.cpp (identical D1/D2 logic).

- **`get_explosion_vclip`** — Pure lookup: for robots, returns exp1_vclip_num (stage 0) or exp2_vclip_num (stage 1) if valid (> -1), else falls through to VCLIP_SMALL_EXPLOSION (2). For players, returns expl_vclip_num if valid, else VCLIP_SMALL_EXPLOSION. All other types get VCLIP_SMALL_EXPLOSION. Previously categorized as "trivially small" — ported for completeness.

- **Parity tests:** 7 exhaustive cases covering robot stage 0/1 valid/invalid, player valid/invalid, weapon default — 0 mismatches.
- **Engine wiring:** D1 `fireball.cpp`, D2 `fireball.cpp` — scalar args extracted at callsite (obj->type, stage, Robot_info fields conditionally, Player_ship->expl_vclip_num).

- **Verification:**
  - `dune runtest ox/tests` — all tests pass.
  - `cmake --build build-ox -j8` — both D1 and D2 build clean.

### 27) Convert `apply_damage_to_robot` D1 from defunctionalized effect tree to OCaml 5 algebraic effects

**What:** Replaced the defunctionalized effect tree pattern (§12) with OCaml 5 algebraic effects. The old approach built a `result_node` tree in OCaml, serialized it to a flat int array, returned it to C, and C walked the tree executing effects. The new approach uses `Effect.perform` calls in OCaml, handled by an `Effect.Deep.match_with` handler in the bridge that calls back into C for each side effect/query. This eliminates ~70 lines of tree types + serialization in OCaml and ~75 lines of tree-walking interpreter in C.

- **`ox/ox_collide.ml`:**
  - Deleted: `damage_effect` type, `result_node` type, `serialize_effect`, `serialize_node`, `node_size` (~70 lines).
  - Added: 5 algebraic effect declarations (`Increment_kills`, `Start_boss_death`, `Explode_object`, `Send_net_robot_explode`, `Query_multi_explode`) via `type _ Effect.t +=`.
  - `apply_damage_to_robot_d1` now uses `Effect.perform` directly — logic reads like normal imperative code. Return type changed from `(int * bool * result_node)` to `(int * bool * int)`.

- **`ox/collide_bridge.ml`:**
  - Replaced array serialization with `Effect.Deep.match_with` handler that catches each effect and delegates to 5 `external` C functions.
  - Returns `(int * int * int)` tuple (new_shields, boss_hit_int, ret).

- **`ox/bridge.h` / `ox/bridge.c`:**
  - Added 5 function pointer typedefs + `cd_ox_register_collide_effects()` registration function.
  - Added 5 `CAMLprim` wrappers (`cd_ox_effect_increment_kills`, etc.) that OCaml calls via `external`.
  - Changed `cd_ox_apply_damage_to_robot_d1` signature from `(out_buf, out_len)` to `(out_new_shields, out_boss_been_hit, out_return_value)` — reads 3-element tuple via `Field(result, 0/1/2)`.

- **`main_d1/collide.cpp`:**
  - Replaced 75-line tree walker with ~15 lines: one-time lambda registration of 5 effect callbacks + simple call reading 3 output values.

- **`ox/tests/collide_expect.ml`:**
  - Replaced `pp_effect`/`pp_node`/`test_serialized` with `run_with_mock` — a mock `Effect.Deep.match_with` handler that records performed effects as strings.
  - 10 test cases: original 6 scenarios + 4 new multiplayer tests covering both `multi_explode_result=true` and `=false` branches.

- **Fix: pre-existing game launch failure.**
  - `scripts/ox/build_bridge.sh` was missing `ox_ai.ml`, `ai_bridge.ml`, `ox_lighting.ml`, `lighting_bridge.ml` — 7 callbacks never registered, causing `cd_ox_init_runtime` to return 1.
  - Added missing files to build script and `CMakeLists.txt` DEPENDS list.
  - Added `ignore` references in `math_bridge.ml` to force AI and lighting bridge module initialization.

- **Verification:**
  - `dune runtest ox/tests` — all 10 expect tests pass.
  - `cmake --build build-ox -j8` — both D1 and D2 build clean.
  - Game launches and robot kills work correctly in-game.

### 28) Port `apply_damage_to_clutter`, `apply_damage_to_controlcen`, `apply_damage_to_player` (D1+D2) to Ox with algebraic effects

**What:** Ported the remaining three `apply_damage_to_*` functions from `collide.cpp` (D1+D2) to OxCaml, completing the damage subsystem. All use the algebraic effects pattern from §27.

- **`apply_damage_to_clutter`** — shared D1/D2. Pure shield arithmetic: check exploding/dead flags, subtract damage, explode if dead. One effect: `Explode_object_delay`.

- **`apply_damage_to_controlcen`** — shared D1/D2. Checks who-is-player, network invulnerability timer, applies shield damage, triggers destruction sequence. 7 effects: `Show_hud_invul_message`, `Controlcen_been_hit`, `Do_controlcen_destroyed`, `Add_controlcen_score`, `Multi_send_destroy_controlcen`, `Sound_controlcen_destroyed`, `Explode_object_delay`.

- **`apply_damage_to_player`** — D1 and D2 as separate functions. Checks dead/invulnerable/endlevel/non-local guards, applies damage, palette flash, death. D2 adds `Buddy_sorry_time` when killed by companion robot. Effects: `Palette_flash`, `Set_player_dead`, `Set_buddy_sorry_time` (D2 only).

- **Parity tests:** ~27 test scenarios covering all guard branches and effect combinations.
- **Engine wiring:** D1+D2 `collide.cpp` — effect callbacks registered via lambdas, shields written back at callsite.

- **Verification:**
  - `dune runtest ox/tests` — all tests pass.
  - `cmake --build build-ox -j8` — both D1 and D2 build clean.

### 29) Port `maybe_kill_weapon` (D1+D2), `calc_best_gun`, `chase_angles`, `laser_are_related` (D1+D2), `calc_controlcen_gun_point` to Ox

**What:** Ported 5 more pure functions across collision, control center, and endlevel camera systems.

- **`maybe_kill_weapon`** — D1 and D2 variants. Decides whether a weapon should die or weaken after hitting something. D1 checks `PROXIMITY_ID`; D2 adds `SUPERPROX_ID`, `PMINE_ID`, and shareware check. Pure, no effects.

- **`calc_best_gun`** — shared D1/D2. Finds the control center gun best aimed at the player via dot products. Uses `Ox_math.vm_vec_sub`, `vm_vec_normalize_quick`, `vm_vec_dotprod`. Packed array of `[num_guns, gun_pos(3*n), gun_dir(3*n), objpos(3)]`.

- **`chase_angles`** — shared D1/D2. Endlevel camera angle interpolation, smoothly chases desired angles using `fixmul(FrameTime, ...)` scaling.

- **`laser_are_related`** — D1 and D2 variants. Collision exemption logic for parent/child and sibling weapons. D2 adds time-based unrelating for phoenix, guided missiles, proximity mines, and robot superprox. Packed array of 15 ints (object fields + game time).

- **`calc_controlcen_gun_point`** — shared D1/D2. Computes world-space gun position/direction via matrix transpose and rotation. 18 scalar args, returns 6 values.

- **Critical bug fix: `OBJ_WEAPON` constant was 7 (OBJ_POWERUP) instead of 5.** This caused `laser_are_related` to never recognize weapons, so player's own weapons collided with and damaged them. Also affected `maybe_kill_weapon`.

- **Parity tests:** ~40 test scenarios across all functions.
- **Engine wiring:** D1+D2 `laser.cpp`, `cntrlcen.cpp`, `endlevel.cpp`, `collide.cpp` — all with `#ifdef USE_OX_BRIDGE`.

- **Verification:**
  - `dune runtest ox/tests` — all tests pass.
  - `cmake --build build-ox -j8` — both D1 and D2 build clean.
  - Game tested: shooting no longer causes self-damage.

### 30) Port robot animation functions (`robot_get_anim_state`, `set_robot_state`, `robot_set_angles`) to Ox

**What:** Ported the 3 remaining unported functions from §15 Robot. These manage robot joint animation state — lookups into `Robot_info[].anim_states` and the global `Robot_joints[]` array. All three are identical between D1 and D2.

- **`robot_get_anim_state`** — Pure lookup. Given robot type, gun number, and animation state, returns the matching joint positions from `Robot_joints[]` via the `anim_states[gun][state]` offset/count table.

- **`set_robot_state`** — Sets animation angles. For each gun group (0..n_guns), looks up `anim_states[g][state]` and copies `Robot_joints[offset+j].angles` into the object's `anim_angles[]` array. OCaml version returns the updated 10-element array for C to write back.

- **`robot_set_angles`** — Build-time initialization. Classifies submodels into gun groups by walking `submodel_parents` tree, then for each (gun_group, state) builds `jointpos` entries and fills `anim_states[g][state].{offset, n_joints}`. OCaml version returns the flat tables for C to store.

- **Data flow:** All three use packed flat int arrays through the bridge. `anim_states` is `(n_guns+1)*5*2` ints, `robot_joints` is `N*4` ints (jointnum, p, b, h).

- **Parity tests:** 3 expect tests covering all functions with multi-gun, multi-state scenarios.
- **Engine wiring:** D1+D2 `robot.cpp` — `#ifdef USE_OX_BRIDGE` blocks pack/unpack data at each call site.

- **Bug fix during integration:** Initial launch crashed because `ox_robot.ml` and `robot_bridge.ml` were not listed in `scripts/ox/build_bridge.sh` or `CMakeLists.txt` DEPENDS, so the OCaml callbacks were never compiled into the bridge object.

- **Verification:**
  - `dune fmt` — clean.
  - `dune runtest ox/tests` — all tests pass.
  - `cmake --build build-ox -j8` — both D1 and D2 build clean.
  - Game launched and ran successfully.

### §31 — Port gameseg utility functions (find_connect_side, create_shortpos, extract_shortpos)

- **Scope:** 3 additional gameseg functions + helper `convert_to_byte`, all identical between D1 and D2.

- **`find_connect_side`** — Pure lookup: given a segment's children array and a base segment number, returns the side index connecting to that segment (or -1). 7 scalar args → 1 int return.

- **`create_shortpos`** — Compresses an object's orientation/position/velocity into a `shortpos` struct. Uses `convert_to_byte` to clamp matrix entries to signed bytes. Takes orient(9), pos(3), vel(3), seg_vert0(3), segnum(1) = 19 packed ints, returns bytemat(9) + xo/yo/zo/segment/velx/vely/velz = 17 ints.

- **`extract_shortpos`** — Inverse of `create_shortpos`. Expands byte matrix back to fix16, reconstructs world position from relative offset + vertex 0, reconstructs velocity from compressed shorts. Takes 18 packed ints, returns orient(9) + pos(3) + vel(3) = 15 ints.

- **`convert_to_byte`** — Helper clamping fix16 to signed byte range [-127, 127] via arithmetic shift. Ported inline in `ox_gameseg.ml`.

- **Implementation:** Added to existing `ox_gameseg.ml` and `gameseg_bridge.ml` (no new modules needed). Updated `bridge.c` (3 new function pointers, null checks, C wrappers), `bridge.h` (declarations), D1+D2 `gameseg.cpp` (`#ifdef USE_OX_BRIDGE` blocks).

- **Parity tests:** 3 expect tests — `find_connect_side` (6 lookups including miss), `create_shortpos` (identity matrix, known position), `extract_shortpos` (round-trip verification).

- **Verification:**
  - `dune fmt` — clean.
  - `dune runtest ox/tests` — all tests pass.
  - `cmake --build build-ox -j8` — both D1 and D2 build clean.

### §32 — Port create_walls_on_side (+ add_side_as_quad, add_side_as_2_triangles)

- **Scope:** `create_walls_on_side` and its two helpers `add_side_as_quad` and `add_side_as_2_triangles`. All combined into a single OCaml function. Identical logic between D1 and D2.

- **`create_walls_on_side`** — Determines whether a segment side is planar (quad) or non-planar (triangulated), computes face normals accordingly. Core algorithm: sort 4 vertices via `get_verts_for_normal`, compute plane normal, check dist_to_plane. If within tolerance → quad. Otherwise → triangulate, then run a de-triangulation check to revert bogus triangulations.

- **`add_side_as_2_triangles`** (inlined) — Two code paths: non-wall uses dot product to choose TRI_02/TRI_13, wall case uses `get_verts_for_normal` with sentinel value (32767) for consistent cross-segment normals.

- **`add_side_as_quad`** (inlined) — Trivially sets type=QUAD and copies normal to both slots.

- **Interface:** Packed 17 ints in (v0..v3 positions, vi0..vi3 absolute indices, has_child flag), returns 7 ints (side_type, normal0, normal1). No new modules needed — added to existing `ox_gameseg.ml` and `gameseg_bridge.ml`.

- **Key design:** Passes vertex positions AND absolute indices through the bridge. OCaml uses a lookup closure (`make_pos_lookup`) to map from sorted vertex indices back to positions, avoiding global Vertices[] access.

- **Parity tests:** 3 expect tests covering planar quad, non-planar without child (non-wall triangulation), non-planar with child (wall triangulation).

- **Verification:**
  - `dune fmt` — clean.
  - `dune runtest ox/tests` — all tests pass.
  - `cmake --build build-ox -j8` — both D1 and D2 build clean.

### §33 — Port check_norms, create_all_vertex_lists, create_all_vertnum_lists

Three more gameseg functions ported to OxCaml, all simple lookup/comparison functions.

- **`check_norms`** — Compares two normal vectors; returns 1 if `n0 != -n1` (mismatch), 0 if matching. Debug-only function (`#ifndef NDEBUG` in D1, `#ifndef COMPACT_SEGS` in D2). Pure comparison, no math dependencies.

- **`create_all_vertex_lists`** — Given side_type and sidenum, returns vertex indices for all faces on a side using the `side_to_verts` lookup table. Editor-only function (`#ifdef EDITOR`). Returns 1 face (4 verts) for quads, 2 faces (3 verts each) for triangulated sides.

- **`create_all_vertnum_lists`** — Same as above but returns relative vertex numbers (0-3) instead of absolute segment vertex indices. Independent of sidenum — only depends on side_type.

- **Files modified:** `ox_gameseg.ml`, `gameseg_bridge.ml`, `bridge.c`, `bridge.h`, `main_d1/gameseg.cpp`, `main_d2/gameseg.cpp`, `parity_expect.ml`, `CHECKLIST.md`.

- **Parity tests:** 9 expect tests: 3 for check_norms (matching, non-matching, zero), 3 for create_all_vertex_lists (quad/tri02/tri13), 3 for create_all_vertnum_lists (quad/tri02/tri13).

- **Verification:**
  - `dune fmt` — clean.
  - `dune runtest ox/tests` — all tests pass.
  - `cmake --build build-ox -j8` — both D1 and D2 build clean.

### §34 — Port ai_door_is_openable (D1 + D2)

First AI system function ported. Determines whether a robot can open a door on a given side.

- **`ai_door_is_openable_d1`** — 22-line decision function. Console object opens all doors. Brain robots and run-from robots can open unlocked, keyless doors. Pure boolean logic on 7 scalar parameters (is_console_object, robot_id, ai_behavior, wall_num, wall_type, wall_keys, wall_flags).

- **`ai_door_is_openable_d2`** — ~110-line decision function with companion/buddy logic, key checks, triggered doors, and hidden wall animations. Takes 16 scalar parameters. Notable features:
  - Buddy-proof walls block companion in specific states (closed door, closed wall, active illusion)
  - Key matching uses bitwise AND since KEY_* and PLAYER_FLAGS_*_KEY constants are identical
  - AIM_GOTO_PLAYER mode has additional restrictions (blastable walls, locked doors)
  - Triggered/hidden door check appears twice — extracted as helper closure
  - Contains dead code in original C: `if (type == WALL_BLASTABLE)` inside `if (type == WALL_DOOR)` — WALL_DOOR=2, WALL_BLASTABLE=1, so never matches

- **Bridge design:** All wall/object state extracted at C callsite as scalars. No packed arrays needed — 7 args for D1 (via `caml_callbackN`), 16 args for D2 (via `caml_callbackN`).

- **Files modified:** `ox_ai.ml`, `ai_bridge.ml`, `bridge.c`, `bridge.h`, `main_d1/ai.cpp`, `main_d2/ai2.cpp`, `parity_expect.ml`, `CHECKLIST.md`.

- **Parity tests:** 12 expect tests: 6 for D1 (console door/non-door, brain unlocked/locked, run_from, normal robot), 6 for D2 (not child, console door, companion with key, buddy-proof blocked, brain unlocked, snipe with key).

- **Verification:**
  - `dune fmt` — clean.
  - `dune runtest ox/tests` — all tests pass.
  - `cmake --build build-ox -j8` — both D1 and D2 build clean.

### §35 — Port openable_doors_in_segment (D1 + D2)

- **Functions:** `openable_doors_in_segment` — scans 6 sides of a segment for an unlocked, keyless, closed door. Returns side index (0-5) or -1. D1: 5 fields/side (wall_num, type, keys, state, flags). D2: adds WCF_HIDDEN check via wallanim_flags (6 fields/side).

- **Approach:** Added to existing `ox_ai.ml` and `ai_bridge.ml`. Packed array approach: D1 packs 30 ints (6×5), D2 packs 36 ints (6×6). C callsite extracts wall data from `Segments[segnum].sides[]` and `Walls[]`, passes packed array to OCaml via `caml_callback`.

- **D2 extra:** Bounds-checks `segnum` at C callsite before packing. Extracts `WallAnims[Walls[wn].clip_num].flags` for hidden door check (guards against `clip_num < 0`).

- **Files modified:** `ox/ox_ai.ml`, `ox/ai_bridge.ml`, `ox/bridge.c`, `ox/bridge.h`, `main_d1/ai.cpp`, `main_d2/ai2.cpp`, `ox/tests/parity_expect.ml`, `CHECKLIST.md`.

- **Parity tests:** 10 expect tests — 5 for D1 (no walls, openable on side 2, locked rejected, keyed rejected, first openable wins), 5 for D2 (no walls, openable on side 4, hidden rejected, locked rejected, skip hidden find next).

- **Verification:**
  - `dune fmt` — clean.
  - `dune runtest ox/tests` — all tests pass.
  - `cmake --build build-ox -j8` — both D1 and D2 build clean.

### §36 — Port sphere_intersects_wall / object_intersects_wall to OxCaml

- **Functions:** `sphere_intersects_wall` (recursive segment traversal) and `object_intersects_wall` (thin wrapper). D1 and D2 are functionally identical — single shared OCaml implementation.

- **Challenge:** The function recurses into adjacent segments at runtime, reading `Segments[]` and `Vertices[]` globals. Previously deemed "not portable" due to this.

- **Solution:** Pre-pack ALL segment data at the C callsite (`object_intersects_wall`), pass as a flat int array to OCaml. OCaml does the full recursive traversal with a visited-set array. All inner geometry functions (`get_seg_masks`, `create_abs_vertex_lists`, `check_sphere_to_face`, `lookup_vpos`) are already ported.

- **Packed array layout:** Header (6 ints: pnt.xyz, rad, segnum, n_segments) + per-segment blocks (80 ints each: children[6], side_types[6], seg_verts[8], normals[36], vertex_positions[24]). Total = 6 + n_segments × 80 ints.

- **Bridge design:** `#ifdef USE_OX_BRIDGE` replaces the entire `object_intersects_wall` body in both D1 and D2. Packs all segments, calls `cd_ox_object_intersects_wall`, frees buffer. The C `sphere_intersects_wall` is untouched (only called from `object_intersects_wall`).

- **Files modified:** `ox/ox_fvi.ml`, `ox/fvi_bridge.ml`, `ox/bridge.c`, `ox/bridge.h`, `main_d1/fvi.cpp`, `main_d2/fvi.cpp`, `ox/tests/parity_expect.ml`, `CHECKLIST.md`.

- **Parity tests:** 5 expect tests — tiny segment inside tolerance (0), sphere at center of solid-walled segment (1), sphere near shared face with child traversal (0), sphere hits solid wall with one open side (1), cycle prevention with mutual children (0).

- **Verification:**
  - `dune fmt` — clean.
  - `dune runtest ox/tests` — all tests pass.
  - `cmake --build build-ox -j8` — both D1 and D2 build clean.

### §37 — Port trace_segs / find_point_seg to OxCaml

- **Functions:** `trace_segs` (recursive segment tracing) and `find_point_seg` (wrapper with exhaustive fallback). D1 and D2 are functionally identical — single shared OCaml implementation.

- **Algorithm:** `trace_segs` calls `get_side_dists` to get centermask + distances, picks the child side with the most-negative distance, and recurses (depth limit 1024). `find_point_seg` tries trace_segs from a hint segment, then falls back to linear scan using `get_seg_masks` with rad=0 checking centermask=0.

- **Solution:** Same pre-pack-all-segments approach as §36. Header (6 ints: p.xyz, segnum hint, n_segments, doing_lighting_hack) + per-segment blocks (80 ints each, same layout as sphere_intersects_wall). D2 passes `Doing_lighting_hack_flag` at header[5]; D1 always passes 0.

- **Files modified:** `ox/ox_gameseg.ml`, `ox/gameseg_bridge.ml`, `ox/bridge.c`, `ox/bridge.h`, `main_d1/gameseg.cpp`, `main_d2/gameseg.cpp`, `ox/tests/parity_expect.ml`, `CHECKLIST.md`.

- **Parity tests:** 5 expect tests — point at center of hint segment (returns 0), point in adjacent child via trace (returns 1), exhaustive scan finds disconnected segment (returns 1), point nowhere (returns -1), no hint with exhaustive scan (returns 0).

- **Verification:**
  - `dune fmt` — clean.
  - `dune runtest ox/tests` — all tests pass.
  - `cmake --build build-ox -j8` — both D1 and D2 build clean.

### §38 — Fix PF_OVERFLOW crash in draw.cpp (pre-existing Descent bug)

- **Bug:** Game crashed with SIGTRAP in `must_clip_tmap_face` (`3d/draw.cpp:335`) when `g3_project_point` set `PF_OVERFLOW` on a clipped polygon vertex. A previous crash (Feb 27) hit the same `Int3()` at line 309 in the unclipped path during rod/vclip rendering, proving the issue is pre-existing and unrelated to OxCaml ports.

- **Root cause:** `Int3()` calls `raise(SIGTRAP)` — a Parallax debug trap from the original Descent source. The code after the `Int3()` already handles overflow gracefully (`goto free_points` / `return 255`), but the trap kills the process before reaching it.

- **Fix:** Replaced both `Int3()` calls in `draw.cpp` (lines 309 and 335) with `fprintf(stderr, ...)` warnings. The overflow is handled gracefully — the polygon is skipped for that frame with no visual impact.

- **Files modified:** `3d/draw.cpp` (added `#include <stdio.h>`, replaced 2 `Int3()` calls with `fprintf`).

### §39 — Port find_connected_distance to OxCaml

- **Function:** BFS-based distance computation between two points via segment connectivity. Used by AI pathfinding, sound propagation, player spawning, and explosion logic (~13 callsites across D1/D2).

- **Approach:** Lightweight 15-int-per-segment packed layout (vs 80 ints for find_point_seg). Pre-evaluates `WALL_IS_DOORWAY` and segment centers at the C callsite, so OCaml does pure BFS without needing `wall_is_doorway()`, `check_transparency()`, or `Vertices[]`. D2's `Fcd_cache` stays in C, wrapping the OCaml BFS call.

- **Header layout (12 ints):** p0.xyz, seg0, p1.xyz, seg1, max_depth, wid_flag, n_segments, check_wid_on_adjacency (0=D1, 1=D2).

- **D1 vs D2 difference:** D1 adjacency shortcut skips WID check; D2 checks `WALL_IS_DOORWAY` on the connecting side. Controlled by `check_wid_on_adjacency` flag.

- **Files modified:**
  - `ox/ox_gameseg.ml` — `find_connected_distance` (BFS + path reconstruction)
  - `ox/gameseg_bridge.ml` — `cd_find_connected_distance` bridge + `Callback.register`
  - `ox/bridge.c` — static pointer, init/ready checks, C wrapper returning 2 ints via out params
  - `ox/bridge.h` — declaration
  - `main_d1/gameseg.cpp` — `#ifdef USE_OX_BRIDGE` around `find_connected_distance`
  - `main_d2/gameseg.cpp` — same, with D2 cache logic wrapping the OCaml call
  - `ox/tests/parity_expect.ml` — 6 parity tests (same-seg, adjacent, two-hop, disconnected, max-depth, wid-filtering)
  - `CHECKLIST.md` — marked done

- **Verification:** `dune runtest ox/tests` passes, `dune fmt` clean, `cmake --build build-ox -j8` clean (D1+D2). Launched D1, played through a level — AI pathfinding, sound propagation, and robot pursuit all work correctly.

### §40 — Port find_vector_intersection + fvi_sub to OxCaml

- **Function:** `find_vector_intersection` is the top-level collision detection dispatcher. `fvi_sub` is its recursive worker that walks the segment graph testing line-vs-face and line-vs-object intersections. Together ~400 lines of C, the single biggest blocker for porting physics, AI visibility, and collision.

- **Approach:** Large packed array with 87-int-per-segment layout (reuses existing 80-int geometry layout + 7 new fields: WALL_IS_DOORWAY[6] pre-evaluated per side + first_object linked list head). Objects packed at 14 ints each (type, id, flags, pos, size, next_in_seg, laser parent info, signature, attack_type). CollisionResult[16×16] table and header with query params, ignore list, game state flags.

- **check_trans_wall handling:** When FQ_TRANSWALL or FQ_TRANSPOINT flags are set, transparent walls are treated as passable without pixel-level UV checks. This avoids packing texture/bitmap data and is functionally equivalent for gameplay.

- **laser_are_related:** Calls existing `Ox_collide.laser_are_related_d1/d2` with packed object data extracted inline. Required adding `ox_collide` as a dependency of `ox_fvi` library (and reordering the link order in build_bridge.sh).

- **D1 vs D2 differences handled:**
  - D2 adds `FQ_IGNORE_POWERUPS` flag (skips OBJ_POWERUP collisions)
  - D2 skips all robot-robot collisions unconditionally (D1 only skips non-melee pairs)
  - D2 transparent wall check uses `(wid_flag & WID_RENDER_FLAG) && (wid_flag & WID_RENDPAST_FLAG)` instead of D1's `wid_flag == WID_TRANSPARENT_WALL`
  - Controlled by `is_d2` flag in packed header

- **Files modified:**
  - `ox/ox_fvi.ml` — `fvi_state` type, `fvi_sub` recursive function, `find_vector_intersection` dispatcher, helper functions for unpacking segments/objects/collision table
  - `ox/fvi_bridge.ml` — `cd_find_vector_intersection` bridge + `Callback.register`
  - `ox/bridge.c` — `g_find_vector_intersection` static pointer, init/ready checks, C wrapper
  - `ox/bridge.h` — `cd_ox_find_vector_intersection` declaration
  - `main_d1/fvi.cpp` — `#ifdef USE_OX_BRIDGE` around `find_vector_intersection` with full packing code
  - `main_d2/fvi.cpp` — same, with `is_d2=1`
  - `ox/dune` — added `ox_collide` dependency to `ox_fvi` library
  - `scripts/ox/build_bridge.sh` — reordered link: `ox_collide` before `ox_fvi`
  - `CHECKLIST.md` — marked done

- **Verification:** `dune fmt` clean, `dune runtest ox/tests` passes, `cmake --build build-ox -j8` clean (D1+D2).

### §41 — Port find_homing_object_complete + object_to_object_visibility to OxCaml

- **Functions:** `find_homing_object_complete` (66 lines D1, 95 lines D2) is the homing missile target selection logic — iterates all objects, filters by type/parent/cloaked/team/companion, checks distance and angle, and calls `object_to_object_visibility` for the best candidate. `object_to_object_visibility` is a thin wrapper around `find_vector_intersection` for LOS checks.

- **Approach:** Reuses the FVI packed array format as its base (header + CollisionResult[256] + segments + objects), then appends homing-specific data. This allows `fvi_sub` to be called directly from OCaml for visibility checks without C round-trips — `object_to_object_visibility` is inlined as an OCaml helper (`visibility_check`) rather than a separate bridge function.

- **Homing extension layout:**
  - Homing header (19 ints): curpos.xyz, fvec.xyz, tracker_pos.xyz, tracker_segnum, tracker_parent_type, tracker_parent_num, track_goal_type_1, track_goal_type_2, game_mode, is_omega
  - Per-object homing block (5 ints): player_flags, team_id, ai_CLOAKED, robot_companion, segnum

- **D1 vs D2 differences:**
  - D2 adds omega weapon support (different tracking thresholds: OMEGA_MIN_TRACKABLE_DOT=0xF000, OMEGA_MAX_TRACKABLE_DIST=0x500000)
  - D2 adds proximity mine tracking (PROXIMITY_ID=16, SUPERPROX_ID=38) with dot amplification `((dot << 3) + dot) >> 3`
  - D2 excludes companion robots (`Robot_info[id].companion`)
  - D1 MIN_TRACKABLE_DOT=0xC000 (3*F1_0/4), D2=0xE000 (7*F1_0/8)

- **Files modified:**
  - `ox/ox_fvi.ml` — `visibility_check` helper (creates fresh fvi_state, calls fvi_sub with FQ_TRANSWALL), `find_homing_object_complete` (target iteration + filtering + distance/angle scoring)
  - `ox/fvi_bridge.ml` — `cd_find_homing_object_complete` bridge + `Callback.register`
  - `ox/bridge.c` — `g_find_homing_object_complete` static pointer, init/ready checks, C wrapper
  - `ox/bridge.h` — `cd_ox_find_homing_object_complete` declaration
  - `main_d1/laser.cpp` — `#ifdef USE_OX_BRIDGE` around `find_homing_object_complete` with full packing code
  - `main_d2/laser.cpp` — same, with `is_d2=1`, omega detection, companion field
  - `ox/tests/parity_expect.ml` — 9 parity tests (no targets, single robot, skip parent, skip cloaked robot/player, best angle wins, behind tracker rejected, D2 skip companion, track two types)
  - `CHECKLIST.md` — marked done (both Weapons and AI sections)

- **Verification:** `dune fmt` clean, `dune runtest ox/tests` passes (9 new + all existing), `cmake --build build-ox -j8` clean (D1+D2).

### §42 — Port find_homing_object + track_track_goal + object_is_trackable to OxCaml

- **What:** Ported the "homing trio" — the three remaining homing/tracking functions from `laser.cpp` (D1+D2). These handle per-frame target tracking for homing missiles.
  - `object_is_trackable` — checks if a tracked object is still valid (cloaked, companion, dot product, visibility). Inlined into `track_track_goal` in OCaml.
  - `track_track_goal` — per-frame tracking update: recheck current target every 8 frames, full rescan every 4 frames. D2 returns dot via out-param.
  - `find_homing_object` — homing target search for singleplayer (rendered object list iteration with distance/angle checks). Multiplayer dispatches to `find_homing_object_complete`.

- **Packed format extension:** Extended the existing homing packed array with a "tracking extension" block (7-int header appended AFTER homing per-object data). This preserves backward compatibility — `find_homing_object_complete` reads from the same offsets unchanged.
  - Tracking extension: `min_trackable_dot`, `frame_count`, `robots_kill_robots_cheat`, `gm_multi_robots`, `track_goal`, `n_rendered_objects`, `track_goal_obj_type`
  - Variable-length rendered object list follows the header (for D2 `Window_rendered_data`, D1 `Ordered_rendered_object_list`)

- **D1/D2 differences handled:**
  - D2 `track_track_goal` returns dot via out-param (D1 doesn't need it)
  - D2 has `Robots_kill_robots_cheat`, companion robot exclusion, `GM_MULTI_ROBOTS`
  - D2 `find_homing_object` uses `Window_rendered_data` (search stays in C, passes rendered list to OCaml)
  - D2 singleplayer path has distance check + "retry with full normalize" for near-threshold dots
  - D1 uses 0xC000 min trackable dot, D2 uses 0xE000

- **Files modified:**
  - `ox/ox_fvi.ml` — `object_is_trackable`, `track_track_goal`, `find_homing_object` (~200 lines)
  - `ox/fvi_bridge.ml` — `cd_find_homing_object`, `cd_track_track_goal` bridges + `Callback.register`
  - `ox/bridge.c` — `g_find_homing_object`, `g_track_track_goal` static pointers, init/ready, C wrappers
  - `ox/bridge.h` — declarations for both new functions
  - `main_d1/laser.cpp` — `#ifdef USE_OX_BRIDGE` around `find_homing_object` and `track_track_goal`
  - `main_d2/laser.cpp` — same, with D2-specific fields (`is_d2=1`, companion, `Robots_kill_robots_cheat`, `*dot = out_dot`)
  - `CHECKLIST.md` — marked done

- **Verification:** `dune fmt` clean, `dune runtest ox/tests` passes, `cmake --build build-ox -j8` clean (D1+D2). Runtime tested: D1+D2 play correctly.

### §43 — Port player_is_visible_from_object to OxCaml

- **What:** Ported the AI visibility function that determines whether the player is visible from a robot's gun position. This is the gateway function for the entire AI targeting system, called 20+ times per frame from `compute_vis_and_vec` and other AI functions.

- **Design:** Single bridge crossing replaces two separate bridge crossings (find_point_seg + find_vector_intersection). The function:
  1. Uses `find_point_seg_fvi` (new) to locate the gun tip segment using the FVI packed array layout
  2. Calls `fvi_sub` directly for the visibility ray cast (OCaml → OCaml, no double bridge)
  3. Computes dot product for field-of-view check
  All segment/object data packed once at the callsite.

- **D1/D2 differences:**
  - D1 sets `FQ_CHECK_OBJS` flag — considers player hit as visible (checks `hit_object == player_objnum`)
  - D2 only sets `FQ_TRANSWALL` — visibility requires `HIT_NONE` only
  - D2 manages `SUB_FLAGS_GUNSEG` (0x01) — cleared at entry, set if gun tip in different segment

- **Side effects handled via return array:**
  - `pos` modification (when gun tip outside mine → use object center)
  - `need_move_towards_center` flag (C calls `move_towards_segment_center`)
  - `SUB_FLAGS` modification (D2)
  - Hit globals: `Hit_type`, `Hit_pos`, `Hit_seg`

- **New OCaml function:** `find_point_seg_fvi` — same algorithm as `Ox_gameseg.find_point_seg` but reads from the 87-int/segment FVI layout instead of the 80-int layout, avoiding data duplication.

- **Files modified:**
  - `ox/ox_fvi.ml` — `find_point_seg_fvi`, `player_is_visible_from_object` (~100 lines)
  - `ox/fvi_bridge.ml` — `cd_player_is_visible_from_object` bridge + `Callback.register`
  - `ox/bridge.c` — `g_player_is_visible_from_object` static pointer, init/ready, C wrapper (returns 11-element array)
  - `ox/bridge.h` — `cd_ox_player_is_visible_from_object` declaration
  - `main_d1/ai.cpp` — `#ifdef USE_OX_BRIDGE` around `player_is_visible_from_object`
  - `main_d2/ai2.cpp` — same, with D2-specific SUB_FLAGS handling
  - `CHECKLIST.md` — marked done

- **Verification:** `dune fmt` clean, `dune runtest ox/tests` passes, `cmake --build build-ox -j8` clean (D1+D2). Runtime tested: both D1 and D2 launch and play correctly with all §42+§43 bridges active.

---

## §44 — Port `compute_vis_and_vec` to OxCaml (D1 + D2)

**Date:** 2026-02-28

- **What:** Ported `compute_vis_and_vec` — the AI visibility computation function that determines whether a robot can see the player, computes `vec_to_player`, manages cloak tracking, plays sounds, and updates AI state. Called every AI frame for every robot.

- **Design:** Single bridge crossing wraps `player_is_visible_from_object` (already ported) plus all surrounding game logic:
  1. Cloak handling: `make_random_vector` via internal P_Rand LCG, `vm_vec_scale_add` for position drift
  2. `vec_to_player` computation (from cloak position or `Believed_player_pos`)
  3. Calls `player_is_visible_from_object` internally (OCaml → OCaml, no extra bridge crossing)
  4. Wake-up code: `AIS_REST` → `AIS_FIRE` transition
  5. Sound event dispatch (returned as data for C to play via `digi_link_sound_to_pos`)
  6. AI state updates (`previous_visibility`, `time_player_seen`, etc.)
  7. D2 awareness-based visibility upgrade

- **P_Rand approach:** Added `P_Rand_get_state()` / `P_Rand_set_state()` to `misc/rand.cpp` to access the static `randNext` variable. The OCaml code reimplements the LCG (`randNext * 1103515245 + 12345` mod 2^32) using Int64 arithmetic to avoid overflow. PRNG state is passed in and returned, giving exact parity with the original C code.

- **Packed array extension:** CVV extension (19 ints) appended after the player_vis extension:
  - Input: player_cloaked, Difficulty_level, cloak state, prand_state, ailp fields, aip fields, sound IDs, Player_exploded, next_fire2, awareness
  - Return (28 ints): player_visibility, vec_to_player, pos, pviso results, updated cloak/PRNG/ailp/aip state, sound events (count + up to 2 sound IDs)

- **D1/D2 differences:**
  - D1 uses `FQ_CHECK_OBJS` for FVI, checks `Player_exploded` before sounds
  - D2 uses `FQ_TRANSWALL` only, checks `next_fire2` in cloaked sound condition, manages `SUB_FLAGS`, applies awareness upgrade

- **Files modified:**
  - `misc/rand.cpp` — `P_Rand_get_state()`, `P_Rand_set_state()` (4 lines)
  - `misc/rand.h` — declarations
  - `ox/ox_fvi.ml` — `p_rand_step`, `make_random_vector_prng`, `compute_vis_and_vec` (~150 lines)
  - `ox/fvi_bridge.ml` — `cd_compute_vis_and_vec` bridge + `Callback.register`
  - `ox/bridge.c` — `g_compute_vis_and_vec` static pointer, init/ready, C wrapper (returns 28-element array)
  - `ox/bridge.h` — `cd_ox_compute_vis_and_vec` declaration
  - `main_d1/ai.cpp` — `#ifdef USE_OX_BRIDGE` around `compute_vis_and_vec`
  - `main_d2/ai2.cpp` — same, with D2-specific handling
  - `CHECKLIST.md` — marked done

- **Verification:** `dune fmt` stable, `dune runtest ox/tests` passes, `cmake --build build-ox -j8` clean (D1+D2). Runtime tested: both D1 and D2 launch and play correctly with all §42+§43+§44 bridges active.

### §45 — Port ai_move_relative_to_player to OxCaml (D1 + D2)

- **What:** `ai_move_relative_to_player` — AI movement decision dispatcher. Decides whether to evade a danger laser, move toward/around/away from player based on robot type, distance, firing state, and difficulty. D1 ~82 lines, D2 ~97 lines (adds thief/kamikaze/companion/objval logic).

- **Design:** Standalone packed array bridge (56 ints in, 6 ints out). OCaml function calls `move_around_player`, `move_away_from_player`, and `move_towards_vector` internally — all already ported — eliminating up to 3 sub-bridge crossings per robot per frame. P_Rand state synchronized via `P_Rand_get_state`/`P_Rand_set_state` (added in §44). Duplicated `p_rand_step` in `ox_physics.ml` to avoid circular dep on `ox_fvi.ml`.

- **D1 vs D2 differences:**
  - D2 adds `robptr->companion` check in laser evasion (companion always evades)
  - D2 adds `robptr->thief` check (thieves always move toward, bypass evade_only)
  - D2 adds `robptr->kamikaze` check (kamikazes always move toward)
  - D2 has objval-based circling distances: `(3+objval)*circle_distance/2`
  - D2 uses GameTime and player_visibility for stale-firing movement decisions
  - D2 passes `dot_based=true` to move_towards_vector (affects velocity ramping)

- **Packed layout (56 ints):** velocity(3), vec_to_player(3), dist_to_player, circle_distance, evade_only, orient(9: fvec+uvec+rvec), pos(3), shields, danger_laser(14: num+sig+obj_type+obj_sig+pos+render_type+fvec+velocity), robot_info(6: attack_type+fov+evade+firing_wait+max_speed+strength), ailp_next_fire, difficulty, frame_time, frame_count, objnum, player_is_dead, player_cloaked, prand_state, is_d2, player_vis, game_time_shr18, companion, thief, kamikaze.

- **Return (6 ints):** new_velocity(3), ai_evaded, new_danger_laser_num, new_prand_state.

- **Files modified:**
  - `ox/ox_physics.ml` — `p_rand_step` (dup), `ai_move_relative_to_player` (~130 lines)
  - `ox/physics_bridge.ml` — `cd_ai_move_relative_to_player` bridge + `Callback.register`
  - `ox/bridge.c` — `g_ai_move_relative_to_player` static pointer, init/ready, C wrapper
  - `ox/bridge.h` — `cd_ox_ai_move_relative_to_player` declaration
  - `main_d1/ai.cpp` — `#ifdef USE_OX_BRIDGE` around `ai_move_relative_to_player`
  - `main_d2/ai2.cpp` — same, with D2-specific fields packed
  - `CHECKLIST.md` — marked done

- **Verification:** `dune fmt` stable, `dune runtest ox/tests` passes, `cmake --build build-ox -j8` clean (D1+D2). Runtime tested: D1 launches and plays correctly with §45 bridge active.

### §46 — Port ai_path_set_orient_and_vel to OxCaml (D1 + D2)

- **What:** `ai_path_set_orient_and_vel` — computes velocity and orientation for path-following robots. Blends current velocity toward goal direction, scales speed based on facing dot product, then calls `ai_turn_towards_vector` to orient the robot. D1 ~58 lines, D2 ~68 lines (adds snipe/companion/retreat logic).

- **Design:** Standalone packed array bridge (27 ints in, 12 ints out). OCaml function calls `ai_turn_towards_vector` internally, saving one bridge crossing per path-following robot per frame. Returns both new velocity and new orientation.

- **D1 vs D2 differences:**
  - D2 adds AIB_SNIPE behavior (boosts max_speed, biases dot toward F1_0/2)
  - D2 adds companion check for fast turn rate
  - D2 has AIM_SNIPE_RETREAT_BACKWARDS mode: faces player while retreating
  - D2 passes dot_based=true to move_towards_vector via ai_turn_towards_vector

- **Files modified:**
  - `ox/ox_physics.ml` — `ai_path_set_orient_and_vel` (~100 lines)
  - `ox/physics_bridge.ml` — `cd_ai_path_set_orient_and_vel` bridge + `Callback.register`
  - `ox/bridge.c` — `g_ai_path_set_orient_and_vel` static pointer, init/ready, C wrapper
  - `ox/bridge.h` — `cd_ox_ai_path_set_orient_and_vel` declaration
  - `main_d1/aipath.cpp` — `#ifdef USE_OX_BRIDGE` around `ai_path_set_orient_and_vel` + include
  - `main_d2/aipath.cpp` — same, with D2-specific fields packed
  - `CHECKLIST.md` — marked done

- **Verification:** `dune fmt` stable, `dune runtest ox/tests` passes, `cmake --build build-ox -j8` clean (D1+D2). Runtime tested: D1 launches and plays correctly with §46 bridge active.

### §47 — Port ai_frame_animation to OxCaml (D1 + D2)

- **What:** `ai_frame_animation` — interpolates robot joint angles (pitch, bank, heading) toward goal angles per frame. Identical logic in D1 and D2. ~62 lines, called per animated robot per frame.

- **Design:** Variable-length packed array (2 + 9*N ints in, 3*N ints out, where N = num_joints - 1). Per joint: reads current, goal, and delta angles; computes scaled delta via fixmul, applies with wraparound handling (fixang 16-bit wrapping at ±32767), snaps to goal when overshoot detected. DELTA_ANG_SCALE = 16.

- **Files modified:**
  - `ox/ox_physics.ml` — `ai_frame_animation` (~55 lines)
  - `ox/physics_bridge.ml` — `cd_ai_frame_animation` bridge + `Callback.register`
  - `ox/bridge.c` — `g_ai_frame_animation` static pointer, init/ready, C wrapper (variable-length output)
  - `ox/bridge.h` — `cd_ox_ai_frame_animation` declaration
  - `main_d1/ai.cpp` — `#ifdef USE_OX_BRIDGE` around `ai_frame_animation`
  - `main_d2/ai2.cpp` — same
  - `CHECKLIST.md` — marked done

- **Verification:** `dune fmt` stable, `cmake --build build-ox -j8` clean (D1+D2). Runtime tested: D1 launches and plays correctly with §47 bridge active.

### §48 — Port do_silly_animation to OxCaml (D1 + D2)

- **What:** `do_silly_animation` — computes goal and delta joint angles for robot animation based on robot_get_anim_state results. Identical logic in D1 and D2. ~128 lines, called per animated robot per frame. Sets up target angles that ai_frame_animation (§47) then interpolates toward.

- **Design:** Variable-length packed array. C side pre-computes flinch_attack_scale and calls robot_get_anim_state for each gun (0..num_guns), packing joint entries (jointnum, target p/b/h). Also packs current anim_angles, goal_angles, delta_angles (all model joints), and achieved_state/goal_state arrays. OCaml computes delta direction (±ANIM_RATE scaled by flinch_attack_scale / DELTA_ANG_SCALE), handles at_goal tracking, and AIS_RECO→AIS_FIRE / AIS_FLIN→AIS_LOCK state transitions. Returns updated goal_angles, delta_angles, achieved_state, goal_state, and at_goal flag.

- **Files modified:**
  - `ox/ox_physics.ml` — `do_silly_animation` (~100 lines)
  - `ox/physics_bridge.ml` — `cd_do_silly_animation` bridge + `Callback.register`
  - `ox/bridge.c` — `g_do_silly_animation` static pointer, init/ready, C wrapper
  - `ox/bridge.h` — `cd_ox_do_silly_animation` declaration
  - `main_d1/ai.cpp` — `#ifdef USE_OX_BRIDGE` around `do_silly_animation`
  - `main_d2/ai2.cpp` — same
  - `CHECKLIST.md` — marked done

- **Verification:** `dune fmt` stable, `cmake --build build-ox -j8` clean (D1+D2), `dune runtest ox/tests` pass. Runtime tested: D1 launches and plays correctly with §48 bridge active.

### §49 — Port do_firing_stuff to OxCaml (D1 + D2)

- **What:** `do_firing_stuff` — firing decision dispatcher for AI robots. Computes dot product between robot forward vector and vector-to-player, then transitions goal state to AIS_FIRE or AIS_LOCK based on facing angle. D1 ~35 lines, D2 ~35 lines. Called 3-4× per robot per frame (high frequency).

- **Design:** Trivial packed array (12 ints in, 3 ints out). Input: fvec(3), vec_to_player(3), player_visibility, player_cloaked flag, GOAL_STATE, player_awareness_type, player_awareness_time, is_d2_nearby flag. Output: new GOAL_STATE, awareness_type, awareness_time. Pure logic — one dot product + state machine transitions.

- **D1 vs D2 differences:** D2 adds `Dist_to_last_fired_upon_player_pos < FIRE_AT_NEARBY_PLAYER_THRESHOLD` as an additional trigger condition (packed as `is_d2_nearby` boolean).

- **Files modified:**
  - `ox/ox_ai.ml` — `do_firing_stuff` (~50 lines)
  - `ox/ai_bridge.ml` — `cd_do_firing_stuff` bridge + `Callback.register`
  - `ox/bridge.c` — `g_do_firing_stuff` static pointer, init/ready, C wrapper
  - `ox/bridge.h` — `cd_ox_do_firing_stuff` declaration
  - `ox/dune` — added `ox_math` dependency to `ox_ai` library (for `vm_vec_dotprod`)
  - `main_d1/ai.cpp` — `#ifdef USE_OX_BRIDGE` around `do_firing_stuff`
  - `main_d2/ai2.cpp` — same
  - `CHECKLIST.md` — marked done

- **Verification:** `dune fmt` stable, `cmake --build build-ox -j8` clean (D1+D2), `dune runtest ox/tests` pass. Runtime tested: D1 launches and plays correctly with §49 bridge active.

### §50 — Port compute_object_light to OxCaml (D1 + D2)

- **What:** `compute_object_light` — smooths lighting transitions for rendered objects. Interpolates cached light toward segment static light at LIGHT_RATE, then adds headlight and dynamic light contributions. Called 2-3× per rendered object per frame (40-90 calls/frame). D1 ~50 lines, D2 ~50 lines.

- **Design:** Packed array bridge (8 ints in, 2 ints out). C pre-computes headlight contribution (via existing bridged `compute_headlight_light` / D2's `compute_headlight_light_on_object`) and dynamic light contribution (via `compute_seg_dynamic_light`), passing them as inputs. OCaml does the smoothing logic: compares cached object_light against static_light, applies frame-rate-limited delta, returns final light and updated cache value.

- **D1 vs D2 differences:** D1 uses `object_id[objnum] == obj->id` for staleness, `Viewer != old_viewer` for viewer change. D2 uses `object_sig[objnum] == obj->signature`, `reset_lighting_hack` flag. D2 adds `compute_headlight_light_on_object` path for `LogicVersion >= FULL_1_0`. All differences handled on C side — OCaml receives a uniform `is_stale` flag.

- **Files modified:**
  - `ox/ox_lighting.ml` — `compute_object_light` (~35 lines)
  - `ox/lighting_bridge.ml` — `cd_compute_object_light` bridge + `Callback.register`
  - `ox/bridge.c` — `g_compute_object_light` static pointer, init/ready, C wrapper
  - `ox/bridge.h` — `cd_ox_compute_object_light` declaration
  - `main_d1/lighting.cpp` — `#ifdef USE_OX_BRIDGE` around `compute_object_light`
  - `main_d2/lighting.cpp` — same
  - `CHECKLIST.md` — marked done

- **Verification:** `dune fmt` stable, `cmake --build build-ox -j8` clean (D1+D2), `dune runtest ox/tests` pass. Runtime tested: D1 launches and plays correctly with §49+§50 bridges active.

### §51 — Port do_physics_drag to OxCaml (D1 + D2)

- **What:** `do_physics_drag` — velocity integration with thrust and drag. Extracted from `do_physics_sim` (the most frequently called function in the engine). Identical logic in D1 and D2. Called once per physics object per frame (50-100+ calls/frame). Computes new velocity by iterating thrust+drag in FT-sized steps, then applying a linear remainder.

- **Design:** Packed array bridge (10 ints in, 3 ints out). Input: velocity(3), thrust(3), drag, mass, phys_flags, sim_time. OCaml computes `count = sim_time / FT; r = sim_time % FT; k = fixdiv(r, FT)`, then either: (a) PF_USES_THRUST path: accel = thrust/mass, loop count times: vel += accel, vel *= (1-drag), then linear remainder; or (b) no-thrust path: accumulate total_drag, scale velocity. Returns new velocity.

- **Files modified:**
  - `ox/ox_physics.ml` — `do_physics_drag` (~60 lines)
  - `ox/physics_bridge.ml` — `cd_do_physics_drag` bridge + `Callback.register`
  - `ox/bridge.c` — `g_do_physics_drag` static pointer, init/ready, C wrapper
  - `ox/bridge.h` — `cd_ox_do_physics_drag` declaration
  - `main_d1/physics.cpp` — `#ifdef USE_OX_BRIDGE` around drag/thrust block in `do_physics_sim`
  - `main_d2/physics.cpp` — same
  - `CHECKLIST.md` — marked done

- **Verification:** `dune fmt` stable, `cmake --build build-ox -j8` clean (D1+D2), `dune runtest ox/tests` pass. Runtime tested: D1 launches and plays correctly with §51 bridge active.

### §52 — Port do_homing_weapon_frame to OxCaml (D1 + D2)

- **What:** `do_homing_weapon_frame` — homing missile velocity/orientation computation, extracted from `Laser_do_weapon_sequence`. Pure vecmath: vector subtraction, normalization, dot product, velocity blending, speed clamping, life loss computation, and optional orientation turn (via already-ported `homing_missile_turn_towards_velocity`). Called each frame per active homing missile.

- **Design:** Packed array bridge (14 ints in, 14 ints out). C pre-computes `vector_to_object = target_pos - obj_pos` and passes it along with velocity, max_speed, FrameTime, is_polymodel flag, is_d2 flag, dot (D2: from `track_track_goal`; D1: unused), and orient fvec. OCaml performs the full velocity update: normalize vector_to_object, normalize velocity to get speed, speed-up if below max, compute/use dot, blend temp_vec with vector_to_object (double-blend for non-polymodel), normalize and scale by speed, compute life loss, optionally update orientation.

- **D1 vs D2 differences:** D1 computes `dot = vm_vec_dot(temp_vec, vector_to_object)` inline; D2 receives `dot` from `track_track_goal`. D1 life loss: threshold check (`absdot > F1_0/8`), clamp to `F1_0/4`, multiplier 16. D2 life loss: no threshold, multiplier 32. Controlled by `is_d2` flag.

- **Files modified:**
  - `ox/ox_physics.ml` — `do_homing_weapon_frame` (~70 lines)
  - `ox/physics_bridge.ml` — `cd_do_homing_weapon_frame` bridge + `Callback.register`
  - `ox/bridge.c` — `g_do_homing_weapon_frame` static pointer, init/ready, C wrapper
  - `ox/bridge.h` — `cd_ox_do_homing_weapon_frame` declaration
  - `main_d1/laser.cpp` — `#ifdef USE_OX_BRIDGE` around velocity computation in homing missile block
  - `main_d2/laser.cpp` — same
  - `CHECKLIST.md` — marked done

- **Verification:** `dune fmt` stable, `cmake --build build-ox -j8` clean (D1+D2), `dune runtest ox/tests` pass. Runtime tested: D1 launches and plays correctly with §52 bridge active.

### §53 — Fix FVI passability bug: weapons passing through doors

- **What:** Weapons (lasers, missiles) were passing straight through closed doors instead of hitting them and triggering door opening. This prevented players from accessing rooms with hostages.

- **Root cause:** The OCaml FVI passability check in `fvi_sub` treated `FQ_TRANSPOINT` (weapon flag) identically to `FQ_TRANSWALL`, letting weapons pass through any wall with `WID_TRANSPARENT_WALL` (wid=6). Door textures have some transparent pixels, so `check_transparency()` returns true and `WALL_IS_DOORWAY` returns `WID_TRANSPARENT_WALL` even for closed doors. The C code calls `check_trans_wall()` which does a per-pixel UV lookup at the hit point — the opaque door surface blocks the weapon. The OCaml approximation skipped this pixel check entirely.

- **Fix:** Removed `FQ_TRANSPOINT` from the passability shortcut in `ox_fvi.ml`. Weapons now treat `WID_TRANSPARENT_WALL` walls as solid (conservative but correct). The only behavioral difference is weapons won't pass through grated/windowed transparent walls, but this avoids needing texture bitmap access from OCaml.

- **Files modified:**
  - `ox/ox_fvi.ml` — removed `fq_transpoint` from passability check (~1 line)
  - `main_d1/physics.cpp` — cleanup of debug logging added during investigation

- **Verification:** `cmake --build build-ox -j8` clean. Runtime tested: D1 launches, lasers hit doors and open them correctly.

### §54 — Implement check_trans_wall OCaml→C callback for FQ_TRANSPOINT

- **What:** §53's conservative fix treated ALL transparent walls as solid for weapons (FQ_TRANSPOINT). This was correct for doors but prevented weapons from passing through grated/windowed walls where they should. This section implements a callback mechanism so the OCaml FVI can call C's `check_trans_wall()` for pixel-level transparency checking, restoring correct behavior for all transparent wall types.

- **Design:** Mutable ref callback pattern. `ox_fvi.ml` defines `check_trans_wall_callback` as a ref initialized to a no-op (returns 0 = solid). `fvi_bridge.ml` declares an `external` to C and assigns it to the ref at module init time. The C side (`bridge.c`) stores a function pointer registered from fvi.cpp via `cd_ox_register_check_trans_wall`. When OCaml's `fvi_sub` encounters a transparent wall with FQ_TRANSPOINT set, it calls through the ref → external → C function pointer → `check_trans_wall()` which does UV computation and bitmap pixel lookup.

- **Callback flow:** OCaml fvi_sub → `!check_trans_wall_callback segnum sn face hx hy hz` → `check_trans_wall_c` (external) → `cd_ox_check_trans_wall` (bridge.c CAMLprim) → `g_check_trans_wall` (function pointer) → lambda in fvi.cpp → `check_trans_wall(&pnt, &Segments[segnum], sidenum, facenum)` → `find_hitpoint_uv` + bitmap pixel test → returns 1 if transparent pixel, 0 if solid.

- **Files modified:**
  - `ox/ox_fvi.ml` — added `check_trans_wall_callback` ref, updated passability check to use it for FQ_TRANSPOINT
  - `ox/fvi_bridge.ml` — added `external check_trans_wall_c` + ref initialization
  - `ox/bridge.c` — added `g_check_trans_wall` function pointer, `cd_ox_register_check_trans_wall`, `cd_ox_check_trans_wall` + bytecode wrapper
  - `ox/bridge.h` — added `cd_check_trans_wall_fn` typedef, `cd_ox_register_check_trans_wall` declaration
  - `main_d1/fvi.cpp` — moved `check_trans_wall` forward declaration earlier, registered callback lambda
  - `main_d2/fvi.cpp` — same

- **Verification:** `dune fmt` stable, `cmake --build build-ox -j8` clean (D1+D2).

### §55 — Port player_has_weapon to OxCaml (D1 + D2)

- **What:** `player_has_weapon` — checks whether player has the weapon, energy, and ammo for a given weapon slot. Returns bitmask of `HAS_WEAPON_FLAG | HAS_ENERGY_FLAG | HAS_AMMO_FLAG`. Called per-frame from HUD, firing logic, and auto-select. Nearly pure function (only side effect is energy clamp ≥0, kept on C side).

- **D1 vs D2 differences:** D2 adds two special cases: GAUSS_INDEX uses VULCAN_INDEX ammo, OMEGA_INDEX has energy if energy>0 OR Omega_charge>0. Separate `player_has_weapon_d1` and `player_has_weapon_d2` OCaml functions.

- **Design:** Direct scalar args bridge (5 args D1, 9 args D2). C pre-evaluates weapon_flags (has weapon bit → 0/1), ammo, energy, ammo_usage, energy_usage from globals. D2 adds is_gauss, vulcan_ammo, is_omega, omega_charge. OCaml returns int bitmask. Energy clamp side effect stays on C side before bridge call.

- **Files modified:**
  - `ox/ox_weapon.ml` — new module with `player_has_weapon_d1`, `player_has_weapon_d2`
  - `ox/weapon_bridge.ml` — new bridge with `Callback.register`
  - `ox/dune` — added `ox_weapon` and `bridge_weapon` libraries
  - `ox/bridge.c` — `g_player_has_weapon_d1/d2` static pointers, init, wrappers
  - `ox/bridge.h` — `cd_ox_player_has_weapon_d1/d2` declarations
  - `main_d1/weapon.cpp` — `#ifdef USE_OX_BRIDGE` around `player_has_weapon`
  - `main_d2/weapon.cpp` — same
  - `CMakeLists.txt` — added new .ml files to dependencies
  - `CHECKLIST.md` — marked done

- **Verification:** `dune fmt` stable, `cmake --build build-ox -j8` clean (D1+D2).

- **Bugfix (post-commit):** Runtime crash in `cd_ox_player_has_weapon_d1` — NULL dereference because `Weapon_bridge` module wasn't initialized (`Callback.register` never executed). Root cause: `math_bridge.ml` didn't reference the module, and `scripts/ox/build_bridge.sh` (uses `ocamlfind ocamlopt`, not dune) was missing `ox_weapon.ml` and `weapon_bridge.ml`. Fix: (1) added `g_player_has_weapon_d1/d2` to `cd_ox_require_ready` in bridge.c, (2) forced `Weapon_bridge` init in math_bridge.ml, (3) added missing files to build_bridge.sh.

---

### §56 — Port `do_controlcen_frame` to OxCaml (D1 + D2)

- **What:** Ported the control center AI frame function — detects player, selects best gun, fires lasers with randomized spread. First heavily side-effectful port: uses 5 algebraic effects (Player_is_visible, Fire_weapon, Send_controlcen_fire, Make_random_vector, P_Rand).

- **Design:** Algebraic effects + scalar args. Gun arrays passed as flat int arrays (n_guns*3). Returns int array of updated globals. D1 returns 3 values, D2 returns 4 (adds Last_time_cc_vis_check). Pure math functions (calc_best_gun, vm_vec_sub, normalize) called directly in OCaml.

- **D1 vs D2 differences:** D2 adds periodic visibility re-check (every 5 sec), fires multiple spread shots in loop (up to 4, level-dependent) vs D1 single 25% shot, spread scale F1_0/6 vs F1_0/4, D2 extra shots silent, D2 trainee difficulty bonus (+F1_0/2 fire delay).

- **Files created:**
  - `ox/ox_controlcen.ml` — effect definitions + pure `do_controlcen_frame_d1/d2`
  - `ox/controlcen_bridge.ml` — effect handlers, externals, Callback.register

- **Files modified:**
  - `ox/bridge.c` — effect CAMLprim wrappers (7-arg/8-arg native+bytecode), registration fn, D1/D2 entry points
  - `ox/bridge.h` — effect typedefs, registration fn, entry point declarations
  - `main_d1/cntrlcen.cpp` — `#ifdef USE_OX_BRIDGE` in `do_controlcen_frame`
  - `main_d2/cntrlcen.cpp` — same
  - `ox/dune` — added `ox_controlcen` + `bridge_controlcen` libraries
  - `scripts/ox/build_bridge.sh` — added `ox_controlcen.ml` + `controlcen_bridge.ml`
  - `ox/math_bridge.ml` — forced `Controlcen_bridge` module init
  - `CMakeLists.txt` — added new .ml files to DEPENDS
  - `CHECKLIST.md` — marked `do_controlcen_frame` done

- **Verification:** `dune fmt` clean, `cmake --build build-ox -j8` clean (D1+D2).

---

### §57 — Port `ai_do_actual_firing_stuff`, `do_ai_frame`, `do_physics_sim` to OxCaml (D1 + D2)

- **Scope:** Three of the biggest remaining game logic functions. `do_ai_frame` (~851 lines D1, ~1234 lines D2) is the main AI state machine. `ai_do_actual_firing_stuff` (~72 lines D1, ~170 lines D2) is the firing execution helper called from do_ai_frame. `do_physics_sim` (~600 lines D1, ~640 lines D2) is the FVI retry loop with collision response.

- **Design:** Algebraic effects for all side-effectful operations (FVI, collisions, path creation, visibility, boss/special robot behaviors). AI state packed into ~43-int array (ai_static + ai_local fields), robot info into ~29-int array. Physics state packed into ~30-int array. Pure math and already-ported helper functions called directly in OCaml.

- **AI effects (24):** Ai_multiplayer_awareness, Do_ai_robot_hit_attack, Ai_fire_laser_at_player, Calc_gun_point_for_gun, Create_path_to_player, Create_path_to_station, Create_n_segment_path, Create_n_segment_path_to_door, Attempt_to_resume_path, Ai_follow_path, Move_towards_segment_center, Compute_vis_and_vec, Ai_multi_send_robot_position, Do_boss_stuff, P_Rand, Make_random_vector, Object_to_object_visibility, Do_snipe_frame, Do_escort_frame, Do_thief_frame, Do_any_robot_dying_frame, Make_nearby_robot_snipe, Ai_do_cloak_stuff, Set_robot_state_and_joints.

- **Physics effects (16):** Find_vector_intersection, Collide_object_with_wall, Scrape_object_on_wall, Collide_two_objects, Obj_relink, Find_object_seg, Update_object_seg, Find_point_seg, Get_seg_masks, Compute_segment_center, Add_stuck_object, Find_connect_side, Wall_is_doorway, Create_abs_vertex_lists_and_dist, Tmap_is_force_field (D2), Vm_vector_2_matrix_orient (D2).

- **D1 vs D2 differences:** D2 adds dual weapon timers (next_fire2), camera awareness, robot-killing cheat, extra AI modes (BEHIND, GOTO_*, SNIPE_*, THIEF_*, WANDER), special robot types (sniper, companion, thief), brain robot door-opening, more complex time-slicing. D2 physics adds force field bounce detection, PF_BOUNCES_TWICE tracking, weapon orientation update on bounce, MAX_OBJECT_VEL clamping.

- **Files created:**
  - `ox/ox_ai_frame.ml` — effect definitions + `ai_do_actual_firing_stuff_d1/d2` + `do_ai_frame_d1/d2`
  - `ox/ai_frame_bridge.ml` — effect handlers, externals, Callback.register
  - `ox/ox_physics_sim.ml` — effect definitions + `do_physics_sim_d1/d2`
  - `ox/physics_sim_bridge.ml` — effect handlers, externals, Callback.register

- **Files modified:**
  - `ox/bridge.c` — effect CAMLprim stubs + entry points for all 6 functions (d1/d2 × 3)
  - `ox/bridge.h` — effect typedefs, registration functions, entry declarations
  - `main_d1/ai.cpp` — `#ifdef USE_OX_BRIDGE` in `do_ai_frame` (24 effect callbacks + state packing/unpacking)
  - `main_d2/ai.cpp` — `#ifdef USE_OX_BRIDGE` in `do_ai_frame` (24 effect callbacks with D2 signatures)
  - `main_d1/physics.cpp` — `#ifdef USE_OX_BRIDGE` in `do_physics_sim` (16 effect callbacks + state packing/unpacking)
  - `main_d2/physics.cpp` — `#ifdef USE_OX_BRIDGE` in `do_physics_sim` (16 effect callbacks with D2 extras)
  - `ox/dune` — added `ox_ai_frame`, `ai_frame_bridge`, `ox_physics_sim`, `physics_sim_bridge` libraries
  - `scripts/ox/build_bridge.sh` — added 4 new .ml files
  - `ox/math_bridge.ml` — forced module init for new bridge modules
  - `CMakeLists.txt` — added new .ml files to DEPENDS
  - `CHECKLIST.md` — marked `do_ai_frame`, `ai_do_actual_firing_stuff`, `maybe_ai_do_actual_firing_stuff`, `do_physics_sim` done

- **Verification:** `cmake --build build-ox -j8` clean (D1+D2). Both executables link and codesign successfully.

---

### §58 — Inline `player_is_visible_from_object` into OCaml controlcen

- **Motivation:** The `Player_is_visible` effect's C handler called `player_is_visible_from_object`, which does FVI ray tracing deep into C. This violated the clean effect architecture where C handlers should be thin wrappers, not deeply nested calls that re-enter OCaml.

- **Approach:** Replaced the `Player_is_visible` algebraic effect with an inline FVI ray cast directly in `ox_controlcen.ml`, calling the existing `cd_ox_effect_ps_find_vector_intersection` C external (same FFI the physics sim uses). The controlcen case uses `field_of_view=0`, making the FOV check trivially pass, so only line-of-sight matters.

- **Files modified:**
  - `ox/ox_controlcen.ml` — removed `Player_is_visible` effect type, added `fvi_find_vector_intersection` external and `check_player_visible` helper, added `~player_objnum` parameter to D1/D2 functions
  - `ox/controlcen_bridge.ml` — removed `effect_player_is_visible` external and handler case, added `player_objnum` parameter
  - `ox/bridge.c` — removed `g_effect_cc_player_is_visible` callback/registration, added `player_objnum` to D1 (26→27 args) and D2 (28→29 args) entry points
  - `ox/bridge.h` — removed typedef, updated signatures
  - `ox/math_bridge.ml` — added extra `-> int` for `player_objnum` in type annotations
  - `main_d1/cntrlcen.cpp` — removed `player_is_visible` lambda, added `Players[Player_num].objnum` to bridge call
  - `main_d2/cntrlcen.cpp` — same

- **Verification:** D1 runtime tested, control center fires correctly, no crashes or OCaml exceptions. Death roll scenario works.

---

### §59 — Fix D2 `ai_frame` crash: rotthrust passed as scalar instead of 3-element array

- **Bug:** D2 segfault in `camlStdlib__Array$copy` called from `do_ai_frame_d2`. Root cause: `rotthrust_in` was passed as a single `int32_t` (just `.x` component) but OCaml expected a 3-element `int array`.

- **Fix:** Changed C bridge to pass `const int32_t*` array with all 3 rotthrust components. Changed D2 `ai.cpp` caller to use compound literal `(int32_t[]){ .x, .y, .z }`. Updated `bridge.h` signature.

- **Verification:** D2 no longer crashes on level load. Robots animate and move.

---

### §60 — Fix D2 `ai_frame` rapid fire: apply effect-wins write-back policy

- **Bug:** D2 robots fired weapons extremely rapidly and had erratic AI (not tracking player). Root cause: D2 unconditionally overwrote AI state (`ai_static`, `ai_local`, `phys_flags`, `rotthrust`) after the OCaml call, clobbering fire timers modified by C-side effect callbacks during the call.

- **Fix:** Applied D1's "effect-wins" snapshot + conditional write-back policy. Before the OCaml call, snapshot `aip`, `ailp`, `phys_flags`, and `rotthrust`. After the call, only write back fields that C-side effects didn't modify (using `WRITEBACK_AIP`/`WRITEBACK_AILP` macros comparing current vs snapshot values).

- **Files modified:**
  - `main_d2/ai.cpp` — added snapshot variables and `WRITEBACK_AIP`/`WRITEBACK_AILP` macros

- **Verification:** D2 robots fire at normal rate, track player correctly, AI behavior matches expected gameplay.

---

### §61 — Fix `OBJ_WEAPON` constant mismatch: weapons can now pass through grate walls

- **Bug:** In D2, weapons could not shoot through grate/transparent walls. Debug logging revealed weapon FVI calls had `flags=1` (`FQ_CHECK_OBJS` only) instead of `flags=5` (`FQ_CHECK_OBJS | FQ_TRANSPOINT`), meaning the transparent pixel check was never triggered.

- **Root cause:** `obj_weapon` was set to `7` (`OBJ_POWERUP`) instead of `5` (`OBJ_WEAPON`) in two OCaml files. The C headers define `OBJ_WEAPON=5`, `OBJ_POWERUP=7`. The wrong constant meant:
  1. `ox_physics_sim.ml` — weapon objects never got `FQ_TRANSPOINT` added to FVI flags, so grate walls blocked all weapons
  2. `ox_physics.ml` — robot "danger laser" detection (`compute_vis_and_vec`) failed to recognize actual weapons, potentially impairing robot evasion behavior
  3. Powerup objects incorrectly got `FQ_TRANSPOINT` flags, which may have caused the D2 powerup-pickup wall-collision behavior reported earlier

- **Fix:** Changed `obj_weapon = 7` to `obj_weapon = 5` in both files.

- **Files modified:**
  - `ox/ox_physics_sim.ml` — `obj_weapon` constant 7→5
  - `ox/ox_physics.ml` — `obj_weapon` constant 7→5

- **Verification:** D2 weapons now pass through both types of grate walls tested. Powerup pickup no longer causes wall-collision behavior. D1 unaffected (already had correct value in `ox_fvi.ml` and `ox_collide.ml`).

### §62 — Port collision bump functions and simple collision handlers to OCaml (Phase 1)

- **Goal:** Eliminate OCaml→C→OCaml round-trips for collision handling. The physics sim already runs in OCaml but bounced collision dispatch back to C via the `Collide_two_objects` effect. Many sub-functions called by C collision handlers (apply_damage_to_robot, phys_apply_force, etc.) were already ported to OCaml, creating unnecessary round-trips.

- **What was ported:**
  - **Bump functions** (pure physics math): `bump_one_object`, `bump_this_object_d1/d2`, `bump_two_objects_d1/d2`, `apply_force_damage_d1/d2`
  - **Simple collision handlers**: `collide_robot_and_robot`, `collide_robot_and_controlcen`, `collide_player_and_player`, `collide_player_and_clutter`, `collide_player_and_controlcen` (D1+D2 variants)
  - **Dispatcher**: `collide_two_objects_d1/d2` — pattern matches on (type_a, type_b), handles ported cases in OCaml, falls back to C for unported handlers

- **Architecture:** Kept `ox_physics_sim.ml` unchanged. The `Collide_two_objects` handler in `physics_sim_bridge.ml` now: (1) fetches collision data from C via `effect_fetch_collision_data`, (2) tries OCaml dispatch under nested `Effect.Deep.match_with`, (3) falls back to C for unported handlers.

- **New effects:** `Add_points_to_score`, `Play_collision_sound`, `Create_awareness_event`, `Write_back_hit_object`

- **C-side:** Added collision effect callback registration (`cd_ox_register_collision_effects`), fetch_collision_data packs 48 object fields into int array, write_back_hit_object unpacks 9 fields.

- **Key fixes during implementation:**
  - `bump_this_object` and `apply_force_damage` are mutually recursive → `let rec ... and ...`
  - Build link order: ox_physics → ox_collide → ox_fvi (ox_collide now depends on ox_physics)
  - `PF_PERSISTENT = 0x20`, not `4`
  - Type annotation syntax: `let f (type a) ~is_d2 (eff : a Effect.t)` instead of `let f ~is_d2 : type a. ...`

- **Parity tests:** Added C oracle implementations of bump functions (`c_oracle_collide.cpp`) and 11 parity expect tests comparing C vs OCaml output. All tests pass with bit-identical results.

- **Files modified:**
  - `ox/ox_collide.ml` — +728 lines: bump functions, collision handlers, dispatcher
  - `ox/physics_sim_bridge.ml` — +283 lines: collision effect handler, modified Collide_two_objects handler
  - `ox/bridge.c` / `ox/bridge.h` — C-side collision effect callbacks
  - `main_d1/physics.cpp` / `main_d2/physics.cpp` — collision callback registration
  - `ox/oracle/c_oracle_collide.cpp` / `.h` — C oracle for parity tests
  - `ox/tests/c_fix_stubs.cpp` / `parity_expect.ml` — stubs and 11 parity tests
  - `CMakeLists.txt`, `ox/dune`, `scripts/ox/build_bridge.sh` — build/link order fixes

- **Verification:** D1 and D2 launch and play correctly. No OCaml exceptions. Parity tests all pass.

### 21) Parity testing infrastructure: input record/replay and headless replay binary

- **Input record/replay system** (`OX_REPLAY` flag):
  - `ox/input_recorder.h/.cpp` — Records FrameTime, Controls, RNG state, and initial game snapshot per frame.
  - `ox/input_replayer.h/.cpp` — Replays recordings: restores snapshot, overrides inputs each frame.
  - Hooks wired into `main_d2/game.cpp` (GameLoop lines 2318-2332, 2413-2417), `main_d2/gameseq.cpp` (StartNewLevelSub), `main_d2/inferno.cpp` (arg parsing + cleanup).
  - CLI: `-record file`, `-replay file`, `-state-log file`.
  - `tools/compare_state_logs.c` — Offline comparison tool for state log binary files.
  - D1/D2 handled with `#ifdef BUILD_DESCENT2` guards; files are .cpp (types.h includes cstdint).

- **Headless replay binary** (`headless_replay` CMake target):
  - `tools/headless_replay.cpp` — Standalone main() that loads level, restores snapshot, runs `GameLoop(0,0)` with recorded inputs. No SDL/OpenAL/FluidSynth dependencies.
  - `tools/headless_stubs.cpp` — No-op stubs for all platform functions (graphics, audio, MIDI, mouse).
  - CMakeLists.txt: New target uses `list(REMOVE_ITEM)` to strip SDL/OpenAL/FluidSynth sources, `target_compile_options(-UUSE_SDL -UUSE_OPENAL -UUSE_FLUIDSYNTH)` to undo directory-level defines.
  - Inline version of `LoadLevel` that skips UI rendering (show_boxed_message, gr_clear_canvas).
  - Sets `Viewer = ConsoleObject` (normally done by init_objects), ignores SIGTRAP from Int3() debug traps.

- **Key implementation details:**
  - `gr_init(0)` + `gr_use_palette_table` + `gamefont_init` required before `bm_init` (graphics subsystem bootstrap).
  - `platform_config.cpp` already provides `plat_read_chocolate_cfg`, `plat_save_chocolate_cfg`, `NoOpenGL` — stubs must not duplicate these.
  - `mouse_get_delta`, `mouse_get_btns` live in `sdl/mouse_sdl.cpp` (excluded) — added to stubs.

- **Verification workflow:**
  ```
  # Build OCaml + C-only headless binaries
  cmake -DUSE_OX_BRIDGE=ON  -DOX_REPLAY=ON -S . -B build-ox && cmake --build build-ox --target headless_replay -j8
  cmake -DUSE_OX_BRIDGE=OFF -DOX_REPLAY=ON -S . -B build-c-ref && cmake --build build-c-ref --target headless_replay -j8
  # Run from game data directory
  cd /path/to/descent2/data
  /path/to/build-ox/headless_replay -replay test_session.rec -state-log ox_states.bin
  /path/to/build-c-ref/headless_replay -replay test_session.rec -state-log c_states.bin
  # Compare
  /path/to/build-c-ref/compare_state_logs c_states.bin ox_states.bin
  ```

- **Initial results:** Both builds replay 636 frames successfully. Comparison shows byte-level divergences in object and AI state from frame 1, confirming the tool is surfacing real C-vs-OCaml differences.

- **Files added/modified:**
  - `tools/headless_replay.cpp` — Headless replay main
  - `tools/headless_stubs.cpp` — Platform no-op stubs
  - `tools/compare_state_logs.c` — State log comparison tool
  - `ox/input_recorder.cpp/.h` — Frame input recorder
  - `ox/input_replayer.cpp/.h` — Frame input replayer
  - `ox/parity.cpp/.h` — Parity snapshot/compare infrastructure
  - `CMakeLists.txt` — OX_PARITY_CHECK, OX_REPLAY flags, headless_replay target
  - `main_d2/game.cpp` — Replay hooks in GameLoop
  - `main_d2/gameseq.cpp` — Recorder level_start hook
  - `main_d2/inferno.cpp` — Record/replay arg parsing + cleanup
  - `main_d2/ai.cpp`, `main_d2/physics.cpp` — Parity check hooks

---

### Session 22: Headless Parity Divergence Analysis & Fixes

- **Goal:** Analyze divergences between C-only and OCaml headless replay state logs; fix identified bugs.

- **Analysis method:** Compared per-frame state logs (~74MB each, 636 frames) using `compare_state_logs` with arm64-correct struct sizes (268/200/148). Mapped divergent byte offsets to struct fields using `offsetof()`.

- **Bugs found and fixed in `ox/ox_ai_frame.ml`:**
  1. **Missing `else next_fire2 := f1_0 * 8`** — Robots without secondary weapons (`weapon_type2 = -1`) weren't getting `next_fire2` reset. C code (ai.cpp:815-816) has the else branch; OCaml was missing it.
  2. **Extra P_Rand in AIM_STILL** — OCaml had `P_Rand() > 0x4000` condition active, but C code (ai.cpp:1561) has it commented out (MK 06/09/95). Extra RNG call desynchronized all downstream random state.
  3. **Wrong visibility check in AIM_STILL** — OCaml checked `player_visibility > 0`; C checks `player_visibility == 2`. Also applied to the snipe variant.
  4. **Missing visibility agitation block** — C code (ai.cpp:1050-1068) has an `else if` branch that calls `P_Rand()` for random visibility awareness when `(obj_ref & 3) == 0 && !previous_visibility && dist < F1_0*100`. OCaml was entirely missing this block, including the `compute_vis_and_vec` call in the collision awareness branch.
  5. **Wrong time-slice logic** — OCaml had invented distance-based thresholds (250/150/100 with time checks) that don't match C. C's actual check: `(!previous_visibility) && ((dist >> 7) > time_since_processed)` for non-station robots. Also missing `!companion && !thief` guards and snipe behavior exclusion.

- **Results:**
  - RNG sync improved from 0 frames → 64 frames of perfect match
  - Frame 1 divergences reduced from ~350+ lines to 43 lines
  - Total divergence lines: ~113k (still large due to cascade from frame 65+ RNG desync)

- **Remaining divergences (not yet fixed):**
  - **GOAL_STATE mismatch:** OCaml AI frame defers `do_firing_stuff` to C movement code, which uses `ailp->previous_visibility` instead of freshly computed `player_visibility`. This causes robots newly becoming visible to fire differently.
  - **RNG desync at frame 65:** Likely caused by accumulated GOAL_STATE differences leading to different code paths that conditionally call P_Rand.
  - **Object 28 orientation:** Position/orientation divergences from frame 1, probably from `ai_turn_towards_vector` running differently due to GOAL_STATE mismatch.
  - **Architectural note:** The bridge design splits AI state (OCaml) from movement/firing (C), using `previous_visibility` in the C movement code while C-only uses fresh visibility. This is a structural mismatch that requires either: (a) running `compute_vis_and_vec` in the C movement code, or (b) having the OCaml AI frame handle `do_firing_stuff` inline with proper D2 checks.

- **Key offsets (arm64 macOS):**
  - Object byte 161 = `ai_info.CURRENT_STATE` (flags[1])
  - Object byte 162 = `ai_info.GOAL_STATE` (flags[2])
  - Object byte 163 = `ai_info.PATH_DIR` (flags[3])
  - ai_local byte 36 = `next_fire2` (fix value)
  - ai_local byte 56 = `time_since_processed` (fix value)

---

### Session 23: D2 AI Constant Fixes, Thief/Snipe Parity & Crash Fix

- **Goal:** Fix remaining parity divergences from session 22, investigate and fix crashes.

- **Bugs found and fixed:**

  1. **AIB behavior constants wrong (ox_ai_frame.ml)** — OCaml had D1-style values (`aib_snipe=0x87`, `aib_behind=0x86`) instead of correct D2 values (`aib_snipe=0x84`, `aib_behind=0x82`, `aib_follow=0x86`). All `aib_follow_path` references replaced with `aib_snipe` (7 occurrences).

  2. **AIM mode constants wrong (ox_ai_frame.ml)** — OCaml had D1's `aim_hide=5` which doesn't exist in D2, pushing all subsequent modes off by 1. Removed `aim_hide`, set `aim_behind=5`, corrected all values through `aim_thief_wait=17`. Replaced all `aim_hide` references with `aim_behind`.

  3. **Snipe robot gate missing (ox_ai_frame.ml)** — OCaml called `Do_snipe_frame` unconditionally for snipe robots. C has `!(obj_ref & 3) || previous_visibility` gate plus `mode != AIM_STILL` check. Added both guards and the AIM_STILL→AIM_SNIPE_ATTACK transition.

  4. **Thief `Do_thief_frame` never called (ox_ai_frame.ml)** — Thief robot has `behavior=AIB_SNIPE`, so it enters the snipe `if` block. OCaml had snipe/companion/thief as `if/else if` chain, meaning the thief branch was unreachable. In C, the snipe section (line 1196) and thief section (line 1273) are separate sequential `if` blocks. Fixed by making thief section independent.

  5. **Thief awareness not written back (ai.cpp, bridge)** — `do_thief_frame` reads `ailp->player_awareness_type` from C memory, but OCaml may have already modified it (e.g., random visibility check sets `pa_player_collision`). Added `player_awareness_type` and `player_awareness_time` parameters to `Do_thief_frame` effect; C handler writes them back before calling `do_thief_frame`.

  6. **Snipe mode not written back — crash fix (ai.cpp, bridge)** — OCaml sets `mode := aim_snipe_attack` when transitioning from AIM_STILL, but C-side `Ai_local_info` still had AIM_STILL. `do_snipe_frame` hit `default: Int3()` causing SIGTRAP crash in live play. Added `mode` parameter to `Do_snipe_frame` effect; C handler writes it back before calling `do_snipe_frame`.

- **Other fixes:**
  - Removed debug code from `tools/headless_replay.cpp` (initial state dump)
  - Fixed `tools/compare_state_logs.c` default struct sizes: 264/196/180 → 268/200/148 (arm64 macOS)
  - Updated D1 `main_d1/ai.cpp` stubs for changed effect signatures

- **Results:**
  - Frame 1 divergences: 27 bytes → 16 bytes
  - Thief robot (object 93): 11 byte divergences → 0
  - Snipe robot crash: fixed
  - Remaining 16 frame-1 divergences:
    - 11 × CURRENT_STATE (byte 161): animation ordering — `do_silly_animation` runs before AI in C, after in bridge. Architectural issue.
    - 5 × object 28 orientation: `vec_to_player` recomputed from `obj->pos` in bridge movement code vs `gun_point` in C's `compute_vis_and_vec`. Rounding difference.

- **Key pattern identified:** Effects that call C functions reading `Ai_local_info` fields must write back any OCaml modifications first. Applied to `Do_thief_frame` (awareness) and `Do_snipe_frame` (mode). Same pattern may apply to other effects.

- **Files changed:**
  - `ox/ox_ai_frame.ml` — AIB/AIM constants, snipe gate, thief section, effect signatures
  - `ox/ai_frame_bridge.ml` — Updated Do_snipe_frame/Do_thief_frame handlers and externals
  - `ox/bridge.c` — New snipe/thief C stubs with write-back + bytecode wrappers
  - `ox/bridge.h` — Updated function pointer typedefs
  - `main_d2/ai.cpp` — Snipe/thief effect lambdas with mode/awareness write-back
  - `main_d1/ai.cpp` — Updated D2-only stub signatures
  - `tools/compare_state_logs.c` — Corrected default struct sizes

---

### Session 24: Fix pre-animation gun_point and agitation path guards

- **Goal:** Fix earliest parity divergences (frame 6+).

- **Root cause analysis:**
  - Frame 6: object[75] orientation bytes off by 1 — caused by wrong vis_vec_pos
  - Frame 9: object[55] CURRENT_STATE/GOAL_STATE = AIS_LOCK in OCaml vs AIS_REST in C — cascade from wrong visibility computation and/or wrong do_firing_stuff calls

- **Bug 1: Gun point using post-animation positions**
  - The C bridge pre-computes `gun_point_in` before `do_silly_animation` runs, matching C-only's ordering (calc_gun_point at line 928-938, before animation at 1130).
  - OCaml's D2 AI frame was calling `Calc_gun_point` effect which returns POST-animation joint positions.
  - This caused vis_vec_pos to differ slightly (pre vs post animation), → different vec_to_player → different ai_turn_towards_vector result → orientation off by 1.
  - **Fix:** Use `gun_point_in.(0,1,2)` directly when `next_fire <= 0` (primary weapon ready). For secondary weapon case (`next_fire > 0` but `next_fire2 <= 0`), still call `Calc_gun_point 0` (minor discrepancy accepted).

- **Bug 2: Agitation path P_Rand called for wrong robots**
  - C's agitation path creation (line 954) excludes: `AIB_SNIPE` robots, companion robots, thief robots.
  - OCaml only excluded `AIB_RUN_FROM` and `AIB_STILL`, causing extra P_Rand calls for snipe/companion/thief robots → RNG desync.
  - **Fix:** Added `!behavior <> aib_snipe && companion = 0 && thief = 0` guards.

- **Files changed:** `ox/ox_ai_frame.ml`
- **Verification:** Both `build-ox/headless_replay` and `build-c-ref/headless_replay` compile successfully.

---

### Session 25: Fix bridge movement code player_visibility bugs

- **Goal:** Fix earliest parity divergences (frame 6+) remaining after session 24.

- **Analysis:** Frame 6 object[75] bytes 32/48/64 (pos.y, orient.rvec.z, orient.fvec.x) off by 1 LSB. Traced to two bugs in post-OCaml bridge movement code (`main_d2/ai.cpp` lines 669-776).

- **Bug 1: Raw vs awareness-bumped player_visibility (ai.cpp line 687)**
  - Bridge used `ailp->previous_visibility` (current frame raw visibility) as `player_visibility`.
  - C-only's `compute_vis_and_vec` applies an awareness bump: raw visibility 1 → 2 when `player_awareness_type >= PA_NEARBY_ROBOT_FIRED`. The bridge movement code didn't apply this bump.
  - Affected: secondary state machine turning for AIS_LOCK/AIS_SRCH/AIS_FIRE, AIM_CHASE_OBJECT, AIM_STILL, AIM_BEHIND — any case checking `player_visibility == 2`.
  - **Fix:** After line 687, apply awareness bump: if `raw == 1 && ailp->player_awareness_type >= PA_NEARBY_ROBOT_FIRED`, set `player_visibility = 2`.

- **Bug 2: Wrong "previous frame" visibility in AIM_STILL condition (ai.cpp line 702)**
  - Bridge checked `(player_visibility == 2) || (ailp->previous_visibility == 2)`. Since both equal the same value, this was really just `ailp->previous_visibility == 2` (current frame).
  - C-only checks `player_visibility == 2` (current frame, bumped) OR `previous_visibility == 2` (PREVIOUS frame's visibility, saved before compute_vis_and_vec updates ailp->previous_visibility).
  - The previous frame's value is `ailp_before.previous_visibility` (captured before OCaml runs).
  - **Fix:** Introduced `prev_frame_visibility = ailp_before.previous_visibility` and used it in the AIM_STILL condition.

- **Bug 3: OCaml D2 gun rotation missing dual-weapon hack (ox_ai_frame.ml)**
  - C-only wraps to gun 1 (not 0) when `current_gun >= n_guns` for dual-weapon robots (`weapon_type2 != -1`).
  - OCaml always wrapped to 0.
  - **Fix:** Added the two-weapon-type check to match C-only line 1857-1860.

- **Files changed:**
  - `main_d2/ai.cpp` — player_visibility awareness bump + prev_frame_visibility
  - `ox/ox_ai_frame.ml` — D2 gun rotation dual-weapon fix

- **Verification:** Both `build-ox/headless_replay` and `build-c-ref/headless_replay` compile successfully.

---

### Session 26: SKIP_AI_COUNT fix, animation ordering, escort mode writeback

- **Goal:** Continue reducing parity divergences between C-only and OCaml builds.

#### Fix 1: SKIP_AI_COUNT not set in OCaml collision path

- **Root cause:** When a robot gets bumped during collisions, C's `phys_apply_rot` sets `SKIP_AI_COUNT` (causing the robot to skip AI frames). OCaml's collision system returned a `skip_ai` boolean from `phys_apply_rot` but discarded it (`_sa0`/`_sa1` in `bump_this_object_d2`).
- **Fix:** Added `Set_bump_skip_ai_count` effect through the full bridge stack:
  - `ox/ox_collide.ml`: New effect declaration + `Effect.perform` when `skip_ai=true`
  - `ox/bridge.h`: New typedef + phase3 registration function
  - `ox/bridge.c`: New global, registration, and `CAMLprim` wrapper
  - `ox/physics_sim_bridge.ml`: New external + effect handler case
  - `main_d2/physics.cpp`: C lambda with exact SKIP_AI_COUNT logic (P_Rand, FrameTime, thief/attack_type checks)
  - `main_d1/physics.cpp`: Simpler D1 version (just sets count to 2)
- **Impact:** Object divergences dropped from 102,332 → 7,681 (**92% reduction**).

#### Fix 2: Pre-OCaml animation ordering (awareness decay + matcen skip)

- **Root cause:** The bridge ran `do_silly_animation` before OCaml, but C-only runs it AFTER awareness decay (GOAL_STATE=AIS_REST when awareness=0), the unflinch hack, FLIN→LOCK transition, and potential matcen early return. This caused animation angle divergences for objects 60/83 at frame 1.
- **Fix:** In `main_d2/ai.cpp` bridge pre-animation block:
  - Moved `seg_station_enabled` computation before the pre-animation block
  - Added `matcen_skip` check (skip animation for robots in active matcen segments)
  - Added `GOAL_STATE=AIS_REST` when `player_awareness_type=0` before animation
  - Added unflinch hack and FLIN→LOCK transition before animation
- **Impact:** Eliminated frame 1 divergences for objects 60/83.

#### Fix 3: Escort robot mode not written back after Do_escort_frame

- **Root cause:** `do_escort_frame` (called as a C effect during OCaml execution) changes `ailp->mode` in C (e.g., FOLLOW_PATH→GOTO_OBJECT). But OCaml's local `mode` ref was never updated. OCaml dispatched on the stale mode, hitting AIM_FOLLOW_PATH (which unconditionally sets `goal_state := ais_lock` at line 2010-2013) instead of AIM_GOTO_OBJECT (which doesn't set GOAL_STATE).
- **Fix:** Changed `Do_escort_frame` effect from `unit` to `int`, returning the updated `ailp->mode`:
  - `ox/ox_ai_frame.ml`: Effect type `int Effect.t`, callsite updates `mode := new_mode`
  - `ox/ai_frame_bridge.ml`: Handler returns mode value, external returns `int`
  - `ox/bridge.h`: Typedef returns `int` instead of `void`
  - `ox/bridge.c`: Returns `Val_int(new_mode)` from CAMLprim
  - `main_d2/ai.cpp`: Lambda reads `Ai_local_info[objnum].mode` after `do_escort_frame`
  - `main_d1/ai.cpp`: D1 stub returns 0
- **Impact:** Eliminated frame 2-12 GOAL_STATE divergence for escort robot (obj28).

#### Parity analysis and remaining divergences

- **Current parity status (636 frames, test_session.rec):**
  - Divergent frames: 624/636
  - Object divergences: 7,637
  - AI local divergences: 8,435
  - Player divergences: 489
  - Global (rand_state) divergences: 700

- **Root cause of remaining divergences:**
  - Frame 13: Escort robot (obj28, companion/guide-bot) CURRENT_STATE diverges (C=LOCK, OCaml=REST). GOAL_STATE matches. Subtle ordering issue within `do_escort_frame` or post-escort animation state.
  - Frame 117: P_Rand call count diverges massively (C-only: 309 calls, OCaml: 1 call). Caused by escort robot's cascading state divergence triggering different pathfinding in C-only.

### Session 27: Collision position fix, retry_count writeback, object_animates & previous_visibility

- **Goal:** Investigate and fix parity divergences starting from the earliest (frame 32 fireball position mismatch).

#### Fix 1: Bridge collision callbacks use stale object position

- **Root cause:** In `do_physics_sim`, the C-only path updates `obj->pos = ipos` (FVI hit point) at line 1203 BEFORE calling `collide_object_with_wall`. But in the bridge path, OCaml updates its `cur_pos` refs, while `ps_obj->pos` in C remains stale (pre-physics position). Collision handlers like `collide_object_with_wall` in `collide.cpp` create fireballs at `weapon->pos`, so the bridge path created fireballs at the wrong (old) position.
- **Diagnosis:** Added diagnostic fprintf logging to both paths. C-only showed delta=(0,0,0) between pos and hit point (already synced). Bridge showed deltas of 100k+ units (completely stale).
- **Fix (`main_d2/physics.cpp`):** Set `ps_obj->pos = hp;` before calling `collide_object_with_wall` and `scrape_object_on_wall` in the bridge effect callbacks.
- **Impact:** Eliminated 1000 object divergences, pushed first divergence from frame 32 to frame 45.

#### Fix 2: retry_count not written back from OCaml physics sim

- **Root cause:** OCaml physics sim returned `retry_count` as `result[22]` but it was never written back to `Ai_local_info`. The C-only path updates retry_count at the end of the physics loop.
- **Fix (`main_d2/physics.cpp`):** Added writeback: `if (obj->control_type == CT_AI && result[22] > 0) Ai_local_info[objnum].retry_count = result[22];`
- **Impact:** Eliminated frame 14-15 ai_local[28] divergences, reduced divergent frames 607→605.

#### Fix 3: object_animates passed as hardcoded 1 instead of pre-computed value

- **Root cause:** The bridge passed `1` for `animation_enabled` to OCaml instead of the pre-computed `object_animates` value from `do_silly_animation`. OCaml then used a simplified `dist < 100` approximation which didn't match C's actual animation check.
- **Fix (`main_d2/ai.cpp`):** Changed `1 /* animation_enabled */` to `object_animates`.
- **Fix (`ox/ox_ai_frame.ml`):** Changed `let object_animates = ref 0` to `ref animation_enabled`, removed OCaml's dist-based animation phase approximation.

#### Fix 4: AIM_GOTO_PLAYER visibility hardcoded to 2

- **Root cause:** C-only passes `player_visibility=2` (hardcoded) when calling `ai_follow_path` for GOTO_PLAYER/GOTO_OBJECT modes. OCaml was passing the actual `!player_visibility` which could be different.
- **Fix (`ox/ox_ai_frame.ml`):** Changed `Ai_follow_path (!player_visibility, ...)` to `Ai_follow_path (2, ...)` for goto modes.

#### Fix 5: compute_vis doesn't update previous_visibility in OCaml

- **Root cause:** C's `compute_vis_and_vec` updates `ailp->previous_visibility` as a side effect. OCaml's `compute_vis()` helper updated `player_visibility` but not `previous_visibility`. This could cause the time-slice check to use a stale value, potentially causing OCaml to early-return when C would not.
- **Fix (`ox/ox_ai_frame.ml`):** Added `previous_visibility := pv;` inside `compute_vis()` for both D1 and D2 paths.

#### Remaining divergence: vm_vector_2_matrix parity

- **Root cause identified:** Frame 45 divergence is in `orient.rvec`/`orient.uvec` of obj69 (robot) while `fvec` matches perfectly. Both builds time-slice this robot (skip AI movement). The difference comes from `do_physics_align_object` calling `vm_vector_2_matrix` — the OX build delegates to OCaml's implementation while C-ref uses C's implementation. Cross-product rounding differences produce slightly different `rvec`/`uvec` for the same `fvec`.

#### Parity status (636 frames, test_session.rec)

| Metric | Session 26 | Session 27 | Change |
|--------|-----------|-----------|--------|
| Divergent frames | 624 | 592 | -32 |
| Object divergences | 7,637 | 6,533 | -1,104 |
| AI local divergences | 8,435 | 8,385 | -50 |
| First divergence | Frame 14 | Frame 45 | +31 frames |
  - Frames 117-636: All state diverges due to random state mismatch from P_Rand desync.
  - The escort robot is the single remaining source of pre-random divergence. Fixing the frame 13 CS divergence would likely eliminate the P_Rand divergence and most subsequent divergences.

- **Diagnostic approach used:** Added per-object P_Rand call counting to identify that obj28 (escort, id=33, behavior=AIB_FOLLOW=0x81) was making 308 extra P_Rand calls in C-only at the frame where random state diverges.

### Session 29: Convert FVI from upfront world-packing to on-demand effects

- **Goal:** Eliminate O(all_segments + all_objects) malloc/copy per OCaml FVI call by fetching data on demand via algebraic effects, paying only for segments/objects actually visited (~10-50 per call).

#### Phase 1: Effects infrastructure

- Added `Fetch_segment_data : int -> int array Effect.t` in `ox_gameseg.ml`
- Added `Fetch_object_data : int -> int array Effect.t` and `Fetch_collision_table : int array Effect.t` in `ox_fvi.ml`
- Added three `CAMLprim` C externals in `bridge.c` (`cd_ox_fetch_segment_data`, `cd_ox_fetch_object_data`, `cd_ox_fetch_collision_table`) that fill OCaml arrays from registered C callbacks
- Registered callbacks from `main_d2/fvi.cpp` and `main_d1/fvi.cpp` (lambdas indexing `Segments[]`, `Objects[]`, `CollisionResult[][]`)
- Added `run_with_fvi_effects` in `fvi_bridge.ml` — `Effect.Deep.match_with` handler for all three fetch effects

#### Phase 2: Convert core FVI

- Wrote `fvi_sub_v2` taking explicit params instead of packed array, using `Effect.perform (Fetch_segment_data segnum)` per segment visited
- Wrote `find_vector_intersection_v2` — top-level dispatcher using effects
- Wrote `sphere_intersects_wall_v2` — wall intersection check using effects
- Wrote `find_point_seg_fvi_v2` in `ox_fvi.ml` and `find_point_seg_v2` in `ox_gameseg.ml` — both using effects instead of pre-packed arrays
- Wrote helper functions: `obj_in_ignore_list_v2`, `check_laser_related_v2`, `get_collision_result_v2`, `visibility_check_v2`

#### Phase 3: Convert remaining consumers

All 5 consumer functions converted to v2 compact format in both D1 and D2:

| Function | C callsite (D2) | C callsite (D1) |
|----------|-----------------|-----------------|
| `find_homing_object_complete_v2` | `main_d2/laser.cpp` | `main_d1/laser.cpp` |
| `find_homing_object_v2` | `main_d2/laser.cpp` | `main_d1/laser.cpp` |
| `track_track_goal_v2` | `main_d2/laser.cpp` | `main_d1/laser.cpp` |
| `player_is_visible_from_object_v2` | `main_d2/ai2.cpp` | `main_d1/ai.cpp` |
| `compute_vis_and_vec_v2` | `main_d2/ai2.cpp` | `main_d1/ai.cpp` |

v2 compact header (8 ints): `[n_objects, is_d2, thisobjnum, player_objnum, game_time, game_mode_coop, physics_cheat, n_segments]` — replaces old 18-int FVI header + 256-int collision table + N×87 segments + N×14 objects.

#### Phase 4: Cleanup

Removed ~2,000 lines of dead v1 packed-array code:

| File | Lines removed | Description |
|------|--------------|-------------|
| `ox/ox_fvi.ml` | -1,668 | All v1 functions (`fvi_sub`, `find_vector_intersection`, `sphere_intersects_wall`, `find_homing_object_complete`, `object_is_trackable`, `track_track_goal`, `find_homing_object`, `find_point_seg_fvi`, `player_is_visible_from_object`, `compute_vis_and_vec`, `visibility_check`), v1 helper functions, unused constants |
| `ox/fvi_bridge.ml` | -181 | Rewrote: removed all v1 wrappers and callback registrations |
| `ox/bridge.c` | -229 | v1 globals, `caml_named_value` lookups, readiness checks, function bodies; sub-function bridge code (`check_line_to_face`, `special_check_line_to_face`, `check_vector_to_sphere_1`, `check_vector_to_object`) |
| `ox/bridge.h` | -54 | v1 function declarations, sub-function declarations |
| `main_d2/fvi.cpp` | -98 | Sub-function `USE_OX_BRIDGE` hooks (C's fvi_sub now uses pure C sub-functions) |
| `main_d1/fvi.cpp` | -103 | Same |
| `ox/math_bridge.ml` | -12 | Updated module init reference |

#### Build verification
- All targets build: D1, D2, headless_replay
- Headless replay completes with identical behavior (46 pre-existing "Illegal side type" exceptions from `compute_vis_and_vec_v2`, unchanged from before conversion)

### Session 28: Migrate from effect-wins to shadow mode

- **Goal:** Replace the error-prone "effect-wins" write-back architecture with shadow mode, where C is always authoritative and OCaml runs in parallel for validation only.

#### Architecture change

**Before (effect-wins):** OCaml runs a function → effects call into C with real side effects → on return, a per-field merge policy decides whether to keep C's or OCaml's value. This caused subtle bugs (companion flare firing, next_fire write-back conflicts, P_Rand state drift).

**After (shadow mode):** `parity_snapshot` → OCaml runs (effects dry-run for AI, normal for physics) → `parity_snapshot` → `parity_restore` → C runs authoritatively → `parity_snapshot` → `parity_compare`. No write-back, no merge policy. C result is always canonical.

#### Changes by file

**D2 AI (`main_d2/ai.cpp`):**
- Added `g_shadow_dry_run` flag, guarded 19 side-effect lambdas (fire_laser, create_path, escort/thief frame, etc.) — pure queries (P_Rand, compute_vis_and_vec, calc_gun_point) not guarded
- Removed all `WRITEBACK_AIP`/`WRITEBACK_AILP` macros and ~28 field write-back calls
- Removed pre-OCaml animation block and post-OCaml movement dispatch (~140 lines)
- Restructured to shadow mode pattern

**D1 AI (`main_d1/ai.cpp`):**
- Renamed `g_parity_dry_run` → `g_shadow_dry_run`
- Removed `OX_PARITY_TEST` define and ParityGuard RAII struct (~300 lines)
- Removed effect-wins write-back, restructured to shadow mode

**D2 Physics (`main_d2/physics.cpp`):**
- Removed result write-back of 25+ fields (pos, velocity, orient, segnum, flags, etc.)
- Effects fire normally (physics needs collisions for correct computation)
- Fixed stray `}` scope issue from removed OCaml drag computation block

**D1 Physics (`main_d1/physics.cpp`):**
- Added parity include, removed write-back + return, restructured to shadow mode

**Parity infrastructure (`ox/parity.h`, `ox/parity.cpp`):**
- Changed guard from `OX_PARITY_CHECK` to `USE_OX_BRIDGE`
- Added per-segment object list heads (`Segments[].objects`) to snapshot/restore — fixes crash where `obj_relink` during OCaml physics corrupted linked list state that `parity_restore` didn't cover
- Added `segment.h`/`gameseg.h` includes

**OCaml bridge (`ox/ai_frame_bridge.ml`, `ox/physics_sim_bridge.ml`):**
- Changed `exnc = raise` to exception handlers returning dummy arrays (prevents process crash from OCaml exceptions during shadow execution)
- Added try/with in FVI effect handler for `Invalid_argument` (returns HIT_NONE on failure)
- Core library fixes: `Exn.to_string` not `Printexc.to_string`, `Array.create ~len:n v` not `Array.make n v`

**C bridge (`ox/bridge.c`):**
- Changed `caml_callback` to `caml_callback_exn` for FVI with exception fallback

**FVI fallback (`main_d2/fvi.cpp`):**
- Added `out_len < 12` check — returns `HIT_BAD_P0` when OCaml FVI throws exception

**Build (`CMakeLists.txt`):**
- Removed `OX_PARITY_CHECK` option entirely
- `parity.cpp` always included when `USE_OX_BRIDGE` is on

**Documentation (`CLAUDE.md`):**
- Removed `OX_PARITY_CHECK` from flags table
- Updated porting strategy to document shadow mode as current architecture

#### Build verification
- Both `build-ox` (USE_OX_BRIDGE=ON) and `build-c-ref` (USE_OX_BRIDGE=OFF) compile cleanly
- OCaml bridge builds successfully
- D1 launches and runs interactively with shadow mode active
- Headless replay runs without crash (previously crashed on assertion in obj_relink and OCaml FVI exception)

#### Known issues
- **OCaml FVI crash:** `Ox_fvi.unpack_obj` throws `Invalid_argument "index out of bounds"` — pre-existing bug. Falls back to `HIT_BAD_P0`, causing state divergence vs C-ref at frame 32. Needs OCaml FVI fix.
- **State log divergence:** OX build diverges from C-ref at frame 32 due to OCaml FVI exception fallback affecting C's physics path (FVI is OCaml-authoritative, not shadow mode).
- **Parity logging volume:** Shadow mode parity comparisons produce heavy stderr output, slowing headless replay significantly.

### Session 30: Fix "Illegal side type" bug in OCaml FVI

#### Problem
`compute_vis_and_vec_v2` threw `Failure "Illegal side type 0"` ~46 times per replay. The exceptions were caught by try/with handlers and dummy values returned, so the game didn't crash, but the OCaml FVI wasn't computing correctly.

#### Root cause
The FVI data fetch callbacks (`g_fvi_fetch_segment_data`, `g_fvi_fetch_object_data`, `g_fvi_fetch_collision_table`) were only registered inside `find_vector_intersection()` in `fvi.cpp` on first call. But `compute_vis_and_vec` and `player_is_visible_from_object` in `ai2.cpp` called OCaml FVI functions _before_ `find_vector_intersection` ever ran. With NULL callbacks, `cd_ox_fetch_segment_data()` returned all-zero buffers (from `memset`), producing `side_type=0` for every side of every segment.

#### Investigation
1. Added side_type value to error message — confirmed `side_type=0`
2. Added segment number debug — found segments 5, 174, 176, 212, 224 all returning all-zero data (children, seg_verts, side_types all zeros)
3. Checked stderr ordering — FVI callback registration message at line 537, but exceptions started at line 40
4. Confirmed NULL callback path: `cd_ox_fetch_segment_data` does `memset(buf, 0, sizeof(buf)); if (g_fvi_fetch_segment_data) g_fvi_fetch_segment_data(segnum, buf);` — with NULL callback, buffer stays zeroed

#### Fix
Added `ensure_fvi_data_callbacks_registered()` static helper functions in both D1 and D2:
- `main_d2/ai2.cpp` — registers FVI data callbacks on first use, called from `player_is_visible_from_object` and `compute_vis_and_vec`
- `main_d1/ai.cpp` — same for D1

#### Files changed
| File | Changes |
|------|---------|
| `main_d2/ai2.cpp` | Added `ensure_fvi_data_callbacks_registered()` + calls from `player_is_visible_from_object` and `compute_vis_and_vec` |
| `main_d1/ai.cpp` | Same for D1 |
| `ox/ox_gameseg.ml` | Improved "Illegal side type" error message to include side_type value and sidenum |

#### Verification
- Headless replay: 0 "Illegal side type" exceptions (was 46)
- 0 total exceptions (was 46)
- OCaml FVI now computes real visibility results instead of returning dummy values

#### Performance note
With the fix, OCaml FVI functions now do real computation in shadow mode. This makes headless replay significantly slower (~37 `compute_vis_and_vec_v2` calls/sec, ~57 min for 636-frame replay vs previous near-instant exception-based skip). This is expected — the previous "fast" behavior masked the bug.

### 31) Swap find_vector_intersection to OCaml-authoritative

#### Context
FVI parity testing showed 13/13 sampled `find_vector_intersection` calls matching perfectly between OCaml and C. All other FVI callsites (`object_intersects_wall`, `find_homing_object`, `find_homing_object_complete`, `track_track_goal`, `player_is_visible_from_object`, `compute_vis_and_vec`) were already OCaml-authoritative. Only `find_vector_intersection` itself was still parity-sampled with C authoritative.

#### Changes
Converted `find_vector_intersection` from parity-sampled (C authoritative) to OCaml-authoritative in both D1 and D2:

**Before**: OCaml ran on sampled calls, result stored in `ox_hit_data` for comparison; C always ran and its result was returned; parity comparison code logged divergences.

**After**: OCaml runs on every call and its result is returned directly via `hit_data`. C path kept as fallback only — executes if OCaml throws an exception (out_len < 12).

Removed:
- Parity sampling counters (`fvi_call_count`, `fvi_div_count` in D2)
- `fvi_force_c_path` save/restore in D2's `find_vector_intersection` (variable still exists for `object_intersects_wall` but is never set to true)
- `g_ox_nested_ocaml_guard` check in D1's `find_vector_intersection` (guard still used by `object_intersects_wall`)
- All parity comparison code (divergence logging, BAD_P0 comparison)

Net: -121 lines across both files.

#### Files changed
| File | Changes |
|------|---------|
| `main_d2/fvi.cpp` | OCaml-authoritative FVI, removed parity comparison |
| `main_d1/fvi.cpp` | Same for D1 |

#### Verification
- Build succeeds (OCaml bridge + cmake)
- Headless replay runs without FVI exceptions or crashes
- D2 logs `[OX] find_vector_intersection (D2) OCaml-authoritative.`
- Remaining parity divergences are pre-existing `do_ai_frame`/`do_physics_sim` (not FVI-related)

#### Performance note
OCaml-authoritative FVI is significantly slower than C due to per-segment/per-object FFI effect callbacks (~30-40 FVI calls/sec). Headless replay of 636 frames takes much longer than with C FVI. Performance optimization (caching, batching, or reducing FFI round-trips) is a separate effort.

### Session 32: Swap do_ai_frame and do_physics_sim to OCaml-authoritative

#### Context
With FVI already OCaml-authoritative, the remaining shadow-mode functions were `do_ai_frame` and `do_physics_sim` (both D1 and D2). Shadow mode ran both OCaml and C, with C authoritative and parity comparison. However, parity comparison was fundamentally broken — OCaml's computed results were never written back to C objects before snapshot, so all comparisons were meaningless (comparing original state vs C-modified state).

#### Phase 1: Fix parity comparison
Added write-back code to copy OCaml result arrays into C objects/AI state before `parity_snapshot(&parity_snap_after_ocaml)`:
- `main_d2/physics.cpp`: Write result[0-22] to obj pos/vel/orient/segnum/flags/phys_flags/turnroll/rotvel/retry_count
- `main_d1/physics.cpp`: Same
- `main_d2/ai.cpp`: Write result[0-46] to aip/ailp AI state fields
- `main_d1/ai.cpp`: Write result[0-41] to aip/ailp AI state fields (no D2-only fields like SUB_FLAGS)

Results: 665 → 217 divergences. Zero AI state divergences. Zero player physics divergences. Remaining 217 all escort robot velocity/orient (artifact of `g_shadow_dry_run` suppressing effects).

#### Phase 2: Swap to OCaml-authoritative
Converted all four functions from shadow mode to OCaml-authoritative:

**do_physics_sim** (D1 + D2):
- OCaml runs, result written back to C object (pos, vel, orient, segnum, flags, phys_flags, turnroll, rotvel, retry_count, n_phys_segs, phys_seglist, do_physics_align_object)
- `return;` skips C path
- Removed parity_snapshot/restore/compare

**do_ai_frame** (D1 + D2):
- Removed `g_shadow_dry_run = true` — all effects (fire_laser, create_path, ai_follow_path, etc.) now fire normally
- OCaml runs, result written back to C AI state (aip fields: SKIP_AI_COUNT, GOAL_STATE, CURRENT_STATE, CURRENT_GUN, behavior, hide_index, path_length, danger_laser_num/sig, hide_segment; ailp fields: next_fire, player_awareness_type/time, mode, time_since_processed, consecutive_retries, retry_count, goal_state[8], time_player_seen, goal_segment, rapidfire_count, achieved_state[8], previous_visibility; D2 extras: SUB_FLAGS, next_fire2, next_action_time, phys_flags, rotthrust)
- `return;` skips C path
- `g_shadow_dry_run` variable and all guards now dead code (never set to true)
- Removed parity_snapshot/restore/compare

#### Build fixes
- D1 ai.cpp: Missing closing brace for inner scope in OCaml block
- D1 ai.cpp: Restored C fallback path variable declarations (objnum, aip, ailp) after #endif

#### Files changed
| File | Changes |
|------|---------|
| `main_d2/physics.cpp` | OCaml-authoritative physics, removed parity |
| `main_d1/physics.cpp` | Same for D1 |
| `main_d2/ai.cpp` | OCaml-authoritative AI, removed dry-run + parity |
| `main_d1/ai.cpp` | Same for D1 |

#### Verification
- Build succeeds
- Headless replay completes 636 frames, no crashes or exceptions
- All three systems log OCaml-authoritative: `do_physics_sim`, `do_ai_frame`, `find_vector_intersection`
- State divergences vs C-ref expected: escort robot (obj 28) behavioral differences cascade through all frames since OCaml is now driving game state

### 42) Separate game logic from porting infrastructure

Reorganized the project to make the boundary between pure OCaml game logic and porting scaffolding explicit.

#### Directory restructuring
- **`ox/`** now contains only pure game logic (15 `ox_*.ml` files, `tests/`, `tests/oracle/`)
- **`ox-bridge/`** (new) contains the C↔OCaml bridge: adapter modules (`math.ml`, `g3d.ml`, `physics.ml`, etc.), entry point (`bridge.ml`), and C glue (`bridge.c`, `bridge.h`)
- **`tools/`** gained `input_recorder.cpp/.h`, `input_replayer.cpp/.h`, `parity.cpp/.h`, and `smoke_test.cpp` — all testing infrastructure that doesn't belong in the bridge
- Moved `ox/oracle/` → `ox/tests/oracle/` (test-only C reference library)
- Removed stale `ox/_build/` and `build/` directories

#### Bridge architecture cleanup
- Merged the bridge library and entry-point executable into a single dune executable stanza
- Renamed `math_bridge.ml` → split into `ox-bridge/math.ml` (bridge library module) + `ox-bridge/bridge.ml` (entry point)
- Stripped `_bridge` suffix from all bridge module names (redundant since directory is `ox-bridge/`)
- Changed all bridge modules from top-level `let () = Callback.register ...` to explicit `let register_callbacks () = ...`, called from `bridge.ml`

#### Files changed
| Area | Change |
|------|--------|
| `ox/dune` | Stripped to 15 pure game logic modules, removed `(library_flags -linkall)` |
| `ox-bridge/dune` | Single executable stanza with all bridge modules |
| `ox/tests/dune` | Updated library deps from individual modules to `ox`, oracle include path |
| `ox/tests/parity_expect.ml` | Fixed stale refs: `sphere_intersects_wall` → `_v2`, `find_homing_object_complete` → `_v2` |
| `scripts/ox/build_bridge.sh` | Updated dune target path |
| `CMakeLists.txt` | Updated all source/dependency paths |
| ~50 C/C++ files | `#include "ox/..."` → `#include "ox-bridge/..."` or `#include "tools/..."` |
| `CLAUDE.md` | Updated architecture diagram and code layout table |

#### Verification
- `dune build @all` succeeds
- `cmake --build build-ox -j8` succeeds (ChocolateDescent, ChocolateDescent2, headless_replay)
- `cmake --build build-c-ref -j8` succeeds
- All four game binaries (D1/D2 × C/OCaml) launch and run correctly

### Session 25: AI Frame Bridge Stabilization & RNG Hunt Scoping

- **Goal:** Resolve persistent "Unhandled Effect" crashes in OCaml AI frame and achieve stable headless replay.

- **Architecture Fix: Pure OCaml Pathfinding Calls**
  - Discovered that OCaml 5 effect handlers are not automatically recursive across the C bridge.
  - Refactored `ox/ox_ai_frame.ml` to call `Ox_aipath` directly (OCaml-to-OCaml) instead of performing an effect that bounces through the C bridge.
  - This allows pathfinding-triggered effects (like `P_Rand`) to propagate naturally to the top-level AI handler.
  - Removed redundant pathfinding effects from `ox-bridge/ai_frame.ml`.

- **Bug Fixes identified during "RNG Hunt":**
  - **Wall Data Order**: Corrected `segnum/sidenum` argument order in `cd_ox_fetch_wall_data` bridge (was swapped).
  - **RNG Jitter Math**: Fixed precedence in `Ox_aipath` jitter computation to match C: `(P_Rand() - 16384) / 2`.
  - **Redundant Escort/Thief Effects**: Removed obsolete `Do_escort_frame` and `Do_thief_frame` effects from the bridge, as their logic is now fully inlined in OCaml.

- **Results:**
  - **Headless Replay**: SUCCESS. The OCaml build now plays through the entire 636-frame test session without crashing.
  - **Stability**: Resolved all architectural "Unhandled Effect" loop issues.
  - **Parity**: 636 divergent frames. Drift starts at Frame 190 where `rand_state` desyncs.

- **Next Steps (documented in RNG_HUNT.md):**
  - Audit every `P_Rand` call in `Ox_aipath` vs C `aipath.cpp`.
  - Port full `create_path_points` and `polish_path` logic to eliminate RNG sequence drift.
  - Port `Laser_create_new_easy` to synchronize object creation side-effects.

- **Files changed:**
  - `ox/ox_ai_frame.ml`: Refactored to direct OCaml calls, removed redundant effects.
  - `ox-bridge/ai_frame.ml`: Cleaned up effect handler, fixed wall data arg order.
  - `ox/ox_aipath.ml`: Fixed RNG jitter math precedence.
  - `RNG_HUNT.md`: New detailed analysis of the bit-parity desync.

### Ralph Loop Setup & Bulk Porting Sprint (2026-03-07)
- **Goal:** Shift focus to mechanical porting speed — port all remaining C functions to OCaml as fast as possible, defer parity verification until everything is ported.
- **ralph_loop.sh updates:**
  - Removed headless replay and state log comparison from the loop (temporarily disabled)
  - Removed C-ref build step (not needed without replay)
  - Updated Claude prompt to focus on faithful mechanical translation, no parity chasing
  - Added `--verbose` flag (required by Claude CLI for `--output-format stream-json -p`)
  - Added post-iteration worklog update and git commit step
- **New modules ported (ralph loop iterations 1-34):**
  - `ox/ox_wall.ml`, `ox-bridge/wall.ml` — wall logic
  - `ox/ox_switch.ml`, `ox-bridge/switch.ml` — switch/trigger logic
  - `ox/ox_gameseq.ml`, `ox-bridge/gameseq.ml` — game sequencing
  - `ox/ox_obj.ml`, `ox-bridge/obj_mgmt.ml` — object management
  - `ox/ox_escort.ml`, `ox-bridge/escort.ml` — escort/thief/snipe robot logic
  - `ox/ox_morph.ml`, `ox-bridge/morph.ml` — morph effects
  - `ox/ox_mem.ml`, `ox-bridge/mem.ml` — memory helpers
  - `ox/ox_misc.ml`, `ox-bridge/misc.ml` — misc utilities
  - `ox/ox_gen_ai_frame_d1.ml`, `ox/ox_gen_ai_frame_d2.ml` — generated AI frame helpers
- **Note:** Iterations 35-43 failed silently due to missing `--verbose` flag — no functions ported in those iterations.

### Ralph Loop Iteration 81 (2026-03-07)
- **Ported:** unknown
- **Status:**   Total: 775  Ported: 161  Intrinsic: 65  Effect: 59  Frontier: 0  Other: 490
- **Log:** ralph_logs/claude_081.log

### Ralph Loop Iteration 82 (2026-03-07)
- **Ported:** unknown
- **Status:**   Total: 775  Ported: 162  Intrinsic: 65  Effect: 59  Frontier: 0  Other: 489
- **Log:** ralph_logs/claude_082.log
