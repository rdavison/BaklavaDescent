#include "bridge.h"

#include <stdio.h>
#include <stdlib.h>

#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/memory.h>
#include <caml/mlvalues.h>
#include <caml/startup.h>

static int g_runtime_started = 0;
static const value* g_i2f = NULL;
static const value* g_f2i = NULL;
static const value* g_fixmul = NULL;
static const value* g_fixdiv = NULL;
static const value* g_fix_sqrt = NULL;
static const value* g_fix_isqrt = NULL;
static const value* g_fix_asin = NULL;
static const value* g_fix_acos = NULL;
static const value* g_fix_atan2 = NULL;
static const value* g_fix_sincos = NULL;
static const value* g_fix_fastsincos = NULL;
static const value* g_vm_vec_add = NULL;
static const value* g_vm_vec_sub = NULL;
static const value* g_vm_vec_add2 = NULL;
static const value* g_vm_vec_sub2 = NULL;
static const value* g_vm_vec_avg = NULL;
static const value* g_vm_vec_avg4 = NULL;
static const value* g_vm_vec_copy_scale = NULL;
static const value* g_vm_vec_scale_add = NULL;
static const value* g_vm_vec_scale_add2 = NULL;
static const value* g_vm_vec_scale2 = NULL;
static const value* g_vm_vec_mag = NULL;
static const value* g_vm_vec_dist = NULL;
static const value* g_vm_vec_dotprod = NULL;
static const value* g_vm_vec_dot3 = NULL;
static const value* g_vm_vec_crossprod = NULL;
static const value* g_vm_vec_perp = NULL;
static const value* g_vm_vec_copy_normalize = NULL;
static const value* g_vm_vec_rotate = NULL;
static const value* g_sincos_2_matrix = NULL;
static const value* g_vm_angles_2_matrix = NULL;
static const value* g_vm_vec_ang_2_matrix = NULL;
static const value* g_vm_transpose_matrix = NULL;
static const value* g_vm_matrix_x_matrix = NULL;
static const value* g_vm_vector_2_matrix = NULL;
static const value* g_vm_vector_2_matrix_norm = NULL;
static const value* g_vm_extract_angles_matrix = NULL;
static const value* g_vm_extract_angles_vector_normalized = NULL;
static const value* g_vm_extract_angles_vector = NULL;
static const value* g_vm_vec_delta_ang_norm = NULL;
static const value* g_vm_vec_delta_ang = NULL;
static const value* g_vm_vec_mag_quick = NULL;
static const value* g_vm_vec_dist_quick = NULL;
static const value* g_vm_vec_copy_normalize_quick = NULL;
static const value* g_g3_code_point = NULL;
static const value* g_checkmuldiv = NULL;
static const value* g_g3_rotate_point = NULL;
static const value* g_g3_project_point = NULL;
static const value* g_g3_rotate_delta_x = NULL;
static const value* g_g3_rotate_delta_y = NULL;
static const value* g_g3_rotate_delta_z = NULL;
static const value* g_g3_calc_point_depth = NULL;
static const value* g_scale_matrix = NULL;
static const value* g_g3_start_instance_matrix = NULL;
static const value* g_g3_point_2_vec = NULL;
static const value* g_clip_edge = NULL;
static const value* g_clip_line = NULL;
static const value* g_clip_polygon = NULL;
static const value* g_g3_check_normal_facing = NULL;
static const value* g_do_facing_check_computed = NULL;
static const value* g_calc_rod_corners = NULL;
static const value* g_compute_center_point_on_side = NULL;
static const value* g_compute_segment_center = NULL;
static const value* g_get_verts_for_normal = NULL;
static const value* g_create_abs_vertex_lists = NULL;
static const value* g_get_seg_masks = NULL;
static const value* g_get_side_dists = NULL;
static const value* g_extract_vector_from_segment = NULL;
static const value* g_extract_orient_from_segment = NULL;
static const value* g_check_line_to_face = NULL;
static const value* g_special_check_line_to_face = NULL;
static const value* g_check_vector_to_sphere_1 = NULL;
static const value* g_apply_damage_to_robot_d1 = NULL;

/* FVI check_trans_wall callback (set via cd_ox_register_check_trans_wall) */
static cd_check_trans_wall_fn g_check_trans_wall = NULL;

/* Collide effect function pointers (set via cd_ox_register_collide_effects) */
static cd_effect_increment_kills_fn g_effect_increment_kills = NULL;
static cd_effect_start_boss_death_fn g_effect_start_boss_death = NULL;
static cd_effect_explode_object_fn g_effect_explode_object = NULL;
static cd_effect_send_net_robot_explode_fn g_effect_send_net_robot_explode = NULL;
static cd_effect_multi_explode_robot_sub_fn g_effect_multi_explode_robot_sub = NULL;

/* D2 collide effect function pointers */
static cd_effect_set_boss_hit_time_fn g_effect_set_boss_hit_time = NULL;
static cd_effect_query_player_dead_or_no_shields_fn g_effect_query_player_dead_or_no_shields = NULL;
static cd_effect_query_multi_all_players_alive_fn g_effect_query_multi_all_players_alive = NULL;
static cd_effect_do_final_boss_hacks_fn g_effect_do_final_boss_hacks = NULL;
static cd_effect_multi_send_finish_game_fn g_effect_multi_send_finish_game = NULL;
static cd_effect_save_stolen_items_fn g_effect_save_stolen_items = NULL;
static cd_effect_restore_stolen_items_fn g_effect_restore_stolen_items = NULL;
static cd_effect_clear_stolen_items_fn g_effect_clear_stolen_items = NULL;
static cd_effect_multi_explode_d2_fn g_effect_multi_explode_d2 = NULL;
static cd_effect_multi_send_robot_explode_d2_fn g_effect_multi_send_robot_explode_d2 = NULL;
static cd_effect_start_robot_death_sequence_fn g_effect_start_robot_death_sequence = NULL;
static cd_effect_special_reactor_stuff_fn g_effect_special_reactor_stuff = NULL;
static cd_effect_explode_object_delay_fn g_effect_explode_object_delay = NULL;
static const value* g_apply_damage_to_robot_d2 = NULL;

static const value* g_physics_turn_towards_vector = NULL;
static const value* g_do_physics_sim_rot = NULL;
static const value* g_calc_gun_point = NULL;
static const value* g_phys_apply_force = NULL;
static const value* g_phys_apply_rot = NULL;
static const value* g_ai_turn_towards_vector = NULL;
static const value* g_set_thrust_from_velocity = NULL;
static const value* g_move_towards_vector = NULL;
static const value* g_move_around_player = NULL;
static const value* g_move_away_from_player = NULL;
static const value* g_set_object_turnroll = NULL;
static const value* g_lead_player = NULL;
static const value* g_homing_missile_turn_towards_velocity = NULL;
static const value* g_do_physics_align_object = NULL;
static const value* g_ai_frame_animation = NULL;
static const value* g_ai_move_relative_to_player = NULL;
static const value* g_ai_path_set_orient_and_vel = NULL;
static const value* g_do_silly_animation = NULL;
static const value* g_check_vector_to_object = NULL;
static const value* g_set_next_fire_time_d1 = NULL;
static const value* g_set_next_fire_time_d2 = NULL;
static const value* g_compute_headlight_light_d1 = NULL;
static const value* g_compute_headlight_light_d2 = NULL;
static const value* g_get_explosion_vclip = NULL;
static const value* g_ai_behavior_to_mode_d1 = NULL;
static const value* g_ai_behavior_to_mode_d2 = NULL;
static const value* g_ai_turn_randomly = NULL;
static const value* g_ai_door_is_openable_d1 = NULL;
static const value* g_ai_door_is_openable_d2 = NULL;
static const value* g_openable_doors_in_segment_d1 = NULL;
static const value* g_openable_doors_in_segment_d2 = NULL;
static const value* g_do_firing_stuff = NULL;
static const value* g_compute_object_light = NULL;
static const value* g_do_physics_drag = NULL;
static const value* g_do_homing_weapon_frame = NULL;
static const value* g_player_has_weapon_d1 = NULL;
static const value* g_player_has_weapon_d2 = NULL;

/* Clutter effect function pointers */
static cd_effect_explode_object_delay_clutter_fn g_effect_explode_object_delay_clutter = NULL;
static const value* g_apply_damage_to_clutter = NULL;

/* Controlcen effect function pointers */
static cd_effect_show_hud_invul_message_fn g_effect_show_hud_invul_message = NULL;
static cd_effect_controlcen_been_hit_fn g_effect_controlcen_been_hit = NULL;
static cd_effect_do_controlcen_destroyed_fn g_effect_do_controlcen_destroyed = NULL;
static cd_effect_add_controlcen_score_fn g_effect_add_controlcen_score = NULL;
static cd_effect_multi_send_destroy_controlcen_fn g_effect_multi_send_destroy_controlcen = NULL;
static cd_effect_sound_controlcen_destroyed_fn g_effect_sound_controlcen_destroyed = NULL;
static cd_effect_explode_object_delay_controlcen_fn g_effect_explode_object_delay_controlcen = NULL;
static const value* g_apply_damage_to_controlcen = NULL;

/* Controlcen frame effect function pointers */
static cd_effect_cc_fire_weapon_fn g_effect_cc_fire_weapon = NULL;
static cd_effect_cc_send_controlcen_fire_fn g_effect_cc_send_controlcen_fire = NULL;
static cd_effect_cc_make_random_vector_fn g_effect_cc_make_random_vector = NULL;
static cd_effect_cc_p_rand_fn g_effect_cc_p_rand = NULL;
static const value* g_do_controlcen_frame_d1 = NULL;
static const value* g_do_controlcen_frame_d2 = NULL;

/* AI frame effect function pointers */
static cd_effect_af_multiplayer_awareness_fn g_effect_af_multiplayer_awareness = NULL;
static cd_effect_af_robot_hit_attack_fn g_effect_af_robot_hit_attack = NULL;
static cd_effect_af_fire_laser_fn g_effect_af_fire_laser = NULL;
static cd_effect_af_calc_gun_point_fn g_effect_af_calc_gun_point = NULL;
static cd_effect_af_create_path_to_player_fn g_effect_af_create_path_to_player = NULL;
static cd_effect_af_create_path_to_station_fn g_effect_af_create_path_to_station = NULL;
static cd_effect_af_create_n_segment_path_fn g_effect_af_create_n_segment_path = NULL;
static cd_effect_af_create_n_segment_path_to_door_fn g_effect_af_create_n_segment_path_to_door = NULL;
static cd_effect_af_attempt_to_resume_path_fn g_effect_af_attempt_to_resume_path = NULL;
static cd_effect_af_ai_follow_path_fn g_effect_af_ai_follow_path = NULL;
static cd_effect_af_move_towards_segment_center_fn g_effect_af_move_towards_segment_center = NULL;
static cd_effect_af_compute_vis_and_vec_fn g_effect_af_compute_vis_and_vec = NULL;
static cd_effect_af_multi_send_robot_position_fn g_effect_af_multi_send_robot_position = NULL;
static cd_effect_af_do_boss_stuff_fn g_effect_af_do_boss_stuff = NULL;
static cd_effect_af_p_rand_fn g_effect_af_p_rand = NULL;
static cd_effect_af_make_random_vector_fn g_effect_af_make_random_vector = NULL;
static cd_effect_af_object_to_object_visibility_fn g_effect_af_object_to_object_visibility = NULL;
static cd_effect_af_do_snipe_frame_fn g_effect_af_do_snipe_frame = NULL;
static cd_effect_af_do_escort_frame_fn g_effect_af_do_escort_frame = NULL;
static cd_effect_af_do_thief_frame_fn g_effect_af_do_thief_frame = NULL;
static cd_effect_af_do_any_robot_dying_frame_fn g_effect_af_do_any_robot_dying_frame = NULL;
static cd_effect_af_make_nearby_robot_snipe_fn g_effect_af_make_nearby_robot_snipe = NULL;
static cd_effect_af_move_away_from_player_fn g_effect_af_move_away_from_player_af = NULL;
static cd_effect_af_laser_create_new_easy_fn g_effect_af_laser_create_new_easy = NULL;
static const value* g_do_ai_frame_d1 = NULL;
static const value* g_do_ai_frame_d2 = NULL;

/* Physics sim effect function pointers */
static cd_effect_ps_find_vector_intersection_fn g_effect_ps_find_vector_intersection = NULL;
static cd_effect_ps_collide_object_with_wall_fn g_effect_ps_collide_object_with_wall = NULL;
static cd_effect_ps_scrape_object_on_wall_fn g_effect_ps_scrape_object_on_wall = NULL;
static cd_effect_ps_collide_two_objects_fn g_effect_ps_collide_two_objects = NULL;
static cd_effect_ps_obj_relink_fn g_effect_ps_obj_relink = NULL;
static cd_effect_ps_find_object_seg_fn g_effect_ps_find_object_seg = NULL;
static cd_effect_ps_update_object_seg_fn g_effect_ps_update_object_seg = NULL;
static cd_effect_ps_find_point_seg_fn g_effect_ps_find_point_seg = NULL;
static cd_effect_ps_get_seg_masks_fn g_effect_ps_get_seg_masks = NULL;
static cd_effect_ps_compute_segment_center_fn g_effect_ps_compute_segment_center = NULL;
static cd_effect_ps_add_stuck_object_fn g_effect_ps_add_stuck_object = NULL;
static cd_effect_ps_find_connect_side_fn g_effect_ps_find_connect_side = NULL;
static cd_effect_ps_wall_is_doorway_fn g_effect_ps_wall_is_doorway = NULL;
static cd_effect_ps_create_abs_vertex_lists_and_dist_fn g_effect_ps_create_abs_vertex_lists_and_dist = NULL;
static cd_effect_ps_tmap_is_force_field_fn g_effect_ps_tmap_is_force_field = NULL;
static cd_effect_ps_vm_vector_2_matrix_orient_fn g_effect_ps_vm_vector_2_matrix_orient = NULL;
static const value* g_do_physics_sim_d1 = NULL;
static const value* g_do_physics_sim_d2 = NULL;

/* Player damage D1 effect function pointers */
static cd_effect_palette_flash_fn g_effect_palette_flash_d1 = NULL;
static cd_effect_set_player_dead_fn g_effect_set_player_dead_d1 = NULL;
static const value* g_apply_damage_to_player_d1 = NULL;

/* Player damage D2 effect function pointers */
static cd_effect_palette_flash_fn g_effect_palette_flash_d2 = NULL;
static cd_effect_set_player_dead_fn g_effect_set_player_dead_d2 = NULL;
static cd_effect_set_buddy_sorry_time_fn g_effect_set_buddy_sorry_time = NULL;
static const value* g_apply_damage_to_player_d2 = NULL;
static const value* g_maybe_kill_weapon_d1 = NULL;
static const value* g_maybe_kill_weapon_d2 = NULL;
static const value* g_calc_best_gun = NULL;
static const value* g_chase_angles = NULL;
static const value* g_laser_are_related_d1 = NULL;
static const value* g_laser_are_related_d2 = NULL;
static const value* g_calc_controlcen_gun_point = NULL;
static const value* g_find_connect_side = NULL;
static const value* g_create_shortpos = NULL;
static const value* g_extract_shortpos = NULL;
static const value* g_create_walls_on_side = NULL;
static const value* g_check_norms = NULL;
static const value* g_create_all_vertex_lists = NULL;
static const value* g_create_all_vertnum_lists = NULL;
static const value* g_robot_get_anim_state = NULL;
static const value* g_set_robot_state = NULL;
static const value* g_robot_set_angles = NULL;
static const value* g_object_intersects_wall = NULL;
static const value* g_find_point_seg = NULL;
static const value* g_find_connected_distance = NULL;
static const value* g_find_vector_intersection = NULL;
static const value* g_find_homing_object_complete = NULL;
static const value* g_find_homing_object = NULL;
static const value* g_track_track_goal = NULL;
static const value* g_player_is_visible_from_object = NULL;
static const value* g_compute_vis_and_vec = NULL;

static void cd_ox_require_ready(const char* fn)
{
    if (!(g_runtime_started
          && g_i2f
          && g_f2i
          && g_fixmul
          && g_fixdiv
          && g_fix_sqrt
          && g_fix_isqrt
          && g_fix_asin
          && g_fix_acos
          && g_fix_atan2
          && g_fix_sincos
          && g_fix_fastsincos
          && g_vm_vec_add
          && g_vm_vec_sub
          && g_vm_vec_add2
          && g_vm_vec_sub2
          && g_vm_vec_avg
          && g_vm_vec_avg4
          && g_vm_vec_copy_scale
          && g_vm_vec_scale_add
          && g_vm_vec_scale_add2
          && g_vm_vec_scale2
          && g_vm_vec_mag
          && g_vm_vec_dist
          && g_vm_vec_dotprod
          && g_vm_vec_dot3
          && g_vm_vec_crossprod
          && g_vm_vec_perp
          && g_vm_vec_copy_normalize
          && g_vm_vec_rotate
          && g_sincos_2_matrix
          && g_vm_angles_2_matrix
          && g_vm_vec_ang_2_matrix
          && g_vm_transpose_matrix
          && g_vm_matrix_x_matrix
          && g_vm_vector_2_matrix
          && g_vm_vector_2_matrix_norm
          && g_vm_extract_angles_matrix
          && g_vm_extract_angles_vector_normalized
          && g_vm_extract_angles_vector
          && g_vm_vec_delta_ang_norm
          && g_vm_vec_delta_ang
          && g_vm_vec_mag_quick
          && g_vm_vec_dist_quick
          && g_vm_vec_copy_normalize_quick
          && g_g3_code_point
          && g_checkmuldiv
          && g_g3_rotate_point
          && g_g3_project_point
          && g_g3_rotate_delta_x
          && g_g3_rotate_delta_y
          && g_g3_rotate_delta_z
          && g_g3_calc_point_depth
          && g_scale_matrix
          && g_g3_start_instance_matrix
          && g_g3_point_2_vec
          && g_clip_edge
          && g_clip_line
          && g_clip_polygon
          && g_g3_check_normal_facing
          && g_do_facing_check_computed
          && g_calc_rod_corners
          && g_compute_center_point_on_side
          && g_compute_segment_center
          && g_get_verts_for_normal
          && g_create_abs_vertex_lists
          && g_get_seg_masks
          && g_get_side_dists
          && g_extract_vector_from_segment
          && g_extract_orient_from_segment
          && g_check_line_to_face
          && g_special_check_line_to_face
          && g_check_vector_to_sphere_1
          && g_apply_damage_to_robot_d1
          && g_apply_damage_to_robot_d2
          && g_physics_turn_towards_vector
          && g_do_physics_sim_rot
          && g_calc_gun_point
          && g_phys_apply_force
          && g_phys_apply_rot
          && g_ai_turn_towards_vector
          && g_set_thrust_from_velocity
          && g_move_towards_vector
          && g_move_around_player
          && g_move_away_from_player
          && g_set_object_turnroll
          && g_lead_player
          && g_homing_missile_turn_towards_velocity
          && g_do_physics_align_object
          && g_check_vector_to_object
          && g_set_next_fire_time_d1
          && g_set_next_fire_time_d2
          && g_compute_headlight_light_d1
          && g_compute_headlight_light_d2
          && g_get_explosion_vclip
          && g_ai_behavior_to_mode_d1
          && g_ai_behavior_to_mode_d2
          && g_ai_turn_randomly
          && g_ai_door_is_openable_d1
          && g_ai_door_is_openable_d2
          && g_openable_doors_in_segment_d1
          && g_openable_doors_in_segment_d2
          && g_do_firing_stuff
          && g_compute_object_light
          && g_do_physics_drag
          && g_do_homing_weapon_frame
          && g_apply_damage_to_clutter
          && g_apply_damage_to_controlcen
          && g_apply_damage_to_player_d1
          && g_apply_damage_to_player_d2
          && g_maybe_kill_weapon_d1
          && g_maybe_kill_weapon_d2
          && g_calc_best_gun
          && g_chase_angles
          && g_laser_are_related_d1
          && g_laser_are_related_d2
          && g_calc_controlcen_gun_point
          && g_find_connect_side
          && g_create_shortpos
          && g_extract_shortpos
          && g_create_walls_on_side
          && g_check_norms
          && g_create_all_vertex_lists
          && g_create_all_vertnum_lists
          && g_robot_get_anim_state
          && g_set_robot_state
          && g_robot_set_angles
          && g_object_intersects_wall
          && g_find_point_seg
          && g_player_has_weapon_d1
          && g_player_has_weapon_d2
          && g_do_controlcen_frame_d1
          && g_do_controlcen_frame_d2
          && g_do_ai_frame_d1
          && g_do_ai_frame_d2
          && g_do_physics_sim_d1
          && g_do_physics_sim_d2))
    {
        fprintf(stderr, "OxCaml bridge not initialized before %s\n", fn);
        abort();
    }
}

