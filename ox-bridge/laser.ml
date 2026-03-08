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

let register_callbacks () =
  Callback.register "cd_create_homing_missile" cd_create_homing_missile
;;
