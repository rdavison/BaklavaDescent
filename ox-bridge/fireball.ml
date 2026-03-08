(* Bridge adapter for fireball/explosion functions.
   Uses algebraic effects: OCaml performs effects, C handler executes them. *)

(* Effect externals *)
external effect_alloc_expl_wall_slot
  :  int
  -> int
  -> int
  = "cd_ox_effect_fb_alloc_expl_wall_slot"

external effect_digi_link_sound_to_pos
  :  int -> int -> int -> int -> int -> int -> int -> int
  -> unit
  = "cd_ox_effect_fb_digi_link_sound_to_pos_bytecode"
    "cd_ox_effect_fb_digi_link_sound_to_pos"

(* Segment data fetch — reuse from gameseg bridge *)
external fetch_segment_data_c
  :  int
  -> int array
  = "cd_ox_fetch_segment_data"

(* Effect handler *)
let effc (type a) (eff : a Effect.t) : ((a, 'b) Effect.Deep.continuation -> 'b) option =
  match eff with
  | Ox_fireball.Alloc_expl_wall_slot (segnum, sidenum) ->
    Some (fun k ->
      let slot = effect_alloc_expl_wall_slot segnum sidenum in
      Effect.Deep.continue k slot)
  | Ox_fireball.Digi_link_sound_to_pos (sound_id, segnum, sidenum, px, py, pz, forever, max_vol) ->
    Some (fun k ->
      effect_digi_link_sound_to_pos sound_id segnum sidenum px py pz forever max_vol;
      Effect.Deep.continue k ())
  | Ox_gameseg.Fetch_segment_data segnum ->
    Some (fun k -> Effect.Deep.continue k (fetch_segment_data_c segnum))
  | _ -> None
;;

let cd_explode_wall segnum sidenum =
  Effect.Deep.match_with
    (fun () -> Ox_fireball.explode_wall ~segnum ~sidenum)
    ()
    { retc = (fun () -> ())
    ; exnc = (fun e ->
        Printf.eprintf "[OX] explode_wall exception: %s\n" (Exn.to_string e);
        Out_channel.flush stderr)
    ; effc = (fun (type a) (eff : a Effect.t) -> effc eff)
    }
;;

let register_callbacks () =
  Callback.register "cd_explode_wall" cd_explode_wall
;;