int cd_ox_init_runtime(const char* executable_path)
{
    if (g_runtime_started)
    {
        return 0;
    }

    char* argv[2];
    argv[0] = (char*)executable_path;
    argv[1] = NULL;

    caml_startup(argv);

    g_i2f = caml_named_value("cd_i2f");
    g_f2i = caml_named_value("cd_f2i");
    g_fixmul = caml_named_value("cd_fixmul");
    g_fixdiv = caml_named_value("cd_fixdiv");
    g_fix_sqrt = caml_named_value("cd_fix_sqrt");
    g_fix_isqrt = caml_named_value("cd_fix_isqrt");
    g_fix_asin = caml_named_value("cd_fix_asin");
    g_fix_acos = caml_named_value("cd_fix_acos");
    g_fix_atan2 = caml_named_value("cd_fix_atan2");
    g_fix_sincos = caml_named_value("cd_fix_sincos");
    g_fix_fastsincos = caml_named_value("cd_fix_fastsincos");
    g_vm_vec_add = caml_named_value("cd_vm_vec_add");
    g_vm_vec_sub = caml_named_value("cd_vm_vec_sub");
    g_vm_vec_add2 = caml_named_value("cd_vm_vec_add2");
    g_vm_vec_sub2 = caml_named_value("cd_vm_vec_sub2");
    g_vm_vec_avg = caml_named_value("cd_vm_vec_avg");
    g_vm_vec_avg4 = caml_named_value("cd_vm_vec_avg4");
    g_vm_vec_copy_scale = caml_named_value("cd_vm_vec_copy_scale");
    g_vm_vec_scale_add = caml_named_value("cd_vm_vec_scale_add");
    g_vm_vec_scale_add2 = caml_named_value("cd_vm_vec_scale_add2");
    g_vm_vec_scale2 = caml_named_value("cd_vm_vec_scale2");
    g_vm_vec_mag = caml_named_value("cd_vm_vec_mag");
    g_vm_vec_dist = caml_named_value("cd_vm_vec_dist");
    g_vm_vec_dotprod = caml_named_value("cd_vm_vec_dotprod");
    g_vm_vec_dot3 = caml_named_value("cd_vm_vec_dot3");
    g_vm_vec_crossprod = caml_named_value("cd_vm_vec_crossprod");
    g_vm_vec_perp = caml_named_value("cd_vm_vec_perp");
    g_vm_vec_copy_normalize = caml_named_value("cd_vm_vec_copy_normalize");
    g_vm_vec_rotate = caml_named_value("cd_vm_vec_rotate");
    g_sincos_2_matrix = caml_named_value("cd_sincos_2_matrix");
    g_vm_angles_2_matrix = caml_named_value("cd_vm_angles_2_matrix");
    g_vm_vec_ang_2_matrix = caml_named_value("cd_vm_vec_ang_2_matrix");
    g_vm_transpose_matrix = caml_named_value("cd_vm_transpose_matrix");
    g_vm_matrix_x_matrix = caml_named_value("cd_vm_matrix_x_matrix");
    g_vm_vector_2_matrix = caml_named_value("cd_vm_vector_2_matrix");
    g_vm_vector_2_matrix_norm = caml_named_value("cd_vm_vector_2_matrix_norm");
    g_vm_extract_angles_matrix = caml_named_value("cd_vm_extract_angles_matrix");
    g_vm_extract_angles_vector_normalized = caml_named_value("cd_vm_extract_angles_vector_normalized");
    g_vm_extract_angles_vector = caml_named_value("cd_vm_extract_angles_vector");
    g_vm_vec_delta_ang_norm = caml_named_value("cd_vm_vec_delta_ang_norm");
    g_vm_vec_delta_ang = caml_named_value("cd_vm_vec_delta_ang");
    g_vm_vec_mag_quick = caml_named_value("cd_vm_vec_mag_quick");
    g_vm_vec_dist_quick = caml_named_value("cd_vm_vec_dist_quick");
    g_vm_vec_copy_normalize_quick = caml_named_value("cd_vm_vec_copy_normalize_quick");
    g_g3_code_point = caml_named_value("cd_g3_code_point");
    g_checkmuldiv = caml_named_value("cd_checkmuldiv");
    g_g3_rotate_point = caml_named_value("cd_g3_rotate_point");
    g_g3_project_point = caml_named_value("cd_g3_project_point");
    g_g3_rotate_delta_x = caml_named_value("cd_g3_rotate_delta_x");
    g_g3_rotate_delta_y = caml_named_value("cd_g3_rotate_delta_y");
    g_g3_rotate_delta_z = caml_named_value("cd_g3_rotate_delta_z");
    g_g3_calc_point_depth = caml_named_value("cd_g3_calc_point_depth");
    g_scale_matrix = caml_named_value("cd_scale_matrix");
    g_g3_start_instance_matrix = caml_named_value("cd_g3_start_instance_matrix");
    g_g3_point_2_vec = caml_named_value("cd_g3_point_2_vec");
    g_clip_edge = caml_named_value("cd_clip_edge");
    g_clip_line = caml_named_value("cd_clip_line");
    g_clip_polygon = caml_named_value("cd_clip_polygon");
    g_g3_check_normal_facing = caml_named_value("cd_g3_check_normal_facing");
    g_do_facing_check_computed = caml_named_value("cd_do_facing_check_computed");
    g_calc_rod_corners = caml_named_value("cd_calc_rod_corners");
    g_compute_center_point_on_side = caml_named_value("cd_compute_center_point_on_side");
    g_compute_segment_center = caml_named_value("cd_compute_segment_center");
    g_get_verts_for_normal = caml_named_value("cd_get_verts_for_normal");
    g_create_abs_vertex_lists = caml_named_value("cd_create_abs_vertex_lists");
    g_get_seg_masks = caml_named_value("cd_get_seg_masks");
    g_get_side_dists = caml_named_value("cd_get_side_dists");
    g_extract_vector_from_segment = caml_named_value("cd_extract_vector_from_segment");
    g_extract_orient_from_segment = caml_named_value("cd_extract_orient_from_segment");
    g_check_line_to_face = caml_named_value("cd_check_line_to_face");
    g_special_check_line_to_face = caml_named_value("cd_special_check_line_to_face");
    g_check_vector_to_sphere_1 = caml_named_value("cd_check_vector_to_sphere_1");
    g_apply_damage_to_robot_d1 = caml_named_value("cd_apply_damage_to_robot_d1");
    g_apply_damage_to_robot_d2 = caml_named_value("cd_apply_damage_to_robot_d2");
    g_physics_turn_towards_vector = caml_named_value("cd_physics_turn_towards_vector");
    g_do_physics_sim_rot = caml_named_value("cd_do_physics_sim_rot");
    g_calc_gun_point = caml_named_value("cd_calc_gun_point");
    g_phys_apply_force = caml_named_value("cd_phys_apply_force");
    g_phys_apply_rot = caml_named_value("cd_phys_apply_rot");
    g_ai_turn_towards_vector = caml_named_value("cd_ai_turn_towards_vector");
    g_set_thrust_from_velocity = caml_named_value("cd_set_thrust_from_velocity");
    g_move_towards_vector = caml_named_value("cd_move_towards_vector");
    g_move_around_player = caml_named_value("cd_move_around_player");
    g_move_away_from_player = caml_named_value("cd_move_away_from_player");
    g_set_object_turnroll = caml_named_value("cd_set_object_turnroll");
    g_lead_player = caml_named_value("cd_lead_player");
    g_homing_missile_turn_towards_velocity = caml_named_value("cd_homing_missile_turn_towards_velocity");
    g_do_physics_align_object = caml_named_value("cd_do_physics_align_object");
    g_ai_frame_animation = caml_named_value("cd_ai_frame_animation");
    g_ai_move_relative_to_player = caml_named_value("cd_ai_move_relative_to_player");
    g_ai_path_set_orient_and_vel = caml_named_value("cd_ai_path_set_orient_and_vel");
    g_do_silly_animation = caml_named_value("cd_do_silly_animation");
    g_check_vector_to_object = caml_named_value("cd_check_vector_to_object");
    g_set_next_fire_time_d1 = caml_named_value("cd_set_next_fire_time_d1");
    g_set_next_fire_time_d2 = caml_named_value("cd_set_next_fire_time_d2");
    g_compute_headlight_light_d1 = caml_named_value("cd_compute_headlight_light_d1");
    g_compute_headlight_light_d2 = caml_named_value("cd_compute_headlight_light_d2");
    g_get_explosion_vclip = caml_named_value("cd_get_explosion_vclip");
    g_ai_behavior_to_mode_d1 = caml_named_value("cd_ai_behavior_to_mode_d1");
    g_ai_behavior_to_mode_d2 = caml_named_value("cd_ai_behavior_to_mode_d2");
    g_ai_turn_randomly = caml_named_value("cd_ai_turn_randomly");
    g_ai_door_is_openable_d1 = caml_named_value("cd_ai_door_is_openable_d1");
    g_ai_door_is_openable_d2 = caml_named_value("cd_ai_door_is_openable_d2");
    g_openable_doors_in_segment_d1 = caml_named_value("cd_openable_doors_in_segment_d1");
    g_openable_doors_in_segment_d2 = caml_named_value("cd_openable_doors_in_segment_d2");
    g_do_firing_stuff = caml_named_value("cd_do_firing_stuff");
    g_compute_object_light = caml_named_value("cd_compute_object_light");
    g_do_physics_drag = caml_named_value("cd_do_physics_drag");
    g_do_homing_weapon_frame = caml_named_value("cd_do_homing_weapon_frame");
    g_player_has_weapon_d1 = caml_named_value("cd_player_has_weapon_d1");
    g_player_has_weapon_d2 = caml_named_value("cd_player_has_weapon_d2");
    g_do_controlcen_frame_d1 = caml_named_value("cd_do_controlcen_frame_d1");
    g_do_controlcen_frame_d2 = caml_named_value("cd_do_controlcen_frame_d2");
    g_do_ai_frame_d1 = caml_named_value("cd_do_ai_frame_d1");
    g_do_ai_frame_d2 = caml_named_value("cd_do_ai_frame_d2");
    g_do_physics_sim_d1 = caml_named_value("cd_do_physics_sim_d1");
    g_do_physics_sim_d2 = caml_named_value("cd_do_physics_sim_d2");
    g_apply_damage_to_clutter = caml_named_value("cd_apply_damage_to_clutter");
    g_apply_damage_to_controlcen = caml_named_value("cd_apply_damage_to_controlcen");
    g_apply_damage_to_player_d1 = caml_named_value("cd_apply_damage_to_player_d1");
    g_apply_damage_to_player_d2 = caml_named_value("cd_apply_damage_to_player_d2");
    g_maybe_kill_weapon_d1 = caml_named_value("cd_maybe_kill_weapon_d1");
    g_maybe_kill_weapon_d2 = caml_named_value("cd_maybe_kill_weapon_d2");
    g_calc_best_gun = caml_named_value("cd_calc_best_gun");
    g_chase_angles = caml_named_value("cd_chase_angles");
    g_laser_are_related_d1 = caml_named_value("cd_laser_are_related_d1");
    g_laser_are_related_d2 = caml_named_value("cd_laser_are_related_d2");
    g_calc_controlcen_gun_point = caml_named_value("cd_calc_controlcen_gun_point");
    g_find_connect_side = caml_named_value("cd_find_connect_side");
    g_create_shortpos = caml_named_value("cd_create_shortpos");
    g_extract_shortpos = caml_named_value("cd_extract_shortpos");
    g_create_walls_on_side = caml_named_value("cd_create_walls_on_side");
    g_check_norms = caml_named_value("cd_check_norms");
    g_create_all_vertex_lists = caml_named_value("cd_create_all_vertex_lists");
    g_create_all_vertnum_lists = caml_named_value("cd_create_all_vertnum_lists");
    g_robot_get_anim_state = caml_named_value("cd_robot_get_anim_state");
    g_set_robot_state = caml_named_value("cd_set_robot_state");
    g_robot_set_angles = caml_named_value("cd_robot_set_angles");
    g_object_intersects_wall = caml_named_value("cd_object_intersects_wall");
    g_find_point_seg = caml_named_value("cd_find_point_seg");
    g_find_connected_distance = caml_named_value("cd_find_connected_distance");
    g_find_vector_intersection = caml_named_value("cd_find_vector_intersection");
    g_find_homing_object_complete = caml_named_value("cd_find_homing_object_complete");
    g_find_homing_object = caml_named_value("cd_find_homing_object");
    g_track_track_goal = caml_named_value("cd_track_track_goal");
    g_player_is_visible_from_object = caml_named_value("cd_player_is_visible_from_object");
    g_compute_vis_and_vec = caml_named_value("cd_compute_vis_and_vec");

    if (!g_i2f
        || !g_f2i
        || !g_fixmul
        || !g_fixdiv
        || !g_fix_sqrt
        || !g_fix_isqrt
        || !g_fix_asin
        || !g_fix_acos
        || !g_fix_atan2
        || !g_fix_sincos
        || !g_fix_fastsincos
        || !g_vm_vec_add
        || !g_vm_vec_sub
        || !g_vm_vec_add2
        || !g_vm_vec_sub2
        || !g_vm_vec_avg
        || !g_vm_vec_avg4
        || !g_vm_vec_copy_scale
        || !g_vm_vec_scale_add
        || !g_vm_vec_scale_add2
        || !g_vm_vec_scale2
        || !g_vm_vec_mag
        || !g_vm_vec_dist
        || !g_vm_vec_dotprod
        || !g_vm_vec_dot3
        || !g_vm_vec_crossprod
        || !g_vm_vec_perp
        || !g_vm_vec_copy_normalize
        || !g_vm_vec_rotate
        || !g_sincos_2_matrix
        || !g_vm_angles_2_matrix
        || !g_vm_vec_ang_2_matrix
        || !g_vm_transpose_matrix
        || !g_vm_matrix_x_matrix
        || !g_vm_vector_2_matrix
        || !g_vm_vector_2_matrix_norm
        || !g_vm_extract_angles_matrix
        || !g_vm_extract_angles_vector_normalized
        || !g_vm_extract_angles_vector
        || !g_vm_vec_delta_ang_norm
        || !g_vm_vec_delta_ang
        || !g_vm_vec_mag_quick
        || !g_vm_vec_dist_quick
        || !g_vm_vec_copy_normalize_quick
        || !g_g3_code_point
        || !g_checkmuldiv
        || !g_g3_rotate_point
        || !g_g3_project_point
        || !g_g3_rotate_delta_x
        || !g_g3_rotate_delta_y
        || !g_g3_rotate_delta_z
        || !g_g3_calc_point_depth
        || !g_scale_matrix
        || !g_g3_start_instance_matrix
        || !g_g3_point_2_vec
        || !g_clip_edge
        || !g_clip_line
        || !g_clip_polygon
        || !g_g3_check_normal_facing
        || !g_do_facing_check_computed
        || !g_calc_rod_corners
        || !g_compute_center_point_on_side
        || !g_compute_segment_center
        || !g_get_verts_for_normal
        || !g_create_abs_vertex_lists
        || !g_get_seg_masks
        || !g_get_side_dists
        || !g_extract_vector_from_segment
        || !g_extract_orient_from_segment
        || !g_check_line_to_face
        || !g_special_check_line_to_face
        || !g_check_vector_to_sphere_1
        || !g_apply_damage_to_robot_d1
        || !g_apply_damage_to_robot_d2
        || !g_physics_turn_towards_vector
        || !g_do_physics_sim_rot
        || !g_calc_gun_point
        || !g_phys_apply_force
        || !g_phys_apply_rot
        || !g_ai_turn_towards_vector
        || !g_set_thrust_from_velocity
        || !g_move_towards_vector
        || !g_move_around_player
        || !g_move_away_from_player
        || !g_set_object_turnroll
        || !g_lead_player
        || !g_homing_missile_turn_towards_velocity
        || !g_do_physics_align_object
        || !g_ai_frame_animation
        || !g_ai_move_relative_to_player
        || !g_ai_path_set_orient_and_vel
        || !g_do_silly_animation
        || !g_check_vector_to_object
        || !g_set_next_fire_time_d1
        || !g_set_next_fire_time_d2
        || !g_compute_headlight_light_d1
        || !g_compute_headlight_light_d2
        || !g_get_explosion_vclip
        || !g_ai_behavior_to_mode_d1
        || !g_ai_behavior_to_mode_d2
        || !g_ai_turn_randomly
        || !g_ai_door_is_openable_d1
        || !g_ai_door_is_openable_d2
        || !g_openable_doors_in_segment_d1
        || !g_openable_doors_in_segment_d2
        || !g_do_firing_stuff
        || !g_compute_object_light
        || !g_do_physics_drag
        || !g_do_homing_weapon_frame
        || !g_apply_damage_to_clutter
        || !g_apply_damage_to_controlcen
        || !g_apply_damage_to_player_d1
        || !g_apply_damage_to_player_d2
        || !g_maybe_kill_weapon_d1
        || !g_maybe_kill_weapon_d2
        || !g_calc_best_gun
        || !g_chase_angles
        || !g_laser_are_related_d1
        || !g_laser_are_related_d2
        || !g_calc_controlcen_gun_point
        || !g_find_connect_side
        || !g_create_shortpos
        || !g_extract_shortpos
        || !g_create_walls_on_side
        || !g_check_norms
        || !g_create_all_vertex_lists
        || !g_create_all_vertnum_lists
        || !g_robot_get_anim_state
        || !g_set_robot_state
        || !g_robot_set_angles
        || !g_object_intersects_wall
        || !g_find_point_seg
        || !g_find_connected_distance
        || !g_find_vector_intersection
        || !g_find_homing_object_complete
        || !g_find_homing_object
        || !g_track_track_goal
        || !g_player_is_visible_from_object
        || !g_compute_vis_and_vec
        || !g_do_controlcen_frame_d1
        || !g_do_controlcen_frame_d2
        || !g_do_ai_frame_d1
        || !g_do_ai_frame_d2
        || !g_do_physics_sim_d1
        || !g_do_physics_sim_d2)
    {
        return 1;
    }

    g_runtime_started = 1;
    return 0;
}

int cd_ox_is_ready(void)
{
    return g_runtime_started
           && g_i2f
           && g_f2i
           && g_fixmul
           && g_fixdiv
           && g_fix_sqrt
           && g_fix_isqrt
           && g_fix_asin
           && g_fix_acos
           && g_fix_atan2
           && g_fix_sincos
           && g_fix_fastsincos
           && g_vm_vec_add
           && g_vm_vec_sub
           && g_vm_vec_add2
           && g_vm_vec_sub2
           && g_vm_vec_avg
           && g_vm_vec_avg4
           && g_vm_vec_copy_scale
           && g_vm_vec_scale_add
           && g_vm_vec_scale_add2
           && g_vm_vec_scale2
           && g_vm_vec_mag
           && g_vm_vec_dist
           && g_vm_vec_dotprod
           && g_vm_vec_dot3
           && g_vm_vec_crossprod
           && g_vm_vec_perp
           && g_vm_vec_copy_normalize
           && g_vm_vec_rotate
           && g_sincos_2_matrix
           && g_vm_angles_2_matrix
           && g_vm_vec_ang_2_matrix
           && g_vm_transpose_matrix
           && g_vm_matrix_x_matrix
           && g_vm_vector_2_matrix
           && g_vm_vector_2_matrix_norm
           && g_vm_extract_angles_matrix
           && g_vm_extract_angles_vector_normalized
           && g_vm_extract_angles_vector
           && g_vm_vec_delta_ang_norm
           && g_vm_vec_delta_ang
           && g_vm_vec_mag_quick
           && g_vm_vec_dist_quick
           && g_vm_vec_copy_normalize_quick
           && g_g3_code_point
           && g_checkmuldiv
           && g_g3_rotate_point
           && g_g3_project_point
           && g_g3_rotate_delta_x
           && g_g3_rotate_delta_y
           && g_g3_rotate_delta_z
           && g_g3_calc_point_depth
           && g_scale_matrix
           && g_g3_start_instance_matrix
           && g_g3_point_2_vec
           && g_clip_edge
           && g_g3_check_normal_facing
           && g_do_facing_check_computed
           && g_calc_rod_corners
           && g_compute_center_point_on_side
           && g_compute_segment_center
           && g_get_verts_for_normal
           && g_create_abs_vertex_lists
           && g_get_seg_masks
           && g_get_side_dists
           && g_extract_vector_from_segment
           && g_extract_orient_from_segment
           && g_check_line_to_face
           && g_special_check_line_to_face
           && g_check_vector_to_sphere_1
           && g_apply_damage_to_robot_d1
           && g_apply_damage_to_robot_d2
           && g_physics_turn_towards_vector
           && g_do_physics_sim_rot
           && g_calc_gun_point
           && g_phys_apply_force
           && g_phys_apply_rot
           && g_ai_turn_towards_vector
           && g_set_thrust_from_velocity
           && g_move_towards_vector
           && g_move_around_player
           && g_move_away_from_player
           && g_set_object_turnroll
           && g_lead_player
           && g_homing_missile_turn_towards_velocity
           && g_do_physics_align_object
           && g_ai_frame_animation
           && g_ai_move_relative_to_player
           && g_ai_path_set_orient_and_vel
           && g_do_silly_animation
           && g_check_vector_to_object
           && g_set_next_fire_time_d1
           && g_set_next_fire_time_d2
           && g_compute_headlight_light_d1
           && g_compute_headlight_light_d2
           && g_compute_object_light
           && g_do_physics_drag
           && g_do_homing_weapon_frame
           && g_get_explosion_vclip
           && g_ai_behavior_to_mode_d1
           && g_ai_behavior_to_mode_d2
           && g_ai_turn_randomly
           && g_maybe_kill_weapon_d1
           && g_maybe_kill_weapon_d2
           && g_calc_best_gun
           && g_chase_angles
           && g_laser_are_related_d1
           && g_laser_are_related_d2
           && g_calc_controlcen_gun_point
           && g_find_connect_side
           && g_create_shortpos
           && g_extract_shortpos
           && g_create_walls_on_side
           && g_robot_get_anim_state
           && g_set_robot_state
           && g_robot_set_angles
           && g_object_intersects_wall
           && g_find_point_seg
           && g_find_connected_distance
           && g_find_vector_intersection
           && g_find_homing_object_complete
           && g_find_homing_object
           && g_track_track_goal
           && g_player_is_visible_from_object
           && g_compute_vis_and_vec
           && g_do_controlcen_frame_d1
           && g_do_controlcen_frame_d2
           && g_do_ai_frame_d1
           && g_do_ai_frame_d2
           && g_do_physics_sim_d1
           && g_do_physics_sim_d2;
}

int32_t cd_ox_i2f(int32_t i)
{
    cd_ox_require_ready("cd_ox_i2f");
    return Int_val(caml_callback(*g_i2f, Val_long(i)));
}

int32_t cd_ox_f2i(int32_t f)
{
    cd_ox_require_ready("cd_ox_f2i");
    return Int_val(caml_callback(*g_f2i, Val_long(f)));
}

int32_t cd_ox_fixmul(int32_t a, int32_t b)
{
    cd_ox_require_ready("cd_ox_fixmul");
    return Int_val(caml_callback2(*g_fixmul, Val_long(a), Val_long(b)));
}

int32_t cd_ox_fixdiv(int32_t a, int32_t b)
{
    cd_ox_require_ready("cd_ox_fixdiv");
    return Int_val(caml_callback2(*g_fixdiv, Val_long(a), Val_long(b)));
}

int32_t cd_ox_fix_sqrt(int32_t a)
{
    cd_ox_require_ready("cd_ox_fix_sqrt");
    return Int_val(caml_callback(*g_fix_sqrt, Val_long(a)));
}

int32_t cd_ox_fix_isqrt(int32_t a)
{
    cd_ox_require_ready("cd_ox_fix_isqrt");
    return Int_val(caml_callback(*g_fix_isqrt, Val_long(a)));
}

int32_t cd_ox_fix_asin(int32_t v)
{
    cd_ox_require_ready("cd_ox_fix_asin");
    return Int_val(caml_callback(*g_fix_asin, Val_long(v)));
}

int32_t cd_ox_fix_acos(int32_t v)
{
    cd_ox_require_ready("cd_ox_fix_acos");
    return Int_val(caml_callback(*g_fix_acos, Val_long(v)));
}

int32_t cd_ox_fix_atan2(int32_t cosv, int32_t sinv)
{
    cd_ox_require_ready("cd_ox_fix_atan2");
    return Int_val(caml_callback2(*g_fix_atan2, Val_long(cosv), Val_long(sinv)));
}

void cd_ox_fix_sincos(int32_t a, int32_t* s, int32_t* c)
{
    cd_ox_require_ready("cd_ox_fix_sincos");
    const value out = caml_callback(*g_fix_sincos, Val_long(a));
    if (s)
    {
        *s = Int_val(Field(out, 0));
    }
    if (c)
    {
        *c = Int_val(Field(out, 1));
    }
}

void cd_ox_fix_fastsincos(int32_t a, int32_t* s, int32_t* c)
{
    cd_ox_require_ready("cd_ox_fix_fastsincos");
    const value out = caml_callback(*g_fix_fastsincos, Val_long(a));
    if (s)
    {
        *s = Int_val(Field(out, 0));
    }
    if (c)
    {
        *c = Int_val(Field(out, 1));
    }
}

static void cd_ox_unpack_vec3(const value out, int32_t* x, int32_t* y, int32_t* z)
{
    if (x)
    {
        *x = Int_val(Field(out, 0));
    }
    if (y)
    {
        *y = Int_val(Field(out, 1));
    }
    if (z)
    {
        *z = Int_val(Field(out, 2));
    }
}

void cd_ox_vm_vec_add(
    int32_t ax,
    int32_t ay,
    int32_t az,
    int32_t bx,
    int32_t by,
    int32_t bz,
    int32_t* x,
    int32_t* y,
    int32_t* z)
{
    cd_ox_require_ready("cd_ox_vm_vec_add");
    value args[6] = { Val_long(ax), Val_long(ay), Val_long(az), Val_long(bx), Val_long(by), Val_long(bz) };
    cd_ox_unpack_vec3(caml_callbackN(*g_vm_vec_add, 6, args), x, y, z);
}

void cd_ox_vm_vec_sub(
    int32_t ax,
    int32_t ay,
    int32_t az,
    int32_t bx,
    int32_t by,
    int32_t bz,
    int32_t* x,
    int32_t* y,
    int32_t* z)
{
    cd_ox_require_ready("cd_ox_vm_vec_sub");
    value args[6] = { Val_long(ax), Val_long(ay), Val_long(az), Val_long(bx), Val_long(by), Val_long(bz) };
    cd_ox_unpack_vec3(caml_callbackN(*g_vm_vec_sub, 6, args), x, y, z);
}

void cd_ox_vm_vec_add2(
    int32_t dx,
    int32_t dy,
    int32_t dz,
    int32_t sx,
    int32_t sy,
    int32_t sz,
    int32_t* x,
    int32_t* y,
    int32_t* z)
{
    cd_ox_require_ready("cd_ox_vm_vec_add2");
    value args[6] = { Val_long(dx), Val_long(dy), Val_long(dz), Val_long(sx), Val_long(sy), Val_long(sz) };
    cd_ox_unpack_vec3(caml_callbackN(*g_vm_vec_add2, 6, args), x, y, z);
}

void cd_ox_vm_vec_sub2(
    int32_t dx,
    int32_t dy,
    int32_t dz,
    int32_t sx,
    int32_t sy,
    int32_t sz,
    int32_t* x,
    int32_t* y,
    int32_t* z)
{
    cd_ox_require_ready("cd_ox_vm_vec_sub2");
    value args[6] = { Val_long(dx), Val_long(dy), Val_long(dz), Val_long(sx), Val_long(sy), Val_long(sz) };
    cd_ox_unpack_vec3(caml_callbackN(*g_vm_vec_sub2, 6, args), x, y, z);
}

void cd_ox_vm_vec_avg(
    int32_t ax,
    int32_t ay,
    int32_t az,
    int32_t bx,
    int32_t by,
    int32_t bz,
    int32_t* x,
    int32_t* y,
    int32_t* z)
{
    cd_ox_require_ready("cd_ox_vm_vec_avg");
    value args[6] = { Val_long(ax), Val_long(ay), Val_long(az), Val_long(bx), Val_long(by), Val_long(bz) };
    cd_ox_unpack_vec3(caml_callbackN(*g_vm_vec_avg, 6, args), x, y, z);
}

void cd_ox_vm_vec_avg4(
    int32_t a1,
    int32_t a2,
    int32_t a3,
    int32_t b1,
    int32_t b2,
    int32_t b3,
    int32_t c1,
    int32_t c2,
    int32_t c3,
    int32_t d1,
    int32_t d2,
    int32_t d3,
    int32_t* x,
    int32_t* y,
    int32_t* z)
{
    cd_ox_require_ready("cd_ox_vm_vec_avg4");
    value args[12] = {
        Val_long(a1),
        Val_long(a2),
        Val_long(a3),
        Val_long(b1),
        Val_long(b2),
        Val_long(b3),
        Val_long(c1),
        Val_long(c2),
        Val_long(c3),
        Val_long(d1),
        Val_long(d2),
        Val_long(d3),
    };
    cd_ox_unpack_vec3(caml_callbackN(*g_vm_vec_avg4, 12, args), x, y, z);
}

void cd_ox_vm_vec_copy_scale(int32_t sx, int32_t sy, int32_t sz, int32_t k, int32_t* x, int32_t* y, int32_t* z)
{
    cd_ox_require_ready("cd_ox_vm_vec_copy_scale");
    value args[4] = { Val_long(sx), Val_long(sy), Val_long(sz), Val_long(k) };
    cd_ox_unpack_vec3(caml_callbackN(*g_vm_vec_copy_scale, 4, args), x, y, z);
}

void cd_ox_vm_vec_scale_add(
    int32_t ax,
    int32_t ay,
    int32_t az,
    int32_t bx,
    int32_t by,
    int32_t bz,
    int32_t k,
    int32_t* x,
    int32_t* y,
    int32_t* z)
{
    cd_ox_require_ready("cd_ox_vm_vec_scale_add");
    value args[7] = { Val_long(ax), Val_long(ay), Val_long(az), Val_long(bx), Val_long(by), Val_long(bz), Val_long(k) };
    cd_ox_unpack_vec3(caml_callbackN(*g_vm_vec_scale_add, 7, args), x, y, z);
}

void cd_ox_vm_vec_scale_add2(
    int32_t dx,
    int32_t dy,
    int32_t dz,
    int32_t sx,
    int32_t sy,
    int32_t sz,
    int32_t k,
    int32_t* x,
    int32_t* y,
    int32_t* z)
{
    cd_ox_require_ready("cd_ox_vm_vec_scale_add2");
    value args[7] = { Val_long(dx), Val_long(dy), Val_long(dz), Val_long(sx), Val_long(sy), Val_long(sz), Val_long(k) };
    cd_ox_unpack_vec3(caml_callbackN(*g_vm_vec_scale_add2, 7, args), x, y, z);
}

void cd_ox_vm_vec_scale2(int32_t dx, int32_t dy, int32_t dz, int32_t n, int32_t d, int32_t* x, int32_t* y, int32_t* z)
{
    cd_ox_require_ready("cd_ox_vm_vec_scale2");
    value args[5] = { Val_long(dx), Val_long(dy), Val_long(dz), Val_long(n), Val_long(d) };
    cd_ox_unpack_vec3(caml_callbackN(*g_vm_vec_scale2, 5, args), x, y, z);
}

int32_t cd_ox_vm_vec_mag(int32_t x, int32_t y, int32_t z)
{
    cd_ox_require_ready("cd_ox_vm_vec_mag");
    value args[3] = { Val_long(x), Val_long(y), Val_long(z) };
    return Int_val(caml_callbackN(*g_vm_vec_mag, 3, args));
}

int32_t cd_ox_vm_vec_dist(int32_t x0, int32_t y0, int32_t z0, int32_t x1, int32_t y1, int32_t z1)
{
    cd_ox_require_ready("cd_ox_vm_vec_dist");
    value args[6] = { Val_long(x0), Val_long(y0), Val_long(z0), Val_long(x1), Val_long(y1), Val_long(z1) };
    return Int_val(caml_callbackN(*g_vm_vec_dist, 6, args));
}

int32_t cd_ox_vm_vec_dotprod(int32_t x0, int32_t y0, int32_t z0, int32_t x1, int32_t y1, int32_t z1)
{
    cd_ox_require_ready("cd_ox_vm_vec_dotprod");
    value args[6] = { Val_long(x0), Val_long(y0), Val_long(z0), Val_long(x1), Val_long(y1), Val_long(z1) };
    return Int_val(caml_callbackN(*g_vm_vec_dotprod, 6, args));
}

int32_t cd_ox_vm_vec_dot3(int32_t x, int32_t y, int32_t z, int32_t vx, int32_t vy, int32_t vz)
{
    cd_ox_require_ready("cd_ox_vm_vec_dot3");
    value args[6] = { Val_long(x), Val_long(y), Val_long(z), Val_long(vx), Val_long(vy), Val_long(vz) };
    return Int_val(caml_callbackN(*g_vm_vec_dot3, 6, args));
}

void cd_ox_vm_vec_crossprod(
    int32_t x0, int32_t y0, int32_t z0,
    int32_t x1, int32_t y1, int32_t z1,
    int32_t* rx, int32_t* ry, int32_t* rz)
{
    cd_ox_require_ready("cd_ox_vm_vec_crossprod");
    value args[6] = { Val_long(x0), Val_long(y0), Val_long(z0), Val_long(x1), Val_long(y1), Val_long(z1) };
    cd_ox_unpack_vec3(caml_callbackN(*g_vm_vec_crossprod, 6, args), rx, ry, rz);
}

void cd_ox_vm_vec_perp(
    int32_t p0x, int32_t p0y, int32_t p0z,
    int32_t p1x, int32_t p1y, int32_t p1z,
    int32_t p2x, int32_t p2y, int32_t p2z,
    int32_t* rx, int32_t* ry, int32_t* rz)
{
    cd_ox_require_ready("cd_ox_vm_vec_perp");
    value args[9] = {
        Val_long(p0x), Val_long(p0y), Val_long(p0z),
        Val_long(p1x), Val_long(p1y), Val_long(p1z),
        Val_long(p2x), Val_long(p2y), Val_long(p2z),
    };
    cd_ox_unpack_vec3(caml_callbackN(*g_vm_vec_perp, 9, args), rx, ry, rz);
}

int32_t cd_ox_vm_vec_copy_normalize(
    int32_t sx, int32_t sy, int32_t sz,
    int32_t* nx, int32_t* ny, int32_t* nz)
{
    cd_ox_require_ready("cd_ox_vm_vec_copy_normalize");
    value args[3] = { Val_long(sx), Val_long(sy), Val_long(sz) };
    const value out = caml_callbackN(*g_vm_vec_copy_normalize, 3, args);
    int32_t mag = Int_val(Field(out, 0));
    if (nx) { *nx = Int_val(Field(out, 1)); }
    if (ny) { *ny = Int_val(Field(out, 2)); }
    if (nz) { *nz = Int_val(Field(out, 3)); }
    return mag;
}

