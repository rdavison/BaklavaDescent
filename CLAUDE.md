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

## Architecture

```
ox/ox_<module>.ml          Pure OCaml game logic
ox/<module>_bridge.ml      Effect handlers + C externals
ox/bridge.c + bridge.h     C↔OCaml glue (caml_callback)
main_d2/*.cpp              #ifdef USE_OX_BRIDGE callsites
```

- All game values are 32-bit fixed-point integers (`F1_0 = 0x10000 = 1.0`)
- OCaml performs algebraic effects → bridge handler calls C external → C calls registered callback

All ported functions (`do_ai_frame` D1/D2, `do_physics_sim` D1/D2) use shadow mode. Parity checking (snapshot/restore/compare) is always enabled when `USE_OX_BRIDGE` is on — no separate flag needed.

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
| `USE_OX_BRIDGE` | Enable OCaml bridge (includes shadow-mode parity checking) |
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

### Test recordings
- `level1_full.rec` — Full level 1 playthrough (in game data dir)
- `test_session.rec` — Short test session (~636 frames, in project root)

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
- `-v` for verbose byte-level diffs
- Default struct sizes are for arm64 macOS (object=268, ai_local=200, player=148)
- Override with positional args: `compare_state_logs file_a file_b [obj_size] [ai_size] [player_size]`

### Key byte offsets (arm64 macOS)

**object struct** (268 bytes):
```
  0  signature (int)
  4  type (uint8)          5  id (uint8)
  6  next (short)          8  prev (short)
 10  control_type (uint8) 11  movement_type (uint8)
 12  render_type (uint8)  13  flags (uint8)
 14  segnum (short)       16  attached_obj (short)
 20  pos.x                24  pos.y                28  pos.z
 32  orient.rvec.x        36  orient.rvec.y        40  orient.rvec.z
 44  orient.uvec.x        48  orient.uvec.y        52  orient.uvec.z
 56  orient.fvec.x        60  orient.fvec.y        64  orient.fvec.z
 68  size                 72  shields
 76  last_pos.x           80  last_pos.y           84  last_pos.z
 88  contains_type        89  contains_id
 90  contains_count       91  matcen_creator
 92  lifeleft
 96  mtype.phys_info.velocity.{x=96, y=100, z=104}
108  mtype.phys_info.thrust.{x=108, y=112, z=116}
120  mtype.phys_info.mass     124  mtype.phys_info.drag
128  mtype.phys_info.brakes
132  mtype.phys_info.rotvel.{x=132, y=136, z=140}
144  mtype.phys_info.rotthrust.{x=144, y=148, z=152}
156  mtype.phys_info.turnroll  158  mtype.phys_info.flags
160  ctype.ai_info (ai_static union)
162  ctype.ai_info.CURRENT_STATE
163  ctype.ai_info.GOAL_STATE
192  rtype (polyobj_info / vclip_info union)
```

**ai_local struct** (200 bytes):
```
  0  player_awareness_type (int)
 12  mode (int)
 28  next_action_time (fix)
 40  player_awareness_time (fix)
 56  time_since_processed (fix)
```

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
