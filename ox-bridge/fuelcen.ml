(* Bridge adapter for fuelcen functions.
   Uses algebraic effects: OCaml performs effects, C handler executes them. *)

(* Effect externals — fetch/write fuelcen_create data from C globals *)
external effect_fetch_fuelcen_create_data
  :  int
  -> int array
  = "cd_ox_effect_fc_fetch_fuelcen_create_data"

external effect_write_fuelcen_create
  :  int array
  -> unit
  = "cd_ox_effect_fc_write_fuelcen_create"

external effect_fetch_matcen_create_data
  :  int
  -> int array
  = "cd_ox_effect_fc_fetch_matcen_create_data"

external effect_write_matcen_create
  :  int array
  -> unit
  = "cd_ox_effect_fc_write_matcen_create"

external effect_set_segment_special
  :  int -> int
  -> unit
  = "cd_ox_effect_fc_set_segment_special"

(* Effect handler *)
let effc (type a) (eff : a Effect.t) : ((a, 'b) Effect.Deep.continuation -> 'b) option =
  match eff with
  | Ox_fuelcen.Fetch_fuelcen_create_data segnum ->
    Some (fun k ->
      let data = effect_fetch_fuelcen_create_data segnum in
      Effect.Deep.continue k data)
  | Ox_fuelcen.Write_fuelcen_create packed ->
    Some (fun k ->
      effect_write_fuelcen_create packed;
      Effect.Deep.continue k ())
  | Ox_fuelcen.Fetch_matcen_create_data segnum ->
    Some (fun k ->
      let data = effect_fetch_matcen_create_data segnum in
      Effect.Deep.continue k data)
  | Ox_fuelcen.Write_matcen_create packed ->
    Some (fun k ->
      effect_write_matcen_create packed;
      Effect.Deep.continue k ())
  | Ox_fuelcen.Set_segment_special (segnum, station_type) ->
    Some (fun k ->
      effect_set_segment_special segnum station_type;
      Effect.Deep.continue k ())
  | _ -> None
;;

(* Bridge entry point called from C via caml_callback *)
let cd_fuelcen_create segnum =
  Effect.Deep.match_with
    (fun () -> Ox_fuelcen.fuelcen_create ~segnum)
    ()
    { retc = (fun () -> ())
    ; exnc = (fun e ->
        Printf.eprintf "[OX] fuelcen_create exception: %s\n" (Exn.to_string e);
        Out_channel.flush stderr)
    ; effc = (fun (type a) (eff : a Effect.t) -> effc eff)
    }
;;

(* Bridge entry point for matcen_create called from C via caml_callback *)
let cd_matcen_create segnum =
  Effect.Deep.match_with
    (fun () -> Ox_fuelcen.matcen_create ~segnum)
    ()
    { retc = (fun () -> ())
    ; exnc = (fun e ->
        Printf.eprintf "[OX] matcen_create exception: %s\n" (Exn.to_string e);
        Out_channel.flush stderr)
    ; effc = (fun (type a) (eff : a Effect.t) -> effc eff)
    }
;;

(* Bridge entry point for fuelcen_activate called from C via caml_callback *)
let cd_fuelcen_activate segnum station_type =
  Effect.Deep.match_with
    (fun () -> Ox_fuelcen.fuelcen_activate ~segnum ~station_type)
    ()
    { retc = (fun () -> ())
    ; exnc = (fun e ->
        Printf.eprintf "[OX] fuelcen_activate exception: %s\n" (Exn.to_string e);
        Out_channel.flush stderr)
    ; effc = (fun (type a) (eff : a Effect.t) -> effc eff)
    }
;;

let register_callbacks () =
  Callback.register "cd_fuelcen_create" cd_fuelcen_create;
  Callback.register "cd_matcen_create" cd_matcen_create;
  Callback.register "cd_fuelcen_activate" cd_fuelcen_activate
;;
