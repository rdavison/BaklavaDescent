(* Bridge adapter for AI frame logic (do_ai_frame + ai_do_actual_firing_stuff).
   Uses algebraic effects: OCaml performs effects, C handler executes them. *)

(* Effect externals — called from OCaml effect handler, dispatch to C *)
external effect_ai_multiplayer_awareness
  :  int
  -> int
  = "cd_ox_effect_af_multiplayer_awareness"

external effect_do_ai_robot_hit_attack : unit -> unit = "cd_ox_effect_af_robot_hit_attack"

external effect_ai_fire_laser_at_player
  :  int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> unit
  = "cd_ox_effect_af_fire_laser_bytecode" "cd_ox_effect_af_fire_laser"

external effect_calc_gun_point : int -> int * int * int = "cd_ox_effect_af_calc_gun_point"

external effect_create_path_to_player
  :  int
  -> int
  -> unit
  = "cd_ox_effect_af_create_path_to_player"

external effect_create_path_to_station
  :  int
  -> unit
  = "cd_ox_effect_af_create_path_to_station"

external effect_create_n_segment_path
  :  int
  -> int
  -> unit
  = "cd_ox_effect_af_create_n_segment_path"

external effect_create_n_segment_path_to_door
  :  int
  -> int
  -> unit
  = "cd_ox_effect_af_create_n_segment_path_to_door"

external effect_attempt_to_resume_path
  :  unit
  -> unit
  = "cd_ox_effect_af_attempt_to_resume_path"

external effect_ai_follow_path
  :  int
  -> int
  -> int
  -> int
  -> int
  -> unit
  = "cd_ox_effect_af_ai_follow_path"

external effect_move_towards_segment_center
  :  unit
  -> unit
  = "cd_ox_effect_af_move_towards_segment_center"

external effect_compute_vis_and_vec
  :  int
  -> int
  -> int
  -> int * int * int * int * int
  = "cd_ox_effect_af_compute_vis_and_vec"

external effect_ai_multi_send_robot_position
  :  int
  -> unit
  = "cd_ox_effect_af_multi_send_robot_position"

external effect_do_boss_stuff : int -> unit = "cd_ox_effect_af_do_boss_stuff"
external effect_p_rand : unit -> int = "cd_ox_effect_af_p_rand"

external effect_make_random_vector
  :  unit
  -> int * int * int
  = "cd_ox_effect_af_make_random_vector"

external effect_object_to_object_visibility
  :  unit
  -> int
  = "cd_ox_effect_af_object_to_object_visibility"

external effect_do_snipe_frame
  :  int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> unit
  = "cd_ox_effect_af_do_snipe_frame_bytecode" "cd_ox_effect_af_do_snipe_frame"

external effect_do_escort_frame : int -> int -> int = "cd_ox_effect_af_do_escort_frame"

external effect_do_thief_frame
  :  int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> unit
  = "cd_ox_effect_af_do_thief_frame_bytecode" "cd_ox_effect_af_do_thief_frame"

external effect_do_any_robot_dying_frame
  :  unit
  -> int
  = "cd_ox_effect_af_do_any_robot_dying_frame"

external effect_make_nearby_robot_snipe
  :  unit
  -> unit
  = "cd_ox_effect_af_make_nearby_robot_snipe"

external effect_openable_doors_in_segment
  :  unit
  -> int
  = "cd_ox_effect_af_openable_doors_in_segment"

external effect_move_away_from_player
  :  unit
  -> unit
  = "cd_ox_effect_af_move_away_from_player"

external effect_invalidate_escort_goal
  :  unit
  -> unit
  = "cd_ox_effect_af_invalidate_escort_goal"

external effect_laser_create_new_easy
  :  int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> unit
  = "cd_ox_effect_af_laser_create_new_easy_bytecode"
    "cd_ox_effect_af_laser_create_new_easy"

external effect_do_companion_extras
  :  int -> int -> int -> int -> int -> int -> int
  = "cd_ox_effect_af_do_companion_extras_bytecode"
    "cd_ox_effect_af_do_companion_extras"

external effect_do_thief_extras
  :  int -> int -> int -> int -> int -> int
  = "cd_ox_effect_af_do_thief_extras_bytecode"
    "cd_ox_effect_af_do_thief_extras"

external read_af_path_state : unit -> int array = "cd_ox_read_af_path_state"
external read_af_fire_state : unit -> int array = "cd_ox_read_af_fire_state"
external write_af_fire_timers : int -> int -> unit = "cd_ox_write_af_fire_timers"