void cd_ox_vm_vec_rotate(
    int32_t sx, int32_t sy, int32_t sz,
    int32_t r1, int32_t r2, int32_t r3,
    int32_t u1, int32_t u2, int32_t u3,
    int32_t f1, int32_t f2, int32_t f3,
    int32_t* rx, int32_t* ry, int32_t* rz)
{
    cd_ox_require_ready("cd_ox_vm_vec_rotate");
    value args[12] = {
        Val_long(sx), Val_long(sy), Val_long(sz),
        Val_long(r1), Val_long(r2), Val_long(r3),
        Val_long(u1), Val_long(u2), Val_long(u3),
        Val_long(f1), Val_long(f2), Val_long(f3),
    };
    cd_ox_unpack_vec3(caml_callbackN(*g_vm_vec_rotate, 12, args), rx, ry, rz);
}

static void cd_ox_unpack_matrix(const value out,
    int32_t* r1, int32_t* r2, int32_t* r3,
    int32_t* u1, int32_t* u2, int32_t* u3,
    int32_t* f1, int32_t* f2, int32_t* f3)
{
    value rvec = Field(out, 0);
    value uvec = Field(out, 1);
    value fvec = Field(out, 2);
    *r1 = Int_val(Field(rvec, 0)); *r2 = Int_val(Field(rvec, 1)); *r3 = Int_val(Field(rvec, 2));
    *u1 = Int_val(Field(uvec, 0)); *u2 = Int_val(Field(uvec, 1)); *u3 = Int_val(Field(uvec, 2));
    *f1 = Int_val(Field(fvec, 0)); *f2 = Int_val(Field(fvec, 1)); *f3 = Int_val(Field(fvec, 2));
}

static void cd_ox_unpack_ang3(const value out, int32_t* p, int32_t* b, int32_t* h)
{
    *p = Int_val(Field(out, 0));
    *b = Int_val(Field(out, 1));
    *h = Int_val(Field(out, 2));
}

void cd_ox_sincos_2_matrix(
    int32_t sinp, int32_t cosp, int32_t sinb, int32_t cosb, int32_t sinh, int32_t cosh,
    int32_t* r1, int32_t* r2, int32_t* r3,
    int32_t* u1, int32_t* u2, int32_t* u3,
    int32_t* f1, int32_t* f2, int32_t* f3)
{
    cd_ox_require_ready("cd_ox_sincos_2_matrix");
    value args[6] = { Val_long(sinp), Val_long(cosp), Val_long(sinb), Val_long(cosb), Val_long(sinh), Val_long(cosh) };
    cd_ox_unpack_matrix(caml_callbackN(*g_sincos_2_matrix, 6, args), r1, r2, r3, u1, u2, u3, f1, f2, f3);
}

void cd_ox_vm_angles_2_matrix(
    int32_t p, int32_t b, int32_t h,
    int32_t* r1, int32_t* r2, int32_t* r3,
    int32_t* u1, int32_t* u2, int32_t* u3,
    int32_t* f1, int32_t* f2, int32_t* f3)
{
    cd_ox_require_ready("cd_ox_vm_angles_2_matrix");
    value args[3] = { Val_long(p), Val_long(b), Val_long(h) };
    cd_ox_unpack_matrix(caml_callbackN(*g_vm_angles_2_matrix, 3, args), r1, r2, r3, u1, u2, u3, f1, f2, f3);
}

void cd_ox_vm_vec_ang_2_matrix(
    int32_t vx, int32_t vy, int32_t vz, int32_t a,
    int32_t* r1, int32_t* r2, int32_t* r3,
    int32_t* u1, int32_t* u2, int32_t* u3,
    int32_t* f1, int32_t* f2, int32_t* f3)
{
    cd_ox_require_ready("cd_ox_vm_vec_ang_2_matrix");
    value args[4] = { Val_long(vx), Val_long(vy), Val_long(vz), Val_long(a) };
    cd_ox_unpack_matrix(caml_callbackN(*g_vm_vec_ang_2_matrix, 4, args), r1, r2, r3, u1, u2, u3, f1, f2, f3);
}

void cd_ox_vm_transpose_matrix(
    int32_t r1, int32_t r2, int32_t r3,
    int32_t u1, int32_t u2, int32_t u3,
    int32_t f1, int32_t f2, int32_t f3,
    int32_t* or1, int32_t* or2, int32_t* or3,
    int32_t* ou1, int32_t* ou2, int32_t* ou3,
    int32_t* of1, int32_t* of2, int32_t* of3)
{
    cd_ox_require_ready("cd_ox_vm_transpose_matrix");
    value args[9] = {
        Val_long(r1), Val_long(r2), Val_long(r3),
        Val_long(u1), Val_long(u2), Val_long(u3),
        Val_long(f1), Val_long(f2), Val_long(f3),
    };
    cd_ox_unpack_matrix(caml_callbackN(*g_vm_transpose_matrix, 9, args), or1, or2, or3, ou1, ou2, ou3, of1, of2, of3);
}

void cd_ox_vm_matrix_x_matrix(
    int32_t s0r1, int32_t s0r2, int32_t s0r3,
    int32_t s0u1, int32_t s0u2, int32_t s0u3,
    int32_t s0f1, int32_t s0f2, int32_t s0f3,
    int32_t s1r1, int32_t s1r2, int32_t s1r3,
    int32_t s1u1, int32_t s1u2, int32_t s1u3,
    int32_t s1f1, int32_t s1f2, int32_t s1f3,
    int32_t* or1, int32_t* or2, int32_t* or3,
    int32_t* ou1, int32_t* ou2, int32_t* ou3,
    int32_t* of1, int32_t* of2, int32_t* of3)
{
    cd_ox_require_ready("cd_ox_vm_matrix_x_matrix");
    value args[18] = {
        Val_long(s0r1), Val_long(s0r2), Val_long(s0r3),
        Val_long(s0u1), Val_long(s0u2), Val_long(s0u3),
        Val_long(s0f1), Val_long(s0f2), Val_long(s0f3),
        Val_long(s1r1), Val_long(s1r2), Val_long(s1r3),
        Val_long(s1u1), Val_long(s1u2), Val_long(s1u3),
        Val_long(s1f1), Val_long(s1f2), Val_long(s1f3),
    };
    cd_ox_unpack_matrix(caml_callbackN(*g_vm_matrix_x_matrix, 18, args), or1, or2, or3, ou1, ou2, ou3, of1, of2, of3);
}

void cd_ox_vm_vector_2_matrix(
    int32_t fx, int32_t fy, int32_t fz,
    int32_t has_uvec, int32_t ux, int32_t uy, int32_t uz,
    int32_t has_rvec, int32_t rx, int32_t ry, int32_t rz,
    int32_t* or1, int32_t* or2, int32_t* or3,
    int32_t* ou1, int32_t* ou2, int32_t* ou3,
    int32_t* of1, int32_t* of2, int32_t* of3)
{
    cd_ox_require_ready("cd_ox_vm_vector_2_matrix");
    value args[11] = {
        Val_long(fx), Val_long(fy), Val_long(fz),
        Val_long(has_uvec), Val_long(ux), Val_long(uy), Val_long(uz),
        Val_long(has_rvec), Val_long(rx), Val_long(ry), Val_long(rz),
    };
    cd_ox_unpack_matrix(caml_callbackN(*g_vm_vector_2_matrix, 11, args), or1, or2, or3, ou1, ou2, ou3, of1, of2, of3);
}

void cd_ox_vm_vector_2_matrix_norm(
    int32_t fx, int32_t fy, int32_t fz,
    int32_t has_uvec, int32_t ux, int32_t uy, int32_t uz,
    int32_t has_rvec, int32_t rx, int32_t ry, int32_t rz,
    int32_t* or1, int32_t* or2, int32_t* or3,
    int32_t* ou1, int32_t* ou2, int32_t* ou3,
    int32_t* of1, int32_t* of2, int32_t* of3)
{
    cd_ox_require_ready("cd_ox_vm_vector_2_matrix_norm");
    value args[11] = {
        Val_long(fx), Val_long(fy), Val_long(fz),
        Val_long(has_uvec), Val_long(ux), Val_long(uy), Val_long(uz),
        Val_long(has_rvec), Val_long(rx), Val_long(ry), Val_long(rz),
    };
    cd_ox_unpack_matrix(caml_callbackN(*g_vm_vector_2_matrix_norm, 11, args), or1, or2, or3, ou1, ou2, ou3, of1, of2, of3);
}

void cd_ox_vm_extract_angles_matrix(
    int32_t r1, int32_t r2, int32_t r3,
    int32_t u1, int32_t u2, int32_t u3,
    int32_t f1, int32_t f2, int32_t f3,
    int32_t* p, int32_t* b, int32_t* h)
{
    cd_ox_require_ready("cd_ox_vm_extract_angles_matrix");
    value args[9] = {
        Val_long(r1), Val_long(r2), Val_long(r3),
        Val_long(u1), Val_long(u2), Val_long(u3),
        Val_long(f1), Val_long(f2), Val_long(f3),
    };
    cd_ox_unpack_ang3(caml_callbackN(*g_vm_extract_angles_matrix, 9, args), p, b, h);
}

void cd_ox_vm_extract_angles_vector_normalized(
    int32_t x, int32_t y, int32_t z,
    int32_t* p, int32_t* b, int32_t* h)
{
    cd_ox_require_ready("cd_ox_vm_extract_angles_vector_normalized");
    value args[3] = { Val_long(x), Val_long(y), Val_long(z) };
    cd_ox_unpack_ang3(caml_callbackN(*g_vm_extract_angles_vector_normalized, 3, args), p, b, h);
}

void cd_ox_vm_extract_angles_vector(
    int32_t ip, int32_t ib, int32_t ih,
    int32_t vx, int32_t vy, int32_t vz,
    int32_t* p, int32_t* b, int32_t* h)
{
    cd_ox_require_ready("cd_ox_vm_extract_angles_vector");
    value args[6] = { Val_long(ip), Val_long(ib), Val_long(ih), Val_long(vx), Val_long(vy), Val_long(vz) };
    cd_ox_unpack_ang3(caml_callbackN(*g_vm_extract_angles_vector, 6, args), p, b, h);
}

int32_t cd_ox_vm_vec_delta_ang_norm(
    int32_t v0x, int32_t v0y, int32_t v0z,
    int32_t v1x, int32_t v1y, int32_t v1z,
    int32_t has_fvec, int32_t fx, int32_t fy, int32_t fz)
{
    cd_ox_require_ready("cd_ox_vm_vec_delta_ang_norm");
    value args[10] = {
        Val_long(v0x), Val_long(v0y), Val_long(v0z),
        Val_long(v1x), Val_long(v1y), Val_long(v1z),
        Val_long(has_fvec), Val_long(fx), Val_long(fy), Val_long(fz),
    };
    return Int_val(caml_callbackN(*g_vm_vec_delta_ang_norm, 10, args));
}

int32_t cd_ox_vm_vec_delta_ang(
    int32_t v0x, int32_t v0y, int32_t v0z,
    int32_t v1x, int32_t v1y, int32_t v1z,
    int32_t has_fvec, int32_t fx, int32_t fy, int32_t fz)
{
    cd_ox_require_ready("cd_ox_vm_vec_delta_ang");
    value args[10] = {
        Val_long(v0x), Val_long(v0y), Val_long(v0z),
        Val_long(v1x), Val_long(v1y), Val_long(v1z),
        Val_long(has_fvec), Val_long(fx), Val_long(fy), Val_long(fz),
    };
    return Int_val(caml_callbackN(*g_vm_vec_delta_ang, 10, args));
}

int32_t cd_ox_vm_vec_mag_quick(int32_t x, int32_t y, int32_t z)
{
    cd_ox_require_ready("cd_ox_vm_vec_mag_quick");
    value args[3] = { Val_long(x), Val_long(y), Val_long(z) };
    return Int_val(caml_callbackN(*g_vm_vec_mag_quick, 3, args));
}

int32_t cd_ox_vm_vec_dist_quick(int32_t x0, int32_t y0, int32_t z0, int32_t x1, int32_t y1, int32_t z1)
{
    cd_ox_require_ready("cd_ox_vm_vec_dist_quick");
    value args[6] = { Val_long(x0), Val_long(y0), Val_long(z0), Val_long(x1), Val_long(y1), Val_long(z1) };
    return Int_val(caml_callbackN(*g_vm_vec_dist_quick, 6, args));
}

int32_t cd_ox_vm_vec_copy_normalize_quick(
    int32_t sx, int32_t sy, int32_t sz,
    int32_t* nx, int32_t* ny, int32_t* nz)
{
    cd_ox_require_ready("cd_ox_vm_vec_copy_normalize_quick");
    value args[3] = { Val_long(sx), Val_long(sy), Val_long(sz) };
    const value out = caml_callbackN(*g_vm_vec_copy_normalize_quick, 3, args);
    int32_t mag = Int_val(Field(out, 0));
    if (nx) { *nx = Int_val(Field(out, 1)); }
    if (ny) { *ny = Int_val(Field(out, 2)); }
    if (nz) { *nz = Int_val(Field(out, 3)); }
    return mag;
}

/* ---- 3D pipeline bridge functions ---- */

uint8_t cd_ox_g3_code_point(int32_t x, int32_t y, int32_t z)
{
    cd_ox_require_ready("cd_ox_g3_code_point");
    value args[3] = { Val_long(x), Val_long(y), Val_long(z) };
    return (uint8_t)Int_val(caml_callbackN(*g_g3_code_point, 3, args));
}

int cd_ox_checkmuldiv(int32_t* r, int32_t a, int32_t b, int32_t c)
{
    cd_ox_require_ready("cd_ox_checkmuldiv");
    value args[3] = { Val_long(a), Val_long(b), Val_long(c) };
    const value out = caml_callbackN(*g_checkmuldiv, 3, args);
    int ok = Int_val(Field(out, 0));
    *r = Int_val(Field(out, 1));
    return ok;
}

void cd_ox_g3_rotate_point(
    int32_t sx, int32_t sy, int32_t sz,
    int32_t vpx, int32_t vpy, int32_t vpz,
    int32_t r1, int32_t r2, int32_t r3,
    int32_t u1, int32_t u2, int32_t u3,
    int32_t f1, int32_t f2, int32_t f3,
    int32_t* rx, int32_t* ry, int32_t* rz, uint8_t* codes)
{
    cd_ox_require_ready("cd_ox_g3_rotate_point");
    value args[15] = {
        Val_long(sx), Val_long(sy), Val_long(sz),
        Val_long(vpx), Val_long(vpy), Val_long(vpz),
        Val_long(r1), Val_long(r2), Val_long(r3),
        Val_long(u1), Val_long(u2), Val_long(u3),
        Val_long(f1), Val_long(f2), Val_long(f3),
    };
    const value out = caml_callbackN(*g_g3_rotate_point, 15, args);
    *rx = Int_val(Field(out, 0));
    *ry = Int_val(Field(out, 1));
    *rz = Int_val(Field(out, 2));
    *codes = (uint8_t)Int_val(Field(out, 3));
}

int cd_ox_g3_project_point(
    int32_t x, int32_t y, int32_t z,
    int32_t canv_w2, int32_t canv_h2,
    int32_t* sx, int32_t* sy)
{
    cd_ox_require_ready("cd_ox_g3_project_point");
    value args[5] = { Val_long(x), Val_long(y), Val_long(z), Val_long(canv_w2), Val_long(canv_h2) };
    const value out = caml_callbackN(*g_g3_project_point, 5, args);
    int ok = Int_val(Field(out, 0));
    *sx = Int_val(Field(out, 1));
    *sy = Int_val(Field(out, 2));
    return ok;
}

void cd_ox_g3_rotate_delta_x(
    int32_t r1, int32_t r2, int32_t r3,
    int32_t u1, int32_t u2, int32_t u3,
    int32_t f1, int32_t f2, int32_t f3,
    int32_t dx,
    int32_t* rx, int32_t* ry, int32_t* rz)
{
    cd_ox_require_ready("cd_ox_g3_rotate_delta_x");
    value args[10] = {
        Val_long(r1), Val_long(r2), Val_long(r3),
        Val_long(u1), Val_long(u2), Val_long(u3),
        Val_long(f1), Val_long(f2), Val_long(f3),
        Val_long(dx),
    };
    cd_ox_unpack_vec3(caml_callbackN(*g_g3_rotate_delta_x, 10, args), rx, ry, rz);
}

void cd_ox_g3_rotate_delta_y(
    int32_t r1, int32_t r2, int32_t r3,
    int32_t u1, int32_t u2, int32_t u3,
    int32_t f1, int32_t f2, int32_t f3,
    int32_t dy,
    int32_t* rx, int32_t* ry, int32_t* rz)
{
    cd_ox_require_ready("cd_ox_g3_rotate_delta_y");
    value args[10] = {
        Val_long(r1), Val_long(r2), Val_long(r3),
        Val_long(u1), Val_long(u2), Val_long(u3),
        Val_long(f1), Val_long(f2), Val_long(f3),
        Val_long(dy),
    };
    cd_ox_unpack_vec3(caml_callbackN(*g_g3_rotate_delta_y, 10, args), rx, ry, rz);
}

void cd_ox_g3_rotate_delta_z(
    int32_t r1, int32_t r2, int32_t r3,
    int32_t u1, int32_t u2, int32_t u3,
    int32_t f1, int32_t f2, int32_t f3,
    int32_t dz,
    int32_t* rx, int32_t* ry, int32_t* rz)
{
    cd_ox_require_ready("cd_ox_g3_rotate_delta_z");
    value args[10] = {
        Val_long(r1), Val_long(r2), Val_long(r3),
        Val_long(u1), Val_long(u2), Val_long(u3),
        Val_long(f1), Val_long(f2), Val_long(f3),
        Val_long(dz),
    };
    cd_ox_unpack_vec3(caml_callbackN(*g_g3_rotate_delta_z, 10, args), rx, ry, rz);
}

int32_t cd_ox_g3_calc_point_depth(
    int32_t px, int32_t py, int32_t pz,
    int32_t vpx, int32_t vpy, int32_t vpz,
    int32_t fx, int32_t fy, int32_t fz)
{
    cd_ox_require_ready("cd_ox_g3_calc_point_depth");
    value args[9] = {
        Val_long(px), Val_long(py), Val_long(pz),
        Val_long(vpx), Val_long(vpy), Val_long(vpz),
        Val_long(fx), Val_long(fy), Val_long(fz),
    };
    return Int_val(caml_callbackN(*g_g3_calc_point_depth, 9, args));
}

void cd_ox_scale_matrix(
    int32_t r1, int32_t r2, int32_t r3,
    int32_t u1, int32_t u2, int32_t u3,
    int32_t f1, int32_t f2, int32_t f3,
    int32_t wsx, int32_t wsy, int32_t wsz,
    int32_t zoom,
    int32_t* or1, int32_t* or2, int32_t* or3,
    int32_t* ou1, int32_t* ou2, int32_t* ou3,
    int32_t* of1, int32_t* of2, int32_t* of3,
    int32_t* msx, int32_t* msy, int32_t* msz)
{
    cd_ox_require_ready("cd_ox_scale_matrix");
    value args[13] = {
        Val_long(r1), Val_long(r2), Val_long(r3),
        Val_long(u1), Val_long(u2), Val_long(u3),
        Val_long(f1), Val_long(f2), Val_long(f3),
        Val_long(wsx), Val_long(wsy), Val_long(wsz),
        Val_long(zoom),
    };
    const value out = caml_callbackN(*g_scale_matrix, 13, args);
    *or1 = Int_val(Field(out, 0)); *or2 = Int_val(Field(out, 1)); *or3 = Int_val(Field(out, 2));
    *ou1 = Int_val(Field(out, 3)); *ou2 = Int_val(Field(out, 4)); *ou3 = Int_val(Field(out, 5));
    *of1 = Int_val(Field(out, 6)); *of2 = Int_val(Field(out, 7)); *of3 = Int_val(Field(out, 8));
    *msx = Int_val(Field(out, 9)); *msy = Int_val(Field(out, 10)); *msz = Int_val(Field(out, 11));
}

void cd_ox_g3_start_instance_matrix(
    int32_t vpx, int32_t vpy, int32_t vpz,
    int32_t r1, int32_t r2, int32_t r3,
    int32_t u1, int32_t u2, int32_t u3,
    int32_t f1, int32_t f2, int32_t f3,
    int32_t px, int32_t py, int32_t pz,
    int32_t has_orient,
    int32_t mr1, int32_t mr2, int32_t mr3,
    int32_t mu1, int32_t mu2, int32_t mu3,
    int32_t mf1, int32_t mf2, int32_t mf3,
    int32_t* nvpx, int32_t* nvpy, int32_t* nvpz,
    int32_t* nr1, int32_t* nr2, int32_t* nr3,
    int32_t* nu1, int32_t* nu2, int32_t* nu3,
    int32_t* nf1, int32_t* nf2, int32_t* nf3)
{
    cd_ox_require_ready("cd_ox_g3_start_instance_matrix");
    value args[25] = {
        Val_long(vpx), Val_long(vpy), Val_long(vpz),
        Val_long(r1), Val_long(r2), Val_long(r3),
        Val_long(u1), Val_long(u2), Val_long(u3),
        Val_long(f1), Val_long(f2), Val_long(f3),
        Val_long(px), Val_long(py), Val_long(pz),
        Val_long(has_orient),
        Val_long(mr1), Val_long(mr2), Val_long(mr3),
        Val_long(mu1), Val_long(mu2), Val_long(mu3),
        Val_long(mf1), Val_long(mf2), Val_long(mf3),
    };
    const value out = caml_callbackN(*g_g3_start_instance_matrix, 25, args);
    *nvpx = Int_val(Field(out, 0)); *nvpy = Int_val(Field(out, 1)); *nvpz = Int_val(Field(out, 2));
    *nr1 = Int_val(Field(out, 3)); *nr2 = Int_val(Field(out, 4)); *nr3 = Int_val(Field(out, 5));
    *nu1 = Int_val(Field(out, 6)); *nu2 = Int_val(Field(out, 7)); *nu3 = Int_val(Field(out, 8));
    *nf1 = Int_val(Field(out, 9)); *nf2 = Int_val(Field(out, 10)); *nf3 = Int_val(Field(out, 11));
}

void cd_ox_g3_point_2_vec(
    int32_t sx, int32_t sy,
    int32_t canv_w2, int32_t canv_h2,
    int32_t msx, int32_t msy, int32_t msz,
    int32_t ur1, int32_t ur2, int32_t ur3,
    int32_t uu1, int32_t uu2, int32_t uu3,
    int32_t uf1, int32_t uf2, int32_t uf3,
    int32_t* vx, int32_t* vy, int32_t* vz)
{
    cd_ox_require_ready("cd_ox_g3_point_2_vec");
    value args[16] = {
        Val_long(sx), Val_long(sy),
        Val_long(canv_w2), Val_long(canv_h2),
        Val_long(msx), Val_long(msy), Val_long(msz),
        Val_long(ur1), Val_long(ur2), Val_long(ur3),
        Val_long(uu1), Val_long(uu2), Val_long(uu3),
        Val_long(uf1), Val_long(uf2), Val_long(uf3),
    };
    const value out = caml_callbackN(*g_g3_point_2_vec, 16, args);
    *vx = Int_val(Field(out, 0)); *vy = Int_val(Field(out, 1)); *vz = Int_val(Field(out, 2));
}

void cd_ox_clip_line(
    int32_t p0x, int32_t p0y, int32_t p0z, int32_t p0_codes,
    int32_t p1x, int32_t p1y, int32_t p1z, int32_t p1_codes,
    int32_t codes_or,
    int32_t* out_p0x, int32_t* out_p0y, int32_t* out_p0z, uint8_t* out_p0_codes,
    int32_t* out_p1x, int32_t* out_p1y, int32_t* out_p1z, uint8_t* out_p1_codes,
    int* out_clipped)
{
    cd_ox_require_ready("cd_ox_clip_line");
    value args[9] = {
        Val_long(p0x), Val_long(p0y), Val_long(p0z), Val_long(p0_codes),
        Val_long(p1x), Val_long(p1y), Val_long(p1z), Val_long(p1_codes),
        Val_long(codes_or),
    };
    const value out = caml_callbackN(*g_clip_line, 9, args);
    *out_p0x = Int_val(Field(out, 0));
    *out_p0y = Int_val(Field(out, 1));
    *out_p0z = Int_val(Field(out, 2));
    *out_p0_codes = (uint8_t)Int_val(Field(out, 3));
    *out_p1x = Int_val(Field(out, 4));
    *out_p1y = Int_val(Field(out, 5));
    *out_p1z = Int_val(Field(out, 6));
    *out_p1_codes = (uint8_t)Int_val(Field(out, 7));
    *out_clipped = Int_val(Field(out, 8));
}

void cd_ox_clip_polygon(
    int32_t codes_or, int32_t codes_and,
    int nv, const int32_t* flat_in,
    int* out_nv, int32_t* out_flat,
    int32_t* out_codes_or, int32_t* out_codes_and)
{
    cd_ox_require_ready("cd_ox_clip_polygon");

    CAMLparam0();
    CAMLlocal2(arr, result);

    int arr_len = 1 + nv * 8;
    arr = caml_alloc(arr_len, 0);
    Store_field(arr, 0, Val_long(nv));
    for (int i = 0; i < nv * 8; i++)
    {
        Store_field(arr, 1 + i, Val_long(flat_in[i]));
    }

    value cb_args[3] = { Val_long(codes_or), Val_long(codes_and), arr };
    result = caml_callbackN(*g_clip_polygon, 3, cb_args);

    *out_codes_or = Int_val(Field(result, 0));
    *out_codes_and = Int_val(Field(result, 1));
    int result_size = Wosize_val(result);
    int out_count = (result_size - 2) / 8;
    *out_nv = out_count;
    for (int i = 0; i < out_count * 8; i++)
    {
        out_flat[i] = Int_val(Field(result, 2 + i));
    }

    CAMLreturn0;
}

void cd_ox_clip_edge(
    int32_t plane_flag,
    int32_t on_x, int32_t on_y, int32_t on_z,
    int32_t on_u, int32_t on_v, int32_t on_l, int32_t on_flags,
    int32_t off_x, int32_t off_y, int32_t off_z,
    int32_t off_u, int32_t off_v, int32_t off_l,
    int32_t* nx, int32_t* ny, int32_t* nz,
    int32_t* nu, int32_t* nv, int32_t* nl,
    int32_t* nflags, uint8_t* ncodes)
{
    cd_ox_require_ready("cd_ox_clip_edge");
    value args[14] = {
        Val_long(plane_flag),
        Val_long(on_x), Val_long(on_y), Val_long(on_z),
        Val_long(on_u), Val_long(on_v), Val_long(on_l), Val_long(on_flags),
        Val_long(off_x), Val_long(off_y), Val_long(off_z),
        Val_long(off_u), Val_long(off_v), Val_long(off_l),
    };
    const value out = caml_callbackN(*g_clip_edge, 14, args);
    *nx = Int_val(Field(out, 0));
    *ny = Int_val(Field(out, 1));
    *nz = Int_val(Field(out, 2));
    *nu = Int_val(Field(out, 3));
    *nv = Int_val(Field(out, 4));
    *nl = Int_val(Field(out, 5));
    *nflags = Int_val(Field(out, 6));
    *ncodes = (uint8_t)Int_val(Field(out, 7));
}

int cd_ox_g3_check_normal_facing(
    int32_t vpx, int32_t vpy, int32_t vpz,
    int32_t vx, int32_t vy, int32_t vz,
    int32_t nx, int32_t ny, int32_t nz)
{
    cd_ox_require_ready("cd_ox_g3_check_normal_facing");
    value args[9] = {
        Val_long(vpx), Val_long(vpy), Val_long(vpz),
        Val_long(vx), Val_long(vy), Val_long(vz),
        Val_long(nx), Val_long(ny), Val_long(nz),
    };
    return Int_val(caml_callbackN(*g_g3_check_normal_facing, 9, args));
}

