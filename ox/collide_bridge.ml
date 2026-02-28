(* Bridge adapter for collision logic.
   Uses algebraic effects: OCaml performs effects, C handler executes them. *)

external effect_increment_kills : unit -> unit = "cd_ox_effect_increment_kills"
external effect_start_boss_death : int -> unit = "cd_ox_effect_start_boss_death"
external effect_explode_object : int -> unit = "cd_ox_effect_explode_object"
external effect_send_net_robot_explode : int -> int -> unit = "cd_ox_effect_send_net_robot_explode"
external effect_multi_explode_robot_sub : int -> int -> bool = "cd_ox_effect_multi_explode_robot_sub"

let cd_apply_damage_to_robot_d1
    flags shields damage
    is_boss is_multiplayer
    obj_id killer_objnum =
  let new_shields, boss_hit, ret =
    Effect.Deep.match_with
      (fun () ->
        Ox_collide.apply_damage_to_robot_d1
          ~flags ~shields ~damage
          ~is_boss:(is_boss <> 0) ~is_multiplayer:(is_multiplayer <> 0)
          ~obj_id ~killer_objnum)
      ()
      { retc = (fun x -> x);
        exnc = raise;
        effc = fun (type a) (eff : a Effect.t) ->
          match eff with
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
              let result = effect_multi_explode_robot_sub obj_id killer in
              Effect.Deep.continue k result)
          | _ -> None }
  in
  (new_shields, (if boss_hit then 1 else 0), ret)

(* get_explosion_vclip: 5 scalar args → int *)
let cd_get_explosion_vclip obj_type stage
    exp1_vclip_num exp2_vclip_num expl_vclip_num =
  Ox_collide.get_explosion_vclip ~obj_type ~stage
    ~exp1_vclip_num ~exp2_vclip_num ~expl_vclip_num

(* -- D2 effect externals ----------------------------------------------- *)

external effect_set_boss_hit_time : unit -> unit = "cd_ox_effect_set_boss_hit_time"
external effect_query_player_dead_or_no_shields : unit -> bool = "cd_ox_effect_query_player_dead_or_no_shields"
external effect_query_multi_all_players_alive : unit -> bool = "cd_ox_effect_query_multi_all_players_alive"
external effect_do_final_boss_hacks : unit -> unit = "cd_ox_effect_do_final_boss_hacks"
external effect_multi_send_finish_game : unit -> unit = "cd_ox_effect_multi_send_finish_game"
external effect_save_stolen_items : unit -> unit = "cd_ox_effect_save_stolen_items"
external effect_restore_stolen_items : unit -> unit = "cd_ox_effect_restore_stolen_items"
external effect_clear_stolen_items : unit -> unit = "cd_ox_effect_clear_stolen_items"
external effect_multi_explode_d2 : int -> int -> bool -> bool = "cd_ox_effect_multi_explode_d2"
external effect_multi_send_robot_explode_d2 : int -> int -> bool -> unit = "cd_ox_effect_multi_send_robot_explode_d2"
external effect_start_robot_death_sequence : int -> unit = "cd_ox_effect_start_robot_death_sequence"
external effect_special_reactor_stuff : unit -> unit = "cd_ox_effect_special_reactor_stuff"
external effect_explode_object_delay : int -> int -> unit = "cd_ox_effect_explode_object_delay"

