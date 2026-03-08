open Core

(* -- RNG state and direct access --------------------------------------- *)

let p_rand_state = ref 0

let p_rand_direct () =
  p_rand_state := Int.bit_and (Int.((!p_rand_state * 1103515245) + 12345)) 0x7FFFFFFF;
  Int.bit_and (Int.shift_right !p_rand_state 16) 0x7FFF
;;

let p_srand_direct s = p_rand_state := s
let p_rand_get_state_direct () = !p_rand_state
let p_rand_set_state_direct s = p_rand_state := s

(* -- Algebraic effects -------------------------------------------------- *)

type _ Effect.t +=
  | Error_internal : string -> unit Effect.t
  | Warning_internal : string -> unit Effect.t
  | Set_exit_message_internal : string -> unit Effect.t
  | Int3_internal : unit Effect.t
  | P_Rand_internal : int Effect.t
  | P_Rand_get_state_internal : int Effect.t
  | P_Rand_set_state_internal : int -> unit Effect.t

let error s = Effect.perform (Error_internal s)
let warning s = Effect.perform (Warning_internal s)
let set_exit_message s = Effect.perform (Set_exit_message_internal s)
let int3 () = Effect.perform Int3_internal
let p_rand () = Effect.perform P_Rand_internal
let p_srand s = Effect.perform (P_Rand_set_state_internal s)
let p_rand_get_state () = Effect.perform P_Rand_get_state_internal
let p_rand_set_state s = Effect.perform (P_Rand_set_state_internal s)

let effc (type a) (eff : a Effect.t) : ((a, 'b) Effect.Deep.continuation -> 'b) option =
  match eff with
  | P_Rand_internal -> Some (fun k -> Effect.Deep.continue k (p_rand_direct ()))
  | P_Rand_get_state_internal -> Some (fun k -> Effect.Deep.continue k (p_rand_get_state_direct ()))
  | P_Rand_set_state_internal s -> Some (fun k -> p_rand_set_state_direct s; Effect.Deep.continue k ())
  | _ -> None
;;
