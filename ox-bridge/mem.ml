(* Bridge adapter for memory tracking logic - stub, no C externals needed. *)

let effc (type a) (eff : a Effect.t) : ((a, 'b) Effect.Deep.continuation -> 'b) option =
  ignore eff;
  None
;;

let register_callbacks () = ()
