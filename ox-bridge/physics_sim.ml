(* Bridge adapter for physics sim logic (do_physics_sim).
   Uses algebraic effects: OCaml performs effects, C handler executes them. *)

(* Effect externals — called from OCaml effect handler, dispatch to C *)

(* find_vector_intersection:
   Takes packed query (p0xyz, p1xyz, rad, thisobjnum, ignore_list, flags, startseg)
   Returns packed result (fate, hit_pnt xyz, hit_seg, hit_side, hit_side_seg,
   hit_object, wallnorm xyz, n_segs, seglist[]) *)
external effect_find_vector_intersection
  :  int array
  -> int array
  = "cd_ox_effect_ps_find_vector_intersection"

(* collide_object_with_wall:
   Args: hit_speed, wall_seg, wall_side, hit_px, hit_py, hit_pz, obj_flags
   Returns: updated obj_flags *)
external effect_collide_object_with_wall
  :  int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  = "cd_ox_effect_ps_collide_object_with_wall_bytecode"
    "cd_ox_effect_ps_collide_object_with_wall"

(* scrape_object_on_wall:
   Args: wall_seg, wall_side, hit_px, hit_py, hit_pz
   Returns: updated obj_flags *)
external effect_scrape_object_on_wall
  :  int
  -> int
  -> int
  -> int
  -> int
  -> int
  = "cd_ox_effect_ps_scrape_object_on_wall_bytecode"
    "cd_ox_effect_ps_scrape_object_on_wall"

(* collide_two_objects (C fallback for unported handlers):
   Args: hit_objnum, pos_hit_x, pos_hit_y, pos_hit_z
   Returns: (obj_flags, new_vx, new_vy, new_vz) *)
external effect_collide_two_objects
  :  int
  -> int
  -> int
  -> int
  -> int * int * int * int
  = "cd_ox_effect_ps_collide_two_objects"

(* -- Collision handler externals ------------------------------------------ *)

(* Fetch collision data for both this-object and hit-object.
   Args: hit_objnum
   Returns: packed int array with cd_num_fields elements *)
external effect_fetch_collision_data
  :  int
  -> int array
  = "cd_ox_effect_ps_fetch_collision_data"

(* Write back hit object state after OCaml collision handler.
   Args: packed [| objnum; vel_x; vel_y; vel_z; rotvel_x; rotvel_y; rotvel_z;
                   shields; flags |] *)
external effect_write_back_hit_object
  :  int array
  -> unit
  = "cd_ox_effect_ps_write_back_hit_object"

(* Write back this-object (ps_obj) shields and flags after OCaml collision handler. *)
external effect_write_back_this_object
  :  int
  -> int
  -> unit
  = "cd_ox_effect_ps_write_back_this_object"

