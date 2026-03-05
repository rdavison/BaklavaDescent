# RNG Hunt: Analysis of AI/Movement Desync

## Current Status (March 5, 2026)
- **Architecture**: STABLE. The "Unhandled Effect" crash loop is resolved.
- **Mechanism**: `Ox_ai_frame` now calls `Ox_aipath` directly (OCaml-to-OCaml), bypassing the bridge for nested logic. Effects propagate naturally to the main game loop handler.
- **Behavior**: Robots are ACTIVE and AUTONOMOUS. OCaml is driving AI, Physics, and Pathfinding.
- **Parity**: 100% Divergent frames after Frame 190.

## The "Smoking Gun": Frame 190
At Frame 190, the state logs show the first catastrophic desync:
- `rand_state`: A=251927802 B=1076780296
- `Overall_agitation`: A=16 B=8
- `Highest_object_index`: A=136 B=238

### Analysis
1. **RNG Sequence Drift**: The massive difference in `rand_state` confirms that OCaml and C are calling `P_Rand()` a different number of times or in a different order. Since the AI uses randomness for firing accuracy, movement jitter, and mode transitions, once the RNG drifts, the "realities" of the two builds diverge permanently.
2. **Object Count Divergence**: `Highest_object_index` (A=136 B=238) suggests that one build is creating many more objects (likely lasers or flares) than the other. This is a direct consequence of the RNG drift (e.g., a robot deciding to fire in OCaml but not in C).
3. **Agitation Desync**: OCaml's AI thinks the player is twice as "scary" (Agitation 16) as C's AI does (Agitation 8). This suggests a divergence in how `ai_multiplayer_awareness` or agitation-increment logic is being processed.

## Suspected Root Causes
1. **Pathfinding Jitter**: OCaml's `Ox_aipath` implements jitter using `P_Rand`. If the call count doesn't exactly match C's `aipath.cpp` (especially in `create_path_points`), the sequence will drift every time a path is created.
2. **Stubbed Logic**: OCaml currently has stubs for `create_path_points` and `polish_path`. In C, these functions are complex and perform multiple RNG calls.
3. **Fixed-Point Precision**: While we use 32-bit fixed point, small differences in trig lookups or normalization (`vm_vec_normalize_quick`) might cause a robot to be slightly further away in one build, triggering a visibility check or firing event that the other build misses.

## Execution Plan for Parity
1. **Audit P_Rand Calls**: Systematically compare `ox/ox_aipath.ml` against `main_d2/aipath.cpp`. Every `if (P_Rand() < ...)` must be mirrored exactly.
2. **Port `create_path_points`**: Replace the OCaml stub with a full port of the C logic to ensure identical RNG usage during path generation.
3. **Port `polish_path`**: This function "smooths" the paths. Without it, OCaml robots fly "jagged" paths, leading to the "buggy" look and immediate positional divergence.
4. **Synchronize Side Effects**: Port `Laser_create_new_easy` fully to OCaml to ensure object creation is deterministic across both builds.

## Key Files
- `ox/ox_ai_frame.ml`: Main AI loop (OCaml authoritative).
- `ox/ox_aipath.ml`: Pathfinding logic (Source of most RNG calls).
- `ox-bridge/ai_frame.ml`: Flat effect handler (Stable).
- `main_d2/aipath.cpp`: C reference for pathfinding.
- `main_d2/ai.cpp`: C reference for AI.
