(* Bridge adapter for misc tracking logic. *)

let effc (type a) (eff : a Effect.t) : ((a, 'b) Effect.Deep.continuation -> 'b) option =
  match eff with
  | Ox_misc.Error_internal s ->
    Some (fun k -> Printf.eprintf "ERROR: %s\n" s; Out_channel.flush stderr; Effect.Deep.continue k ())
  | Ox_misc.Warning_internal s ->
    Some (fun k -> Printf.eprintf "WARNING: %s\n" s; Out_channel.flush stderr; Effect.Deep.continue k ())
  | Ox_misc.Set_exit_message_internal _s ->
    Some (fun k -> Effect.Deep.continue k ())
  | Ox_misc.Int3_internal ->
    Some (fun k -> Printf.eprintf "INT3!\n"; Out_channel.flush stderr; Effect.Deep.continue k ())
  | Ox_misc.P_Rand_internal ->
    Some (fun k -> Effect.Deep.continue k (Ox_misc.p_rand_direct ()))
  | Ox_misc.P_Rand_get_state_internal ->
    Some (fun k -> Effect.Deep.continue k (Ox_misc.p_rand_get_state_direct ()))
  | Ox_misc.P_Rand_set_state_internal s ->
    Some (fun k -> Ox_misc.p_rand_set_state_direct s; Effect.Deep.continue k ())
  | _ -> None
;;

let register_callbacks () = ()
