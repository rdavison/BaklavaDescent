(* ox_obj.ml — Object management functions ported from object.cpp *)

open Core

(* -- Algebraic effects -------------------------------------------------- *)

type _ Effect.t +=
  | Obj_detach_one_internal : int -> unit Effect.t
  | Get_attached_obj_internal : int -> int Effect.t
  | Get_seg_first_object_internal : int -> int Effect.t
  | Get_obj_next_internal : int -> int Effect.t
  | Get_highest_segment_index_internal : int Effect.t
  | Johns_obj_unlink_internal : (int * int) -> unit Effect.t
  | Get_obj_segnum_internal : int -> int Effect.t
  | Get_highest_object_index_internal : int Effect.t
  | Get_obj_type_internal : int -> int Effect.t

let obj_detach_one objnum = Effect.perform (Obj_detach_one_internal objnum)
let get_attached_obj objnum = Effect.perform (Get_attached_obj_internal objnum)
let get_seg_first_object segnum = Effect.perform (Get_seg_first_object_internal segnum)
let get_obj_next objnum = Effect.perform (Get_obj_next_internal objnum)
let get_highest_segment_index () = Effect.perform Get_highest_segment_index_internal
let johns_obj_unlink ~segnum ~objnum = Effect.perform (Johns_obj_unlink_internal (segnum, objnum))
let get_obj_segnum objnum = Effect.perform (Get_obj_segnum_internal objnum)
let get_highest_object_index () = Effect.perform Get_highest_object_index_internal
let get_obj_type objnum = Effect.perform (Get_obj_type_internal objnum)

let max_objects = 350
let obj_none = 255

(* -- Ported functions --------------------------------------------------- *)

