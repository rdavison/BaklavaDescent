(* Bridge adapter for laser/missile functions.
   Uses algebraic effects: OCaml performs effects, C handler executes them. *)

(* Effect externals *)
external effect_fetch_object_pos
  :  int
  -> int array
  = "cd_ox_effect_laser_fetch_object_pos"

external effect_laser_create_new
  :  int -> int -> int -> int -> int -> int -> int -> int -> int -> int
  -> int
  = "cd_ox_effect_laser_create_new_bytecode"
    "cd_ox_effect_laser_create_new"

external effect_set_laser_track_goal
  :  int -> int
  -> unit
  = "cd_ox_effect_laser_set_track_goal"

external effect_p_rand : unit -> int = "cd_ox_effect_p_rand"

external effect_fetch_weapon_create_data
  :  int
  -> int array
  = "cd_ox_effect_fetch_weapon_create_data"

external effect_obj_create_weapon
  :  int -> int -> int -> int -> int -> int -> int
  -> int
  = "cd_ox_effect_obj_create_weapon_bytecode"
    "cd_ox_effect_obj_create_weapon"

external effect_set_weapon_obj_props
  :  int -> int -> int -> int -> int -> int
  -> unit
  = "cd_ox_effect_set_weapon_obj_props_bytecode"
    "cd_ox_effect_set_weapon_obj_props"

external effect_fetch_release_guided_missile_data
  :  int
  -> int array
  = "cd_ox_effect_fetch_release_guided_missile_data"

external effect_release_guided_set_viewer
  :  int
  -> unit
  = "cd_ox_effect_release_guided_set_viewer"

external effect_release_guided_multi_send
  :  int
  -> unit
  = "cd_ox_effect_release_guided_multi_send"

external effect_release_guided_newdemo_record
  :  unit
  -> unit
  = "cd_ox_effect_release_guided_newdemo_record"

external effect_release_guided_clear
  :  int
  -> unit
  = "cd_ox_effect_release_guided_clear"

(* Effect handler *)
let effc (type a) (eff : a Effect.t) : ((a, 'b) Effect.Deep.continuation -> 'b) option =
  match eff with
  | Ox_laser.P_Rand ->
    Some (fun k -> Effect.Deep.continue k (effect_p_rand ()))
  | Ox_laser.Fetch_object_pos objnum ->
    Some (fun k ->
      let arr = effect_fetch_object_pos objnum in
      Effect.Deep.continue k (arr.(0), arr.(1), arr.(2)))
  | Ox_laser.Laser_create_new (dx, dy, dz, px, py, pz, segnum, parent, objtype, make_sound) ->
    Some (fun k ->
      let objnum = effect_laser_create_new dx dy dz px py pz segnum parent objtype make_sound in
      Effect.Deep.continue k objnum)
  | Ox_laser.Set_laser_track_goal (objnum, goal_obj) ->
    Some (fun k ->
      effect_set_laser_track_goal objnum goal_obj;
      Effect.Deep.continue k ())
  | Ox_laser.Fetch_weapon_create_data weapon_type ->
    Some (fun k ->
      let arr = effect_fetch_weapon_create_data weapon_type in
      Effect.Deep.continue k arr)
  | Ox_laser.Obj_create_weapon (wtype, segnum, px, py, pz, radius, rtype) ->
    Some (fun k ->
      let objnum = effect_obj_create_weapon wtype segnum px py pz radius rtype in
      Effect.Deep.continue k objnum)
  | Ox_laser.Set_weapon_obj_props arr ->
    Some (fun k ->
      effect_set_weapon_obj_props arr.(0) arr.(1) arr.(2) arr.(3) arr.(4) arr.(5);
      Effect.Deep.continue k ())
  | Ox_laser.Fetch_release_guided_missile_data player_num ->
    Some (fun k ->
      let arr = effect_fetch_release_guided_missile_data player_num in
      Effect.Deep.continue k arr)
  | Ox_laser.Release_guided_set_viewer player_num ->
    Some (fun k ->
      effect_release_guided_set_viewer player_num;
      Effect.Deep.continue k ())
  | Ox_laser.Release_guided_multi_send player_num ->
    Some (fun k ->
      effect_release_guided_multi_send player_num;
      Effect.Deep.continue k ())
  | Ox_laser.Release_guided_newdemo_record ->
    Some (fun k ->
      effect_release_guided_newdemo_record ();
      Effect.Deep.continue k ())
  | Ox_laser.Release_guided_clear player_num ->
    Some (fun k ->
      effect_release_guided_clear player_num;
      Effect.Deep.continue k ())
  | _ -> None
;;

let cd_create_homing_missile objp_pos_x objp_pos_y objp_pos_z
    objp_segnum objp_objnum goal_obj objtype make_sound =
  Effect.Deep.match_with
    (fun () ->
      Ox_laser.create_homing_missile
        ~objp_pos_x ~objp_pos_y ~objp_pos_z
        ~objp_segnum ~objp_objnum ~goal_obj ~objtype ~make_sound)
    ()
    { retc = (fun r -> r)
    ; exnc = (fun e ->
        Printf.eprintf "[OX] create_homing_missile exception: %s\n" (Exn.to_string e);
        Out_channel.flush stderr;
        -1)
    ; effc = (fun (type a) (eff : a Effect.t) -> effc eff)
    }
;;

let cd_create_weapon_object weapon_type segnum pos_x pos_y pos_z =
  Effect.Deep.match_with
    (fun () ->
      Ox_laser.create_weapon_object
        ~weapon_type ~segnum ~pos_x ~pos_y ~pos_z)
    ()
    { retc = (fun r -> r)
    ; exnc = (fun e ->
        Printf.eprintf "[OX] create_weapon_object exception: %s\n" (Exn.to_string e);
        Out_channel.flush stderr;
        -1)
    ; effc = (fun (type a) (eff : a Effect.t) -> effc eff)
    }
;;

let cd_release_guided_missile player_num =
  Effect.Deep.match_with
    (fun () ->
      Ox_laser.release_guided_missile ~player_num)
    ()
    { retc = (fun () -> ())
    ; exnc = (fun e ->
        Printf.eprintf "[OX] release_guided_missile exception: %s\n" (Exn.to_string e);
        Out_channel.flush stderr;
        ())
    ; effc = (fun (type a) (eff : a Effect.t) -> effc eff)
    }
;;

let register_callbacks () =
  Callback.register "cd_create_homing_missile" cd_create_homing_missile;
  Callback.register "cd_create_weapon_object" cd_create_weapon_object;
  Callback.register "cd_release_guided_missile" cd_release_guided_missile
;;