int cd_ox_do_facing_check_computed(
    int32_t p0x, int32_t p0y, int32_t p0z,
    int32_t p1x, int32_t p1y, int32_t p1z,
    int32_t p2x, int32_t p2y, int32_t p2z)
{
    cd_ox_require_ready("cd_ox_do_facing_check_computed");
    value args[9] = {
        Val_long(p0x), Val_long(p0y), Val_long(p0z),
        Val_long(p1x), Val_long(p1y), Val_long(p1z),
        Val_long(p2x), Val_long(p2y), Val_long(p2z),
    };
    return Int_val(caml_callbackN(*g_do_facing_check_computed, 9, args));
}

int cd_ox_calc_rod_corners(
    int32_t bx, int32_t by, int32_t bz, int32_t bw,
    int32_t tx, int32_t ty, int32_t tz, int32_t tw,
    int32_t msx, int32_t msy, int32_t msz,
    int32_t* c0x, int32_t* c0y, int32_t* c0z,
    int32_t* c1x, int32_t* c1y, int32_t* c1z,
    int32_t* c2x, int32_t* c2y, int32_t* c2z,
    int32_t* c3x, int32_t* c3y, int32_t* c3z,
    uint8_t* codes_and)
{
    cd_ox_require_ready("cd_ox_calc_rod_corners");
    value args[11] = {
        Val_long(bx), Val_long(by), Val_long(bz), Val_long(bw),
        Val_long(tx), Val_long(ty), Val_long(tz), Val_long(tw),
        Val_long(msx), Val_long(msy), Val_long(msz),
    };
    const value out = caml_callbackN(*g_calc_rod_corners, 11, args);
    *c0x = Int_val(Field(out, 0)); *c0y = Int_val(Field(out, 1)); *c0z = Int_val(Field(out, 2));
    *c1x = Int_val(Field(out, 3)); *c1y = Int_val(Field(out, 4)); *c1z = Int_val(Field(out, 5));
    *c2x = Int_val(Field(out, 6)); *c2y = Int_val(Field(out, 7)); *c2z = Int_val(Field(out, 8));
    *c3x = Int_val(Field(out, 9)); *c3y = Int_val(Field(out, 10)); *c3z = Int_val(Field(out, 11));
    *codes_and = (uint8_t)Int_val(Field(out, 12));
    return (*codes_and != 0) ? 1 : 0;
}

void cd_ox_compute_center_point_on_side(
    int32_t v0x, int32_t v0y, int32_t v0z,
    int32_t v1x, int32_t v1y, int32_t v1z,
    int32_t v2x, int32_t v2y, int32_t v2z,
    int32_t v3x, int32_t v3y, int32_t v3z,
    int32_t* cx, int32_t* cy, int32_t* cz)
{
    cd_ox_require_ready("cd_ox_compute_center_point_on_side");
    value args[12] = {
        Val_long(v0x), Val_long(v0y), Val_long(v0z),
        Val_long(v1x), Val_long(v1y), Val_long(v1z),
        Val_long(v2x), Val_long(v2y), Val_long(v2z),
        Val_long(v3x), Val_long(v3y), Val_long(v3z),
    };
    const value out = caml_callbackN(*g_compute_center_point_on_side, 12, args);
    *cx = Int_val(Field(out, 0));
    *cy = Int_val(Field(out, 1));
    *cz = Int_val(Field(out, 2));
}

void cd_ox_compute_segment_center(
    const int32_t* verts_24, int32_t* cx, int32_t* cy, int32_t* cz)
{
    cd_ox_require_ready("cd_ox_compute_segment_center");

    CAMLparam0();
    CAMLlocal2(arr, result);

    arr = caml_alloc(24, 0);
    for (int i = 0; i < 24; i++)
        Store_field(arr, i, Val_long(verts_24[i]));

    result = caml_callback(*g_compute_segment_center, arr);
    *cx = Int_val(Field(result, 0));
    *cy = Int_val(Field(result, 1));
    *cz = Int_val(Field(result, 2));
    CAMLreturn0;
}

void cd_ox_get_verts_for_normal(
    int32_t va, int32_t vb, int32_t vc, int32_t vd,
    int32_t* v0, int32_t* v1, int32_t* v2, int32_t* v3, int32_t* negate_flag)
{
    cd_ox_require_ready("cd_ox_get_verts_for_normal");
    value args[4] = { Val_long(va), Val_long(vb), Val_long(vc), Val_long(vd) };
    const value out = caml_callbackN(*g_get_verts_for_normal, 4, args);
    *v0 = Int_val(Field(out, 0));
    *v1 = Int_val(Field(out, 1));
    *v2 = Int_val(Field(out, 2));
    *v3 = Int_val(Field(out, 3));
    *negate_flag = Int_val(Field(out, 4));
}

void cd_ox_create_abs_vertex_lists(
    int32_t side_type, const int32_t* seg_verts_8, int32_t sidenum,
    int32_t* num_faces, int32_t* vertices_6)
{
    cd_ox_require_ready("cd_ox_create_abs_vertex_lists");

    CAMLparam0();
    CAMLlocal2(arr, result);

    arr = caml_alloc(8, 0);
    for (int i = 0; i < 8; i++)
        Store_field(arr, i, Val_long(seg_verts_8[i]));

    value args[3] = { Val_long(side_type), arr, Val_long(sidenum) };
    result = caml_callbackN(*g_create_abs_vertex_lists, 3, args);
    *num_faces = Int_val(Field(result, 0));
    for (int i = 0; i < 6; i++)
        vertices_6[i] = Int_val(Field(result, 1 + i));
    CAMLreturn0;
}

void cd_ox_get_seg_masks(
    const int32_t* packed, int32_t packed_len,
    int32_t* facemask, int32_t* sidemask, int32_t* centermask)
{
    cd_ox_require_ready("cd_ox_get_seg_masks");

    CAMLparam0();
    CAMLlocal2(arr, result);

    /* packed_len = 78: checkp(3) + rad(1) + seg_verts(8) + side_types(6)
       + normals(36) + seg_vert_positions(24) */
    arr = caml_alloc(packed_len, 0);
    for (int i = 0; i < packed_len; i++)
        Store_field(arr, i, Val_long(packed[i]));

    result = caml_callback(*g_get_seg_masks, arr);
    *facemask = Int_val(Field(result, 0));
    *sidemask = Int_val(Field(result, 1));
    *centermask = Int_val(Field(result, 2));
    CAMLreturn0;
}

void cd_ox_get_side_dists(
    const int32_t* packed, int32_t packed_len,
    int32_t* mask, int32_t* side_dists_6)
{
    cd_ox_require_ready("cd_ox_get_side_dists");

    CAMLparam0();
    CAMLlocal2(arr, result);

    /* packed_len = 77: checkp(3) + seg_verts(8) + side_types(6)
       + normals(36) + seg_vert_positions(24) */
    arr = caml_alloc(packed_len, 0);
    for (int i = 0; i < packed_len; i++)
        Store_field(arr, i, Val_long(packed[i]));

    result = caml_callback(*g_get_side_dists, arr);
    *mask = Int_val(Field(result, 0));
    for (int i = 0; i < 6; i++)
        side_dists_6[i] = Int_val(Field(result, 1 + i));
    CAMLreturn0;
}

void cd_ox_extract_vector_from_segment(
    const int32_t* verts_24, int32_t start_side, int32_t end_side,
    int32_t* vx, int32_t* vy, int32_t* vz)
{
    cd_ox_require_ready("cd_ox_extract_vector_from_segment");

    CAMLparam0();
    CAMLlocal2(arr, result);

    arr = caml_alloc(26, 0);
    for (int i = 0; i < 24; i++)
        Store_field(arr, i, Val_long(verts_24[i]));
    Store_field(arr, 24, Val_long(start_side));
    Store_field(arr, 25, Val_long(end_side));

    result = caml_callback(*g_extract_vector_from_segment, arr);
    *vx = Int_val(Field(result, 0));
    *vy = Int_val(Field(result, 1));
    *vz = Int_val(Field(result, 2));
    CAMLreturn0;
}

void cd_ox_extract_orient_from_segment(
    const int32_t* verts_24,
    int32_t* r1, int32_t* r2, int32_t* r3,
    int32_t* u1, int32_t* u2, int32_t* u3,
    int32_t* f1, int32_t* f2, int32_t* f3)
{
    cd_ox_require_ready("cd_ox_extract_orient_from_segment");

    CAMLparam0();
    CAMLlocal2(arr, result);

    arr = caml_alloc(24, 0);
    for (int i = 0; i < 24; i++)
        Store_field(arr, i, Val_long(verts_24[i]));

    result = caml_callback(*g_extract_orient_from_segment, arr);
    *r1 = Int_val(Field(result, 0)); *r2 = Int_val(Field(result, 1)); *r3 = Int_val(Field(result, 2));
    *u1 = Int_val(Field(result, 3)); *u2 = Int_val(Field(result, 4)); *u3 = Int_val(Field(result, 5));
    *f1 = Int_val(Field(result, 6)); *f2 = Int_val(Field(result, 7)); *f3 = Int_val(Field(result, 8));
    CAMLreturn0;
}

/* FVI bridge functions */

void cd_ox_check_line_to_face(
    const int32_t* packed, int32_t packed_len,
    int32_t* hit_type, int32_t* npx, int32_t* npy, int32_t* npz)
{
    cd_ox_require_ready("cd_ox_check_line_to_face");

    CAMLparam0();
    CAMLlocal2(arr, result);

    arr = caml_alloc(packed_len, 0);
    for (int i = 0; i < packed_len; i++)
        Store_field(arr, i, Val_long(packed[i]));

    result = caml_callback(*g_check_line_to_face, arr);
    *hit_type = Int_val(Field(result, 0));
    *npx = Int_val(Field(result, 1));
    *npy = Int_val(Field(result, 2));
    *npz = Int_val(Field(result, 3));
    CAMLreturn0;
}

void cd_ox_special_check_line_to_face(
    const int32_t* packed, int32_t packed_len,
    int32_t* hit_type, int32_t* npx, int32_t* npy, int32_t* npz)
{
    cd_ox_require_ready("cd_ox_special_check_line_to_face");

    CAMLparam0();
    CAMLlocal2(arr, result);

    arr = caml_alloc(packed_len, 0);
    for (int i = 0; i < packed_len; i++)
        Store_field(arr, i, Val_long(packed[i]));

    result = caml_callback(*g_special_check_line_to_face, arr);
    *hit_type = Int_val(Field(result, 0));
    *npx = Int_val(Field(result, 1));
    *npy = Int_val(Field(result, 2));
    *npz = Int_val(Field(result, 3));
    CAMLreturn0;
}

int32_t cd_ox_check_vector_to_sphere_1(
    int32_t p0x, int32_t p0y, int32_t p0z,
    int32_t p1x, int32_t p1y, int32_t p1z,
    int32_t spx, int32_t spy, int32_t spz,
    int32_t srad,
    int32_t* ix, int32_t* iy, int32_t* iz)
{
    cd_ox_require_ready("cd_ox_check_vector_to_sphere_1");
    value args[10] = {
        Val_long(p0x), Val_long(p0y), Val_long(p0z),
        Val_long(p1x), Val_long(p1y), Val_long(p1z),
        Val_long(spx), Val_long(spy), Val_long(spz),
        Val_long(srad)
    };
    const value out = caml_callbackN(*g_check_vector_to_sphere_1, 10, args);
    int32_t dist = Int_val(Field(out, 0));
    *ix = Int_val(Field(out, 1));
    *iy = Int_val(Field(out, 2));
    *iz = Int_val(Field(out, 3));
    return dist;
}

/* -- Collide effect registration + CAMLprim wrappers ------------------- */

void cd_ox_register_collide_effects(
    cd_effect_increment_kills_fn increment_kills,
    cd_effect_start_boss_death_fn start_boss_death,
    cd_effect_explode_object_fn explode_object,
    cd_effect_send_net_robot_explode_fn send_net_robot_explode,
    cd_effect_multi_explode_robot_sub_fn multi_explode_robot_sub)
{
    g_effect_increment_kills = increment_kills;
    g_effect_start_boss_death = start_boss_death;
    g_effect_explode_object = explode_object;
    g_effect_send_net_robot_explode = send_net_robot_explode;
    g_effect_multi_explode_robot_sub = multi_explode_robot_sub;
}

CAMLprim value cd_ox_effect_increment_kills(value unit)
{
    (void)unit;
    if (g_effect_increment_kills) g_effect_increment_kills();
    return Val_unit;
}

CAMLprim value cd_ox_effect_start_boss_death(value v_obj_id)
{
    if (g_effect_start_boss_death) g_effect_start_boss_death(Int_val(v_obj_id));
    return Val_unit;
}

CAMLprim value cd_ox_effect_explode_object(value v_obj_id)
{
    if (g_effect_explode_object) g_effect_explode_object(Int_val(v_obj_id));
    return Val_unit;
}

CAMLprim value cd_ox_effect_send_net_robot_explode(value v_obj_id, value v_killer)
{
    if (g_effect_send_net_robot_explode)
        g_effect_send_net_robot_explode(Int_val(v_obj_id), Int_val(v_killer));
    return Val_unit;
}

CAMLprim value cd_ox_effect_multi_explode_robot_sub(value v_obj_id, value v_killer)
{
    if (g_effect_multi_explode_robot_sub)
        return Val_bool(g_effect_multi_explode_robot_sub(Int_val(v_obj_id), Int_val(v_killer)));
    return Val_bool(0);
}

/* -- Collide / damage bridge ------------------------------------------ */

void cd_ox_apply_damage_to_robot_d1(
    int32_t flags, int32_t shields, int32_t damage,
    int is_boss, int is_multiplayer,
    int obj_id, int killer_objnum,
    int32_t* out_new_shields, int* out_boss_been_hit, int* out_return_value)
{
    cd_ox_require_ready("cd_ox_apply_damage_to_robot_d1");

    CAMLparam0();
    CAMLlocal1(result);

    value args[7] = {
        Val_long(flags), Val_long(shields), Val_long(damage),
        Val_long(is_boss), Val_long(is_multiplayer),
        Val_long(obj_id), Val_long(killer_objnum)
    };
    result = caml_callbackN(*g_apply_damage_to_robot_d1, 7, args);

    *out_new_shields = Int_val(Field(result, 0));
    *out_boss_been_hit = Int_val(Field(result, 1));
    *out_return_value = Int_val(Field(result, 2));

    CAMLreturn0;
}

/* -- D2 Collide effect registration + CAMLprim wrappers ---------------- */

void cd_ox_register_collide_effects_d2(
    cd_effect_increment_kills_fn increment_kills,
    cd_effect_start_boss_death_fn start_boss_death,
    cd_effect_set_boss_hit_time_fn set_boss_hit_time,
    cd_effect_query_player_dead_or_no_shields_fn query_player_dead_or_no_shields,
    cd_effect_query_multi_all_players_alive_fn query_multi_all_players_alive,
    cd_effect_do_final_boss_hacks_fn do_final_boss_hacks,
    cd_effect_multi_send_finish_game_fn multi_send_finish_game,
    cd_effect_save_stolen_items_fn save_stolen_items,
    cd_effect_restore_stolen_items_fn restore_stolen_items,
    cd_effect_clear_stolen_items_fn clear_stolen_items,
    cd_effect_multi_explode_d2_fn multi_explode_d2,
    cd_effect_multi_send_robot_explode_d2_fn multi_send_robot_explode_d2,
    cd_effect_start_robot_death_sequence_fn start_robot_death_sequence,
    cd_effect_special_reactor_stuff_fn special_reactor_stuff,
    cd_effect_explode_object_delay_fn explode_object_delay)
{
    /* Reuse D1 slots for shared effects */
    g_effect_increment_kills = increment_kills;
    g_effect_start_boss_death = start_boss_death;
    /* D2-specific slots */
    g_effect_set_boss_hit_time = set_boss_hit_time;
    g_effect_query_player_dead_or_no_shields = query_player_dead_or_no_shields;
    g_effect_query_multi_all_players_alive = query_multi_all_players_alive;
    g_effect_do_final_boss_hacks = do_final_boss_hacks;
    g_effect_multi_send_finish_game = multi_send_finish_game;
    g_effect_save_stolen_items = save_stolen_items;
    g_effect_restore_stolen_items = restore_stolen_items;
    g_effect_clear_stolen_items = clear_stolen_items;
    g_effect_multi_explode_d2 = multi_explode_d2;
    g_effect_multi_send_robot_explode_d2 = multi_send_robot_explode_d2;
    g_effect_start_robot_death_sequence = start_robot_death_sequence;
    g_effect_special_reactor_stuff = special_reactor_stuff;
    g_effect_explode_object_delay = explode_object_delay;
}

CAMLprim value cd_ox_effect_set_boss_hit_time(value unit)
{
    (void)unit;
    if (g_effect_set_boss_hit_time) g_effect_set_boss_hit_time();
    return Val_unit;
}

CAMLprim value cd_ox_effect_query_player_dead_or_no_shields(value unit)
{
    (void)unit;
    if (g_effect_query_player_dead_or_no_shields)
        return Val_bool(g_effect_query_player_dead_or_no_shields());
    return Val_bool(0);
}

CAMLprim value cd_ox_effect_query_multi_all_players_alive(value unit)
{
    (void)unit;
    if (g_effect_query_multi_all_players_alive)
        return Val_bool(g_effect_query_multi_all_players_alive());
    return Val_bool(0);
}

CAMLprim value cd_ox_effect_do_final_boss_hacks(value unit)
{
    (void)unit;
    if (g_effect_do_final_boss_hacks) g_effect_do_final_boss_hacks();
    return Val_unit;
}

CAMLprim value cd_ox_effect_multi_send_finish_game(value unit)
{
    (void)unit;
    if (g_effect_multi_send_finish_game) g_effect_multi_send_finish_game();
    return Val_unit;
}

CAMLprim value cd_ox_effect_save_stolen_items(value unit)
{
    (void)unit;
    if (g_effect_save_stolen_items) g_effect_save_stolen_items();
    return Val_unit;
}

CAMLprim value cd_ox_effect_restore_stolen_items(value unit)
{
    (void)unit;
    if (g_effect_restore_stolen_items) g_effect_restore_stolen_items();
    return Val_unit;
}

CAMLprim value cd_ox_effect_clear_stolen_items(value unit)
{
    (void)unit;
    if (g_effect_clear_stolen_items) g_effect_clear_stolen_items();
    return Val_unit;
}

CAMLprim value cd_ox_effect_multi_explode_d2(value v_obj_id, value v_killer, value v_is_thief)
{
    if (g_effect_multi_explode_d2)
        return Val_bool(g_effect_multi_explode_d2(
            Int_val(v_obj_id), Int_val(v_killer), Bool_val(v_is_thief)));
    return Val_bool(0);
}

CAMLprim value cd_ox_effect_multi_send_robot_explode_d2(value v_obj_id, value v_killer, value v_is_thief)
{
    if (g_effect_multi_send_robot_explode_d2)
        g_effect_multi_send_robot_explode_d2(
            Int_val(v_obj_id), Int_val(v_killer), Bool_val(v_is_thief));
    return Val_unit;
}

CAMLprim value cd_ox_effect_start_robot_death_sequence(value v_obj_id)
{
    if (g_effect_start_robot_death_sequence)
        g_effect_start_robot_death_sequence(Int_val(v_obj_id));
    return Val_unit;
}

CAMLprim value cd_ox_effect_special_reactor_stuff(value unit)
{
    (void)unit;
    if (g_effect_special_reactor_stuff) g_effect_special_reactor_stuff();
    return Val_unit;
}

CAMLprim value cd_ox_effect_explode_object_delay(value v_obj_id, value v_delay)
{
    if (g_effect_explode_object_delay)
        g_effect_explode_object_delay(Int_val(v_obj_id), Int_val(v_delay));
    return Val_unit;
}

/* -- D2 Collide / damage bridge ---------------------------------------- */

void cd_ox_apply_damage_to_robot_d2(
    int32_t flags, int32_t shields, int32_t damage,
    int is_boss, int is_companion, int is_thief, int is_death_roll, int is_kamikaze,
    int robot_id,
    int is_multiplayer, int is_final_level,
    int obj_id, int killer_objnum,
    int32_t* out_new_shields, int* out_return_value)
{
    cd_ox_require_ready("cd_ox_apply_damage_to_robot_d2");

    CAMLparam0();
    CAMLlocal1(result);

    value args[13] = {
        Val_long(flags), Val_long(shields), Val_long(damage),
        Val_long(is_boss), Val_long(is_companion),
        Val_long(is_thief), Val_long(is_death_roll), Val_long(is_kamikaze),
        Val_long(robot_id),
        Val_long(is_multiplayer), Val_long(is_final_level),
        Val_long(obj_id), Val_long(killer_objnum)
    };
    result = caml_callbackN(*g_apply_damage_to_robot_d2, 13, args);

    *out_new_shields = Int_val(Field(result, 0));
    *out_return_value = Int_val(Field(result, 1));

    CAMLreturn0;
}

void cd_ox_physics_turn_towards_vector(
    int32_t gx, int32_t gy, int32_t gz,
    int32_t fx, int32_t fy, int32_t fz,
    int32_t rate, int is_morph,
    int32_t crx, int32_t cry, int32_t crz,
    int32_t* out_rx, int32_t* out_ry, int32_t* out_rz)
{
    cd_ox_require_ready("cd_ox_physics_turn_towards_vector");
    value args[11] = {
        Val_long(gx), Val_long(gy), Val_long(gz),
        Val_long(fx), Val_long(fy), Val_long(fz),
        Val_long(rate), Val_long(is_morph ? 1 : 0),
        Val_long(crx), Val_long(cry), Val_long(crz),
    };
    const value out = caml_callbackN(*g_physics_turn_towards_vector, 11, args);
    *out_rx = Int_val(Field(out, 0));
    *out_ry = Int_val(Field(out, 1));
    *out_rz = Int_val(Field(out, 2));
}

int cd_ox_do_physics_sim_rot(
    int32_t rvx, int32_t rvy, int32_t rvz,
    int32_t rtx, int32_t rty, int32_t rtz,
    int32_t o_rx, int32_t o_ry, int32_t o_rz,
    int32_t o_ux, int32_t o_uy, int32_t o_uz,
    int32_t o_fx, int32_t o_fy, int32_t o_fz,
    int32_t drag, int32_t mass, int32_t flags,
    int32_t turnroll, int32_t frame_time,
    int32_t* out_orient,
    int32_t* out_rvx, int32_t* out_rvy, int32_t* out_rvz,
    int32_t* out_turnroll)
{
    cd_ox_require_ready("cd_ox_do_physics_sim_rot");
    value args[20] = {
        Val_long(rvx), Val_long(rvy), Val_long(rvz),
        Val_long(rtx), Val_long(rty), Val_long(rtz),
        Val_long(o_rx), Val_long(o_ry), Val_long(o_rz),
        Val_long(o_ux), Val_long(o_uy), Val_long(o_uz),
        Val_long(o_fx), Val_long(o_fy), Val_long(o_fz),
        Val_long(drag), Val_long(mass), Val_long(flags),
        Val_long(turnroll), Val_long(frame_time),
    };
    const value out = caml_callbackN(*g_do_physics_sim_rot, 20, args);
    int32_t tag = Int_val(Field(out, 0));
    if (tag == 0)
        return 0;
    for (int i = 0; i < 9; i++)
        out_orient[i] = Int_val(Field(out, 1 + i));
    *out_rvx = Int_val(Field(out, 10));
    *out_rvy = Int_val(Field(out, 11));
    *out_rvz = Int_val(Field(out, 12));
    *out_turnroll = Int_val(Field(out, 13));
    return 1;
}

void cd_ox_calc_gun_point(
    const int32_t* packed, int packed_len,
    int32_t* out_x, int32_t* out_y, int32_t* out_z)
{
    cd_ox_require_ready("cd_ox_calc_gun_point");
    CAMLparam0();
    CAMLlocal1(arr);
    arr = caml_alloc(packed_len, 0);
    for (int i = 0; i < packed_len; i++)
        Store_field(arr, i, Val_long(packed[i]));
    const value result = caml_callback(*g_calc_gun_point, arr);
    *out_x = Int_val(Field(result, 0));
    *out_y = Int_val(Field(result, 1));
    *out_z = Int_val(Field(result, 2));
    CAMLreturn0;
}

void cd_ox_phys_apply_force(
    int32_t vx, int32_t vy, int32_t vz,
    int32_t fx, int32_t fy, int32_t fz,
    int32_t mass,
    int32_t* out_vx, int32_t* out_vy, int32_t* out_vz)
{
    cd_ox_require_ready("cd_ox_phys_apply_force");
    value args[7] = {
        Val_long(vx), Val_long(vy), Val_long(vz),
        Val_long(fx), Val_long(fy), Val_long(fz),
        Val_long(mass),
    };
    const value out = caml_callbackN(*g_phys_apply_force, 7, args);
    *out_vx = Int_val(Field(out, 0));
    *out_vy = Int_val(Field(out, 1));
    *out_vz = Int_val(Field(out, 2));
}

void cd_ox_phys_apply_rot(
    int32_t fx, int32_t fy, int32_t fz,
    int32_t mass, int is_robot,
    int32_t fvx, int32_t fvy, int32_t fvz,
    int is_morph,
    int32_t crx, int32_t cry, int32_t crz,
    int32_t* out_rx, int32_t* out_ry, int32_t* out_rz,
    int* out_set_skip_ai)
{
    cd_ox_require_ready("cd_ox_phys_apply_rot");
    value args[12] = {
        Val_long(fx), Val_long(fy), Val_long(fz),
        Val_long(mass), Val_long(is_robot),
        Val_long(fvx), Val_long(fvy), Val_long(fvz),
        Val_long(is_morph),
        Val_long(crx), Val_long(cry), Val_long(crz),
    };
    const value out = caml_callbackN(*g_phys_apply_rot, 12, args);
    *out_rx = Int_val(Field(out, 0));
    *out_ry = Int_val(Field(out, 1));
    *out_rz = Int_val(Field(out, 2));
    *out_set_skip_ai = Int_val(Field(out, 3));
}

void cd_ox_ai_turn_towards_vector(
    int32_t gx, int32_t gy, int32_t gz,
    int32_t fx, int32_t fy, int32_t fz,
    int32_t rx, int32_t ry, int32_t rz,
    int32_t rate, int32_t frame_time,
    int32_t seismic_mag, int32_t robot_mass,
    int32_t rvx, int32_t rvy, int32_t rvz,
    int32_t* out_orient)
{
    cd_ox_require_ready("cd_ox_ai_turn_towards_vector");
    value args[16] = {
        Val_long(gx), Val_long(gy), Val_long(gz),
        Val_long(fx), Val_long(fy), Val_long(fz),
        Val_long(rx), Val_long(ry), Val_long(rz),
        Val_long(rate), Val_long(frame_time),
        Val_long(seismic_mag), Val_long(robot_mass),
        Val_long(rvx), Val_long(rvy), Val_long(rvz),
    };
    const value out = caml_callbackN(*g_ai_turn_towards_vector, 16, args);
    for (int i = 0; i < 9; i++)
        out_orient[i] = Int_val(Field(out, i));
}

void cd_ox_set_thrust_from_velocity(
    int32_t mass, int32_t drag,
    int32_t vx, int32_t vy, int32_t vz,
    int32_t* out_tx, int32_t* out_ty, int32_t* out_tz)
{
    cd_ox_require_ready("cd_ox_set_thrust_from_velocity");
    value args[5] = {
        Val_long(mass), Val_long(drag),
        Val_long(vx), Val_long(vy), Val_long(vz),
    };
    const value out = caml_callbackN(*g_set_thrust_from_velocity, 5, args);
    *out_tx = Int_val(Field(out, 0));
    *out_ty = Int_val(Field(out, 1));
    *out_tz = Int_val(Field(out, 2));
}

