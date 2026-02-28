# Functions That Break the Established Porting Pattern

These functions were evaluated for porting but break the established pure-computation/scalar-bridge pattern in various ways.

## Too Entangled with Global State

These functions access complex global arrays (Objects[], Segments[], Players[], Robot_info[], Walls[], etc.) in ways that can't be cleanly extracted as scalar args at the callsite.

- ~~**`do_physics_align_object`**~~ — **PORTED** (worklog #22). Used packed 54-int array to extract segment normals at callsite.

- **`apply_damage_to_robot` D2** (D2 collide.cpp) — Much more complex than D1 version. Has boss final-level hacks (`Current_mission_num`, `Current_level_num`, `Last_level`, `multi_all_players_alive()`), companion/buddy invulnerability, thief robot `Stolen_items[]` save/restore, `multi_explode_robot_sub()` + `multi_send_robot_explode()`, `special_reactor_stuff()`, smart blob creation, kamikaze handling. The effect-tree pattern from D1 would need significant expansion.

- ~~**`compute_headlight_light` D1+D2**~~ — **PORTED** (worklog #24). Globals extracted as scalar args at callsite.

- ~~**`check_vector_to_object`**~~ — **PORTED** (worklog #23). Scalar args extracted at callsite; delegates to already-ported `check_vector_to_sphere_1`.

- **`compute_light_intensity`** (D2 lighting.cpp) — ~120 lines, reads Objects[], Players[], Vclip[], Robot_info[], Powerup_info[], Weapon_info[] to determine light intensity based on object type and state.

- **`find_homing_object` / `find_homing_object_complete`** (D1+D2 laser.cpp) — Scans rendered object list, checks Game_mode, Player_num, visibility queries via FVI system.

- **`player_is_visible_from_object`** (D1+D2 ai.cpp/ai2.cpp) — Calls `find_vector_intersection()` which modifies globals (Hit_type, Hit_data, Hit_pos, Hit_seg).

- **`ai_door_is_openable` / `openable_doors_in_segment`** (D1+D2 ai.cpp/ai2.cpp) — Reads Walls[] global array, WallAnims[], key flags.

## Have Side Effects

These functions modify game state beyond their return values.

- ~~**`set_next_fire_time`** (D1+D2)~~ — **PORTED** (worklog #24). Returns new values instead of mutating struct fields.

- **`do_robot_dying_frame`** (D2 ai2.cpp) — Plays sounds (`digi_link_sound_to_object2`), creates fireballs (`create_small_fireball_on_object`), modifies rotvel. D1 version doesn't exist as separate function.

- **`bump_one_object` / `bump_two_objects`** (D1+D2 collide.cpp) — Call `phys_apply_force()` and `bump_this_object()` which modify object physics state.

- **`apply_force_damage`** (D1+D2 collide.cpp) — Dispatches to `apply_damage_to_robot`, `apply_damage_to_player`, etc.

## Trivially Small

Not worth the bridge overhead (3 lines or less of logic, wrapping already-ported primitives).

- **`check_and_fix_matrix`** (D1+D2 physics.cpp) — 3 lines: calls `vm_vector_2_matrix()` (already ported). Already used as internal helper in `ox_physics.ml`.

- ~~**`ai_behavior_to_mode`** (D1+D2)~~ — **PORTED** (worklog #25). Pure switch/enum mapping.

- ~~**`get_explosion_vclip`** (D1+D2 fireball.cpp)~~ — **PORTED** (worklog #26). Simple lookup based on object type.

## Already Internal Helpers

These are already implemented in OCaml as internal helpers within existing ported functions.

- **`physics_set_rotvel_and_saturate`** (D1+D2 physics.cpp) — Inlined in `physics_turn_towards_vector` OCaml port. Also used as `set_rotvel_and_saturate` in `ai_turn_towards_vector`.

- **`oflow_check` / `calc_det_value` / `check_line_to_line` / `find_plane_line_intersection`** (D1+D2 fvi.cpp) — All internal to `ox_fvi.ml`, used by `check_line_to_face` implementation.

- **`check_point_to_face` / `check_sphere_to_face`** (D1+D2 fvi.cpp) — Internal to `ox_fvi.ml`.

## D1-Only (No D2 Equivalent)

- ~~**`ai_turn_randomly`** (D1 ai.cpp)~~ — **PORTED** (worklog #25). Returns new rotvel; P_Rand/cheat shortcut stays at callsite.

## Complex Data Dependencies

- **`find_min_max`** (D1+D2 morph.cpp) — Iterates over polymodel vertex data via pointer arithmetic on model bytecode. Would need polymodel data serialized as flat arrays.

- **`check_transparency`** (D1+D2 wall.cpp) — Looks up `GameBitmaps[Textures[texture_num]].bm_flags` — deep texture pipeline dependency.
