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