void cd_ox_move_towards_vector(
    int32_t vx, int32_t vy, int32_t vz,
    int32_t gx, int32_t gy, int32_t gz,
    int32_t fx, int32_t fy, int32_t fz,
    int32_t frame_time, int32_t difficulty,
    int32_t max_speed, int32_t attack_type,
    int dot_based, int is_thief, int is_kamikaze,
    int32_t* out_vx, int32_t* out_vy, int32_t* out_vz)
{
    cd_ox_require_ready("cd_ox_move_towards_vector");
    value args[16] = {
        Val_long(vx), Val_long(vy), Val_long(vz),
        Val_long(gx), Val_long(gy), Val_long(gz),
        Val_long(fx), Val_long(fy), Val_long(fz),
        Val_long(frame_time), Val_long(difficulty),
        Val_long(max_speed), Val_long(attack_type),
        Val_long(dot_based), Val_long(is_thief), Val_long(is_kamikaze),
    };
    const value out = caml_callbackN(*g_move_towards_vector, 16, args);
    *out_vx = Int_val(Field(out, 0));
    *out_vy = Int_val(Field(out, 1));
    *out_vz = Int_val(Field(out, 2));
}

void cd_ox_move_around_player(
    const int32_t* packed, int packed_len,
    int32_t* out_vx, int32_t* out_vy, int32_t* out_vz)
{
    cd_ox_require_ready("cd_ox_move_around_player");
    CAMLparam0();
    CAMLlocal1(arr);
    arr = caml_alloc(packed_len, 0);
    for (int i = 0; i < packed_len; i++)
        Store_field(arr, i, Val_long(packed[i]));
    const value result = caml_callback(*g_move_around_player, arr);
    *out_vx = Int_val(Field(result, 0));
    *out_vy = Int_val(Field(result, 1));
    *out_vz = Int_val(Field(result, 2));
    CAMLreturn0;
}

void cd_ox_move_away_from_player(
    int32_t vx, int32_t vy, int32_t vz,
    int32_t px, int32_t py, int32_t pz,
    int32_t ux, int32_t uy, int32_t uz,
    int32_t rx, int32_t ry, int32_t rz,
    int32_t frame_time, int32_t frame_count,
    int32_t objnum, int32_t attack_type, int32_t max_speed,
    int32_t* out_vx, int32_t* out_vy, int32_t* out_vz)
{
    cd_ox_require_ready("cd_ox_move_away_from_player");
    value args[17] = {
        Val_long(vx), Val_long(vy), Val_long(vz),
        Val_long(px), Val_long(py), Val_long(pz),
        Val_long(ux), Val_long(uy), Val_long(uz),
        Val_long(rx), Val_long(ry), Val_long(rz),
        Val_long(frame_time), Val_long(frame_count),
        Val_long(objnum), Val_long(attack_type), Val_long(max_speed),
    };
    const value out = caml_callbackN(*g_move_away_from_player, 17, args);
    *out_vx = Int_val(Field(out, 0));
    *out_vy = Int_val(Field(out, 1));
    *out_vz = Int_val(Field(out, 2));
}

int32_t cd_ox_set_object_turnroll(
    int32_t rotvel_y, int32_t turnroll, int32_t frame_time)
{
    cd_ox_require_ready("cd_ox_set_object_turnroll");
    value args[3] = {
        Val_long(rotvel_y), Val_long(turnroll), Val_long(frame_time),
    };
    return Int_val(caml_callbackN(*g_set_object_turnroll, 3, args));
}

int cd_ox_lead_player(
    int32_t fpx, int32_t fpy, int32_t fpz,
    int32_t bpx, int32_t bpy, int32_t bpz,
    int32_t pvx, int32_t pvy, int32_t pvz,
    int32_t fvx, int32_t fvy, int32_t fvz,
    int player_cloaked, int32_t max_weapon_speed,
    int is_matter, int32_t difficulty_level,
    int32_t* out_fx, int32_t* out_fy, int32_t* out_fz)
{
    cd_ox_require_ready("cd_ox_lead_player");
    value args[16] = {
        Val_long(fpx), Val_long(fpy), Val_long(fpz),
        Val_long(bpx), Val_long(bpy), Val_long(bpz),
        Val_long(pvx), Val_long(pvy), Val_long(pvz),
        Val_long(fvx), Val_long(fvy), Val_long(fvz),
        Val_long(player_cloaked), Val_long(max_weapon_speed),
        Val_long(is_matter), Val_long(difficulty_level),
    };
    const value out = caml_callbackN(*g_lead_player, 16, args);
    int success = Int_val(Field(out, 0));
    if (success) {
        *out_fx = Int_val(Field(out, 1));
        *out_fy = Int_val(Field(out, 2));
        *out_fz = Int_val(Field(out, 3));
    }
    return success;
}

void cd_ox_homing_missile_turn_towards_velocity(
    int32_t nvx, int32_t nvy, int32_t nvz,
    int32_t fx, int32_t fy, int32_t fz,
    int32_t frame_time,
    int32_t* out_orient)
{
    cd_ox_require_ready("cd_ox_homing_missile_turn_towards_velocity");
    value args[7] = {
        Val_long(nvx), Val_long(nvy), Val_long(nvz),
        Val_long(fx), Val_long(fy), Val_long(fz),
        Val_long(frame_time),
    };
    const value out = caml_callbackN(*g_homing_missile_turn_towards_velocity, 7, args);
    for (int i = 0; i < 9; i++)
        out_orient[i] = Int_val(Field(out, i));
}

void cd_ox_do_physics_align_object(
    const int32_t* packed, int packed_len,
    int32_t* out_buf)
{
    cd_ox_require_ready("cd_ox_do_physics_align_object");
    CAMLparam0();
    CAMLlocal1(arr);
    arr = caml_alloc(packed_len, 0);
    for (int i = 0; i < packed_len; i++)
        Store_field(arr, i, Val_long(packed[i]));
    const value result = caml_callback(*g_do_physics_align_object, arr);
    for (int i = 0; i < 11; i++)
        out_buf[i] = Int_val(Field(result, i));
    CAMLreturn0;
}

void cd_ox_ai_frame_animation(
    const int32_t* packed, int packed_len,
    int32_t* out_buf, int out_len)
{
    cd_ox_require_ready("cd_ox_ai_frame_animation");
    CAMLparam0();
    CAMLlocal1(arr);
    arr = caml_alloc(packed_len, 0);
    for (int i = 0; i < packed_len; i++)
        Store_field(arr, i, Val_long(packed[i]));
    const value result = caml_callback(*g_ai_frame_animation, arr);
    for (int i = 0; i < out_len; i++)
        out_buf[i] = Int_val(Field(result, i));
    CAMLreturn0;
}

void cd_ox_ai_move_relative_to_player(
    const int32_t* packed, int packed_len,
    int32_t* out_buf)
{
    cd_ox_require_ready("cd_ox_ai_move_relative_to_player");
    CAMLparam0();
    CAMLlocal1(arr);
    arr = caml_alloc(packed_len, 0);
    for (int i = 0; i < packed_len; i++)
        Store_field(arr, i, Val_long(packed[i]));
    const value result = caml_callback(*g_ai_move_relative_to_player, arr);
    for (int i = 0; i < 6; i++)
        out_buf[i] = Int_val(Field(result, i));
    CAMLreturn0;
}

void cd_ox_ai_path_set_orient_and_vel(
    const int32_t* packed, int packed_len,
    int32_t* out_buf)
{
    cd_ox_require_ready("cd_ox_ai_path_set_orient_and_vel");
    CAMLparam0();
    CAMLlocal1(arr);
    arr = caml_alloc(packed_len, 0);
    for (int i = 0; i < packed_len; i++)
        Store_field(arr, i, Val_long(packed[i]));
    const value result = caml_callback(*g_ai_path_set_orient_and_vel, arr);
    for (int i = 0; i < 12; i++)
        out_buf[i] = Int_val(Field(result, i));
    CAMLreturn0;
}

void cd_ox_do_silly_animation(
    const int32_t* packed, int packed_len,
    int32_t* out_buf, int out_len)
{
    cd_ox_require_ready("cd_ox_do_silly_animation");
    CAMLparam0();
    CAMLlocal1(arr);
    arr = caml_alloc(packed_len, 0);
    for (int i = 0; i < packed_len; i++)
        Store_field(arr, i, Val_long(packed[i]));
    const value result = caml_callback(*g_do_silly_animation, arr);
    for (int i = 0; i < out_len; i++)
        out_buf[i] = Int_val(Field(result, i));
    CAMLreturn0;
}

int32_t cd_ox_check_vector_to_object(
    int32_t p0x, int32_t p0y, int32_t p0z,
    int32_t p1x, int32_t p1y, int32_t p1z,
    int32_t rad,
    int32_t opx, int32_t opy, int32_t opz,
    int32_t obj_size, int obj_type, int attack_type,
    int otherobj_type, int game_mode_coop, int otherobj_parent_type,
    int32_t* out_intpx, int32_t* out_intpy, int32_t* out_intpz)
{
    cd_ox_require_ready("cd_ox_check_vector_to_object");
    value args[16] = {
        Val_long(p0x), Val_long(p0y), Val_long(p0z),
        Val_long(p1x), Val_long(p1y), Val_long(p1z),
        Val_long(rad),
        Val_long(opx), Val_long(opy), Val_long(opz),
        Val_long(obj_size), Val_long(obj_type), Val_long(attack_type),
        Val_long(otherobj_type), Val_long(game_mode_coop),
        Val_long(otherobj_parent_type),
    };
    const value out = caml_callbackN(*g_check_vector_to_object, 16, args);
    int32_t dist = Int_val(Field(out, 0));
    *out_intpx = Int_val(Field(out, 1));
    *out_intpy = Int_val(Field(out, 2));
    *out_intpz = Int_val(Field(out, 3));
    return dist;
}

void cd_ox_set_next_fire_time_d1(
    int32_t rapidfire_count, int32_t rapidfire_count_limit,
    int32_t firing_wait,
    int32_t* out_rapidfire_count, int32_t* out_next_fire)
{
    cd_ox_require_ready("cd_ox_set_next_fire_time_d1");
    value args[3] = {
        Val_long(rapidfire_count),
        Val_long(rapidfire_count_limit),
        Val_long(firing_wait),
    };
    const value out = caml_callbackN(*g_set_next_fire_time_d1, 3, args);
    *out_rapidfire_count = Int_val(Field(out, 0));
    *out_next_fire = Int_val(Field(out, 1));
}

void cd_ox_set_next_fire_time_d2(
    int32_t rapidfire_count, int32_t rapidfire_count_limit,
    int32_t firing_wait, int32_t firing_wait2,
    int gun_num, int weapon_type2, int behavior, int p_rand_val,
    int32_t* out_rapidfire_count, int32_t* out_next_fire,
    int* out_nf2_valid, int32_t* out_next_fire2)
{
    cd_ox_require_ready("cd_ox_set_next_fire_time_d2");
    value args[8] = {
        Val_long(rapidfire_count),
        Val_long(rapidfire_count_limit),
        Val_long(firing_wait),
        Val_long(firing_wait2),
        Val_long(gun_num),
        Val_long(weapon_type2),
        Val_long(behavior),
        Val_long(p_rand_val),
    };
    const value out = caml_callbackN(*g_set_next_fire_time_d2, 8, args);
    *out_rapidfire_count = Int_val(Field(out, 0));
    *out_next_fire = Int_val(Field(out, 1));
    *out_nf2_valid = Int_val(Field(out, 2));
    *out_next_fire2 = Int_val(Field(out, 3));
}

int32_t cd_ox_compute_headlight_light_d1(
    int32_t point_x, int32_t point_y, int32_t point_z,
    int32_t face_light, int32_t beam_brightness, int use_beam)
{
    cd_ox_require_ready("cd_ox_compute_headlight_light_d1");
    value args[6] = {
        Val_long(point_x),
        Val_long(point_y),
        Val_long(point_z),
        Val_long(face_light),
        Val_long(beam_brightness),
        Val_long(use_beam),
    };
    const value out = caml_callbackN(*g_compute_headlight_light_d1, 6, args);
    return Int_val(out);
}

int32_t cd_ox_compute_headlight_light_d2(
    int32_t point_x, int32_t point_y, int32_t point_z,
    int32_t face_light, int32_t beam_brightness,
    int32_t player_flags, int32_t player_energy, int is_viewer)
{
    cd_ox_require_ready("cd_ox_compute_headlight_light_d2");
    value args[8] = {
        Val_long(point_x),
        Val_long(point_y),
        Val_long(point_z),
        Val_long(face_light),
        Val_long(beam_brightness),
        Val_long(player_flags),
        Val_long(player_energy),
        Val_long(is_viewer),
    };
    const value out = caml_callbackN(*g_compute_headlight_light_d2, 8, args);
    return Int_val(out);
}

int cd_ox_ai_behavior_to_mode_d1(int behavior)
{
    cd_ox_require_ready("cd_ox_ai_behavior_to_mode_d1");
    return Int_val(caml_callback(*g_ai_behavior_to_mode_d1, Val_long(behavior)));
}

int cd_ox_ai_behavior_to_mode_d2(int behavior)
{
    cd_ox_require_ready("cd_ox_ai_behavior_to_mode_d2");
    return Int_val(caml_callback(*g_ai_behavior_to_mode_d2, Val_long(behavior)));
}

void cd_ox_ai_turn_randomly(
    int32_t rvx, int32_t rvy, int32_t rvz,
    int32_t* out_rx, int32_t* out_ry, int32_t* out_rz)
{
    cd_ox_require_ready("cd_ox_ai_turn_randomly");
    value args[3] = {
        Val_long(rvx),
        Val_long(rvy),
        Val_long(rvz),
    };
    const value out = caml_callbackN(*g_ai_turn_randomly, 3, args);
    *out_rx = Int_val(Field(out, 0));
    *out_ry = Int_val(Field(out, 1));
    *out_rz = Int_val(Field(out, 2));
}

int cd_ox_get_explosion_vclip(
    int obj_type, int stage,
    int exp1_vclip_num, int exp2_vclip_num, int expl_vclip_num)
{
    cd_ox_require_ready("cd_ox_get_explosion_vclip");
    value args[5] = {
        Val_long(obj_type),
        Val_long(stage),
        Val_long(exp1_vclip_num),
        Val_long(exp2_vclip_num),
        Val_long(expl_vclip_num),
    };
    return Int_val(caml_callbackN(*g_get_explosion_vclip, 5, args));
}

/* -- Clutter damage bridge -------------------------------------------- */

void cd_ox_register_clutter_effects(
    cd_effect_explode_object_delay_clutter_fn explode_object_delay)
{
    g_effect_explode_object_delay_clutter = explode_object_delay;
}

CAMLprim value cd_ox_effect_explode_object_delay_clutter(value v_obj_id, value v_delay)
{
    if (g_effect_explode_object_delay_clutter)
        g_effect_explode_object_delay_clutter(Int_val(v_obj_id), Int_val(v_delay));
    return Val_unit;
}

void cd_ox_apply_damage_to_clutter(
    int32_t flags, int32_t shields, int32_t damage, int obj_id,
    int32_t* out_new_shields, int* out_return_value)
{
    cd_ox_require_ready("cd_ox_apply_damage_to_clutter");

    CAMLparam0();
    CAMLlocal1(result);

    value args[4] = {
        Val_long(flags), Val_long(shields), Val_long(damage),
        Val_long(obj_id)
    };
    result = caml_callbackN(*g_apply_damage_to_clutter, 4, args);

    *out_new_shields = Int_val(Field(result, 0));
    *out_return_value = Int_val(Field(result, 1));

    CAMLreturn0;
}

/* -- Controlcen damage bridge ----------------------------------------- */

void cd_ox_register_controlcen_effects(
    cd_effect_show_hud_invul_message_fn show_hud_invul_message,
    cd_effect_controlcen_been_hit_fn controlcen_been_hit,
    cd_effect_do_controlcen_destroyed_fn do_controlcen_destroyed,
    cd_effect_add_controlcen_score_fn add_controlcen_score,
    cd_effect_multi_send_destroy_controlcen_fn multi_send_destroy_controlcen,
    cd_effect_sound_controlcen_destroyed_fn sound_controlcen_destroyed,
    cd_effect_explode_object_delay_controlcen_fn explode_object_delay)
{
    g_effect_show_hud_invul_message = show_hud_invul_message;
    g_effect_controlcen_been_hit = controlcen_been_hit;
    g_effect_do_controlcen_destroyed = do_controlcen_destroyed;
    g_effect_add_controlcen_score = add_controlcen_score;
    g_effect_multi_send_destroy_controlcen = multi_send_destroy_controlcen;
    g_effect_sound_controlcen_destroyed = sound_controlcen_destroyed;
    g_effect_explode_object_delay_controlcen = explode_object_delay;
}

CAMLprim value cd_ox_effect_show_hud_invul_message(value unit)
{
    (void)unit;
    if (g_effect_show_hud_invul_message) g_effect_show_hud_invul_message();
    return Val_unit;
}

CAMLprim value cd_ox_effect_controlcen_been_hit(value unit)
{
    (void)unit;
    if (g_effect_controlcen_been_hit) g_effect_controlcen_been_hit();
    return Val_unit;
}

CAMLprim value cd_ox_effect_do_controlcen_destroyed(value v_obj_id)
{
    if (g_effect_do_controlcen_destroyed)
        g_effect_do_controlcen_destroyed(Int_val(v_obj_id));
    return Val_unit;
}

CAMLprim value cd_ox_effect_add_controlcen_score(value unit)
{
    (void)unit;
    if (g_effect_add_controlcen_score) g_effect_add_controlcen_score();
    return Val_unit;
}

CAMLprim value cd_ox_effect_multi_send_destroy_controlcen(value v_obj_id, value v_who_id)
{
    if (g_effect_multi_send_destroy_controlcen)
        g_effect_multi_send_destroy_controlcen(Int_val(v_obj_id), Int_val(v_who_id));
    return Val_unit;
}

CAMLprim value cd_ox_effect_sound_controlcen_destroyed(value v_obj_id)
{
    if (g_effect_sound_controlcen_destroyed)
        g_effect_sound_controlcen_destroyed(Int_val(v_obj_id));
    return Val_unit;
}

CAMLprim value cd_ox_effect_explode_object_delay_controlcen(value v_obj_id, value v_delay)
{
    if (g_effect_explode_object_delay_controlcen)
        g_effect_explode_object_delay_controlcen(Int_val(v_obj_id), Int_val(v_delay));
    return Val_unit;
}

void cd_ox_apply_damage_to_controlcen(
    int32_t shields, int32_t flags, int32_t damage,
    int who_is_player, int who_is_local_player,
    int who_objnum, int local_player_objnum,
    int is_multiplayer, int is_coop, int time_level_ok,
    int obj_id, int who_id,
    int32_t* out_new_shields)
{
    cd_ox_require_ready("cd_ox_apply_damage_to_controlcen");

    CAMLparam0();
    CAMLlocal1(result);

    value args[12] = {
        Val_long(shields), Val_long(flags), Val_long(damage),
        Val_long(who_is_player), Val_long(who_is_local_player),
        Val_long(who_objnum), Val_long(local_player_objnum),
        Val_long(is_multiplayer), Val_long(is_coop), Val_long(time_level_ok),
        Val_long(obj_id), Val_long(who_id)
    };
    result = caml_callbackN(*g_apply_damage_to_controlcen, 12, args);

    *out_new_shields = Int_val(result);

    CAMLreturn0;
}

/* -- Player damage D1 bridge ------------------------------------------ */

void cd_ox_register_player_damage_effects_d1(
    cd_effect_palette_flash_fn palette_flash,
    cd_effect_set_player_dead_fn set_player_dead)
{
    g_effect_palette_flash_d1 = palette_flash;
    g_effect_set_player_dead_d1 = set_player_dead;
}

CAMLprim value cd_ox_effect_palette_flash_d1(value v_r, value v_g, value v_b)
{
    if (g_effect_palette_flash_d1)
        g_effect_palette_flash_d1(Int_val(v_r), Int_val(v_g), Int_val(v_b));
    return Val_unit;
}

CAMLprim value cd_ox_effect_set_player_dead_d1(value v_killer_objnum)
{
    if (g_effect_set_player_dead_d1)
        g_effect_set_player_dead_d1(Int_val(v_killer_objnum));
    return Val_unit;
}

void cd_ox_apply_damage_to_player_d1(
    int is_dead, int is_invulnerable, int is_endlevel, int is_local_player,
    int32_t player_shields, int32_t damage, int killer_objnum,
    int32_t* out_new_shields, int* out_should_be_dead)
{
    cd_ox_require_ready("cd_ox_apply_damage_to_player_d1");

    CAMLparam0();
    CAMLlocal1(result);

    value args[7] = {
        Val_long(is_dead), Val_long(is_invulnerable),
        Val_long(is_endlevel), Val_long(is_local_player),
        Val_long(player_shields), Val_long(damage), Val_long(killer_objnum)
    };
    result = caml_callbackN(*g_apply_damage_to_player_d1, 7, args);

    *out_new_shields = Int_val(Field(result, 0));
    *out_should_be_dead = Int_val(Field(result, 1));

    CAMLreturn0;
}

/* -- Player damage D2 bridge ------------------------------------------ */

void cd_ox_register_player_damage_effects_d2(
    cd_effect_palette_flash_fn palette_flash,
    cd_effect_set_player_dead_fn set_player_dead,
    cd_effect_set_buddy_sorry_time_fn set_buddy_sorry_time)
{
    g_effect_palette_flash_d2 = palette_flash;
    g_effect_set_player_dead_d2 = set_player_dead;
    g_effect_set_buddy_sorry_time = set_buddy_sorry_time;
}

CAMLprim value cd_ox_effect_palette_flash_d2(value v_r, value v_g, value v_b)
{
    if (g_effect_palette_flash_d2)
        g_effect_palette_flash_d2(Int_val(v_r), Int_val(v_g), Int_val(v_b));
    return Val_unit;
}

CAMLprim value cd_ox_effect_set_player_dead_d2(value v_killer_objnum)
{
    if (g_effect_set_player_dead_d2)
        g_effect_set_player_dead_d2(Int_val(v_killer_objnum));
    return Val_unit;
}

CAMLprim value cd_ox_effect_set_buddy_sorry_time(value unit)
{
    (void)unit;
    if (g_effect_set_buddy_sorry_time) g_effect_set_buddy_sorry_time();
    return Val_unit;
}

void cd_ox_apply_damage_to_player_d2(
    int is_dead, int is_invulnerable, int is_endlevel, int is_local_player,
    int32_t player_shields, int32_t damage, int killer_objnum,
    int killer_is_companion,
    int32_t* out_new_shields, int* out_should_be_dead)
{
    cd_ox_require_ready("cd_ox_apply_damage_to_player_d2");

    CAMLparam0();
    CAMLlocal1(result);

    value args[8] = {
        Val_long(is_dead), Val_long(is_invulnerable),
        Val_long(is_endlevel), Val_long(is_local_player),
        Val_long(player_shields), Val_long(damage), Val_long(killer_objnum),
        Val_long(killer_is_companion)
    };
    result = caml_callbackN(*g_apply_damage_to_player_d2, 8, args);

    *out_new_shields = Int_val(Field(result, 0));
    *out_should_be_dead = Int_val(Field(result, 1));

    CAMLreturn0;
}

/* -- maybe_kill_weapon bridge (pure, no effects) ---------------------- */

void cd_ox_maybe_kill_weapon_d1(
    int weapon_id, int32_t phys_flags, int32_t weapon_shields,
    int other_type, int32_t other_shields,
    int32_t* out_new_shields, int* out_should_be_dead)
{
    cd_ox_require_ready("cd_ox_maybe_kill_weapon_d1");
    value args[5] = {
        Val_long(weapon_id), Val_long(phys_flags), Val_long(weapon_shields),
        Val_long(other_type), Val_long(other_shields)
    };
    const value result = caml_callbackN(*g_maybe_kill_weapon_d1, 5, args);
    *out_new_shields = Int_val(Field(result, 0));
    *out_should_be_dead = Int_val(Field(result, 1));
}

void cd_ox_maybe_kill_weapon_d2(
    int weapon_id, int32_t phys_flags, int32_t weapon_shields,
    int other_type, int32_t other_shields, int is_shareware,
    int32_t* out_new_shields, int* out_should_be_dead)
{
    cd_ox_require_ready("cd_ox_maybe_kill_weapon_d2");
    value args[6] = {
        Val_long(weapon_id), Val_long(phys_flags), Val_long(weapon_shields),
        Val_long(other_type), Val_long(other_shields), Val_long(is_shareware)
    };
    const value result = caml_callbackN(*g_maybe_kill_weapon_d2, 6, args);
    *out_new_shields = Int_val(Field(result, 0));
    *out_should_be_dead = Int_val(Field(result, 1));
}

/* -- calc_best_gun bridge (pure, packed array) ------------------------ */

int cd_ox_calc_best_gun(const int32_t* packed, int packed_len)
{
    cd_ox_require_ready("cd_ox_calc_best_gun");
    CAMLparam0();
    CAMLlocal1(arr);
    arr = caml_alloc(packed_len, 0);
    for (int i = 0; i < packed_len; i++)
        Store_field(arr, i, Val_long(packed[i]));
    int result = Int_val(caml_callback(*g_calc_best_gun, arr));
    CAMLreturnT(int, result);
}

/* -- chase_angles bridge (pure) --------------------------------------- */

void cd_ox_chase_angles(
    int32_t cur_p, int32_t cur_b, int32_t cur_h,
    int32_t desired_p, int32_t desired_b, int32_t desired_h,
    int32_t frame_time,
    int32_t* out_p, int32_t* out_b, int32_t* out_h, int* out_mask)
{
    cd_ox_require_ready("cd_ox_chase_angles");
    value args[7] = {
        Val_long(cur_p), Val_long(cur_b), Val_long(cur_h),
        Val_long(desired_p), Val_long(desired_b), Val_long(desired_h),
        Val_long(frame_time)
    };
    const value result = caml_callbackN(*g_chase_angles, 7, args);
    *out_p = Int_val(Field(result, 0));
    *out_b = Int_val(Field(result, 1));
    *out_h = Int_val(Field(result, 2));
    *out_mask = Int_val(Field(result, 3));
}

/* -- laser_are_related bridge (pure, packed array) -------------------- */

static int cd_ox_laser_are_related_impl(const value* g_fn, const char* name,
    const int32_t* packed, int packed_len)
{
    cd_ox_require_ready(name);
    CAMLparam0();
    CAMLlocal1(arr);
    arr = caml_alloc(packed_len, 0);
    for (int i = 0; i < packed_len; i++)
        Store_field(arr, i, Val_long(packed[i]));
    int result = Int_val(caml_callback(*g_fn, arr));
    CAMLreturnT(int, result);
}

int cd_ox_laser_are_related_d1(const int32_t* packed, int packed_len)
{
    return cd_ox_laser_are_related_impl(g_laser_are_related_d1, "cd_ox_laser_are_related_d1", packed, packed_len);
}

int cd_ox_laser_are_related_d2(const int32_t* packed, int packed_len)
{
    return cd_ox_laser_are_related_impl(g_laser_are_related_d2, "cd_ox_laser_are_related_d2", packed, packed_len);
}

/* -- calc_controlcen_gun_point bridge (pure) -------------------------- */

void cd_ox_calc_controlcen_gun_point(
    int32_t glpx, int32_t glpy, int32_t glpz,
    int32_t gldx, int32_t gldy, int32_t gldz,
    int32_t or1, int32_t or2, int32_t or3,
    int32_t ou1, int32_t ou2, int32_t ou3,
    int32_t of1, int32_t of2, int32_t of3,
    int32_t opx, int32_t opy, int32_t opz,
    int32_t* out_gpx, int32_t* out_gpy, int32_t* out_gpz,
    int32_t* out_gdx, int32_t* out_gdy, int32_t* out_gdz)
{
    cd_ox_require_ready("cd_ox_calc_controlcen_gun_point");
    value args[18] = {
        Val_long(glpx), Val_long(glpy), Val_long(glpz),
        Val_long(gldx), Val_long(gldy), Val_long(gldz),
        Val_long(or1), Val_long(or2), Val_long(or3),
        Val_long(ou1), Val_long(ou2), Val_long(ou3),
        Val_long(of1), Val_long(of2), Val_long(of3),
        Val_long(opx), Val_long(opy), Val_long(opz)
    };
    const value result = caml_callbackN(*g_calc_controlcen_gun_point, 18, args);
    *out_gpx = Int_val(Field(result, 0));
    *out_gpy = Int_val(Field(result, 1));
    *out_gpz = Int_val(Field(result, 2));
    *out_gdx = Int_val(Field(result, 3));
    *out_gdy = Int_val(Field(result, 4));
    *out_gdz = Int_val(Field(result, 5));
}

