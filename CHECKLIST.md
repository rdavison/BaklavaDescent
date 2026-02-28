# ChocolateDescent OxCaml Port Checklist

Status: ~115 functions ported, ~280 remaining game logic functions identified.

Legend: `[x]` = ported + tested, `[-]` = not portable / out of scope, `[ ]` = TODO

---

## 1. Fixed-Point Math & Vectors (vecmat/vecmat.cpp → ox_math.ml)

- [x] i2f, f2i
- [x] fixmul, fixdiv, fixmuldiv
- [x] fix_sqrt, fix_isqrt, long_sqrt, quad_sqrt
- [x] fix_sincos, fix_fastsincos
- [x] fix_acos, fix_asin, fix_atan2
- [x] vm_vec_add, vm_vec_sub, vm_vec_add2, vm_vec_sub2
- [x] vm_vec_avg, vm_vec_avg4
- [x] vm_vec_scale, vm_vec_copy_scale, vm_vec_scale_add, vm_vec_scale_add2, vm_vec_scale2
- [x] vm_vec_mag, vm_vec_mag_quick, vm_vec_dist, vm_vec_dist_quick
- [x] vm_vec_dotprod, vm_vec_dot3, vm_vec_crossprod
- [x] vm_vec_perp, vm_vec_normal
- [x] vm_vec_copy_normalize, vm_vec_normalize, vm_vec_copy_normalize_quick, vm_vec_normalize_quick
- [x] vm_vec_normalized_dir, vm_vec_normalized_dir_quick
- [x] vm_vec_rotate, vm_transpose_matrix, vm_copy_transpose_matrix, vm_matrix_x_matrix
- [x] vm_angles_2_matrix, vm_vec_ang_2_matrix
- [x] vm_vector_2_matrix, vm_vector_2_matrix_norm
- [x] vm_extract_angles_vector, vm_extract_angles_vector_normalized, vm_extract_angles_matrix
- [x] vm_vec_delta_ang, vm_vec_delta_ang_norm
- [x] vm_dist_to_plane, vm_vec_make, vm_angvec_make
- [x] bitand_i32, bitor_i32, shl_i32, asr_i32, check_vec
- [x] wrap_add_i32, fixmulaccum, fixdivquadlong, fixquadnegate, ufixdivquadlong, fixquadadjust

**Status: COMPLETE** — all vecmat functions ported.

---

## 2. 3D Pipeline (3d/*.cpp → ox_3d.ml)

### Ported
- [x] g3_code_point
- [x] g3_rotate_point
- [x] g3_project_point
- [x] g3_rotate_delta_x, g3_rotate_delta_y, g3_rotate_delta_z
- [x] g3_calc_point_depth
- [x] scale_matrix
- [x] g3_point_2_vec
- [x] g3_start_instance_matrix
- [x] clip_edge, clip_line, clip_plane, clip_polygon
- [x] g3_check_normal_facing, do_facing_check_computed
- [x] calc_rod_corners
- [x] checkmuldiv

### Unported — Rendering (requires renderer backend)
- [-] g3_draw_line — renderer integration
- [-] g3_draw_poly — renderer integration
- [-] g3_draw_tmap — renderer integration
- [-] g3_draw_sphere — renderer integration
- [-] g3_draw_rod_flat, g3_draw_rod_tmap — renderer integration
- [-] g3_draw_bitmap — renderer integration
- [-] g3_check_and_draw_poly, g3_check_and_draw_tmap — renderer integration

### Unported — Setup/State
- [-] g3_init, g3_close — global state init
- [-] g3_start_frame, g3_end_frame — frame state management
- [-] init_free_points, get_temp_point, free_temp_point — temp point pool

**Status: Core math/transform COMPLETE. Rendering out of scope.**

---

## 3. Game Segments (main_d1/gameseg.cpp → ox_gameseg.ml)

### Ported
- [x] compute_center_point_on_side
- [x] compute_segment_center
- [x] get_verts_for_normal
- [x] create_abs_vertex_lists
- [x] lookup_vpos
- [x] get_seg_masks
- [x] get_side_dists
- [x] extract_vector_from_segment
- [x] extract_orient_from_segment

### Unported — Segment Queries
- [x] find_connect_side — finds connected segment side
- [x] find_point_seg — finds segment containing a point (uses FVI)
- [x] trace_segs — traces segment path
- [x] find_connected_distance — distance between segments via connectivity

### Unported — Segment Construction/Validation
- [x] create_all_vertex_lists — vertex coordinate lists for all faces
- [x] create_all_vertnum_lists — vertex index lists
- [x] add_side_as_quad, add_side_as_2_triangles — face normal creation
- [x] create_walls_on_side — wall segment normals
- [x] check_norms — normal consistency check
- [ ] check_segment_connections — validates connectivity
- [ ] validate_segment, validate_segment_side, validate_segment_all — validation
- [ ] set_segment_depths — depth sorting

