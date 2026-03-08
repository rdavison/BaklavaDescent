(* Bridge adapter for AI frame logic (do_ai_frame + ai_do_actual_firing_stuff).
   Uses algebraic effects: OCaml performs effects, C handler executes them. *)

open Core

(* Effect externals — called from OCaml effect handler, dispatch to C *)
external effect_ai_multiplayer_awareness : int -> int = "cd_ox_effect_af_multiplayer_awareness"
external effect_do_ai_robot_hit_attack : unit -> unit = "cd_ox_effect_af_robot_hit_attack"
external effect_ai_fire_laser_at_player : int -> int -> int -> int -> int -> int -> int -> unit = "cd_ox_effect_af_fire_laser_bytecode" "cd_ox_effect_af_fire_laser"
external effect_calc_gun_point : int -> int * int * int = "cd_ox_effect_af_calc_gun_point"
external effect_compute_vis_and_vec : int -> int -> int -> int * int * int * int * int = "cd_ox_effect_af_compute_vis_and_vec"
external effect_ai_multi_send_robot_position : int -> unit = "cd_ox_effect_af_multi_send_robot_position"
external effect_do_boss_stuff : int -> unit = "cd_ox_effect_af_do_boss_stuff"
external effect_p_rand : unit -> int = "cd_ox_effect_af_p_rand"
external effect_object_to_object_visibility : unit -> int = "cd_ox_effect_af_object_to_object_visibility"
external effect_do_snipe_frame : int -> int -> int -> int -> int -> int -> unit = "cd_ox_effect_af_do_snipe_frame_bytecode" "cd_ox_effect_af_do_snipe_frame"
external effect_do_any_robot_dying_frame : unit -> int = "cd_ox_effect_af_do_any_robot_dying_frame"
external effect_make_nearby_robot_snipe : unit -> unit = "cd_ox_effect_af_make_nearby_robot_snipe"
external effect_openable_doors_in_segment : unit -> int = "cd_ox_effect_af_openable_doors_in_segment"
external effect_move_away_from_player : unit -> unit = "cd_ox_effect_af_move_away_from_player"
external effect_invalidate_escort_goal : unit -> unit = "cd_ox_effect_af_invalidate_escort_goal"
external effect_laser_create_new_easy : int -> int -> int -> int -> int -> int -> int -> int -> unit = "cd_ox_effect_af_laser_create_new_easy_bytecode" "cd_ox_effect_af_laser_create_new_easy"
external effect_fetch_danger_laser_data : int -> int array = "cd_ox_effect_af_fetch_danger_laser_data"
external read_af_path_state : unit -> int array = "cd_ox_read_af_path_state"
external read_af_fire_state : unit -> int array = "cd_ox_read_af_fire_state"
external write_af_fire_timers : int -> int -> unit = "cd_ox_write_af_fire_timers"
external fetch_segment_data_c : int -> int array = "cd_ox_fetch_segment_data"
external fetch_object_data_c : int -> int array = "cd_ox_fetch_object_data"
external fetch_wall_data_c : int -> int -> int array = "cd_ox_fetch_wall_data"
external path_fvi_query_c : int array -> int array = "cd_ox_path_fvi_query"
external path_obj_relink_c : int array -> unit = "cd_ox_path_obj_relink"
external path_find_object_seg_c : int -> int -> int -> int = "cd_ox_path_find_object_seg"

let current_rinfo = ref [||]
let current_ai_state = ref [||]