/* -- robot_get_anim_state bridge (pure) ------------------------------- */

void cd_ox_robot_get_anim_state(
    const int32_t* packed, int packed_len,
    int32_t* out_buf, int* out_count)
{
    cd_ox_require_ready("cd_ox_robot_get_anim_state");
    CAMLparam0();
    CAMLlocal2(arr, result);
    arr = caml_alloc(packed_len, 0);
    for (int i = 0; i < packed_len; i++)
        Store_field(arr, i, Val_long(packed[i]));
    result = caml_callback(*g_robot_get_anim_state, arr);
    int n = Wosize_val(result);
    *out_count = n / 4;
    for (int i = 0; i < n; i++)
        out_buf[i] = Int_val(Field(result, i));
    CAMLreturn0;
}

/* -- set_robot_state bridge ------------------------------------------- */

void cd_ox_set_robot_state(
    const int32_t* packed, int packed_len,
    int32_t* out_angles_30)
{
    cd_ox_require_ready("cd_ox_set_robot_state");
    CAMLparam0();
    CAMLlocal2(arr, result);
    arr = caml_alloc(packed_len, 0);
    for (int i = 0; i < packed_len; i++)
        Store_field(arr, i, Val_long(packed[i]));
    result = caml_callback(*g_set_robot_state, arr);
    for (int i = 0; i < 30; i++)
        out_angles_30[i] = Int_val(Field(result, i));
    CAMLreturn0;
}

/* -- robot_set_angles bridge ------------------------------------------ */

void cd_ox_robot_set_angles(
    const int32_t* packed, int packed_len,
    int32_t* out_buf, int* out_len)
{
    cd_ox_require_ready("cd_ox_robot_set_angles");
    CAMLparam0();
    CAMLlocal2(arr, result);
    arr = caml_alloc(packed_len, 0);
    for (int i = 0; i < packed_len; i++)
        Store_field(arr, i, Val_long(packed[i]));
    result = caml_callback(*g_robot_set_angles, arr);
    int n = Wosize_val(result);
    *out_len = n;
    for (int i = 0; i < n; i++)
        out_buf[i] = Int_val(Field(result, i));
    CAMLreturn0;
}

int cd_ox_find_connect_side(
    int32_t c0, int32_t c1, int32_t c2, int32_t c3, int32_t c4, int32_t c5,
    int32_t base_seg_num)
{
    cd_ox_require_ready("cd_ox_find_connect_side");
    value args[7] = {
        Val_long(c0), Val_long(c1), Val_long(c2),
        Val_long(c3), Val_long(c4), Val_long(c5),
        Val_long(base_seg_num),
    };
    return Int_val(caml_callbackN(*g_find_connect_side, 7, args));
}

void cd_ox_create_shortpos(
    const int32_t* packed, int packed_len,
    int32_t* out_buf)
{
    cd_ox_require_ready("cd_ox_create_shortpos");
    CAMLparam0();
    CAMLlocal2(arr, result);
    arr = caml_alloc(packed_len, 0);
    for (int i = 0; i < packed_len; i++)
        Store_field(arr, i, Val_long(packed[i]));
    result = caml_callback(*g_create_shortpos, arr);
    for (int i = 0; i < 17; i++)
        out_buf[i] = Int_val(Field(result, i));
    CAMLreturn0;
}

void cd_ox_extract_shortpos(
    const int32_t* packed, int packed_len,
    int32_t* out_buf)
{
    cd_ox_require_ready("cd_ox_extract_shortpos");
    CAMLparam0();
    CAMLlocal2(arr, result);
    arr = caml_alloc(packed_len, 0);
    for (int i = 0; i < packed_len; i++)
        Store_field(arr, i, Val_long(packed[i]));
    result = caml_callback(*g_extract_shortpos, arr);
    for (int i = 0; i < 15; i++)
        out_buf[i] = Int_val(Field(result, i));
    CAMLreturn0;
}

void cd_ox_create_walls_on_side(
    const int32_t* packed, int packed_len,
    int32_t* out_buf)
{
    cd_ox_require_ready("cd_ox_create_walls_on_side");
    CAMLparam0();
    CAMLlocal2(arr, result);
    arr = caml_alloc(packed_len, 0);
    for (int i = 0; i < packed_len; i++)
        Store_field(arr, i, Val_long(packed[i]));
    result = caml_callback(*g_create_walls_on_side, arr);
    for (int i = 0; i < 7; i++)
        out_buf[i] = Int_val(Field(result, i));
    CAMLreturn0;
}

int cd_ox_check_norms(
    int32_t n0x, int32_t n0y, int32_t n0z,
    int32_t n1x, int32_t n1y, int32_t n1z)
{
    cd_ox_require_ready("cd_ox_check_norms");
    value args[6] = {
        Val_long(n0x), Val_long(n0y), Val_long(n0z),
        Val_long(n1x), Val_long(n1y), Val_long(n1z),
    };
    return Int_val(caml_callbackN(*g_check_norms, 6, args));
}

void cd_ox_create_all_vertex_lists(
    int32_t side_type, int32_t sidenum,
    int32_t* num_faces, int32_t* vertices_6)
{
    cd_ox_require_ready("cd_ox_create_all_vertex_lists");
    const value result = caml_callback2(*g_create_all_vertex_lists,
        Val_long(side_type), Val_long(sidenum));
    *num_faces = Int_val(Field(result, 0));
    for (int i = 0; i < 6; i++)
        vertices_6[i] = Int_val(Field(result, i + 1));
}

void cd_ox_create_all_vertnum_lists(
    int32_t side_type,
    int32_t* num_faces, int32_t* vertnums_6)
{
    cd_ox_require_ready("cd_ox_create_all_vertnum_lists");
    const value result = caml_callback(*g_create_all_vertnum_lists, Val_long(side_type));
    *num_faces = Int_val(Field(result, 0));
    for (int i = 0; i < 6; i++)
        vertnums_6[i] = Int_val(Field(result, i + 1));
}

int cd_ox_ai_door_is_openable_d1(
    int is_console_object, int robot_id, int ai_behavior,
    int wall_num, int wall_type, int wall_keys, int wall_flags)
{
    cd_ox_require_ready("cd_ox_ai_door_is_openable_d1");
    value args[7] = {
        Val_long(is_console_object),
        Val_long(robot_id),
        Val_long(ai_behavior),
        Val_long(wall_num),
        Val_long(wall_type),
        Val_long(wall_keys),
        Val_long(wall_flags),
    };
    return Int_val(caml_callbackN(*g_ai_door_is_openable_d1, 7, args));
}

int cd_ox_ai_door_is_openable_d2(
    int is_child, int is_console_object,
    int wall_num, int wall_type, int wall_keys, int wall_flags,
    int wall_state, int wall_clip_num, int wall_controlling_trigger,
    int wallanim_flags,
    int objp_is_null, int is_companion,
    int robot_id, int ai_behavior, int player_flags, int ailp_mode)
{
    cd_ox_require_ready("cd_ox_ai_door_is_openable_d2");
    value args[16] = {
        Val_long(is_child),
        Val_long(is_console_object),
        Val_long(wall_num),
        Val_long(wall_type),
        Val_long(wall_keys),
        Val_long(wall_flags),
        Val_long(wall_state),
        Val_long(wall_clip_num),
        Val_long(wall_controlling_trigger),
        Val_long(wallanim_flags),
        Val_long(objp_is_null),
        Val_long(is_companion),
        Val_long(robot_id),
        Val_long(ai_behavior),
        Val_long(player_flags),
        Val_long(ailp_mode),
    };
    return Int_val(caml_callbackN(*g_ai_door_is_openable_d2, 16, args));
}

int cd_ox_openable_doors_in_segment_d1(const int32_t* packed, int packed_len)
{
    cd_ox_require_ready("cd_ox_openable_doors_in_segment_d1");
    CAMLparam0();
    CAMLlocal1(arr);
    arr = caml_alloc(packed_len, 0);
    for (int i = 0; i < packed_len; i++)
        Store_field(arr, i, Val_long(packed[i]));
    int result = Int_val(caml_callback(*g_openable_doors_in_segment_d1, arr));
    CAMLreturnT(int, result);
}

int cd_ox_openable_doors_in_segment_d2(const int32_t* packed, int packed_len)
{
    cd_ox_require_ready("cd_ox_openable_doors_in_segment_d2");
    CAMLparam0();
    CAMLlocal1(arr);
    arr = caml_alloc(packed_len, 0);
    for (int i = 0; i < packed_len; i++)
        Store_field(arr, i, Val_long(packed[i]));
    int result = Int_val(caml_callback(*g_openable_doors_in_segment_d2, arr));
    CAMLreturnT(int, result);
}

void cd_ox_do_firing_stuff(
    const int32_t* packed, int packed_len,
    int32_t* out_buf)
{
    cd_ox_require_ready("cd_ox_do_firing_stuff");
    CAMLparam0();
    CAMLlocal1(arr);
    arr = caml_alloc(packed_len, 0);
    for (int i = 0; i < packed_len; i++)
        Store_field(arr, i, Val_long(packed[i]));
    const value result = caml_callback(*g_do_firing_stuff, arr);
    for (int i = 0; i < 3; i++)
        out_buf[i] = Int_val(Field(result, i));
    CAMLreturn0;
}

void cd_ox_compute_object_light(
    const int32_t* packed, int packed_len,
    int32_t* out_buf)
{
    cd_ox_require_ready("cd_ox_compute_object_light");
    CAMLparam0();
    CAMLlocal1(arr);
    arr = caml_alloc(packed_len, 0);
    for (int i = 0; i < packed_len; i++)
        Store_field(arr, i, Val_long(packed[i]));
    const value result = caml_callback(*g_compute_object_light, arr);
    for (int i = 0; i < 2; i++)
        out_buf[i] = Int_val(Field(result, i));
    CAMLreturn0;
}

void cd_ox_do_physics_drag(
    const int32_t* packed, int packed_len,
    int32_t* out_buf)
{
    cd_ox_require_ready("cd_ox_do_physics_drag");
    CAMLparam0();
    CAMLlocal1(arr);
    arr = caml_alloc(packed_len, 0);
    for (int i = 0; i < packed_len; i++)
        Store_field(arr, i, Val_long(packed[i]));
    const value result = caml_callback(*g_do_physics_drag, arr);
    for (int i = 0; i < 3; i++)
        out_buf[i] = Int_val(Field(result, i));
    CAMLreturn0;
}

void cd_ox_do_homing_weapon_frame(
    const int32_t* packed, int packed_len,
    int32_t* out_buf)
{
    cd_ox_require_ready("cd_ox_do_homing_weapon_frame");
    CAMLparam0();
    CAMLlocal1(arr);
    arr = caml_alloc(packed_len, 0);
    for (int i = 0; i < packed_len; i++)
        Store_field(arr, i, Val_long(packed[i]));
    const value result = caml_callback(*g_do_homing_weapon_frame, arr);
    for (int i = 0; i < 14; i++)
        out_buf[i] = Int_val(Field(result, i));
    CAMLreturn0;
}

int cd_ox_object_intersects_wall(const int32_t* packed, int packed_len)
{
    cd_ox_require_ready("cd_ox_object_intersects_wall");
    CAMLparam0();
    CAMLlocal1(arr);
    arr = caml_alloc(packed_len, 0);
    for (int i = 0; i < packed_len; i++)
        Store_field(arr, i, Val_long(packed[i]));
    int result = Int_val(caml_callback(*g_object_intersects_wall, arr));
    CAMLreturnT(int, result);
}

int cd_ox_find_point_seg(const int32_t* packed, int packed_len)
{
    cd_ox_require_ready("cd_ox_find_point_seg");
    CAMLparam0();
    CAMLlocal1(arr);
    arr = caml_alloc(packed_len, 0);
    for (int i = 0; i < packed_len; i++)
        Store_field(arr, i, Val_long(packed[i]));
    int result = Int_val(caml_callback(*g_find_point_seg, arr));
    CAMLreturnT(int, result);
}

void cd_ox_find_connected_distance(const int32_t* packed, int packed_len,
                                    int32_t* out_dist, int32_t* out_csd)
{
    cd_ox_require_ready("cd_ox_find_connected_distance");
    CAMLparam0();
    CAMLlocal2(arr, result);
    arr = caml_alloc(packed_len, 0);
    for (int i = 0; i < packed_len; i++)
        Store_field(arr, i, Val_long(packed[i]));
    result = caml_callback(*g_find_connected_distance, arr);
    *out_dist = Int_val(Field(result, 0));
    *out_csd = Int_val(Field(result, 1));
    CAMLreturn0;
}

/* -- FVI check_trans_wall callback ------------------------------------ */

void cd_ox_register_check_trans_wall(cd_check_trans_wall_fn fn)
{
    g_check_trans_wall = fn;
}

CAMLprim value cd_ox_check_trans_wall(value v_segnum, value v_sidenum,
                                       value v_facenum, value v_hx,
                                       value v_hy, value v_hz)
{
    if (!g_check_trans_wall) return Val_int(0);
    int result = g_check_trans_wall(Int_val(v_segnum), Int_val(v_sidenum),
                                    Int_val(v_facenum), Int_val(v_hx),
                                    Int_val(v_hy), Int_val(v_hz));
    return Val_int(result);
}

CAMLprim value cd_ox_check_trans_wall_bytecode(value *argv, int argn)
{
    (void)argn;
    return cd_ox_check_trans_wall(argv[0], argv[1], argv[2],
                                  argv[3], argv[4], argv[5]);
}

void cd_ox_find_vector_intersection(const int32_t* packed, int packed_len,
                                     int32_t* out_buf, int* out_len)
{
    cd_ox_require_ready("cd_ox_find_vector_intersection");
    CAMLparam0();
    CAMLlocal2(arr, result);
    arr = caml_alloc(packed_len, 0);
    for (int i = 0; i < packed_len; i++)
        Store_field(arr, i, Val_long(packed[i]));
    result = caml_callback(*g_find_vector_intersection, arr);
    int result_len = Wosize_val(result);
    *out_len = result_len;
    for (int i = 0; i < result_len; i++)
        out_buf[i] = Int_val(Field(result, i));
    CAMLreturn0;
}

int cd_ox_find_homing_object_complete(const int32_t* packed, int packed_len)
{
    cd_ox_require_ready("cd_ox_find_homing_object_complete");
    CAMLparam0();
    CAMLlocal1(arr);
    arr = caml_alloc(packed_len, 0);
    for (int i = 0; i < packed_len; i++)
        Store_field(arr, i, Val_long(packed[i]));
    int result = Int_val(caml_callback(*g_find_homing_object_complete, arr));
    CAMLreturnT(int, result);
}

int cd_ox_find_homing_object(const int32_t* packed, int packed_len)
{
    cd_ox_require_ready("cd_ox_find_homing_object");
    CAMLparam0();
    CAMLlocal1(arr);
    arr = caml_alloc(packed_len, 0);
    for (int i = 0; i < packed_len; i++)
        Store_field(arr, i, Val_long(packed[i]));
    int result = Int_val(caml_callback(*g_find_homing_object, arr));
    CAMLreturnT(int, result);
}

void cd_ox_track_track_goal(const int32_t* packed, int packed_len, int* out_result, int* out_dot)
{
    cd_ox_require_ready("cd_ox_track_track_goal");
    CAMLparam0();
    CAMLlocal1(result);
    value arr = caml_alloc(packed_len, 0);
    for (int i = 0; i < packed_len; i++)
        Store_field(arr, i, Val_long(packed[i]));
    result = caml_callback(*g_track_track_goal, arr);
    *out_result = Int_val(Field(result, 0));
    *out_dot = Int_val(Field(result, 1));
    CAMLreturn0;
}

/* player_is_visible_from_object: returns 11-element result via out array.
   out[0]=result(0/1/2), out[1..3]=pos, out[4]=need_move_center, out[5]=sub_flags,
   out[6]=hit_type, out[7..9]=hit_pos, out[10]=hit_seg */
void cd_ox_player_is_visible_from_object(const int32_t* packed, int packed_len, int32_t* out)
{
    cd_ox_require_ready("cd_ox_player_is_visible_from_object");
    CAMLparam0();
    CAMLlocal1(result);
    value arr = caml_alloc(packed_len, 0);
    for (int i = 0; i < packed_len; i++)
        Store_field(arr, i, Val_long(packed[i]));
    result = caml_callback(*g_player_is_visible_from_object, arr);
    for (int i = 0; i < 11; i++)
        out[i] = Int_val(Field(result, i));
    CAMLreturn0;
}

/* compute_vis_and_vec: returns 28-element result via out array.
   Packed layout: FVI format + pv_ext(20) + cvv_ext(19).
   The packed array is mutable (OCaml modifies vec_to_player in pv_ext). */
void cd_ox_compute_vis_and_vec(int32_t* packed, int packed_len, int32_t* out)
{
    cd_ox_require_ready("cd_ox_compute_vis_and_vec");
    CAMLparam0();
    CAMLlocal1(result);
    value arr = caml_alloc(packed_len, 0);
    for (int i = 0; i < packed_len; i++)
        Store_field(arr, i, Val_long(packed[i]));
    result = caml_callback(*g_compute_vis_and_vec, arr);
    for (int i = 0; i < 28; i++)
        out[i] = Int_val(Field(result, i));
    CAMLreturn0;
}

/* -- Weapon decision logic -------------------------------------------- */

int cd_ox_player_has_weapon_d1(
    int weapon_flags, int32_t ammo, int32_t energy,
    int32_t ammo_usage, int32_t energy_usage)
{
    cd_ox_require_ready("cd_ox_player_has_weapon_d1");
    value args[5] = {
        Val_int(weapon_flags), Val_int(ammo), Val_int(energy),
        Val_int(ammo_usage), Val_int(energy_usage)
    };
    return Int_val(caml_callbackN(*g_player_has_weapon_d1, 5, args));
}

int cd_ox_player_has_weapon_d2(
    int weapon_flags, int32_t ammo, int32_t energy,
    int32_t ammo_usage, int32_t energy_usage,
    int is_gauss, int32_t vulcan_ammo,
    int is_omega, int32_t omega_charge)
{
    cd_ox_require_ready("cd_ox_player_has_weapon_d2");
    value args[9] = {
        Val_int(weapon_flags), Val_int(ammo), Val_int(energy),
        Val_int(ammo_usage), Val_int(energy_usage),
        Val_int(is_gauss), Val_int(vulcan_ammo),
        Val_int(is_omega), Val_int(omega_charge)
    };
    return Int_val(caml_callbackN(*g_player_has_weapon_d2, 9, args));
}

/* -- Control center frame effects + entry points ---------------------- */

void cd_ox_register_controlcen_frame_effects(
    cd_effect_cc_fire_weapon_fn fire_weapon,
    cd_effect_cc_send_controlcen_fire_fn send_controlcen_fire,
    cd_effect_cc_make_random_vector_fn make_random_vector,
    cd_effect_cc_p_rand_fn p_rand)
{
    g_effect_cc_fire_weapon = fire_weapon;
    g_effect_cc_send_controlcen_fire = send_controlcen_fire;
    g_effect_cc_make_random_vector = make_random_vector;
    g_effect_cc_p_rand = p_rand;
}

/* fire_weapon: 8 args -> unit (native code path) */
CAMLprim value cd_ox_effect_cc_fire_weapon(
    value v_dx, value v_dy, value v_dz,
    value v_px, value v_py, value v_pz,
    value v_parent_id, value v_make_sound)
{
    if (g_effect_cc_fire_weapon)
        g_effect_cc_fire_weapon(
            Int_val(v_dx), Int_val(v_dy), Int_val(v_dz),
            Int_val(v_px), Int_val(v_py), Int_val(v_pz),
            Int_val(v_parent_id), Int_val(v_make_sound));
    return Val_unit;
}

/* fire_weapon: bytecode wrapper */
CAMLprim value cd_ox_effect_cc_fire_weapon_bytecode(value* argv, int argn)
{
    (void)argn;
    return cd_ox_effect_cc_fire_weapon(
        argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6], argv[7]);
}

/* send_controlcen_fire: 5 args -> unit */
CAMLprim value cd_ox_effect_cc_send_controlcen_fire(
    value v_dx, value v_dy, value v_dz, value v_gun_num, value v_obj_id)
{
    if (g_effect_cc_send_controlcen_fire)
        g_effect_cc_send_controlcen_fire(
            Int_val(v_dx), Int_val(v_dy), Int_val(v_dz),
            Int_val(v_gun_num), Int_val(v_obj_id));
    return Val_unit;
}

/* make_random_vector: unit -> (int * int * int) */
CAMLprim value cd_ox_effect_cc_make_random_vector(value unit)
{
    (void)unit;
    CAMLparam0();
    CAMLlocal1(result);
    int32_t rx = 0, ry = 0, rz = 0;
    if (g_effect_cc_make_random_vector)
        g_effect_cc_make_random_vector(&rx, &ry, &rz);
    result = caml_alloc_tuple(3);
    Store_field(result, 0, Val_long(rx));
    Store_field(result, 1, Val_long(ry));
    Store_field(result, 2, Val_long(rz));
    CAMLreturn(result);
}

/* p_rand: unit -> int */
CAMLprim value cd_ox_effect_cc_p_rand(value unit)
{
    (void)unit;
    int result = 0;
    if (g_effect_cc_p_rand)
        result = g_effect_cc_p_rand();
    return Val_int(result);
}

/* D1 entry point */
void cd_ox_do_controlcen_frame_d1(
    int32_t cc_been_hit, int32_t cc_player_seen, int32_t cc_next_fire_time,
    int n_guns, const int32_t* gun_pos_flat, const int32_t* gun_dir_flat,
    int32_t frame_count, int32_t frame_time,
    int32_t game_mode, int32_t difficulty_level,
    int32_t player_flags, int player_is_dead,
    int32_t game_time, int32_t player_time_of_death,
    int32_t obj_x, int32_t obj_y, int32_t obj_z, int32_t obj_segnum,
    int32_t console_x, int32_t console_y, int32_t console_z,
    int32_t believed_x, int32_t believed_y, int32_t believed_z,
    int has_children, int obj_id, int player_objnum,
    int32_t* result)
{
    cd_ox_require_ready("cd_ox_do_controlcen_frame_d1");
    CAMLparam0();
    CAMLlocal3(v_gp, v_gd, v_result);

    /* Build gun_pos_flat OCaml array */
    int gun_arr_len = n_guns * 3;
    if (gun_arr_len > 0) {
        v_gp = caml_alloc(gun_arr_len, 0);
        for (int i = 0; i < gun_arr_len; i++)
            Store_field(v_gp, i, Val_long(gun_pos_flat[i]));
        v_gd = caml_alloc(gun_arr_len, 0);
        for (int i = 0; i < gun_arr_len; i++)
            Store_field(v_gd, i, Val_long(gun_dir_flat[i]));
    } else {
        v_gp = Atom(0);
        v_gd = Atom(0);
    }

    value args[27] = {
        Val_long(cc_been_hit), Val_long(cc_player_seen), Val_long(cc_next_fire_time),
        Val_long(n_guns), v_gp, v_gd,
        Val_long(frame_count), Val_long(frame_time),
        Val_long(game_mode), Val_long(difficulty_level),
        Val_long(player_flags), Val_long(player_is_dead),
        Val_long(game_time), Val_long(player_time_of_death),
        Val_long(obj_x), Val_long(obj_y), Val_long(obj_z), Val_long(obj_segnum),
        Val_long(console_x), Val_long(console_y), Val_long(console_z),
        Val_long(believed_x), Val_long(believed_y), Val_long(believed_z),
        Val_long(has_children), Val_long(obj_id), Val_long(player_objnum)
    };
    v_result = caml_callbackN(*g_do_controlcen_frame_d1, 27, args);

    result[0] = Int_val(Field(v_result, 0));
    result[1] = Int_val(Field(v_result, 1));
    result[2] = Int_val(Field(v_result, 2));
    CAMLreturn0;
}

/* D2 entry point */
void cd_ox_do_controlcen_frame_d2(
    int32_t cc_been_hit, int32_t cc_player_seen, int32_t cc_next_fire_time,
    int n_guns, const int32_t* gun_pos_flat, const int32_t* gun_dir_flat,
    int32_t frame_count, int32_t frame_time,
    int32_t game_mode, int32_t difficulty_level,
    int32_t player_flags, int player_is_dead,
    int32_t game_time, int32_t player_time_of_death,
    int32_t obj_x, int32_t obj_y, int32_t obj_z, int32_t obj_segnum,
    int32_t console_x, int32_t console_y, int32_t console_z,
    int32_t believed_x, int32_t believed_y, int32_t believed_z,
    int has_children, int obj_id, int player_objnum,
    int32_t current_level_num, int32_t last_time_cc_vis_check,
    int32_t* result)
{
    cd_ox_require_ready("cd_ox_do_controlcen_frame_d2");
    CAMLparam0();
    CAMLlocal3(v_gp, v_gd, v_result);

    /* Build gun_pos_flat OCaml array */
    int gun_arr_len = n_guns * 3;
    if (gun_arr_len > 0) {
        v_gp = caml_alloc(gun_arr_len, 0);
        for (int i = 0; i < gun_arr_len; i++)
            Store_field(v_gp, i, Val_long(gun_pos_flat[i]));
        v_gd = caml_alloc(gun_arr_len, 0);
        for (int i = 0; i < gun_arr_len; i++)
            Store_field(v_gd, i, Val_long(gun_dir_flat[i]));
    } else {
        v_gp = Atom(0);
        v_gd = Atom(0);
    }

    value args[29] = {
        Val_long(cc_been_hit), Val_long(cc_player_seen), Val_long(cc_next_fire_time),
        Val_long(n_guns), v_gp, v_gd,
        Val_long(frame_count), Val_long(frame_time),
        Val_long(game_mode), Val_long(difficulty_level),
        Val_long(player_flags), Val_long(player_is_dead),
        Val_long(game_time), Val_long(player_time_of_death),
        Val_long(obj_x), Val_long(obj_y), Val_long(obj_z), Val_long(obj_segnum),
        Val_long(console_x), Val_long(console_y), Val_long(console_z),
        Val_long(believed_x), Val_long(believed_y), Val_long(believed_z),
        Val_long(has_children), Val_long(obj_id), Val_long(player_objnum),
        Val_long(current_level_num), Val_long(last_time_cc_vis_check)
    };
    v_result = caml_callbackN(*g_do_controlcen_frame_d2, 29, args);

    result[0] = Int_val(Field(v_result, 0));
    result[1] = Int_val(Field(v_result, 1));
    result[2] = Int_val(Field(v_result, 2));
    result[3] = Int_val(Field(v_result, 3));
    CAMLreturn0;
}

/* ====================================================================== */
/* AI Frame effects                                                       */
/* ====================================================================== */