(* Pathfinding externals — for Ox_aipath effects *)
external fetch_segment_data_c : int -> int array = "cd_ox_fetch_segment_data"
external fetch_wall_data_c : int -> int -> int array = "cd_ox_fetch_wall_data"
external path_fvi_query_c : int array -> int array = "cd_ox_path_fvi_query"
external path_obj_relink_c : int array -> unit = "cd_ox_path_obj_relink"
external path_find_object_seg_c : int -> int -> int -> int = "cd_ox_path_find_object_seg"

(* Effect handler *)
let ai_frame_effect_handler
  : type a. a Effect.t -> ((a, _) Effect.Deep.continuation -> _) option
  =
  fun eff ->
  match eff with
  | Ox_ai_frame.Ai_multiplayer_awareness agitation ->
    Some
      (fun k ->
        let result = effect_ai_multiplayer_awareness agitation in
        Effect.Deep.continue k (result <> 0))
  | Ox_ai_frame.Do_ai_robot_hit_attack ->
    Some
      (fun k ->
        effect_do_ai_robot_hit_attack ();
        Effect.Deep.continue k ())
  | Ox_ai_frame.Ai_fire_laser_at_player (gpx, gpy, gpz, gun_num, fpx, fpy, fpz, nf_in, nf2_in) ->
    Some
      (fun k ->
        write_af_fire_timers nf_in nf2_in;
        effect_ai_fire_laser_at_player gpx gpy gpz gun_num fpx fpy fpz;
        let fs = read_af_fire_state () in
        Effect.Deep.continue k (fs.(0), fs.(1), fs.(2)))
  | Ox_ai_frame.Calc_gun_point gun_num ->
    Some
      (fun k ->
        let result = effect_calc_gun_point gun_num in
        Effect.Deep.continue k result)
  | Ox_ai_frame.Create_path_to_player (max_length, safety_flag) ->
    Some
      (fun k ->
        effect_create_path_to_player max_length safety_flag;
        let ps = read_af_path_state () in
        Effect.Deep.continue k ps)
  | Ox_ai_frame.Create_path_to_station max_time ->
    Some
      (fun k ->
        effect_create_path_to_station max_time;
        let ps = read_af_path_state () in
        Effect.Deep.continue k ps)
  | Ox_ai_frame.Create_n_segment_path (length, avoid_seg) ->
    Some
      (fun k ->
        effect_create_n_segment_path length avoid_seg;
        let ps = read_af_path_state () in
        Effect.Deep.continue k ps)
  | Ox_ai_frame.Create_n_segment_path_to_door (length, avoid_seg) ->
    Some
      (fun k ->
        effect_create_n_segment_path_to_door length avoid_seg;
        let ps = read_af_path_state () in
        Effect.Deep.continue k ps)
  | Ox_ai_frame.Attempt_to_resume_path ->
    Some
      (fun k ->
        effect_attempt_to_resume_path ();
        let ps = read_af_path_state () in
        Effect.Deep.continue k ps)
  | Ox_ai_frame.Ai_follow_path (vis, prev_vis, vtpx, vtpy, vtpz) ->
    Some
      (fun k ->
        effect_ai_follow_path vis prev_vis vtpx vtpy vtpz;
        let ps = read_af_path_state () in
        Effect.Deep.continue k ps)
  | Ox_ai_frame.Move_towards_segment_center ->
    Some
      (fun k ->
        effect_move_towards_segment_center ();
        Effect.Deep.continue k ())
  | Ox_ai_frame.Compute_vis_and_vec (vpx, vpy, vpz) ->
    Some
      (fun k ->
        let result = effect_compute_vis_and_vec vpx vpy vpz in
        Effect.Deep.continue k result)
  | Ox_ai_frame.Ai_multi_send_robot_position flag ->
    Some
      (fun k ->
        effect_ai_multi_send_robot_position flag;
        Effect.Deep.continue k ())
  | Ox_ai_frame.Do_boss_stuff pv ->
    Some
      (fun k ->
        effect_do_boss_stuff pv;
        Effect.Deep.continue k ())
  | Ox_ai_frame.P_Rand ->
    Some
      (fun k ->
        let result = effect_p_rand () in
        Effect.Deep.continue k result)
  | Ox_ai_frame.Make_random_vector ->
    Some
      (fun k ->
        let result = effect_make_random_vector () in
        Effect.Deep.continue k result)
  | Ox_ai_frame.Object_to_object_visibility ->
    Some
      (fun k ->
        let result = effect_object_to_object_visibility () in
        Effect.Deep.continue k result)
  | Ox_ai_frame.Do_snipe_frame (dist, vis, vtpx, vtpy, vtpz, mode) ->
    Some
      (fun k ->
        effect_do_snipe_frame dist vis vtpx vtpy vtpz mode;
        let ps = read_af_path_state () in
        Effect.Deep.continue k ps)
  | Ox_ai_frame.Do_escort_frame (dist, vis) ->
    Some
      (fun k ->
        let _new_mode = effect_do_escort_frame dist vis in
        let ps = read_af_path_state () in
        Effect.Deep.continue k ps)
  | Ox_ai_frame.Do_thief_frame (dist, vis, vtpx, vtpy, vtpz, pat, pat_time) ->
    Some
      (fun k ->
        effect_do_thief_frame dist vis vtpx vtpy vtpz pat pat_time;
        let ps = read_af_path_state () in
        Effect.Deep.continue k ps)
  | Ox_ai_frame.Do_any_robot_dying_frame ->
    Some
      (fun k ->
        let result = effect_do_any_robot_dying_frame () in
        Effect.Deep.continue k (result <> 0))
  | Ox_ai_frame.Make_nearby_robot_snipe ->
    Some
      (fun k ->
        effect_make_nearby_robot_snipe ();
        Effect.Deep.continue k ())
  | Ox_ai_frame.Move_away_from_player ->
    Some
      (fun k ->
        effect_move_away_from_player ();
        Effect.Deep.continue k ())
  | Ox_ai_frame.Openable_doors_in_segment ->
    Some
      (fun k ->
        let result = effect_openable_doors_in_segment () in
        Effect.Deep.continue k result)
  | Ox_ai_frame.Invalidate_escort_goal ->
    Some
      (fun k ->
        effect_invalidate_escort_goal ();
        Effect.Deep.continue k ())
  | Ox_ai_frame.Laser_create_new_easy (fvx, fvy, fvz, fpx, fpy, fpz, objnum, weapon_id) ->
    Some
      (fun k ->
        effect_laser_create_new_easy fvx fvy fvz fpx fpy fpz objnum weapon_id;
        Effect.Deep.continue k ())
  | Ox_ai_frame.Do_companion_extras (dist, vis, vtpx, vtpy, vtpz, mode, nf_in, nf2_in) ->
    Some
      (fun k ->
        write_af_fire_timers nf_in nf2_in;
        let nf = effect_do_companion_extras dist vis vtpx vtpy vtpz mode in
        Effect.Deep.continue k nf)
  | Ox_ai_frame.Do_thief_extras (dist, vis, vtpx, vtpy, vtpz, nf_in, nf2_in) ->
    Some
      (fun k ->
        write_af_fire_timers nf_in nf2_in;
        let nf = effect_do_thief_extras dist vis vtpx vtpy vtpz in
        Effect.Deep.continue k nf)
  (* Pathfinding effects from Ox_aipath *)
  | Ox_gameseg.Fetch_segment_data segnum ->
    Some
      (fun k ->
        let data = fetch_segment_data_c segnum in
        Effect.Deep.continue k data)
  | Ox_aipath.Fetch_wall_data (segnum, sidenum) ->
    Some
      (fun k ->
        let data = fetch_wall_data_c segnum sidenum in
        Effect.Deep.continue k data)
  | Ox_aipath.Path_p_rand ->
    Some
      (fun k ->
        let result = effect_p_rand () in
        Effect.Deep.continue k result)
  | Ox_aipath.Path_fvi_query params ->
    Some
      (fun k ->
        let result = path_fvi_query_c params in
        Effect.Deep.continue k result)
  | Ox_aipath.Path_obj_relink params ->
    Some
      (fun k ->
        path_obj_relink_c params;
        Effect.Deep.continue k ())
  | Ox_aipath.Path_move_to_legal_spot ->
    Some
      (fun k ->
        (* Rare edge case — currently a no-op *)
        Effect.Deep.continue k ())
  | Ox_aipath.Path_find_object_seg (x, y, z) ->
    Some
      (fun k ->
        let seg = path_find_object_seg_c x y z in
        Effect.Deep.continue k seg)
  | _ -> None