let ai_frame_effect_handler (type a) (eff : a Effect.t)
  : ((a, 'b) Effect.Deep.continuation -> 'b) option
  =
  match eff with
  (* PRIORITY 1: System/RNG effects - always handle these first *)
  | Ox_misc.P_Rand_internal -> Some (fun k -> Effect.Deep.continue k (Ox_misc.p_rand_direct ()))
  | Ox_misc.P_Rand_get_state_internal -> Some (fun k -> Effect.Deep.continue k (Ox_misc.p_rand_get_state_direct ()))
  | Ox_misc.P_Rand_set_state_internal s -> Some (fun k -> Ox_misc.p_rand_set_state_direct s; Effect.Deep.continue k ())
  | Ox_misc.Error_internal msg -> Some (fun k -> Printf.eprintf "ERROR: %s\n" msg; Out_channel.flush stderr; Effect.Deep.continue k ())
  | Ox_misc.Warning_internal msg -> Some (fun k -> Printf.eprintf "WARNING: %s\n" msg; Out_channel.flush stderr; Effect.Deep.continue k ())
  | Ox_misc.Int3_internal -> Some (fun k -> Printf.eprintf "INT3!\n"; Out_channel.flush stderr; Effect.Deep.continue k ())
  | Ox_misc.Set_exit_message_internal _msg -> Some (fun k -> Effect.Deep.continue k ())

  (* PRIORITY 2: Data/System effects *)
  | Ox_gameseg.Fetch_segment_data segnum -> Some (fun k -> Effect.Deep.continue k (fetch_segment_data_c segnum))
  | Ox_fvi.Fetch_object_data objnum -> Some (fun k -> Effect.Deep.continue k (fetch_object_data_c objnum))
  | Ox_aipath.Fetch_wall_data (segnum, sidenum) -> Some (fun k -> Effect.Deep.continue k (fetch_wall_data_c segnum sidenum))
  | Ox_aipath.Path_fvi_query params -> Some (fun k -> Effect.Deep.continue k (path_fvi_query_c params))
  | Ox_aipath.Path_obj_relink params -> Some (fun k -> path_obj_relink_c params; Effect.Deep.continue k ())
  | Ox_aipath.Path_move_to_legal_spot -> Some (fun k -> Effect.Deep.continue k ())
  | Ox_aipath.Path_find_object_seg (x, y, z) -> Some (fun k -> Effect.Deep.continue k (path_find_object_seg_c x y z))

  (* PRIORITY 3: Local AI Frame effects *)
  | Ox_ai_frame.Ai_multiplayer_awareness agitation -> Some (fun k -> Effect.Deep.continue k ((effect_ai_multiplayer_awareness agitation) <> 0))
  | Ox_ai_frame.Do_ai_robot_hit_attack -> Some (fun k -> effect_do_ai_robot_hit_attack (); Effect.Deep.continue k ())
  | Ox_ai_frame.Ai_fire_laser_at_player (gpx, gpy, gpz, gun_num, fpx, fpy, fpz, nf_in, nf2_in) ->
    Some (fun k ->
      write_af_fire_timers nf_in nf2_in;
      effect_ai_fire_laser_at_player gpx gpy gpz gun_num fpx fpy fpz;
      let fs = read_af_fire_state () in
      Effect.Deep.continue k (fs.(0), fs.(1), fs.(2)))
  | Ox_ai_frame.Calc_gun_point gun_num -> Some (fun k -> Effect.Deep.continue k (effect_calc_gun_point gun_num))
  | Ox_ai_frame.Compute_vis_and_vec (vpx, vpy, vpz) -> Some (fun k -> Effect.Deep.continue k (effect_compute_vis_and_vec vpx vpy vpz))
  | Ox_ai_frame.Laser_create_new_easy (fvx, fvy, fvz, fpx, fpy, fpz, objnum, weapon_id) -> Some (fun k -> effect_laser_create_new_easy fvx fvy fvz fpx fpy fpz objnum weapon_id; Effect.Deep.continue k ())
  | Ox_ai_frame.Ai_multi_send_robot_position flag -> Some (fun k -> effect_ai_multi_send_robot_position flag; Effect.Deep.continue k ())
  | Ox_ai_frame.Do_boss_stuff pv -> Some (fun k -> effect_do_boss_stuff pv; Effect.Deep.continue k ())
  | Ox_ai_frame.Fetch_danger_laser_data objnum -> Some (fun k -> Effect.Deep.continue k (effect_fetch_danger_laser_data objnum))
  | Ox_ai_frame.P_Rand -> Some (fun k -> Effect.Deep.continue k (effect_p_rand ()))
  | Ox_ai_frame.Object_to_object_visibility -> Some (fun k -> Effect.Deep.continue k (effect_object_to_object_visibility ()))
  | Ox_ai_frame.Do_snipe_frame (dist, vis, vtpx, vtpy, vtpz, mode) ->
    Some (fun k -> effect_do_snipe_frame dist vis vtpx vtpy vtpz mode; Effect.Deep.continue k (read_af_path_state ()))
  | Ox_ai_frame.Do_any_robot_dying_frame -> Some (fun k -> Effect.Deep.continue k ((effect_do_any_robot_dying_frame ()) <> 0))
  | Ox_ai_frame.Make_nearby_robot_snipe -> Some (fun k -> effect_make_nearby_robot_snipe (); Effect.Deep.continue k ())
  | Ox_ai_frame.Move_away_from_player -> Some (fun k -> effect_move_away_from_player (); Effect.Deep.continue k ())
  | Ox_ai_frame.Openable_doors_in_segment -> Some (fun k -> Effect.Deep.continue k (effect_openable_doors_in_segment ()))
  | Ox_ai_frame.Invalidate_escort_goal -> Some (fun k -> effect_invalidate_escort_goal (); Effect.Deep.continue k ())
  | (eff : a Effect.t) -> (
    match Misc.effc eff with
    | Some h -> Some h
    | None -> Mem.effc eff)

let cd_do_ai_frame_d1
      ~ai_state ~rinfo ~frame_time ~frame_count ~game_time ~game_mode ~difficulty_level
      ~overall_agitation ~player_is_dead ~player_exploded ~player_flags ~obj_x ~obj_y ~obj_z
      ~obj_segnum ~obj_size ~obj_id ~objnum ~console_x ~console_y ~console_z ~console_size
      ~console_fvx ~console_fvy ~console_fvz ~believed_x ~believed_y ~believed_z ~believed_seg
      ~orient ~gun_point_in ~seg_special ~cloak_last_pos ~cloak_last_time ~ai_evaded_in
      ~velocity_x ~velocity_y ~velocity_z
  =
  current_rinfo := rinfo; current_ai_state := ai_state;
  Effect.Deep.match_with
    (fun () ->
       Ox_ai_frame.do_ai_frame_d1
         ~ai_state ~rinfo ~frame_time ~frame_count ~game_time ~game_mode ~difficulty_level
         ~overall_agitation ~player_is_dead ~player_exploded ~player_flags ~obj_x ~obj_y ~obj_z
         ~obj_segnum ~obj_size ~obj_id ~objnum ~console_x ~console_y ~console_z ~console_size
         ~console_fvx ~console_fvy ~console_fvz ~believed_x ~believed_y ~believed_z ~believed_seg
         ~orient ~gun_point_in ~seg_special ~cloak_last_pos ~cloak_last_time ~ai_evaded_in
         ~velocity_x ~velocity_y ~velocity_z)
    ()
    { retc = (fun x -> x)
    ; exnc = (fun exn ->
        Printf.eprintf "OX_SHADOW: ai_frame exception: %s\n" (Exn.to_string exn);
        Out_channel.flush stderr;
        raise exn)
    ; effc = (fun (type a) (eff : a Effect.t) -> ai_frame_effect_handler eff)
    }

let cd_do_ai_frame_d2
      ~ai_state ~rinfo ~frame_time ~frame_count ~game_time ~game_mode ~difficulty_level
      ~overall_agitation ~player_is_dead ~player_exploded ~player_flags ~obj_x ~obj_y ~obj_z
      ~obj_segnum ~obj_size ~obj_id ~objnum ~console_x ~console_y ~console_z ~console_size
      ~console_fvx ~console_fvy ~console_fvz ~believed_x ~believed_y ~believed_z ~believed_seg
      ~orient ~gun_point_in ~seg_special ~cloak_last_pos ~cloak_last_time ~ai_evaded_in
      ~animation_enabled ~current_level_num ~last_missile_camera ~robots_kill_robots_cheat
      ~boss_dying_start_time ~phys_flags_in ~rotthrust_in ~dist_to_last_fired_upon
      ~fire_at_nearby_threshold ~seg_station_enabled ~console_segnum ~velocity_x ~velocity_y
      ~velocity_z
  =
  current_rinfo := rinfo; current_ai_state := ai_state;
  Effect.Deep.match_with
    (fun () ->
       Ox_ai_frame.do_ai_frame_d2
         ~ai_state ~rinfo ~frame_time ~frame_count ~game_time ~game_mode ~difficulty_level
         ~overall_agitation ~player_is_dead ~player_exploded ~player_flags ~obj_x ~obj_y ~obj_z
         ~obj_segnum ~obj_size ~obj_id ~objnum ~console_x ~console_y ~console_z ~console_size
         ~console_fvx ~console_fvy ~console_fvz ~believed_x ~believed_y ~believed_z ~believed_seg
         ~orient ~gun_point_in ~seg_special ~cloak_last_pos ~cloak_last_time ~ai_evaded_in
         ~animation_enabled ~current_level_num ~last_missile_camera ~robots_kill_robots_cheat
         ~boss_dying_start_time ~phys_flags_in ~rotthrust_in ~dist_to_last_fired_upon
         ~fire_at_nearby_threshold ~seg_station_enabled ~console_segnum ~velocity_x ~velocity_y
         ~velocity_z)
    ()
    { retc = (fun x -> x)
    ; exnc = (fun exn ->
        Printf.eprintf "OX_SHADOW: ai_frame exception: %s\n" (Exn.to_string exn);
        Out_channel.flush stderr;
        raise exn)
    ; effc = (fun (type a) (eff : a Effect.t) -> ai_frame_effect_handler eff)
    }

let cd_init_ai_for_ship game_time segnum pos_x pos_y pos_z =
  Ox_ai_frame.init_ai_for_ship ~game_time ~segnum ~pos_x ~pos_y ~pos_z

let cd_init_robots_for_level_d1 () =
  Ox_ai.init_robots_for_level_d1 ()

let cd_init_robots_for_level_d2 difficulty_level =
  Ox_ai.init_robots_for_level_d2 ~difficulty_level

(* -- teleport_boss bridge ------------------------------------------------ *)

(* C externals for physics_sim effects needed by teleport_boss *)
external ps_compute_segment_center : int -> int * int * int
  = "cd_ox_effect_ps_compute_segment_center"

external ps_vm_vector_2_matrix_orient
  :  int -> int -> int -> int -> int -> int
  -> int * int * int * int * int * int * int * int * int
  = "cd_ox_effect_ps_vm_vector_2_matrix_orient_bytecode"
    "cd_ox_effect_ps_vm_vector_2_matrix_orient"

let teleport_boss_effect_handler (type a) (eff : a Effect.t)
  : ((a, 'b) Effect.Deep.continuation -> 'b) option
  =
  match eff with
  | Ox_physics_sim.Compute_segment_center seg ->
    Some (fun k -> Effect.Deep.continue k (ps_compute_segment_center seg))
  | Ox_physics_sim.Vm_vector_2_matrix_orient (vx, vy, vz, ux, uy, uz) ->
    Some (fun k -> Effect.Deep.continue k (ps_vm_vector_2_matrix_orient vx vy vz ux uy uz))
  | (eff : a Effect.t) -> Misc.effc eff

let cd_teleport_boss
      num_boss_teleport_segs highest_segment_index
      player_pos_x player_pos_y player_pos_z
      boss_teleport_segs =
  Effect.Deep.match_with
    (fun () ->
       Ox_ai.teleport_boss
         ~num_boss_teleport_segs ~highest_segment_index
         ~player_pos_x ~player_pos_y ~player_pos_z
         ~boss_teleport_segs)
    ()
    { retc = (fun x -> x)
    ; exnc = (fun exn ->
        Printf.eprintf "OX: teleport_boss exception: %s\n" (Exn.to_string exn);
        Out_channel.flush stderr;
        (* Return dummy result: segnum=0, pos=0,0,0, identity orient *)
        [| 0; 0; 0; 0; 0x10000; 0; 0; 0; 0x10000; 0; 0; 0; 0x10000 |])
    ; effc = (fun (type a) (eff : a Effect.t) -> teleport_boss_effect_handler eff)
    }

let register_callbacks () =
  Callback.register "cd_do_ai_frame_d1" cd_do_ai_frame_d1;
  Callback.register "cd_do_ai_frame_d2" cd_do_ai_frame_d2;
  Callback.register "cd_init_ai_for_ship" cd_init_ai_for_ship;
  Callback.register "cd_init_robots_for_level_d1" cd_init_robots_for_level_d1;
  Callback.register "cd_init_robots_for_level_d2" cd_init_robots_for_level_d2;
  Callback.register "cd_teleport_boss" cd_teleport_boss
;;