void cd_ox_register_ai_frame_effects(
    cd_effect_af_multiplayer_awareness_fn multiplayer_awareness,
    cd_effect_af_robot_hit_attack_fn robot_hit_attack,
    cd_effect_af_fire_laser_fn fire_laser,
    cd_effect_af_calc_gun_point_fn calc_gun_point,
    cd_effect_af_create_path_to_player_fn create_path_to_player,
    cd_effect_af_create_path_to_station_fn create_path_to_station,
    cd_effect_af_create_n_segment_path_fn create_n_segment_path,
    cd_effect_af_create_n_segment_path_to_door_fn create_n_segment_path_to_door,
    cd_effect_af_attempt_to_resume_path_fn attempt_to_resume_path,
    cd_effect_af_ai_follow_path_fn ai_follow_path,
    cd_effect_af_move_towards_segment_center_fn move_towards_segment_center,
    cd_effect_af_compute_vis_and_vec_fn compute_vis_and_vec,
    cd_effect_af_multi_send_robot_position_fn multi_send_robot_position,
    cd_effect_af_do_boss_stuff_fn do_boss_stuff,
    cd_effect_af_p_rand_fn p_rand,
    cd_effect_af_make_random_vector_fn make_random_vector,
    cd_effect_af_object_to_object_visibility_fn object_to_object_visibility,
    cd_effect_af_do_snipe_frame_fn do_snipe_frame,
    cd_effect_af_do_escort_frame_fn do_escort_frame,
    cd_effect_af_do_thief_frame_fn do_thief_frame,
    cd_effect_af_do_any_robot_dying_frame_fn do_any_robot_dying_frame,
    cd_effect_af_make_nearby_robot_snipe_fn make_nearby_robot_snipe,
    cd_effect_af_move_away_from_player_fn move_away_from_player,
    cd_effect_af_laser_create_new_easy_fn laser_create_new_easy)
{
    g_effect_af_multiplayer_awareness = multiplayer_awareness;
    g_effect_af_robot_hit_attack = robot_hit_attack;
    g_effect_af_fire_laser = fire_laser;
    g_effect_af_calc_gun_point = calc_gun_point;
    g_effect_af_create_path_to_player = create_path_to_player;
    g_effect_af_create_path_to_station = create_path_to_station;
    g_effect_af_create_n_segment_path = create_n_segment_path;
    g_effect_af_create_n_segment_path_to_door = create_n_segment_path_to_door;
    g_effect_af_attempt_to_resume_path = attempt_to_resume_path;
    g_effect_af_ai_follow_path = ai_follow_path;
    g_effect_af_move_towards_segment_center = move_towards_segment_center;
    g_effect_af_compute_vis_and_vec = compute_vis_and_vec;
    g_effect_af_multi_send_robot_position = multi_send_robot_position;
    g_effect_af_do_boss_stuff = do_boss_stuff;
    g_effect_af_p_rand = p_rand;
    g_effect_af_make_random_vector = make_random_vector;
    g_effect_af_object_to_object_visibility = object_to_object_visibility;
    g_effect_af_do_snipe_frame = do_snipe_frame;
    g_effect_af_do_escort_frame = do_escort_frame;
    g_effect_af_do_thief_frame = do_thief_frame;
    g_effect_af_do_any_robot_dying_frame = do_any_robot_dying_frame;
    g_effect_af_make_nearby_robot_snipe = make_nearby_robot_snipe;
    g_effect_af_move_away_from_player_af = move_away_from_player;
    g_effect_af_laser_create_new_easy = laser_create_new_easy;
}

CAMLprim value cd_ox_effect_af_multiplayer_awareness(value v_agitation)
{
    int result = 0;
    if (g_effect_af_multiplayer_awareness)
        result = g_effect_af_multiplayer_awareness(Int_val(v_agitation));
    return Val_int(result);
}

CAMLprim value cd_ox_effect_af_robot_hit_attack(value unit)
{
    (void)unit;
    if (g_effect_af_robot_hit_attack)
        g_effect_af_robot_hit_attack();
    return Val_unit;
}

CAMLprim value cd_ox_effect_af_fire_laser(
    value v_gpx, value v_gpy, value v_gpz,
    value v_gun_num,
    value v_fpx, value v_fpy, value v_fpz)
{
    if (g_effect_af_fire_laser)
        g_effect_af_fire_laser(
            Int_val(v_gpx), Int_val(v_gpy), Int_val(v_gpz),
            Int_val(v_gun_num),
            Int_val(v_fpx), Int_val(v_fpy), Int_val(v_fpz));
    return Val_unit;
}

CAMLprim value cd_ox_effect_af_fire_laser_bytecode(value* argv, int argn)
{
    (void)argn;
    return cd_ox_effect_af_fire_laser(
        argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6]);
}

CAMLprim value cd_ox_effect_af_calc_gun_point(value v_gun_num)
{
    CAMLparam0();
    CAMLlocal1(result);
    int32_t gx = 0, gy = 0, gz = 0;
    if (g_effect_af_calc_gun_point)
        g_effect_af_calc_gun_point(Int_val(v_gun_num), &gx, &gy, &gz);
    result = caml_alloc_tuple(3);
    Store_field(result, 0, Val_long(gx));
    Store_field(result, 1, Val_long(gy));
    Store_field(result, 2, Val_long(gz));
    CAMLreturn(result);
}

CAMLprim value cd_ox_effect_af_create_path_to_player(value v_max_length, value v_safety_flag)
{
    if (g_effect_af_create_path_to_player)
        g_effect_af_create_path_to_player(Int_val(v_max_length), Int_val(v_safety_flag));
    return Val_unit;
}

CAMLprim value cd_ox_effect_af_create_path_to_station(value v_max_time)
{
    if (g_effect_af_create_path_to_station)
        g_effect_af_create_path_to_station(Int_val(v_max_time));
    return Val_unit;
}

CAMLprim value cd_ox_effect_af_create_n_segment_path(value v_length, value v_avoid_seg)
{
    if (g_effect_af_create_n_segment_path)
        g_effect_af_create_n_segment_path(Int_val(v_length), Int_val(v_avoid_seg));
    return Val_unit;
}

CAMLprim value cd_ox_effect_af_create_n_segment_path_to_door(value v_length, value v_avoid_seg)
{
    if (g_effect_af_create_n_segment_path_to_door)
        g_effect_af_create_n_segment_path_to_door(Int_val(v_length), Int_val(v_avoid_seg));
    return Val_unit;
}

CAMLprim value cd_ox_effect_af_attempt_to_resume_path(value unit)
{
    (void)unit;
    if (g_effect_af_attempt_to_resume_path)
        g_effect_af_attempt_to_resume_path();
    return Val_unit;
}

CAMLprim value cd_ox_effect_af_ai_follow_path(
    value v_vis, value v_prev_vis,
    value v_vtpx, value v_vtpy, value v_vtpz)
{
    if (g_effect_af_ai_follow_path)
        g_effect_af_ai_follow_path(
            Int_val(v_vis), Int_val(v_prev_vis),
            Int_val(v_vtpx), Int_val(v_vtpy), Int_val(v_vtpz));
    return Val_unit;
}

CAMLprim value cd_ox_effect_af_move_towards_segment_center(value unit)
{
    (void)unit;
    if (g_effect_af_move_towards_segment_center)
        g_effect_af_move_towards_segment_center();
    return Val_unit;
}

CAMLprim value cd_ox_effect_af_compute_vis_and_vec(
    value v_gpx, value v_gpy, value v_gpz)
{
    CAMLparam0();
    CAMLlocal1(result);
    int32_t pv = 0, vtpx = 0, vtpy = 0, vtpz = 0, sound_flag = 0;
    if (g_effect_af_compute_vis_and_vec)
        g_effect_af_compute_vis_and_vec(
            Int_val(v_gpx), Int_val(v_gpy), Int_val(v_gpz),
            &pv, &vtpx, &vtpy, &vtpz, &sound_flag);
    result = caml_alloc_tuple(5);
    Store_field(result, 0, Val_long(pv));
    Store_field(result, 1, Val_long(vtpx));
    Store_field(result, 2, Val_long(vtpy));
    Store_field(result, 3, Val_long(vtpz));
    Store_field(result, 4, Val_long(sound_flag));
    CAMLreturn(result);
}

CAMLprim value cd_ox_effect_af_multi_send_robot_position(value v_flag)
{
    if (g_effect_af_multi_send_robot_position)
        g_effect_af_multi_send_robot_position(Int_val(v_flag));
    return Val_unit;
}

CAMLprim value cd_ox_effect_af_do_boss_stuff(value v_pv)
{
    if (g_effect_af_do_boss_stuff)
        g_effect_af_do_boss_stuff(Int_val(v_pv));
    return Val_unit;
}

CAMLprim value cd_ox_effect_af_p_rand(value unit)
{
    (void)unit;
    int result = 0;
    if (g_effect_af_p_rand)
        result = g_effect_af_p_rand();
    return Val_int(result);
}

CAMLprim value cd_ox_effect_af_make_random_vector(value unit)
{
    CAMLparam0();
    CAMLlocal1(result);
    (void)unit;
    int32_t rx = 0, ry = 0, rz = 0;
    if (g_effect_af_make_random_vector)
        g_effect_af_make_random_vector(&rx, &ry, &rz);
    result = caml_alloc_tuple(3);
    Store_field(result, 0, Val_long(rx));
    Store_field(result, 1, Val_long(ry));
    Store_field(result, 2, Val_long(rz));
    CAMLreturn(result);
}

CAMLprim value cd_ox_effect_af_object_to_object_visibility(value unit)
{
    (void)unit;
    int result = 0;
    if (g_effect_af_object_to_object_visibility)
        result = g_effect_af_object_to_object_visibility();
    return Val_int(result);
}

CAMLprim value cd_ox_effect_af_do_snipe_frame(
    value v_dist, value v_vis,
    value v_vtpx, value v_vtpy, value v_vtpz,
    value v_mode)
{
    if (g_effect_af_do_snipe_frame)
        g_effect_af_do_snipe_frame(
            Int_val(v_dist), Int_val(v_vis),
            Int_val(v_vtpx), Int_val(v_vtpy), Int_val(v_vtpz),
            Int_val(v_mode));
    return Val_unit;
}

CAMLprim value cd_ox_effect_af_do_snipe_frame_bytecode(value *argv, int argn)
{
    (void)argn;
    return cd_ox_effect_af_do_snipe_frame(
        argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLprim value cd_ox_effect_af_do_escort_frame(value v_dist, value v_vis)
{
    if (g_effect_af_do_escort_frame)
        g_effect_af_do_escort_frame(Int_val(v_dist), Int_val(v_vis));
    return Val_unit;
}

CAMLprim value cd_ox_effect_af_do_thief_frame(
    value v_dist, value v_vis,
    value v_vtpx, value v_vtpy, value v_vtpz,
    value v_pat, value v_pat_time)
{
    if (g_effect_af_do_thief_frame)
        g_effect_af_do_thief_frame(
            Int_val(v_dist), Int_val(v_vis),
            Int_val(v_vtpx), Int_val(v_vtpy), Int_val(v_vtpz),
            Int_val(v_pat), Int_val(v_pat_time));
    return Val_unit;
}

CAMLprim value cd_ox_effect_af_do_thief_frame_bytecode(value *argv, int argn)
{
    (void)argn;
    return cd_ox_effect_af_do_thief_frame(
        argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6]);
}

CAMLprim value cd_ox_effect_af_do_any_robot_dying_frame(value unit)
{
    (void)unit;
    int result = 0;
    if (g_effect_af_do_any_robot_dying_frame)
        result = g_effect_af_do_any_robot_dying_frame();
    return Val_int(result);
}

CAMLprim value cd_ox_effect_af_make_nearby_robot_snipe(value unit)
{
    (void)unit;
    if (g_effect_af_make_nearby_robot_snipe)
        g_effect_af_make_nearby_robot_snipe();
    return Val_unit;
}

CAMLprim value cd_ox_effect_af_move_away_from_player(value unit)
{
    (void)unit;
    if (g_effect_af_move_away_from_player_af)
        g_effect_af_move_away_from_player_af();
    return Val_unit;
}

CAMLprim value cd_ox_effect_af_laser_create_new_easy(
    value v_fvx, value v_fvy, value v_fvz,
    value v_fpx, value v_fpy, value v_fpz,
    value v_objnum, value v_weapon_id)
{
    if (g_effect_af_laser_create_new_easy)
        g_effect_af_laser_create_new_easy(
            Int_val(v_fvx), Int_val(v_fvy), Int_val(v_fvz),
            Int_val(v_fpx), Int_val(v_fpy), Int_val(v_fpz),
            Int_val(v_objnum), Int_val(v_weapon_id));
    return Val_unit;
}

CAMLprim value cd_ox_effect_af_laser_create_new_easy_bytecode(value* argv, int argn)
{
    (void)argn;
    return cd_ox_effect_af_laser_create_new_easy(
        argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6], argv[7]);
}

/* AI frame entry points */
void cd_ox_do_ai_frame_d1(
    const int32_t* ai_state, int ai_state_len,
    const int32_t* rinfo, int rinfo_len,
    int32_t frame_time, int32_t frame_count, int32_t game_time,
    int32_t game_mode, int32_t difficulty_level,
    int32_t overall_agitation, int player_is_dead, int player_exploded,
    int32_t player_flags,
    int32_t obj_x, int32_t obj_y, int32_t obj_z,
    int32_t obj_segnum, int32_t obj_size, int32_t obj_id, int objnum,
    int32_t console_x, int32_t console_y, int32_t console_z, int32_t console_size,
    int32_t believed_x, int32_t believed_y, int32_t believed_z, int32_t believed_seg,
    const int32_t* orient, const int32_t* gun_point_in, int32_t seg_special,
    const int32_t* cloak_last_pos, int32_t cloak_last_time, int32_t ai_evaded_in,
    int32_t* result)
{
    cd_ox_require_ready("cd_ox_do_ai_frame_d1");
    CAMLparam0();
    CAMLlocal4(v_ai_state, v_rinfo, v_orient, v_result);
    CAMLlocal2(v_gun_point, v_cloak_pos);

    /* Pack ai_state OCaml array */
    v_ai_state = caml_alloc(ai_state_len, 0);
    for (int i = 0; i < ai_state_len; i++)
        Store_field(v_ai_state, i, Val_long(ai_state[i]));

    /* Pack rinfo OCaml array */
    v_rinfo = caml_alloc(rinfo_len, 0);
    for (int i = 0; i < rinfo_len; i++)
        Store_field(v_rinfo, i, Val_long(rinfo[i]));

    /* Pack orient as 9-element OCaml array */
    v_orient = caml_alloc(9, 0);
    for (int i = 0; i < 9; i++)
        Store_field(v_orient, i, Val_long(orient[i]));

    /* Pack gun_point_in as 3-element OCaml array */
    v_gun_point = caml_alloc(3, 0);
    Store_field(v_gun_point, 0, Val_long(gun_point_in ? gun_point_in[0] : 0));
    Store_field(v_gun_point, 1, Val_long(gun_point_in ? gun_point_in[1] : 0));
    Store_field(v_gun_point, 2, Val_long(gun_point_in ? gun_point_in[2] : 0));

    /* Pack cloak_last_pos as 3-element OCaml array */
    v_cloak_pos = caml_alloc(3, 0);
    Store_field(v_cloak_pos, 0, Val_long(cloak_last_pos ? cloak_last_pos[0] : 0));
    Store_field(v_cloak_pos, 1, Val_long(cloak_last_pos ? cloak_last_pos[1] : 0));
    Store_field(v_cloak_pos, 2, Val_long(cloak_last_pos ? cloak_last_pos[2] : 0));

    value args[32] = {
        v_ai_state, v_rinfo,
        Val_long(frame_time), Val_long(frame_count), Val_long(game_time),
        Val_long(game_mode), Val_long(difficulty_level),
        Val_long(overall_agitation), Val_long(player_is_dead), Val_long(player_exploded),
        Val_long(player_flags),
        Val_long(obj_x), Val_long(obj_y), Val_long(obj_z),
        Val_long(obj_segnum), Val_long(obj_size), Val_long(obj_id), Val_long(objnum),
        Val_long(console_x), Val_long(console_y), Val_long(console_z), Val_long(console_size),
        Val_long(believed_x), Val_long(believed_y), Val_long(believed_z), Val_long(believed_seg),
        v_orient, v_gun_point, Val_long(seg_special),
        v_cloak_pos,
        Val_long(cloak_last_time), Val_long(ai_evaded_in)
    };
    v_result = caml_callbackN(*g_do_ai_frame_d1, 32, args);

    int result_len = Wosize_val(v_result);
    for (int i = 0; i < result_len; i++)
        result[i] = Int_val(Field(v_result, i));
    CAMLreturn0;
}

void cd_ox_do_ai_frame_d2(
    const int32_t* ai_state, int ai_state_len,
    const int32_t* rinfo, int rinfo_len,
    int32_t frame_time, int32_t frame_count, int32_t game_time,
    int32_t game_mode, int32_t difficulty_level,
    int32_t overall_agitation, int player_is_dead, int player_exploded,
    int32_t player_flags,
    int32_t obj_x, int32_t obj_y, int32_t obj_z,
    int32_t obj_segnum, int32_t obj_size, int32_t obj_id, int objnum,
    int32_t console_x, int32_t console_y, int32_t console_z, int32_t console_size,
    int32_t believed_x, int32_t believed_y, int32_t believed_z, int32_t believed_seg,
    const int32_t* orient, const int32_t* gun_point_in, int32_t seg_special,
    const int32_t* cloak_last_pos, int32_t cloak_last_time, int32_t ai_evaded_in,
    int animation_enabled, int32_t current_level_num, int32_t last_missile_camera,
    int robots_kill_robots_cheat, int32_t boss_dying_start_time,
    int32_t phys_flags_in, const int32_t* rotthrust_in,
    int32_t dist_to_last_fired_upon, int32_t fire_at_nearby_threshold,
    int32_t seg_station_enabled,
    int32_t* result)
{
    cd_ox_require_ready("cd_ox_do_ai_frame_d2");
    CAMLparam0();
    CAMLlocal4(v_ai_state, v_rinfo, v_orient, v_result);
    CAMLlocal3(v_gun_point, v_cloak_pos, v_rotthrust);

    v_ai_state = caml_alloc(ai_state_len, 0);
    for (int i = 0; i < ai_state_len; i++)
        Store_field(v_ai_state, i, Val_long(ai_state[i]));

    v_rinfo = caml_alloc(rinfo_len, 0);
    for (int i = 0; i < rinfo_len; i++)
        Store_field(v_rinfo, i, Val_long(rinfo[i]));

    v_orient = caml_alloc(9, 0);
    for (int i = 0; i < 9; i++)
        Store_field(v_orient, i, Val_long(orient[i]));

    v_gun_point = caml_alloc(3, 0);
    Store_field(v_gun_point, 0, Val_long(gun_point_in ? gun_point_in[0] : 0));
    Store_field(v_gun_point, 1, Val_long(gun_point_in ? gun_point_in[1] : 0));
    Store_field(v_gun_point, 2, Val_long(gun_point_in ? gun_point_in[2] : 0));

    v_cloak_pos = caml_alloc(3, 0);
    Store_field(v_cloak_pos, 0, Val_long(cloak_last_pos ? cloak_last_pos[0] : 0));
    Store_field(v_cloak_pos, 1, Val_long(cloak_last_pos ? cloak_last_pos[1] : 0));
    Store_field(v_cloak_pos, 2, Val_long(cloak_last_pos ? cloak_last_pos[2] : 0));

    v_rotthrust = caml_alloc(3, 0);
    Store_field(v_rotthrust, 0, Val_long(rotthrust_in[0]));
    Store_field(v_rotthrust, 1, Val_long(rotthrust_in[1]));
    Store_field(v_rotthrust, 2, Val_long(rotthrust_in[2]));

    value args[42] = {
        v_ai_state, v_rinfo,
        Val_long(frame_time), Val_long(frame_count), Val_long(game_time),
        Val_long(game_mode), Val_long(difficulty_level),
        Val_long(overall_agitation), Val_long(player_is_dead), Val_long(player_exploded),
        Val_long(player_flags),
        Val_long(obj_x), Val_long(obj_y), Val_long(obj_z),
        Val_long(obj_segnum), Val_long(obj_size), Val_long(obj_id), Val_long(objnum),
        Val_long(console_x), Val_long(console_y), Val_long(console_z), Val_long(console_size),
        Val_long(believed_x), Val_long(believed_y), Val_long(believed_z), Val_long(believed_seg),
        v_orient, v_gun_point, Val_long(seg_special),
        v_cloak_pos,
        Val_long(cloak_last_time), Val_long(ai_evaded_in),
        Val_long(animation_enabled), Val_long(current_level_num), Val_long(last_missile_camera),
        Val_long(robots_kill_robots_cheat), Val_long(boss_dying_start_time),
        Val_long(phys_flags_in), v_rotthrust,
        Val_long(dist_to_last_fired_upon), Val_long(fire_at_nearby_threshold),
        Val_long(seg_station_enabled)
    };
    v_result = caml_callbackN(*g_do_ai_frame_d2, 42, args);

    int result_len = Wosize_val(v_result);
    for (int i = 0; i < result_len; i++)
        result[i] = Int_val(Field(v_result, i));
    CAMLreturn0;
}

/* ====================================================================== */
/* Physics sim effects                                                    */
/* ====================================================================== */

void cd_ox_register_physics_sim_effects(
    cd_effect_ps_find_vector_intersection_fn find_vector_intersection,
    cd_effect_ps_collide_object_with_wall_fn collide_object_with_wall,
    cd_effect_ps_scrape_object_on_wall_fn scrape_object_on_wall,
    cd_effect_ps_collide_two_objects_fn collide_two_objects,
    cd_effect_ps_obj_relink_fn obj_relink,
    cd_effect_ps_find_object_seg_fn find_object_seg,
    cd_effect_ps_update_object_seg_fn update_object_seg,
    cd_effect_ps_find_point_seg_fn find_point_seg,
    cd_effect_ps_get_seg_masks_fn get_seg_masks,
    cd_effect_ps_compute_segment_center_fn compute_segment_center,
    cd_effect_ps_add_stuck_object_fn add_stuck_object,
    cd_effect_ps_find_connect_side_fn find_connect_side,
    cd_effect_ps_wall_is_doorway_fn wall_is_doorway,
    cd_effect_ps_create_abs_vertex_lists_and_dist_fn create_abs_vertex_lists_and_dist,
    cd_effect_ps_tmap_is_force_field_fn tmap_is_force_field,
    cd_effect_ps_vm_vector_2_matrix_orient_fn vm_vector_2_matrix_orient)
{
    g_effect_ps_find_vector_intersection = find_vector_intersection;
    g_effect_ps_collide_object_with_wall = collide_object_with_wall;
    g_effect_ps_scrape_object_on_wall = scrape_object_on_wall;
    g_effect_ps_collide_two_objects = collide_two_objects;
    g_effect_ps_obj_relink = obj_relink;
    g_effect_ps_find_object_seg = find_object_seg;
    g_effect_ps_update_object_seg = update_object_seg;
    g_effect_ps_find_point_seg = find_point_seg;
    g_effect_ps_get_seg_masks = get_seg_masks;
    g_effect_ps_compute_segment_center = compute_segment_center;
    g_effect_ps_add_stuck_object = add_stuck_object;
    g_effect_ps_find_connect_side = find_connect_side;
    g_effect_ps_wall_is_doorway = wall_is_doorway;
    g_effect_ps_create_abs_vertex_lists_and_dist = create_abs_vertex_lists_and_dist;
    g_effect_ps_tmap_is_force_field = tmap_is_force_field;
    g_effect_ps_vm_vector_2_matrix_orient = vm_vector_2_matrix_orient;
}

CAMLprim value cd_ox_effect_ps_find_vector_intersection(value v_packed)
{
    CAMLparam1(v_packed);
    CAMLlocal1(v_result);
    int query_len = Wosize_val(v_packed);
    int32_t query[256];
    for (int i = 0; i < query_len && i < 256; i++)
        query[i] = Int_val(Field(v_packed, i));

    int32_t result_buf[256];
    int result_len = 0;
    if (g_effect_ps_find_vector_intersection)
        g_effect_ps_find_vector_intersection(query, query_len, result_buf, &result_len);

    v_result = caml_alloc(result_len, 0);
    for (int i = 0; i < result_len; i++)
        Store_field(v_result, i, Val_long(result_buf[i]));
    CAMLreturn(v_result);
}

CAMLprim value cd_ox_effect_ps_collide_object_with_wall(
    value v_speed, value v_seg, value v_side,
    value v_hx, value v_hy, value v_hz, value v_flags)
{
    int result = Int_val(v_flags);
    if (g_effect_ps_collide_object_with_wall)
        result = g_effect_ps_collide_object_with_wall(
            Int_val(v_speed), Int_val(v_seg), Int_val(v_side),
            Int_val(v_hx), Int_val(v_hy), Int_val(v_hz), Int_val(v_flags));
    return Val_int(result);
}

CAMLprim value cd_ox_effect_ps_collide_object_with_wall_bytecode(value* argv, int argn)
{
    (void)argn;
    return cd_ox_effect_ps_collide_object_with_wall(
        argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6]);
}

CAMLprim value cd_ox_effect_ps_scrape_object_on_wall(
    value v_seg, value v_side,
    value v_hx, value v_hy, value v_hz)
{
    int result = 0;
    if (g_effect_ps_scrape_object_on_wall)
        result = g_effect_ps_scrape_object_on_wall(
            Int_val(v_seg), Int_val(v_side),
            Int_val(v_hx), Int_val(v_hy), Int_val(v_hz));
    return Val_int(result);
}

CAMLprim value cd_ox_effect_ps_scrape_object_on_wall_bytecode(value* argv, int argn)
{
    (void)argn;
    return cd_ox_effect_ps_scrape_object_on_wall(
        argv[0], argv[1], argv[2], argv[3], argv[4]);
}

CAMLprim value cd_ox_effect_ps_collide_two_objects(
    value v_objnum, value v_hx, value v_hy, value v_hz)
{
    CAMLparam0();
    CAMLlocal1(result);
    int32_t flags_out = 0, vx = 0, vy = 0, vz = 0;
    if (g_effect_ps_collide_two_objects)
        g_effect_ps_collide_two_objects(
            Int_val(v_objnum), Int_val(v_hx), Int_val(v_hy), Int_val(v_hz),
            &flags_out, &vx, &vy, &vz);
    result = caml_alloc_tuple(4);
    Store_field(result, 0, Val_long(flags_out));
    Store_field(result, 1, Val_long(vx));
    Store_field(result, 2, Val_long(vy));
    Store_field(result, 3, Val_long(vz));
    CAMLreturn(result);
}

CAMLprim value cd_ox_effect_ps_obj_relink(value v_objnum, value v_seg)
{
    if (g_effect_ps_obj_relink)
        g_effect_ps_obj_relink(Int_val(v_objnum), Int_val(v_seg));
    return Val_unit;
}

CAMLprim value cd_ox_effect_ps_find_object_seg(value v_objnum)
{
    int result = -1;
    if (g_effect_ps_find_object_seg)
        result = g_effect_ps_find_object_seg(Int_val(v_objnum));
    return Val_int(result);
}

CAMLprim value cd_ox_effect_ps_update_object_seg(value v_objnum)
{
    if (g_effect_ps_update_object_seg)
        g_effect_ps_update_object_seg(Int_val(v_objnum));
    return Val_unit;
}

CAMLprim value cd_ox_effect_ps_find_point_seg(
    value v_px, value v_py, value v_pz, value v_seg)
{
    int result = -1;
    if (g_effect_ps_find_point_seg)
        result = g_effect_ps_find_point_seg(
            Int_val(v_px), Int_val(v_py), Int_val(v_pz), Int_val(v_seg));
    return Val_int(result);
}

CAMLprim value cd_ox_effect_ps_get_seg_masks(
    value v_px, value v_py, value v_pz, value v_seg)
{
    int result = 0;
    if (g_effect_ps_get_seg_masks)
        result = g_effect_ps_get_seg_masks(
            Int_val(v_px), Int_val(v_py), Int_val(v_pz), Int_val(v_seg));
    return Val_int(result);
}

CAMLprim value cd_ox_effect_ps_compute_segment_center(value v_seg)
{
    CAMLparam0();
    CAMLlocal1(result);
    int32_t cx = 0, cy = 0, cz = 0;
    if (g_effect_ps_compute_segment_center)
        g_effect_ps_compute_segment_center(Int_val(v_seg), &cx, &cy, &cz);
    result = caml_alloc_tuple(3);
    Store_field(result, 0, Val_long(cx));
    Store_field(result, 1, Val_long(cy));
    Store_field(result, 2, Val_long(cz));
    CAMLreturn(result);
}

