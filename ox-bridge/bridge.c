#include "bridge.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

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
static const value* g_apply_damage_to_robot_d1 = NULL;

/* FVI check_trans_wall callback (set via cd_ox_register_check_trans_wall) */
static cd_check_trans_wall_fn g_check_trans_wall = NULL;

/* FVI on-demand data fetch callbacks (set via cd_ox_register_fvi_data_callbacks) */
static cd_fvi_fetch_segment_data_fn g_fvi_fetch_segment_data = NULL;
static cd_fvi_fetch_object_data_fn g_fvi_fetch_object_data = NULL;
static cd_fvi_fetch_collision_table_fn g_fvi_fetch_collision_table = NULL;

/* Object detach function pointers (set via cd_ox_register_obj_detach_effects) */
static cd_obj_detach_one_fn g_obj_detach_one = NULL;
static cd_get_attached_obj_fn g_get_attached_obj = NULL;

/* Morph effect function pointers (set via cd_ox_register_morph_effects) */
static cd_effect_morph_fetch_submodel_vertices_fn g_effect_morph_fetch_submodel_vertices = NULL;
static const value* g_find_min_max = NULL;
static const value* g_update_points = NULL;

/* wake_up_rendered_objects effect function pointers */
typedef void (*cd_effect_fetch_wake_up_context_fn)(int window_num, int32_t* out, int* out_len);
typedef int (*cd_effect_fetch_ai_local_awareness_fn)(int objnum);
typedef void (*cd_effect_apply_wake_up_fn)(const int32_t* packed, int len);
static cd_effect_fetch_wake_up_context_fn g_effect_fetch_wake_up_context = NULL;
static cd_effect_fetch_ai_local_awareness_fn g_effect_fetch_ai_local_awareness = NULL;
static cd_effect_apply_wake_up_fn g_effect_apply_wake_up = NULL;
static const value* g_wake_up_rendered_objects = NULL;

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
static const value* g_phys_apply_rot_d2 = NULL;
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
static const value* g_init_ai_object_d1 = NULL;
static const value* g_init_ai_object_d2 = NULL;
static const value* g_add_awareness_event = NULL;
static const value* g_create_awareness_event = NULL;
static const value* g_init_ai_frame = NULL;
static const value* g_compute_object_light = NULL;
static const value* g_do_physics_drag = NULL;
static const value* g_do_homing_weapon_frame = NULL;
static const value* g_player_has_weapon_d1 = NULL;
static const value* g_player_has_weapon_d2 = NULL;
static const value* g_p_order_list = NULL;
static const value* g_s_order_list = NULL;

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
static const value* g_init_controlcen_for_level = NULL;

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
static cd_effect_af_invalidate_escort_goal_fn g_effect_af_invalidate_escort_goal_af = NULL;
static cd_effect_af_laser_create_new_easy_fn g_effect_af_laser_create_new_easy = NULL;
static cd_effect_af_do_companion_extras_fn g_effect_af_do_companion_extras = NULL;
static cd_effect_af_do_thief_extras_fn g_effect_af_do_thief_extras = NULL;
static cd_effect_af_read_path_state_fn g_read_path_state = NULL;
static cd_effect_af_read_fire_state_fn g_read_fire_state = NULL;
static void (*g_write_fire_timers)(int32_t next_fire, int32_t next_fire2) = NULL;
static int (*g_effect_af_openable_doors_in_segment)(void) = NULL;
/* Pathfinding callbacks */
static cd_fetch_wall_data_fn g_fetch_wall_data = NULL;
static cd_path_fvi_query_fn g_path_fvi_query = NULL;
static cd_path_obj_relink_fn g_path_obj_relink = NULL;
static cd_path_find_object_seg_fn g_path_find_object_seg = NULL;
static const value* g_do_ai_frame_d1 = NULL;
static const value* g_do_ai_frame_d2 = NULL;
static const value* g_init_ai_for_ship = NULL;
static const value* g_init_robots_for_level_d1 = NULL;
static const value* g_init_robots_for_level_d2 = NULL;
static const value* g_init_thief_for_level = NULL;
static const value* g_create_bfs_list = NULL;
static const value* g_bash_to_shield = NULL;
static const value* g_clear_stuck_objects = NULL;
static const value* g_init_ammo_and_energy = NULL;
static const value* g_update_player_stats = NULL;
static const value* g_special_reset_objects = NULL;
static const value* g_init_player_object = NULL;
static const value* g_verify_console_object = NULL;
static const value* g_free_object_slots = NULL;
static const value* g_copy_defaults_to_robot = NULL;
static const value* g_copy_defaults_to_robot_all = NULL;
static const value* g_filter_objects_from_level = NULL;
static const value* g_do_lock_doors = NULL;
static const value* g_do_unlock_doors = NULL;
static const value* g_door_is_wall_switched = NULL;
static const value* g_flag_wall_switched_doors = NULL;
static const value* g_reset_walls = NULL;
static const value* g_kill_stuck_objects = NULL;
static const value* g_wall_illusion_off = NULL;
static const value* g_wall_illusion_on = NULL;
static const value* g_do_il_on = NULL;
static const value* g_fuelcen_create = NULL;
static const value* g_matcen_create = NULL;
static const value* g_fuelcen_activate = NULL;
static const value* g_explode_wall = NULL;

/* Fireball effect function pointers */
static cd_effect_fb_alloc_expl_wall_slot_fn g_effect_fb_alloc_expl_wall_slot = NULL;
static cd_effect_fb_digi_link_sound_to_pos_fn g_effect_fb_digi_link_sound_to_pos = NULL;

/* Fuelcen effect function pointers */
typedef void (*cd_effect_fc_fetch_fuelcen_create_data_fn)(int segnum, int32_t* out);
typedef void (*cd_effect_fc_write_fuelcen_create_fn)(const int32_t* packed, int len);
static cd_effect_fc_fetch_fuelcen_create_data_fn g_effect_fc_fetch_fuelcen_create_data = NULL;
static cd_effect_fc_write_fuelcen_create_fn g_effect_fc_write_fuelcen_create = NULL;

/* Matcen effect function pointers */
typedef void (*cd_effect_fc_fetch_matcen_create_data_fn)(int segnum, int32_t* out);
typedef void (*cd_effect_fc_write_matcen_create_fn)(const int32_t* packed, int len);
static cd_effect_fc_fetch_matcen_create_data_fn g_effect_fc_fetch_matcen_create_data = NULL;
static cd_effect_fc_write_matcen_create_fn g_effect_fc_write_matcen_create = NULL;
static cd_effect_fc_set_segment_special_fn g_effect_fc_set_segment_special = NULL;

/* Switch effect function pointers */
static cd_effect_sw_fetch_trigger_links_fn g_effect_sw_fetch_trigger_links = NULL;
static cd_effect_sw_lock_wall_door_fn g_effect_sw_lock_wall_door = NULL;
static cd_effect_sw_unlock_wall_door_fn g_effect_sw_unlock_wall_door = NULL;
static cd_effect_sw_get_num_triggers_fn g_effect_sw_get_num_triggers = NULL;
static cd_effect_sw_get_num_walls_fn g_effect_sw_get_num_walls = NULL;
static cd_effect_sw_set_wall_flag_wall_switch_fn g_effect_sw_set_wall_flag_wall_switch = NULL;
static cd_effect_sw_fetch_trigger_seg_sides_fn g_effect_sw_fetch_trigger_seg_sides = NULL;

/* Gameseq effect function pointers */
typedef void (*cd_effect_gs_fetch_bash_to_shield_data_fn)(int objnum, int32_t* out);
typedef void (*cd_effect_gs_write_bash_to_shield_fn)(const int32_t* packed, int len);
typedef void (*cd_effect_gs_fetch_stuck_objects_data_fn)(int32_t* out, int* out_len);
typedef void (*cd_effect_gs_write_clear_stuck_objects_fn)(const int32_t* packed, int len);
static cd_effect_gs_fetch_bash_to_shield_data_fn g_effect_gs_fetch_bash_to_shield_data = NULL;
static cd_effect_gs_write_bash_to_shield_fn g_effect_gs_write_bash_to_shield = NULL;
static cd_effect_gs_fetch_stuck_objects_data_fn g_effect_gs_fetch_stuck_objects_data = NULL;
static cd_effect_gs_write_clear_stuck_objects_fn g_effect_gs_write_clear_stuck_objects = NULL;
typedef void (*cd_effect_gs_fetch_init_ammo_energy_data_fn)(int32_t* out);
typedef void (*cd_effect_gs_write_init_ammo_energy_fn)(const int32_t* packed, int len);
static cd_effect_gs_fetch_init_ammo_energy_data_fn g_effect_gs_fetch_init_ammo_energy_data = NULL;
static cd_effect_gs_write_init_ammo_energy_fn g_effect_gs_write_init_ammo_energy = NULL;
typedef void (*cd_effect_gs_fetch_filter_objects_data_fn)(int32_t* out, int* out_len);
static cd_effect_gs_fetch_filter_objects_data_fn g_effect_gs_fetch_filter_objects_data = NULL;

/* init_player_object effect function pointers */
static cd_effect_gs_fetch_init_player_object_data_fn g_effect_gs_fetch_init_player_object_data = NULL;
static cd_effect_gs_write_init_player_object_fn g_effect_gs_write_init_player_object = NULL;

/* verify_console_object effect function pointers */
static cd_effect_gs_fetch_verify_console_object_data_fn g_effect_gs_fetch_verify_console_object_data = NULL;
static cd_effect_gs_write_verify_console_object_fn g_effect_gs_write_verify_console_object = NULL;

/* update_player_stats effect function pointers */
typedef void (*cd_effect_gs_fetch_update_player_stats_data_fn)(int32_t* out);
typedef void (*cd_effect_gs_write_update_player_stats_fn)(const int32_t* packed, int len);
static cd_effect_gs_fetch_update_player_stats_data_fn g_effect_gs_fetch_update_player_stats_data = NULL;
static cd_effect_gs_write_update_player_stats_fn g_effect_gs_write_update_player_stats = NULL;

/* special_reset_objects effect function pointers */
typedef void (*cd_effect_gs_fetch_special_reset_objects_data_fn)(int32_t* out);
typedef void (*cd_effect_gs_write_special_reset_objects_fn)(const int32_t* packed, int len);
static cd_effect_gs_fetch_special_reset_objects_data_fn g_effect_gs_fetch_special_reset_objects_data = NULL;
static cd_effect_gs_write_special_reset_objects_fn g_effect_gs_write_special_reset_objects = NULL;

/* copy_defaults_to_robot effect function pointers */
static cd_effect_gs_fetch_copy_defaults_to_robot_data_fn g_effect_gs_fetch_copy_defaults_to_robot_data = NULL;
static cd_effect_gs_write_copy_defaults_to_robot_fn g_effect_gs_write_copy_defaults_to_robot = NULL;

/* free_object_slots effect function pointers */
typedef void (*cd_effect_gs_fetch_free_object_slots_data_fn)(int32_t* out, int* out_len);
typedef void (*cd_effect_gs_write_free_object_slots_fn)(const int32_t* packed, int len);
static cd_effect_gs_fetch_free_object_slots_data_fn g_effect_gs_fetch_free_object_slots_data = NULL;
static cd_effect_gs_write_free_object_slots_fn g_effect_gs_write_free_object_slots = NULL;

/* Wall effect function pointers */
static cd_effect_wall_fetch_reset_walls_info_fn g_effect_wall_fetch_reset_walls_info = NULL;
static cd_effect_wall_write_reset_walls_fn g_effect_wall_write_reset_walls = NULL;
static cd_effect_wall_fetch_kill_stuck_data_fn g_effect_wall_fetch_kill_stuck_data = NULL;
static cd_effect_wall_write_kill_stuck_objects_fn g_effect_wall_write_kill_stuck_objects = NULL;
static cd_effect_wall_flush_fcd_cache_fn g_effect_wall_flush_fcd_cache = NULL;
static cd_effect_wall_fetch_seg_children_and_wall_nums_fn g_effect_wall_fetch_seg_children_and_wall_nums = NULL;
static cd_effect_wall_set_flags_fn g_effect_wall_set_flags = NULL;
static cd_effect_wall_clear_flags_fn g_effect_wall_clear_flags = NULL;

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
static cd_effect_ps_fetch_doorway_info_fn g_effect_ps_fetch_doorway_info = NULL;
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
static const value* g_check_volatile_wall = NULL;

/* check_volatile_wall effect function pointers */
static cd_effect_cvw_apply_damage_fn g_effect_cvw_apply_damage = NULL;
static cd_effect_cvw_palette_flash_fn g_effect_cvw_palette_flash = NULL;

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
static const value* g_find_point_seg = NULL;
static const value* g_find_connected_distance = NULL;

