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
let oflow_check a b =
  let tmp = Int64.(abs (of_int a) * abs (of_int b)) in
  Int64.(shift_right tmp 47 <> 0L)

(* Find where line p0->p1 intersects plane (plane_pnt, plane_norm),
   accounting for radius offset. Returns Some newp if found, None if parallel/no-hit. *)
let find_plane_line_intersection ~plane_pnt ~plane_norm ~p0 ~p1 ~rad =
  let open Ox_math in
  let d = vm_vec_sub ~a:p1 ~b:p0 in
  let w = vm_vec_sub ~a:p0 ~b:plane_pnt in
  let num_raw = vm_vec_dotprod ~a:plane_norm ~b:w in
  let den = wrap32 (- (vm_vec_dotprod ~a:plane_norm ~b:d)) in
  let num = wrap32 (num_raw - rad) in
  (* Check for various bad values — C operator precedence:
     (den == 0) || ((den > 0) && ((num > den) || ((-num >> 15) >= den)))
                 || (den < 0 && num < den) *)
  let neg_num = wrap32 (-num) in
  if den = 0
  then None
  else if den > 0 && (num > den || (neg_num asr 15) >= den)
  then None
  else if den < 0 && num < den
  then None
  else begin
    let f1_0 = 0x10000 in
    if abs num / (f1_0 / 2) >= abs den
    then None  (* would overflow *)
    else begin
      let k = fixdiv ~a:num ~b:den in
      let dx, dy, dz = d in
      if oflow_check dx k || oflow_check dy k || oflow_check dz k
      then None
      else begin
        let scaled = vm_vec_scale2 ~v:d ~n:num ~d:den in
        let newp = vm_vec_add ~a:p0 ~b:scaled in
        Some (k, newp)
      end
    end
  end

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
  let biggest =
    if tx > ty then (if tx > tz then 0 else 2)
    else if ty > tz then 1
    else 2
  in
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

(* Check if a sphere (center pnt, radius rad) intersects a face.
   Returns IT_FACE, IT_EDGE, IT_POINT, or IT_NONE. *)
let check_sphere_to_face ~pnt ~norm ~nv ~rad ~(vertex_positions : vec3 array) =
  let open Ox_math in
  let edgemask = check_point_to_face ~checkp:pnt ~norm ~nv ~vertex_positions in
  if edgemask = 0
  then it_face
  else begin
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
    if wrap32 (d + rad) < 0 then it_none
    else if wrap32 (d - rad) > edgelen then it_none
    else begin
      let itype = ref it_point in
      let closest_point =
        if d < 0 then v0
        else if d > edgelen then v1
        else begin
          itype := it_edge;
          vm_vec_scale_add ~a:v0 ~b:edgevec ~k:d
        end
      in
      let dist = vm_vec_dist ~a:pnt ~b:closest_point in
      if dist <= rad
      then (if !itype = it_point then it_none else !itype)
      else it_none
    end
  end

(* 3x3 matrix determinant — all intermediate sums wrap to 32-bit like C *)
let calc_det_value ~rvec:(rx, ry, rz) ~uvec:(ux, uy, uz) ~fvec:(fx, fy, fz) =
  let open Ox_math in
  let a = fixmul ~a:rx ~b:(fixmul ~a:uy ~b:fz) in
  let b = wrap32 (a - fixmul ~a:rx ~b:(fixmul ~a:uz ~b:fy)) in
  let c = wrap32 (b - fixmul ~a:ry ~b:(fixmul ~a:ux ~b:fz)) in
  let d = wrap32 (c + fixmul ~a:ry ~b:(fixmul ~a:uz ~b:fx)) in
  let e = wrap32 (d + fixmul ~a:rz ~b:(fixmul ~a:ux ~b:fy)) in
  wrap32 (e - fixmul ~a:rz ~b:(fixmul ~a:uy ~b:fx))

(* Line-line closest approach. Returns (ok, t1, t2).
   Lines: p1 + t*v1 and p2 + t*v2. *)
let check_line_to_line ~p1 ~v1 ~p2 ~v2 =
  let open Ox_math in
  let rvec = vm_vec_sub ~a:p2 ~b:p1 in
  let fvec = vm_vec_crossprod ~a:v1 ~b:v2 in
  let cross_mag2 = vm_vec_dotprod ~a:fvec ~b:fvec in
  if cross_mag2 = 0
  then false, 0, 0  (* parallel *)
  else begin
    let d1 = calc_det_value ~rvec ~uvec:v2 ~fvec in
    if oflow_check d1 cross_mag2
    then false, 0, 0
    else begin
      let t1 = fixdiv ~a:d1 ~b:cross_mag2 in
      let d2 = calc_det_value ~rvec ~uvec:v1 ~fvec in
      if oflow_check d2 cross_mag2
      then false, 0, 0
      else begin
        let t2 = fixdiv ~a:d2 ~b:cross_mag2 in
        true, t1, t2
      end
    end
  end

(* Check if line p0->p1 intersects a face. Returns (hit_type, newp).
   vertex_list is the 6-element vertex index list from create_abs_vertex_lists.
   facenum selects which face (0 or 1 for triangulated sides).
   norm is the face normal for this facenum.
   seg_verts/seg_vert_positions supply vertex position lookup. *)