(* Apply damage to player — calls C's apply_damage_to_player *)
external effect_apply_damage_to_player
  :  int
  -> int
  -> int
  -> unit
  = "cd_ox_effect_ps_apply_damage_to_player"

(* Sound: digi_link_sound_to_pos *)
external effect_play_collision_sound
  :  int
  -> int
  -> int
  -> int
  -> int
  -> unit
  = "cd_ox_effect_ps_play_collision_sound_bytecode"
    "cd_ox_effect_ps_play_collision_sound"

(* add_points_to_score *)
external effect_add_points_to_score
  :  int
  -> unit
  = "cd_ox_effect_ps_add_points_to_score"

(* create_awareness_event *)
external effect_create_awareness_event
  :  int
  -> int
  -> unit
  = "cd_ox_effect_ps_create_awareness_event"

(* -- Damage effect externals (reused from collide_bridge C functions) ----- *)

external effect_increment_kills : unit -> unit = "cd_ox_effect_increment_kills"
external effect_start_boss_death : int -> unit = "cd_ox_effect_start_boss_death"
external effect_explode_object : int -> unit = "cd_ox_effect_explode_object"

external effect_send_net_robot_explode
  :  int
  -> int
  -> unit
  = "cd_ox_effect_send_net_robot_explode"

external effect_multi_explode_robot_sub
  :  int
  -> int
  -> bool
  = "cd_ox_effect_multi_explode_robot_sub"

external effect_explode_object_delay
  :  int
  -> int
  -> unit
  = "cd_ox_effect_explode_object_delay"

(* D2 damage externals *)
external effect_set_boss_hit_time : unit -> unit = "cd_ox_effect_set_boss_hit_time"
external effect_query_player_dead_or_no_shields
  :  unit -> bool = "cd_ox_effect_query_player_dead_or_no_shields"
external effect_query_multi_all_players_alive
  :  unit -> bool = "cd_ox_effect_query_multi_all_players_alive"
external effect_do_final_boss_hacks : unit -> unit = "cd_ox_effect_do_final_boss_hacks"
external effect_multi_send_finish_game : unit -> unit = "cd_ox_effect_multi_send_finish_game"
external effect_save_stolen_items : unit -> unit = "cd_ox_effect_save_stolen_items"
external effect_restore_stolen_items : unit -> unit = "cd_ox_effect_restore_stolen_items"
external effect_clear_stolen_items : unit -> unit = "cd_ox_effect_clear_stolen_items"
external effect_multi_explode_d2 : int -> int -> bool -> bool = "cd_ox_effect_multi_explode_d2"
external effect_multi_send_robot_explode_d2
  :  int -> int -> bool -> unit = "cd_ox_effect_multi_send_robot_explode_d2"
external effect_start_robot_death_sequence : int -> unit = "cd_ox_effect_start_robot_death_sequence"
external effect_special_reactor_stuff : unit -> unit = "cd_ox_effect_special_reactor_stuff"

(* Controlcen/player damage externals *)
external effect_show_hud_invul_message : unit -> unit = "cd_ox_effect_show_hud_invul_message"
external effect_controlcen_been_hit : unit -> unit = "cd_ox_effect_controlcen_been_hit"
external effect_do_controlcen_destroyed : int -> unit = "cd_ox_effect_do_controlcen_destroyed"
external effect_add_controlcen_score : unit -> unit = "cd_ox_effect_add_controlcen_score"
external effect_multi_send_destroy_controlcen : int -> int -> unit
  = "cd_ox_effect_multi_send_destroy_controlcen"
external effect_sound_controlcen_destroyed : int -> unit
  = "cd_ox_effect_sound_controlcen_destroyed"
external effect_explode_object_delay_clutter : int -> int -> unit
  = "cd_ox_effect_explode_object_delay_clutter"
external effect_explode_object_delay_controlcen : int -> int -> unit
  = "cd_ox_effect_explode_object_delay_controlcen"
external effect_palette_flash_d1 : int -> int -> int -> unit
  = "cd_ox_effect_palette_flash_d1"
external effect_set_player_dead_d1 : int -> unit = "cd_ox_effect_set_player_dead_d1"
external effect_palette_flash_d2 : int -> int -> int -> unit
  = "cd_ox_effect_palette_flash_d2"
external effect_set_player_dead_d2 : int -> unit = "cd_ox_effect_set_player_dead_d2"
external effect_set_buddy_sorry_time : unit -> unit = "cd_ox_effect_set_buddy_sorry_time"

(* Phase 2 collision effect externals *)
external effect_create_object_explosion
  :  int -> int -> int -> int -> int -> int -> int
  = "cd_ox_effect_ps_create_object_explosion_bytecode"
    "cd_ox_effect_ps_create_object_explosion"

external effect_explode_badass_weapon : int -> unit
  = "cd_ox_effect_ps_explode_badass_weapon"

external effect_obj_attach : int -> int -> unit
  = "cd_ox_effect_ps_obj_attach"

external effect_do_ai_robot_hit : int -> int -> unit
  = "cd_ox_effect_ps_do_ai_robot_hit"

external effect_do_ai_robot_hit_attack
  :  int -> int -> int -> int -> int -> unit
  = "cd_ox_effect_ps_do_ai_robot_hit_attack_bytecode"
    "cd_ox_effect_ps_do_ai_robot_hit_attack"

external effect_ai_do_cloak_stuff : unit -> unit
  = "cd_ox_effect_ps_ai_do_cloak_stuff"

external effect_hostage_rescue : int -> unit
  = "cd_ox_effect_ps_hostage_rescue"

external effect_multi_robot_request_change : int -> int -> unit
  = "cd_ox_effect_ps_multi_robot_request_change"

external effect_multi_send_remobj : int -> unit
  = "cd_ox_effect_ps_multi_send_remobj"

external effect_multi_send_play_sound : int -> int -> unit
  = "cd_ox_effect_ps_multi_send_play_sound"

external effect_set_weapon_last_hitobj : int -> int -> unit
  = "cd_ox_effect_ps_set_weapon_last_hitobj"

external effect_set_boss_hit_this_frame : unit -> unit
  = "cd_ox_effect_ps_set_boss_hit_this_frame"

external effect_set_weapon_flags : int -> int -> unit
  = "cd_ox_effect_ps_set_weapon_flags"

external effect_set_weapon_lifeleft : int -> int -> unit
  = "cd_ox_effect_ps_set_weapon_lifeleft"

external effect_detect_escort_goal : int -> unit
  = "cd_ox_effect_ps_detect_escort_goal"

external effect_attempt_to_steal : int -> int -> unit
  = "cd_ox_effect_ps_attempt_to_steal"

external effect_create_smart_children : int -> int -> unit
  = "cd_ox_effect_ps_create_smart_children"

external effect_smega_rock_stuff : unit -> unit
  = "cd_ox_effect_ps_smega_rock_stuff"

external effect_set_robot_gauss_spin : int -> unit
  = "cd_ox_effect_ps_set_robot_gauss_spin"

external effect_set_bump_skip_ai_count : int -> unit
  = "cd_ox_effect_ps_set_bump_skip_ai_count"

external effect_do_boss_weapon_collision : int -> int -> int
  = "cd_ox_effect_ps_do_boss_weapon_collision"

external effect_create_badass_explosion_for_boss
  :  int -> int -> int -> int -> int -> unit
  = "cd_ox_effect_ps_create_badass_explosion_for_boss_bytecode"
    "cd_ox_effect_ps_create_badass_explosion_for_boss"

external effect_obj_relink : int -> int -> unit = "cd_ox_effect_ps_obj_relink"
external effect_find_object_seg : int -> int = "cd_ox_effect_ps_find_object_seg"
external effect_update_object_seg : int -> unit = "cd_ox_effect_ps_update_object_seg"

external effect_find_point_seg
  :  int
  -> int
  -> int
  -> int
  -> int
  = "cd_ox_effect_ps_find_point_seg"

external effect_get_seg_masks
  :  int
  -> int
  -> int
  -> int
  -> int
  = "cd_ox_effect_ps_get_seg_masks"

external effect_compute_segment_center
  :  int
  -> int * int * int
  = "cd_ox_effect_ps_compute_segment_center"

external effect_add_stuck_object : int -> int -> unit = "cd_ox_effect_ps_add_stuck_object"

external effect_find_connect_side
  :  int
  -> int
  -> int
  = "cd_ox_effect_ps_find_connect_side"

external effect_wall_is_doorway : int -> int -> int = "cd_ox_effect_ps_wall_is_doorway"

(* create_abs_vertex_lists_and_dist:
   Args: seg, side, start_px, start_py, start_pz
   Returns: (dist, normal_x, normal_y, normal_z) *)
external effect_create_abs_vertex_lists_and_dist
  :  int
  -> int
  -> int
  -> int
  -> int
  -> int * int * int * int
  = "cd_ox_effect_ps_create_abs_vertex_lists_and_dist"

(* D2 only: check if tmap has forcefield flag *)
external effect_tmap_is_force_field
  :  int
  -> int
  -> int
  = "cd_ox_effect_ps_tmap_is_force_field"

(* D2 only: vm_vector_2_matrix for weapon orient on bounce *)
external effect_vm_vector_2_matrix_orient
  :  int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int * int * int * int * int * int * int * int * int
  = "cd_ox_effect_ps_vm_vector_2_matrix_orient_bytecode"
    "cd_ox_effect_ps_vm_vector_2_matrix_orient"

(* -- Collision sub-effect handler ----------------------------------------- *)
(* Handles effects performed by Ox_collide collision functions *)

let collision_effect_handler (type a) ~is_d2 (eff : a Effect.t)
  : ((a, _) Effect.Deep.continuation -> _) option
  =
  match eff with
  (* New collision effects *)
  | Ox_collide.Add_points_to_score score ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_add_points_to_score score;
      Effect.Deep.continue k ())
  | Ox_collide.Play_collision_sound (sid, seg, px, py, pz) ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_play_collision_sound sid seg px py pz;
      Effect.Deep.continue k ())
  | Ox_collide.Create_awareness_event (objnum, atype) ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_create_awareness_event objnum atype;
      Effect.Deep.continue k ())
  | Ox_collide.Write_back_hit_object packed ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_write_back_hit_object packed;
      Effect.Deep.continue k ())
  | Ox_collide.Apply_damage_to_player (player_objnum, killer_objnum, damage) ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_apply_damage_to_player player_objnum killer_objnum damage;
      Effect.Deep.continue k ())
  (* D1 robot damage effects *)
  | Ox_collide.Increment_kills ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_increment_kills ();
      Effect.Deep.continue k ())
  | Ox_collide.Start_boss_death obj_id ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_start_boss_death obj_id;
      Effect.Deep.continue k ())
  | Ox_collide.Explode_object obj_id ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_explode_object obj_id;
      Effect.Deep.continue k ())
  | Ox_collide.Send_net_robot_explode (obj_id, killer) ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_send_net_robot_explode obj_id killer;
      Effect.Deep.continue k ())
  | Ox_collide.Query_multi_explode (obj_id, killer) ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      let r = effect_multi_explode_robot_sub obj_id killer in
      Effect.Deep.continue k r)
  | Ox_collide.Explode_object_delay (obj_id, delay) ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_explode_object_delay obj_id delay;
      Effect.Deep.continue k ())
  (* D2 robot damage effects *)
  | Ox_collide.Set_boss_hit_time ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_set_boss_hit_time ();
      Effect.Deep.continue k ())
  | Ox_collide.Query_player_dead_or_no_shields ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      let r = effect_query_player_dead_or_no_shields () in
      Effect.Deep.continue k r)
  | Ox_collide.Query_multi_all_players_alive ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      let r = effect_query_multi_all_players_alive () in
      Effect.Deep.continue k r)
  | Ox_collide.Do_final_boss_hacks ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_do_final_boss_hacks ();
      Effect.Deep.continue k ())
  | Ox_collide.Multi_send_finish_game ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_multi_send_finish_game ();
      Effect.Deep.continue k ())
  | Ox_collide.Save_stolen_items ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_save_stolen_items ();
      Effect.Deep.continue k ())
  | Ox_collide.Restore_stolen_items ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_restore_stolen_items ();
      Effect.Deep.continue k ())
  | Ox_collide.Clear_stolen_items ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_clear_stolen_items ();
      Effect.Deep.continue k ())
  | Ox_collide.Query_multi_explode_d2 (obj_id, killer, is_thief) ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      let r = effect_multi_explode_d2 obj_id killer is_thief in
      Effect.Deep.continue k r)
  | Ox_collide.Multi_send_robot_explode_d2 (obj_id, killer, is_thief) ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_multi_send_robot_explode_d2 obj_id killer is_thief;
      Effect.Deep.continue k ())
  | Ox_collide.Start_robot_death_sequence obj_id ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_start_robot_death_sequence obj_id;
      Effect.Deep.continue k ())
  | Ox_collide.Special_reactor_stuff ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_special_reactor_stuff ();
      Effect.Deep.continue k ())
  (* Controlcen damage effects *)
  | Ox_collide.Show_hud_invul_message ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_show_hud_invul_message ();
      Effect.Deep.continue k ())
  | Ox_collide.Controlcen_been_hit ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_controlcen_been_hit ();
      Effect.Deep.continue k ())
  | Ox_collide.Do_controlcen_destroyed obj_id ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_do_controlcen_destroyed obj_id;
      Effect.Deep.continue k ())
  | Ox_collide.Add_controlcen_score ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_add_controlcen_score ();
      Effect.Deep.continue k ())
  | Ox_collide.Multi_send_destroy_controlcen (obj_id, who_id) ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_multi_send_destroy_controlcen obj_id who_id;
      Effect.Deep.continue k ())
  | Ox_collide.Sound_controlcen_destroyed obj_id ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_sound_controlcen_destroyed obj_id;
      Effect.Deep.continue k ())
  (* Player damage effects *)
  | Ox_collide.Palette_flash (r, g, b) ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      if is_d2 then effect_palette_flash_d2 r g b
      else effect_palette_flash_d1 r g b;
      Effect.Deep.continue k ())
  | Ox_collide.Set_player_dead killer ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      if is_d2 then effect_set_player_dead_d2 killer
      else effect_set_player_dead_d1 killer;
      Effect.Deep.continue k ())
  | Ox_collide.Set_buddy_sorry_time ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_set_buddy_sorry_time ();
      Effect.Deep.continue k ())
  (* Phase 2 collision effects *)
  | Ox_collide.Create_object_explosion (seg, px, py, pz, sz, vclip) ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      let r = effect_create_object_explosion seg px py pz sz vclip in
      Effect.Deep.continue k r)
  | Ox_collide.Explode_badass_weapon objnum ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_explode_badass_weapon objnum;
      Effect.Deep.continue k ())
  | Ox_collide.Obj_attach (parent, child) ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_obj_attach parent child;
      Effect.Deep.continue k ())
  | Ox_collide.Do_ai_robot_hit (robot, awareness) ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_do_ai_robot_hit robot awareness;
      Effect.Deep.continue k ())
  | Ox_collide.Do_ai_robot_hit_attack (robot, player, px, py, pz) ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_do_ai_robot_hit_attack robot player px py pz;
      Effect.Deep.continue k ())
  | Ox_collide.Ai_do_cloak_stuff ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_ai_do_cloak_stuff ();
      Effect.Deep.continue k ())
  | Ox_collide.Hostage_rescue hostage_id ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_hostage_rescue hostage_id;
      Effect.Deep.continue k ())
  | Ox_collide.Multi_robot_request_change (robot, player_id) ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_multi_robot_request_change robot player_id;
      Effect.Deep.continue k ())
  | Ox_collide.Multi_send_remobj objnum ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_multi_send_remobj objnum;
      Effect.Deep.continue k ())
  | Ox_collide.Multi_send_play_sound (sid, vol) ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_multi_send_play_sound sid vol;
      Effect.Deep.continue k ())
  | Ox_collide.Set_weapon_last_hitobj (wep, hit) ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_set_weapon_last_hitobj wep hit;
      Effect.Deep.continue k ())
  | Ox_collide.Set_boss_hit_this_frame ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_set_boss_hit_this_frame ();
      Effect.Deep.continue k ())
  | Ox_collide.Set_weapon_flags (wep, flags) ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_set_weapon_flags wep flags;
      Effect.Deep.continue k ())
  | Ox_collide.Set_weapon_lifeleft (wep, lifeleft) ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_set_weapon_lifeleft wep lifeleft;
      Effect.Deep.continue k ())
  | Ox_collide.Detect_escort_goal objnum ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_detect_escort_goal objnum;
      Effect.Deep.continue k ())
  | Ox_collide.Attempt_to_steal (robot, player_id) ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_attempt_to_steal robot player_id;
      Effect.Deep.continue k ())
  | Ox_collide.Create_smart_children (robot, num) ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_create_smart_children robot num;
      Effect.Deep.continue k ())
  | Ox_collide.Smega_rock_stuff ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_smega_rock_stuff ();
      Effect.Deep.continue k ())
  | Ox_collide.Set_robot_gauss_spin robot ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_set_robot_gauss_spin robot;
      Effect.Deep.continue k ())
  | Ox_collide.Set_bump_skip_ai_count robot ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_set_bump_skip_ai_count robot;
      Effect.Deep.continue k ())
  | Ox_collide.Do_boss_weapon_collision (robot, weapon) ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      let r = effect_do_boss_weapon_collision robot weapon in
      Effect.Deep.continue k r)
  | Ox_collide.Create_badass_explosion_for_boss (wep, seg, px, py, pz) ->
    Some (fun (k : (a, _) Effect.Deep.continuation) ->
      effect_create_badass_explosion_for_boss wep seg px py pz;
      Effect.Deep.continue k ())
  | _ -> None
