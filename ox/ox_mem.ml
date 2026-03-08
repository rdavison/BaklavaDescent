(* ChocolateDescent memory tracking effects. *)

type _ Effect.t +=
  | Mem_malloc_internal : int * string * string * int * int -> nativeint Effect.t
  | Mem_free_internal : nativeint -> unit Effect.t
  | Mem_display_blocks_internal : unit Effect.t
  | Mem_validate_heap_internal : unit Effect.t
  | Get_show_mem_info_internal : unit -> int Effect.t
  | Set_show_mem_info_internal : int -> unit Effect.t

let mem_malloc size var file line fill_zero =
  Effect.perform (Mem_malloc_internal (size, var, file, line, fill_zero))
;;

let mem_free ptr = Effect.perform (Mem_free_internal ptr)
let mem_display_blocks () = Effect.perform Mem_display_blocks_internal
let mem_validate_heap () = Effect.perform Mem_validate_heap_internal
let get_show_mem_info () = Effect.perform (Get_show_mem_info_internal ())
let set_show_mem_info v = Effect.perform (Set_show_mem_info_internal v)

let effc (type a) (eff : a Effect.t) : ((a, 'b) Effect.Deep.continuation -> 'b) option =
  ignore eff;
  None
;;