let check_line_to_face ~p0 ~p1 ~norm ~rad ~facenum ~nv ~num_faces
    ~(vertex_list : int array) ~(seg_verts : int array) ~(seg_vert_positions : vec3 array) =
  let open Ox_math in
  let vpos = Ox_gameseg.lookup_vpos seg_verts seg_vert_positions in
  (* Use lowest point number as plane point *)
  let vertnum =
    if num_faces = 2
    then min vertex_list.(0) vertex_list.(2)
    else begin
      let v = ref vertex_list.(0) in
      for i = 1 to 3 do
        if vertex_list.(i) < !v then v := vertex_list.(i)
      done;
      !v
    end
  in
  let plane_pnt = vpos vertnum in
  match find_plane_line_intersection ~plane_pnt ~plane_norm:norm ~p0 ~p1 ~rad with
  | None -> it_none, (0, 0, 0)
  | Some (_k, newp) ->
    let checkp =
      if rad <> 0
      then vm_vec_scale_add2 ~dest:newp ~src:norm ~k:(-rad)
      else newp
    in
    (* Build vertex positions for this face *)
    let face_verts = Array.init nv ~f:(fun i ->
      vpos vertex_list.(facenum * 3 + i))
    in
    let hit = check_sphere_to_face ~pnt:checkp ~norm ~nv ~rad ~vertex_positions:face_verts in
    hit, newp

(* special_check_line_to_face: handles the case where both start and end
   positions poke through the plane of a side. *)
let special_check_line_to_face ~p0 ~p1 ~norm ~rad ~facenum ~nv ~num_faces
    ~side_type:_ ~sidenum:_ ~(vertex_list : int array)
    ~(seg_verts : int array) ~(seg_vert_positions : vec3 array) =
  let open Ox_math in
  let vpos = Ox_gameseg.lookup_vpos seg_verts seg_vert_positions in
  (* Build vertex positions for this face *)
  let face_verts = Array.init nv ~f:(fun i ->
    vpos vertex_list.(facenum * 3 + i))
  in
  (* Figure out which edge(s) to check against *)
  let edgemask = check_point_to_face ~checkp:p0 ~norm ~nv ~vertex_positions:face_verts in
  if edgemask = 0
  then
    (* Start point is inside face — fall back to check_line_to_face *)
    check_line_to_face ~p0 ~p1 ~norm ~rad ~facenum ~nv ~num_faces
      ~vertex_list ~seg_verts ~seg_vert_positions
  else begin
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
    let ok, edge_t, move_t = check_line_to_line ~p1:edge_v0 ~v1:edge_vec_n ~p2:p0 ~v2:move_vec_n in
    if not ok then it_none, (0, 0, 0)
    else if move_t < 0 || move_t > wrap32 (move_len + rad) then it_none, (0, 0, 0)
    else begin
      let move_t2 = if move_t > move_len then move_len else move_t in
      let edge_t2 = if edge_t < 0 then 0 else edge_t in
      let edge_t2 = if edge_t2 > edge_len then edge_len else edge_t2 in
      let closest_point_edge = vm_vec_scale_add ~a:edge_v0 ~b:edge_vec_n ~k:edge_t2 in
      let closest_point_move = vm_vec_scale_add ~a:p0 ~b:move_vec_n ~k:move_t2 in
      let closest_dist = vm_vec_dist ~a:closest_point_edge ~b:closest_point_move in
      if closest_dist < wrap32 (fixmul ~a:rad ~b:15) / 20
      then begin
        let newp = vm_vec_scale_add ~a:p0 ~b:move_vec_n ~k:(wrap32 (move_t - rad)) in
        it_edge, newp
      end
      else it_none, (0, 0, 0)
    end
  end

(* Ray-sphere intersection. Returns (dist, intp) where dist=0 means no hit. *)
let check_vector_to_sphere_1 ~p0 ~p1 ~sphere_pos ~sphere_rad =
  let open Ox_math in
  let d = vm_vec_sub ~a:p1 ~b:p0 in
  let w = vm_vec_sub ~a:sphere_pos ~b:p0 in
  let mag_d, dn = vm_vec_copy_normalize ~v:d in
  if mag_d = 0
  then begin
    let int_dist = vm_vec_mag ~v:w in
    if int_dist < sphere_rad then int_dist, p0 else 0, p0
  end
  else begin
    let w_dist = vm_vec_dotprod ~a:dn ~b:w in
    if w_dist < 0 then 0, (0, 0, 0)  (* moving away *)
    else if w_dist > wrap32 (mag_d + sphere_rad) then 0, (0, 0, 0)  (* cannot hit *)
    else begin
      let closest_point = vm_vec_scale_add ~a:p0 ~b:dn ~k:w_dist in
      let dist = vm_vec_dist ~a:closest_point ~b:sphere_pos in
      if dist < sphere_rad
      then begin
        let dist2 = fixmul ~a:dist ~b:dist in
        let rad2 = fixmul ~a:sphere_rad ~b:sphere_rad in
        let shorten = fix_sqrt ~a:(wrap32 (rad2 - dist2)) in
        let int_dist = wrap32 (w_dist - shorten) in
        if int_dist > mag_d || int_dist < 0
        then 1, p0  (* inside sphere *)
        else begin
          let intp = vm_vec_scale_add ~a:p0 ~b:dn ~k:int_dist in
          int_dist, intp
        end
      end
      else 0, (0, 0, 0)
    end
  end

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
let check_vector_to_object ~p0 ~p1 ~rad ~obj_pos ~obj_size
    ~obj_type ~attack_type ~otherobj_type ~game_mode_coop
    ~otherobj_parent_type =
  let size = ref obj_size in
  if obj_type = obj_robot && attack_type <> 0 then
    size := (!size * 3) / 4;
  if obj_type = obj_player &&
     (otherobj_type = obj_player ||
      (game_mode_coop && otherobj_type = obj_weapon &&
       otherobj_parent_type = obj_player)) then
    size := !size / 2;
  check_vector_to_sphere_1 ~p0 ~p1 ~sphere_pos:obj_pos
    ~sphere_rad:(!size + rad)
