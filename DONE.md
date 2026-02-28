# Pure Computation Porting Phase — Assessment of Work Remaining

## Summary

The pure-computation porting phase is **effectively complete**. All functions in the ChocolateDescent codebase that can be cleanly extracted as pure scalar/vector computations following the established bridge pattern have been ported to OxCaml with parity tests.

## What Was Ported (23 Worklog Entries)

### Core Math Layer
- **Fixed-point arithmetic**: i2f, f2i, fixmul, fixdiv, fix_sqrt, fix_isqrt, fix_asin, fix_acos, fix_atan2, fix_sincos, fix_fastsincos
- **Vector/matrix math**: All vm_vec_* (add, sub, scale, dot, cross, normalize, mag, dist, rotate, perp, avg, etc.), All vm_matrix_* (angles_2_matrix, vec_ang_2_matrix, transpose, matrix_x_matrix, vector_2_matrix, extract_angles, delta_ang), quick variants
- **Curves**: create_curve, evaluate_curve, curve_dist, curve_dir

### 3D Pipeline
- **Points**: g3_code_point, g3_rotate_point, g3_project_point, g3_rotate_delta_x/y/z, g3_calc_point_depth, g3_point_2_vec, g3_start_instance_matrix
- **Clipping**: clip_edge, clip_line, clip_polygon
- **Geometry**: checkmuldiv, scale_matrix, do_facing_check_computed, g3_check_normal_facing, calc_rod_corners

### Game Geometry
- **Segment math**: compute_center_point_on_side, compute_segment_center, get_verts_for_normal, create_abs_vertex_lists, get_seg_masks, get_side_dists, extract_vector_from_segment, extract_orient_from_segment

### Physics/Collision
- **FVI**: check_line_to_face, special_check_line_to_face, check_vector_to_sphere_1, check_vector_to_object
- **Collide**: apply_damage_to_robot_d1
- **Physics**: physics_turn_towards_vector, phys_apply_force, phys_apply_rot, do_physics_sim_rot, calc_gun_point, set_object_turnroll, do_physics_align_object

### AI
- **Movement**: ai_turn_towards_vector, set_thrust_from_velocity, move_towards_vector, move_around_player, move_away_from_player
- **Targeting**: lead_player, compute_lead_component

### Weapons
- **Homing**: homing_missile_turn_towards_velocity

## What Remains (See SKIP_ME_FOR_NOW.md)

All remaining unported functions break the established pattern in one or more ways:

1. **Global state entanglement** (~8 remaining functions): Access Objects[], Segments[], Players[], Robot_info[], Walls[], GameBitmaps[] etc. `do_physics_align_object` and `check_vector_to_object` were ported using packed-array and scalar-extraction patterns respectively. Remaining examples: `apply_damage_to_robot` D2, `compute_headlight_light` D2.

2. **Side effects** (~5 functions): Modify game state, play sounds, create objects. Examples: `set_next_fire_time`, `do_robot_dying_frame`, `bump_one_object`.

3. **Already internal** (~7 functions): Already implemented as OCaml helpers inside existing ports. Examples: `physics_set_rotvel_and_saturate` (inside physics_turn_towards_vector), FVI sub-functions (inside check_line_to_face).

4. **Trivially small** (~3 functions): 1-3 lines wrapping already-ported primitives. Not worth bridge overhead.

## Possible Next Steps (Beyond Pure Computation)

To port more functions, the project would need to evolve beyond the current "pass-through bridge" pattern:

- **Packed-struct bridge**: Pass entire object/segment structs as flat int arrays (already done for `calc_gun_point` with 86-int packed array). Could extend this for `do_physics_align_object` (pass 6 side normals as 36 ints).

- **Extended effect trees**: The D1 `apply_damage_to_robot` uses an effect-tree return type. D2's version would need a much richer effect vocabulary (boss hacks, thief handling, multiplayer sync, special reactor, smart blobs, kamikaze).

- **State monad / world passing**: For functions that read AND write global state, a state-passing approach where OCaml receives and returns the relevant slice of game state.

- **Higher-level function porting**: Port entire subsystems (e.g., AI frame logic, physics simulation loop) rather than individual functions. This requires moving more game state management into OCaml.