### Unported — Compression/IO
- [x] create_shortpos — compressed object position
- [x] extract_shortpos — extract from compressed position
- [x] convert_to_byte — trivial (1 line)
- [-] sign — trivial (1 line)

---

## 4. FVI — Find Vector Intersection (main_d1/fvi.cpp → ox_fvi.ml)

### Ported
- [x] find_plane_line_intersection
- [x] check_point_to_face
- [x] check_sphere_to_face
- [x] calc_det_value
- [x] check_line_to_line
- [x] check_line_to_face
- [x] special_check_line_to_face
- [x] check_vector_to_sphere_1
- [x] check_vector_to_object

### Unported
- [x] find_vector_intersection — top-level FVI dispatcher (walks segment tree, calls check_line_to_face per side)
- [x] fvi_sub — recursive FVI traversal (inlined into find_vector_intersection)
- [x] sphere_intersects_wall / object_intersects_wall — sphere-wall intersection (recursive, pre-packed segments)
- [x] check_line_to_seg_face — inlined into fvi_sub
- [x] fvi_hit_object — object checking inlined into fvi_sub

---

## 5. Physics (main_d1/physics.cpp → ox_physics.ml)

### Ported
- [x] physics_set_rotvel_and_saturate
- [x] physics_turn_towards_vector
- [x] do_physics_sim_rot
- [x] check_and_fix_matrix
- [x] set_object_turnroll
- [x] phys_apply_force
- [x] phys_apply_rot
- [x] set_thrust_from_velocity
- [x] do_physics_align_object
- [x] calc_gun_point

### Unported
- [ ] do_physics_sim — full per-object physics step (reads/writes ~30 object fields, calls FVI)
- [ ] bump_one_object — applies bump force + damage
- [ ] bump_two_objects — mutual bump between two objects
- [ ] bump_this_object — simple bump helper
- [ ] collide_object_with_wall — main wall collision handler
- [ ] scrape_object_on_wall — wall scraping effect

---

## 6. Collision & Damage (main_d1/collide.cpp → ox_collide.ml)

### Ported
- [x] apply_damage_to_robot_d1 (algebraic effects)
- [x] apply_damage_to_robot_d2 (algebraic effects)
- [x] apply_damage_to_clutter (algebraic effects)
- [x] apply_damage_to_controlcen (algebraic effects)
- [x] apply_damage_to_player_d1 (algebraic effects)
- [x] apply_damage_to_player_d2 (algebraic effects)
- [x] maybe_kill_weapon_d1, maybe_kill_weapon_d2
- [x] laser_are_related_d1, laser_are_related_d2
- [x] get_explosion_vclip
- [x] calc_controlcen_gun_point
- [x] chase_angles
- [x] calc_best_gun

### Unported — Collision Event Handlers
- [ ] collide_two_objects — top-level collision dispatcher
- [ ] collide_robot_and_robot
- [ ] collide_robot_and_controlcen
- [ ] collide_robot_and_weapon
- [ ] collide_robot_and_player — ramming attack
- [ ] collide_player_and_player
- [ ] collide_player_and_weapon
- [ ] collide_player_and_controlcen
- [ ] collide_player_and_powerup — powerup pickup
- [ ] collide_player_and_clutter
- [ ] collide_weapon_and_weapon
- [ ] collide_weapon_and_controlcen
- [ ] collide_weapon_and_clutter
- [ ] collide_weapon_and_debris
- [ ] collide_hostage_and_player — hostage pickup

### Unported — Damage Utilities
- [ ] apply_force_damage — force-based damage dispatcher
- [ ] maybe_detonate_weapon — weapon-weapon detonation check
- [ ] check_effect_blowup — explosion through segment check
- [ ] net_destroy_controlcen — network control center destruction

### Unported — Wall Collision
- [ ] collide_robot_and_wall
- [ ] collide_player_and_wall
- [ ] collide_weapon_and_wall — creates explosions
- [ ] collide_debris_and_wall

### Unported — Powerup Drops
- [ ] maybe_drop_primary_weapon_egg
- [ ] maybe_drop_secondary_weapon_egg
- [ ] drop_player_eggs — drops all powerups on death
- [ ] maybe_replace_powerup_with_energy

---

## 7. Weapons & Lasers (main_d1/laser.cpp)

### Ported
- [x] homing_missile_turn_towards_velocity
- [x] laser_are_related_d1, laser_are_related_d2
- [x] lead_player — AI lead firing solution

### Unported — Homing & Targeting
- [x] find_homing_object_complete — searches object list for homing target (with internal FVI visibility)
- [x] find_homing_object — homing target wrapper (D1+D2, uses find_homing_object_complete internally)
- [x] track_track_goal — track goal update (D1+D2, includes object_is_trackable)
- [x] object_is_trackable — trackability check (inlined into track_track_goal)
- [x] object_to_object_visibility — LOS check (inlined into find_homing_object_complete)