;;

(* D1 bridge function *)
let cd_do_ai_frame_d1
      ai_state
      rinfo
      frame_time
      frame_count
      game_time
      game_mode
      difficulty_level
      overall_agitation
      player_is_dead
      player_exploded
      player_flags
      obj_x
      obj_y
      obj_z
      obj_segnum
      obj_size
      obj_id
      objnum
      console_x
      console_y
      console_z
      console_size
      believed_x
      believed_y
      believed_z
      believed_seg
      orient
      gun_point_in
      seg_special
      cloak_last_pos
      cloak_last_time
      ai_evaded_in
      velocity_x
      velocity_y
      velocity_z
  =
  Effect.Deep.match_with
    (fun () ->
       Ox_ai_frame.do_ai_frame_d1
         ~ai_state
         ~rinfo
         ~frame_time
         ~frame_count
         ~game_time
         ~game_mode
         ~difficulty_level
         ~overall_agitation
         ~player_is_dead
         ~player_exploded
         ~player_flags
         ~obj_x
         ~obj_y
         ~obj_z
         ~obj_segnum
         ~obj_size
         ~obj_id
         ~objnum
         ~console_x
         ~console_y
         ~console_z
         ~console_size
         ~believed_x
         ~believed_y
         ~believed_z
         ~believed_seg
         ~orient
         ~gun_point_in
         ~seg_special
         ~cloak_last_pos
         ~cloak_last_time
         ~ai_evaded_in
         ~velocity_x
         ~velocity_y
         ~velocity_z)
    ()
    { retc = (fun x -> x)
    ; exnc = (fun exn ->
        Printf.eprintf "OX_SHADOW: D1 ai_frame exception: %s\n" (Exn.to_string exn);
        Out_channel.flush stderr;
        let r = Array.create ~len:55 0 in
        r.(43) <- 0x7FFFFFFF;
        r)
    ; effc = (fun (type a) (eff : a Effect.t) -> ai_frame_effect_handler eff)
    }
