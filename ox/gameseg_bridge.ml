let cd_compute_center_point_on_side v0x v0y v0z v1x v1y v1z v2x v2y v2z v3x v3y v3z =
  Ox_gameseg.compute_center_point_on_side
    (v0x, v0y, v0z)
    (v1x, v1y, v1z)
    (v2x, v2y, v2z)
    (v3x, v3y, v3z)
;;

let cd_compute_segment_center (arr : int array) =
  let v i = arr.(i * 3), arr.((i * 3) + 1), arr.((i * 3) + 2) in
  let cx, cy, cz =
    Ox_gameseg.compute_segment_center (v 0) (v 1) (v 2) (v 3) (v 4) (v 5) (v 6) (v 7)
  in
  [| cx; cy; cz |]
;;

let cd_get_verts_for_normal va vb vc vd =
  let v0, v1, v2, v3, negate_flag = Ox_gameseg.get_verts_for_normal va vb vc vd in
  v0, v1, v2, v3, negate_flag
;;

let cd_create_abs_vertex_lists side_type (seg_verts : int array) sidenum =
  let num_faces, vertices =
    Ox_gameseg.create_abs_vertex_lists side_type seg_verts sidenum
  in
  let result = Array.create ~len:7 0 in
  result.(0) <- num_faces;
  for i = 0 to 5 do
    result.(i + 1) <- vertices.(i)
  done;
  result
;;

(* Pack format for get_seg_masks:
   [0..2]  = checkp (x,y,z)
   [3]     = rad
   [4..11] = seg_verts[0..7] (absolute vertex indices)
   [12..17] = side_types[0..5]
   [18..53] = normals[0..11] as 12 * (x,y,z)
   [54..77] = seg_vert_positions[0..7] as 8 * (x,y,z) *)
let cd_get_seg_masks (arr : int array) =
  let cpx = arr.(0) in
  let cpy = arr.(1) in
  let cpz = arr.(2) in
  let rad = arr.(3) in
  let seg_verts = Array.init 8 ~f:(fun i -> arr.(4 + i)) in
  let side_types = Array.init 6 ~f:(fun i -> arr.(12 + i)) in
  let normals =
    Array.init 12 ~f:(fun i ->
      let base = 18 + (i * 3) in
      arr.(base), arr.(base + 1), arr.(base + 2))
  in
  let seg_vert_positions =
    Array.init 8 ~f:(fun i ->
      let base = 54 + (i * 3) in
      arr.(base), arr.(base + 1), arr.(base + 2))
  in
  let facemask, sidemask, centermask =
    Ox_gameseg.get_seg_masks
      ~checkp:(cpx, cpy, cpz)
      ~rad
      ~seg_verts
      ~side_types
      ~normals
      ~seg_vert_positions
  in
  [| facemask; sidemask; centermask |]
;;

(* Pack format for get_side_dists:
   [0..2]  = checkp (x,y,z)
   [3..10] = seg_verts[0..7]
   [11..16] = side_types[0..5]
   [17..52] = normals[0..11] as 12 * (x,y,z)
   [53..76] = seg_vert_positions[0..7] as 8 * (x,y,z) *)
let cd_get_side_dists (arr : int array) =
  let cpx = arr.(0) in
  let cpy = arr.(1) in
  let cpz = arr.(2) in
  let seg_verts = Array.init 8 ~f:(fun i -> arr.(3 + i)) in
  let side_types = Array.init 6 ~f:(fun i -> arr.(11 + i)) in
  let normals =
    Array.init 12 ~f:(fun i ->
      let base = 17 + (i * 3) in
      arr.(base), arr.(base + 1), arr.(base + 2))
  in
  let seg_vert_positions =
    Array.init 8 ~f:(fun i ->
      let base = 53 + (i * 3) in
      arr.(base), arr.(base + 1), arr.(base + 2))
  in
  let mask, side_dists =
    Ox_gameseg.get_side_dists
      ~checkp:(cpx, cpy, cpz)
      ~seg_verts
      ~side_types
      ~normals
      ~seg_vert_positions
  in
  let result = Array.create ~len:7 0 in
  result.(0) <- mask;
  for i = 0 to 5 do
    result.(i + 1) <- side_dists.(i)
  done;
  result
;;

let cd_extract_vector_from_segment (arr : int array) =
  let verts =
    Array.init 8 ~f:(fun i ->
      let base = i * 3 in
      arr.(base), arr.(base + 1), arr.(base + 2))
  in
  let start_side = arr.(24) in
  let end_side = arr.(25) in
  let vx, vy, vz = Ox_gameseg.extract_vector_from_segment verts start_side end_side in
  [| vx; vy; vz |]
;;

let cd_extract_orient_from_segment (arr : int array) =
  let verts =
    Array.init 8 ~f:(fun i ->
      let base = i * 3 in
      arr.(base), arr.(base + 1), arr.(base + 2))
  in
  let (r1, r2, r3), (u1, u2, u3), (f1, f2, f3) =
    Ox_gameseg.extract_orient_from_segment verts
  in
  [| r1; r2; r3; u1; u2; u3; f1; f2; f3 |]
;;

let () =
  Callback.register "cd_compute_center_point_on_side" cd_compute_center_point_on_side;
  Callback.register "cd_compute_segment_center" cd_compute_segment_center;
  Callback.register "cd_get_verts_for_normal" cd_get_verts_for_normal;
  Callback.register "cd_create_abs_vertex_lists" cd_create_abs_vertex_lists;
  Callback.register "cd_get_seg_masks" cd_get_seg_masks;
  Callback.register "cd_get_side_dists" cd_get_side_dists;
  Callback.register "cd_extract_vector_from_segment" cd_extract_vector_from_segment;
  Callback.register "cd_extract_orient_from_segment" cd_extract_orient_from_segment
;;