### Unported — Weapon Creation
- [ ] Laser_create_new — creates laser/missile object
- [ ] Laser_create_new_easy — simplified creation
- [ ] Laser_player_fire — player fires primary
- [ ] Laser_player_fire_spread — spread shot
- [ ] Laser_player_fire_spread_delay — delayed spread (D2)
- [ ] create_weapon_object — generic weapon creation (D2)
- [ ] Flare_create — creates flare (D1)

### Unported — Weapon Logic
- [ ] Laser_do_weapon_sequence — weapon animation
- [ ] do_laser_firing — laser firing logic
- [ ] do_laser_firing_player — player laser firing
- [ ] do_missile_firing — missile firing
- [ ] do_muzzle_stuff — muzzle flash

### Unported — Special Weapons (D2)
- [ ] create_smart_children — smart weapon children
- [ ] create_omega_blobs — omega weapon blobs
- [ ] delete_old_omega_blobs
- [ ] omega_charge_frame — charge animation
- [ ] do_omega_stuff — omega behavior
- [ ] release_guided_missile

---

## 8. AI System (main_d1/ai.cpp, main_d2/ai2.cpp → ox_ai.ml, ox_physics.ml)

### Ported
- [x] ai_turn_towards_vector — smooth orientation interpolation
- [x] move_towards_vector — AI movement toward goal
- [x] move_around_player — circling movement
- [x] move_away_from_player — evasion movement
- [x] set_next_fire_time_d1, set_next_fire_time_d2
- [x] ai_behavior_to_mode_d1, ai_behavior_to_mode_d2
- [x] ai_turn_randomly (D1)

### Unported — Visibility & Targeting
- [x] player_is_visible_from_object — visibility via FVI (D1+D2, combines find_point_seg + FVI in single bridge crossing)
- [x] compute_vis_and_vec — visibility ray to player (single bridge crossing, internal P_Rand, sound events returned)
- [x] object_to_object_visibility — LOS check (inlined into find_homing_object_complete)

### Ported — AI Movement
- [x] ai_move_relative_to_player — movement decision dispatcher (D1+D2, wraps move_around/away/towards internally, P_Rand state sync)
- [x] ai_path_set_orient_and_vel — path-following velocity and orientation (D1+D2, wraps ai_turn_towards_vector internally)

### Unported — AI Frame Logic
- [ ] do_ai_frame — main AI frame (massive, reads ~50 globals)
- [ ] ai_do_cloak_stuff — cloaking behavior
- [x] do_firing_stuff — firing decision dispatcher (D1+D2)
- [ ] ai_do_actual_firing_stuff — main firing logic
- [ ] maybe_ai_do_actual_firing_stuff — conditional firing

### Unported — Robot Animation
- [x] ai_frame_animation — robot model animation (D1+D2, joint angle interpolation)
- [x] do_silly_animation — animation goal/delta computation (D1+D2)
- [x] robot_get_anim_state — animation state retrieval
- [x] set_robot_state — animation state setting
- [x] robot_set_angles — joint angles from animation

### Unported — Robot Hit/Attack
- [ ] do_ai_robot_hit_attack — ramming attack
- [ ] do_ai_robot_hit — robot being hit

### Unported — Boss Management
- [ ] create_gated_robot — spawns robot in gate
- [ ] gate_in_robot — gates robot with teleport
- [ ] boss_fits_in_seg — segment fit check
- [ ] init_boss_segments — caches teleport segments
- [ ] teleport_boss — boss teleportation
- [ ] start_boss_death_sequence — boss death
- [ ] do_boss_dying_frame — boss death animation
- [ ] do_boss_stuff — main boss behavior frame
- [ ] do_super_boss_stuff — super boss (D1)
- [ ] boss_spew_robot — smart blob spawning (D2)

### Unported — Robot Death
- [ ] do_robot_dying_frame — death animation (D2)
- [ ] start_robot_death_sequence — death sequence (D2)
- [ ] do_any_robot_dying_frame — death dispatch (D2)

### Unported — Awareness & Environment
- [x] ai_door_is_openable — door check (D1 + D2)
- [x] openable_doors_in_segment — scans for usable doors
- [ ] move_object_to_legal_spot — relocates to valid segment
- [ ] move_towards_segment_center — movement toward center
- [ ] add_awareness_event, create_awareness_event — awareness events
- [ ] process_awareness_events — handle awareness queue
- [ ] set_player_awareness_all — broadcast player location

### Unported — Initialization
- [ ] init_ai_system — AI system init
- [ ] init_ai_object — single robot AI init
- [ ] init_ai_objects — all robots init

---

## 9. Fireball & Explosions (main_d1/fireball.cpp)

