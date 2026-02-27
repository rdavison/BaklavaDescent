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