;;

(* -- Physics sim effect handler ------------------------------------------- *)

let physics_sim_effect_handler (type a) ~is_d2 (eff : a Effect.t)
  : ((a, _) Effect.Deep.continuation -> _) option
  =
  match eff with
  | Ox_physics_sim.Find_vector_intersection
      (p0x, p0y, p0z, p1x, p1y, p1z, rad, thisobjnum, ignore_list, flags, startseg) ->
    Some
      (fun k ->
        try
        let query =
          [| p0x
           ; p0y
           ; p0z
           ; p1x
           ; p1y
           ; p1z
           ; rad
           ; thisobjnum
           ; flags
           ; startseg
           ; Array.length ignore_list
          |]
        in
        let packed = Array.append query ignore_list in
        let result = effect_find_vector_intersection packed in
        (* Unpack: fate, hit_pnt xyz, hit_seg, hit_side, hit_side_seg,
           hit_object, wallnorm xyz, n_segs, seglist[] *)
        let fate = result.(0) in
        let hit_px = result.(1) in
        let hit_py = result.(2) in
        let hit_pz = result.(3) in
        let hit_seg = result.(4) in
        let hit_side = result.(5) in
        let hit_side_seg = result.(6) in
        let hit_object = result.(7) in
        let wn_x = result.(8) in
        let wn_y = result.(9) in
        let wn_z = result.(10) in
        let n_segs = result.(11) in
        let seglist = Array.sub result ~pos:12 ~len:n_segs in
        Effect.Deep.continue
          k
          ( fate
          , hit_px
          , hit_py
          , hit_pz
          , hit_seg
          , hit_side
          , hit_side_seg
          , hit_object
          , wn_x
          , wn_y
          , wn_z
          , n_segs
          , seglist )
        with Invalid_argument _ ->
          Printf.eprintf "OX_SHADOW: FVI exception, returning HIT_NONE\n";
          Out_channel.flush stderr;
          (* Return HIT_NONE with dummy values *)
          Effect.Deep.continue k (0, p0x, p0y, p0z, startseg, 0, -1, -1, 0, 0, 0, 0, [||]))
  | Ox_physics_sim.Collide_object_with_wall
      (hit_speed, wall_seg, wall_side, hit_px, hit_py, hit_pz, obj_flags) ->
    Some
      (fun k ->
        let result =
          effect_collide_object_with_wall
            hit_speed
            wall_seg
            wall_side
            hit_px
            hit_py
            hit_pz
            obj_flags
        in
        Effect.Deep.continue k result)
  | Ox_physics_sim.Scrape_object_on_wall (wall_seg, wall_side, hit_px, hit_py, hit_pz) ->
    Some
      (fun k ->
        let result =
          effect_scrape_object_on_wall wall_seg wall_side hit_px hit_py hit_pz
        in
        Effect.Deep.continue k result)
  | Ox_physics_sim.Collide_two_objects (hit_objnum, pos_hit_x, pos_hit_y, pos_hit_z) ->
    Some
      (fun k ->
        (* Fetch collision data from C for both objects *)
        let cd = effect_fetch_collision_data hit_objnum in
        (* Try OCaml dispatch *)
        let dispatch_fn =
          if is_d2 then Ox_collide.collide_two_objects_d2
          else Ox_collide.collide_two_objects_d1
        in
        let ocaml_result =
          Effect.Deep.match_with
            (fun () -> dispatch_fn ~cd ~hit_px:pos_hit_x ~hit_py:pos_hit_y ~hit_pz:pos_hit_z)
            ()
            { retc = (fun x -> x)
            ; exnc = raise
            ; effc = (fun (type b) (eff : b Effect.t) ->
                collision_effect_handler ~is_d2 eff)
            }
        in
        let result =
          match ocaml_result with
          | Some (flags, vx, vy, vz, shields) ->
            effect_write_back_this_object shields flags;
            (flags, vx, vy, vz)
          | None ->
            (* Fall back to C for unported collision types *)
            effect_collide_two_objects hit_objnum pos_hit_x pos_hit_y pos_hit_z
        in
        Effect.Deep.continue k result)
  | Ox_physics_sim.Obj_relink (objnum, new_seg) ->
    Some
      (fun k ->
        effect_obj_relink objnum new_seg;
        Effect.Deep.continue k ())
  | Ox_physics_sim.Find_object_seg objnum ->
    Some
      (fun k ->
        let result = effect_find_object_seg objnum in
        Effect.Deep.continue k result)
  | Ox_physics_sim.Update_object_seg objnum ->
    Some
      (fun k ->
        effect_update_object_seg objnum;
        Effect.Deep.continue k ())
  | Ox_physics_sim.Find_point_seg (px, py, pz, seg) ->
    Some
      (fun k ->
        let result = effect_find_point_seg px py pz seg in
        Effect.Deep.continue k result)
  | Ox_physics_sim.Get_seg_masks (px, py, pz, seg) ->
    Some
      (fun k ->
        let result = effect_get_seg_masks px py pz seg in
        Effect.Deep.continue k result)
  | Ox_physics_sim.Compute_segment_center seg ->
    Some
      (fun k ->
        let result = effect_compute_segment_center seg in
        Effect.Deep.continue k result)
  | Ox_physics_sim.Add_stuck_object (wall_seg, wall_side) ->
    Some
      (fun k ->
        effect_add_stuck_object wall_seg wall_side;
        Effect.Deep.continue k ())
  | Ox_physics_sim.Find_connect_side (seg1, seg2) ->
    Some
      (fun k ->
        let result = effect_find_connect_side seg1 seg2 in
        Effect.Deep.continue k result)
  | Ox_physics_sim.Wall_is_doorway (seg, side) ->
    Some
      (fun k ->
        let result = effect_wall_is_doorway seg side in
        Effect.Deep.continue k result)
  | Ox_physics_sim.Create_abs_vertex_lists_and_dist (seg, side, spx, spy, spz) ->
    Some
      (fun k ->
        let result = effect_create_abs_vertex_lists_and_dist seg side spx spy spz in
        Effect.Deep.continue k result)
  | Ox_physics_sim.Tmap_is_force_field (seg, side) ->
    Some
      (fun k ->
        let result = effect_tmap_is_force_field seg side in
        Effect.Deep.continue k result)
  | Ox_physics_sim.Vm_vector_2_matrix_orient (vx, vy, vz, ux, uy, uz) ->
    Some
      (fun k ->
        let result = effect_vm_vector_2_matrix_orient vx vy vz ux uy uz in
        Effect.Deep.continue k result)
  | Ox_physics_sim.Query_object_type_id objnum ->
    Some
      (fun k ->
        (* Reuse collision data fetch — hit object type at index 20, id at 21 *)
        let cd = effect_fetch_collision_data objnum in
        Effect.Deep.continue k (cd.(20), cd.(21)))
  | _ -> None