/* v2 callbacks (on-demand data fetching via effects) */
static const value* g_find_vector_intersection_v2 = NULL;
static const value* g_object_intersects_wall_v2 = NULL;
static const value* g_find_homing_object_complete_v2 = NULL;
static const value* g_find_homing_object_v2 = NULL;
static const value* g_track_track_goal_v2 = NULL;
static const value* g_player_is_visible_from_object_v2 = NULL;
static const value* g_compute_vis_and_vec_v2 = NULL;

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
          && g_apply_damage_to_robot_d1
          && g_apply_damage_to_robot_d2
          && g_physics_turn_towards_vector
          && g_do_physics_sim_rot
          && g_calc_gun_point
          && g_phys_apply_force
          && g_phys_apply_rot
          && g_phys_apply_rot_d2
          && g_ai_turn_towards_vector
          && g_set_thrust_from_velocity
          && g_move_towards_vector
          && g_move_around_player
          && g_move_away_from_player
          && g_set_object_turnroll
          && g_lead_player
          && g_homing_missile_turn_towards_velocity
          && g_do_physics_align_object
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
          && g_init_ai_object_d1
          && g_init_ai_object_d2
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
          && g_check_volatile_wall
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
          && g_find_point_seg
          && g_player_has_weapon_d1
          && g_player_has_weapon_d2
          && g_p_order_list
          && g_s_order_list
          && g_do_controlcen_frame_d1
          && g_do_controlcen_frame_d2
          && g_init_controlcen_for_level
          && g_do_ai_frame_d1
          && g_do_ai_frame_d2
          && g_init_ai_for_ship
          && g_init_robots_for_level_d1
          && g_init_robots_for_level_d2
          && g_init_thief_for_level
          && g_create_bfs_list
          && g_free_object_slots
          && g_filter_objects_from_level
          && g_special_reset_objects
          && g_bash_to_shield
          && g_clear_stuck_objects
          && g_init_ammo_and_energy
          && g_update_player_stats
          && g_verify_console_object
          && g_do_lock_doors
          && g_do_unlock_doors
          && g_door_is_wall_switched
          && g_flag_wall_switched_doors
          && g_reset_walls
          && g_wall_illusion_off
          && g_wall_illusion_on
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
    g_apply_damage_to_robot_d1 = caml_named_value("cd_apply_damage_to_robot_d1");
    g_apply_damage_to_robot_d2 = caml_named_value("cd_apply_damage_to_robot_d2");
    g_physics_turn_towards_vector = caml_named_value("cd_physics_turn_towards_vector");
    g_do_physics_sim_rot = caml_named_value("cd_do_physics_sim_rot");
    g_calc_gun_point = caml_named_value("cd_calc_gun_point");
    g_phys_apply_force = caml_named_value("cd_phys_apply_force");
    g_phys_apply_rot = caml_named_value("cd_phys_apply_rot");
    g_phys_apply_rot_d2 = caml_named_value("cd_phys_apply_rot_d2");
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
    g_init_ai_object_d1 = caml_named_value("cd_init_ai_object_d1");
    g_init_ai_object_d2 = caml_named_value("cd_init_ai_object_d2");
    g_add_awareness_event = caml_named_value("cd_add_awareness_event");
    g_create_awareness_event = caml_named_value("cd_create_awareness_event");
    g_init_ai_frame = caml_named_value("cd_init_ai_frame");
    g_compute_object_light = caml_named_value("cd_compute_object_light");
    g_do_physics_drag = caml_named_value("cd_do_physics_drag");
    g_do_homing_weapon_frame = caml_named_value("cd_do_homing_weapon_frame");
    g_player_has_weapon_d1 = caml_named_value("cd_player_has_weapon_d1");
    g_player_has_weapon_d2 = caml_named_value("cd_player_has_weapon_d2");
    g_p_order_list = caml_named_value("cd_p_order_list");
    g_s_order_list = caml_named_value("cd_s_order_list");
    g_do_controlcen_frame_d1 = caml_named_value("cd_do_controlcen_frame_d1");
    g_do_controlcen_frame_d2 = caml_named_value("cd_do_controlcen_frame_d2");
    g_init_controlcen_for_level = caml_named_value("cd_init_controlcen_for_level");
    g_do_ai_frame_d1 = caml_named_value("cd_do_ai_frame_d1");
    g_do_ai_frame_d2 = caml_named_value("cd_do_ai_frame_d2");
    g_init_ai_for_ship = caml_named_value("cd_init_ai_for_ship");
    g_init_robots_for_level_d1 = caml_named_value("cd_init_robots_for_level_d1");
    g_init_robots_for_level_d2 = caml_named_value("cd_init_robots_for_level_d2");
    g_init_thief_for_level = caml_named_value("cd_init_thief_for_level");
    g_create_bfs_list = caml_named_value("cd_create_bfs_list");
    g_free_object_slots = caml_named_value("cd_free_object_slots");
    g_copy_defaults_to_robot = caml_named_value("cd_copy_defaults_to_robot");
    g_copy_defaults_to_robot_all = caml_named_value("cd_copy_defaults_to_robot_all");
    g_filter_objects_from_level = caml_named_value("cd_filter_objects_from_level");
    g_special_reset_objects = caml_named_value("cd_special_reset_objects");
    g_bash_to_shield = caml_named_value("cd_bash_to_shield");
    g_clear_stuck_objects = caml_named_value("cd_clear_stuck_objects");
    g_init_ammo_and_energy = caml_named_value("cd_init_ammo_and_energy");
    g_update_player_stats = caml_named_value("cd_update_player_stats");
    g_init_player_object = caml_named_value("cd_init_player_object");
    g_verify_console_object = caml_named_value("cd_verify_console_object");
    g_do_lock_doors = caml_named_value("cd_do_lock_doors");
    g_do_unlock_doors = caml_named_value("cd_do_unlock_doors");
    g_door_is_wall_switched = caml_named_value("cd_door_is_wall_switched");
    g_flag_wall_switched_doors = caml_named_value("cd_flag_wall_switched_doors");
    g_reset_walls = caml_named_value("cd_reset_walls");
    g_kill_stuck_objects = caml_named_value("cd_kill_stuck_objects");
    g_wall_illusion_off = caml_named_value("cd_wall_illusion_off");
    g_wall_illusion_on = caml_named_value("cd_wall_illusion_on");
    g_do_il_on = caml_named_value("cd_do_il_on");
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
    g_check_volatile_wall = caml_named_value("cd_check_volatile_wall");
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
    g_find_point_seg = caml_named_value("cd_find_point_seg");
    g_find_connected_distance = caml_named_value("cd_find_connected_distance");

    g_fuelcen_create = caml_named_value("cd_fuelcen_create");
    g_matcen_create = caml_named_value("cd_matcen_create");
    g_fuelcen_activate = caml_named_value("cd_fuelcen_activate");
    g_explode_wall = caml_named_value("cd_explode_wall");
    g_find_min_max = caml_named_value("cd_find_min_max");
    g_update_points = caml_named_value("cd_update_points");
    g_wake_up_rendered_objects = caml_named_value("cd_wake_up_rendered_objects");

    /* v2 callbacks (on-demand data fetching) — optional, checked separately */
    g_find_vector_intersection_v2 = caml_named_value("cd_find_vector_intersection_v2");
    g_object_intersects_wall_v2 = caml_named_value("cd_object_intersects_wall_v2");
    g_find_homing_object_complete_v2 = caml_named_value("cd_find_homing_object_complete_v2");
    g_find_homing_object_v2 = caml_named_value("cd_find_homing_object_v2");
    g_track_track_goal_v2 = caml_named_value("cd_track_track_goal_v2");
    g_player_is_visible_from_object_v2 = caml_named_value("cd_player_is_visible_from_object_v2");
    g_compute_vis_and_vec_v2 = caml_named_value("cd_compute_vis_and_vec_v2");

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
        || !g_apply_damage_to_robot_d1
        || !g_apply_damage_to_robot_d2
        || !g_physics_turn_towards_vector
        || !g_do_physics_sim_rot
        || !g_calc_gun_point
        || !g_phys_apply_force
        || !g_phys_apply_rot
        || !g_phys_apply_rot_d2
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
        || !g_init_ai_object_d1
        || !g_init_ai_object_d2
        || !g_add_awareness_event
        || !g_create_awareness_event
        || !g_init_ai_frame
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
        || !g_check_volatile_wall
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
        || !g_find_point_seg
        || !g_find_connected_distance
        || !g_do_controlcen_frame_d1
        || !g_do_controlcen_frame_d2
        || !g_init_controlcen_for_level
        || !g_do_ai_frame_d1
        || !g_do_ai_frame_d2
        || !g_init_ai_for_ship
        || !g_init_robots_for_level_d1
        || !g_init_robots_for_level_d2
        || !g_init_thief_for_level
        || !g_create_bfs_list
        || !g_bash_to_shield
        || !g_clear_stuck_objects
        || !g_copy_defaults_to_robot
        || !g_copy_defaults_to_robot_all
        || !g_filter_objects_from_level
        || !g_init_ammo_and_energy
        || !g_update_player_stats
        || !g_init_player_object
        || !g_verify_console_object
        || !g_do_lock_doors
        || !g_do_unlock_doors
        || !g_door_is_wall_switched
        || !g_flag_wall_switched_doors
        || !g_reset_walls
        || !g_kill_stuck_objects
        || !g_wall_illusion_off
        || !g_wall_illusion_on
        || !g_do_il_on
        || !g_do_physics_sim_d1
        || !g_do_physics_sim_d2
        || !g_find_min_max
        || !g_fuelcen_create
        || !g_matcen_create
        || !g_fuelcen_activate
        || !g_explode_wall)
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
           && g_find_point_seg
           && g_find_connected_distance
           && g_do_controlcen_frame_d1
           && g_do_controlcen_frame_d2
           && g_init_controlcen_for_level
           && g_do_ai_frame_d1
           && g_do_ai_frame_d2
           && g_init_ai_for_ship
           && g_init_robots_for_level_d1
           && g_init_robots_for_level_d2
           && g_do_physics_sim_d1
           && g_do_physics_sim_d2
           && g_find_min_max;
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

