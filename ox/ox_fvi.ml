(* FVI (Find Vector Intersection) pure geometry functions.
   Ported from main_d1/fvi.cpp. *)

type vec3 = int * int * int

let ij_table = [| [| 2; 1 |]; [| 0; 2 |]; [| 1; 0 |] |]
let it_none = 0
let it_face = 1
let it_edge = 2
let it_point = 3

(* Wrap native int to signed 32-bit range, matching C int32_t overflow. *)
let wrap32 x = Ox_math.wrap_i64_to_fix (Int64.of_int x)

(* Overflow guard: returns true if abs(a)*abs(b) would overflow bit 47+. *)
let oflow_check ~a ~b =
  let tmp = Int64.(abs (of_int a) * abs (of_int b)) in
  Int64.(shift_right tmp 47 <> 0L)
;;

(* Find where line p0->p1 intersects plane (plane_pnt, plane_norm),
   accounting for radius offset. Returns Some newp if found, None if parallel/no-hit. *)
let find_plane_line_intersection ~plane_pnt ~plane_norm ~p0 ~p1 ~rad =
  let open Ox_math in
  let d = vm_vec_sub ~a:p1 ~b:p0 in
  let w = vm_vec_sub ~a:p0 ~b:plane_pnt in
  let num_raw = vm_vec_dotprod ~a:plane_norm ~b:w in
  let den = wrap32 (-vm_vec_dotprod ~a:plane_norm ~b:d) in
  let num = wrap32 (num_raw - rad) in
  (* Check for various bad values — C operator precedence:
     (den == 0) || ((den > 0) && ((num > den) || ((-num >> 15) >= den)))
                 || (den < 0 && num < den) *)
  let neg_num = wrap32 (-num) in
  if den = 0
  then None
  else if den > 0 && (num > den || neg_num asr 15 >= den)
  then None
  else if den < 0 && num < den
  then None
  else (
    let f1_0 = 0x10000 in
    if abs num / (f1_0 / 2) >= abs den
    then None (* would overflow *)
    else (
      let k = fixdiv ~a:num ~b:den in
      let dx, dy, dz = d in
      if oflow_check ~a:dx ~b:k || oflow_check ~a:dy ~b:k || oflow_check ~a:dz ~b:k
      then None
      else (
        let scaled = vm_vec_scale2 ~v:d ~n:num ~d:den in
        let newp = vm_vec_add ~a:p0 ~b:scaled in
        Some (k, newp))))
;;

(* 2D point-in-polygon test. Projects face onto a 2D plane using ij_table
   based on the largest component of the normal. Returns an edgemask where
   bit N is set if the point is outside edge N. *)
let check_point_to_face ~checkp ~norm ~nv ~(vertex_positions : vec3 array) =
  let open Ox_math in
  let cpx, cpy, cpz = checkp in
  let cp = [| cpx; cpy; cpz |] in
  let nx, ny, nz = norm in
  let n = [| nx; ny; nz |] in
  let tx = abs nx in
  let ty = abs ny in
  let tz = abs nz in
  let biggest = if tx > ty then if tx > tz then 0 else 2 else if ty > tz then 1 else 2 in
  let i, j =
    if n.(biggest) > 0
    then ij_table.(biggest).(0), ij_table.(biggest).(1)
    else ij_table.(biggest).(1), ij_table.(biggest).(0)
  in
  let check_i = cp.(i) in
  let check_j = cp.(j) in
  let edgemask = ref 0 in
  for edge = 0 to nv - 1 do
    let vx0, vy0, vz0 = vertex_positions.(edge) in
    let v0 = [| vx0; vy0; vz0 |] in
    let vx1, vy1, vz1 = vertex_positions.((edge + 1) mod nv) in
    let v1 = [| vx1; vy1; vz1 |] in
    let edge_i = wrap32 (v1.(i) - v0.(i)) in
    let edge_j = wrap32 (v1.(j) - v0.(j)) in
    let chk_i = wrap32 (check_i - v0.(i)) in
    let chk_j = wrap32 (check_j - v0.(j)) in
    let d = wrap32 (fixmul ~a:chk_i ~b:edge_j - fixmul ~a:chk_j ~b:edge_i) in
    if d < 0 then edgemask := !edgemask lor (1 lsl edge)
  done;
  !edgemask
;;

(* Check if a sphere (center pnt, radius rad) intersects a face.
   Returns IT_FACE, IT_EDGE, IT_POINT, or IT_NONE. *)
let check_sphere_to_face ~pnt ~norm ~nv ~rad ~(vertex_positions : vec3 array) =
  let open Ox_math in
  let edgemask = check_point_to_face ~checkp:pnt ~norm ~nv ~vertex_positions in
  if edgemask = 0
  then it_face
  else (
    (* Find first set bit *)
    let em = ref edgemask in
    let edgenum = ref 0 in
    while !em land 1 = 0 do
      em := !em asr 1;
      incr edgenum
    done;
    let v0 = vertex_positions.(!edgenum) in
    let v1 = vertex_positions.((!edgenum + 1) mod nv) in
    let checkvec = vm_vec_sub ~a:pnt ~b:v0 in
    let edgelen, edgevec = vm_vec_normalized_dir ~v_end:v1 ~v_start:v0 in
    let d = vm_vec_dotprod ~a:edgevec ~b:checkvec in
    if wrap32 (d + rad) < 0
    then it_none
    else if wrap32 (d - rad) > edgelen
    then it_none
    else (
      let itype = ref it_point in
      let closest_point =
        if d < 0
        then v0
        else if d > edgelen
        then v1
        else (
          itype := it_edge;
          vm_vec_scale_add ~a:v0 ~b:edgevec ~k:d)
      in
      let dist = vm_vec_dist ~a:pnt ~b:closest_point in
      if dist <= rad then if !itype = it_point then it_none else !itype else it_none))
;;

(* 3x3 matrix determinant — all intermediate sums wrap to 32-bit like C *)
let calc_det_value ~rvec:(rx, ry, rz) ~uvec:(ux, uy, uz) ~fvec:(fx, fy, fz) =
  let open Ox_math in
  let a = fixmul ~a:rx ~b:(fixmul ~a:uy ~b:fz) in
  let b = wrap32 (a - fixmul ~a:rx ~b:(fixmul ~a:uz ~b:fy)) in
  let c = wrap32 (b - fixmul ~a:ry ~b:(fixmul ~a:ux ~b:fz)) in
  let d = wrap32 (c + fixmul ~a:ry ~b:(fixmul ~a:uz ~b:fx)) in
  let e = wrap32 (d + fixmul ~a:rz ~b:(fixmul ~a:ux ~b:fy)) in
  wrap32 (e - fixmul ~a:rz ~b:(fixmul ~a:uy ~b:fx))
;;

(* Line-line closest approach. Returns (ok, t1, t2).
   Lines: p1 + t*v1 and p2 + t*v2. *)
let check_line_to_line ~p1 ~v1 ~p2 ~v2 =
  let open Ox_math in
  let rvec = vm_vec_sub ~a:p2 ~b:p1 in
  let fvec = vm_vec_crossprod ~a:v1 ~b:v2 in
  let cross_mag2 = vm_vec_dotprod ~a:fvec ~b:fvec in
  if cross_mag2 = 0
  then false, 0, 0 (* parallel *)
  else (
    let d1 = calc_det_value ~rvec ~uvec:v2 ~fvec in
    if oflow_check ~a:d1 ~b:cross_mag2
    then false, 0, 0
    else (
      let t1 = fixdiv ~a:d1 ~b:cross_mag2 in
      let d2 = calc_det_value ~rvec ~uvec:v1 ~fvec in
      if oflow_check ~a:d2 ~b:cross_mag2
      then false, 0, 0
      else (
        let t2 = fixdiv ~a:d2 ~b:cross_mag2 in
        true, t1, t2)))
;;

(* Check if line p0->p1 intersects a face. Returns (hit_type, newp).
   vertex_list is the 6-element vertex index list from create_abs_vertex_lists.
   facenum selects which face (0 or 1 for triangulated sides).
   norm is the face normal for this facenum.
   seg_verts/seg_vert_positions supply vertex position lookup. *)
let check_line_to_face
      ~p0
      ~p1
      ~norm
      ~rad
      ~facenum
      ~nv
      ~num_faces
      ~(vertex_list : int array)
      ~(seg_verts : int array)
      ~(seg_vert_positions : vec3 array)
  =
  let open Ox_math in
  let vpos abs_idx = Ox_gameseg.lookup_vpos ~seg_verts ~seg_vert_positions ~abs_idx in
  (* Use lowest point number as plane point *)
  let vertnum =
    if num_faces = 2
    then min vertex_list.(0) vertex_list.(2)
    else (
      let v = ref vertex_list.(0) in
      for i = 1 to 3 do
        if vertex_list.(i) < !v then v := vertex_list.(i)
      done;
      !v)
  in
  let plane_pnt = vpos vertnum in
  match find_plane_line_intersection ~plane_pnt ~plane_norm:norm ~p0 ~p1 ~rad with
  | None -> it_none, (0, 0, 0)
  | Some (_k, newp) ->
    let checkp =
      if rad <> 0 then vm_vec_scale_add2 ~dest:newp ~src:norm ~k:(-rad) else newp
    in
    (* Build vertex positions for this face *)
    let face_verts = Array.init nv ~f:(fun i -> vpos vertex_list.((facenum * 3) + i)) in
    let hit =
      check_sphere_to_face ~pnt:checkp ~norm ~nv ~rad ~vertex_positions:face_verts
    in
    hit, newp
;;

(* special_check_line_to_face: handles the case where both start and end
   positions poke through the plane of a side. *)
let special_check_line_to_face
      ~p0
      ~p1
      ~norm
      ~rad
      ~facenum
      ~nv
      ~num_faces
      ~side_type:_
      ~sidenum:_
      ~(vertex_list : int array)
      ~(seg_verts : int array)
      ~(seg_vert_positions : vec3 array)
  =
  let open Ox_math in
  let vpos abs_idx = Ox_gameseg.lookup_vpos ~seg_verts ~seg_vert_positions ~abs_idx in
  (* Build vertex positions for this face *)
  let face_verts = Array.init nv ~f:(fun i -> vpos vertex_list.((facenum * 3) + i)) in
  (* Figure out which edge(s) to check against *)
  let edgemask = check_point_to_face ~checkp:p0 ~norm ~nv ~vertex_positions:face_verts in
  if edgemask = 0
  then
    (* Start point is inside face — fall back to check_line_to_face *)
    check_line_to_face
      ~p0
      ~p1
      ~norm
      ~rad
      ~facenum
      ~nv
      ~num_faces
      ~vertex_list
      ~seg_verts
      ~seg_vert_positions
  else (
    let em = ref edgemask in
    let edgenum = ref 0 in
    while !em land 1 = 0 do
      em := !em asr 1;
      incr edgenum
    done;
    let edge_v0 = face_verts.(!edgenum) in
    let edge_v1 = face_verts.((!edgenum + 1) mod nv) in
    let edge_vec = vm_vec_sub ~a:edge_v1 ~b:edge_v0 in
    let move_vec = vm_vec_sub ~a:p1 ~b:p0 in
    let edge_len, edge_vec_n = vm_vec_normalize ~v:edge_vec in
    let move_len, move_vec_n = vm_vec_normalize ~v:move_vec in
    let ok, edge_t, move_t =
      check_line_to_line ~p1:edge_v0 ~v1:edge_vec_n ~p2:p0 ~v2:move_vec_n
    in
    if not ok
    then it_none, (0, 0, 0)
    else if move_t < 0 || move_t > wrap32 (move_len + rad)
    then it_none, (0, 0, 0)
    else (
      let move_t2 = if move_t > move_len then move_len else move_t in
      let edge_t2 = if edge_t < 0 then 0 else edge_t in
      let edge_t2 = if edge_t2 > edge_len then edge_len else edge_t2 in
      let closest_point_edge = vm_vec_scale_add ~a:edge_v0 ~b:edge_vec_n ~k:edge_t2 in
      let closest_point_move = vm_vec_scale_add ~a:p0 ~b:move_vec_n ~k:move_t2 in
      let closest_dist = vm_vec_dist ~a:closest_point_edge ~b:closest_point_move in
      if closest_dist < wrap32 (fixmul ~a:rad ~b:15) / 20
      then (
        let newp = vm_vec_scale_add ~a:p0 ~b:move_vec_n ~k:(wrap32 (move_t - rad)) in
        it_edge, newp)
      else it_none, (0, 0, 0)))
