# ChocolateDescent

A source port of Descent 1 & 2 with an incremental OCaml rewrite of game logic via an algebraic effects bridge.

## Project Goal

Port all C game logic to OCaml incrementally, function by function, while maintaining identical behavior verified through parity testing. The OCaml code uses algebraic effects to call back into C for side effects (sound, rendering, object creation, etc.).

## Porting Strategy: Shadow Mode

Port functions at **whole-function granularity** using a shadow/validate/swap workflow:

1. **Shadow**: OCaml runs the function with the same inputs as C, but C remains authoritative. The game always uses C's results. OCaml's output is compared against C's for validation only — no write-back into game state.
2. **Validate**: Use headless replay + state log comparison to verify OCaml produces identical outputs across full test recordings. Fix divergences until parity is perfect.
3. **Swap**: Once a function achieves frame-perfect parity, flip it to OCaml-authoritative (OCaml's results drive the game, C path removed or kept as fallback).

**Key principles:**
- Never partially port a function. If OCaml handles `do_ai_frame`, it handles *all* of it for that robot type — from skip_ai_count through flare firing. No mid-function C↔OCaml handoffs.
- No "effect-wins" write-back during shadow phase. C is always the source of truth until the swap.
- Effects still call into C for side effects (path creation, sound, etc.), but during shadow mode these are dry-runs or the C path handles them authoritatively.

## Handling Divergences

The goal is to **port C to OCaml and eventually delete the C code**. Divergences between OCaml and C are expected during the transition — they are a map of what still needs to be ported, not bugs to fix with workarounds.

**Do NOT** add sync/read-back mechanisms to shuttle C state into OCaml to hide divergences. If an OCaml effect calls a C function (e.g., `create_path_to_player`) that mutates C state (e.g., `hide_index`, `path_length`, `mode`), and OCaml overwrites those mutations with its own stale values — that divergence is correct and expected. It tells us `create_path_to_player` needs to be ported to OCaml.

**Do** use divergences to identify the next functions to port. The fix for a divergence is always: port the underlying C function to OCaml, not bridge more C state back into OCaml.

## Architecture: OCaml Bridge

```
ox/ox_<module>.ml              Pure OCaml game logic
ox-bridge/<module>.ml          Effect handlers + C externals
ox-bridge/bridge.c + bridge.h  C↔OCaml glue (caml_callback)
main_d2/*.cpp                  #ifdef USE_OX_BRIDGE callsites
```

- **Core Logic**: Pure game logic in `ox/ox_*.ml` (dune library `ox`).
- **Bridge Adapters**: `ox-bridge/*.ml` use `Effect.Deep.match_with` to handle logic-requested side effects via C externals.
- **Entry Point**: `ox-bridge/bridge.ml` calls `register_callbacks()` on each bridge module to link OCaml handlers to C.
- **Fixed-Point**: All game values are 32-bit fixed-point integers (`F1_0 = 0x10000 = 1.0`).
- **Pattern**: OCaml performs algebraic effects → bridge handler calls C external → C external calls registered callback.

### OCaml-Authoritative Mode (Current State)
As of 2026-03-03, several core functions are OCaml-authoritative (OCaml's results drive the game, C path kept as fallback):
- `do_ai_frame` (D1/D2)
- `do_physics_sim` (D1/D2)
- `find_vector_intersection` (D1/D2)

OCaml bridge functions include `exnc` handlers to catch exceptions and return dummy data/arrays to prevent the game process from crashing on OCaml errors.

### Collision Handler Architecture (Phase 1)
- `ox_collide.ml`: Implements bump functions and simple collision handlers.
- `ox-bridge/physics_sim.ml`: `Collide_two_objects` handler fetches collision data from C (48-field packed int array), attempts OCaml dispatch, and falls back to C for unported handlers.
- **Ported Handlers**: robot+robot, player+player, player+clutter, player+controlcen, robot+controlcen.

### FVI (Find Vector Intersection) Architecture
- **On-Demand Effects**: All FVI functions use v2 on-demand effects (`Fetch_segment_data`, `Fetch_object_data`, `Fetch_collision_table`).
- **Performance**: No more upfront world-packing; performance is O(segments_visited) instead of O(total_world).
- **Callback Registration**: FVI data callbacks must be registered before use. `find_vector_intersection` handles this on first call, but `compute_vis_and_vec` and `player_is_visible_from_object` require `ensure_fvi_data_callbacks_registered()` for early registration.

## Building

### OCaml bridge (must be built first)
```bash
cd ox && sh ../scripts/ox/build_bridge.sh
```
`dune` builds `ox-bridge/bridge.exe.o` (single object with OCaml runtime baked in), which CMake then links into the game binary.

### Game (OCaml bridge build)
```bash
cmake -DUSE_OX_BRIDGE=ON -DOX_REPLAY=ON -S . -B build-ox
cmake --build build-ox -j8
```

### C-only reference build (for parity comparison)
```bash
cmake -DUSE_OX_BRIDGE=OFF -DOX_REPLAY=ON -S . -B build-c-ref
cmake --build build-c-ref -j8
```

### CMake flags
| Flag | Description |
|------|-------------|
| `USE_OX_BRIDGE` | Enable OCaml bridge (includes shadow-mode parity checking) |
| `OX_REPLAY` | Input record/replay for parity testing |

## Running

### Launch the game
```bash
open build-ox/ChocolateDescent2.app    # Descent 2
open build-ox/ChocolateDescent.app     # Descent 1
```

### Game data directory
The game looks for data files (`.hog`, Level .pig, etc.) in:
- macOS: `~/Library/Application Support/Chocolate Descent/Descent 2/Data/`
- Or run from a directory containing `descent2.hog`

Our actual data directory: `/Users/richard/Documents/Games/Descent 2 Infinite Abyss Expansion (1996)(Interplay)/data/`

For headless replay and recording, `cd` into the data directory before running.

### Crash reports (macOS)
```bash
ls -t ~/Library/Logs/DiagnosticReports/ChocolateDescent2* | head -3
```
Parse the `.ips` JSON to get stack traces. The faulting thread's frames include `symbol`, `sourceFile`, and `sourceLine`.

## Parity Testing Workflow

### 1. Record an input session
Record from the **C-only reference build** so the recording captures correct C behavior:
```bash
cd <game-data-dir>
<project>/build-c-ref/ChocolateDescent2.app/Contents/MacOS/ChocolateDescent2 -record session.rec
```
Play the game normally, then quit. Inputs are saved to `session.rec`.

**Note:** The game arg parser mangles absolute paths (leading `/` becomes `-`). Always use relative filenames and `cd` into the data directory first.

### 2. Replay through both builds and generate state logs
```bash
cd <game-data-dir>

# OCaml build
<project>/build-ox/headless_replay -replay session.rec -state-log /tmp/ox_states.bin

# C-only build
<project>/build-c-ref/headless_replay -replay session.rec -state-log /tmp/c_states.bin
```
`headless_replay` uses its own arg parser, so absolute paths work for `-state-log`.

### 3. Compare state logs
```bash
<project>/build-ox/compare_state_logs -v /tmp/c_states.bin /tmp/ox_states.bin
```

### Environment Variables
- `OX_PARITY_ASSERT=1`: Crash on divergence during shadow mode.
- `OX_PARITY_LOG=file`: Log divergences to a specific file.

## Known Issues
- **Headless replay slow in shadow mode**: OCaml FVI runs real computation via on-demand effects. Shadow mode doubles the work. ~37 CVV calls/sec → 636-frame replay takes ~57 min. Consider disabling shadow parity for FVI-heavy functions.

## Debug Notes (OCaml)
- **Buffering**: `Printf.eprintf` is buffered; always add `Out_channel.flush stderr` after each call.
- **Core Library**: Prefer `Exn.to_string` over `Printexc.to_string`.
- **Arrays**: Use `Array.create ~len:n v` instead of `Array.make n v`.

## Code Layout

| Path | Description |
|------|-------------|
| `ox/ox_*.ml` | Pure OCaml game logic |
| `ox-bridge/<module>.ml` | Bridge adapters (effect handlers + C externals) |
| `ox-bridge/bridge.c`, `ox-bridge/bridge.h` | C↔OCaml glue layer |
| `tools/parity.cpp/.h` | Parity snapshot/restore/compare |
| `tools/input_recorder.cpp/.h` | Frame input recorder |
| `tools/input_replayer.cpp/.h` | Frame input replayer |
| `main_d2/ai.cpp` | D2 AI frame (bridge callsite + C-only path) |
| `main_d2/ai2.cpp` | D2 AI helpers (do_silly_animation, do_snipe_frame bridge) |
| `main_d2/escort.cpp` | D2 escort/thief/snipe robot logic |
| `tools/headless_replay.cpp` | Headless replay binary (no graphics/audio) |
| `tools/headless_stubs.cpp` | Platform no-op stubs for headless build |
| `tools/compare_state_logs.c` | Offline state log comparison |
| `scripts/ox/build_bridge.sh` | OCaml bridge build script |
| `worklog.md` | Detailed session-by-session development log |

## D1 vs D2 Differences

- D2 has additional AI modes: snipe (AIM_SNIPE_*), thief (AIM_THIEF_*), escort
- D2 has `AIB_SNIPE=0x84` where D1 had `AIB_FOLLOW_PATH`; `AIM_BEHIND=5` where D1 had `AIM_HIDE`
- Guard with `#ifdef BUILD_DESCENT2` in C++, check `is_d2` flag in OCaml bridge calls
- D1 stubs in `main_d1/ai.cpp` pass no-op lambdas for D2-only effects

## Porting Workflow: Call Graph Frontier

The port is driven by a static-analysis call graph that identifies which C functions to port next.

### Tooling

- **`scripts/gen_callgraph.py`** — Compiles 23 game logic C++ files to LLVM IR, extracts a call graph (775 functions, 2461 edges), and produces `callgraph/porting.json` with frontier analysis.
- **`scripts/ralph_loop.sh`** — Automated loop: regenerate frontier → port easiest function → build → replay → compare → repeat.

### Function Categories

Every function in the call graph is one of:
- **Ported** — Implemented in OCaml, listed in `PORTED_FUNCTIONS` dict in gen_callgraph.py
- **Intrinsic** — Math/debug helpers already in OCaml (`fixmul`, `vm_vec_*`, etc.), listed in `INTRINSICS`
- **Effect** — Intentionally remain as C calls via algebraic effects (global state: sound, rendering, multiplayer), listed in `EFFECT_FUNCTIONS`
- **Frontier** — Unported functions called by ported code, sorted by ease (fewest unported transitive deps)
- **Other** — Not yet reachable from ported code

### Porting Cycle

1. Run `python3 scripts/gen_callgraph.py` → check the frontier for the easiest targets
2. Read the C implementation of the target function
3. Port it to OCaml in the appropriate `ox/ox_*.ml` file
4. Wire up any new effects in `ox-bridge/*.ml` and `ox-bridge/bridge.c`
5. Update `scripts/gen_callgraph.py`: add to `PORTED_FUNCTIONS`, `EFFECT_FUNCTIONS`, or `INTRINSICS`
6. Build: `cd ox && sh ../scripts/ox/build_bridge.sh && cmake --build build-ox -j8`
7. Regenerate frontier → confirm it shrinks
8. Verify via headless replay + state log comparison (see Parity Testing Workflow)

### When Frontier Is Empty

When the frontier reaches 0, all functions called from ported code are handled. To continue:
- Pick a new top-level function from the "Other" category in `callgraph/porting.json`
- Port it (following the shadow/validate/swap workflow)
- Its callees will appear on the frontier automatically

### Automated Loop

```bash
./scripts/ralph_loop.sh [--max-iterations N] [--recording FILE]
```

Each iteration: regenerate frontier → invoke Claude to port easiest function → build both builds → headless replay → state log comparison → feed results to next iteration. Logs go to `ralph_logs/`.

## Core Principles

- **Simplicity First**: Make every change as simple as possible. Impact minimal code.
- **No Laziness**: Find root causes. No temporary fixes. Senior developer standards.
- **Minimal Impact**: Changes should only touch what's necessary. Avoid introducing bugs.
- **Port, Don't Bridge**: Never add sync/read-back hacks to hide divergences. The fix is always: port the C function to OCaml.