;;

(* D1 bridge function *)
let cd_do_physics_sim_d1
      pos_x
      pos_y
      pos_z
      vel_x
      vel_y
      vel_z
      thrust_x
      thrust_y
      thrust_z
      orient
      rotvel_x
      rotvel_y
      rotvel_z
      rotthrust_x
      rotthrust_y
      rotthrust_z
      size
      mass
      drag
      phys_flags
      obj_flags
      obj_type
      obj_id
      obj_segnum
      objnum
      turnroll
      last_pos_x
      last_pos_y
      last_pos_z
      frame_time
      physics_cheat_flag
  =
  Effect.Deep.match_with
    (fun () ->
       Ox_physics_sim.do_physics_sim_d1
         ~pos_x
         ~pos_y
         ~pos_z
         ~vel_x
         ~vel_y
         ~vel_z
         ~thrust_x
         ~thrust_y
         ~thrust_z
         ~orient
         ~rotvel_x
         ~rotvel_y
         ~rotvel_z
         ~rotthrust_x
         ~rotthrust_y
         ~rotthrust_z
         ~size
         ~mass
         ~drag
         ~phys_flags
         ~obj_flags
         ~obj_type
         ~obj_id
         ~obj_segnum
         ~objnum
         ~turnroll
         ~last_pos_x
         ~last_pos_y
         ~last_pos_z
         ~frame_time
         ~physics_cheat_flag)
    ()
    { retc = (fun x -> x)
    ; exnc = (fun exn ->
        Printf.eprintf "OX_SHADOW: D1 physics_sim exception: %s\n" (Exn.to_string exn);
        Out_channel.flush stderr;
        Array.create ~len:25 0)
    ; effc = (fun (type a) (eff : a Effect.t) -> physics_sim_effect_handler ~is_d2:false eff)
    }