let cd_apply_damage_to_robot_d2
    flags shields damage
    is_boss is_companion is_thief is_death_roll is_kamikaze
    robot_id
    is_multiplayer is_final_level
    obj_id killer_objnum =
  let new_shields, ret =
    Effect.Deep.match_with
      (fun () ->
        Ox_collide.apply_damage_to_robot_d2
          ~flags ~shields ~damage
          ~is_boss:(is_boss <> 0) ~is_companion:(is_companion <> 0)
          ~is_thief:(is_thief <> 0) ~is_death_roll:(is_death_roll <> 0)
          ~is_kamikaze:(is_kamikaze <> 0)
          ~robot_id
          ~is_multiplayer:(is_multiplayer <> 0) ~is_final_level:(is_final_level <> 0)
          ~obj_id ~killer_objnum)
      ()
      { retc = (fun x -> x);
        exnc = raise;
        effc = fun (type a) (eff : a Effect.t) ->
          match eff with
          | Ox_collide.Increment_kills ->
            Some (fun (k : (a, _) Effect.Deep.continuation) ->
              effect_increment_kills ();
              Effect.Deep.continue k ())
          | Ox_collide.Start_boss_death obj_id ->
            Some (fun (k : (a, _) Effect.Deep.continuation) ->
              effect_start_boss_death obj_id;
              Effect.Deep.continue k ())
          | Ox_collide.Set_boss_hit_time ->
            Some (fun (k : (a, _) Effect.Deep.continuation) ->
              effect_set_boss_hit_time ();
              Effect.Deep.continue k ())
          | Ox_collide.Query_player_dead_or_no_shields ->
            Some (fun (k : (a, _) Effect.Deep.continuation) ->
              let result = effect_query_player_dead_or_no_shields () in
              Effect.Deep.continue k result)
          | Ox_collide.Query_multi_all_players_alive ->
            Some (fun (k : (a, _) Effect.Deep.continuation) ->
              let result = effect_query_multi_all_players_alive () in
              Effect.Deep.continue k result)
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
              let result = effect_multi_explode_d2 obj_id killer is_thief in
              Effect.Deep.continue k result)
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
          | Ox_collide.Explode_object_delay (obj_id, delay) ->
            Some (fun (k : (a, _) Effect.Deep.continuation) ->
              effect_explode_object_delay obj_id delay;
              Effect.Deep.continue k ())
          | _ -> None }
  in
  (new_shields, ret)

(* -- Clutter bridge (shared D1/D2) ------------------------------------ *)

external effect_explode_object_delay_clutter : int -> int -> unit = "cd_ox_effect_explode_object_delay_clutter"

let cd_apply_damage_to_clutter flags shields damage obj_id =
  let new_shields, ret =
    Effect.Deep.match_with
      (fun () ->
        Ox_collide.apply_damage_to_clutter ~flags ~shields ~damage ~obj_id)
      ()
      { retc = (fun x -> x);
        exnc = raise;
        effc = fun (type a) (eff : a Effect.t) ->
          match eff with
          | Ox_collide.Explode_object_delay (obj_id, delay) ->
            Some (fun (k : (a, _) Effect.Deep.continuation) ->
              effect_explode_object_delay_clutter obj_id delay;
              Effect.Deep.continue k ())
          | _ -> None }
  in
  (new_shields, ret)

(* -- Controlcen bridge (shared D1/D2) -------------------------------- *)

external effect_show_hud_invul_message : unit -> unit = "cd_ox_effect_show_hud_invul_message"
external effect_controlcen_been_hit : unit -> unit = "cd_ox_effect_controlcen_been_hit"
external effect_do_controlcen_destroyed : int -> unit = "cd_ox_effect_do_controlcen_destroyed"
external effect_add_controlcen_score : unit -> unit = "cd_ox_effect_add_controlcen_score"
external effect_multi_send_destroy_controlcen : int -> int -> unit = "cd_ox_effect_multi_send_destroy_controlcen"
external effect_sound_controlcen_destroyed : int -> unit = "cd_ox_effect_sound_controlcen_destroyed"
external effect_explode_object_delay_controlcen : int -> int -> unit = "cd_ox_effect_explode_object_delay_controlcen"

