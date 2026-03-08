(* Bridge adapter for object management functions. *)

external obj_detach_one_c : int -> unit = "cd_ox_effect_obj_detach_one"
external get_attached_obj_c : int -> int = "cd_ox_get_attached_obj"
external get_seg_first_object_c : int -> int = "cd_ox_get_seg_first_object"
external get_obj_next_c : int -> int = "cd_ox_get_obj_next"
external get_highest_segment_index_c : unit -> int = "cd_ox_get_highest_segment_index"
external johns_obj_unlink_c : int -> int -> unit = "cd_ox_effect_johns_obj_unlink"
external get_obj_segnum_c : int -> int = "cd_ox_get_obj_segnum"
external get_highest_object_index_c : unit -> int = "cd_ox_get_highest_object_index"
external get_obj_type_c : int -> int = "cd_ox_get_obj_type"
external fetch_wake_up_context_c : int -> int array = "cd_ox_effect_fetch_wake_up_context"
external fetch_ai_local_awareness_c : int -> int = "cd_ox_effect_fetch_ai_local_awareness"
external apply_wake_up_c : int array -> unit = "cd_ox_effect_apply_wake_up"
external fetch_obj_allocate_data_c : unit -> int array = "cd_ox_effect_fetch_obj_allocate_data"
external write_obj_allocate_result_c : int array -> unit = "cd_ox_effect_write_obj_allocate_result"
external call_free_object_slots_c : int -> unit = "cd_ox_effect_call_free_object_slots"
external fetch_compress_objects_data_c : unit -> int array = "cd_ox_effect_fetch_compress_objects_data"
external execute_compress_objects_c : int array -> unit = "cd_ox_effect_execute_compress_objects"
external fetch_marker_model_data_c : unit -> int array = "cd_ox_effect_fetch_marker_model_data"
external obj_create_marker_c : int array -> int = "cd_ox_effect_obj_create_marker"
external write_marker_obj_props_c : int array -> unit = "cd_ox_effect_write_marker_obj_props"
external update_object_seg_result_c : int -> int = "cd_ox_effect_update_object_seg_result"
external compute_segment_center_set_pos_c : int -> unit = "cd_ox_effect_compute_segment_center_set_pos"

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
  | Ox_obj.Johns_obj_unlink_internal (segnum, objnum) ->
    Some (fun k -> johns_obj_unlink_c segnum objnum; Effect.Deep.continue k ())
  | Ox_obj.Get_obj_segnum_internal objnum ->
    Some (fun k -> Effect.Deep.continue k (get_obj_segnum_c objnum))
  | Ox_obj.Get_highest_object_index_internal ->
    Some (fun k -> Effect.Deep.continue k (get_highest_object_index_c ()))
  | Ox_obj.Get_obj_type_internal objnum ->
    Some (fun k -> Effect.Deep.continue k (get_obj_type_c objnum))
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
  | Ox_obj.Fetch_compress_objects_data ->
    Some (fun k -> Effect.Deep.continue k (fetch_compress_objects_data_c ()))
  | Ox_obj.Execute_compress_objects packed ->
    Some (fun k -> execute_compress_objects_c packed; Effect.Deep.continue k ())
  | Ox_obj.Fetch_marker_model_data ->
    Some (fun k -> Effect.Deep.continue k (fetch_marker_model_data_c ()))
  | Ox_obj.Obj_create_marker packed ->
    Some (fun k -> Effect.Deep.continue k (obj_create_marker_c packed))
  | Ox_obj.Write_marker_obj_props packed ->
    Some (fun k -> write_marker_obj_props_c packed; Effect.Deep.continue k ())
  | Ox_obj.Update_object_seg_result_internal objnum ->
    Some (fun k -> Effect.Deep.continue k (update_object_seg_result_c objnum))
  | Ox_obj.Compute_segment_center_set_pos_internal objnum ->
    Some (fun k -> compute_segment_center_set_pos_c objnum; Effect.Deep.continue k ())
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

let cd_spin_object spin_rx spin_ry spin_rz
    o_rx o_ry o_rz o_ux o_uy o_uz o_fx o_fy o_fz
    frame_time =
  let orient = Ox_obj.spin_object
    ~spin_rate_x:spin_rx ~spin_rate_y:spin_ry ~spin_rate_z:spin_rz
    ~orient:((o_rx, o_ry, o_rz), (o_ux, o_uy, o_uz), (o_fx, o_fy, o_fz))
    ~frame_time
  in
  let (rx, ry, rz), (ux, uy, uz), (fx, fy, fz) = orient in
  (rx, ry, rz, ux, uy, uz, fx, fy, fz)

let cd_remove_all_objects_but segnum objnum =
  Effect.Deep.match_with
    (fun () -> Ox_obj.remove_all_objects_but ~segnum ~objnum)
    ()
    { retc = (fun () -> ())
    ; exnc = (fun _exn -> ())
    ; effc
    }

let cd_remove_incorrect_objects () =
  Effect.Deep.match_with
    (fun () -> Ox_obj.remove_incorrect_objects ())
    ()
    { retc = (fun () -> ())
    ; exnc = (fun _exn -> ())
    ; effc
    }