;;

(* Ray-sphere intersection. Returns (dist, intp) where dist=0 means no hit. *)
let check_vector_to_sphere_1 ~p0 ~p1 ~sphere_pos ~sphere_rad =
  let open Ox_math in
  let d = vm_vec_sub ~a:p1 ~b:p0 in
  let w = vm_vec_sub ~a:sphere_pos ~b:p0 in
  let mag_d, dn = vm_vec_copy_normalize ~v:d in
  if mag_d = 0
  then (
    let int_dist = vm_vec_mag ~v:w in
    if int_dist < sphere_rad then int_dist, p0 else 0, p0)
  else (
    let w_dist = vm_vec_dotprod ~a:dn ~b:w in
    if w_dist < 0
    then 0, (0, 0, 0) (* moving away *)
    else if w_dist > wrap32 (mag_d + sphere_rad)
    then 0, (0, 0, 0) (* cannot hit *)
    else (
      let closest_point = vm_vec_scale_add ~a:p0 ~b:dn ~k:w_dist in
      let dist = vm_vec_dist ~a:closest_point ~b:sphere_pos in
      if dist < sphere_rad
      then (
        let dist2 = fixmul ~a:dist ~b:dist in
        let rad2 = fixmul ~a:sphere_rad ~b:sphere_rad in
        let shorten = fix_sqrt ~a:(wrap32 (rad2 - dist2)) in
        let int_dist = wrap32 (w_dist - shorten) in
        if int_dist > mag_d || int_dist < 0
        then 1, p0 (* inside sphere *)
        else (
          let intp = vm_vec_scale_add ~a:p0 ~b:dn ~k:int_dist in
          int_dist, intp))
      else 0, (0, 0, 0)))
;;

(* Object type constants matching object.h *)
let obj_robot = 2
let obj_player = 4
let obj_weapon = 5

(* Check vector-to-object intersection with adjusted collision radius.
   C original: fvi.cpp check_vector_to_object (D1+D2, identical)

   Adjusts the target object's size based on type:
   - Melee robots (attack_type != 0): size *= 3/4
   - Players bumping into other players or coop weapon: size /= 2

   Inputs:
     p0, p1          - line segment endpoints (vec3)
     rad              - collision radius from the moving object
     obj_pos          - target object position (vec3)
     obj_size         - target object size (fix)
     obj_type         - target object type (OBJ_ROBOT, OBJ_PLAYER, etc.)
     attack_type      - Robot_info[obj->id].attack_type (0 if not robot)
     otherobj_type    - other object's type
     game_mode_coop   - true if (Game_mode & GM_MULTI_COOP)
     otherobj_parent_type - otherobj->ctype.laser_info.parent_type

   Returns: (distance, intersection_point) — 0 distance means no hit *)
(* sphere_intersects_wall: check whether a sphere pokes through any wall
   of its segment, recursing into adjacent connected segments.

   Packed array layout:
   Header (6 ints): pnt.x, pnt.y, pnt.z, rad, segnum, n_segments
   Per-segment (80 ints each):
     [0..5]   children[0..5]
     [6..11]  side_types[0..5]
     [12..19] seg_verts[0..7] (absolute vertex indices)
     [20..55] normals: side 0..5, normals[0].xyz then normals[1].xyz
     [56..79] vertex_positions: vert 0..7, Vertices[seg->verts[i]].xyz

   Returns 1 if sphere intersects a solid wall, 0 otherwise.
   IS_CHILD(child) = child > -1. *)
let sphere_intersects_wall (arr : int array) =
  let pnt = arr.(0), arr.(1), arr.(2) in
  let rad = arr.(3) in
  let start_segnum = arr.(4) in
  let n_segments = arr.(5) in
  let header = 6 in
  let per_seg = 80 in
  (* Build a segnum -> index map. We use a simple scan since segment numbers
     may be sparse. The C callsite packs segments in order, and we need to
     map segment numbers to their offset in the packed array. We'll store
     the segment numbers in an array and do linear lookup, or we can use
     the children values directly as segment numbers and find them. *)
  (* Actually, the C callsite packs ALL segments (Highest_segment_index+1),
     indexed directly by segment number. So segment i's data is at
     header + i * per_seg. *)
  let visited = Array.create ~len:n_segments false in
  let get_seg_base segnum = header + (segnum * per_seg) in
  let rec walk segnum =
    if segnum < 0 || segnum >= n_segments
    then 0
    else if visited.(segnum)
    then 0
    else (
      visited.(segnum) <- true;
      let base = get_seg_base segnum in
      let children = Array.init 6 ~f:(fun i -> arr.(base + i)) in
      let side_types = Array.init 6 ~f:(fun i -> arr.(base + 6 + i)) in
      let seg_verts = Array.init 8 ~f:(fun i -> arr.(base + 12 + i)) in
      let normals =
        Array.init 12 ~f:(fun i ->
          let off = base + 20 + (i * 3) in
          arr.(off), arr.(off + 1), arr.(off + 2))
      in
      let seg_vert_positions =
        Array.init 8 ~f:(fun i ->
          let off = base + 56 + (i * 3) in
          arr.(off), arr.(off + 1), arr.(off + 2))
      in
      (* get_seg_masks to find facemask *)
      let facemask, _sidemask, _centermask =
        Ox_gameseg.get_seg_masks
          ~checkp:pnt
          ~rad
          ~seg_verts
          ~side_types
          ~normals
          ~seg_vert_positions
      in
      if facemask = 0
      then 0
      else (
        let result = ref 0 in
        let facebit = ref 1 in
        let side = ref 0 in
        while !side < 6 && facemask >= !facebit && !result = 0 do
          let face = ref 0 in
          while !face < 2 && !result = 0 do
            if facemask land !facebit <> 0
            then (
              let sn = !side in
              let fn = !face in
              let _num_faces, vertex_list =
                Ox_gameseg.create_abs_vertex_lists
                  ~side_type:side_types.(sn)
                  ~seg_verts
                  ~sidenum:sn
              in
              let nv = if _num_faces = 1 then 4 else 3 in
              let norm = normals.((sn * 2) + fn) in
              (* Build vertex positions for this face *)
              let vpos abs_idx =
                Ox_gameseg.lookup_vpos ~seg_verts ~seg_vert_positions ~abs_idx
              in
              let face_verts =
                Array.init nv ~f:(fun i -> vpos vertex_list.((fn * 3) + i))
              in
              let face_hit_type =
                check_sphere_to_face ~pnt ~norm ~nv ~rad ~vertex_positions:face_verts
              in
              if face_hit_type <> 0
              then (
                let child = children.(sn) in
                if child <= -1 then result := 1 else if walk child <> 0 then result := 1));
            facebit := !facebit lsl 1;
            incr face
          done;
          incr side
        done;
        !result))
  in
  walk start_segnum
;;

let check_vector_to_object
      ~p0
      ~p1
      ~rad
      ~obj_pos
      ~obj_size
      ~obj_type
      ~attack_type
      ~otherobj_type
      ~game_mode_coop
      ~otherobj_parent_type
  =
  let size = ref obj_size in
  if obj_type = obj_robot && attack_type <> 0 then size := !size * 3 / 4;
  if
    obj_type = obj_player
    && (otherobj_type = obj_player
        || (game_mode_coop
            && otherobj_type = obj_weapon
            && otherobj_parent_type = obj_player))
  then size := !size / 2;
  check_vector_to_sphere_1 ~p0 ~p1 ~sphere_pos:obj_pos ~sphere_rad:(!size + rad)
;;

(* ── find_vector_intersection / fvi_sub ───────────────── *)

(* Constants *)
let hit_none = 0
let hit_wall = 1
let hit_object = 2
let hit_bad_p0 = 3
let max_fvi_segs = 100
let max_segs_visited = 100
let obj_none = 255
let obj_powerup = 7
let max_object_types = 16

(* FQ flags *)
let fq_check_objs = 1
let fq_transwall = 2
let fq_transpoint = 4
let fq_get_seglist = 8

(* Callback to C's check_trans_wall for FQ_TRANSPOINT pixel-level check.
   Set by fvi_bridge.ml at init time.
   Args: segnum, sidenum, facenum, hit_x, hit_y, hit_z → 1 if passable *)
let check_trans_wall_callback : (int -> int -> int -> int -> int -> int -> int) ref =
  ref (fun _segnum _sidenum _facenum _hx _hy _hz -> 0)
;;

let fq_ignore_powerups = 16

(* WID flags *)
let wid_fly_flag = 1
let wid_render_flag = 2
let wid_rendpast_flag = 4
let wid_transparent_wall_d1 = 6 (* D1: equality check *)

(* Collision result *)
let result_nothing = 0

(* Packed array layout offsets *)
(* Header: *)
let h_p0x = 0
let h_p0y = 1
let h_p0z = 2
let h_startseg = 3
let h_p1x = 4
let h_p1y = 5
let h_p1z = 6
let h_rad = 7
let h_thisobjnum = 8
let h_flags = 9
let h_n_segments = 10
let h_n_objects = 11
let h_player_objnum = 12
let h_physics_cheat = 13
let h_game_mode_coop = 14
let h_game_time = 15
let h_is_d2 = 16
let h_ignore_obj_count = 17
let h_ignore_obj_list = 18

(* Per-segment block: 87 ints *)
let seg_block_size = 87

(* Per-object block: 14 ints *)
let obj_block_size = 14

(* Mutable state threaded through fvi_sub *)
type fvi_state =
  { mutable n_segs_visited : int
  ; segs_visited : int array
  ; mutable fvi_hit_object : int
  ; mutable fvi_hit_seg : int
  ; mutable fvi_hit_side : int
  ; mutable fvi_hit_side_seg : int
  ; mutable wall_norm : vec3
  ; mutable fvi_hit_seg2 : int
  ; mutable fvi_nest_count : int
  }

let make_fvi_state () =
  { n_segs_visited = 0
  ; segs_visited = Array.create ~len:max_segs_visited 0
  ; fvi_hit_object = -1
  ; fvi_hit_seg = -1
  ; fvi_hit_side = -1
  ; fvi_hit_side_seg = -1
  ; wall_norm = 0, 0, 0
  ; fvi_hit_seg2 = -1
  ; fvi_nest_count = 0
  }
;;

(* Unpack a segment block from the packed array *)
let unpack_seg (arr : int array) ~seg_base =
  let children = Array.init 6 ~f:(fun i -> arr.(seg_base + i)) in
  let side_types = Array.init 6 ~f:(fun i -> arr.(seg_base + 6 + i)) in
  let seg_verts = Array.init 8 ~f:(fun i -> arr.(seg_base + 12 + i)) in
  let normals =
    Array.init 12 ~f:(fun i ->
      let off = seg_base + 20 + (i * 3) in
      arr.(off), arr.(off + 1), arr.(off + 2))
  in
  let seg_vert_positions =
    Array.init 8 ~f:(fun i ->
      let off = seg_base + 56 + (i * 3) in
      arr.(off), arr.(off + 1), arr.(off + 2))
  in
  let wid = Array.init 6 ~f:(fun i -> arr.(seg_base + 80 + i)) in
  let first_object = arr.(seg_base + 86) in
  children, side_types, seg_verts, normals, seg_vert_positions, wid, first_object
