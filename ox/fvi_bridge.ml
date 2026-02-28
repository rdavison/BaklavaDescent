(* FVI bridge callbacks — packed array interface for C bridge.

   check_line_to_face / special_check_line_to_face pack format (46 ints):
   [0..2]   = p0 (x,y,z)
   [3..5]   = p1 (x,y,z)
   [6..8]   = side_norm (x,y,z)
   [9]      = rad
   [10]     = facenum
   [11]     = nv (3 or 4)
   [12]     = side_type
   [13]     = sidenum
   [14..21] = seg_verts[0..7]
   [22..45] = seg_vert_positions[0..7] as 8 * (x,y,z)
   Returns [| hit_type; newpx; newpy; newpz |]

   check_vector_to_sphere_1 (10 scalar args):
   p0(3) + p1(3) + sphere_pos(3) + sphere_rad(1)
   Returns [| dist; intpx; intpy; intpz |] *)

let cd_check_line_to_face (arr : int array) =
  let p0 = arr.(0), arr.(1), arr.(2) in
  let p1 = arr.(3), arr.(4), arr.(5) in
  let norm = arr.(6), arr.(7), arr.(8) in
  let rad = arr.(9) in
  let facenum = arr.(10) in
  let nv = arr.(11) in
  let side_type = arr.(12) in
  let sidenum = arr.(13) in
  let seg_verts = Array.init 8 ~f:(fun i -> arr.(14 + i)) in
  let seg_vert_positions =
    Array.init 8 ~f:(fun i ->
      let base = 22 + (i * 3) in
      arr.(base), arr.(base + 1), arr.(base + 2))
  in
  let num_faces, vertex_list =
    Ox_gameseg.create_abs_vertex_lists ~side_type ~seg_verts ~sidenum
  in
  let hit, (npx, npy, npz) =
    Ox_fvi.check_line_to_face
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
  in
  [| hit; npx; npy; npz |]
;;

let cd_special_check_line_to_face (arr : int array) =
  let p0 = arr.(0), arr.(1), arr.(2) in
  let p1 = arr.(3), arr.(4), arr.(5) in
  let norm = arr.(6), arr.(7), arr.(8) in
  let rad = arr.(9) in
  let facenum = arr.(10) in
  let nv = arr.(11) in
  let side_type = arr.(12) in
  let sidenum = arr.(13) in
  let seg_verts = Array.init 8 ~f:(fun i -> arr.(14 + i)) in
  let seg_vert_positions =
    Array.init 8 ~f:(fun i ->
      let base = 22 + (i * 3) in
      arr.(base), arr.(base + 1), arr.(base + 2))
  in
  let num_faces, vertex_list =
    Ox_gameseg.create_abs_vertex_lists ~side_type ~seg_verts ~sidenum
  in
  let hit, (npx, npy, npz) =
    Ox_fvi.special_check_line_to_face
      ~p0
      ~p1
      ~norm
      ~rad
      ~facenum
      ~nv
      ~num_faces
      ~side_type
      ~sidenum
      ~vertex_list
      ~seg_verts
      ~seg_vert_positions
  in
  [| hit; npx; npy; npz |]
;;

let cd_check_vector_to_sphere_1 p0x p0y p0z p1x p1y p1z spx spy spz srad =
  let dist, (ix, iy, iz) =
    Ox_fvi.check_vector_to_sphere_1
      ~p0:(p0x, p0y, p0z)
      ~p1:(p1x, p1y, p1z)
      ~sphere_pos:(spx, spy, spz)
      ~sphere_rad:srad
  in
  dist, ix, iy, iz
;;

(* check_vector_to_object: 16 scalar args → 4 ints (dist, intpx, intpy, intpz)
   p0(3) + p1(3) + rad(1) + obj_pos(3) + obj_size(1) + obj_type(1) +
   attack_type(1) + otherobj_type(1) + game_mode_coop(1) +
   otherobj_parent_type(1) = 16 in *)
let cd_check_vector_to_object
      p0x
      p0y
      p0z
      p1x
      p1y
      p1z
      rad
      opx
      opy
      opz
      obj_size
      obj_type
      attack_type
      otherobj_type
      game_mode_coop
      otherobj_parent_type
  =
  let dist, (ix, iy, iz) =
    Ox_fvi.check_vector_to_object
      ~p0:(p0x, p0y, p0z)
      ~p1:(p1x, p1y, p1z)
      ~rad
      ~obj_pos:(opx, opy, opz)
      ~obj_size
      ~obj_type
      ~attack_type
      ~otherobj_type
      ~game_mode_coop:(game_mode_coop <> 0)
      ~otherobj_parent_type
  in
  dist, ix, iy, iz
;;

(* object_intersects_wall: packed array → int (0 or 1)
   Packed layout: header(6) + n_segments × 80 per-segment data.
   See Ox_fvi.sphere_intersects_wall for full layout docs. *)
let cd_object_intersects_wall (arr : int array) = Ox_fvi.sphere_intersects_wall arr

(* find_vector_intersection: packed array → int array (result)
   See Ox_fvi.find_vector_intersection for full packed layout docs.
   Returns: [| hit_type; hit_pnt.xyz; hit_seg; hit_side; hit_side_seg;
               hit_object; wallnorm.xyz; n_segs; seglist... |] *)
let cd_find_vector_intersection (arr : int array) = Ox_fvi.find_vector_intersection arr

(* find_homing_object_complete: packed array → int (best object index or -1)
   Packed layout: FVI format + homing extension.
   See Ox_fvi.find_homing_object_complete for full layout docs. *)
let cd_find_homing_object_complete (arr : int array) =
  Ox_fvi.find_homing_object_complete arr
;;

let () =
  Callback.register "cd_check_line_to_face" cd_check_line_to_face;
  Callback.register "cd_special_check_line_to_face" cd_special_check_line_to_face;
  Callback.register "cd_check_vector_to_sphere_1" cd_check_vector_to_sphere_1;
  Callback.register "cd_check_vector_to_object" cd_check_vector_to_object;
  Callback.register "cd_object_intersects_wall" cd_object_intersects_wall;
  Callback.register "cd_find_vector_intersection" cd_find_vector_intersection;
  Callback.register "cd_find_homing_object_complete" cd_find_homing_object_complete
;;