(* Count occurrences of object objn in segment segnum's object linked list.
   C original: int is_object_in_seg(int segnum, int objn)
   Debug-only function (#ifndef NDEBUG). *)
let is_object_in_seg ~segnum ~objn =
  let count = ref 0 in
  let objnum = ref (get_seg_first_object segnum) in
  let done_ = ref false in
  while not !done_ do
    if !objnum = -1 then
      done_ := true
    else begin
      if !count > max_objects then begin
        (* Int3() — debug break in C; just return count *)
        done_ := true
      end else begin
        if !objnum = objn then count := !count + 1;
        objnum := get_obj_next !objnum
      end
    end
  done;
  !count
;;

(* Search all segments for occurrences of object objnum.
   C original: int search_all_segments_for_object(int objnum)
   Debug-only function (#ifndef NDEBUG). *)
let search_all_segments_for_object ~objnum =
  let count = ref 0 in
  let highest = get_highest_segment_index () in
  for i = 0 to highest do
    count := !count + is_object_in_seg ~segnum:i ~objn:objnum
  done;
  !count
;;

(* Unlink object objnum from every segment except segnum.
   C original: void remove_all_objects_but(int segnum, int objnum) *)
let remove_all_objects_but ~segnum ~objnum =
  let highest = get_highest_segment_index () in
  for i = 0 to highest do
    if segnum <> i then begin
      if is_object_in_seg ~segnum:i ~objn:objnum > 0 then
        johns_obj_unlink ~segnum:i ~objnum
    end
  done
;;

(* Check for objects that appear in multiple segment linked lists.
   If found, remove duplicates and return the count.
   C original: int check_duplicate_objects() — debug-only function. *)
let check_duplicate_objects () =
  let highest = get_highest_object_index () in
  let result = ref 0 in
  let done_ = ref false in
  let i = ref 0 in
  while not !done_ && !i <= highest do
    let obj_type = get_obj_type !i in
    if obj_type <> obj_none then begin
      let count = search_all_segments_for_object ~objnum:(!i) in
      if count > 1 then begin
        (* Int3() in C — debug break; we just fix and return *)
        let obj_seg = get_obj_segnum !i in
        remove_all_objects_but ~segnum:obj_seg ~objnum:(!i);
        result := count;
        done_ := true
      end
    end;
    i := !i + 1
  done;
  !result
;;

(* Remove objects whose segnum doesn't match the segment they're linked in.
   C original: void remove_incorrect_objects() *)
let remove_incorrect_objects () =
  let highest = get_highest_segment_index () in
  for segnum = 0 to highest do
    let count = ref 0 in
    let objnum = ref (get_seg_first_object segnum) in
    let done_ = ref false in
    while not !done_ do
      if !objnum = -1 then
        done_ := true
      else begin
        count := !count + 1;
        if !count > max_objects then
          done_ := true
        else begin
          let obj_seg = get_obj_segnum !objnum in
          if obj_seg <> segnum then
            johns_obj_unlink ~segnum ~objnum:(!objnum);
          objnum := get_obj_next !objnum
        end
      end
    done
  done
;;

(* Detaches all objects from this object.
   C original: void obj_detach_all(object* parent)
   Loops calling obj_detach_one on each attached object until none remain. *)
let obj_detach_all ~parent_objnum =
  let continue_loop = ref true in
  while !continue_loop do
    let attached = get_attached_obj parent_objnum in
    if attached <> -1 then
      obj_detach_one attached
    else
      continue_loop := false
  done
;;

let f1_0 = 0x10000
let obj_robot = 2

(* -- Effects for wake_up_rendered_objects -------------------------------- *)

(* Fetch_wake_up_context(window_num) returns packed int array:
   [0] = frame_count
   [1] = window_frame
   [2] = viewer_px
   [3] = viewer_py
   [4] = viewer_pz
   [5] = num_rendered
   For each rendered object i (0..num_rendered-1):
     [6 + i*5 + 0] = objnum
     [6 + i*5 + 1] = obj_type
     [6 + i*5 + 2] = pos_x
     [6 + i*5 + 3] = pos_y
     [6 + i*5 + 4] = pos_z
*)
type _ Effect.t +=
  | Fetch_wake_up_context_internal : int -> int array Effect.t
  | Fetch_ai_local_awareness_internal : int -> int Effect.t
  | Apply_wake_up_internal : int array -> unit Effect.t

let fetch_wake_up_context window_num =
  Effect.perform (Fetch_wake_up_context_internal window_num)
let fetch_ai_local_awareness objnum =
  Effect.perform (Fetch_ai_local_awareness_internal objnum)
let apply_wake_up packed =
  Effect.perform (Apply_wake_up_internal packed)

(* set_robot_location_info: check if robot rendered near screen center
   while player fired a laser. If so, return the danger laser info.
   Returns (should_update, danger_laser_num, danger_laser_signature).
   should_update = 1 means the caller should write danger_laser_num and
   danger_laser_signature to the object's ai_info. *)
let set_robot_location_info
    ~player_fired_laser_this_frame
    ~obj_pos_x ~obj_pos_y ~obj_pos_z
    ~view_pos_x ~view_pos_y ~view_pos_z
    ~vm_r1 ~vm_r2 ~vm_r3
    ~vm_u1 ~vm_u2 ~vm_u3
    ~vm_f1 ~vm_f2 ~vm_f3
    ~laser_obj_signature =
  if player_fired_laser_this_frame = -1 then
    (0, 0, 0)
  else begin
    let (rx, ry, _rz), codes =
      Ox_3d.g3_rotate_point
        ~view_pos:(view_pos_x, view_pos_y, view_pos_z)
        ~view_matrix:((vm_r1, vm_r2, vm_r3), (vm_u1, vm_u2, vm_u3), (vm_f1, vm_f2, vm_f3))
        (obj_pos_x, obj_pos_y, obj_pos_z)
    in
    if codes land Ox_3d.cc_behind <> 0 then
      (0, 0, 0)
    else if Int.abs rx < f1_0 * 4 && Int.abs ry < f1_0 * 4 then
      (1, player_fired_laser_this_frame, laser_obj_signature)
    else
      (0, 0, 0)
  end
;;

(* wake_up_rendered_objects: Wake up robots rendered by a missile camera.
   C original: void wake_up_rendered_objects(object* viewer, int window_num)
   in main_d2/object.cpp.
   viewer_objnum = viewer - Objects (the missile object number).
   Returns packed int array:
     [0] = valid (0 = bogus window, 1 = valid)
     [1] = num_wakeups
     [2..] = objnums to wake up *)
let wake_up_rendered_objects ~viewer_objnum ~window_num =
  let ctx = fetch_wake_up_context window_num in
  let frame_count = ctx.(0) in
  let window_frame = ctx.(1) in
  (* Make sure that we are processing current data. *)
  if frame_count <> window_frame then
    [| 0; 0 |]  (* bogus window *)
  else begin
    let viewer_px = ctx.(2) in
    let viewer_py = ctx.(3) in
    let viewer_pz = ctx.(4) in
    let num_rendered = ctx.(5) in
    let wakeups = Array.create ~len:50 0 in
    let num_wakeups = ref 0 in
    let fcval = frame_count land 3 in
    for i = 0 to num_rendered - 1 do
      let base = 6 + i * 5 in
      let objnum = ctx.(base) in
      if (objnum land 3) = fcval then begin
        let obj_type = ctx.(base + 1) in
        if obj_type = obj_robot then begin
          let obj_px = ctx.(base + 2) in
          let obj_py = ctx.(base + 3) in
          let obj_pz = ctx.(base + 4) in
          let dist = Ox_math.vm_vec_dist_quick
              ~a:(viewer_px, viewer_py, viewer_pz)
              ~b:(obj_px, obj_py, obj_pz) in
          if dist < f1_0 * 100 then begin
            let awareness = fetch_ai_local_awareness objnum in
            if awareness = 0 then begin
              wakeups.(!num_wakeups) <- objnum;
              num_wakeups := !num_wakeups + 1
            end
          end
        end
      end
    done;
    (* Build result: [valid; num_wakeups; viewer_objnum; wakeup_0; ...] *)
    let result = Array.create ~len:(3 + !num_wakeups) 0 in
    result.(0) <- 1;
    result.(1) <- !num_wakeups;
    result.(2) <- viewer_objnum;
    for i = 0 to !num_wakeups - 1 do
      result.(3 + i) <- wakeups.(i)
    done;
    (* Apply wake-ups via effect *)
    apply_wake_up result;
    result
  end
;;

(* -- Effects for obj_allocate -------------------------------------------- *)

(* Fetch_obj_allocate_data returns packed int array:
   [0] = num_objects
   [1] = highest_object_index
   [2] = highest_ever_object_index
   [3] = is_d2
   [4] = free_obj_list[num_objects] (or -1 if num_objects >= MAX_OBJECTS)
   [5..5+MAX_OBJECTS-1] = Objects[0..MAX_OBJECTS-1].type
*)
type _ Effect.t +=
  | Fetch_obj_allocate_data : int array Effect.t
  | Write_obj_allocate_result : int array -> unit Effect.t
  | Call_free_object_slots : int -> unit Effect.t

let fetch_obj_allocate_data () = Effect.perform Fetch_obj_allocate_data
let write_obj_allocate_result packed = Effect.perform (Write_obj_allocate_result packed)
let call_free_object_slots num_used = Effect.perform (Call_free_object_slots num_used)

(* obj_allocate: Allocate the next free object slot.
   C original: int obj_allocate(void) in object.cpp
   D2 version calls free_object_slots when approaching capacity.
   Returns objnum, or -1 if no free slots. *)
let obj_allocate () =
  let data = ref (fetch_obj_allocate_data ()) in
  let num_obj = ref (!data).(0) in
  let highest = ref (!data).(1) in
  let highest_ever = ref (!data).(2) in
  let is_d2 = (!data).(3) in

  (* D2: try to free slots when approaching capacity *)
  if is_d2 <> 0 && !num_obj >= max_objects - 2 then begin
    call_free_object_slots (max_objects - 10);
    (* Re-fetch state since free_object_slots modified C globals *)
    data := fetch_obj_allocate_data ();
    num_obj := (!data).(0);
    highest := (!data).(1);
    highest_ever := (!data).(2)
  end;

  if !num_obj >= max_objects then
    -1
  else begin
    let objnum = (!data).(4) in
    num_obj := !num_obj + 1;

    if objnum > !highest then begin
      highest := objnum;
      if !highest > !highest_ever then
        highest_ever := !highest
    end;

    (* Count unused object slots *)
    let unused = ref 0 in
    for i = 0 to !highest do
      if (!data).(5 + i) = obj_none then
        unused := !unused + 1
    done;

    (* Write back: [objnum, num_objects, highest, highest_ever, unused_slots] *)
    write_obj_allocate_result [| objnum; !num_obj; !highest; !highest_ever; !unused |];
    objnum
  end
;;

(* -- Effects for compress_objects ---------------------------------------- *)

(* Fetch_compress_objects_data returns packed int array:
   [0] = highest_object_index
   [1] = num_objects
   For each object i (0..MAX_OBJECTS-1):
     [2 + i*2] = Objects[i].type
     [2 + i*2 + 1] = Objects[i].segnum
*)
type _ Effect.t +=
  | Fetch_compress_objects_data : int array Effect.t
  | Execute_compress_objects : int array -> unit Effect.t

let fetch_compress_objects_data () = Effect.perform Fetch_compress_objects_data
let execute_compress_objects packed = Effect.perform (Execute_compress_objects packed)

(* compress_objects: make object array non-sparse.
   C original: void compress_objects(void) in object.cpp
   Computes swap plan from fetched data, then sends to C for execution.
   Execute_compress_objects packed format:
     [0] = num_swaps
     [1] = final_num_objects
     For each swap i:
       [2 + i*3] = src (the highest object index to move from)
       [2 + i*3 + 1] = dst (the gap to fill)
       [2 + i*3 + 2] = segnum (segment to link dst into)
*)
let compress_objects () =
  let data = fetch_compress_objects_data () in
  let highest = ref data.(0) in
  let num_obj = data.(1) in
  (* Local copies of types and segnums *)
  let types = Array.init max_objects ~f:(fun i -> data.(2 + i * 2)) in
  let segnums = Array.init max_objects ~f:(fun i -> data.(2 + i * 2 + 1)) in
  (* Collect swap operations *)
  let swaps = Array.create ~len:(max_objects * 3) 0 in
  let num_swaps = ref 0 in
  let start_i = ref 0 in
  while !start_i < !highest do
    if types.(!start_i) = obj_none then begin
      let segnum_copy = segnums.(!highest) in
      (* Record swap: move Objects[highest] to Objects[start_i] *)
      swaps.(!num_swaps * 3) <- !highest;
      swaps.(!num_swaps * 3 + 1) <- !start_i;
      swaps.(!num_swaps * 3 + 2) <- segnum_copy;
      num_swaps := !num_swaps + 1;
      (* Update local state to match what C will do *)
      types.(!start_i) <- types.(!highest);
      segnums.(!start_i) <- segnums.(!highest);
      types.(!highest) <- obj_none;
      (* Scan backward past OBJ_NONE entries *)
      highest := !highest - 1;
      while !highest > 0 && types.(!highest) = obj_none do
        highest := !highest - 1
      done
    end;
    start_i := !start_i + 1
  done;
  (* Build packed result *)
  let result = Array.create ~len:(2 + !num_swaps * 3) 0 in
  result.(0) <- !num_swaps;
  result.(1) <- num_obj;
  for i = 0 to !num_swaps * 3 - 1 do
    result.(2 + i) <- swaps.(i)
  done;
  execute_compress_objects result
;;

(* spin_object: process a continuously-spinning object.
   C original: void spin_object(object* obj) in object.cpp
   Pure math: takes spin_rate, orient, and frame_time, returns new orient.
   obj->movement_type must be MT_SPINNING (asserted in C). *)
let spin_object ~spin_rate_x ~spin_rate_y ~spin_rate_z ~orient ~frame_time =
  (* rotangs.p = fixmul(obj->mtype.spin_rate.x, FrameTime) *)
  let p = Ox_math.fixmul ~a:spin_rate_x ~b:frame_time in
  (* rotangs.h = fixmul(obj->mtype.spin_rate.y, FrameTime) *)
  let h = Ox_math.fixmul ~a:spin_rate_y ~b:frame_time in
  (* rotangs.b = fixmul(obj->mtype.spin_rate.z, FrameTime) *)
  let b = Ox_math.fixmul ~a:spin_rate_z ~b:frame_time in
  (* vm_angles_2_matrix(&rotmat, &rotangs) *)
  let rotmat = Ox_math.vm_angles_2_matrix ~v:(p, b, h) in
  (* vm_matrix_x_matrix(&new_pm, &obj->orient, &rotmat) *)
  let new_pm = Ox_math.vm_matrix_x_matrix ~a:orient ~b:rotmat in
  (* check_and_fix_matrix(&obj->orient) *)
  Ox_physics.check_and_fix_matrix ~orient:new_pm
;;

(* -- Effects for fix_object_segs ------------------------------------------ *)

type _ Effect.t +=
  | Update_object_seg_result_internal : int -> int Effect.t
  | Compute_segment_center_set_pos_internal : int -> unit Effect.t

let update_object_seg_result objnum = Effect.perform (Update_object_seg_result_internal objnum)
let compute_segment_center_set_pos objnum = Effect.perform (Compute_segment_center_set_pos_internal objnum)

(* fix_object_segs: Go through all objects and make sure they have the
   correct segment numbers. If update_object_seg fails, reset the
   object's position to the center of its current segment.
   C original: void fix_object_segs() in object.cpp *)
let fix_object_segs () =
  let highest = get_highest_object_index () in
  for i = 0 to highest do
    if get_obj_type i <> obj_none then begin
      if update_object_seg_result i = 0 then begin
        (* mprintf + Int3() omitted — debug only *)
        compute_segment_center_set_pos i
      end
    end
  done
;;

(* -- Effects for drop_marker_object --------------------------------------- *)

(* Fetch_marker_model_data returns packed int array:
   [0] = marker_model_num
   [1] = Polygon_models[marker_model_num].rad *)
type _ Effect.t +=
  | Fetch_marker_model_data : int array Effect.t
  | Obj_create_marker : int array -> int Effect.t
  | Write_marker_obj_props : int array -> unit Effect.t

let fetch_marker_model_data () = Effect.perform Fetch_marker_model_data
let obj_create_marker packed = Effect.perform (Obj_create_marker packed)
let write_marker_obj_props packed = Effect.perform (Write_marker_obj_props packed)

let obj_marker = 15
let ct_none = 0
let mt_none = 0
let rt_polyobj = 1
let immortal_time = 0x3fffffff

(* drop_marker_object: creates a marker object in the world.
   C original: int drop_marker_object(vms_vector* pos, int segnum,
                                       vms_matrix* orient, int marker_num)
   in main_d2/object.cpp.
   Returns the object number, or -1 if creation failed. *)
let drop_marker_object ~pos_x ~pos_y ~pos_z ~segnum
    ~orient_rx ~orient_ry ~orient_rz
    ~orient_ux ~orient_uy ~orient_uz
    ~orient_fx ~orient_fy ~orient_fz
    ~marker_num =
  let model_data = fetch_marker_model_data () in
  let marker_model_num = model_data.(0) in
  let radius = model_data.(1) in
  (* Assert(Marker_model_num != -1) *)
  assert (marker_model_num <> -1);
  (* obj_create(OBJ_MARKER, marker_num, segnum, pos, orient, radius, CT_NONE, MT_NONE, RT_POLYOBJ) *)
  let objnum = obj_create_marker [|
    obj_marker; marker_num; segnum;
    pos_x; pos_y; pos_z;
    orient_rx; orient_ry; orient_rz;
    orient_ux; orient_uy; orient_uz;
    orient_fx; orient_fy; orient_fz;
    radius; ct_none; mt_none; rt_polyobj
  |] in
  if objnum >= 0 then begin
    (* obj->rtype.pobj_info.model_num = Marker_model_num *)
    (* vm_vec_copy_scale(&obj->mtype.spin_rate, &obj->orient.uvec, F1_0/2) *)
    let (spin_x, spin_y, spin_z) =
      Ox_math.vm_vec_copy_scale
        ~v:(orient_ux, orient_uy, orient_uz)
        ~k:(f1_0 / 2)
    in
    (* obj->lifeleft = IMMORTAL_TIME - 1 *)
    write_marker_obj_props [| objnum; marker_model_num;
                              spin_x; spin_y; spin_z;
                              immortal_time - 1 |]
  end;
  objnum
;;

(* -- set_camera_pos ----------------------------------------------------- *)

let hit_none = 0
let hit_wall = 1

(* make_random_vector: generate a random unit-ish vector using P_Rand.
   Same logic as C make_random_vector. *)
let make_random_vector () =
  let rx = (Effect.perform Ox_misc.P_Rand_internal - 16384) lor 1 in
  let ry = Effect.perform Ox_misc.P_Rand_internal - 16384 in
  let rz = Effect.perform Ox_misc.P_Rand_internal - 16384 in
  let _, v = Ox_math.vm_vec_copy_normalize_quick ~v:(rx, ry, rz) in
  v

(* set_camera_pos: if camera is too close to the player object, push it away
   using FVI ray casts to avoid going through walls.
   C original: void set_camera_pos(vms_vector* camera_pos, object* objp)
   in main_d1/object.cpp and main_d2/object.cpp (identical).
   Returns (new_cam_x, new_cam_y, new_cam_z). *)
let set_camera_pos ~cam_x ~cam_y ~cam_z
    ~obj_x ~obj_y ~obj_z ~obj_segnum ~obj_index
    ~camera_to_player_dist_goal =
  let cam = ref (cam_x, cam_y, cam_z) in
  let camera_player_dist =
    Ox_math.vm_vec_dist_quick ~a:!cam ~b:(obj_x, obj_y, obj_z)
  in
  if camera_player_dist < camera_to_player_dist_goal then begin
    let player_camera_vec = ref (Ox_math.vm_vec_sub ~a:!cam ~b:(obj_x, obj_y, obj_z)) in
    let (pcvx, pcvy, pcvz) = !player_camera_vec in
    if pcvx = 0 && pcvy = 0 && pcvz = 0 then
      player_camera_vec := (f1_0 / 16, pcvy, pcvz);
    let hit_type = ref hit_wall in
    let far_scale = ref f1_0 in
    let count = ref 0 in
    while !hit_type <> hit_none && !count < 6 do
      count := !count + 1;
      (* vm_vec_normalize_quick *)
      let _, pcv_norm = Ox_math.vm_vec_normalize_quick ~v:!player_camera_vec in
      (* vm_vec_scale by Camera_to_player_dist_goal *)
      let pcv_scaled = Ox_math.vm_vec_scale ~v:pcv_norm ~k:camera_to_player_dist_goal in
      (* closer_p1 = objp->pos + player_camera_vec (scaled to goal dist) *)
      let closer_p1 = Ox_math.vm_vec_add ~a:(obj_x, obj_y, obj_z) ~b:pcv_scaled in
      (* scale further by far_scale for the FVI ray endpoint *)
      let pcv_far = Ox_math.vm_vec_scale ~v:pcv_scaled ~k:!far_scale in
      (* local_p1 = objp->pos + pcv_far *)
      let local_p1 = Ox_math.vm_vec_add ~a:(obj_x, obj_y, obj_z) ~b:pcv_far in
      let (lp1x, lp1y, lp1z) = local_p1 in
      (* find_vector_intersection *)
      let (fate, _hit_px, _hit_py, _hit_pz, _hit_seg, _hit_side,
           _hit_side_seg, _hit_object, _wn_x, _wn_y, _wn_z,
           _n_segs, _seglist) =
        Effect.perform
          (Ox_physics_sim.Find_vector_intersection
             ( obj_x, obj_y, obj_z
             , lp1x, lp1y, lp1z
             , 0 (* rad *)
             , obj_index (* thisobjnum *)
             , [| -1 |] (* ignore_obj_list *)
             , 0 (* flags *)
             , obj_segnum (* startseg *) ))
      in
      if fate = hit_none then
        cam := closer_p1
      else begin
        player_camera_vec := make_random_vector ();
        far_scale := 3 * f1_0 / 2
      end;
      hit_type := fate
    done
  end;
  !cam
;;