void cd_ox_phys_apply_rot_d2(
    int32_t fx, int32_t fy, int32_t fz,
    int32_t mass, int is_robot,
    int32_t fvx, int32_t fvy, int32_t fvz,
    int is_morph,
    int32_t crx, int32_t cry, int32_t crz,
    int is_thief, int is_attack_type,
    int skip_ai_count, int32_t frame_time, int p_rand,
    int32_t* out_rx, int32_t* out_ry, int32_t* out_rz,
    int* out_skip_ai_addval)
{
    cd_ox_require_ready("cd_ox_phys_apply_rot_d2");
    value args[17] = {
        Val_long(fx), Val_long(fy), Val_long(fz),
        Val_long(mass), Val_long(is_robot),
        Val_long(fvx), Val_long(fvy), Val_long(fvz),
        Val_long(is_morph),
        Val_long(crx), Val_long(cry), Val_long(crz),
        Val_long(is_thief), Val_long(is_attack_type),
        Val_long(skip_ai_count), Val_long(frame_time), Val_long(p_rand),
    };
    const value out = caml_callbackN(*g_phys_apply_rot_d2, 17, args);
    *out_rx = Int_val(Field(out, 0));
    *out_ry = Int_val(Field(out, 1));
    *out_rz = Int_val(Field(out, 2));
    *out_skip_ai_addval = Int_val(Field(out, 3));
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

void cd_ox_init_ai_object_d1(
    const int32_t* packed, int packed_len,
    int32_t* out_buf)
{
    cd_ox_require_ready("cd_ox_init_ai_object_d1");
    CAMLparam0();
    CAMLlocal1(arr);
    arr = caml_alloc(packed_len, 0);
    for (int i = 0; i < packed_len; i++)
        Store_field(arr, i, Val_long(packed[i]));
    const value result = caml_callback(*g_init_ai_object_d1, arr);
    for (int i = 0; i < 18; i++)
        out_buf[i] = Int_val(Field(result, i));
    CAMLreturn0;
}

void cd_ox_init_ai_object_d2(
    const int32_t* packed, int packed_len,
    int32_t* out_buf)
{
    cd_ox_require_ready("cd_ox_init_ai_object_d2");
    CAMLparam0();
    CAMLlocal1(arr);
    arr = caml_alloc(packed_len, 0);
    for (int i = 0; i < packed_len; i++)
        Store_field(arr, i, Val_long(packed[i]));
    const value result = caml_callback(*g_init_ai_object_d2, arr);
    for (int i = 0; i < 21; i++)
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

/* -- FVI on-demand data fetch callbacks -------------------------------- */

void cd_ox_register_fvi_data_callbacks(
    cd_fvi_fetch_segment_data_fn fetch_seg,
    cd_fvi_fetch_object_data_fn fetch_obj,
    cd_fvi_fetch_collision_table_fn fetch_ct)
{
    g_fvi_fetch_segment_data = fetch_seg;
    g_fvi_fetch_object_data = fetch_obj;
    g_fvi_fetch_collision_table = fetch_ct;
}

CAMLprim value cd_ox_fetch_segment_data(value v_segnum)
{
    CAMLparam1(v_segnum);
    CAMLlocal1(v_result);
    int segnum = Int_val(v_segnum);
    int32_t buf[87];
    memset(buf, 0, sizeof(buf));
    if (g_fvi_fetch_segment_data)
        g_fvi_fetch_segment_data(segnum, buf);
    v_result = caml_alloc(87, 0);
    for (int i = 0; i < 87; i++)
        Store_field(v_result, i, Val_long(buf[i]));
    CAMLreturn(v_result);
}

CAMLprim value cd_ox_fetch_object_data(value v_objnum)
{
    CAMLparam1(v_objnum);
    CAMLlocal1(v_result);
    int objnum = Int_val(v_objnum);
    int32_t buf[14];
    memset(buf, 0, sizeof(buf));
    if (g_fvi_fetch_object_data)
        g_fvi_fetch_object_data(objnum, buf);
    v_result = caml_alloc(14, 0);
    for (int i = 0; i < 14; i++)
        Store_field(v_result, i, Val_long(buf[i]));
    CAMLreturn(v_result);
}

CAMLprim value cd_ox_fetch_collision_table(value v_unit)
{
    CAMLparam1(v_unit);
    CAMLlocal1(v_result);
    int32_t buf[256];
    memset(buf, 0, sizeof(buf));
    if (g_fvi_fetch_collision_table)
        g_fvi_fetch_collision_table(buf);
    v_result = caml_alloc(256, 0);
    for (int i = 0; i < 256; i++)
        Store_field(v_result, i, Val_long(buf[i]));
    CAMLreturn(v_result);
}

/* -- FVI v2 functions (on-demand data via effects) -------------------- */

void cd_ox_find_vector_intersection_v2(const int32_t* header, int header_len,
                                        int32_t* out_buf, int* out_len)
{
    cd_ox_require_ready("cd_ox_find_vector_intersection_v2");
    if (!g_find_vector_intersection_v2) { *out_len = 0; return; }
    CAMLparam0();
    CAMLlocal2(arr, result);
    arr = caml_alloc(header_len, 0);
    for (int i = 0; i < header_len; i++)
        Store_field(arr, i, Val_long(header[i]));
    result = caml_callback_exn(*g_find_vector_intersection_v2, arr);
    if (Is_exception_result(result)) {
        fprintf(stderr, "OX_SHADOW: cd_ox_find_vector_intersection_v2 exception\n");
        *out_len = 0;
        CAMLreturn0;
    }
    int result_len = Wosize_val(result);
    *out_len = result_len;
    for (int i = 0; i < result_len; i++)
        out_buf[i] = Int_val(Field(result, i));
    CAMLreturn0;
}

int cd_ox_object_intersects_wall_v2(const int32_t* header, int header_len)
{
    cd_ox_require_ready("cd_ox_object_intersects_wall_v2");
    if (!g_object_intersects_wall_v2) return 0;
    CAMLparam0();
    CAMLlocal1(arr);
    arr = caml_alloc(header_len, 0);
    for (int i = 0; i < header_len; i++)
        Store_field(arr, i, Val_long(header[i]));
    value result = caml_callback_exn(*g_object_intersects_wall_v2, arr);
    if (Is_exception_result(result))
        CAMLreturnT(int, 0);
    CAMLreturnT(int, Int_val(result));
}

int cd_ox_find_homing_object_complete_v2(const int32_t* packed, int packed_len)
{
    cd_ox_require_ready("cd_ox_find_homing_object_complete_v2");
    if (!g_find_homing_object_complete_v2) return -1;
    CAMLparam0();
    CAMLlocal1(arr);
    arr = caml_alloc(packed_len, 0);
    for (int i = 0; i < packed_len; i++)
        Store_field(arr, i, Val_long(packed[i]));
    value result = caml_callback_exn(*g_find_homing_object_complete_v2, arr);
    if (Is_exception_result(result))
        CAMLreturnT(int, -1);
    CAMLreturnT(int, Int_val(result));
}

int cd_ox_find_homing_object_v2(const int32_t* packed, int packed_len)
{
    cd_ox_require_ready("cd_ox_find_homing_object_v2");
    if (!g_find_homing_object_v2) return -1;
    CAMLparam0();
    CAMLlocal1(arr);
    arr = caml_alloc(packed_len, 0);
    for (int i = 0; i < packed_len; i++)
        Store_field(arr, i, Val_long(packed[i]));
    value result = caml_callback_exn(*g_find_homing_object_v2, arr);
    if (Is_exception_result(result))
        CAMLreturnT(int, -1);
    CAMLreturnT(int, Int_val(result));
}

void cd_ox_track_track_goal_v2(const int32_t* packed, int packed_len,
                                int* out_result, int* out_dot)
{
    cd_ox_require_ready("cd_ox_track_track_goal_v2");
    if (!g_track_track_goal_v2) { *out_result = 0; *out_dot = 0; return; }
    CAMLparam0();
    CAMLlocal1(result);
    value arr = caml_alloc(packed_len, 0);
    for (int i = 0; i < packed_len; i++)
        Store_field(arr, i, Val_long(packed[i]));
    result = caml_callback_exn(*g_track_track_goal_v2, arr);
    if (Is_exception_result(result)) { *out_result = 0; *out_dot = 0; CAMLreturn0; }
    *out_result = Int_val(Field(result, 0));
    *out_dot = Int_val(Field(result, 1));
    CAMLreturn0;
}

void cd_ox_player_is_visible_from_object_v2(const int32_t* packed, int packed_len, int32_t* out)
{
    cd_ox_require_ready("cd_ox_player_is_visible_from_object_v2");
    if (!g_player_is_visible_from_object_v2) { for (int i=0;i<11;i++) out[i]=0; return; }
    CAMLparam0();
    CAMLlocal1(result);
    value arr = caml_alloc(packed_len, 0);
    for (int i = 0; i < packed_len; i++)
        Store_field(arr, i, Val_long(packed[i]));
    result = caml_callback_exn(*g_player_is_visible_from_object_v2, arr);
    if (Is_exception_result(result)) { for (int i=0;i<11;i++) out[i]=0; CAMLreturn0; }
    for (int i = 0; i < 11; i++)
        out[i] = Int_val(Field(result, i));
    CAMLreturn0;
}

void cd_ox_compute_vis_and_vec_v2(int32_t* packed, int packed_len, int32_t* out)
{
    cd_ox_require_ready("cd_ox_compute_vis_and_vec_v2");
    if (!g_compute_vis_and_vec_v2) { for (int i=0;i<28;i++) out[i]=0; return; }
    CAMLparam0();
    CAMLlocal1(result);
    value arr = caml_alloc(packed_len, 0);
    for (int i = 0; i < packed_len; i++)
        Store_field(arr, i, Val_long(packed[i]));
    result = caml_callback_exn(*g_compute_vis_and_vec_v2, arr);
    if (Is_exception_result(result)) { for (int i=0;i<28;i++) out[i]=0; CAMLreturn0; }
    for (int i = 0; i < 28; i++)
        out[i] = Int_val(Field(result, i));
    CAMLreturn0;
}

/* player_is_visible_from_object: returns 11-element result via out array.
   out[0]=result(0/1/2), out[1..3]=pos, out[4]=need_move_center, out[5]=sub_flags,
   out[6]=hit_type, out[7..9]=hit_pos, out[10]=hit_seg */

/* compute_vis_and_vec: returns 28-element result via out array.
   Packed layout: FVI format + pv_ext(20) + cvv_ext(19).
   The packed array is mutable (OCaml modifies vec_to_player in pv_ext). */

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

int cd_ox_p_order_list(const uint8_t* order, int num)
{
    cd_ox_require_ready("cd_ox_p_order_list");
    value args[12] = {
        Val_int(order[0]), Val_int(order[1]), Val_int(order[2]),
        Val_int(order[3]), Val_int(order[4]), Val_int(order[5]),
        Val_int(order[6]), Val_int(order[7]), Val_int(order[8]),
        Val_int(order[9]), Val_int(order[10]), Val_int(num)
    };
    return Int_val(caml_callbackN(*g_p_order_list, 12, args));
}

int cd_ox_s_order_list(const uint8_t* order, int num)
{
    cd_ox_require_ready("cd_ox_s_order_list");
    value args[12] = {
        Val_int(order[0]), Val_int(order[1]), Val_int(order[2]),
        Val_int(order[3]), Val_int(order[4]), Val_int(order[5]),
        Val_int(order[6]), Val_int(order[7]), Val_int(order[8]),
        Val_int(order[9]), Val_int(order[10]), Val_int(num)
    };
    return Int_val(caml_callbackN(*g_s_order_list, 12, args));
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
    cd_effect_af_invalidate_escort_goal_fn invalidate_escort_goal,
    cd_effect_af_laser_create_new_easy_fn laser_create_new_easy,
    cd_effect_af_do_companion_extras_fn do_companion_extras,
    cd_effect_af_do_thief_extras_fn do_thief_extras)
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
    g_effect_af_invalidate_escort_goal_af = invalidate_escort_goal;
    g_effect_af_laser_create_new_easy = laser_create_new_easy;
    g_effect_af_do_companion_extras = do_companion_extras;
    g_effect_af_do_thief_extras = do_thief_extras;
}

void cd_ox_register_read_path_state(cd_effect_af_read_path_state_fn fn)
{
    g_read_path_state = fn;
}

CAMLprim value cd_ox_read_af_path_state(value unit)
{
    CAMLparam1(unit);
    CAMLlocal1(v_result);
    int32_t buf[12];
    memset(buf, 0, sizeof(buf));
    if (g_read_path_state)
        g_read_path_state(buf);
    v_result = caml_alloc(12, 0);
    for (int i = 0; i < 12; i++)
        Store_field(v_result, i, Val_long(buf[i]));
    CAMLreturn(v_result);
}

void cd_ox_register_read_fire_state(cd_effect_af_read_fire_state_fn fn)
{
    g_read_fire_state = fn;
}

CAMLprim value cd_ox_read_af_fire_state(value unit)
{
    CAMLparam1(unit);
    CAMLlocal1(v_result);
    int32_t buf[3];
    memset(buf, 0, sizeof(buf));
    if (g_read_fire_state)
        g_read_fire_state(buf);
    v_result = caml_alloc(3, 0);
    for (int i = 0; i < 3; i++)
        Store_field(v_result, i, Val_long(buf[i]));
    CAMLreturn(v_result);
}

void cd_ox_register_write_fire_timers(void (*fn)(int32_t, int32_t))
{
    g_write_fire_timers = fn;
}

CAMLprim value cd_ox_write_af_fire_timers(value v_nf, value v_nf2)
{
    if (g_write_fire_timers)
        g_write_fire_timers(Int_val(v_nf), Int_val(v_nf2));
    return Val_unit;
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
    int new_mode = 0;
    if (g_effect_af_do_escort_frame)
        new_mode = g_effect_af_do_escort_frame(Int_val(v_dist), Int_val(v_vis));
    return Val_int(new_mode);
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

CAMLprim value cd_ox_effect_af_openable_doors_in_segment(value unit)
{
    (void)unit;
    int result = -1;
    if (g_effect_af_openable_doors_in_segment)
        result = g_effect_af_openable_doors_in_segment();
    return Val_long(result);
}

void cd_ox_register_af_openable_doors(int (*fn)(void))
{
    g_effect_af_openable_doors_in_segment = fn;
}

/* -- Pathfinding callbacks ------------------------------------------------ */

void cd_ox_register_path_callbacks(
    cd_fetch_wall_data_fn fetch_wall_data,
    cd_path_fvi_query_fn path_fvi_query,
    cd_path_obj_relink_fn path_obj_relink,
    cd_path_find_object_seg_fn path_find_object_seg)
{
    g_fetch_wall_data = fetch_wall_data;
    g_path_fvi_query = path_fvi_query;
    g_path_obj_relink = path_obj_relink;
    g_path_find_object_seg = path_find_object_seg;
}

CAMLprim value cd_ox_fetch_wall_data(value v_segnum, value v_sidenum)
{
    CAMLparam2(v_segnum, v_sidenum);
    CAMLlocal1(v_result);
    int32_t buf[8];
    memset(buf, 0, sizeof(buf));
    buf[0] = -1;  /* wall_num = -1 (no wall) by default */
    buf[1] = -1;  /* wall_type */
    if (g_fetch_wall_data)
        g_fetch_wall_data(Int_val(v_segnum), Int_val(v_sidenum), buf);
    v_result = caml_alloc(8, 0);
    for (int i = 0; i < 8; i++)
        Store_field(v_result, i, Val_long(buf[i]));
    CAMLreturn(v_result);
}

CAMLprim value cd_ox_path_fvi_query(value v_params)
{
    CAMLparam1(v_params);
    CAMLlocal1(v_result);
    int32_t params[9];
    for (int i = 0; i < 9; i++)
        params[i] = Int_val(Field(v_params, i));
    int32_t out[5];
    memset(out, 0, sizeof(out));
    if (g_path_fvi_query)
        g_path_fvi_query(params, out);
    v_result = caml_alloc(5, 0);
    for (int i = 0; i < 5; i++)
        Store_field(v_result, i, Val_long(out[i]));
    CAMLreturn(v_result);
}

CAMLprim value cd_ox_path_obj_relink(value v_params)
{
    CAMLparam1(v_params);
    if (g_path_obj_relink)
        g_path_obj_relink(
            Int_val(Field(v_params, 0)),   /* objnum */
            Int_val(Field(v_params, 1)),   /* x */
            Int_val(Field(v_params, 2)),   /* y */
            Int_val(Field(v_params, 3)),   /* z */
            Int_val(Field(v_params, 4))); /* segnum */
    CAMLreturn(Val_unit);
}

CAMLprim value cd_ox_path_find_object_seg(value v_x, value v_y, value v_z)
{
    int result = -1;
    if (g_path_find_object_seg)
        result = g_path_find_object_seg(Int_val(v_x), Int_val(v_y), Int_val(v_z));
    return Val_int(result);
}

CAMLprim value cd_ox_effect_af_invalidate_escort_goal(value unit)
{
    (void)unit;
    if (g_effect_af_invalidate_escort_goal_af)
        g_effect_af_invalidate_escort_goal_af();
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

CAMLprim value cd_ox_effect_af_do_companion_extras(
    value v_dist, value v_vis, value v_vtpx, value v_vtpy, value v_vtpz, value v_mode)
{
    int result = 0;
    if (g_effect_af_do_companion_extras)
        result = g_effect_af_do_companion_extras(
            Int_val(v_dist), Int_val(v_vis),
            Int_val(v_vtpx), Int_val(v_vtpy), Int_val(v_vtpz),
            Int_val(v_mode));
    return Val_int(result);
}

CAMLprim value cd_ox_effect_af_do_companion_extras_bytecode(value* argv, int argn)
{
    (void)argn;
    return cd_ox_effect_af_do_companion_extras(
        argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLprim value cd_ox_effect_af_do_thief_extras(
    value v_dist, value v_vis, value v_vtpx, value v_vtpy, value v_vtpz)
{
    int result = 0;
    if (g_effect_af_do_thief_extras)
        result = g_effect_af_do_thief_extras(
            Int_val(v_dist), Int_val(v_vis),
            Int_val(v_vtpx), Int_val(v_vtpy), Int_val(v_vtpz));
    return Val_int(result);
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
    int32_t velocity_x, int32_t velocity_y, int32_t velocity_z,
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

    value args[35] = {
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
        Val_long(velocity_x), Val_long(velocity_y), Val_long(velocity_z)
    };
    v_result = caml_callbackN(*g_do_ai_frame_d1, 35, args);

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
    int32_t console_segnum,
    int32_t velocity_x, int32_t velocity_y, int32_t velocity_z,
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

    value args[46] = {
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
        Val_long(seg_station_enabled),
        Val_long(console_segnum),
        Val_long(velocity_x), Val_long(velocity_y), Val_long(velocity_z)
    };
    v_result = caml_callbackN(*g_do_ai_frame_d2, 46, args);

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
    cd_effect_ps_fetch_doorway_info_fn fetch_doorway_info,
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
    g_effect_ps_fetch_doorway_info = fetch_doorway_info;
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

CAMLprim value cd_ox_effect_ps_fetch_doorway_info(value v_seg, value v_side)
{
    CAMLparam2(v_seg, v_side);
    CAMLlocal1(v_result);
    int32_t buf[6];
    memset(buf, 0, sizeof(buf));
    buf[0] = -1;  /* children_side = -1 (no child) by default */
    buf[1] = -1;  /* wall_num = -1 (no wall) by default */
    if (g_effect_ps_fetch_doorway_info)
        g_effect_ps_fetch_doorway_info(Int_val(v_seg), Int_val(v_side), buf);
    v_result = caml_alloc(6, 0);
    for (int i = 0; i < 6; i++)
        Store_field(v_result, i, Val_long(buf[i]));
    CAMLreturn(v_result);
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

/* init_ai_for_ship: called each time the player starts a new ship */
void cd_ox_init_ai_for_ship(
    int32_t game_time, int32_t segnum,
    int32_t pos_x, int32_t pos_y, int32_t pos_z,
    int32_t* result)
{
    cd_ox_require_ready("cd_ox_init_ai_for_ship");
    CAMLparam0();
    CAMLlocal1(v_result);

    value args[5] = {
        Val_long(game_time), Val_long(segnum),
        Val_long(pos_x), Val_long(pos_y), Val_long(pos_z)
    };
    v_result = caml_callbackN(*g_init_ai_for_ship, 5, args);

    int result_len = Wosize_val(v_result);
    for (int i = 0; i < result_len && i < 40; i++)
        result[i] = Int_val(Field(v_result, i));
    CAMLreturn0;
}

/* init_robots_for_level D1: no inputs, returns 1-element array [overall_agitation] */
void cd_ox_init_robots_for_level_d1(int32_t* result)
{
    cd_ox_require_ready("cd_ox_init_robots_for_level_d1");
    CAMLparam0();
    CAMLlocal1(v_result);

    v_result = caml_callback(*g_init_robots_for_level_d1, Val_unit);

    int result_len = Wosize_val(v_result);
    for (int i = 0; i < result_len && i < 1; i++)
        result[i] = Int_val(Field(v_result, i));
    CAMLreturn0;
}

/* init_robots_for_level D2: takes difficulty_level, returns 6-element array */
void cd_ox_init_robots_for_level_d2(int difficulty_level, int32_t* result)
{
    cd_ox_require_ready("cd_ox_init_robots_for_level_d2");
    CAMLparam0();
    CAMLlocal1(v_result);

    v_result = caml_callback(*g_init_robots_for_level_d2, Val_long(difficulty_level));

    int result_len = Wosize_val(v_result);
    for (int i = 0; i < result_len && i < 6; i++)
        result[i] = Int_val(Field(v_result, i));
    CAMLreturn0;
}

/* -- init_thief_for_level bridge (D2 only) ----------------------------- */
void cd_ox_init_thief_for_level(int game_mode, int32_t* result)
{
    cd_ox_require_ready("cd_ox_init_thief_for_level");
    CAMLparam0();
    CAMLlocal1(v_result);

    v_result = caml_callback(*g_init_thief_for_level, Val_long(game_mode));

    int result_len = Wosize_val(v_result);
    for (int i = 0; i < result_len && i < 11; i++)
        result[i] = Int_val(Field(v_result, i));
    CAMLreturn0;
}

/* -- create_bfs_list bridge (D2 only) ---------------------------------- */
/* Returns length via return value, fills bfs_list with segment numbers.
   buddy_ailp_mode and player_flags are needed for segment_is_reachable
   (called with NULL objp in C). */
int cd_ox_create_bfs_list(int start_seg, int max_segs, int buddy_ailp_mode,
                          int player_flags, short* bfs_list)
{
    cd_ox_require_ready("cd_ox_create_bfs_list");
    CAMLparam0();
    CAMLlocal1(v_result);

    value args[4] = {
        Val_long(start_seg),
        Val_long(max_segs),
        Val_long(buddy_ailp_mode),
        Val_long(player_flags),
    };
    v_result = caml_callbackN(*g_create_bfs_list, 4, args);

    int length = Int_val(Field(v_result, 0));
    for (int i = 0; i < length; i++)
        bfs_list[i] = (short)Int_val(Field(v_result, i + 1));
    CAMLreturnT(int, length);
}

/* Stub: fetch danger laser object data (returns 12-element zero array until properly wired) */
CAMLprim value cd_ox_effect_af_fetch_danger_laser_data(value v_objnum)
{
    CAMLparam1(v_objnum);
    CAMLlocal1(v_result);
    (void)v_objnum;
    v_result = caml_alloc(12, 0);
    for (int i = 0; i < 12; i++)
        Store_field(v_result, i, Val_long(0));
    CAMLreturn(v_result);
}

/* -- Gameseq: bash_to_shield ------------------------------------------ */

void cd_ox_register_gameseq_effects(
    cd_effect_gs_fetch_bash_to_shield_data_fn fetch_bash_data,
    cd_effect_gs_write_bash_to_shield_fn write_bash_data)
{
    g_effect_gs_fetch_bash_to_shield_data = fetch_bash_data;
    g_effect_gs_write_bash_to_shield = write_bash_data;
}

void cd_ox_register_stuck_objects_effects(
    cd_effect_gs_fetch_stuck_objects_data_fn fetch_stuck_data,
    cd_effect_gs_write_clear_stuck_objects_fn write_clear_stuck)
{
    g_effect_gs_fetch_stuck_objects_data = fetch_stuck_data;
    g_effect_gs_write_clear_stuck_objects = write_clear_stuck;
}

CAMLprim value cd_ox_effect_gs_fetch_bash_to_shield_data(value v_objnum)
{
    CAMLparam1(v_objnum);
    CAMLlocal1(v_result);

    int objnum = Long_val(v_objnum);
    int32_t out[3] = {0, 0, 0};
    if (g_effect_gs_fetch_bash_to_shield_data)
        g_effect_gs_fetch_bash_to_shield_data(objnum, out);

    v_result = caml_alloc(3, 0);
    for (int i = 0; i < 3; i++)
        Store_field(v_result, i, Val_long(out[i]));
    CAMLreturn(v_result);
}

CAMLprim value cd_ox_effect_gs_write_bash_to_shield(value v_packed)
{
    CAMLparam1(v_packed);

    if (g_effect_gs_write_bash_to_shield) {
        int len = Wosize_val(v_packed);
        int32_t buf[8];
        if (len > 8) len = 8;
        for (int i = 0; i < len; i++)
            buf[i] = (int32_t)Long_val(Field(v_packed, i));
        g_effect_gs_write_bash_to_shield(buf, len);
    }
    CAMLreturn(Val_unit);
}

/* cd_ox_bash_to_shield: C entry point that calls into OCaml */
void cd_ox_bash_to_shield(int objnum)
{
    cd_ox_require_ready("cd_ox_bash_to_shield");
    CAMLparam0();

    caml_callback(*g_bash_to_shield, Val_long(objnum));

    CAMLreturn0;
}

/* -- Gameseq: clear_stuck_objects --------------------------------------- */

/* MAX_STUCK_OBJECTS = 32, data layout: [num_stuck, (wallnum, objnum, obj_type, obj_id) x 32] = 129 ints */
#define GS_STUCK_DATA_LEN (1 + 32 * 4)

CAMLprim value cd_ox_effect_gs_fetch_stuck_objects_data(value v_unit)
{
    CAMLparam1(v_unit);
    CAMLlocal1(v_result);

    int32_t out[GS_STUCK_DATA_LEN];
    int out_len = GS_STUCK_DATA_LEN;
    memset(out, 0, sizeof(out));
    if (g_effect_gs_fetch_stuck_objects_data)
        g_effect_gs_fetch_stuck_objects_data(out, &out_len);

    v_result = caml_alloc(GS_STUCK_DATA_LEN, 0);
    for (int i = 0; i < GS_STUCK_DATA_LEN; i++)
        Store_field(v_result, i, Val_long(out[i]));
    CAMLreturn(v_result);
}

CAMLprim value cd_ox_effect_gs_write_clear_stuck_objects(value v_packed)
{
    CAMLparam1(v_packed);

    if (g_effect_gs_write_clear_stuck_objects) {
        int len = Wosize_val(v_packed);
        int32_t buf[64];
        if (len > 64) len = 64;
        for (int i = 0; i < len; i++)
            buf[i] = (int32_t)Long_val(Field(v_packed, i));
        g_effect_gs_write_clear_stuck_objects(buf, len);
    }
    CAMLreturn(Val_unit);
}

/* cd_ox_clear_stuck_objects: C entry point that calls into OCaml */
void cd_ox_clear_stuck_objects(void)
{
    cd_ox_require_ready("cd_ox_clear_stuck_objects");
    CAMLparam0();

    caml_callback(*g_clear_stuck_objects, Val_unit);

    CAMLreturn0;
}

/* -- filter_objects_from_level ------------------------------------------- */

/* Data layout: [highest_object_index, type_0, id_0, type_1, id_1, ...]
   Max 350 objects → max 1 + 350*2 = 701 ints */
#define GS_FILTER_DATA_MAX_LEN (1 + 350 * 2)

void cd_ox_register_filter_objects_effects(
    cd_effect_gs_fetch_filter_objects_data_fn fetch_data)
{
    g_effect_gs_fetch_filter_objects_data = fetch_data;
}

CAMLprim value cd_ox_effect_gs_fetch_filter_objects_data(value v_unit)
{
    CAMLparam1(v_unit);
    CAMLlocal1(v_result);

    int32_t out[GS_FILTER_DATA_MAX_LEN];
    int out_len = GS_FILTER_DATA_MAX_LEN;
    memset(out, 0, sizeof(out));
    if (g_effect_gs_fetch_filter_objects_data)
        g_effect_gs_fetch_filter_objects_data(out, &out_len);

    v_result = caml_alloc(out_len, 0);
    for (int i = 0; i < out_len; i++)
        Store_field(v_result, i, Val_long(out[i]));
    CAMLreturn(v_result);
}

/* cd_ox_filter_objects_from_level: C entry point that calls into OCaml */
void cd_ox_filter_objects_from_level(void)
{
    cd_ox_require_ready("cd_ox_filter_objects_from_level");
    CAMLparam0();

    caml_callback(*g_filter_objects_from_level, Val_unit);

    CAMLreturn0;
}

/* -- copy_defaults_to_robot: effect registration --------------------------- */

void cd_ox_register_copy_defaults_to_robot_effects(
    cd_effect_gs_fetch_copy_defaults_to_robot_data_fn fetch_data,
    cd_effect_gs_write_copy_defaults_to_robot_fn write_data)
{
    g_effect_gs_fetch_copy_defaults_to_robot_data = fetch_data;
    g_effect_gs_write_copy_defaults_to_robot = write_data;
}

/* Fetch copy_defaults_to_robot data: returns 10 ints
   [obj_type, obj_id, n_robot_types, strength, is_thief, is_companion,
    boss_flag, current_level_num, difficulty_level, is_d2] */
#define GS_CDTR_DATA_LEN 10

CAMLprim value cd_ox_effect_gs_fetch_copy_defaults_to_robot_data(value v_objnum)
{
    CAMLparam1(v_objnum);
    CAMLlocal1(v_result);

    int objnum = Long_val(v_objnum);
    int32_t out[GS_CDTR_DATA_LEN];
    memset(out, 0, sizeof(out));
    if (g_effect_gs_fetch_copy_defaults_to_robot_data)
        g_effect_gs_fetch_copy_defaults_to_robot_data(objnum, out);

    v_result = caml_alloc(GS_CDTR_DATA_LEN, 0);
    for (int i = 0; i < GS_CDTR_DATA_LEN; i++)
        Store_field(v_result, i, Val_long(out[i]));
    CAMLreturn(v_result);
}

CAMLprim value cd_ox_effect_gs_write_copy_defaults_to_robot(value v_packed)
{
    CAMLparam1(v_packed);

    if (g_effect_gs_write_copy_defaults_to_robot) {
        int len = Wosize_val(v_packed);
        int32_t buf[4];
        if (len > 4) len = 4;
        for (int i = 0; i < len; i++)
            buf[i] = (int32_t)Long_val(Field(v_packed, i));
        g_effect_gs_write_copy_defaults_to_robot(buf, len);
    }
    CAMLreturn(Val_unit);
}

/* cd_ox_copy_defaults_to_robot: C entry point that calls into OCaml */
void cd_ox_copy_defaults_to_robot(int objnum)
{
    cd_ox_require_ready("cd_ox_copy_defaults_to_robot");
    CAMLparam0();

    caml_callback(*g_copy_defaults_to_robot, Val_long(objnum));

    CAMLreturn0;
}

/* cd_ox_copy_defaults_to_robot_all: C entry point that calls into OCaml */
void cd_ox_copy_defaults_to_robot_all(void)
{
    cd_ox_require_ready("cd_ox_copy_defaults_to_robot_all");
    CAMLparam0();

    caml_callback(*g_copy_defaults_to_robot_all, Val_unit);

    CAMLreturn0;
}

/* -- init_ammo_and_energy: effect registration ----------------------------- */

void cd_ox_register_init_ammo_energy_effects(
    cd_effect_gs_fetch_init_ammo_energy_data_fn fetch_data,
    cd_effect_gs_write_init_ammo_energy_fn write_data)
{
    g_effect_gs_fetch_init_ammo_energy_data = fetch_data;
    g_effect_gs_write_init_ammo_energy = write_data;
}

/* -- init_ammo_and_energy: effect externals -------------------------------- */

CAMLprim value cd_ox_effect_gs_fetch_init_ammo_energy_data(value v_unit)
{
    CAMLparam1(v_unit);
    CAMLlocal1(v_result);

    int32_t out[7] = {0, 0, 0, 0, 0, 0, 0};
    if (g_effect_gs_fetch_init_ammo_energy_data)
        g_effect_gs_fetch_init_ammo_energy_data(out);

    v_result = caml_alloc(7, 0);
    for (int i = 0; i < 7; i++)
        Store_field(v_result, i, Val_long(out[i]));

    CAMLreturn(v_result);
}

CAMLprim value cd_ox_effect_gs_write_init_ammo_energy(value v_packed)
{
    CAMLparam1(v_packed);

    if (g_effect_gs_write_init_ammo_energy) {
        int len = Wosize_val(v_packed);
        int32_t buf[3];
        if (len > 3) len = 3;
        for (int i = 0; i < len; i++)
            buf[i] = (int32_t)Long_val(Field(v_packed, i));
        g_effect_gs_write_init_ammo_energy(buf, len);
    }
    CAMLreturn(Val_unit);
}

/* cd_ox_init_ammo_and_energy: C entry point that calls into OCaml */
void cd_ox_init_ammo_and_energy(void)
{
    cd_ox_require_ready("cd_ox_init_ammo_and_energy");
    CAMLparam0();

    caml_callback(*g_init_ammo_and_energy, Val_unit);

    CAMLreturn0;
}

/* -- update_player_stats: effect registration ------------------------------ */

void cd_ox_register_update_player_stats_effects(
    cd_effect_gs_fetch_update_player_stats_data_fn fetch_data,
    cd_effect_gs_write_update_player_stats_fn write_data)
{
    g_effect_gs_fetch_update_player_stats_data = fetch_data;
    g_effect_gs_write_update_player_stats = write_data;
}

/* -- update_player_stats: effect externals --------------------------------- */

CAMLprim value cd_ox_effect_gs_fetch_update_player_stats_data(value v_unit)
{
    CAMLparam1(v_unit);
    CAMLlocal1(v_result);

    int32_t out[5] = {0, 0, 0, 0, 0};
    if (g_effect_gs_fetch_update_player_stats_data)
        g_effect_gs_fetch_update_player_stats_data(out);

    v_result = caml_alloc(5, 0);
    for (int i = 0; i < 5; i++)
        Store_field(v_result, i, Val_long(out[i]));
    CAMLreturn(v_result);
}

CAMLprim value cd_ox_effect_gs_write_update_player_stats(value v_packed)
{
    CAMLparam1(v_packed);

    if (g_effect_gs_write_update_player_stats) {
        int len = Wosize_val(v_packed);
        int32_t buf[4];
        if (len > 4) len = 4;
        for (int i = 0; i < len; i++)
            buf[i] = (int32_t)Long_val(Field(v_packed, i));
        g_effect_gs_write_update_player_stats(buf, len);
    }
    CAMLreturn(Val_unit);
}

/* cd_ox_update_player_stats: C entry point that calls into OCaml */
void cd_ox_update_player_stats(void)
{
    cd_ox_require_ready("cd_ox_update_player_stats");
    CAMLparam0();

    caml_callback(*g_update_player_stats, Val_unit);

    CAMLreturn0;
}

/* -- special_reset_objects: effect registration ----------------------------- */

void cd_ox_register_special_reset_objects_effects(
    cd_effect_gs_fetch_special_reset_objects_data_fn fetch_data,
    cd_effect_gs_write_special_reset_objects_fn write_data)
{
    g_effect_gs_fetch_special_reset_objects_data = fetch_data;
    g_effect_gs_write_special_reset_objects = write_data;
}

/* -- special_reset_objects: effect externals -------------------------------- */

/* MAX_OBJECTS = 350 */
#define GS_SRO_DATA_LEN 350

CAMLprim value cd_ox_effect_gs_fetch_special_reset_objects_data(value v_unit)
{
    CAMLparam1(v_unit);
    CAMLlocal1(v_result);

    int32_t out[GS_SRO_DATA_LEN];
    memset(out, 0, sizeof(out));
    if (g_effect_gs_fetch_special_reset_objects_data)
        g_effect_gs_fetch_special_reset_objects_data(out);

    v_result = caml_alloc(GS_SRO_DATA_LEN, 0);
    for (int i = 0; i < GS_SRO_DATA_LEN; i++)
        Store_field(v_result, i, Val_long(out[i]));
    CAMLreturn(v_result);
}

CAMLprim value cd_ox_effect_gs_write_special_reset_objects(value v_packed)
{
    CAMLparam1(v_packed);

    if (g_effect_gs_write_special_reset_objects) {
        int len = Wosize_val(v_packed);
        /* Max: 2 + 350 = 352 */
        int32_t buf[352];
        if (len > 352) len = 352;
        for (int i = 0; i < len; i++)
            buf[i] = (int32_t)Long_val(Field(v_packed, i));
        g_effect_gs_write_special_reset_objects(buf, len);
    }
    CAMLreturn(Val_unit);
}

/* cd_ox_special_reset_objects: C entry point that calls into OCaml */
void cd_ox_special_reset_objects(void)
{
    cd_ox_require_ready("cd_ox_special_reset_objects");
    CAMLparam0();

    caml_callback(*g_special_reset_objects, Val_unit);

    CAMLreturn0;
}

/* -- verify_console_object: effect registration ----------------------------- */

void cd_ox_register_verify_console_object_effects(
    cd_effect_gs_fetch_verify_console_object_data_fn fetch_data,
    cd_effect_gs_write_verify_console_object_fn write_data)
{
    g_effect_gs_fetch_verify_console_object_data = fetch_data;
    g_effect_gs_write_verify_console_object = write_data;
}

/* Fetch verify_console_object data: returns [Player_num, objnum, obj_type, obj_id] */
CAMLprim value cd_ox_effect_gs_fetch_verify_console_object_data(value v_unit)
{
    CAMLparam1(v_unit);
    CAMLlocal1(v_result);

    int32_t out[4] = {0, 0, 0, 0};
    if (g_effect_gs_fetch_verify_console_object_data)
        g_effect_gs_fetch_verify_console_object_data(out);

    v_result = caml_alloc(4, 0);
    for (int i = 0; i < 4; i++)
        Store_field(v_result, i, Val_long(out[i]));
    CAMLreturn(v_result);
}

/* Write verify_console_object: set ConsoleObject = &Objects[objnum] */
CAMLprim value cd_ox_effect_gs_write_verify_console_object(value v_objnum)
{
    CAMLparam1(v_objnum);

    if (g_effect_gs_write_verify_console_object) {
        int objnum = Long_val(v_objnum);
        g_effect_gs_write_verify_console_object(objnum);
    }
    CAMLreturn(Val_unit);
}

/* cd_ox_verify_console_object: C entry point that calls into OCaml */
void cd_ox_verify_console_object(void)
{
    cd_ox_require_ready("cd_ox_verify_console_object");
    CAMLparam0();

    caml_callback(*g_verify_console_object, Val_unit);

    CAMLreturn0;
}

/* -- init_player_object: effect registration -------------------------------- */

void cd_ox_register_init_player_object_effects(
    cd_effect_gs_fetch_init_player_object_data_fn fetch_data,
    cd_effect_gs_write_init_player_object_fn write_data)
{
    g_effect_gs_fetch_init_player_object_data = fetch_data;
    g_effect_gs_write_init_player_object = write_data;
}

/* Fetch init_player_object data: returns [Player_num] */
CAMLprim value cd_ox_effect_gs_fetch_init_player_object_data(value v_unit)
{
    CAMLparam1(v_unit);
    CAMLlocal1(v_result);

    int32_t out[1] = {0};
    if (g_effect_gs_fetch_init_player_object_data)
        g_effect_gs_fetch_init_player_object_data(out);

    v_result = caml_alloc(1, 0);
    Store_field(v_result, 0, Val_long(out[0]));
    CAMLreturn(v_result);
}

/* Write init_player_object: apply player/object mutations */
CAMLprim value cd_ox_effect_gs_write_init_player_object(value v_packed)
{
    CAMLparam1(v_packed);

    if (g_effect_gs_write_init_player_object) {
        int len = Wosize_val(v_packed);
        int32_t packed[4];
        for (int i = 0; i < len && i < 4; i++)
            packed[i] = Long_val(Field(v_packed, i));
        g_effect_gs_write_init_player_object(packed, len);
    }
    CAMLreturn(Val_unit);
}

/* cd_ox_init_player_object: C entry point that calls into OCaml */
void cd_ox_init_player_object(void)
{
    cd_ox_require_ready("cd_ox_init_player_object");
    CAMLparam0();

    caml_callback(*g_init_player_object, Val_unit);

    CAMLreturn0;
}

/* -- Switch: effect registration ---------------------------------------- */

void cd_ox_register_switch_effects(
    cd_effect_sw_fetch_trigger_links_fn fetch_links,
    cd_effect_sw_lock_wall_door_fn lock_door,
    cd_effect_sw_unlock_wall_door_fn unlock_door,
    cd_effect_sw_get_num_triggers_fn get_num_triggers,
    cd_effect_sw_get_num_walls_fn get_num_walls,
    cd_effect_sw_set_wall_flag_wall_switch_fn set_wall_flag)
{
    g_effect_sw_fetch_trigger_links = fetch_links;
    g_effect_sw_lock_wall_door = lock_door;
    g_effect_sw_unlock_wall_door = unlock_door;
    g_effect_sw_get_num_triggers = get_num_triggers;
    g_effect_sw_get_num_walls = get_num_walls;
    g_effect_sw_set_wall_flag_wall_switch = set_wall_flag;
}

void cd_ox_register_switch_seg_side_effect(
    cd_effect_sw_fetch_trigger_seg_sides_fn fetch_seg_sides)
{
    g_effect_sw_fetch_trigger_seg_sides = fetch_seg_sides;
}

/* -- Switch: effect externals ------------------------------------------- */

/* Fetch trigger links: returns [num_links, wallnum0, wallnum1, ...] */
CAMLprim value cd_ox_effect_sw_fetch_trigger_links(value v_trigger_num)
{
    CAMLparam1(v_trigger_num);
    CAMLlocal1(v_result);
    int trigger_num = Long_val(v_trigger_num);

    /* MAX_WALLS_PER_LINK = 10, so max output is 1 + 10 = 11 ints */
    int32_t buf[11];
    int len = 0;
    if (g_effect_sw_fetch_trigger_links) {
        g_effect_sw_fetch_trigger_links(trigger_num, buf, &len);
    }
    v_result = caml_alloc(len, 0);
    for (int i = 0; i < len; i++)
        Store_field(v_result, i, Val_long(buf[i]));
    CAMLreturn(v_result);
}

/* Lock a wall door: sets WALL_DOOR_LOCKED flag */
CAMLprim value cd_ox_effect_sw_lock_wall_door(value v_wall_num)
{
    CAMLparam1(v_wall_num);
    int wall_num = Long_val(v_wall_num);
    if (g_effect_sw_lock_wall_door)
        g_effect_sw_lock_wall_door(wall_num);
    CAMLreturn(Val_unit);
}

/* Unlock a wall door: clears WALL_DOOR_LOCKED, sets keys=KEY_NONE */
CAMLprim value cd_ox_effect_sw_unlock_wall_door(value v_wall_num)
{
    CAMLparam1(v_wall_num);
    int wall_num = Long_val(v_wall_num);
    if (g_effect_sw_unlock_wall_door)
        g_effect_sw_unlock_wall_door(wall_num);
    CAMLreturn(Val_unit);
}

/* Get number of triggers */
CAMLprim value cd_ox_effect_sw_get_num_triggers(value v_unit)
{
    CAMLparam1(v_unit);
    int n = 0;
    if (g_effect_sw_get_num_triggers)
        n = g_effect_sw_get_num_triggers();
    CAMLreturn(Val_long(n));
}

/* Get number of walls */
CAMLprim value cd_ox_effect_sw_get_num_walls(value v_unit)
{
    CAMLparam1(v_unit);
    int n = 0;
    if (g_effect_sw_get_num_walls)
        n = g_effect_sw_get_num_walls();
    CAMLreturn(Val_long(n));
}

/* Set WALL_WALL_SWITCH flag on a wall */
CAMLprim value cd_ox_effect_sw_set_wall_flag_wall_switch(value v_wall_num)
{
    CAMLparam1(v_wall_num);
    int wall_num = Long_val(v_wall_num);
    if (g_effect_sw_set_wall_flag_wall_switch)
        g_effect_sw_set_wall_flag_wall_switch(wall_num);
    CAMLreturn(Val_unit);
}

/* Fetch trigger seg/side pairs: returns [num_links, seg0, side0, seg1, side1, ...] */
CAMLprim value cd_ox_effect_sw_fetch_trigger_seg_sides(value v_trigger_num)
{
    CAMLparam1(v_trigger_num);
    CAMLlocal1(v_result);
    int trigger_num = Long_val(v_trigger_num);

    /* MAX_WALLS_PER_LINK = 10, so max output is 1 + 10*2 = 21 ints */
    int32_t buf[21];
    int len = 0;
    if (g_effect_sw_fetch_trigger_seg_sides) {
        g_effect_sw_fetch_trigger_seg_sides(trigger_num, buf, &len);
    }
    v_result = caml_alloc(len, 0);
    for (int i = 0; i < len; i++)
        Store_field(v_result, i, Val_long(buf[i]));
    CAMLreturn(v_result);
}

/* -- Switch: C entry points --------------------------------------------- */

void cd_ox_do_lock_doors(int trigger_num)
{
    cd_ox_require_ready("cd_ox_do_lock_doors");
    CAMLparam0();
    caml_callback(*g_do_lock_doors, Val_long(trigger_num));
    CAMLreturn0;
}

void cd_ox_do_unlock_doors(int trigger_num)
{
    cd_ox_require_ready("cd_ox_do_unlock_doors");
    CAMLparam0();
    caml_callback(*g_do_unlock_doors, Val_long(trigger_num));
    CAMLreturn0;
}

int cd_ox_door_is_wall_switched(int wall_num)
{
    cd_ox_require_ready("cd_ox_door_is_wall_switched");
    CAMLparam0();
    CAMLlocal1(v_result);
    v_result = caml_callback(*g_door_is_wall_switched, Val_long(wall_num));
    int result = Long_val(v_result);
    CAMLreturnT(int, result);
}

void cd_ox_flag_wall_switched_doors(void)
{
    cd_ox_require_ready("cd_ox_flag_wall_switched_doors");
    CAMLparam0();
    caml_callback(*g_flag_wall_switched_doors, Val_unit);
    CAMLreturn0;
}

void cd_ox_do_il_on(int trigger_num)
{
    cd_ox_require_ready("cd_ox_do_il_on");
    CAMLparam0();
    caml_callback(*g_do_il_on, Val_long(trigger_num));
    CAMLreturn0;
}

/* -- Wall: effect registration ------------------------------------------ */

void cd_ox_register_wall_effects(
    cd_effect_wall_fetch_reset_walls_info_fn fetch_info,
    cd_effect_wall_write_reset_walls_fn write_reset)
{
    g_effect_wall_fetch_reset_walls_info = fetch_info;
    g_effect_wall_write_reset_walls = write_reset;
}

/* Fetch reset_walls info: returns [num_walls, is_d2] */
CAMLprim value cd_ox_effect_wall_fetch_reset_walls_info(value v_unit)
{
    CAMLparam1(v_unit);
    CAMLlocal1(v_result);

    int32_t out[2] = {0, 0};
    if (g_effect_wall_fetch_reset_walls_info)
        g_effect_wall_fetch_reset_walls_info(out);

    v_result = caml_alloc(2, 0);
    Store_field(v_result, 0, Val_long(out[0]));
    Store_field(v_result, 1, Val_long(out[1]));
    CAMLreturn(v_result);
}

/* Write reset walls range: packed = [start_idx, end_idx_exclusive] */
CAMLprim value cd_ox_effect_wall_write_reset_walls(value v_packed)
{
    CAMLparam1(v_packed);

    if (g_effect_wall_write_reset_walls) {
        int len = Wosize_val(v_packed);
        int32_t packed[2];
        for (int i = 0; i < len && i < 2; i++)
            packed[i] = Long_val(Field(v_packed, i));
        g_effect_wall_write_reset_walls(packed, len);
    }
    CAMLreturn(Val_unit);
}

/* -- Wall: C entry point ------------------------------------------------ */

void cd_ox_reset_walls(void)
{
    cd_ox_require_ready("cd_ox_reset_walls");
    CAMLparam0();
    caml_callback(*g_reset_walls, Val_unit);
    CAMLreturn0;
}

/* -- Wall: kill_stuck_objects ---------------------------------------------- */

#define KILL_STUCK_DATA_LEN (2 + 32 * 3)  /* [is_d2, num_stuck, (wallnum, objnum, obj_type) x 32] = 98 */

void cd_ox_register_wall_kill_stuck_effects(
    cd_effect_wall_fetch_kill_stuck_data_fn fetch_data,
    cd_effect_wall_write_kill_stuck_objects_fn write_back,
    cd_effect_wall_flush_fcd_cache_fn flush_fcd)
{
    g_effect_wall_fetch_kill_stuck_data = fetch_data;
    g_effect_wall_write_kill_stuck_objects = write_back;
    g_effect_wall_flush_fcd_cache = flush_fcd;
}

/* Fetch kill_stuck data: returns [is_d2, num_stuck, wallnum_0, objnum_0, obj_type_0, ...] */
CAMLprim value cd_ox_effect_wall_fetch_kill_stuck_data(value v_wallnum)
{
    CAMLparam1(v_wallnum);
    CAMLlocal1(v_result);

    int32_t out[KILL_STUCK_DATA_LEN];
    memset(out, 0, sizeof(out));
    int wallnum = Int_val(v_wallnum);
    if (g_effect_wall_fetch_kill_stuck_data)
        g_effect_wall_fetch_kill_stuck_data(wallnum, out);

    v_result = caml_alloc(KILL_STUCK_DATA_LEN, 0);
    for (int i = 0; i < KILL_STUCK_DATA_LEN; i++)
        Store_field(v_result, i, Val_long(out[i]));
    CAMLreturn(v_result);
}

/* Write kill_stuck_objects result: packed = [new_num_stuck, n_matches, (slot, objnum, is_weapon) x n] */
CAMLprim value cd_ox_effect_wall_write_kill_stuck_objects(value v_packed)
{
    CAMLparam1(v_packed);

    if (g_effect_wall_write_kill_stuck_objects) {
        int len = Wosize_val(v_packed);
        int32_t buf[128];
        if (len > 128) len = 128;
        for (int i = 0; i < len; i++)
            buf[i] = (int32_t)Long_val(Field(v_packed, i));
        g_effect_wall_write_kill_stuck_objects(buf, len);
    }
    CAMLreturn(Val_unit);
}

/* Flush FCD cache effect */
CAMLprim value cd_ox_effect_wall_flush_fcd_cache(value v_unit)
{
    CAMLparam1(v_unit);
    if (g_effect_wall_flush_fcd_cache)
        g_effect_wall_flush_fcd_cache();
    CAMLreturn(Val_unit);
}

/* C entry point for kill_stuck_objects */
void cd_ox_kill_stuck_objects(int wallnum)
{
    cd_ox_require_ready("cd_ox_kill_stuck_objects");
    CAMLparam0();
    caml_callback(*g_kill_stuck_objects, Val_int(wallnum));
    CAMLreturn0;
}

/* -- Wall: wall_illusion_on / wall_illusion_off ------------------------------ */

void cd_ox_register_wall_illusion_effects(
    cd_effect_wall_fetch_seg_children_and_wall_nums_fn fetch_seg,
    cd_effect_wall_set_flags_fn set_flags,
    cd_effect_wall_clear_flags_fn clear_flags)
{
    g_effect_wall_fetch_seg_children_and_wall_nums = fetch_seg;
    g_effect_wall_set_flags = set_flags;
    g_effect_wall_clear_flags = clear_flags;
}

/* Fetch segment children[0..5] and side wall_nums[0..5] = 12 ints */
CAMLprim value cd_ox_effect_wall_fetch_seg_children_and_wall_nums(value v_segnum)
{
    CAMLparam1(v_segnum);
    CAMLlocal1(v_result);

    int32_t out[12];
    memset(out, 0, sizeof(out));
    if (g_effect_wall_fetch_seg_children_and_wall_nums)
        g_effect_wall_fetch_seg_children_and_wall_nums(Int_val(v_segnum), out);

    v_result = caml_alloc(12, 0);
    for (int i = 0; i < 12; i++)
        Store_field(v_result, i, Val_long(out[i]));
    CAMLreturn(v_result);
}

/* Set flags on a wall: Walls[wall_num].flags |= flags */
CAMLprim value cd_ox_effect_wall_set_flags(value v_wall_num, value v_flags)
{
    if (g_effect_wall_set_flags)
        g_effect_wall_set_flags(Int_val(v_wall_num), Int_val(v_flags));
    return Val_unit;
}

/* Clear flags on a wall: Walls[wall_num].flags &= ~flags */
CAMLprim value cd_ox_effect_wall_clear_flags(value v_wall_num, value v_flags)
{
    if (g_effect_wall_clear_flags)
        g_effect_wall_clear_flags(Int_val(v_wall_num), Int_val(v_flags));
    return Val_unit;
}

/* C entry point for wall_illusion_off */
void cd_ox_wall_illusion_off(int segnum, int side)
{
    cd_ox_require_ready("cd_ox_wall_illusion_off");
    CAMLparam0();
    caml_callback2(*g_wall_illusion_off, Val_int(segnum), Val_int(side));
    CAMLreturn0;
}

/* C entry point for wall_illusion_on */
void cd_ox_wall_illusion_on(int segnum, int side)
{
    cd_ox_require_ready("cd_ox_wall_illusion_on");
    CAMLparam0();
    caml_callback2(*g_wall_illusion_on, Val_int(segnum), Val_int(side));
    CAMLreturn0;
}

/* -- free_object_slots: effect registration -------------------------------- */

void cd_ox_register_free_object_slots_effects(
    cd_effect_gs_fetch_free_object_slots_data_fn fetch_data,
    cd_effect_gs_write_free_object_slots_fn write_data)
{
    g_effect_gs_fetch_free_object_slots_data = fetch_data;
    g_effect_gs_write_free_object_slots = write_data;
}

/* -- free_object_slots: effect externals ----------------------------------- */

/* Data layout: [highest_object_index, is_d2, then per-object: type, flags, id, delete_objnum]
   Max: 2 + 4*350 = 1402 */
#define GS_FOS_DATA_LEN 1402

CAMLprim value cd_ox_effect_gs_fetch_free_object_slots_data(value v_unit)
{
    CAMLparam1(v_unit);
    CAMLlocal1(v_result);

    int32_t out[GS_FOS_DATA_LEN];
    int out_len = GS_FOS_DATA_LEN;
    memset(out, 0, sizeof(out));
    if (g_effect_gs_fetch_free_object_slots_data)
        g_effect_gs_fetch_free_object_slots_data(out, &out_len);

    v_result = caml_alloc(out_len, 0);
    for (int i = 0; i < out_len; i++)
        Store_field(v_result, i, Val_long(out[i]));
    CAMLreturn(v_result);
}

CAMLprim value cd_ox_effect_gs_write_free_object_slots(value v_packed)
{
    CAMLparam1(v_packed);

    if (g_effect_gs_write_free_object_slots) {
        int len = Wosize_val(v_packed);
        int32_t buf[512];
        if (len > 512) len = 512;
        for (int i = 0; i < len; i++)
            buf[i] = (int32_t)Long_val(Field(v_packed, i));
        g_effect_gs_write_free_object_slots(buf, len);
    }
    CAMLreturn(Val_unit);
}

/* cd_ox_free_object_slots: C entry point that calls into OCaml.
   Return value is packed into write-back array[0] by OCaml. */
static int g_free_object_slots_retval = 0;

void cd_ox_set_free_object_slots_retval(int rv)
{
    g_free_object_slots_retval = rv;
}

int cd_ox_free_object_slots(int num_used)
{
    cd_ox_require_ready("cd_ox_free_object_slots");
    CAMLparam0();

    g_free_object_slots_retval = 0;
    caml_callback(*g_free_object_slots, Val_int(num_used));

    CAMLreturn(g_free_object_slots_retval);
}

/* ── add_awareness_event ──────────────────────────────── */

/* ai_do_cloak_stuff effect: reuses the existing collision-phase2 callback */
CAMLprim value cd_ox_effect_aae_ai_do_cloak_stuff(value v_unit)
{
    (void)v_unit;
    if (g_effect_ps_ai_do_cloak_stuff)
        g_effect_ps_ai_do_cloak_stuff();
    return Val_unit;
}

/* C entry point: calls OCaml add_awareness_event, writes back event data.
   Returns the function's return value (0 = filtered, 1 = not filtered).
   If an event should be stored, writes to Awareness_events and increments
   *p_num_awareness_events. */
int cd_ox_add_awareness_event(
    int atype, int obj_id, int obj_segnum,
    int obj_pos_x, int obj_pos_y, int obj_pos_z,
    int num_awareness_events, int is_d2,
    int32_t* out_buf)
{
    cd_ox_require_ready("cd_ox_add_awareness_event");
    CAMLparam0();
    CAMLlocal1(result);

    result = caml_callbackN(*g_add_awareness_event, 8, (value[]){
        Val_int(atype), Val_int(obj_id), Val_int(obj_segnum),
        Val_int(obj_pos_x), Val_int(obj_pos_y), Val_int(obj_pos_z),
        Val_int(num_awareness_events), Val_int(is_d2)
    });

    /* result is an OCaml array of 7 ints:
       [0] = return value, [1] = should_store,
       [2..6] = segnum, pos_x, pos_y, pos_z, event_type */
    for (int i = 0; i < 7; i++)
        out_buf[i] = (int32_t)Long_val(Field(result, i));

    CAMLreturn(out_buf[0]);
}

/* create_awareness_event: wraps add_awareness_event with multiplayer check
   and Overall_agitation update.
   Input (10 ints): atype, obj_id, obj_segnum, obj_pos_x/y/z,
     num_awareness_events, is_d2, game_mode, overall_agitation
   Output (7 ints): new_overall_agitation, should_store, event_segnum,
     event_pos_x/y/z, event_type */
void cd_ox_create_awareness_event(
    int atype, int obj_id, int obj_segnum,
    int obj_pos_x, int obj_pos_y, int obj_pos_z,
    int num_awareness_events, int is_d2, int game_mode, int overall_agitation,
    int32_t* out_buf)
{
    cd_ox_require_ready("cd_ox_create_awareness_event");
    CAMLparam0();
    CAMLlocal2(v_packed, result);

    v_packed = caml_alloc(10, 0);
    Store_field(v_packed, 0, Val_long(atype));
    Store_field(v_packed, 1, Val_long(obj_id));
    Store_field(v_packed, 2, Val_long(obj_segnum));
    Store_field(v_packed, 3, Val_long(obj_pos_x));
    Store_field(v_packed, 4, Val_long(obj_pos_y));
    Store_field(v_packed, 5, Val_long(obj_pos_z));
    Store_field(v_packed, 6, Val_long(num_awareness_events));
    Store_field(v_packed, 7, Val_long(is_d2));
    Store_field(v_packed, 8, Val_long(game_mode));
    Store_field(v_packed, 9, Val_long(overall_agitation));

    result = caml_callback(*g_create_awareness_event, v_packed);

    /* result is an OCaml array of 7 ints:
       [0] = new_overall_agitation, [1] = should_store,
       [2..6] = segnum, pos_x, pos_y, pos_z, event_type */
    for (int i = 0; i < 7; i++)
        out_buf[i] = (int32_t)Long_val(Field(result, i));

    CAMLreturn0;
}

/* init_ai_frame: called once per game frame to set up AI globals.
   Input: 14 ints, Output: 6 ints */
void cd_ox_init_ai_frame(
    int32_t lfup_x, int32_t lfup_y, int32_t lfup_z,
    int32_t bp_x, int32_t bp_y, int32_t bp_z,
    int is_shareware, int32_t player_flags,
    int32_t console_x, int32_t console_y, int32_t console_z, int32_t console_segnum,
    int32_t afterburner_charge, int afterburner_state,
    int32_t* out_buf)
{
    cd_ox_require_ready("cd_ox_init_ai_frame");
    CAMLparam0();
    CAMLlocal2(v_packed, result);

    v_packed = caml_alloc(14, 0);
    Store_field(v_packed, 0, Val_long(lfup_x));
    Store_field(v_packed, 1, Val_long(lfup_y));
    Store_field(v_packed, 2, Val_long(lfup_z));
    Store_field(v_packed, 3, Val_long(bp_x));
    Store_field(v_packed, 4, Val_long(bp_y));
    Store_field(v_packed, 5, Val_long(bp_z));
    Store_field(v_packed, 6, Val_long(is_shareware));
    Store_field(v_packed, 7, Val_long(player_flags));
    Store_field(v_packed, 8, Val_long(console_x));
    Store_field(v_packed, 9, Val_long(console_y));
    Store_field(v_packed, 10, Val_long(console_z));
    Store_field(v_packed, 11, Val_long(console_segnum));
    Store_field(v_packed, 12, Val_long(afterburner_charge));
    Store_field(v_packed, 13, Val_long(afterburner_state));

    result = caml_callback(*g_init_ai_frame, v_packed);

    for (int i = 0; i < 6; i++)
        out_buf[i] = (int32_t)Long_val(Field(result, i));

    CAMLreturn0;
}

/* -- Object detach registration + CAMLprim wrappers --------------------- */

void cd_ox_register_obj_detach_effects(
    cd_obj_detach_one_fn detach_one,
    cd_get_attached_obj_fn get_attached)
{
    g_obj_detach_one = detach_one;
    g_get_attached_obj = get_attached;
}

CAMLprim value cd_ox_effect_obj_detach_one(value v_objnum)
{
    if (g_obj_detach_one) g_obj_detach_one(Int_val(v_objnum));
    return Val_unit;
}

CAMLprim value cd_ox_get_attached_obj(value v_objnum)
{
    if (g_get_attached_obj) return Val_int(g_get_attached_obj(Int_val(v_objnum)));
    return Val_int(-1);
}

/* -- Object segment search: CAMLprim wrappers for is_object_in_seg deps -- */

/* These read game state directly via registered callbacks. */
static cd_get_seg_first_object_fn g_get_seg_first_object = NULL;
static cd_get_obj_next_fn g_get_obj_next = NULL;
static cd_get_highest_segment_index_fn g_get_highest_segment_index = NULL;

void cd_ox_register_obj_search_effects(
    cd_get_seg_first_object_fn get_seg_first_object,
    cd_get_obj_next_fn get_obj_next,
    cd_get_highest_segment_index_fn get_highest_segment_index)
{
    g_get_seg_first_object = get_seg_first_object;
    g_get_obj_next = get_obj_next;
    g_get_highest_segment_index = get_highest_segment_index;
}

CAMLprim value cd_ox_get_seg_first_object(value v_segnum)
{
    if (g_get_seg_first_object) return Val_int(g_get_seg_first_object(Int_val(v_segnum)));
    return Val_int(-1);
}

CAMLprim value cd_ox_get_obj_next(value v_objnum)
{
    if (g_get_obj_next) return Val_int(g_get_obj_next(Int_val(v_objnum)));
    return Val_int(-1);
}

CAMLprim value cd_ox_get_highest_segment_index(value v_unit)
{
    (void)v_unit;
    if (g_get_highest_segment_index) return Val_int(g_get_highest_segment_index());
    return Val_int(0);
}

/* johns_obj_unlink effect: unlink object from segment's linked list */
typedef void (*cd_johns_obj_unlink_fn)(int segnum, int objnum);
static cd_johns_obj_unlink_fn g_johns_obj_unlink = NULL;

typedef int (*cd_get_obj_segnum_fn)(int objnum);
static cd_get_obj_segnum_fn g_get_obj_segnum = NULL;

void cd_ox_register_obj_unlink_effects(
    cd_johns_obj_unlink_fn johns_obj_unlink,
    cd_get_obj_segnum_fn get_obj_segnum)
{
    g_johns_obj_unlink = johns_obj_unlink;
    g_get_obj_segnum = get_obj_segnum;
}

CAMLprim value cd_ox_effect_johns_obj_unlink(value v_segnum, value v_objnum)
{
    if (g_johns_obj_unlink) g_johns_obj_unlink(Int_val(v_segnum), Int_val(v_objnum));
    return Val_unit;
}

CAMLprim value cd_ox_get_obj_segnum(value v_objnum)
{
    if (g_get_obj_segnum) return Val_int(g_get_obj_segnum(Int_val(v_objnum)));
    return Val_int(-1);
}

/* C entry points: call OCaml remove_all_objects_but / remove_incorrect_objects */
static const value* g_remove_all_objects_but = NULL;
static const value* g_remove_incorrect_objects = NULL;

void cd_ox_remove_all_objects_but(int segnum, int objnum)
{
    cd_ox_require_ready("cd_ox_remove_all_objects_but");
    if (!g_remove_all_objects_but)
        g_remove_all_objects_but = caml_named_value("cd_remove_all_objects_but");
    if (!g_remove_all_objects_but) return;
    caml_callback2(*g_remove_all_objects_but, Val_int(segnum), Val_int(objnum));
}

void cd_ox_remove_incorrect_objects(void)
{
    cd_ox_require_ready("cd_ox_remove_incorrect_objects");
    if (!g_remove_incorrect_objects)
        g_remove_incorrect_objects = caml_named_value("cd_remove_incorrect_objects");
    if (!g_remove_incorrect_objects) return;
    caml_callback(*g_remove_incorrect_objects, Val_unit);
}

/* C entry point: calls OCaml search_all_segments_for_object.
   Returns count of segment links for the given object. */
static const value* g_search_all_segments_for_object = NULL;

int cd_ox_search_all_segments_for_object(int objnum)
{
    cd_ox_require_ready("cd_ox_search_all_segments_for_object");
    if (!g_search_all_segments_for_object)
        g_search_all_segments_for_object = caml_named_value("search_all_segments_for_object");
    if (!g_search_all_segments_for_object) return 0;
    value v_result = caml_callback(*g_search_all_segments_for_object, Val_int(objnum));
    return Int_val(v_result);
}

/* C entry point: calls OCaml spin_object.
   Pure math — no effects needed. */
static const value* g_spin_object = NULL;

void cd_ox_spin_object(
    int32_t spin_rx, int32_t spin_ry, int32_t spin_rz,
    int32_t o_rx, int32_t o_ry, int32_t o_rz,
    int32_t o_ux, int32_t o_uy, int32_t o_uz,
    int32_t o_fx, int32_t o_fy, int32_t o_fz,
    int32_t frame_time,
    int32_t* out_orient)
{
    cd_ox_require_ready("cd_ox_spin_object");
    if (!g_spin_object)
        g_spin_object = caml_named_value("cd_spin_object");
    if (!g_spin_object) return;
    value args[13] = {
        Val_long(spin_rx), Val_long(spin_ry), Val_long(spin_rz),
        Val_long(o_rx), Val_long(o_ry), Val_long(o_rz),
        Val_long(o_ux), Val_long(o_uy), Val_long(o_uz),
        Val_long(o_fx), Val_long(o_fy), Val_long(o_fz),
        Val_long(frame_time),
    };
    value result = caml_callbackN(*g_spin_object, 13, args);
    /* result is a tuple (rx, ry, rz, ux, uy, uz, fx, fy, fz) */
    for (int i = 0; i < 9; i++)
        out_orient[i] = Int_val(Field(result, i));
}

/* C entry point: calls OCaml set_robot_location_info.
   Returns 1 if danger_laser fields should be updated, 0 otherwise. */
static const value* g_set_robot_location_info = NULL;

int cd_ox_set_robot_location_info(
    int32_t player_fired_laser, int32_t obj_px, int32_t obj_py, int32_t obj_pz,
    int32_t vp_x, int32_t vp_y, int32_t vp_z,
    int32_t r1, int32_t r2, int32_t r3,
    int32_t u1, int32_t u2, int32_t u3,
    int32_t f1, int32_t f2, int32_t f3,
    int32_t laser_sig,
    int32_t* out_danger_num, int32_t* out_danger_sig)
{
    cd_ox_require_ready("cd_ox_set_robot_location_info");
    if (!g_set_robot_location_info)
        g_set_robot_location_info = caml_named_value("cd_set_robot_location_info");
    if (!g_set_robot_location_info) return 0;
    value args[17] = {
        Val_long(player_fired_laser),
        Val_long(obj_px), Val_long(obj_py), Val_long(obj_pz),
        Val_long(vp_x), Val_long(vp_y), Val_long(vp_z),
        Val_long(r1), Val_long(r2), Val_long(r3),
        Val_long(u1), Val_long(u2), Val_long(u3),
        Val_long(f1), Val_long(f2), Val_long(f3),
        Val_long(laser_sig),
    };
    value result = caml_callbackN(*g_set_robot_location_info, 17, args);
    int should_update = Int_val(Field(result, 0));
    if (should_update) {
        *out_danger_num = Int_val(Field(result, 1));
        *out_danger_sig = Int_val(Field(result, 2));
    }
    return should_update;
}

/* ====================================================================== */
/* Morph: effect registration + externals + entry point                   */
/* ====================================================================== */

void cd_ox_register_morph_effects(
    cd_effect_morph_fetch_submodel_vertices_fn fetch_verts)
{
    g_effect_morph_fetch_submodel_vertices = fetch_verts;
}

/* C external: OCaml calls this to fetch submodel vertex data from polymodel.
   Returns int array [x0,y0,z0, x1,y1,z1, ...]. */
CAMLprim value cd_ox_effect_morph_fetch_submodel_vertices(value v_model_num, value v_submodel_num)
{
    CAMLparam2(v_model_num, v_submodel_num);
    CAMLlocal1(v_arr);

    /* Max vertices in a submodel — generous upper bound */
    #define MAX_MORPH_VERTS 1000
    int32_t verts[MAX_MORPH_VERTS * 3];
    int count = 0;

    if (g_effect_morph_fetch_submodel_vertices)
        g_effect_morph_fetch_submodel_vertices(
            Int_val(v_model_num), Int_val(v_submodel_num), verts, &count);

    int arr_len = count * 3;
    if (arr_len <= 0) {
        /* Return minimal 1-vertex array to avoid assert failure */
        v_arr = caml_alloc(3, 0);
        Store_field(v_arr, 0, Val_long(0));
        Store_field(v_arr, 1, Val_long(0));
        Store_field(v_arr, 2, Val_long(0));
        CAMLreturn(v_arr);
    }

    v_arr = caml_alloc(arr_len, 0);
    for (int i = 0; i < arr_len; i++)
        Store_field(v_arr, i, Val_long(verts[i]));

    CAMLreturn(v_arr);
}

/* C entry point: calls OCaml find_min_max.
   out_min[3], out_max[3] receive the bounding box. */
void cd_ox_find_min_max(int model_num, int submodel_num,
    int32_t* out_min, int32_t* out_max)
{
    cd_ox_require_ready("cd_ox_find_min_max");
    CAMLparam0();
    CAMLlocal1(v_result);

    v_result = caml_callback2(*g_find_min_max, Val_int(model_num), Val_int(submodel_num));

    out_min[0] = Int_val(Field(v_result, 0));
    out_min[1] = Int_val(Field(v_result, 1));
    out_min[2] = Int_val(Field(v_result, 2));
    out_max[0] = Int_val(Field(v_result, 3));
    out_max[1] = Int_val(Field(v_result, 4));
    out_max[2] = Int_val(Field(v_result, 5));
    CAMLreturn0;
}

/* C entry point: pack morph data, call OCaml update_points, unpack results.
   Input array: [frame_time, nverts, n_morphing_points,
     morph_times[0], vecs[0].x,y,z, deltas[0].x,y,z, final[0].x,y,z, ...]
   Output array: [n_morphing_points, times[0], vecs[0].x,y,z, ...] */
void cd_ox_update_points(int morph_slot, int submodel_num,
    int32_t frame_time,
    int nverts, int start_index,
    int32_t* n_morphing_points,
    int32_t* morph_times,
    int32_t* morph_vecs,
    int32_t* morph_deltas,
    int32_t* final_verts)
{
    cd_ox_require_ready("cd_ox_update_points");
    if (!g_update_points) return;

    CAMLparam0();
    CAMLlocal2(v_input, v_result);

    int arr_len = 3 + nverts * 10;
    v_input = caml_alloc(arr_len, 0);
    Store_field(v_input, 0, Val_long(frame_time));
    Store_field(v_input, 1, Val_long(nverts));
    Store_field(v_input, 2, Val_long(*n_morphing_points));

    for (int v = 0; v < nverts; v++) {
        int base = 3 + v * 10;
        Store_field(v_input, base + 0, Val_long(morph_times[v]));
        Store_field(v_input, base + 1, Val_long(morph_vecs[v * 3 + 0]));
        Store_field(v_input, base + 2, Val_long(morph_vecs[v * 3 + 1]));
        Store_field(v_input, base + 3, Val_long(morph_vecs[v * 3 + 2]));
        Store_field(v_input, base + 4, Val_long(morph_deltas[v * 3 + 0]));
        Store_field(v_input, base + 5, Val_long(morph_deltas[v * 3 + 1]));
        Store_field(v_input, base + 6, Val_long(morph_deltas[v * 3 + 2]));
        Store_field(v_input, base + 7, Val_long(final_verts[v * 3 + 0]));
        Store_field(v_input, base + 8, Val_long(final_verts[v * 3 + 1]));
        Store_field(v_input, base + 9, Val_long(final_verts[v * 3 + 2]));
    }

    v_result = caml_callback(*g_update_points, v_input);

    *n_morphing_points = Long_val(Field(v_result, 0));
    for (int v = 0; v < nverts; v++) {
        int obase = 1 + v * 4;
        morph_times[v] = Long_val(Field(v_result, obase + 0));
        morph_vecs[v * 3 + 0] = Long_val(Field(v_result, obase + 1));
        morph_vecs[v * 3 + 1] = Long_val(Field(v_result, obase + 2));
        morph_vecs[v * 3 + 2] = Long_val(Field(v_result, obase + 3));
    }

    CAMLreturn0;
}

/* ====================================================================== */
/* wake_up_rendered_objects: effect registration + externals + entry point */
/* ====================================================================== */

void cd_ox_register_wake_up_effects(
    cd_effect_fetch_wake_up_context_fn fetch_ctx,
    cd_effect_fetch_ai_local_awareness_fn fetch_awareness,
    cd_effect_apply_wake_up_fn apply_wake_up)
{
    g_effect_fetch_wake_up_context = fetch_ctx;
    g_effect_fetch_ai_local_awareness = fetch_awareness;
    g_effect_apply_wake_up = apply_wake_up;
}

/* C external: OCaml calls this to fetch wake-up context data.
   Returns int array:
   [0]=frame_count [1]=window_frame [2]=viewer_px [3]=viewer_py [4]=viewer_pz
   [5]=num_rendered [6..]=per-object data (objnum, type, px, py, pz) x num_rendered */
CAMLprim value cd_ox_effect_fetch_wake_up_context(value v_window_num)
{
    CAMLparam1(v_window_num);
    CAMLlocal1(v_result);

    int window_num = Long_val(v_window_num);
    /* Max: 6 header + 50 objects * 5 fields = 256 */
    int32_t out[256];
    int out_len = 0;

    if (g_effect_fetch_wake_up_context)
        g_effect_fetch_wake_up_context(window_num, out, &out_len);

    if (out_len <= 0) out_len = 6; /* minimal header */
    v_result = caml_alloc(out_len, 0);
    for (int i = 0; i < out_len; i++)
        Store_field(v_result, i, Val_long(out[i]));
    CAMLreturn(v_result);
}

/* C external: OCaml calls this to get ai_local player_awareness_type */
CAMLprim value cd_ox_effect_fetch_ai_local_awareness(value v_objnum)
{
    CAMLparam1(v_objnum);
    int objnum = Long_val(v_objnum);
    int result = 0;
    if (g_effect_fetch_ai_local_awareness)
        result = g_effect_fetch_ai_local_awareness(objnum);
    CAMLreturn(Val_long(result));
}

/* C external: OCaml calls this to apply wake-up mutations.
   packed: [0]=valid [1]=num_wakeups [2]=viewer_objnum [3..]=objnums */
CAMLprim value cd_ox_effect_apply_wake_up(value v_packed)
{
    CAMLparam1(v_packed);
    if (g_effect_apply_wake_up) {
        int len = Wosize_val(v_packed);
        int32_t buf[64];
        if (len > 64) len = 64;
        for (int i = 0; i < len; i++)
            buf[i] = (int32_t)Long_val(Field(v_packed, i));
        g_effect_apply_wake_up(buf, len);
    }
    CAMLreturn(Val_unit);
}

/* C entry point: calls OCaml wake_up_rendered_objects */
void cd_ox_wake_up_rendered_objects(int viewer_objnum, int window_num)
{
    cd_ox_require_ready("cd_ox_wake_up_rendered_objects");
    if (!g_wake_up_rendered_objects) return;

    CAMLparam0();
    caml_callback2(*g_wake_up_rendered_objects,
                   Val_long(viewer_objnum), Val_long(window_num));
    CAMLreturn0;
}

/* -- obj_allocate effect infrastructure --------------------------------- */

static cd_effect_fetch_obj_allocate_data_fn g_effect_fetch_obj_allocate_data = NULL;
static cd_effect_write_obj_allocate_result_fn g_effect_write_obj_allocate_result = NULL;
static cd_effect_call_free_object_slots_fn g_effect_call_free_object_slots = NULL;
static const value* g_obj_allocate = NULL;

void cd_ox_register_obj_allocate_effects(
    cd_effect_fetch_obj_allocate_data_fn fetch,
    cd_effect_write_obj_allocate_result_fn write,
    cd_effect_call_free_object_slots_fn call_fos)
{
    g_effect_fetch_obj_allocate_data = fetch;
    g_effect_write_obj_allocate_result = write;
    g_effect_call_free_object_slots = call_fos;
}

/* OCaml external: fetch obj allocate data as int array */
CAMLprim value cd_ox_effect_fetch_obj_allocate_data(value v_unit)
{
    CAMLparam1(v_unit);
    CAMLlocal1(v_result);
    (void)v_unit;

    int32_t buf[512];
    int len = 0;
    if (g_effect_fetch_obj_allocate_data)
        g_effect_fetch_obj_allocate_data(buf, &len);

    v_result = caml_alloc(len, 0);
    for (int i = 0; i < len; i++)
        Store_field(v_result, i, Val_long(buf[i]));

    CAMLreturn(v_result);
}

/* OCaml external: write back obj allocate result */
CAMLprim value cd_ox_effect_write_obj_allocate_result(value v_packed)
{
    CAMLparam1(v_packed);
    if (g_effect_write_obj_allocate_result) {
        int len = Wosize_val(v_packed);
        int32_t buf[16];
        if (len > 16) len = 16;
        for (int i = 0; i < len; i++)
            buf[i] = (int32_t)Long_val(Field(v_packed, i));
        g_effect_write_obj_allocate_result(buf, len);
    }
    CAMLreturn(Val_unit);
}

/* OCaml external: call free_object_slots from OCaml */
CAMLprim value cd_ox_effect_call_free_object_slots(value v_num_used)
{
    CAMLparam1(v_num_used);
    if (g_effect_call_free_object_slots)
        g_effect_call_free_object_slots(Int_val(v_num_used));
    CAMLreturn(Val_unit);
}

/* C entry point: calls OCaml obj_allocate, returns objnum or -1 */
int cd_ox_obj_allocate(void)
{
    cd_ox_require_ready("cd_ox_obj_allocate");
    if (!g_obj_allocate)
        g_obj_allocate = caml_named_value("cd_obj_allocate");
    if (!g_obj_allocate) return -1;

    value v_result = caml_callback(*g_obj_allocate, Val_unit);
    return Int_val(v_result);
}

/* -- Fuelcen: fuelcen_create -------------------------------------------- */

void cd_ox_register_fuelcen_create_effects(
    cd_effect_fc_fetch_fuelcen_create_data_fn fetch_data,
    cd_effect_fc_write_fuelcen_create_fn write_data)
{
    g_effect_fc_fetch_fuelcen_create_data = fetch_data;
    g_effect_fc_write_fuelcen_create = write_data;
}

/* OCaml external: fetch fuelcen_create data from C globals
   Returns [station_type, num_fuelcenters, max_fuelcens, fuelcen_max_amount,
            is_d2, center_x, center_y, center_z] */
CAMLprim value cd_ox_effect_fc_fetch_fuelcen_create_data(value v_segnum)
{
    CAMLparam1(v_segnum);
    CAMLlocal1(v_result);

    int segnum = Long_val(v_segnum);
    int32_t out[8];
    memset(out, 0, sizeof(out));
    if (g_effect_fc_fetch_fuelcen_create_data)
        g_effect_fc_fetch_fuelcen_create_data(segnum, out);

    v_result = caml_alloc(8, 0);
    for (int i = 0; i < 8; i++)
        Store_field(v_result, i, Val_long(out[i]));
    CAMLreturn(v_result);
}

/* OCaml external: write fuelcen_create result back to C globals */
CAMLprim value cd_ox_effect_fc_write_fuelcen_create(value v_packed)
{
    CAMLparam1(v_packed);

    if (g_effect_fc_write_fuelcen_create) {
        int len = Wosize_val(v_packed);
        int32_t buf[8];
        if (len > 8) len = 8;
        for (int i = 0; i < len; i++)
            buf[i] = (int32_t)Long_val(Field(v_packed, i));
        g_effect_fc_write_fuelcen_create(buf, len);
    }
    CAMLreturn(Val_unit);
}

/* cd_ox_fuelcen_create: C entry point that calls into OCaml */
void cd_ox_fuelcen_create(int segnum)
{
    cd_ox_require_ready("cd_ox_fuelcen_create");
    CAMLparam0();

    caml_callback(*g_fuelcen_create, Val_long(segnum));

    CAMLreturn0;
}

/* -- Matcen: matcen_create ---------------------------------------------- */

void cd_ox_register_matcen_create_effects(
    cd_effect_fc_fetch_matcen_create_data_fn fetch_data,
    cd_effect_fc_write_matcen_create_fn write_data)
{
    g_effect_fc_fetch_matcen_create_data = fetch_data;
    g_effect_fc_write_matcen_create = write_data;
}

/* OCaml external: fetch matcen_create data from C globals
   Returns [station_type, num_fuelcenters, max_fuelcens, difficulty_level,
            num_robot_centers, center_x, center_y, center_z, segnum] */
CAMLprim value cd_ox_effect_fc_fetch_matcen_create_data(value v_segnum)
{
    CAMLparam1(v_segnum);
    CAMLlocal1(v_result);

    int segnum = Long_val(v_segnum);
    int32_t out[9];
    memset(out, 0, sizeof(out));
    if (g_effect_fc_fetch_matcen_create_data)
        g_effect_fc_fetch_matcen_create_data(segnum, out);

    v_result = caml_alloc(9, 0);
    for (int i = 0; i < 9; i++)
        Store_field(v_result, i, Val_long(out[i]));
    CAMLreturn(v_result);
}

/* OCaml external: write matcen_create result back to C globals */
CAMLprim value cd_ox_effect_fc_write_matcen_create(value v_packed)
{
    CAMLparam1(v_packed);

    if (g_effect_fc_write_matcen_create) {
        int len = Wosize_val(v_packed);
        int32_t buf[13];
        if (len > 13) len = 13;
        for (int i = 0; i < len; i++)
            buf[i] = (int32_t)Long_val(Field(v_packed, i));
        g_effect_fc_write_matcen_create(buf, len);
    }
    CAMLreturn(Val_unit);
}

/* cd_ox_matcen_create: C entry point that calls into OCaml */
void cd_ox_matcen_create(int segnum)
{
    cd_ox_require_ready("cd_ox_matcen_create");
    CAMLparam0();

    caml_callback(*g_matcen_create, Val_long(segnum));

    CAMLreturn0;
}

/* -- fuelcen_activate ---------------------------------------------------- */

void cd_ox_register_fuelcen_activate_effects(
    cd_effect_fc_set_segment_special_fn set_special)
{
    g_effect_fc_set_segment_special = set_special;
}

CAMLprim value cd_ox_effect_fc_set_segment_special(value v_segnum, value v_special)
{
    if (g_effect_fc_set_segment_special)
        g_effect_fc_set_segment_special(Int_val(v_segnum), Int_val(v_special));
    return Val_unit;
}

/* cd_ox_fuelcen_activate: C entry point that calls into OCaml */
void cd_ox_fuelcen_activate(int segnum, int station_type)
{
    cd_ox_require_ready("cd_ox_fuelcen_activate");
    CAMLparam0();

    caml_callback2(*g_fuelcen_activate, Val_long(segnum), Val_long(station_type));

    CAMLreturn0;
}

/* -- check_volatile_wall ------------------------------------------------- */

void cd_ox_register_cvw_effects(
    cd_effect_cvw_apply_damage_fn apply_damage,
    cd_effect_cvw_palette_flash_fn palette_flash)
{
    g_effect_cvw_apply_damage = apply_damage;
    g_effect_cvw_palette_flash = palette_flash;
}

CAMLprim value cd_ox_effect_cvw_apply_damage(value v_objnum, value v_damage)
{
    if (g_effect_cvw_apply_damage)
        g_effect_cvw_apply_damage(Int_val(v_objnum), Int_val(v_damage));
    return Val_unit;
}

CAMLprim value cd_ox_effect_cvw_palette_flash(value v_r, value v_g, value v_b)
{
    if (g_effect_cvw_palette_flash)
        g_effect_cvw_palette_flash(Int_val(v_r), Int_val(v_g), Int_val(v_b));
    return Val_unit;
}

void cd_ox_check_volatile_wall(
    int obj_id, int player_num, int obj_objnum,
    int32_t tmap_damage, int tmap_water,
    int32_t frame_time, int difficulty_level, int player_invulnerable,
    int* out_apply_rotvel, int* out_ret_code,
    int32_t* out_rotvel_x, int32_t* out_rotvel_z)
{
    cd_ox_require_ready("cd_ox_check_volatile_wall");
    CAMLparam0();
    CAMLlocal1(result);

    value args[8] = {
        Val_long(obj_id), Val_long(player_num), Val_long(obj_objnum),
        Val_long(tmap_damage), Val_long(tmap_water),
        Val_long(frame_time), Val_long(difficulty_level),
        Val_long(player_invulnerable)
    };
    result = caml_callbackN(*g_check_volatile_wall, 8, args);

    *out_apply_rotvel = Int_val(Field(result, 0));
    *out_ret_code = Int_val(Field(result, 1));
    *out_rotvel_x = Int_val(Field(result, 2));
    *out_rotvel_z = Int_val(Field(result, 3));

    CAMLreturn0;
}

/* -- Fireball: explode_wall --------------------------------------------- */

void cd_ox_register_fireball_effects(
    cd_effect_fb_alloc_expl_wall_slot_fn alloc_slot,
    cd_effect_fb_digi_link_sound_to_pos_fn link_sound)
{
    g_effect_fb_alloc_expl_wall_slot = alloc_slot;
    g_effect_fb_digi_link_sound_to_pos = link_sound;
}

/* Effect: find free slot in expl_wall_list, set segnum/sidenum/time=0, return index or -1 */
CAMLprim value cd_ox_effect_fb_alloc_expl_wall_slot(value v_segnum, value v_sidenum)
{
    CAMLparam2(v_segnum, v_sidenum);
    int slot = -1;
    if (g_effect_fb_alloc_expl_wall_slot) {
        slot = g_effect_fb_alloc_expl_wall_slot(
            Int_val(v_segnum), Int_val(v_sidenum));
    }
    CAMLreturn(Val_long(slot));
}

/* Effect: digi_link_sound_to_pos (8 args — needs bytecode wrapper) */
CAMLprim value cd_ox_effect_fb_digi_link_sound_to_pos(
    value v_sound_id, value v_segnum, value v_sidenum,
    value v_px, value v_py, value v_pz,
    value v_forever, value v_max_volume)
{
    CAMLparam5(v_sound_id, v_segnum, v_sidenum, v_px, v_py);
    CAMLxparam3(v_pz, v_forever, v_max_volume);
    if (g_effect_fb_digi_link_sound_to_pos) {
        g_effect_fb_digi_link_sound_to_pos(
            Int_val(v_sound_id), Int_val(v_segnum), Int_val(v_sidenum),
            Int_val(v_px), Int_val(v_py), Int_val(v_pz),
            Int_val(v_forever), Int_val(v_max_volume));
    }
    CAMLreturn(Val_unit);
}

CAMLprim value cd_ox_effect_fb_digi_link_sound_to_pos_bytecode(value* argv, int argn)
{
    (void)argn;
    return cd_ox_effect_fb_digi_link_sound_to_pos(
        argv[0], argv[1], argv[2], argv[3],
        argv[4], argv[5], argv[6], argv[7]);
}

void cd_ox_explode_wall(int segnum, int sidenum)
{
    cd_ox_require_ready("cd_ox_explode_wall");
    CAMLparam0();
    CAMLlocal1(result);

    value args[2] = { Val_long(segnum), Val_long(sidenum) };
    result = caml_callbackN(*g_explode_wall, 2, args);

    CAMLreturn0;
}

/* -- compress_objects effect infrastructure ------------------------------- */

static cd_effect_fetch_compress_objects_data_fn g_effect_fetch_compress_objects_data = NULL;
static cd_effect_execute_compress_objects_fn g_effect_execute_compress_objects = NULL;
static const value* g_compress_objects = NULL;

void cd_ox_register_compress_objects_effects(
    cd_effect_fetch_compress_objects_data_fn fetch_data,
    cd_effect_execute_compress_objects_fn execute)
{
    g_effect_fetch_compress_objects_data = fetch_data;
    g_effect_execute_compress_objects = execute;
}

/* OCaml external: fetch compress objects data as int array */
CAMLprim value cd_ox_effect_fetch_compress_objects_data(value v_unit)
{
    CAMLparam1(v_unit);
    CAMLlocal1(v_result);
    (void)v_unit;

    /* 2 + 2*MAX_OBJECTS = 702 (MAX_OBJECTS=350) */
    int32_t buf[704];
    int len = 0;
    if (g_effect_fetch_compress_objects_data)
        g_effect_fetch_compress_objects_data(buf, &len);

    v_result = caml_alloc(len, 0);
    for (int i = 0; i < len; i++)
        Store_field(v_result, i, Val_long(buf[i]));

    CAMLreturn(v_result);
}

/* OCaml external: execute compress objects plan */
CAMLprim value cd_ox_effect_execute_compress_objects(value v_packed)
{
    CAMLparam1(v_packed);
    if (g_effect_execute_compress_objects) {
        int len = Wosize_val(v_packed);
        int32_t* buf = (int32_t*)malloc(len * sizeof(int32_t));
        for (int i = 0; i < len; i++)
            buf[i] = (int32_t)Long_val(Field(v_packed, i));
        g_effect_execute_compress_objects(buf, len);
        free(buf);
    }
    CAMLreturn(Val_unit);
}

/* C entry point: calls OCaml compress_objects */
void cd_ox_compress_objects(void)
{
    cd_ox_require_ready("cd_ox_compress_objects");
    if (!g_compress_objects)
        g_compress_objects = caml_named_value("cd_compress_objects");
    if (!g_compress_objects) return;

    caml_callback(*g_compress_objects, Val_unit);
}

/* -- init_controlcen_for_level bridge --------------------------------- */

void cd_ox_init_controlcen_for_level(
    int boss_objnum, int game_mode, int current_level_num, int reactor_strength,
    int n_guns, const int32_t* gun_points_flat, const int32_t* gun_dirs_flat,
    int32_t or1, int32_t or2, int32_t or3,
    int32_t ou1, int32_t ou2, int32_t ou3,
    int32_t of1, int32_t of2, int32_t of3,
    int32_t opx, int32_t opy, int32_t opz,
    int32_t* result)
{
    cd_ox_require_ready("cd_ox_init_controlcen_for_level");
    CAMLparam0();
    CAMLlocal3(v_gp, v_gd, v_result);

    /* Pack gun_points_flat and gun_dirs_flat as OCaml int arrays */
    int gp_len = n_guns * 3;
    v_gp = caml_alloc(gp_len, 0);
    for (int i = 0; i < gp_len; i++)
        Store_field(v_gp, i, Val_long(gun_points_flat[i]));

    v_gd = caml_alloc(gp_len, 0);
    for (int i = 0; i < gp_len; i++)
        Store_field(v_gd, i, Val_long(gun_dirs_flat[i]));

    value args[18] = {
        Val_long(boss_objnum),
        Val_long(game_mode),
        Val_long(current_level_num),
        Val_long(reactor_strength),
        Val_long(n_guns),
        v_gp,
        v_gd,
        Val_long(or1), Val_long(or2), Val_long(or3),
        Val_long(ou1), Val_long(ou2), Val_long(ou3),
        Val_long(of1), Val_long(of2), Val_long(of3),
        Val_long(opx), Val_long(opy), Val_long(opz)
    };

    v_result = caml_callbackN(*g_init_controlcen_for_level, 18, args);

    int result_len = Wosize_val(v_result);
    for (int i = 0; i < result_len; i++)
        result[i] = (int32_t)Long_val(Field(v_result, i));

    CAMLreturn0;
}