;;

(* Unpack an object block *)
let unpack_obj (arr : int array) ~obj_base =
  let obj_type = arr.(obj_base) in
  let obj_id = arr.(obj_base + 1) in
  let obj_flags = arr.(obj_base + 2) in
  let obj_pos = arr.(obj_base + 3), arr.(obj_base + 4), arr.(obj_base + 5) in
  let obj_size = arr.(obj_base + 6) in
  let next_in_seg = arr.(obj_base + 7) in
  let parent_type = arr.(obj_base + 8) in
  let parent_num = arr.(obj_base + 9) in
  let parent_sig = arr.(obj_base + 10) in
  let creation_time = arr.(obj_base + 11) in
  let signature = arr.(obj_base + 12) in
  let attack_type = arr.(obj_base + 13) in
  ( obj_type
  , obj_id
  , obj_flags
  , obj_pos
  , obj_size
  , next_in_seg
  , parent_type
  , parent_num
  , parent_sig
  , creation_time
  , signature
  , attack_type )
;;

(* Check if objnum is in the ignore list *)
let obj_in_ignore_list (arr : int array) ~ignore_count ~objnum =
  let rec loop i =
    if i >= ignore_count
    then false
    else if arr.(h_ignore_obj_list + i) = objnum
    then true
    else loop (i + 1)
  in
  loop 0
;;

(* Inline laser_are_related using packed object data *)
let check_laser_related
      (arr : int array)
      ~obj_base_a
      ~objnum_a
      ~obj_base_b
      ~objnum_b
      ~game_time
      ~is_d2
  =
  let o1_type = arr.(obj_base_a) in
  let o1_id = arr.(obj_base_a + 1) in
  let o1_sig = arr.(obj_base_a + 12) in
  let o1_pnum = arr.(obj_base_a + 9) in
  let o1_psig = arr.(obj_base_a + 10) in
  let o1_ctime = arr.(obj_base_a + 11) in
  let o2_type = arr.(obj_base_b) in
  let o2_id = arr.(obj_base_b + 1) in
  let o2_sig = arr.(obj_base_b + 12) in
  let o2_pnum = arr.(obj_base_b + 9) in
  let o2_psig = arr.(obj_base_b + 10) in
  let o2_ctime = arr.(obj_base_b + 11) in
  let packed =
    [| objnum_a
     ; o1_type
     ; o1_id
     ; o1_sig
     ; o1_pnum
     ; o1_psig
     ; o1_ctime
     ; objnum_b
     ; o2_type
     ; o2_id
     ; o2_sig
     ; o2_pnum
     ; o2_psig
     ; o2_ctime
     ; game_time
    |]
  in
  if is_d2
  then Ox_collide.laser_are_related_d2 packed <> 0
  else Ox_collide.laser_are_related_d1 packed <> 0
;;

(* Get collision result from packed table.
   Table starts after header + ignore_obj_list. *)
let get_collision_table_base (arr : int array) =
  let ignore_count = arr.(h_ignore_obj_count) in
  h_ignore_obj_list + ignore_count
;;

let get_collision_result (arr : int array) ~table_base ~type_a ~type_b =
  if type_a >= max_object_types || type_b >= max_object_types
     || type_a < 0 || type_b < 0
  then result_nothing
  else arr.(table_base + (type_a * 16) + type_b)
;;

(* Compute base offsets for segments and objects in packed array *)
let get_seg_data_base (arr : int array) =
  let ignore_count = arr.(h_ignore_obj_count) in
  let table_base = h_ignore_obj_list + ignore_count in
  table_base + 256 (* 16*16 collision table *)
;;

let get_obj_data_base (arr : int array) =
  let n_segments = arr.(h_n_segments) in
  get_seg_data_base arr + (n_segments * seg_block_size)
;;

(* fvi_sub: recursive FVI traversal.
   Returns (hit_type, intp, ints) where ints is the hit segment. *)
