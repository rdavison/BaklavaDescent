(* Bridge adapter for object management functions. *)

external obj_detach_one_c : int -> unit = "cd_ox_effect_obj_detach_one"
external get_attached_obj_c : int -> int = "cd_ox_get_attached_obj"
external get_seg_first_object_c : int -> int = "cd_ox_get_seg_first_object"
external get_obj_next_c : int -> int = "cd_ox_get_obj_next"
external get_highest_segment_index_c : unit -> int = "cd_ox_get_highest_segment_index"
external fetch_wake_up_context_c : int -> int array = "cd_ox_effect_fetch_wake_up_context"
external fetch_ai_local_awareness_c : int -> int = "cd_ox_effect_fetch_ai_local_awareness"
external apply_wake_up_c : int array -> unit = "cd_ox_effect_apply_wake_up"
external fetch_obj_allocate_data_c : unit -> int array = "cd_ox_effect_fetch_obj_allocate_data"
external write_obj_allocate_result_c : int array -> unit = "cd_ox_effect_write_obj_allocate_result"
external call_free_object_slots_c : int -> unit = "cd_ox_effect_call_free_object_slots"

let effc (type a) (eff : a Effect.t) : ((a, 'b) Effect.Deep.continuation -> 'b) option =
  match eff with
  | Ox_obj.Obj_detach_one_internal objnum ->
    Some (fun k -> obj_detach_one_c objnum; Effect.Deep.continue k ())
  | Ox_obj.Get_attached_obj_internal objnum ->
    Some (fun k -> Effect.Deep.continue k (get_attached_obj_c objnum))
  | Ox_obj.Get_seg_first_object_internal segnum ->
    Some (fun k -> Effect.Deep.continue k (get_seg_first_object_c segnum))
  | Ox_obj.Get_obj_next_internal objnum ->
    Some (fun k -> Effect.Deep.continue k (get_obj_next_c objnum))
  | Ox_obj.Get_highest_segment_index_internal ->
    Some (fun k -> Effect.Deep.continue k (get_highest_segment_index_c ()))
  | Ox_obj.Fetch_wake_up_context_internal window_num ->
    Some (fun k -> Effect.Deep.continue k (fetch_wake_up_context_c window_num))
  | Ox_obj.Fetch_ai_local_awareness_internal objnum ->
    Some (fun k -> Effect.Deep.continue k (fetch_ai_local_awareness_c objnum))
  | Ox_obj.Apply_wake_up_internal packed ->
    Some (fun k -> apply_wake_up_c packed; Effect.Deep.continue k ())
  | Ox_obj.Fetch_obj_allocate_data ->
    Some (fun k -> Effect.Deep.continue k (fetch_obj_allocate_data_c ()))
  | Ox_obj.Write_obj_allocate_result packed ->
    Some (fun k -> write_obj_allocate_result_c packed; Effect.Deep.continue k ())
  | Ox_obj.Call_free_object_slots num_used ->
    Some (fun k -> call_free_object_slots_c num_used; Effect.Deep.continue k ())
  | _ -> None
;;

let search_all_segments_for_object_wrapper objnum =
  Effect.Deep.match_with
    (fun () -> Ox_obj.search_all_segments_for_object ~objnum)
    ()
    { retc = (fun v -> v)
    ; exnc = (fun _exn -> 0)
    ; effc
    }

let cd_set_robot_location_info
    player_fired obj_px obj_py obj_pz
    vp_x vp_y vp_z
    r1 r2 r3 u1 u2 u3 f1 f2 f3
    laser_sig =
  let (should_update, num, sig_) =
    Ox_obj.set_robot_location_info
      ~player_fired_laser_this_frame:player_fired
      ~obj_pos_x:obj_px ~obj_pos_y:obj_py ~obj_pos_z:obj_pz
      ~view_pos_x:vp_x ~view_pos_y:vp_y ~view_pos_z:vp_z
      ~vm_r1:r1 ~vm_r2:r2 ~vm_r3:r3
      ~vm_u1:u1 ~vm_u2:u2 ~vm_u3:u3
      ~vm_f1:f1 ~vm_f2:f2 ~vm_f3:f3
      ~laser_obj_signature:laser_sig
  in
  (should_update, num, sig_)

let cd_wake_up_rendered_objects viewer_objnum window_num =
  Effect.Deep.match_with
    (fun () -> Ox_obj.wake_up_rendered_objects ~viewer_objnum ~window_num)
    ()
    { retc = (fun _v -> ())
    ; exnc = (fun _exn -> ())
    ; effc
    }

let cd_obj_allocate () =
  Effect.Deep.match_with
    (fun () -> Ox_obj.obj_allocate ())
    ()
    { retc = (fun v -> v)
    ; exnc = (fun _exn -> -1)
    ; effc
    }

let register_callbacks () =
  Callback.register "search_all_segments_for_object" search_all_segments_for_object_wrapper;
  Callback.register "cd_set_robot_location_info" cd_set_robot_location_info;
  Callback.register "cd_wake_up_rendered_objects" cd_wake_up_rendered_objects;
  Callback.register "cd_obj_allocate" cd_obj_allocate