### Ported
- [x] get_explosion_vclip — vclip selection

### Unported — Object Creation
- [ ] object_create_explosion_sub — explosion with damage falloff
- [ ] object_create_explosion — simple explosion
- [ ] object_create_badass_explosion — powerful explosion
- [ ] object_create_muzzle_flash — muzzle flash vclip
- [ ] object_create_debris — debris from destroyed object
- [ ] explode_badass_weapon, explode_badass_player

### Unported — Explosion Logic
- [ ] explode_object — triggers object explosion
- [ ] explode_model — explodes polymodel with debris
- [ ] do_debris_frame — debris animation
- [ ] do_explosion_sequence — explosion animation sequence

### Unported — Walls
- [ ] init_exploding_walls
- [ ] explode_wall — triggers wall explosion
- [ ] do_exploding_wall_frame — wall explosion animation

### Unported — Egg/Drop
- [ ] object_create_egg — powerup egg from object
- [ ] call_object_create_egg — wrapper
- [ ] maybe_delete_object — conditional deletion

---

## 10. Control Center (main_d1/cntrlcen.cpp)

### Ported
- [x] calc_controlcen_gun_point
- [x] calc_best_gun

### Unported
- [ ] do_controlcen_frame — main control center frame (fires at player)
- [ ] do_controlcen_destroyed_stuff — destruction effects
- [ ] do_controlcen_dead_frame — death animation
- [ ] init_controlcen_for_level — level init

---

## 11. Lighting (main_d1/lighting.cpp → ox_lighting.ml)

### Ported
- [x] compute_headlight_light_d1
- [x] compute_headlight_light_d2

### Unported
- [ ] compute_light_intensity — total light at point (~120 lines, reads object array)
- [ ] apply_light — dynamic light source
- [ ] cast_muzzle_flash_light — muzzle flash light
- [ ] set_dynamic_light — dynamic light state
- [ ] compute_seg_dynamic_light — per-segment dynamic light
- [x] compute_object_light — per-object light (D1+D2)

---

## 12. Curves (→ ox_curves.ml)

- [x] create_curve
- [x] evaluate_curve
- [x] curve_dist
- [x] curve_dir

**Status: COMPLETE**

---

## 13. Object Management (main_d1/object.cpp)

### Unported — Lifecycle
- [ ] obj_create — creates object instance
- [ ] obj_delete — deletes object
- [ ] obj_allocate, obj_free — object slot management
- [ ] free_object_slots — compresses object array
- [ ] init_objects — initializes object array
- [ ] reset_objects — resets object array

### Unported — Linking
- [ ] obj_link, obj_unlink, obj_relink — segment linkage
- [ ] update_object_seg — updates segment via FVI
- [ ] find_object_seg — finds containing segment

### Unported — Player Death
- [ ] start_player_death_sequence
- [ ] dead_player_frame — death animation
- [ ] dead_player_end — end death sequence

### Unported — Rendering
- [-] render_object — renderer integration
- [-] draw_object_blob, draw_polygon_object — renderer
- [-] draw_cloaked_object — renderer

---

## 14. Weapon Pickup (main_d1/weapon.cpp)

- [ ] player_has_weapon — weapon ownership check
- [ ] select_weapon — selects active weapon
- [ ] auto_select_weapon — auto-selects best weapon
- [ ] pick_up_primary — primary weapon pickup
- [ ] pick_up_secondary — secondary weapon pickup
- [ ] pick_up_ammo — ammo pickup

---

## 15. Robot (main_d1/robot.cpp)

### Ported
- [x] calc_gun_point

### Ported
- [x] robot_get_anim_state — animation state
- [x] set_robot_state — set animation state
- [x] robot_set_angles — joint angles from animation

---

## 16. Game Mine / Level Loading (main_d1/gamemine.cpp)

- [-] load_mine_data — file I/O (out of scope)
- [-] load_mine_data_compiled — file I/O
- [ ] create_local_segment_data — local segment cache
- [ ] check_lsegments_validity — validates local cache

---

## 17. End Level (main_d1/endlevel.cpp)

### Ported
- [x] chase_angles — angle interpolation

### Unported
- [ ] endlevel sequence logic — complex state machine, cinematics

---

## Out of Scope

These subsystems are not game logic and won't be ported:

- Platform/OS layer (platform/*)
- Graphics rendering backends (2d/*, texmap/*)
- Sound/music (digi.cpp, songs.cpp)
- Networking/multiplayer protocol (network.cpp, multi.cpp)
- HUD/UI/menus (gauges.cpp, hud.cpp, menu.cpp)
- Demo recording/playback (newdemo.cpp)
- Save/load file I/O (gamesave.cpp, playsave.cpp)
- Editor (editor/*)
- Input handling (kconfig.cpp, joy.cpp)
- Configuration (config.cpp)