;;

(* D2 bridge function *)
let cd_do_ai_frame_d2
      ai_state
      rinfo
      frame_time
      frame_count
      game_time
      game_mode
      difficulty_level
      overall_agitation
      player_is_dead
      player_exploded
      player_flags
      obj_x
      obj_y
      obj_z
      obj_segnum
      obj_size
      obj_id
      objnum
      console_x
      console_y
      console_z
      console_size
      believed_x
      believed_y
      believed_z
      believed_seg
      orient
      gun_point_in
      seg_special
      cloak_last_pos
      cloak_last_time
      ai_evaded_in
      animation_enabled
      current_level_num
      last_missile_camera
      robots_kill_robots_cheat
      boss_dying_start_time
      phys_flags_in
      rotthrust_in
      dist_to_last_fired_upon
      fire_at_nearby_threshold
      seg_station_enabled
      console_segnum
      velocity_x
      velocity_y
      velocity_z
  =
  Effect.Deep.match_with
    (fun () ->
       Ox_ai_frame.do_ai_frame_d2
         ~ai_state
         ~rinfo
         ~frame_time
         ~frame_count
         ~game_time
         ~game_mode
         ~difficulty_level
         ~overall_agitation
         ~player_is_dead
         ~player_exploded
         ~player_flags
         ~obj_x
         ~obj_y
         ~obj_z
         ~obj_segnum
         ~obj_size
         ~obj_id
         ~objnum
         ~console_x
         ~console_y
         ~console_z
         ~console_size
         ~believed_x
         ~believed_y
         ~believed_z
         ~believed_seg
         ~orient
         ~gun_point_in
         ~seg_special
         ~cloak_last_pos
         ~cloak_last_time
         ~ai_evaded_in
         ~animation_enabled
         ~current_level_num
         ~last_missile_camera
         ~robots_kill_robots_cheat
         ~boss_dying_start_time
         ~phys_flags_in
         ~rotthrust_in
         ~dist_to_last_fired_upon
         ~fire_at_nearby_threshold
         ~seg_station_enabled
         ~console_segnum
         ~velocity_x
         ~velocity_y
         ~velocity_z)
    ()
    { retc = (fun x -> x)
    ; exnc = (fun exn ->
        Printf.eprintf "OX_SHADOW: D2 ai_frame exception: %s\n" (Exn.to_string exn);
        Out_channel.flush stderr;
        let r = Array.create ~len:62 0 in
        r.(50) <- 0x7FFFFFFF;
        r)
    ; effc = (fun (type a) (eff : a Effect.t) -> ai_frame_effect_handler eff)
    }
;;

let register_callbacks () =
  Callback.register "cd_do_ai_frame_d1" cd_do_ai_frame_d1;
  Callback.register "cd_do_ai_frame_d2" cd_do_ai_frame_d2
;;