CAMLprim value cd_ox_effect_ps_add_stuck_object(value v_seg, value v_side)
{
    if (g_effect_ps_add_stuck_object)
        g_effect_ps_add_stuck_object(Int_val(v_seg), Int_val(v_side));
    return Val_unit;
}

CAMLprim value cd_ox_effect_ps_find_connect_side(value v_seg1, value v_seg2)
{
    int result = -1;
    if (g_effect_ps_find_connect_side)
        result = g_effect_ps_find_connect_side(Int_val(v_seg1), Int_val(v_seg2));
    return Val_int(result);
}

CAMLprim value cd_ox_effect_ps_wall_is_doorway(value v_seg, value v_side)
{
    int result = 0;
    if (g_effect_ps_wall_is_doorway)
        result = g_effect_ps_wall_is_doorway(Int_val(v_seg), Int_val(v_side));
    return Val_int(result);
}

CAMLprim value cd_ox_effect_ps_create_abs_vertex_lists_and_dist(
    value v_seg, value v_side, value v_spx, value v_spy, value v_spz)
{
    CAMLparam0();
    CAMLlocal1(result);
    int32_t dist = 0, nx = 0, ny = 0, nz = 0;
    if (g_effect_ps_create_abs_vertex_lists_and_dist)
        g_effect_ps_create_abs_vertex_lists_and_dist(
            Int_val(v_seg), Int_val(v_side),
            Int_val(v_spx), Int_val(v_spy), Int_val(v_spz),
            &dist, &nx, &ny, &nz);
    result = caml_alloc_tuple(4);
    Store_field(result, 0, Val_long(dist));
    Store_field(result, 1, Val_long(nx));
    Store_field(result, 2, Val_long(ny));
    Store_field(result, 3, Val_long(nz));
    CAMLreturn(result);
}

CAMLprim value cd_ox_effect_ps_tmap_is_force_field(value v_seg, value v_side)
{
    int result = 0;
    if (g_effect_ps_tmap_is_force_field)
        result = g_effect_ps_tmap_is_force_field(Int_val(v_seg), Int_val(v_side));
    return Val_int(result);
}

CAMLprim value cd_ox_effect_ps_vm_vector_2_matrix_orient(
    value v_vx, value v_vy, value v_vz,
    value v_ux, value v_uy, value v_uz)
{
    CAMLparam0();
    CAMLlocal1(result);
    int32_t out[9] = {0};
    if (g_effect_ps_vm_vector_2_matrix_orient)
        g_effect_ps_vm_vector_2_matrix_orient(
            Int_val(v_vx), Int_val(v_vy), Int_val(v_vz),
            Int_val(v_ux), Int_val(v_uy), Int_val(v_uz),
            out);
    result = caml_alloc_tuple(9);
    for (int i = 0; i < 9; i++)
        Store_field(result, i, Val_long(out[i]));
    CAMLreturn(result);
}

CAMLprim value cd_ox_effect_ps_vm_vector_2_matrix_orient_bytecode(value* argv, int argn)
{
    (void)argn;
    return cd_ox_effect_ps_vm_vector_2_matrix_orient(
        argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

/* ====================================================================== */
/* Collision handler effects                                               */
/* ====================================================================== */

static cd_effect_ps_fetch_collision_data_fn g_effect_ps_fetch_collision_data = NULL;
static cd_effect_ps_write_back_hit_object_fn g_effect_ps_write_back_hit_object = NULL;
static cd_effect_ps_write_back_this_object_fn g_effect_ps_write_back_this_object = NULL;
static cd_effect_ps_play_collision_sound_fn g_effect_ps_play_collision_sound = NULL;
static cd_effect_ps_add_points_to_score_fn g_effect_ps_add_points_to_score = NULL;
static cd_effect_ps_create_awareness_event_fn g_effect_ps_create_awareness_event = NULL;
static cd_effect_ps_apply_damage_to_player_fn g_effect_ps_apply_damage_to_player = NULL;

void cd_ox_register_collision_effects(
    cd_effect_ps_fetch_collision_data_fn fetch_collision_data,
    cd_effect_ps_write_back_hit_object_fn write_back_hit_object,
    cd_effect_ps_write_back_this_object_fn write_back_this_object,
    cd_effect_ps_play_collision_sound_fn play_collision_sound,
    cd_effect_ps_add_points_to_score_fn add_points_to_score,
    cd_effect_ps_create_awareness_event_fn create_awareness_event,
    cd_effect_ps_apply_damage_to_player_fn apply_damage_to_player)
{
    g_effect_ps_fetch_collision_data = fetch_collision_data;
    g_effect_ps_write_back_hit_object = write_back_hit_object;
    g_effect_ps_write_back_this_object = write_back_this_object;
    g_effect_ps_play_collision_sound = play_collision_sound;
    g_effect_ps_add_points_to_score = add_points_to_score;
    g_effect_ps_create_awareness_event = create_awareness_event;
    g_effect_ps_apply_damage_to_player = apply_damage_to_player;
}

/* Fetch collision data: returns packed int array with 81 fields */
CAMLprim value cd_ox_effect_ps_fetch_collision_data(value v_hit_objnum)
{
    CAMLparam1(v_hit_objnum);
    CAMLlocal1(result);
    int32_t out[81] = {0};
    if (g_effect_ps_fetch_collision_data)
        g_effect_ps_fetch_collision_data(Int_val(v_hit_objnum), out, 81);
    result = caml_alloc(81, 0);
    for (int i = 0; i < 81; i++)
        Store_field(result, i, Val_long(out[i]));
    CAMLreturn(result);
}

/* Write back hit object state */
CAMLprim value cd_ox_effect_ps_write_back_hit_object(value v_packed)
{
    if (g_effect_ps_write_back_hit_object) {
        int len = Wosize_val(v_packed);
        int32_t buf[16];
        if (len > 16) len = 16;
        for (int i = 0; i < len; i++)
            buf[i] = (int32_t)Long_val(Field(v_packed, i));
        g_effect_ps_write_back_hit_object(buf, len);
    }
    return Val_unit;
}

/* Write back this-object (ps_obj) shields and flags */
CAMLprim value cd_ox_effect_ps_write_back_this_object(value v_shields, value v_flags)
{
    if (g_effect_ps_write_back_this_object)
        g_effect_ps_write_back_this_object((int32_t)Long_val(v_shields), (int32_t)Long_val(v_flags));
    return Val_unit;
}

/* Apply damage to player — calls C's apply_damage_to_player directly */
CAMLprim value cd_ox_effect_ps_apply_damage_to_player(value v_player, value v_killer, value v_damage)
{
    if (g_effect_ps_apply_damage_to_player)
        g_effect_ps_apply_damage_to_player(Int_val(v_player), Int_val(v_killer), (int32_t)Long_val(v_damage));
    return Val_unit;
}

/* Play collision sound */
CAMLprim value cd_ox_effect_ps_play_collision_sound(
    value v_sid, value v_seg, value v_px, value v_py, value v_pz)
{
    if (g_effect_ps_play_collision_sound)
        g_effect_ps_play_collision_sound(
            Int_val(v_sid), Int_val(v_seg),
            Int_val(v_px), Int_val(v_py), Int_val(v_pz));
    return Val_unit;
}

CAMLprim value cd_ox_effect_ps_play_collision_sound_bytecode(value* argv, int argn)
{
    (void)argn;
    return cd_ox_effect_ps_play_collision_sound(
        argv[0], argv[1], argv[2], argv[3], argv[4]);
}

/* Add points to score */
CAMLprim value cd_ox_effect_ps_add_points_to_score(value v_score)
{
    if (g_effect_ps_add_points_to_score)
        g_effect_ps_add_points_to_score(Int_val(v_score));
    return Val_unit;
}

/* Create awareness event */
CAMLprim value cd_ox_effect_ps_create_awareness_event(value v_objnum, value v_type)
{
    if (g_effect_ps_create_awareness_event)
        g_effect_ps_create_awareness_event(Int_val(v_objnum), Int_val(v_type));
    return Val_unit;
}

/* Phase 2 collision effect function pointers */
static cd_effect_ps_create_object_explosion_fn g_effect_ps_create_object_explosion = NULL;
static cd_effect_ps_explode_badass_weapon_fn g_effect_ps_explode_badass_weapon = NULL;
static cd_effect_ps_obj_attach_fn g_effect_ps_obj_attach = NULL;
static cd_effect_ps_do_ai_robot_hit_fn g_effect_ps_do_ai_robot_hit = NULL;
static cd_effect_ps_do_ai_robot_hit_attack_fn g_effect_ps_do_ai_robot_hit_attack = NULL;
static cd_effect_ps_ai_do_cloak_stuff_fn g_effect_ps_ai_do_cloak_stuff = NULL;
static cd_effect_ps_hostage_rescue_fn g_effect_ps_hostage_rescue = NULL;
static cd_effect_ps_multi_robot_request_change_fn g_effect_ps_multi_robot_request_change = NULL;
static cd_effect_ps_multi_send_remobj_fn g_effect_ps_multi_send_remobj = NULL;
static cd_effect_ps_multi_send_play_sound_fn g_effect_ps_multi_send_play_sound = NULL;
static cd_effect_ps_set_weapon_last_hitobj_fn g_effect_ps_set_weapon_last_hitobj = NULL;
static cd_effect_ps_set_boss_hit_this_frame_fn g_effect_ps_set_boss_hit_this_frame = NULL;
static cd_effect_ps_set_weapon_flags_fn g_effect_ps_set_weapon_flags = NULL;
static cd_effect_ps_set_weapon_lifeleft_fn g_effect_ps_set_weapon_lifeleft = NULL;
static cd_effect_ps_detect_escort_goal_fn g_effect_ps_detect_escort_goal = NULL;
static cd_effect_ps_attempt_to_steal_fn g_effect_ps_attempt_to_steal = NULL;
static cd_effect_ps_create_smart_children_fn g_effect_ps_create_smart_children = NULL;
static cd_effect_ps_smega_rock_stuff_fn g_effect_ps_smega_rock_stuff = NULL;
static cd_effect_ps_set_robot_gauss_spin_fn g_effect_ps_set_robot_gauss_spin = NULL;
static cd_effect_ps_set_bump_skip_ai_count_fn g_effect_ps_set_bump_skip_ai_count = NULL;
static cd_effect_ps_do_boss_weapon_collision_fn g_effect_ps_do_boss_weapon_collision = NULL;
static cd_effect_ps_create_badass_explosion_for_boss_fn g_effect_ps_create_badass_explosion_for_boss = NULL;

void cd_ox_register_collision_effects_phase2(
    cd_effect_ps_create_object_explosion_fn create_object_explosion,
    cd_effect_ps_explode_badass_weapon_fn explode_badass_weapon,
    cd_effect_ps_obj_attach_fn obj_attach,
    cd_effect_ps_do_ai_robot_hit_fn do_ai_robot_hit,
    cd_effect_ps_do_ai_robot_hit_attack_fn do_ai_robot_hit_attack,
    cd_effect_ps_ai_do_cloak_stuff_fn ai_do_cloak_stuff,
    cd_effect_ps_hostage_rescue_fn hostage_rescue,
    cd_effect_ps_multi_robot_request_change_fn multi_robot_request_change,
    cd_effect_ps_multi_send_remobj_fn multi_send_remobj,
    cd_effect_ps_multi_send_play_sound_fn multi_send_play_sound,
    cd_effect_ps_set_weapon_last_hitobj_fn set_weapon_last_hitobj,
    cd_effect_ps_set_boss_hit_this_frame_fn set_boss_hit_this_frame,
    cd_effect_ps_set_weapon_flags_fn set_weapon_flags,
    cd_effect_ps_set_weapon_lifeleft_fn set_weapon_lifeleft,
    cd_effect_ps_detect_escort_goal_fn detect_escort_goal,
    cd_effect_ps_attempt_to_steal_fn attempt_to_steal,
    cd_effect_ps_create_smart_children_fn create_smart_children,
    cd_effect_ps_smega_rock_stuff_fn smega_rock_stuff,
    cd_effect_ps_set_robot_gauss_spin_fn set_robot_gauss_spin,
    cd_effect_ps_do_boss_weapon_collision_fn do_boss_weapon_collision,
    cd_effect_ps_create_badass_explosion_for_boss_fn create_badass_explosion_for_boss)
{
    g_effect_ps_create_object_explosion = create_object_explosion;
    g_effect_ps_explode_badass_weapon = explode_badass_weapon;
    g_effect_ps_obj_attach = obj_attach;
    g_effect_ps_do_ai_robot_hit = do_ai_robot_hit;
    g_effect_ps_do_ai_robot_hit_attack = do_ai_robot_hit_attack;
    g_effect_ps_ai_do_cloak_stuff = ai_do_cloak_stuff;
    g_effect_ps_hostage_rescue = hostage_rescue;
    g_effect_ps_multi_robot_request_change = multi_robot_request_change;
    g_effect_ps_multi_send_remobj = multi_send_remobj;
    g_effect_ps_multi_send_play_sound = multi_send_play_sound;
    g_effect_ps_set_weapon_last_hitobj = set_weapon_last_hitobj;
    g_effect_ps_set_boss_hit_this_frame = set_boss_hit_this_frame;
    g_effect_ps_set_weapon_flags = set_weapon_flags;
    g_effect_ps_set_weapon_lifeleft = set_weapon_lifeleft;
    g_effect_ps_detect_escort_goal = detect_escort_goal;
    g_effect_ps_attempt_to_steal = attempt_to_steal;
    g_effect_ps_create_smart_children = create_smart_children;
    g_effect_ps_smega_rock_stuff = smega_rock_stuff;
    g_effect_ps_set_robot_gauss_spin = set_robot_gauss_spin;
    g_effect_ps_do_boss_weapon_collision = do_boss_weapon_collision;
    g_effect_ps_create_badass_explosion_for_boss = create_badass_explosion_for_boss;
}

/* Phase 2 CAMLprim wrappers */
CAMLprim value cd_ox_effect_ps_create_object_explosion(
    value v_seg, value v_px, value v_py, value v_pz, value v_size, value v_vclip)
{
    int r = -1;
    if (g_effect_ps_create_object_explosion)
        r = g_effect_ps_create_object_explosion(
            Int_val(v_seg), Int_val(v_px), Int_val(v_py),
            Int_val(v_pz), Int_val(v_size), Int_val(v_vclip));
    return Val_long(r);
}
CAMLprim value cd_ox_effect_ps_create_object_explosion_bytecode(value* argv, int argn)
{
    (void)argn;
    return cd_ox_effect_ps_create_object_explosion(
        argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLprim value cd_ox_effect_ps_explode_badass_weapon(value v_objnum)
{
    if (g_effect_ps_explode_badass_weapon)
        g_effect_ps_explode_badass_weapon(Int_val(v_objnum));
    return Val_unit;
}

CAMLprim value cd_ox_effect_ps_obj_attach(value v_parent, value v_child)
{
    if (g_effect_ps_obj_attach)
        g_effect_ps_obj_attach(Int_val(v_parent), Int_val(v_child));
    return Val_unit;
}

CAMLprim value cd_ox_effect_ps_do_ai_robot_hit(value v_robot, value v_awareness)
{
    if (g_effect_ps_do_ai_robot_hit)
        g_effect_ps_do_ai_robot_hit(Int_val(v_robot), Int_val(v_awareness));
    return Val_unit;
}

CAMLprim value cd_ox_effect_ps_do_ai_robot_hit_attack(
    value v_robot, value v_player, value v_px, value v_py, value v_pz)
{
    if (g_effect_ps_do_ai_robot_hit_attack)
        g_effect_ps_do_ai_robot_hit_attack(
            Int_val(v_robot), Int_val(v_player),
            Int_val(v_px), Int_val(v_py), Int_val(v_pz));
    return Val_unit;
}
CAMLprim value cd_ox_effect_ps_do_ai_robot_hit_attack_bytecode(value* argv, int argn)
{
    (void)argn;
    return cd_ox_effect_ps_do_ai_robot_hit_attack(
        argv[0], argv[1], argv[2], argv[3], argv[4]);
}

CAMLprim value cd_ox_effect_ps_ai_do_cloak_stuff(value v_unit)
{
    (void)v_unit;
    if (g_effect_ps_ai_do_cloak_stuff)
        g_effect_ps_ai_do_cloak_stuff();
    return Val_unit;
}

CAMLprim value cd_ox_effect_ps_hostage_rescue(value v_id)
{
    if (g_effect_ps_hostage_rescue)
        g_effect_ps_hostage_rescue(Int_val(v_id));
    return Val_unit;
}

CAMLprim value cd_ox_effect_ps_multi_robot_request_change(value v_robot, value v_pid)
{
    if (g_effect_ps_multi_robot_request_change)
        g_effect_ps_multi_robot_request_change(Int_val(v_robot), Int_val(v_pid));
    return Val_unit;
}

CAMLprim value cd_ox_effect_ps_multi_send_remobj(value v_objnum)
{
    if (g_effect_ps_multi_send_remobj)
        g_effect_ps_multi_send_remobj(Int_val(v_objnum));
    return Val_unit;
}

CAMLprim value cd_ox_effect_ps_multi_send_play_sound(value v_sid, value v_vol)
{
    if (g_effect_ps_multi_send_play_sound)
        g_effect_ps_multi_send_play_sound(Int_val(v_sid), Int_val(v_vol));
    return Val_unit;
}

CAMLprim value cd_ox_effect_ps_set_weapon_last_hitobj(value v_wep, value v_hit)
{
    if (g_effect_ps_set_weapon_last_hitobj)
        g_effect_ps_set_weapon_last_hitobj(Int_val(v_wep), Int_val(v_hit));
    return Val_unit;
}

CAMLprim value cd_ox_effect_ps_set_boss_hit_this_frame(value v_unit)
{
    (void)v_unit;
    if (g_effect_ps_set_boss_hit_this_frame)
        g_effect_ps_set_boss_hit_this_frame();
    return Val_unit;
}

CAMLprim value cd_ox_effect_ps_set_weapon_flags(value v_wep, value v_flags)
{
    if (g_effect_ps_set_weapon_flags)
        g_effect_ps_set_weapon_flags(Int_val(v_wep), Int_val(v_flags));
    return Val_unit;
}

CAMLprim value cd_ox_effect_ps_set_weapon_lifeleft(value v_wep, value v_life)
{
    if (g_effect_ps_set_weapon_lifeleft)
        g_effect_ps_set_weapon_lifeleft(Int_val(v_wep), Int_val(v_life));
    return Val_unit;
}

CAMLprim value cd_ox_effect_ps_detect_escort_goal(value v_objnum)
{
    if (g_effect_ps_detect_escort_goal)
        g_effect_ps_detect_escort_goal(Int_val(v_objnum));
    return Val_unit;
}

CAMLprim value cd_ox_effect_ps_attempt_to_steal(value v_robot, value v_pid)
{
    if (g_effect_ps_attempt_to_steal)
        g_effect_ps_attempt_to_steal(Int_val(v_robot), Int_val(v_pid));
    return Val_unit;
}

CAMLprim value cd_ox_effect_ps_create_smart_children(value v_robot, value v_num)
{
    if (g_effect_ps_create_smart_children)
        g_effect_ps_create_smart_children(Int_val(v_robot), Int_val(v_num));
    return Val_unit;
}

CAMLprim value cd_ox_effect_ps_smega_rock_stuff(value v_unit)
{
    (void)v_unit;
    if (g_effect_ps_smega_rock_stuff)
        g_effect_ps_smega_rock_stuff();
    return Val_unit;
}

CAMLprim value cd_ox_effect_ps_set_robot_gauss_spin(value v_robot)
{
    if (g_effect_ps_set_robot_gauss_spin)
        g_effect_ps_set_robot_gauss_spin(Int_val(v_robot));
    return Val_unit;
}

CAMLprim value cd_ox_effect_ps_do_boss_weapon_collision(value v_robot, value v_weapon)
{
    int r = 1;
    if (g_effect_ps_do_boss_weapon_collision)
        r = g_effect_ps_do_boss_weapon_collision(Int_val(v_robot), Int_val(v_weapon));
    return Val_long(r);
}

CAMLprim value cd_ox_effect_ps_create_badass_explosion_for_boss(
    value v_wep, value v_seg, value v_px, value v_py, value v_pz)
{
    if (g_effect_ps_create_badass_explosion_for_boss)
        g_effect_ps_create_badass_explosion_for_boss(
            Int_val(v_wep), Int_val(v_seg), Int_val(v_px), Int_val(v_py), Int_val(v_pz));
    return Val_unit;
}
CAMLprim value cd_ox_effect_ps_create_badass_explosion_for_boss_bytecode(value* argv, int argn)
{
    (void)argn;
    return cd_ox_effect_ps_create_badass_explosion_for_boss(
        argv[0], argv[1], argv[2], argv[3], argv[4]);
}

/* Phase 3: bump SKIP_AI_COUNT */
void cd_ox_register_collision_effects_phase3(
    cd_effect_ps_set_bump_skip_ai_count_fn set_bump_skip_ai_count)
{
    g_effect_ps_set_bump_skip_ai_count = set_bump_skip_ai_count;
}

CAMLprim value cd_ox_effect_ps_set_bump_skip_ai_count(value v_robot)
{
    if (g_effect_ps_set_bump_skip_ai_count)
        g_effect_ps_set_bump_skip_ai_count(Int_val(v_robot));
    return Val_unit;
}

/* Physics sim entry points */
void cd_ox_do_physics_sim_d1(
    int32_t pos_x, int32_t pos_y, int32_t pos_z,
    int32_t vel_x, int32_t vel_y, int32_t vel_z,
    int32_t thrust_x, int32_t thrust_y, int32_t thrust_z,
    const int32_t* orient,
    int32_t rotvel_x, int32_t rotvel_y, int32_t rotvel_z,
    int32_t rotthrust_x, int32_t rotthrust_y, int32_t rotthrust_z,
    int32_t size, int32_t mass, int32_t drag,
    int32_t phys_flags, int32_t obj_flags, int obj_type, int obj_id,
    int32_t obj_segnum, int objnum, int32_t turnroll,
    int32_t last_pos_x, int32_t last_pos_y, int32_t last_pos_z,
    int32_t frame_time, int32_t physics_cheat_flag,
    int32_t* result)
{
    cd_ox_require_ready("cd_ox_do_physics_sim_d1");
    CAMLparam0();
    CAMLlocal2(v_orient, v_result);

    /* Pack orient as OCaml tuple of 3 tuples: ((rx,ry,rz),(ux,uy,uz),(fx,fy,fz)) */
    CAMLlocal3(v_rvec, v_uvec, v_fvec);
    v_rvec = caml_alloc_tuple(3);
    Store_field(v_rvec, 0, Val_long(orient[0]));
    Store_field(v_rvec, 1, Val_long(orient[1]));
    Store_field(v_rvec, 2, Val_long(orient[2]));
    v_uvec = caml_alloc_tuple(3);
    Store_field(v_uvec, 0, Val_long(orient[3]));
    Store_field(v_uvec, 1, Val_long(orient[4]));
    Store_field(v_uvec, 2, Val_long(orient[5]));
    v_fvec = caml_alloc_tuple(3);
    Store_field(v_fvec, 0, Val_long(orient[6]));
    Store_field(v_fvec, 1, Val_long(orient[7]));
    Store_field(v_fvec, 2, Val_long(orient[8]));
    v_orient = caml_alloc_tuple(3);
    Store_field(v_orient, 0, v_rvec);
    Store_field(v_orient, 1, v_uvec);
    Store_field(v_orient, 2, v_fvec);

    value args[31] = {
        Val_long(pos_x), Val_long(pos_y), Val_long(pos_z),
        Val_long(vel_x), Val_long(vel_y), Val_long(vel_z),
        Val_long(thrust_x), Val_long(thrust_y), Val_long(thrust_z),
        v_orient,
        Val_long(rotvel_x), Val_long(rotvel_y), Val_long(rotvel_z),
        Val_long(rotthrust_x), Val_long(rotthrust_y), Val_long(rotthrust_z),
        Val_long(size), Val_long(mass), Val_long(drag),
        Val_long(phys_flags), Val_long(obj_flags), Val_long(obj_type), Val_long(obj_id),
        Val_long(obj_segnum), Val_long(objnum), Val_long(turnroll),
        Val_long(last_pos_x), Val_long(last_pos_y), Val_long(last_pos_z),
        Val_long(frame_time), Val_long(physics_cheat_flag)
    };
    v_result = caml_callbackN(*g_do_physics_sim_d1, 31, args);

    int result_len = Wosize_val(v_result);
    for (int i = 0; i < result_len; i++)
        result[i] = Int_val(Field(v_result, i));
    CAMLreturn0;
}

void cd_ox_do_physics_sim_d2(
    int32_t pos_x, int32_t pos_y, int32_t pos_z,
    int32_t vel_x, int32_t vel_y, int32_t vel_z,
    int32_t thrust_x, int32_t thrust_y, int32_t thrust_z,
    const int32_t* orient,
    int32_t rotvel_x, int32_t rotvel_y, int32_t rotvel_z,
    int32_t rotthrust_x, int32_t rotthrust_y, int32_t rotthrust_z,
    int32_t size, int32_t mass, int32_t drag,
    int32_t phys_flags, int32_t obj_flags, int obj_type, int obj_id,
    int32_t obj_segnum, int objnum, int32_t turnroll,
    int32_t last_pos_x, int32_t last_pos_y, int32_t last_pos_z,
    int32_t orient_uvec_x, int32_t orient_uvec_y, int32_t orient_uvec_z,
    int32_t seg_special,
    int32_t frame_time, int32_t physics_cheat_flag,
    int32_t* result)
{
    cd_ox_require_ready("cd_ox_do_physics_sim_d2");
    CAMLparam0();
    CAMLlocal2(v_orient, v_result);

    CAMLlocal3(v_rvec, v_uvec, v_fvec);
    v_rvec = caml_alloc_tuple(3);
    Store_field(v_rvec, 0, Val_long(orient[0]));
    Store_field(v_rvec, 1, Val_long(orient[1]));
    Store_field(v_rvec, 2, Val_long(orient[2]));
    v_uvec = caml_alloc_tuple(3);
    Store_field(v_uvec, 0, Val_long(orient[3]));
    Store_field(v_uvec, 1, Val_long(orient[4]));
    Store_field(v_uvec, 2, Val_long(orient[5]));
    v_fvec = caml_alloc_tuple(3);
    Store_field(v_fvec, 0, Val_long(orient[6]));
    Store_field(v_fvec, 1, Val_long(orient[7]));
    Store_field(v_fvec, 2, Val_long(orient[8]));
    v_orient = caml_alloc_tuple(3);
    Store_field(v_orient, 0, v_rvec);
    Store_field(v_orient, 1, v_uvec);
    Store_field(v_orient, 2, v_fvec);

    value args[35] = {
        Val_long(pos_x), Val_long(pos_y), Val_long(pos_z),
        Val_long(vel_x), Val_long(vel_y), Val_long(vel_z),
        Val_long(thrust_x), Val_long(thrust_y), Val_long(thrust_z),
        v_orient,
        Val_long(rotvel_x), Val_long(rotvel_y), Val_long(rotvel_z),
        Val_long(rotthrust_x), Val_long(rotthrust_y), Val_long(rotthrust_z),
        Val_long(size), Val_long(mass), Val_long(drag),
        Val_long(phys_flags), Val_long(obj_flags), Val_long(obj_type), Val_long(obj_id),
        Val_long(obj_segnum), Val_long(objnum), Val_long(turnroll),
        Val_long(last_pos_x), Val_long(last_pos_y), Val_long(last_pos_z),
        Val_long(orient_uvec_x), Val_long(orient_uvec_y), Val_long(orient_uvec_z),
        Val_long(seg_special),
        Val_long(frame_time), Val_long(physics_cheat_flag)
    };
    v_result = caml_callbackN(*g_do_physics_sim_d2, 35, args);

    int result_len = Wosize_val(v_result);
    for (int i = 0; i < result_len; i++)
        result[i] = Int_val(Field(v_result, i));
    CAMLreturn0;
}