let cd_apply_damage_to_controlcen
    shields flags damage
    who_is_player who_is_local_player
    who_objnum local_player_objnum
    is_multiplayer is_coop time_level_ok
    obj_id who_id =
  let new_shields =
    Effect.Deep.match_with
      (fun () ->
        Ox_collide.apply_damage_to_controlcen
          ~shields ~flags ~damage
          ~who_is_player:(who_is_player <> 0) ~who_is_local_player:(who_is_local_player <> 0)
          ~who_objnum ~local_player_objnum
          ~is_multiplayer:(is_multiplayer <> 0) ~is_coop:(is_coop <> 0)
          ~time_level_ok:(time_level_ok <> 0)
          ~obj_id ~who_id)
      ()
      { retc = (fun x -> x);
        exnc = raise;
        effc = fun (type a) (eff : a Effect.t) ->
          match eff with
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
          | Ox_collide.Explode_object_delay (obj_id, delay) ->
            Some (fun (k : (a, _) Effect.Deep.continuation) ->
              effect_explode_object_delay_controlcen obj_id delay;
              Effect.Deep.continue k ())
          | _ -> None }
  in
  new_shields

(* -- Player damage bridge D1 ----------------------------------------- *)

external effect_palette_flash_d1 : int -> int -> int -> unit = "cd_ox_effect_palette_flash_d1"
external effect_set_player_dead_d1 : int -> unit = "cd_ox_effect_set_player_dead_d1"

let cd_apply_damage_to_player_d1
    is_dead is_invulnerable is_endlevel is_local_player
    player_shields damage killer_objnum =
  let new_shields, dead =
    Effect.Deep.match_with
      (fun () ->
        Ox_collide.apply_damage_to_player_d1
          ~is_dead:(is_dead <> 0) ~is_invulnerable:(is_invulnerable <> 0)
          ~is_endlevel:(is_endlevel <> 0) ~is_local_player:(is_local_player <> 0)
          ~player_shields ~damage ~killer_objnum)
      ()
      { retc = (fun x -> x);
        exnc = raise;
        effc = fun (type a) (eff : a Effect.t) ->
          match eff with
          | Ox_collide.Palette_flash (r, g, b) ->
            Some (fun (k : (a, _) Effect.Deep.continuation) ->
              effect_palette_flash_d1 r g b;
              Effect.Deep.continue k ())
          | Ox_collide.Set_player_dead killer_objnum ->
            Some (fun (k : (a, _) Effect.Deep.continuation) ->
              effect_set_player_dead_d1 killer_objnum;
              Effect.Deep.continue k ())
          | _ -> None }
  in
  (new_shields, (if dead then 1 else 0))

(* -- Player damage bridge D2 ----------------------------------------- *)

external effect_palette_flash_d2 : int -> int -> int -> unit = "cd_ox_effect_palette_flash_d2"
external effect_set_player_dead_d2 : int -> unit = "cd_ox_effect_set_player_dead_d2"
external effect_set_buddy_sorry_time : unit -> unit = "cd_ox_effect_set_buddy_sorry_time"

let cd_apply_damage_to_player_d2
    is_dead is_invulnerable is_endlevel is_local_player
    player_shields damage killer_objnum killer_is_companion =
  let new_shields, dead =
    Effect.Deep.match_with
      (fun () ->
        Ox_collide.apply_damage_to_player_d2
          ~is_dead:(is_dead <> 0) ~is_invulnerable:(is_invulnerable <> 0)
          ~is_endlevel:(is_endlevel <> 0) ~is_local_player:(is_local_player <> 0)
          ~player_shields ~damage ~killer_objnum
          ~killer_is_companion:(killer_is_companion <> 0))
      ()
      { retc = (fun x -> x);
        exnc = raise;
        effc = fun (type a) (eff : a Effect.t) ->
          match eff with
          | Ox_collide.Palette_flash (r, g, b) ->
            Some (fun (k : (a, _) Effect.Deep.continuation) ->
              effect_palette_flash_d2 r g b;
              Effect.Deep.continue k ())
          | Ox_collide.Set_player_dead killer_objnum ->
            Some (fun (k : (a, _) Effect.Deep.continuation) ->
              effect_set_player_dead_d2 killer_objnum;
              Effect.Deep.continue k ())
          | Ox_collide.Set_buddy_sorry_time ->
            Some (fun (k : (a, _) Effect.Deep.continuation) ->
              effect_set_buddy_sorry_time ();
              Effect.Deep.continue k ())
          | _ -> None }
  in
  (new_shields, (if dead then 1 else 0))

