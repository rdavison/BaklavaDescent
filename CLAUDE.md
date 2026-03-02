# ChocolateDescent

A source port of Descent 1 & 2 with an incremental OCaml rewrite of game logic via an algebraic effects bridge.

## Project Goal

Port all C game logic to OCaml incrementally, function by function, while maintaining identical behavior verified through parity testing. The OCaml code uses algebraic effects to call back into C for side effects (sound, rendering, object creation, etc.).

## Architecture

```
ox/ox_<module>.ml          Pure OCaml game logic
ox/<module>_bridge.ml      Effect handlers + C externals
ox/bridge.c + bridge.h     C↔OCaml glue (caml_callback)
main_d2/*.cpp              #ifdef USE_OX_BRIDGE callsites
```

- All game values are 32-bit fixed-point integers (`F1_0 = 0x10000 = 1.0`)
- OCaml performs algebraic effects → bridge handler calls C external → C calls registered callback
- "Effect-wins" write-back: after OCaml returns, fields modified by C effects during the call keep their C values; unmodified fields get OCaml's values

**Important pattern:** Effects that call C functions reading `Ai_local_info` (or other global state) must write back any OCaml modifications first. For example, `Do_thief_frame` writes back `player_awareness_type` and `Do_snipe_frame` writes back `mode` before calling the C function.

## Building

### OCaml bridge (must be built first)
```bash
cd ox && sh ../scripts/ox/build_bridge.sh
```
File order in `build_bridge.sh` is critical and must match `CMakeLists.txt`.

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
| `USE_OX_BRIDGE` | Enable OCaml bridge |
| `OX_PARITY_CHECK` | Dual-execution parity checking (requires USE_OX_BRIDGE) |
| `OX_REPLAY` | Input record/replay for parity testing |

## Running

### Launch the game
```bash
open build-ox/ChocolateDescent2.app    # Descent 2
open build-ox/ChocolateDescent.app     # Descent 1
```

### Game data directory
The game looks for data files (`.hog`, `.pig`, etc.) in:
- macOS: `~/Library/Application Support/Chocolate Descent/Descent 2/Data/`
- Or run from a directory containing `descent2.hog`

For headless replay, `cd` into the data directory before running.

### Crash reports (macOS)
```bash
ls -t ~/Library/Logs/DiagnosticReports/ChocolateDescent2* | head -3
```
Parse the `.ips` JSON to get stack traces. The faulting thread's frames include `symbol`, `sourceFile`, and `sourceLine`.

## Parity Testing Workflow

### 1. Record an input session
```bash
cd <game-data-dir>
<build-dir>/ChocolateDescent2.app/Contents/MacOS/ChocolateDescent2 -record test_session.rec
```
Play the game normally, then quit. Inputs are saved to `test_session.rec`.

### 2. Replay through both builds and generate state logs
```bash
cd <game-data-dir>

# OCaml build
<project>/build-ox/headless_replay -replay test_session.rec -state-log /tmp/ox_states.bin

# C-only build
<project>/build-c-ref/headless_replay -replay test_session.rec -state-log /tmp/c_states.bin
```

### 3. Compare state logs
```bash
# Build the comparison tool (built automatically with OX_REPLAY)
# Then compare:
build-ox/compare_state_logs -v /tmp/c_states.bin /tmp/ox_states.bin
```
- `-v` for verbose byte-level diffs
- Default struct sizes are for arm64 macOS (object=268, ai_local=200, player=148)
- Override with positional args: `compare_state_logs file_a file_b [obj_size] [ai_size] [player_size]`

### Key byte offsets (arm64 macOS)
- **object** byte 161 = `CURRENT_STATE`, byte 162 = `GOAL_STATE`
- **ai_local** byte 0 = `player_awareness_type`, byte 12 = `mode`, byte 28 = `next_action_time`, byte 56 = `time_since_processed`

## Code Layout

| Path | Description |
|------|-------------|
| `ox/ox_*.ml` | Pure OCaml game logic |
| `ox/*_bridge.ml` | Bridge adapters (effect handlers + C externals) |
| `ox/bridge.c`, `ox/bridge.h` | C↔OCaml glue layer |
| `ox/parity.cpp/.h` | Parity snapshot/restore/compare |
| `ox/input_recorder.cpp/.h` | Frame input recorder |
| `ox/input_replayer.cpp/.h` | Frame input replayer |
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
