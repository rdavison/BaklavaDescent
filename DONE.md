# ChocolateDescent OxCaml Port — Complete

The incremental OxCaml port has reached its natural endpoint. All functions that are suitable for the packed-data bridge architecture have been ported and tested.

## What was ported (~115 functions)

- **Fixed-point math & vectors** — all vecmat functions (i2f/f2i, fixmul/fixdiv, trig, vector ops, matrix ops)
- **3D pipeline** — point coding, rotation, projection, clipping, facing checks, rod corners
- **Game segments** — center computation, vertex lists, seg masks, side dists, wall creation, normals, connectivity, shortpos
- **FVI (find vector intersection)** — plane/line intersection, point/sphere-to-face, line-to-face, sphere-to-object
- **Physics** — rotation sim, turn-towards, force/rot application, gun point, alignment, thrust, turnroll
- **Collision & damage** — robot/clutter/controlcen/player damage (with algebraic effects), weapon kill, laser relatedness, best gun, chase angles
- **AI** — turn/move towards vector, move around/away from player, fire timing, behavior-to-mode, turn randomly, door openability, openable door scanning, lead player
- **Robot animation** — anim state lookup, state setting, joint angle computation
- **Lighting** — headlight computation (D1 + D2)
- **Curves** — create, evaluate, distance, direction
- **Endlevel** — chase angles interpolation

## Why the remaining functions are not portable

The bridge architecture packs all needed data as scalars or flat int arrays at the C callsite, calls OCaml, and returns results. This works excellently for pure computational functions but breaks down for:

1. **Recursive segment traversals** (`sphere_intersects_wall`, `find_point_seg`, `fvi_sub`, `find_vector_intersection`) — these walk the segment graph recursively, discovering which segments to visit at runtime. Each step needs data from `Segments[]`, `Vertices[]`, `Walls[]` that can't be pre-packed.

2. **Frame-level update loops** (`do_ai_frame`, `do_physics_sim`, `do_controlcen_frame`) — these read and write 30+ global variables, call dozens of other functions, and orchestrate entire subsystems.

3. **Collision event handlers** (`collide_robot_and_weapon`, `collide_player_and_powerup`, etc.) — these are dispatchers that trigger chains of side effects (sound, HUD, networking, object creation/deletion).

4. **Object lifecycle** (`obj_create`, `obj_delete`, `obj_link`/`obj_relink`) — direct manipulation of global object arrays and segment linkage lists.

5. **Out-of-scope subsystems** — rendering, networking/multiplayer, HUD/UI, sound, file I/O, input handling.

## Architecture

The bridge follows a strict pattern:

```
ox_<module>.ml          Pure OCaml logic
    ↓
<module>_bridge.ml      Pack/unpack bridge (Callback.register)
    ↓
bridge.c                C wrappers (caml_callback/caml_callbackN)
    ↓
bridge.h                Declarations
    ↓
main_d1/*.cpp           #ifdef USE_OX_BRIDGE callsites
main_d2/*.cpp
```

All ported functions have parity tests in `ox/tests/parity_expect.ml`.
