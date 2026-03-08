(* Bridge adapter for wall functions.
   Uses algebraic effects: OCaml performs effects, C handler executes them. *)

(* C externals for on-demand data effects (used by check_poke) *)
external fetch_segment_data_c : int -> int array = "cd_ox_fetch_segment_data"
external fetch_object_data_c : int -> int array = "cd_ox_fetch_object_data"

(* Effect externals *)
external effect_fetch_reset_walls_info
  :  unit
  -> int array
  = "cd_ox_effect_wall_fetch_reset_walls_info"

external effect_write_reset_walls
  :  int array
  -> unit
  = "cd_ox_effect_wall_write_reset_walls"

external effect_fetch_kill_stuck_data
  :  int
  -> int array
  = "cd_ox_effect_wall_fetch_kill_stuck_data"

external effect_write_kill_stuck_objects
  :  int array
  -> unit
  = "cd_ox_effect_wall_write_kill_stuck_objects"

external effect_flush_fcd_cache
  :  unit
  -> unit
  = "cd_ox_effect_wall_flush_fcd_cache"

external effect_fetch_seg_children_and_wall_nums
  :  int
  -> int array
  = "cd_ox_effect_wall_fetch_seg_children_and_wall_nums"

external effect_wall_set_flags
  :  int
  -> int
  -> unit
  = "cd_ox_effect_wall_set_flags"

external effect_wall_clear_flags
  :  int
  -> int
  -> unit
  = "cd_ox_effect_wall_clear_flags"

(* Effect handler *)
let effc (type a) (eff : a Effect.t) : ((a, 'b) Effect.Deep.continuation -> 'b) option =
  match eff with
  | Ox_wall.Fetch_reset_walls_info () ->
    Some (fun k ->
      let data = effect_fetch_reset_walls_info () in
      Effect.Deep.continue k data)
  | Ox_wall.Write_reset_walls packed ->
    Some (fun k ->
      effect_write_reset_walls packed;
      Effect.Deep.continue k ())
  | Ox_wall.Fetch_kill_stuck_data wallnum ->
    Some (fun k ->
      let data = effect_fetch_kill_stuck_data wallnum in
      Effect.Deep.continue k data)
  | Ox_wall.Write_kill_stuck_objects packed ->
    Some (fun k ->
      effect_write_kill_stuck_objects packed;
      Effect.Deep.continue k ())
  | Ox_wall.Flush_fcd_cache () ->
    Some (fun k ->
      effect_flush_fcd_cache ();
      Effect.Deep.continue k ())
  | Ox_wall.Fetch_seg_children_and_wall_nums segnum ->
    Some (fun k ->
      let data = effect_fetch_seg_children_and_wall_nums segnum in
      Effect.Deep.continue k data)
  | Ox_wall.Wall_set_flags (wall_num, flags) ->
    Some (fun k ->
      effect_wall_set_flags wall_num flags;
      Effect.Deep.continue k ())
  | Ox_wall.Wall_clear_flags (wall_num, flags) ->
    Some (fun k ->
      effect_wall_clear_flags wall_num flags;
      Effect.Deep.continue k ())
  | Ox_gameseg.Fetch_segment_data segnum ->
    Some (fun k ->
      let data = fetch_segment_data_c segnum in
      Effect.Deep.continue k data)
  | Ox_fvi.Fetch_object_data objnum ->
    Some (fun k ->
      let data = fetch_object_data_c objnum in
      Effect.Deep.continue k data)
  | _ -> None
;;

(* Bridge entry point called from C via caml_callback *)
let cd_reset_walls () =
  Effect.Deep.match_with
    (fun () -> Ox_wall.reset_walls ())
    ()
    { retc = (fun () -> ())
    ; exnc = (fun e ->
        Printf.eprintf "[OX] reset_walls exception: %s\n" (Exn.to_string e);
        Out_channel.flush stderr)
    ; effc = (fun (type a) (eff : a Effect.t) -> effc eff)
    }
;;

let cd_kill_stuck_objects wallnum =
  Effect.Deep.match_with
    (fun () -> Ox_wall.kill_stuck_objects ~wallnum)
    ()
    { retc = (fun () -> ())
    ; exnc = (fun e ->
        Printf.eprintf "[OX] kill_stuck_objects exception: %s\n" (Exn.to_string e);
        Out_channel.flush stderr)
    ; effc = (fun (type a) (eff : a Effect.t) -> effc eff)
    }
;;

let cd_wall_illusion_off segnum side =
  Effect.Deep.match_with
    (fun () -> Ox_wall.wall_illusion_off ~segnum ~side)
    ()
    { retc = (fun () -> ())
    ; exnc = (fun e ->
        Printf.eprintf "[OX] wall_illusion_off exception: %s\n" (Exn.to_string e);
        Out_channel.flush stderr)
    ; effc = (fun (type a) (eff : a Effect.t) -> effc eff)
    }
;;

let cd_wall_illusion_on segnum side =
  Effect.Deep.match_with
    (fun () -> Ox_wall.wall_illusion_on ~segnum ~side)
    ()
    { retc = (fun () -> ())
    ; exnc = (fun e ->
        Printf.eprintf "[OX] wall_illusion_on exception: %s\n" (Exn.to_string e);
        Out_channel.flush stderr)
    ; effc = (fun (type a) (eff : a Effect.t) -> effc eff)
    }
;;

let register_callbacks () =
  Callback.register "cd_reset_walls" cd_reset_walls;
  Callback.register "cd_kill_stuck_objects" cd_kill_stuck_objects;
  Callback.register "cd_wall_illusion_off" cd_wall_illusion_off;
  Callback.register "cd_wall_illusion_on" cd_wall_illusion_on
;;
