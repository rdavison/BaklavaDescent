(* Bridge adapter for control center frame logic.
   Uses algebraic effects: OCaml performs effects, C handler executes them. *)

(* Effect externals — called from OCaml effect handler, dispatch to C *)
external effect_fire_weapon
  :  int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> unit
  = "cd_ox_effect_cc_fire_weapon_bytecode" "cd_ox_effect_cc_fire_weapon"

external effect_send_controlcen_fire
  :  int
  -> int
  -> int
  -> int
  -> int
  -> unit
  = "cd_ox_effect_cc_send_controlcen_fire"

external effect_make_random_vector
  :  unit
  -> int * int * int
  = "cd_ox_effect_cc_make_random_vector"

external effect_p_rand : unit -> int = "cd_ox_effect_cc_p_rand"

(* Effect handler shared by D1 and D2 *)
let controlcen_effect_handler
  : type a. a Effect.t -> ((a, _) Effect.Deep.continuation -> _) option
  =
  fun eff ->
  match eff with
  | Ox_controlcen.Fire_weapon (dx, dy, dz, px, py, pz, parent_id, make_sound) ->
    Some
      (fun k ->
        effect_fire_weapon dx dy dz px py pz parent_id make_sound;
        Effect.Deep.continue k ())
  | Ox_controlcen.Send_controlcen_fire (dx, dy, dz, gun_num, obj_id) ->
    Some
      (fun k ->
        effect_send_controlcen_fire dx dy dz gun_num obj_id;
        Effect.Deep.continue k ())
  | Ox_controlcen.Make_random_vector ->
    Some
      (fun k ->
        let result = effect_make_random_vector () in
        Effect.Deep.continue k result)
  | Ox_controlcen.P_Rand ->
    Some
      (fun k ->
        let result = effect_p_rand () in
        Effect.Deep.continue k result)
  | _ -> None
;;

(* D1 bridge function *)
let cd_do_controlcen_frame_d1
      cc_been_hit
      cc_player_seen
      cc_next_fire_time
      n_guns
      gun_pos_flat
      gun_dir_flat
      frame_count
      frame_time
      game_mode
      difficulty_level
      player_flags
      player_is_dead
      game_time
      player_time_of_death
      obj_x
      obj_y
      obj_z
      obj_segnum
      console_x
      console_y
      console_z
      believed_x
      believed_y
      believed_z
      has_children
      obj_id
      player_objnum
  =
  try
    Effect.Deep.match_with
      (fun () ->
         Ox_controlcen.do_controlcen_frame_d1
           ~cc_been_hit
           ~cc_player_seen
           ~cc_next_fire_time
           ~n_guns
           ~gun_pos_flat
           ~gun_dir_flat
           ~frame_count
           ~frame_time
           ~game_mode
           ~difficulty_level
           ~player_flags
           ~player_is_dead
           ~game_time
           ~player_time_of_death
           ~obj_x
           ~obj_y
           ~obj_z
           ~obj_segnum
           ~console_x
           ~console_y
           ~console_z
           ~believed_x
           ~believed_y
           ~believed_z
           ~has_children
           ~obj_id
           ~player_objnum)
      ()
      { retc = (fun x -> x)
      ; exnc = raise
      ; effc = (fun (type a) (eff : a Effect.t) -> controlcen_effect_handler eff)
      }
  with exn ->
    Printf.eprintf "[OX] controlcen_d1 exception: %s\n" (Exn.to_string exn);
    Printf.eprintf "%s\n" (Printexc.get_backtrace ());
    Printf.eprintf "[OX] n_guns=%d gun_pos_len=%d gun_dir_len=%d\n"
      n_guns (Array.length gun_pos_flat) (Array.length gun_dir_flat);
    [| cc_been_hit; cc_player_seen; cc_next_fire_time |]
;;

(* D2 bridge function *)
let cd_do_controlcen_frame_d2
      cc_been_hit
      cc_player_seen
      cc_next_fire_time
      n_guns
      gun_pos_flat
      gun_dir_flat
      frame_count
      frame_time
      game_mode
      difficulty_level
      player_flags
      player_is_dead
      game_time
      player_time_of_death
      obj_x
      obj_y
      obj_z
      obj_segnum
      console_x
      console_y
      console_z
      believed_x
      believed_y
      believed_z
      has_children
      obj_id
      player_objnum
      current_level_num
      last_time_cc_vis_check
  =
  Effect.Deep.match_with
    (fun () ->
       Ox_controlcen.do_controlcen_frame_d2
         ~cc_been_hit
         ~cc_player_seen
         ~cc_next_fire_time
         ~n_guns
         ~gun_pos_flat
         ~gun_dir_flat
         ~frame_count
         ~frame_time
         ~game_mode
         ~difficulty_level
         ~player_flags
         ~player_is_dead
         ~game_time
         ~player_time_of_death
         ~obj_x
         ~obj_y
         ~obj_z
         ~obj_segnum
         ~console_x
         ~console_y
         ~console_z
         ~believed_x
         ~believed_y
         ~believed_z
         ~has_children
         ~obj_id
         ~player_objnum
         ~current_level_num
         ~last_time_cc_vis_check)
    ()
    { retc = (fun x -> x)
    ; exnc = raise
    ; effc = (fun (type a) (eff : a Effect.t) -> controlcen_effect_handler eff)
    }
;;

let () =
  Callback.register "cd_do_controlcen_frame_d1" cd_do_controlcen_frame_d1;
  Callback.register "cd_do_controlcen_frame_d2" cd_do_controlcen_frame_d2
;;