(* -- calc_controlcen_gun_point (pure, no effects) ---------------------- *)

let cd_calc_controlcen_gun_point
    glpx glpy glpz gldx gldy gldz
    or1 or2 or3 ou1 ou2 ou3 of1 of2 of3
    opx opy opz =
  Ox_collide.calc_controlcen_gun_point
    ~glpx ~glpy ~glpz ~gldx ~gldy ~gldz
    ~or1 ~or2 ~or3 ~ou1 ~ou2 ~ou3 ~of1 ~of2 ~of3
    ~opx ~opy ~opz

(* -- laser_are_related (pure, packed array) ----------------------------- *)

let cd_laser_are_related_d1 packed = Ox_collide.laser_are_related_d1 packed
let cd_laser_are_related_d2 packed = Ox_collide.laser_are_related_d2 packed

(* -- chase_angles (pure, no effects) ----------------------------------- *)

let cd_chase_angles cur_p cur_b cur_h desired_p desired_b desired_h frame_time =
  Ox_collide.chase_angles ~cur_p ~cur_b ~cur_h ~desired_p ~desired_b ~desired_h ~frame_time

(* -- calc_best_gun (pure, no effects) ---------------------------------- *)

let cd_calc_best_gun packed =
  Ox_collide.calc_best_gun packed

(* -- maybe_kill_weapon (pure, no effects) ------------------------------ *)

let cd_maybe_kill_weapon_d1 weapon_id phys_flags weapon_shields
    other_type other_shields =
  let new_shields, dead =
    Ox_collide.maybe_kill_weapon_d1
      ~weapon_id ~phys_flags ~weapon_shields ~other_type ~other_shields
  in
  (new_shields, (if dead then 1 else 0))

let cd_maybe_kill_weapon_d2 weapon_id phys_flags weapon_shields
    other_type other_shields is_shareware =
  let new_shields, dead =
    Ox_collide.maybe_kill_weapon_d2
      ~weapon_id ~phys_flags ~weapon_shields ~other_type ~other_shields
      ~is_shareware:(is_shareware <> 0)
  in
  (new_shields, (if dead then 1 else 0))

let () =
  Callback.register "cd_apply_damage_to_robot_d1" cd_apply_damage_to_robot_d1;
  Callback.register "cd_get_explosion_vclip" cd_get_explosion_vclip;
  Callback.register "cd_apply_damage_to_robot_d2" cd_apply_damage_to_robot_d2;
  Callback.register "cd_apply_damage_to_clutter" cd_apply_damage_to_clutter;
  Callback.register "cd_apply_damage_to_controlcen" cd_apply_damage_to_controlcen;
  Callback.register "cd_apply_damage_to_player_d1" cd_apply_damage_to_player_d1;
  Callback.register "cd_apply_damage_to_player_d2" cd_apply_damage_to_player_d2;
  Callback.register "cd_maybe_kill_weapon_d1" cd_maybe_kill_weapon_d1;
  Callback.register "cd_maybe_kill_weapon_d2" cd_maybe_kill_weapon_d2;
  Callback.register "cd_calc_best_gun" cd_calc_best_gun;
  Callback.register "cd_chase_angles" cd_chase_angles;
  Callback.register "cd_laser_are_related_d1" cd_laser_are_related_d1;
  Callback.register "cd_laser_are_related_d2" cd_laser_are_related_d2;
  Callback.register "cd_calc_controlcen_gun_point" cd_calc_controlcen_gun_point