let cd_check_duplicate_objects () =
  Effect.Deep.match_with
    (fun () -> Ox_obj.check_duplicate_objects ())
    ()
    { retc = (fun v -> v)
    ; exnc = (fun _exn -> 0)
    ; effc
    }

let cd_compress_objects () =
  Effect.Deep.match_with
    (fun () -> Ox_obj.compress_objects ())
    ()
    { retc = (fun () -> ())
    ; exnc = (fun e ->
        Printf.eprintf "[OX] compress_objects exception: %s\n" (Exn.to_string e);
        Out_channel.flush stderr)
    ; effc
    }

let cd_drop_marker_object pos_x pos_y pos_z segnum
    orient_rx orient_ry orient_rz
    orient_ux orient_uy orient_uz
    orient_fx orient_fy orient_fz
    marker_num =
  Effect.Deep.match_with
    (fun () -> Ox_obj.drop_marker_object
      ~pos_x ~pos_y ~pos_z ~segnum
      ~orient_rx ~orient_ry ~orient_rz
      ~orient_ux ~orient_uy ~orient_uz
      ~orient_fx ~orient_fy ~orient_fz
      ~marker_num)
    ()
    { retc = (fun v -> v)
    ; exnc = (fun _exn -> -1)
    ; effc
    }

let cd_fix_object_segs () =
  Effect.Deep.match_with
    (fun () -> Ox_obj.fix_object_segs ())
    ()
    { retc = (fun () -> ())
    ; exnc = (fun _exn -> ())
    ; effc
    }

(* FVI effect external — same C symbol as physics_sim bridge *)
external effect_find_vector_intersection
  :  int array
  -> int array
  = "cd_ox_effect_ps_find_vector_intersection"

(* set_camera_pos: needs FVI + P_Rand effects *)
let cd_set_camera_pos cam_x cam_y cam_z
    obj_x obj_y obj_z obj_segnum obj_index
    camera_to_player_dist_goal =
  Effect.Deep.match_with
    (fun () -> Ox_obj.set_camera_pos
      ~cam_x ~cam_y ~cam_z
      ~obj_x ~obj_y ~obj_z ~obj_segnum ~obj_index
      ~camera_to_player_dist_goal)
    ()
    { retc = (fun (x, y, z) -> (x, y, z))
    ; exnc = (fun _exn ->
        Printf.eprintf "[OX] set_camera_pos exception: %s\n" (Exn.to_string _exn);
        Out_channel.flush stderr;
        (cam_x, cam_y, cam_z))
    ; effc =
        (fun (type a) (eff : a Effect.t) ->
          match eff with
          | Ox_physics_sim.Find_vector_intersection
              (p0x, p0y, p0z, p1x, p1y, p1z, rad, thisobjnum, ignore_list, flags, startseg)
            ->
            Some
              (fun (k : (a, _) Effect.Deep.continuation) ->
                try
                  let query =
                    [| p0x; p0y; p0z; p1x; p1y; p1z; rad; thisobjnum; flags; startseg
                     ; Array.length ignore_list
                    |]
                  in
                  let fpacked = Array.append query ignore_list in
                  let result = effect_find_vector_intersection fpacked in
                  let fate = result.(0) in
                  let hit_px = result.(1) in
                  let hit_py = result.(2) in
                  let hit_pz = result.(3) in
                  let hit_seg = result.(4) in
                  let hit_side = result.(5) in
                  let hit_side_seg = result.(6) in
                  let hit_object = result.(7) in
                  let wn_x = result.(8) in
                  let wn_y = result.(9) in
                  let wn_z = result.(10) in
                  let n_segs = result.(11) in
                  let seglist = Array.sub result ~pos:12 ~len:n_segs in
                  Effect.Deep.continue
                    k
                    ( fate, hit_px, hit_py, hit_pz, hit_seg, hit_side, hit_side_seg
                    , hit_object, wn_x, wn_y, wn_z, n_segs, seglist )
                with Invalid_argument _ ->
                  Effect.Deep.continue k (0, p0x, p0y, p0z, startseg, 0, -1, -1, 0, 0, 0, 0, [||]))
          | Ox_misc.P_Rand_internal ->
            Some (fun k -> Effect.Deep.continue k (Ox_misc.p_rand_direct ()))
          | _ ->
            (match effc eff with
             | Some handler -> Some handler
             | None -> None))
    }

let register_callbacks () =
  Callback.register "search_all_segments_for_object" search_all_segments_for_object_wrapper;
  Callback.register "cd_set_robot_location_info" cd_set_robot_location_info;
  Callback.register "cd_wake_up_rendered_objects" cd_wake_up_rendered_objects;
  Callback.register "cd_obj_allocate" cd_obj_allocate;
  Callback.register "cd_spin_object" cd_spin_object;
  Callback.register "cd_remove_all_objects_but" cd_remove_all_objects_but;
  Callback.register "cd_remove_incorrect_objects" cd_remove_incorrect_objects;
  Callback.register "cd_compress_objects" cd_compress_objects;
  Callback.register "cd_check_duplicate_objects" cd_check_duplicate_objects;
  Callback.register "cd_drop_marker_object" cd_drop_marker_object;
  Callback.register "cd_fix_object_segs" cd_fix_object_segs;
  Callback.register "cd_set_camera_pos" cd_set_camera_pos
