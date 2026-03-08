(* Bridge adapter for switch/trigger functions.
   Uses algebraic effects: OCaml performs effects, C handler executes them. *)

(* Effect externals *)
external effect_fetch_trigger_links
  :  int
  -> int array
  = "cd_ox_effect_sw_fetch_trigger_links"

external effect_lock_wall_door
  :  int
  -> unit
  = "cd_ox_effect_sw_lock_wall_door"

external effect_unlock_wall_door
  :  int
  -> unit
  = "cd_ox_effect_sw_unlock_wall_door"

external effect_get_num_triggers
  :  unit
  -> int
  = "cd_ox_effect_sw_get_num_triggers"

external effect_get_num_walls
  :  unit
  -> int
  = "cd_ox_effect_sw_get_num_walls"

external effect_set_wall_flag_wall_switch
  :  int
  -> unit
  = "cd_ox_effect_sw_set_wall_flag_wall_switch"

external effect_fetch_trigger_seg_sides
  :  int
  -> int array
  = "cd_ox_effect_sw_fetch_trigger_seg_sides"

(* Effect handler *)
let effc (type a) (eff : a Effect.t) : ((a, 'b) Effect.Deep.continuation -> 'b) option =
  match eff with
  | Ox_switch.Fetch_trigger_links trigger_num ->
    Some (fun k ->
      let data = effect_fetch_trigger_links trigger_num in
      Effect.Deep.continue k data)
  | Ox_switch.Lock_wall_door wall_num ->
    Some (fun k ->
      effect_lock_wall_door wall_num;
      Effect.Deep.continue k ())
  | Ox_switch.Unlock_wall_door wall_num ->
    Some (fun k ->
      effect_unlock_wall_door wall_num;
      Effect.Deep.continue k ())
  | Ox_switch.Get_num_triggers () ->
    Some (fun k ->
      let n = effect_get_num_triggers () in
      Effect.Deep.continue k n)
  | Ox_switch.Get_num_walls () ->
    Some (fun k ->
      let n = effect_get_num_walls () in
      Effect.Deep.continue k n)
  | Ox_switch.Set_wall_flag_wall_switch wall_num ->
    Some (fun k ->
      effect_set_wall_flag_wall_switch wall_num;
      Effect.Deep.continue k ())
  | Ox_switch.Fetch_trigger_seg_sides trigger_num ->
    Some (fun k ->
      let data = effect_fetch_trigger_seg_sides trigger_num in
      Effect.Deep.continue k data)
  | _ -> None
;;

let handler =
  { Effect.Deep.retc = (fun x -> x)
  ; exnc = (fun e ->
      Printf.eprintf "[OX] switch exception: %s\n" (Exn.to_string e);
      Out_channel.flush stderr;
      -1)
  ; effc = (fun (type a) (eff : a Effect.t) -> effc eff)
  }

(* Bridge entry points called from C via caml_callback *)
let cd_do_lock_doors trigger_num =
  Effect.Deep.match_with
    (fun () -> Ox_switch.do_lock_doors ~trigger_num)
    ()
    { retc = (fun () -> ())
    ; exnc = (fun e ->
        Printf.eprintf "[OX] do_lock_doors exception: %s\n" (Exn.to_string e);
        Out_channel.flush stderr)
    ; effc = (fun (type a) (eff : a Effect.t) -> effc eff)
    }
;;

let cd_do_unlock_doors trigger_num =
  Effect.Deep.match_with
    (fun () -> Ox_switch.do_unlock_doors ~trigger_num)
    ()
    { retc = (fun () -> ())
    ; exnc = (fun e ->
        Printf.eprintf "[OX] do_unlock_doors exception: %s\n" (Exn.to_string e);
        Out_channel.flush stderr)
    ; effc = (fun (type a) (eff : a Effect.t) -> effc eff)
    }
;;

let cd_door_is_wall_switched wall_num =
  Effect.Deep.match_with
    (fun () -> Ox_switch.door_is_wall_switched ~wall_num)
    ()
    handler
;;

let cd_flag_wall_switched_doors () =
  Effect.Deep.match_with
    (fun () -> Ox_switch.flag_wall_switched_doors ())
    ()
    { retc = (fun () -> ())
    ; exnc = (fun e ->
        Printf.eprintf "[OX] flag_wall_switched_doors exception: %s\n" (Exn.to_string e);
        Out_channel.flush stderr)
    ; effc = (fun (type a) (eff : a Effect.t) -> effc eff)
    }
;;

(* Segment data fetch — reuse from gameseg bridge *)
external fetch_segment_data_c
  :  int
  -> int array
  = "cd_ox_fetch_segment_data"

let combined_effc (type a) (eff : a Effect.t) : ((a, 'b) Effect.Deep.continuation -> 'b) option =
  match effc eff with
  | Some _ as s -> s
  | None ->
    match Wall.effc eff with
    | Some _ as s -> s
    | None ->
      match Fireball.effc eff with
      | Some _ as s -> s
      | None ->
        match Fuelcen.effc eff with
        | Some _ as s -> s
        | None ->
          match eff with
          | Ox_gameseg.Fetch_segment_data segnum ->
            Some (fun k -> Effect.Deep.continue k (fetch_segment_data_c segnum))
          | _ -> None
;;

let cd_do_matcen trigger_num =
  Effect.Deep.match_with
    (fun () -> Ox_switch.do_matcen ~trigger_num)
    ()
    { retc = (fun () -> ())
    ; exnc = (fun e ->
        Printf.eprintf "[OX] do_matcen exception: %s\n" (Exn.to_string e);
        Out_channel.flush stderr)
    ; effc = (fun (type a) (eff : a Effect.t) -> combined_effc eff)
    }
;;

let cd_do_il_on trigger_num =
  Effect.Deep.match_with
    (fun () -> Ox_switch.do_il_on ~trigger_num)
    ()
    { retc = (fun () -> ())
    ; exnc = (fun e ->
        Printf.eprintf "[OX] do_il_on exception: %s\n" (Exn.to_string e);
        Out_channel.flush stderr)
    ; effc = (fun (type a) (eff : a Effect.t) -> combined_effc eff)
    }
;;

let cd_do_il_off trigger_num is_d2 =
  Effect.Deep.match_with
    (fun () -> Ox_switch.do_il_off ~trigger_num ~is_d2:(is_d2 <> 0))
    ()
    { retc = (fun () -> ())
    ; exnc = (fun e ->
        Printf.eprintf "[OX] do_il_off exception: %s\n" (Exn.to_string e);
        Out_channel.flush stderr)
    ; effc = (fun (type a) (eff : a Effect.t) -> combined_effc eff)
    }
;;

let register_callbacks () =
  Callback.register "cd_do_lock_doors" cd_do_lock_doors;
  Callback.register "cd_do_unlock_doors" cd_do_unlock_doors;
  Callback.register "cd_door_is_wall_switched" cd_door_is_wall_switched;
  Callback.register "cd_flag_wall_switched_doors" cd_flag_wall_switched_doors;
  Callback.register "cd_do_matcen" cd_do_matcen;
  Callback.register "cd_do_il_on" cd_do_il_on;
  Callback.register "cd_do_il_off" cd_do_il_off
;;