let rec fvi_sub
          (arr : int array)
          (st : fvi_state)
          ~p0
          ~startseg
          ~p1
          ~rad
          ~thisobjnum
          ~flags
          ~entry_seg
  =
  let open Ox_math in
  let seg_data_base = get_seg_data_base arr in
  let obj_data_base = get_obj_data_base arr in
  let table_base = get_collision_table_base arr in
  let seg_base = seg_data_base + (startseg * seg_block_size) in
  let children, side_types, seg_verts, normals, seg_vert_positions, wid, first_object =
    unpack_seg arr ~seg_base
  in
  let closest_d = ref 0x7fffffff in
  let closest_hit_point = ref (0, 0, 0) in
  let hit_type = ref hit_none in
  let hit_seg = ref (-1) in
  let hit_none_seg = ref (-1) in
  let hit_none_n_segs = ref 0 in
  let hit_none_seglist = Array.create ~len:max_fvi_segs 0 in
  let cur_nest_level = st.fvi_nest_count in
  let seglist = Array.create ~len:max_fvi_segs 0 in
  let n_segs = ref 1 in
  if flags land fq_get_seglist <> 0 then seglist.(0) <- startseg;
  st.fvi_nest_count <- st.fvi_nest_count + 1;
  let quit = ref false in
  let is_d2 = arr.(h_is_d2) <> 0 in
  let game_time = arr.(h_game_time) in
  let ignore_count = arr.(h_ignore_obj_count) in
  let game_mode_coop = arr.(h_game_mode_coop) <> 0 in
  (* Check objects in this segment *)
  if flags land fq_check_objs <> 0 && not !quit
  then (
    let objnum = ref first_object in
    while !objnum <> -1 && not !quit do
      let ob = !objnum in
      let ob_base = obj_data_base + (ob * obj_block_size) in
      let ( obj_type_ob
          , _obj_id_ob
          , obj_flags_ob
          , obj_pos_ob
          , obj_size_ob
          , next_in_seg
          , parent_type_ob
          , _parent_num_ob
          , _parent_sig_ob
          , _creation_time_ob
          , _signature_ob
          , attack_type_ob )
        =
        unpack_obj arr ~obj_base:ob_base
      in
      (* Apply all the skip conditions from C *)
      let skip = ref false in
      (* Skip OBJ_NONE (type=255) - dead objects shouldn't be checked.
         In C, the collision table OOB read happens to return RESULT_NOTHING
         for type=255, but in OCaml it reads segment data instead. *)
      if obj_type_ob = obj_none then skip := true;
      if obj_flags_ob land 2 <> 0 then skip := true (* OF_SHOULD_BE_DEAD = 2 *);
      if thisobjnum = ob then skip := true;
      if (not !skip) && obj_in_ignore_list arr ~ignore_count ~objnum:ob then skip := true;
      if not !skip
      then
        if
          check_laser_related
            arr
            ~obj_base_a:ob_base
            ~objnum_a:ob
            ~obj_base_b:(obj_data_base + (thisobjnum * obj_block_size))
            ~objnum_b:thisobjnum
            ~game_time
            ~is_d2
        then skip := true;
      if (not !skip) && thisobjnum > -1
      then (
        let thisobj_base = obj_data_base + (thisobjnum * obj_block_size) in
        let thisobj_type = arr.(thisobj_base) in
        let cr1 =
          get_collision_result arr ~table_base ~type_a:thisobj_type ~type_b:obj_type_ob
        in
        let cr2 =
          get_collision_result arr ~table_base ~type_a:obj_type_ob ~type_b:thisobj_type
        in
        if cr1 = result_nothing && cr2 = result_nothing then skip := true);
      (* D2: skip powerups if FQ_IGNORE_POWERUPS *)
      if
        (not !skip)
        && is_d2
        && obj_type_ob = obj_powerup
        && flags land fq_ignore_powerups <> 0
      then skip := true;
      (* Robot-robot collision filter *)
      if (not !skip) && thisobjnum > -1
      then (
        let thisobj_base = obj_data_base + (thisobjnum * obj_block_size) in
        let thisobj_type = arr.(thisobj_base) in
        let thisobj_attack = arr.(thisobj_base + 13) in
        if thisobj_type = obj_robot && obj_type_ob = obj_robot
        then
          if is_d2
          then skip := true (* D2: skip all robot-robot *)
          else if not (attack_type_ob <> 0 && thisobj_attack <> 0)
          then skip := true);
      if not !skip
      then (
        let fudged_rad = ref rad in
        (* Melee robot fudge *)
        if thisobjnum > -1
        then (
          let thisobj_base = obj_data_base + (thisobjnum * obj_block_size) in
          let thisobj_type = arr.(thisobj_base) in
          let thisobj_attack = arr.(thisobj_base + 13) in
          if thisobj_type = obj_robot && thisobj_attack <> 0
          then fudged_rad := rad * 3 / 4;
          (* Player-player / player-coop-weapon fudge *)
          if
            thisobj_type = obj_player
            && (obj_type_ob = obj_player
                || (game_mode_coop
                    && obj_type_ob = obj_weapon
                    && parent_type_ob = obj_player))
          then fudged_rad := rad / 2);
        let d, hit_point =
          check_vector_to_object
            ~p0
            ~p1
            ~rad:!fudged_rad
            ~obj_pos:obj_pos_ob
            ~obj_size:obj_size_ob
            ~obj_type:obj_type_ob
            ~attack_type:attack_type_ob
            ~otherobj_type:
              (if thisobjnum > -1
               then arr.(obj_data_base + (thisobjnum * obj_block_size))
               else 0)
            ~game_mode_coop
            ~otherobj_parent_type:
              (if thisobjnum > -1
               then arr.(obj_data_base + (thisobjnum * obj_block_size) + 8)
               else 0)
        in
        if d <> 0 && d < !closest_d
        then (
          st.fvi_hit_object <- ob;
          closest_d := d;
          closest_hit_point := hit_point;
          hit_type := hit_object));
      objnum := next_in_seg
    done);
  (* HACK: if this object type doesn't collide with walls, set rad=0 *)
  let rad =
    if thisobjnum > -1
    then (
      let thisobj_base = obj_data_base + (thisobjnum * obj_block_size) in
      let thisobj_type = arr.(thisobj_base) in
      let cr =
        get_collision_result arr ~table_base ~type_a:thisobj_type ~type_b:0
        (* OBJ_WALL *)
      in
      if cr = result_nothing then 0 else rad)
    else rad
  in
  (* Get start/end masks *)
  let startmask =
    let fm, _, _ =
      Ox_gameseg.get_seg_masks
        ~checkp:p0
        ~rad
        ~seg_verts
        ~side_types
        ~normals
        ~seg_vert_positions
    in
    fm
  in
  let endmask, _sidemask, centermask =
    Ox_gameseg.get_seg_masks
      ~checkp:p1
      ~rad
      ~seg_verts
      ~side_types
      ~normals
      ~seg_vert_positions
  in
  if centermask = 0 then hit_none_seg := startseg;
  if endmask <> 0 && not !quit
  then (
    let bit = ref 1 in
    let side = ref 0 in
    while !side < 6 && endmask >= !bit && not !quit do
      let sn = !side in
      let num_faces_raw =
        let st = side_types.(sn) in
        if st = 1 then 1 else if st = 2 || st = 3 then 2 else 1
      in
      let num_faces = if num_faces_raw = 0 then 1 else num_faces_raw in
      for face = 0 to 1 do
        if (not !quit) && endmask land !bit <> 0
        then
          if
            (* Skip entry seg side *)
            children.(sn) <> entry_seg
          then (
            let nv = if num_faces = 1 then 4 else 3 in
            let _nf, vertex_list =
              Ox_gameseg.create_abs_vertex_lists
                ~side_type:side_types.(sn)
                ~seg_verts
                ~sidenum:sn
            in
            let norm = normals.((sn * 2) + face) in
            let face_hit_type, hit_point =
              if startmask land !bit <> 0
              then
                special_check_line_to_face
                  ~p0
                  ~p1
                  ~norm
                  ~rad
                  ~facenum:face
                  ~nv
                  ~num_faces
                  ~side_type:side_types.(sn)
                  ~sidenum:sn
                  ~vertex_list
                  ~seg_verts
                  ~seg_vert_positions
              else
                check_line_to_face
                  ~p0
                  ~p1
                  ~norm
                  ~rad
                  ~facenum:face
                  ~nv
                  ~num_faces
                  ~vertex_list
                  ~seg_verts
                  ~seg_vert_positions
            in
            if face_hit_type <> 0
            then (
              (* Compute wid_flag *)
              let wid_flag =
                let base_wid = wid.(sn) in
                if thisobjnum = arr.(h_player_objnum) && arr.(h_physics_cheat) <> 0
                then (
                  let w = base_wid in
                  if children.(sn) >= 0 then w lor wid_fly_flag else w)
                else base_wid
              in
              let is_flyable = wid_flag land wid_fly_flag <> 0 in
              let is_trans =
                if is_d2
                then
                  wid_flag land wid_render_flag <> 0
                  && wid_flag land wid_rendpast_flag <> 0
                else wid_flag = wid_transparent_wall_d1
              in
              let passable =
                is_flyable
                || (is_trans && flags land fq_transwall <> 0)
                || (is_trans
                    && flags land fq_transpoint <> 0
                    &&
                    let hx, hy, hz = hit_point in
                    !check_trans_wall_callback startseg sn face hx hy hz <> 0)
              in
              if passable
              then (
                let newsegnum = children.(sn) in
                (* Check if already visited *)
                let already_visited = ref false in
                for i = 0 to st.n_segs_visited - 1 do
                  if st.segs_visited.(i) = newsegnum then already_visited := true
                done;
                if not !already_visited
                then (
                  st.segs_visited.(st.n_segs_visited) <- newsegnum;
                  st.n_segs_visited <- st.n_segs_visited + 1;
                  if st.n_segs_visited >= max_segs_visited
                  then quit := true
                  else (
                    let save_wall_norm = st.wall_norm in
                    let save_hit_objnum = st.fvi_hit_object in
                    let ( sub_hit_type
                        , sub_hit_point
                        , sub_hit_seg
                        , temp_seglist
                        , temp_n_segs )
                      =
                      fvi_sub
                        arr
                        st
                        ~p0
                        ~startseg:newsegnum
                        ~p1
                        ~rad
                        ~thisobjnum
                        ~flags
                        ~entry_seg:startseg
                    in
                    if sub_hit_type <> hit_none
                    then (
                      let d = vm_vec_dist ~a:sub_hit_point ~b:p0 in
                      if d < !closest_d
                      then (
                        closest_d := d;
                        closest_hit_point := sub_hit_point;
                        hit_type := sub_hit_type;
                        if sub_hit_seg <> -1 then hit_seg := sub_hit_seg;
                        if flags land fq_get_seglist <> 0
                        then (
                          let ii = ref 0 in
                          while !ii < temp_n_segs && !n_segs < max_fvi_segs - 1 do
                            seglist.(!n_segs) <- temp_seglist.(!ii);
                            n_segs := !n_segs + 1;
                            ii := !ii + 1
                          done))
                      else (
                        st.wall_norm <- save_wall_norm;
                        st.fvi_hit_object <- save_hit_objnum))
                    else (
                      st.wall_norm <- save_wall_norm;
                      if sub_hit_seg <> -1 then hit_none_seg := sub_hit_seg;
                      if flags land fq_get_seglist <> 0
                      then
                        for ii = 0 to min (temp_n_segs - 1) (max_fvi_segs - 2) do
                          hit_none_seglist.(ii) <- temp_seglist.(ii)
                        done;
                      hit_none_n_segs := temp_n_segs))))
              else (
                (* Wall hit *)
                let d = vm_vec_dist ~a:hit_point ~b:p0 in
                if d < !closest_d
                then (
                  closest_d := d;
                  closest_hit_point := hit_point;
                  hit_type := hit_wall;
                  st.wall_norm <- normals.((sn * 2) + face);
                  let _, _, cm =
                    Ox_gameseg.get_seg_masks
                      ~checkp:hit_point
                      ~rad
                      ~seg_verts
                      ~side_types
                      ~normals
                      ~seg_vert_positions
                  in
                  if cm = 0 then hit_seg := startseg else st.fvi_hit_seg2 <- startseg;
                  st.fvi_hit_seg <- !hit_seg;
                  st.fvi_hit_side <- sn;
                  st.fvi_hit_side_seg <- startseg))));
        bit := !bit lsl 1
      done;
      incr side
    done);
  (* Return results *)
  if !hit_type = hit_none
  then (
    let intp = p1 in
    let ints = !hit_none_seg in
    if !hit_none_seg <> -1
    then (
      if flags land fq_get_seglist <> 0
      then
        for i = 0 to !hit_none_n_segs - 1 do
          if !n_segs < max_fvi_segs - 1
          then (
            seglist.(!n_segs) <- hit_none_seglist.(i);
            n_segs := !n_segs + 1)
        done)
    else if cur_nest_level <> 0
    then n_segs := 0;
    !hit_type, intp, ints, seglist, !n_segs)
  else (
    let intp = !closest_hit_point in
    let ints =
      if !hit_seg = -1
      then if st.fvi_hit_seg2 <> -1 then st.fvi_hit_seg2 else !hit_none_seg
      else !hit_seg
    in
    !hit_type, intp, ints, seglist, !n_segs)
;;

(* find_vector_intersection: top-level dispatcher.
   Takes a packed array, returns a result array.

   Packed array layout:
   Header (18+ ints):
     [0..2]  p0.xyz
     [3]     startseg
     [4..6]  p1.xyz
     [7]     rad
     [8]     thisobjnum
     [9]     flags
     [10]    n_segments
     [11]    n_objects
     [12]    player_objnum
     [13]    physics_cheat_flag (0 or 1)
     [14]    game_mode_coop (0 or 1)
     [15]    game_time
     [16]    is_d2
     [17]    ignore_obj_count
     [18..18+N-1] ignore_obj_list[N]

   Then: CollisionResult[16*16 = 256 ints]
   Then: n_segments * 87 ints per segment
   Then: n_objects * 14 ints per object

   Returns array:
     [0]     hit_type
     [1..3]  hit_pnt.xyz
     [4]     hit_seg
     [5]     hit_side
     [6]     hit_side_seg
     [7]     hit_object
     [8..10] hit_wallnorm.xyz
     [11]    n_segs
     [12..]  seglist *)
let find_vector_intersection (arr : int array) =
  let p0 = arr.(h_p0x), arr.(h_p0y), arr.(h_p0z) in
  let startseg = arr.(h_startseg) in
  let p1 = arr.(h_p1x), arr.(h_p1y), arr.(h_p1z) in
  let rad = arr.(h_rad) in
  let thisobjnum = arr.(h_thisobjnum) in
  let flags = arr.(h_flags) in
  let seg_data_base = get_seg_data_base arr in
  (* Validate startseg via get_seg_masks *)
  let seg_base = seg_data_base + (startseg * seg_block_size) in
  let seg_verts = Array.init 8 ~f:(fun i -> arr.(seg_base + 12 + i)) in
  let side_types = Array.init 6 ~f:(fun i -> arr.(seg_base + 6 + i)) in
  let normals =
    Array.init 12 ~f:(fun i ->
      let off = seg_base + 20 + (i * 3) in
      arr.(off), arr.(off + 1), arr.(off + 2))
  in
  let seg_vert_positions =
    Array.init 8 ~f:(fun i ->
      let off = seg_base + 56 + (i * 3) in
      arr.(off), arr.(off + 1), arr.(off + 2))
  in
  let _, _, centermask =
    Ox_gameseg.get_seg_masks
      ~checkp:p0
      ~rad:0
      ~seg_verts
      ~side_types
      ~normals
      ~seg_vert_positions
  in
  if centermask <> 0
  then (
    (* HIT_BAD_P0 *)
    let p0x, p0y, p0z = p0 in
    [| hit_bad_p0; p0x; p0y; p0z; startseg; 0; -1; 0; 0; 0; 0; 0 |])
  else (
    let st = make_fvi_state () in
    st.segs_visited.(0) <- startseg;
    st.n_segs_visited <- 1;
    st.fvi_hit_seg2 <- -1;
    let hit_type, hit_pnt, hit_seg2, seglist, n_segs =
      fvi_sub arr st ~p0 ~startseg ~p1 ~rad ~thisobjnum ~flags ~entry_seg:(-2)
    in
    let hit_pnt_x, hit_pnt_y, hit_pnt_z = hit_pnt in
    (* Resolve hit_seg *)
    let hit_seg = ref (-1) in
    if hit_seg2 <> -1
    then (
      let sb2 = seg_data_base + (hit_seg2 * seg_block_size) in
      let sv2 = Array.init 8 ~f:(fun i -> arr.(sb2 + 12 + i)) in
      let st2 = Array.init 6 ~f:(fun i -> arr.(sb2 + 6 + i)) in
      let n2 =
        Array.init 12 ~f:(fun i ->
          let off = sb2 + 20 + (i * 3) in
          arr.(off), arr.(off + 1), arr.(off + 2))
      in
      let svp2 =
        Array.init 8 ~f:(fun i ->
          let off = sb2 + 56 + (i * 3) in
          arr.(off), arr.(off + 1), arr.(off + 2))
      in
      let _, _, cm2 =
        Ox_gameseg.get_seg_masks
          ~checkp:hit_pnt
          ~rad:0
          ~seg_verts:sv2
          ~side_types:st2
          ~normals:n2
          ~seg_vert_positions:svp2
      in
      if cm2 = 0 then hit_seg := hit_seg2);
    if !hit_seg = -1
    then (
      (* find_point_seg using packed data *)
      let n_segments = arr.(h_n_segments) in
      let fps_packed = Array.create ~len:(6 + (n_segments * 80)) 0 in
      fps_packed.(0) <- hit_pnt_x;
      fps_packed.(1) <- hit_pnt_y;
      fps_packed.(2) <- hit_pnt_z;
      fps_packed.(3) <- startseg;
      fps_packed.(4) <- n_segments;
      fps_packed.(5) <- 0;
      (* Copy 80-int segment data (first 80 of 87) *)
      for s = 0 to n_segments - 1 do
        let src = seg_data_base + (s * seg_block_size) in
        let dst = 6 + (s * 80) in
        for i = 0 to 79 do
          fps_packed.(dst + i) <- arr.(src + i)
        done
      done;
      hit_seg := Ox_gameseg.find_point_seg fps_packed);
    (* HACK: if HIT_WALL and hit_seg=-1, try fvi_hit_seg2 *)
    if hit_type = hit_wall && !hit_seg = -1 && st.fvi_hit_seg2 <> -1
    then (
      let sb2 = seg_data_base + (st.fvi_hit_seg2 * seg_block_size) in
      let sv2 = Array.init 8 ~f:(fun i -> arr.(sb2 + 12 + i)) in
      let st2 = Array.init 6 ~f:(fun i -> arr.(sb2 + 6 + i)) in
      let n2 =
        Array.init 12 ~f:(fun i ->
          let off = sb2 + 20 + (i * 3) in
          arr.(off), arr.(off + 1), arr.(off + 2))
      in
      let svp2 =
        Array.init 8 ~f:(fun i ->
          let off = sb2 + 56 + (i * 3) in
          arr.(off), arr.(off + 1), arr.(off + 2))
      in
      let _, _, cm2 =
        Ox_gameseg.get_seg_masks
          ~checkp:hit_pnt
          ~rad:0
          ~seg_verts:sv2
          ~side_types:st2
          ~normals:n2
          ~seg_vert_positions:svp2
      in
      if cm2 = 0 then hit_seg := st.fvi_hit_seg2);
    (* Retry with rad=0 if hit_seg still -1 *)
    if !hit_seg = -1
    then (
      let st2 = make_fvi_state () in
      st2.segs_visited.(0) <- startseg;
      st2.n_segs_visited <- 1;
      st2.fvi_hit_seg2 <- -1;
      let _new_hit_type, new_hit_pnt, new_hit_seg2, _new_seglist, _new_n_segs =
        fvi_sub arr st2 ~p0 ~startseg ~p1 ~rad:0 ~thisobjnum ~flags ~entry_seg:(-2)
      in
      ignore new_hit_pnt;
      if new_hit_seg2 <> -1 then hit_seg := new_hit_seg2);
    (* Trim seglist at hit point *)
    let final_seglist = Array.create ~len:max_fvi_segs 0 in
    let final_n_segs = ref n_segs in
    Array.blit ~src:seglist ~src_pos:0 ~dst:final_seglist ~dst_pos:0 ~len:n_segs;
    if !hit_seg <> -1 && flags land fq_get_seglist <> 0
    then
      if
        !final_n_segs > 0
        && final_seglist.(!final_n_segs - 1) <> !hit_seg
        && !final_n_segs < max_fvi_segs - 1
      then (
        final_seglist.(!final_n_segs) <- !hit_seg;
        final_n_segs := !final_n_segs + 1);
    if !hit_seg <> -1 && flags land fq_get_seglist <> 0
    then (
      let found = ref false in
      for i = 0 to !final_n_segs - 1 do
        if (not !found) && final_seglist.(i) = !hit_seg
        then (
          final_n_segs := i + 1;
          found := true)
      done);
    let wnx, wny, wnz = st.wall_norm in
    let result_len = 12 + !final_n_segs in
    let result = Array.create ~len:result_len 0 in
    result.(0) <- hit_type;
    result.(1) <- hit_pnt_x;
    result.(2) <- hit_pnt_y;
    result.(3) <- hit_pnt_z;
    result.(4) <- !hit_seg;
    result.(5) <- st.fvi_hit_side;
    result.(6) <- st.fvi_hit_side_seg;
    result.(7) <- st.fvi_hit_object;
    result.(8) <- wnx;
    result.(9) <- wny;
    result.(10) <- wnz;
    result.(11) <- !final_n_segs;
    for i = 0 to !final_n_segs - 1 do
      result.(12 + i) <- final_seglist.(i)
    done;
    result)
;;

(* ===== find_homing_object_complete =====

   Packed array layout: FVI format base + homing extension.

   Base: standard FVI packed format:
     Header (18 ints, ignore_count=0)
     CollisionResult[256]
     Segment data (n_segments * 87)
     Object data (n_objects * 14)

   Homing extension (appended after FVI object data):
     Homing header (19 ints):
       [0..2]  curpos.xyz
       [3..5]  tracker orient.fvec.xyz
       [6..8]  tracker pos.xyz
       [9]     tracker segnum
       [10]    tracker parent_num
       [11]    tracker parent_type
       [12]    tracker parent_signature
       [13]    tracker weapon_id
       [14]    track_obj_type1
       [15]    track_obj_type2
       [16]    highest_object_index
       [17]    game_mode_flags (raw Game_mode)
       [18]    is_omega (0 or 1, D2 only)

     Homing per-object data (n_objects * 5):
       [0] player_flags (Players[id].flags if player, else 0)
       [1] team_id (get_team(id) if player, else -1)
       [2] ai_CLOAKED (ctype.ai_info.CLOAKED if robot, else 0)
       [3] robot_companion (Robot_info[id].companion if D2 robot, else 0)
       [4] segnum

   Returns: best object index, or -1 if none found. *)

let homing_header_size = 19
let homing_obj_block_size = 5

(* Homing header field offsets (relative to homing base) *)
let hh_curpos_x = 0
let hh_curpos_y = 1
let hh_curpos_z = 2
let hh_fvec_x = 3
let hh_fvec_y = 4
let hh_fvec_z = 5
let hh_tracker_pos_x = 6
let hh_tracker_pos_y = 7
let hh_tracker_pos_z = 8
let hh_tracker_segnum = 9
let hh_tracker_parent_num = 10
let hh_tracker_parent_type = 11
let hh_tracker_parent_sig = 12
let _hh_tracker_weapon_id = 13
let hh_track_obj_type1 = 14
let hh_track_obj_type2 = 15
let hh_highest_object_index = 16
let hh_game_mode_flags = 17
let hh_is_omega = 18

(* Game mode flag *)
let gm_team = 256

(* Tracking constants — D1 *)
let d1_min_trackable_dot = 0xC000 (* 3*F1_0/4 *)
let d1_max_trackable_dist = 0xFA0000 (* F1_0*250 *)

(* Tracking constants — D2 *)
let d2_min_trackable_dot = 0xE000 (* 7*F1_0/8 *)
let d2_max_trackable_dist = 0xFA0000
let d2_omega_min_trackable_dot = 0xF000 (* 15*F1_0/16 *)
let d2_omega_max_trackable_dist = 0x500000 (* MAX_OMEGA_BLOBS * DESIRED_OMEGA_DIST *)

(* D2 weapon IDs for proximity mine tracking *)
let d2_proximity_id = 16
let d2_superprox_id = 38

(* PLAYER_FLAGS_CLOAKED *)
let player_flags_cloaked = 2048

(* Simple visibility check: calls fvi_sub to test line-of-sight.
   Returns true if p0 can see p1 (no wall blocking). *)
let visibility_check (arr : int array) ~p0 ~startseg ~p1 ~tracker_objnum =
  let st = make_fvi_state () in
  st.segs_visited.(0) <- startseg;
  st.n_segs_visited <- 1;
  st.fvi_hit_seg2 <- -1;
  let ht, _, _, _, _ =
    fvi_sub
      arr
      st
      ~p0
      ~startseg
      ~p1
      ~rad:0x10
      ~thisobjnum:tracker_objnum
      ~flags:fq_transwall
      ~entry_seg:(-2)
  in
  ht <> hit_wall
;;

let find_homing_object_complete (arr : int array) =
  let open Ox_math in
  let n_objects = arr.(h_n_objects) in
  let is_d2 = arr.(h_is_d2) <> 0 in
  let obj_data_base = get_obj_data_base arr in
  let homing_base = obj_data_base + (n_objects * obj_block_size) in
  let homing_obj_base = homing_base + homing_header_size in
  let curpos =
    ( arr.(homing_base + hh_curpos_x)
    , arr.(homing_base + hh_curpos_y)
    , arr.(homing_base + hh_curpos_z) )
  in
  let fvec =
    ( arr.(homing_base + hh_fvec_x)
    , arr.(homing_base + hh_fvec_y)
    , arr.(homing_base + hh_fvec_z) )
  in
  let tracker_pos =
    ( arr.(homing_base + hh_tracker_pos_x)
    , arr.(homing_base + hh_tracker_pos_y)
    , arr.(homing_base + hh_tracker_pos_z) )
  in
  let tracker_segnum = arr.(homing_base + hh_tracker_segnum) in
  let tracker_parent_num = arr.(homing_base + hh_tracker_parent_num) in
  let tracker_parent_type = arr.(homing_base + hh_tracker_parent_type) in
  let tracker_parent_sig = arr.(homing_base + hh_tracker_parent_sig) in
  let track_obj_type1 = arr.(homing_base + hh_track_obj_type1) in
  let track_obj_type2 = arr.(homing_base + hh_track_obj_type2) in
  let highest_object_index = arr.(homing_base + hh_highest_object_index) in
  let game_mode_flags = arr.(homing_base + hh_game_mode_flags) in
  let is_omega = arr.(homing_base + hh_is_omega) <> 0 in
  let tracker_objnum = arr.(h_thisobjnum) in
  let max_trackable_dist =
    if is_d2
    then if is_omega then d2_omega_max_trackable_dist else d2_max_trackable_dist
    else d1_max_trackable_dist
  in
  let min_trackable_dot =
    if is_d2
    then if is_omega then d2_omega_min_trackable_dot else d2_min_trackable_dot
    else d1_min_trackable_dot
  in
  let max_dot = ref (-0x20000) in
  let best_objnum = ref (-1) in
  for objnum = 0 to highest_object_index do
    let obj_base = obj_data_base + (objnum * obj_block_size) in
    let hobj_base = homing_obj_base + (objnum * homing_obj_block_size) in
    let obj_type = arr.(obj_base) in
    let obj_id = arr.(obj_base + 1) in
    let obj_pos = arr.(obj_base + 3), arr.(obj_base + 4), arr.(obj_base + 5) in
    let player_flags = arr.(hobj_base) in
    let team_id = arr.(hobj_base + 1) in
    let ai_cloaked = arr.(hobj_base + 2) in
    let robot_companion = arr.(hobj_base + 3) in
    let is_proximity = ref false in
    let skip = ref false in
    (* Type filter *)
    if obj_type <> track_obj_type1 && obj_type <> track_obj_type2
    then
      if
        is_d2
        && obj_type = obj_weapon
        && (obj_id = d2_proximity_id || obj_id = d2_superprox_id)
      then (
        let obj_parent_sig = arr.(obj_base + 10) in
        if obj_parent_sig <> tracker_parent_sig
        then is_proximity := true
        else skip := true)
      else skip := true;
    (* Don't track shooter *)
    if (not !skip) && objnum = tracker_parent_num then skip := true;
    (* Don't track cloaked players *)
    if (not !skip) && obj_type = obj_player
    then (
      if player_flags land player_flags_cloaked <> 0 then skip := true;
      if
        (not !skip)
        && game_mode_flags land gm_team <> 0
        && tracker_parent_type = obj_player
      then (
        let parent_hobj_base =
          homing_obj_base + (tracker_parent_num * homing_obj_block_size)
        in
        let parent_team = arr.(parent_hobj_base + 1) in
        if parent_team = team_id then skip := true));
    (* Can't track cloaked robots *)
    if (not !skip) && obj_type = obj_robot
    then (
      if ai_cloaked <> 0 then skip := true;
      (* D2: don't track companion with player missiles *)
      if (not !skip) && is_d2 && robot_companion <> 0 && tracker_parent_type = obj_player
      then skip := true);
    if not !skip
    then (
      let vec_to_curobj = vm_vec_sub ~a:obj_pos ~b:curpos in
      let dist = vm_vec_mag_quick ~v:vec_to_curobj in
      if dist < max_trackable_dist
      then (
        let _, vec_norm = vm_vec_copy_normalize_quick ~v:vec_to_curobj in
        let dot = vm_vec_dotprod ~a:vec_norm ~b:fvec in
        (* D2: proximity mines get dot amplified by 9/8 *)
        let dot = if is_d2 && !is_proximity then ((dot lsl 3) + dot) asr 3 else dot in
        if dot > min_trackable_dot
        then
          if dot > !max_dot
          then
            if
              visibility_check
                arr
                ~p0:tracker_pos
                ~startseg:tracker_segnum
                ~p1:obj_pos
                ~tracker_objnum
            then (
              max_dot := dot;
              best_objnum := objnum)))
  done;
  !best_objnum
;;

(* ===== find_homing_object + track_track_goal + object_is_trackable =====

   These extend the homing packed format with a "tracking extension" block
   appended after the homing per-object data.

   Tracking extension header (7 ints):
     [0] min_trackable_dot (runtime value of Min_trackable_dot)
     [1] frame_count (FrameCount)
     [2] robots_kill_robots_cheat (0 for D1)
     [3] gm_multi_robots (1 if Game_mode & GM_MULTI_ROBOTS, else 0)
     [4] track_goal (for track_track_goal; -1 for find_homing_object)
     [5] n_rendered_objects (0 when not applicable)
     [6] track_goal_obj_type (Objects[track_goal].type if track_goal >= 0, else -1)

   Followed by rendered_object_list[n_rendered_objects]. *)

let tracking_ext_header_size = 7
let te_min_trackable_dot = 0
let te_frame_count = 1
let te_robots_kill_robots_cheat = 2
let te_gm_multi_robots = 3
let te_track_goal = 4
let te_n_rendered_objects = 5
let te_track_goal_obj_type = 6

(* Game mode flags *)
let gm_multi = 38
let gm_multi_coop = 16

let get_tracking_ext_base (arr : int array) =
  let n_objects = arr.(h_n_objects) in
  let obj_data_base = get_obj_data_base arr in
  let homing_base = obj_data_base + (n_objects * obj_block_size) in
  let homing_obj_base = homing_base + homing_header_size in
  homing_obj_base + (n_objects * homing_obj_block_size)
;;

(* object_is_trackable — inlined helper for track_track_goal.
   Returns (is_trackable, dot) where dot is the computed dot product.
   For D2, the caller needs dot even on success. *)
let object_is_trackable (arr : int array) ~track_goal =
  let open Ox_math in
  if track_goal = -1
  then false, 0
  else (
    let n_objects = arr.(h_n_objects) in
    let is_d2 = arr.(h_is_d2) <> 0 in
    let obj_data_base = get_obj_data_base arr in
    let homing_base = obj_data_base + (n_objects * obj_block_size) in
    let homing_obj_base = homing_base + homing_header_size in
    let game_mode_flags = arr.(homing_base + hh_game_mode_flags) in
    let te_base = get_tracking_ext_base arr in
    let min_trackable_dot = arr.(te_base + te_min_trackable_dot) in
    let tracker_parent_type = arr.(homing_base + hh_tracker_parent_type) in
    (* GM_MULTI_COOP check *)
    if game_mode_flags land gm_multi_coop <> 0
    then false, 0
    else (
      let player_objnum = arr.(h_player_objnum) in
      let goal_obj_base = obj_data_base + (track_goal * obj_block_size) in
      let goal_hobj_base = homing_obj_base + (track_goal * homing_obj_block_size) in
      let goal_type = arr.(goal_obj_base) in
      let goal_pos =
        arr.(goal_obj_base + 3), arr.(goal_obj_base + 4), arr.(goal_obj_base + 5)
      in
      let goal_player_flags = arr.(goal_hobj_base) in
      let goal_ai_cloaked = arr.(goal_hobj_base + 2) in
      let goal_robot_companion = arr.(goal_hobj_base + 3) in
      (* Don't track cloaked player *)
      if track_goal = player_objnum && goal_player_flags land player_flags_cloaked <> 0
      then false, 0
      else if goal_type = obj_robot
      then
        if goal_ai_cloaked <> 0
        then false, 0
        else if is_d2 && goal_robot_companion <> 0 && tracker_parent_type = obj_player
        then false, 0
        else (
          let tracker_pos =
            ( arr.(homing_base + hh_tracker_pos_x)
            , arr.(homing_base + hh_tracker_pos_y)
            , arr.(homing_base + hh_tracker_pos_z) )
          in
          let fvec =
            ( arr.(homing_base + hh_fvec_x)
            , arr.(homing_base + hh_fvec_y)
            , arr.(homing_base + hh_fvec_z) )
          in
          let vec_to_goal = vm_vec_sub ~a:goal_pos ~b:tracker_pos in
          let _, vec_norm = vm_vec_copy_normalize_quick ~v:vec_to_goal in
          let dot = vm_vec_dotprod ~a:vec_norm ~b:fvec in
          (* D2: retry with full normalize if close *)
          let dot =
            if is_d2 && dot < min_trackable_dot && dot > 0x10000 * 9 / 10
            then (
              let _, vec_full = vm_vec_copy_normalize ~v:vec_to_goal in
              vm_vec_dotprod ~a:vec_full ~b:fvec)
            else dot
          in
          if dot >= min_trackable_dot
          then (
            let tracker_segnum = arr.(homing_base + hh_tracker_segnum) in
            let tracker_objnum = arr.(h_thisobjnum) in
            let vis =
              visibility_check
                arr
                ~p0:tracker_pos
                ~startseg:tracker_segnum
                ~p1:goal_pos
                ~tracker_objnum
            in
            if vis then true, dot else false, dot)
          else false, dot)
      else (
        (* Non-robot (player or other) — same logic without companion check *)
        let tracker_pos =
          ( arr.(homing_base + hh_tracker_pos_x)
          , arr.(homing_base + hh_tracker_pos_y)
          , arr.(homing_base + hh_tracker_pos_z) )
        in
        let fvec =
          ( arr.(homing_base + hh_fvec_x)
          , arr.(homing_base + hh_fvec_y)
          , arr.(homing_base + hh_fvec_z) )
        in
        let vec_to_goal = vm_vec_sub ~a:goal_pos ~b:tracker_pos in
        let _, vec_norm = vm_vec_copy_normalize_quick ~v:vec_to_goal in
        let dot = vm_vec_dotprod ~a:vec_norm ~b:fvec in
        let dot =
          if is_d2 && dot < min_trackable_dot && dot > 0x10000 * 9 / 10
          then (
            let _, vec_full = vm_vec_copy_normalize ~v:vec_to_goal in
            vm_vec_dotprod ~a:vec_full ~b:fvec)
          else dot
        in
        if dot >= min_trackable_dot
        then (
          let tracker_segnum = arr.(homing_base + hh_tracker_segnum) in
          let tracker_objnum = arr.(h_thisobjnum) in
          let vis =
            visibility_check
              arr
              ~p0:tracker_pos
              ~startseg:tracker_segnum
              ~p1:goal_pos
              ~tracker_objnum
          in
          if vis then true, dot else false, dot)
        else false, dot)))
;;

(* track_track_goal — per-frame tracking update.
   Returns [| result; dot |] where dot is from the trackability check. *)
let track_track_goal (arr : int array) =
  let is_d2 = arr.(h_is_d2) <> 0 in
  let n_objects = arr.(h_n_objects) in
  let obj_data_base = get_obj_data_base arr in
  let homing_base = obj_data_base + (n_objects * obj_block_size) in
  let homing_obj_base = homing_base + homing_header_size in
  let te_base = get_tracking_ext_base arr in
  let track_goal = arr.(te_base + te_track_goal) in
  let frame_count = arr.(te_base + te_frame_count) in
  let tracker_objnum = arr.(h_thisobjnum) in
  let game_mode_flags = arr.(homing_base + hh_game_mode_flags) in
  let tracker_parent_num = arr.(homing_base + hh_tracker_parent_num) in
  let trackable, dot = object_is_trackable arr ~track_goal in
  (* D1: if trackable, return track_goal *)
  (* D2: if trackable AND not on the 8th-frame full-rescan, return track_goal *)
  let frame_hash = tracker_objnum lxor frame_count in
  if trackable && ((not is_d2) || frame_hash mod 8 <> 0)
  then [| track_goal; dot |]
  else if frame_hash mod 4 = 0
  then (
    let parent_obj_base = obj_data_base + (tracker_parent_num * obj_block_size) in
    let parent_type = arr.(parent_obj_base) in
    let robots_kill_robots_cheat = arr.(te_base + te_robots_kill_robots_cheat) in
    let gm_multi_robots_flag = arr.(te_base + te_gm_multi_robots) in
    let track_goal_obj_type = arr.(te_base + te_track_goal_obj_type) in
    let rval =
      if parent_type = obj_player
      then
        if track_goal = -1
        then (
          if game_mode_flags land gm_multi <> 0
          then
            if game_mode_flags land gm_multi_coop <> 0
            then (
              arr.(homing_base + hh_track_obj_type1) <- obj_robot;
              arr.(homing_base + hh_track_obj_type2) <- -1)
            else if gm_multi_robots_flag <> 0
            then (
              arr.(homing_base + hh_track_obj_type1) <- obj_player;
              arr.(homing_base + hh_track_obj_type2) <- obj_robot)
            else (
              arr.(homing_base + hh_track_obj_type1) <- obj_player;
              arr.(homing_base + hh_track_obj_type2) <- -1)
          else (
            arr.(homing_base + hh_track_obj_type1) <- obj_player;
            arr.(homing_base + hh_track_obj_type2) <- obj_robot);
          (* Use tracker pos as curpos for find_homing_object_complete *)
          let homing_obj_end = homing_obj_base + (n_objects * homing_obj_block_size) in
          let _ = homing_obj_end in
          arr.(homing_base + hh_curpos_x) <- arr.(homing_base + hh_tracker_pos_x);
          arr.(homing_base + hh_curpos_y) <- arr.(homing_base + hh_tracker_pos_y);
          arr.(homing_base + hh_curpos_z) <- arr.(homing_base + hh_tracker_pos_z);
          find_homing_object_complete arr)
        else if track_goal_obj_type = obj_player || track_goal_obj_type = obj_robot
        then (
          arr.(homing_base + hh_track_obj_type1) <- track_goal_obj_type;
          arr.(homing_base + hh_track_obj_type2) <- -1;
          arr.(homing_base + hh_curpos_x) <- arr.(homing_base + hh_tracker_pos_x);
          arr.(homing_base + hh_curpos_y) <- arr.(homing_base + hh_tracker_pos_y);
          arr.(homing_base + hh_curpos_z) <- arr.(homing_base + hh_tracker_pos_z);
          find_homing_object_complete arr)
        else -1
      else (
        let goal2_type =
          if is_d2 && robots_kill_robots_cheat <> 0 then obj_robot else -1
        in
        if track_goal = -1
        then (
          arr.(homing_base + hh_track_obj_type1) <- obj_player;
          arr.(homing_base + hh_track_obj_type2) <- goal2_type;
          arr.(homing_base + hh_curpos_x) <- arr.(homing_base + hh_tracker_pos_x);
          arr.(homing_base + hh_curpos_y) <- arr.(homing_base + hh_tracker_pos_y);
          arr.(homing_base + hh_curpos_z) <- arr.(homing_base + hh_tracker_pos_z);
          find_homing_object_complete arr)
        else (
          arr.(homing_base + hh_track_obj_type1) <- track_goal_obj_type;
          arr.(homing_base + hh_track_obj_type2) <- goal2_type;
          arr.(homing_base + hh_curpos_x) <- arr.(homing_base + hh_tracker_pos_x);
          arr.(homing_base + hh_curpos_y) <- arr.(homing_base + hh_tracker_pos_y);
          arr.(homing_base + hh_curpos_z) <- arr.(homing_base + hh_tracker_pos_z);
          find_homing_object_complete arr))
    in
    [| rval; dot |])
  else [| -1; dot |]
;;

(* find_homing_object — initial target acquisition.
   Returns best_objnum or -1.
   In multiplayer: dispatches to find_homing_object_complete with computed track types.
   In singleplayer, not player-fired: returns player if not cloaked.
   In singleplayer, player-fired: iterates rendered object list. *)
let find_homing_object (arr : int array) =
  let open Ox_math in
  let is_d2 = arr.(h_is_d2) <> 0 in
  let n_objects = arr.(h_n_objects) in
  let obj_data_base = get_obj_data_base arr in
  let homing_base = obj_data_base + (n_objects * obj_block_size) in
  let homing_obj_base = homing_base + homing_header_size in
  let game_mode_flags = arr.(homing_base + hh_game_mode_flags) in
  let tracker_parent_num = arr.(homing_base + hh_tracker_parent_num) in
  let tracker_parent_type = arr.(homing_base + hh_tracker_parent_type) in
  let player_objnum = arr.(h_player_objnum) in
  let te_base = get_tracking_ext_base arr in
  let robots_kill_robots_cheat = arr.(te_base + te_robots_kill_robots_cheat) in
  if game_mode_flags land gm_multi <> 0
  then (
    (* Multiplayer — dispatch to find_homing_object_complete *)
    if tracker_parent_type = obj_player
    then
      if game_mode_flags land gm_multi_coop <> 0
      then (
        arr.(homing_base + hh_track_obj_type1) <- obj_robot;
        arr.(homing_base + hh_track_obj_type2) <- -1)
      else (
        arr.(homing_base + hh_track_obj_type1) <- obj_player;
        arr.(homing_base + hh_track_obj_type2) <- obj_robot)
    else (
      let goal2_type = if is_d2 && robots_kill_robots_cheat <> 0 then obj_robot else -1 in
      arr.(homing_base + hh_track_obj_type1) <- obj_player;
      arr.(homing_base + hh_track_obj_type2) <- goal2_type);
    find_homing_object_complete arr)
  else if tracker_parent_num <> player_objnum
  then (
    (* Singleplayer, not fired by player — track player if not cloaked *)
    let player_hobj_base = homing_obj_base + (player_objnum * homing_obj_block_size) in
    let player_flags = arr.(player_hobj_base) in
    if player_flags land player_flags_cloaked <> 0 then -1 else player_objnum)
  else (
    (* Singleplayer, fired by player — iterate rendered object list *)
    let n_rendered = arr.(te_base + te_n_rendered_objects) in
    let rendered_list_base = te_base + tracking_ext_header_size in
    let is_omega = arr.(homing_base + hh_is_omega) <> 0 in
    let cur_min_trackable_dot =
      if is_d2 && is_omega then d2_omega_min_trackable_dot else d1_min_trackable_dot
    in
    let max_trackable_dist =
      if is_d2
      then if is_omega then d2_omega_max_trackable_dist else d2_max_trackable_dist
      else d1_max_trackable_dist
    in
    let curpos =
      ( arr.(homing_base + hh_curpos_x)
      , arr.(homing_base + hh_curpos_y)
      , arr.(homing_base + hh_curpos_z) )
    in
    let fvec =
      ( arr.(homing_base + hh_fvec_x)
      , arr.(homing_base + hh_fvec_y)
      , arr.(homing_base + hh_fvec_z) )
    in
    let tracker_pos =
      ( arr.(homing_base + hh_tracker_pos_x)
      , arr.(homing_base + hh_tracker_pos_y)
      , arr.(homing_base + hh_tracker_pos_z) )
    in
    let tracker_segnum = arr.(homing_base + hh_tracker_segnum) in
    let tracker_objnum = arr.(h_thisobjnum) in
    let max_dot = ref (-0x20000) in
    let best_objnum = ref (-1) in
    for i = n_rendered - 1 downto 0 do
      let objnum = arr.(rendered_list_base + i) in
      if objnum <> player_objnum
      then (
        let obj_base = obj_data_base + (objnum * obj_block_size) in
        let hobj_base = homing_obj_base + (objnum * homing_obj_block_size) in
        let obj_type = arr.(obj_base) in
        let ai_cloaked = arr.(hobj_base + 2) in
        let robot_companion = arr.(hobj_base + 3) in
        let skip = ref false in
        if obj_type = obj_robot
        then (
          if ai_cloaked <> 0 then skip := true;
          if
            (not !skip)
            && is_d2
            && robot_companion <> 0
            && tracker_parent_type = obj_player
          then skip := true);
        if not !skip
        then (
          let obj_pos = arr.(obj_base + 3), arr.(obj_base + 4), arr.(obj_base + 5) in
          let vec_to_curobj = vm_vec_sub ~a:obj_pos ~b:curpos in
          (* D1 uses normalize_quick without distance check;
             D2 uses normalize_quick and checks distance *)
          if is_d2
          then (
            let dist, vec_norm_q = vm_vec_copy_normalize_quick ~v:vec_to_curobj in
            if dist < max_trackable_dist
            then (
              let dot = vm_vec_dotprod ~a:vec_norm_q ~b:fvec in
              if dot > cur_min_trackable_dot
              then (
                if dot > !max_dot
                then
                  if
                    visibility_check
                      arr
                      ~p0:tracker_pos
                      ~startseg:tracker_segnum
                      ~p1:obj_pos
                      ~tracker_objnum
                  then (
                    max_dot := dot;
                    best_objnum := objnum))
              else if dot > 0x10000 - ((0x10000 - cur_min_trackable_dot) * 2)
              then (
                (* D2: retry with full normalize on original vector *)
                let _, vec_full =
                  vm_vec_copy_normalize ~v:(vm_vec_sub ~a:obj_pos ~b:curpos)
                in
                let dot = vm_vec_dotprod ~a:vec_full ~b:fvec in
                if dot > cur_min_trackable_dot
                then
                  if dot > !max_dot
                  then
                    if
                      visibility_check
                        arr
                        ~p0:tracker_pos
                        ~startseg:tracker_segnum
                        ~p1:obj_pos
                        ~tracker_objnum
                    then (
                      max_dot := dot;
                      best_objnum := objnum))))
          else (
            (* D1: no distance check, just normalize_quick and dot *)
            let _, vec_norm = vm_vec_copy_normalize_quick ~v:vec_to_curobj in
            let dot = vm_vec_dotprod ~a:vec_norm ~b:fvec in
            if dot > cur_min_trackable_dot
            then
              if dot > !max_dot
              then
                if
                  visibility_check
                    arr
                    ~p0:tracker_pos
                    ~startseg:tracker_segnum
                    ~p1:obj_pos
                    ~tracker_objnum
                then (
                  max_dot := dot;
                  best_objnum := objnum))))
    done;
    !best_objnum)
;;

(* find_point_seg using FVI packed array layout.
   Same algorithm as Ox_gameseg.find_point_seg but reads from the
   87-int/segment FVI layout instead of the 80-int/segment layout. *)
let find_point_seg_fvi (arr : int array) ~point:(px, py, pz) ~segnum =
  let n_segments = arr.(h_n_segments) in
  let seg_data_base = get_seg_data_base arr in
  let unpack_seg_for_fps s =
    let base = seg_data_base + (s * seg_block_size) in
    let children = Array.init 6 ~f:(fun i -> arr.(base + i)) in
    let side_types = Array.init 6 ~f:(fun i -> arr.(base + 6 + i)) in
    let seg_verts = Array.init 8 ~f:(fun i -> arr.(base + 12 + i)) in
    let normals =
      Array.init 12 ~f:(fun i ->
        let off = base + 20 + (i * 3) in
        arr.(off), arr.(off + 1), arr.(off + 2))
    in
    let seg_vert_positions =
      Array.init 8 ~f:(fun i ->
        let off = base + 56 + (i * 3) in
        arr.(off), arr.(off + 1), arr.(off + 2))
    in
    children, side_types, seg_verts, normals, seg_vert_positions
  in
  let rec trace s iterations =
    if s < 0 || s >= n_segments
    then -1
    else if iterations > 1024
    then s
    else (
      let children, side_types, seg_verts, normals, seg_vert_positions =
        unpack_seg_for_fps s
      in
      let centermask, side_dists =
        Ox_gameseg.get_side_dists
          ~checkp:(px, py, pz)
          ~seg_verts
          ~side_types
          ~normals
          ~seg_vert_positions
      in
      if centermask = 0
      then s
      else (
        let biggest_val = ref 0 in
        let sidenum = ref (-1) in
        for i = 0 to 5 do
          if centermask land (1 lsl i) <> 0
          then
            if side_dists.(i) < !biggest_val
            then (
              biggest_val := side_dists.(i);
              sidenum := i)
        done;
        if !sidenum <> -1 && children.(!sidenum) >= 0
        then trace children.(!sidenum) (iterations + 1)
        else s))
  in
  if segnum < 0 || segnum >= n_segments then -1 else trace segnum 0
;;

(* player_is_visible_from_object extension packed layout.
   Appended after the FVI standard data (header + collision table + segments + objects).

   | Offset | Field |
   |--------|-------|
   | 0-2    | pos (gun tip xyz) |
   | 3-5    | objp_pos (object center xyz) |
   | 6      | objp_segnum |
   | 7-9    | objp_orient_fvec (xyz) |
   | 10     | field_of_view |
   | 11-13  | vec_to_player (xyz) |
   | 14-16  | believed_player_pos (xyz) |
   | 17     | Overall_agitation |
   | 18     | player_objnum |
   | 19     | sub_flags (D2) |

   Returns:
   [| result; pos_x; pos_y; pos_z; need_move_center; gun_segnum;
      hit_type; hit_pos_x; hit_pos_y; hit_pos_z; hit_seg |]
*)
let pv_ext_size = 20

let player_is_visible_from_object (arr : int array) =
  let open Ox_math in
  let n_objects = arr.(h_n_objects) in
  let obj_data_base = get_obj_data_base arr in
  let is_d2 = arr.(h_is_d2) <> 0 in
  let pv_base = obj_data_base + (n_objects * obj_block_size) in
  let pos_x = arr.(pv_base + 0) in
  let pos_y = arr.(pv_base + 1) in
  let pos_z = arr.(pv_base + 2) in
  let objp_pos_x = arr.(pv_base + 3) in
  let objp_pos_y = arr.(pv_base + 4) in
  let objp_pos_z = arr.(pv_base + 5) in
  let objp_segnum = arr.(pv_base + 6) in
  let fvec_x = arr.(pv_base + 7) in
  let fvec_y = arr.(pv_base + 8) in
  let fvec_z = arr.(pv_base + 9) in
  let field_of_view = arr.(pv_base + 10) in
  let vec_to_player = arr.(pv_base + 11), arr.(pv_base + 12), arr.(pv_base + 13) in
  let believed_player_pos = arr.(pv_base + 14), arr.(pv_base + 15), arr.(pv_base + 16) in
  let overall_agitation = arr.(pv_base + 17) in
  let player_objnum = arr.(pv_base + 18) in
  let sub_flags = arr.(pv_base + 19) in
  let objp_objnum = arr.(h_thisobjnum) in
  (* D2: clear SUB_FLAGS_GUNSEG (0x01) *)
  let sub_flags = if is_d2 then sub_flags land lnot 0x01 else sub_flags in
  (* Determine start segment *)
  let pos_equals_objp = pos_x = objp_pos_x && pos_y = objp_pos_y && pos_z = objp_pos_z in
  let startseg, final_pos, need_move_center, sub_flags =
    if pos_equals_objp
    then objp_segnum, (pos_x, pos_y, pos_z), 0, sub_flags
    else (
      let segnum =
        find_point_seg_fvi arr ~point:(pos_x, pos_y, pos_z) ~segnum:objp_segnum
      in
      if segnum = -1
      then
        (* Gun tip outside mine — use objp pos, signal C to move_towards_segment_center *)
        objp_segnum, (objp_pos_x, objp_pos_y, objp_pos_z), 1, sub_flags
      else (
        (* D2: set SUB_FLAGS_GUNSEG if gun in different segment *)
        let sub_flags =
          if is_d2 && segnum <> objp_segnum then sub_flags lor 0x01 else sub_flags
        in
        segnum, (pos_x, pos_y, pos_z), 0, sub_flags))
  in
  let final_pos_x, final_pos_y, final_pos_z = final_pos in
  (* Do FVI ray cast from pos to believed_player_pos *)
  let fvi_flags = if is_d2 then fq_transwall else fq_transwall lor fq_check_objs in
  let st = make_fvi_state () in
  st.segs_visited.(0) <- startseg;
  st.n_segs_visited <- 1;
  st.fvi_hit_seg2 <- -1;
  let hit_type, hit_point, hit_seg, _, _ =
    fvi_sub
      arr
      st
      ~p0:final_pos
      ~startseg
      ~p1:believed_player_pos
      ~rad:(0x10000 / 4)
      ~thisobjnum:objp_objnum
      ~flags:fvi_flags
      ~entry_seg:(-2)
  in
  let hit_px, hit_py, hit_pz = hit_point in
  (* Determine visibility result *)
  let result =
    let visible =
      if is_d2
      then hit_type = hit_none
      else
        (* D1: visible if no hit, or if we hit the player object *)
        hit_type = hit_none || (hit_type = hit_object && st.fvi_hit_object = player_objnum)
    in
    if visible
    then (
      let dot = vm_vec_dotprod ~a:vec_to_player ~b:(fvec_x, fvec_y, fvec_z) in
      if dot > field_of_view - (overall_agitation lsl 9) then 2 else 1)
    else 0
  in
  [| result
   ; final_pos_x
   ; final_pos_y
   ; final_pos_z
   ; need_move_center
   ; sub_flags
   ; hit_type
   ; hit_px
   ; hit_py
   ; hit_pz
   ; hit_seg
  |]
;;

(* ===== compute_vis_and_vec =====

   Packed array layout: FVI format + player_vis extension (20 ints) + CVV extension (19 ints).

   CVV extension (appended after pv_ext at pv_base + 20):
     [0]   player_cloaked (0 or 1)
     [1]   Difficulty_level
     [2]   cloak_last_time (Ai_cloak_info[cloak_index].last_time)
     [3-5] cloak_last_position.xyz
     [6]   prand_state (current randNext, unsigned 32-bit as signed int32)
     [7]   ailp_next_misc_sound_time
     [8]   ailp_next_fire
     [9]   ailp_previous_visibility
     [10]  ailp_time_player_seen
     [11]  ailp_time_player_sound_attacked
     [12]  aip_GOAL_STATE
     [13]  aip_CURRENT_STATE
     [14]  see_sound
     [15]  attack_sound
     [16]  Player_exploded (D1 only, 0 for D2)
     [17]  ailp_next_fire2 (D2 only)
     [18]  ailp_player_awareness_type (D2 only)

   Returns 28-element array:
     [0]    player_visibility
     [1-3]  vec_to_player.xyz
     [4-6]  pos.xyz (from pviso, possibly modified)
     [7]    need_move_center
     [8]    sub_flags (D2)
     [9]    hit_type
     [10-12] hit_pos.xyz
     [13]   hit_seg
     [14]   cloak_last_time (output)
     [15-17] cloak_last_position.xyz (output)
     [18]   prand_state (output)
     [19]   ailp_next_misc_sound_time (output)
     [20]   ailp_previous_visibility (output)
     [21]   ailp_time_player_seen (output)
     [22]   ailp_time_player_sound_attacked (output)
     [23]   aip_GOAL_STATE (output)
     [24]   aip_CURRENT_STATE (output)
     [25]   sound_event_count
     [26]   sound_event1_id
     [27]   sound_event2_id *)

let cvv_ext_size = 19

(* P_Rand step: advance LCG state, return (value, new_state).
   Replicates C unsigned 32-bit arithmetic. *)
let p_rand_step state =
  let s = Int64.of_int (state land 0xFFFFFFFF) in
  let s = if state < 0 then Int64.(s + 0x100000000L) else s in
  let next = Int64.(to_int_exn (bit_and ((s * 1103515245L) + 12345L) 0xFFFFFFFFL)) in
  let value = (next lsr 16) land 0x7FFF in
  value, next
;;

(* make_random_vector using PRNG state. Returns (vec, new_state). *)
let make_random_vector_prng state =
  let open Ox_math in
  let rx, state = p_rand_step state in
  let ry, state = p_rand_step state in
  let rz, state = p_rand_step state in
  let v = rx - 16384, ry - 16384, rz - 16384 in
  let _, vnorm = vm_vec_copy_normalize_quick ~v in
  vnorm, state
;;

let f1_0 = 0x10000
let max_ai_cloak_info = 8
let ais_rest = 1
let ais_fire = 5
let pa_nearby_robot_fired = 1

let compute_vis_and_vec (arr : int array) =
  let open Ox_math in
  let n_objects = arr.(h_n_objects) in
  let obj_data_base = get_obj_data_base arr in
  let is_d2 = arr.(h_is_d2) <> 0 in
  let pv_base = obj_data_base + (n_objects * obj_block_size) in
  let cvv_base = pv_base + pv_ext_size in
  let game_time = arr.(h_game_time) in
  (* Read CVV extension *)
  let player_cloaked = arr.(cvv_base + 0) <> 0 in
  let difficulty_level = arr.(cvv_base + 1) in
  let cloak_last_time = ref arr.(cvv_base + 2) in
  let cloak_last_pos_x = ref arr.(cvv_base + 3) in
  let cloak_last_pos_y = ref arr.(cvv_base + 4) in
  let cloak_last_pos_z = ref arr.(cvv_base + 5) in
  let prand_state = ref arr.(cvv_base + 6) in
  let next_misc_sound_time = ref arr.(cvv_base + 7) in
  let next_fire = arr.(cvv_base + 8) in
  let previous_visibility = ref arr.(cvv_base + 9) in
  let time_player_seen = ref arr.(cvv_base + 10) in
  let time_player_sound_attacked = ref arr.(cvv_base + 11) in
  let goal_state = ref arr.(cvv_base + 12) in
  let current_state = ref arr.(cvv_base + 13) in
  let see_sound = arr.(cvv_base + 14) in
  let attack_sound = arr.(cvv_base + 15) in
  let player_exploded = arr.(cvv_base + 16) <> 0 in
  let next_fire2 = arr.(cvv_base + 17) in
  let player_awareness_type = arr.(cvv_base + 18) in
  (* Read pos from pv_ext *)
  let pos_x = arr.(pv_base + 0) in
  let pos_y = arr.(pv_base + 1) in
  let pos_z = arr.(pv_base + 2) in
  let pos = pos_x, pos_y, pos_z in
  let sound_events = Array.create ~len:4 0 in
  let sound_count = ref 0 in
  let add_sound sid =
    if !sound_count < 2
    then (
      sound_events.(!sound_count) <- sid;
      sound_count := !sound_count + 1)
  in
  let player_visibility = ref 0 in
  let vec_to_player_ref = ref (0, 0, 0) in
  let pvis_result = ref [| 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0 |] in
  if player_cloaked
  then (
    let delta_time = game_time - !cloak_last_time in
    if delta_time > f1_0 * 2
    then (
      cloak_last_time := game_time;
      let randvec, new_state = make_random_vector_prng !prand_state in
      prand_state := new_state;
      let new_pos =
        vm_vec_scale_add
          ~a:(!cloak_last_pos_x, !cloak_last_pos_y, !cloak_last_pos_z)
          ~b:randvec
          ~k:(8 * delta_time)
      in
      let nx, ny, nz = new_pos in
      cloak_last_pos_x := nx;
      cloak_last_pos_y := ny;
      cloak_last_pos_z := nz);
    let cloak_pos = !cloak_last_pos_x, !cloak_last_pos_y, !cloak_last_pos_z in
    let diff = vm_vec_sub ~a:cloak_pos ~b:pos in
    let dist, vec_norm = vm_vec_copy_normalize_quick ~v:diff in
    vec_to_player_ref := vec_norm;
    let vtpx, vtpy, vtpz = vec_norm in
    arr.(pv_base + 11) <- vtpx;
    arr.(pv_base + 12) <- vtpy;
    arr.(pv_base + 13) <- vtpz;
    pvis_result := player_is_visible_from_object arr;
    player_visibility := !pvis_result.(0);
    let fire_ok =
      if is_d2 then next_fire < f1_0 || next_fire2 < f1_0 else next_fire < f1_0
    in
    if !next_misc_sound_time < game_time && fire_ok && dist < f1_0 * 20
    then (
      let rv, ns = p_rand_step !prand_state in
      prand_state := ns;
      next_misc_sound_time := game_time + ((rv + f1_0) * (7 - difficulty_level) / 1);
      add_sound see_sound))
  else (
    let believed_player_pos =
      arr.(pv_base + 14), arr.(pv_base + 15), arr.(pv_base + 16)
    in
    let diff = vm_vec_sub ~a:believed_player_pos ~b:pos in
    let _, vec_norm = vm_vec_copy_normalize_quick ~v:diff in
    let vec_norm =
      let vx, vy, vz = vec_norm in
      if vx = 0 && vy = 0 && vz = 0 then f1_0, 0, 0 else vx, vy, vz
    in
    vec_to_player_ref := vec_norm;
    let vtpx, vtpy, vtpz = vec_norm in
    arr.(pv_base + 11) <- vtpx;
    arr.(pv_base + 12) <- vtpy;
    arr.(pv_base + 13) <- vtpz;
    pvis_result := player_is_visible_from_object arr;
    player_visibility := !pvis_result.(0);
    if !player_visibility = 2 && !previous_visibility <> 2
    then
      if !goal_state = ais_rest || !current_state = ais_rest
      then (
        goal_state := ais_fire;
        current_state := ais_fire);
    let do_sound_check = if is_d2 then true else not player_exploded in
    if
      do_sound_check
      && !previous_visibility <> !player_visibility
      && !player_visibility = 2
    then
      if !previous_visibility = 0
      then (
        if !time_player_seen + (f1_0 / 2) < game_time
        then (
          add_sound see_sound;
          time_player_sound_attacked := game_time;
          let rv, ns = p_rand_step !prand_state in
          prand_state := ns;
          next_misc_sound_time := game_time + f1_0 + (rv * 4)))
      else if !time_player_sound_attacked + (f1_0 / 4) < game_time
      then (
        add_sound attack_sound;
        time_player_sound_attacked := game_time);
    if !player_visibility = 2 && !next_misc_sound_time < game_time
    then (
      let rv, ns = p_rand_step !prand_state in
      prand_state := ns;
      next_misc_sound_time := game_time + ((rv + f1_0) * (7 - difficulty_level) / 2);
      add_sound attack_sound);
    previous_visibility := !player_visibility);
  (* D2: awareness-based visibility upgrade *)
  let player_visibility =
    if is_d2 && player_awareness_type >= pa_nearby_robot_fired && !player_visibility = 1
    then 2
    else !player_visibility
  in
  if player_visibility <> 0 then time_player_seen := game_time;
  let pr = !pvis_result in
  let vtpx, vtpy, vtpz = !vec_to_player_ref in
  [| player_visibility
   ; vtpx
   ; vtpy
   ; vtpz
   ; pr.(1)
   ; pr.(2)
   ; pr.(3)
   ; pr.(4)
   ; pr.(5)
   ; pr.(6)
   ; pr.(7)
   ; pr.(8)
   ; pr.(9)
   ; pr.(10)
   ; !cloak_last_time
   ; !cloak_last_pos_x
   ; !cloak_last_pos_y
   ; !cloak_last_pos_z
   ; !prand_state
   ; !next_misc_sound_time
   ; !previous_visibility
   ; !time_player_seen
   ; !time_player_sound_attacked
   ; !goal_state
   ; !current_state
   ; !sound_count
   ; sound_events.(0)
   ; sound_events.(1)
  |]
;;