;;

(* D2 bridge function *)
let cd_do_physics_sim_d2
      pos_x
      pos_y
      pos_z
      vel_x
      vel_y
      vel_z
      thrust_x
      thrust_y
      thrust_z
      orient
      rotvel_x
      rotvel_y
      rotvel_z
      rotthrust_x
      rotthrust_y
      rotthrust_z
      size
      mass
      drag
      phys_flags
      obj_flags
      obj_type
      obj_id
      obj_segnum
      objnum
      turnroll
      last_pos_x
      last_pos_y
      last_pos_z
      orient_uvec_x
      orient_uvec_y
      orient_uvec_z
      seg_special
      frame_time
      physics_cheat_flag
  =
  Effect.Deep.match_with
    (fun () ->
       Ox_physics_sim.do_physics_sim_d2
         ~pos_x
         ~pos_y
         ~pos_z
         ~vel_x
         ~vel_y
         ~vel_z
         ~thrust_x
         ~thrust_y
         ~thrust_z
         ~orient
         ~rotvel_x
         ~rotvel_y
         ~rotvel_z
         ~rotthrust_x
         ~rotthrust_y
         ~rotthrust_z
         ~size
         ~mass
         ~drag
         ~phys_flags
         ~obj_flags
         ~obj_type
         ~obj_id
         ~obj_segnum
         ~objnum
         ~turnroll
         ~last_pos_x
         ~last_pos_y
         ~last_pos_z
         ~orient_uvec_x
         ~orient_uvec_y
         ~orient_uvec_z
         ~seg_special
         ~frame_time
         ~physics_cheat_flag)
    ()
    { retc = (fun x -> x)
    ; exnc = (fun exn ->
        Printf.eprintf "OX_SHADOW: D2 physics_sim exception: %s\n" (Exn.to_string exn);
        Out_channel.flush stderr;
        Array.create ~len:25 0)
    ; effc = (fun (type a) (eff : a Effect.t) -> physics_sim_effect_handler ~is_d2:true eff)
    }
;;

let register_callbacks () =
  Callback.register "cd_do_physics_sim_d1" cd_do_physics_sim_d1;
  Callback.register "cd_do_physics_sim_d2" cd_do_physics_sim_d2
;;
