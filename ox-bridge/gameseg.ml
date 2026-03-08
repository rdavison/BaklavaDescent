let cd_compute_center_point_on_side v0x v0y v0z v1x v1y v1z v2x v2y v2z v3x v3y v3z =
  Ox_gameseg.compute_center_point_on_side
    ~v0:(v0x, v0y, v0z)
    ~v1:(v1x, v1y, v1z)
    ~v2:(v2x, v2y, v2z)
    ~v3:(v3x, v3y, v3z)
;;

let cd_compute_segment_center (arr : int array) =
  let v i = arr.(i * 3), arr.((i * 3) + 1), arr.((i * 3) + 2) in
  let cx, cy, cz =
    Ox_gameseg.compute_segment_center
      ~v0:(v 0)
      ~v1:(v 1)
      ~v2:(v 2)
      ~v3:(v 3)
      ~v4:(v 4)
      ~v5:(v 5)
      ~v6:(v 6)
      ~v7:(v 7)
  in
  [| cx; cy; cz |]
;;

let cd_get_verts_for_normal va vb vc vd =
  let v0, v1, v2, v3, negate_flag = Ox_gameseg.get_verts_for_normal ~va ~vb ~vc ~vd in
  v0, v1, v2, v3, negate_flag
;;

let cd_create_abs_vertex_lists side_type (seg_verts : int array) sidenum =
  let num_faces, vertices =
    Ox_gameseg.create_abs_vertex_lists ~side_type ~seg_verts ~sidenum
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
  let vx, vy, vz = Ox_gameseg.extract_vector_from_segment ~verts ~start_side ~end_side in
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

(* find_connect_side: 7 scalar args → 1 int
   children(6) + base_seg_num(1) = 7 in
   Returns: side index or -1 *)
let cd_find_connect_side c0 c1 c2 c3 c4 c5 base_seg_num =
  let children = [| c0; c1; c2; c3; c4; c5 |] in
  Ox_gameseg.find_connect_side ~children ~base_seg_num
;;

(* create_shortpos: packed int array → int array (17 ints)
   Input: [orient(9), pos(3), vel(3), seg_vert0(3), segnum] = 19 ints
   Output: [bytemat(9), xo, yo, zo, segment, velx, vely, velz] = 17 ints *)
let cd_create_shortpos (packed : int array) =
  let orient = Array.init 9 ~f:(fun i -> packed.(i)) in
  let pos = packed.(9), packed.(10), packed.(11) in
  let vel = packed.(12), packed.(13), packed.(14) in
  let seg_vert0 = packed.(15), packed.(16), packed.(17) in
  let segnum = packed.(18) in
  let bytemat, xo, yo, zo, segment, velx, vely, velz =
    Ox_gameseg.create_shortpos ~orient ~pos ~vel ~seg_vert0 ~segnum
  in
  let buf = Array.create ~len:17 0 in
  Array.blit ~src:bytemat ~dst:buf ~src_pos:0 ~dst_pos:0 ~len:9;
  buf.(9) <- xo;
  buf.(10) <- yo;
  buf.(11) <- zo;
  buf.(12) <- segment;
  buf.(13) <- velx;
  buf.(14) <- vely;
  buf.(15) <- velz;
  buf.(16) <- Array.length bytemat;
  buf
;;

(* extract_shortpos: packed int array → int array (15 ints)
   Input: [bytemat(9), xo, yo, zo, seg_vert0(3), velx, vely, velz] = 18 ints
   Output: [orient(9), pos(3), vel(3)] = 15 ints *)
let cd_extract_shortpos (packed : int array) =
  let bytemat = Array.init 9 ~f:(fun i -> packed.(i)) in
  let xo = packed.(9) in
  let yo = packed.(10) in
  let zo = packed.(11) in
  let seg_vert0 = packed.(12), packed.(13), packed.(14) in
  let velx = packed.(15) in
  let vely = packed.(16) in
  let velz = packed.(17) in
  let orient, (px, py, pz), (vx, vy, vz) =
    Ox_gameseg.extract_shortpos ~bytemat ~xo ~yo ~zo ~seg_vert0 ~velx ~vely ~velz
  in
  let buf = Array.create ~len:15 0 in
  Array.blit ~src:orient ~dst:buf ~src_pos:0 ~dst_pos:0 ~len:9;
  buf.(9) <- px;
  buf.(10) <- py;
  buf.(11) <- pz;
  buf.(12) <- vx;
  buf.(13) <- vy;
  buf.(14) <- vz;
  buf
;;

(* create_walls_on_side: packed int array → int array (7 ints)
   Input: [v0(3), v1(3), v2(3), v3(3), vi0, vi1, vi2, vi3, has_child] = 17 ints
   Output: [side_type, n0x, n0y, n0z, n1x, n1y, n1z] = 7 ints *)
let cd_create_walls_on_side (packed : int array) =
  let v0 = packed.(0), packed.(1), packed.(2) in
  let v1 = packed.(3), packed.(4), packed.(5) in
  let v2 = packed.(6), packed.(7), packed.(8) in
  let v3 = packed.(9), packed.(10), packed.(11) in
  let vi0 = packed.(12) in
  let vi1 = packed.(13) in
  let vi2 = packed.(14) in
  let vi3 = packed.(15) in
  let has_child = packed.(16) <> 0 in
  let side_type, (n0x, n0y, n0z), (n1x, n1y, n1z) =
    Ox_gameseg.create_walls_on_side ~v0 ~v1 ~v2 ~v3 ~vi0 ~vi1 ~vi2 ~vi3 ~has_child
  in
  [| side_type; n0x; n0y; n0z; n1x; n1y; n1z |]
;;

(* check_norms: 6 scalar ints → 1 int *)
let cd_check_norms n0x n0y n0z n1x n1y n1z =
  Ox_gameseg.check_norms ~n0:(n0x, n0y, n0z) ~n1:(n1x, n1y, n1z)
;;

(* create_all_vertex_lists: side_type + sidenum → packed 7 ints
   Output: [num_faces, vertices(6)] *)
let cd_create_all_vertex_lists side_type sidenum =
  let num_faces, vertices = Ox_gameseg.create_all_vertex_lists ~side_type ~sidenum in
  let buf = Array.create ~len:7 0 in
  buf.(0) <- num_faces;
  Array.blit ~src:vertices ~dst:buf ~src_pos:0 ~dst_pos:1 ~len:6;
  buf
;;

(* create_all_vertnum_lists: side_type → packed 7 ints
   Output: [num_faces, vertnums(6)] *)
let cd_create_all_vertnum_lists side_type =
  let num_faces, vertnums = Ox_gameseg.create_all_vertnum_lists ~side_type in
  let buf = Array.create ~len:7 0 in
  buf.(0) <- num_faces;
  Array.blit ~src:vertnums ~dst:buf ~src_pos:0 ~dst_pos:1 ~len:6;
  buf
;;

(* find_point_seg: packed array → int (segment number or -1)
   Packed layout: header(6) + n_segments × 80 per-segment data.
   See Ox_gameseg.find_point_seg for full layout docs. *)
let cd_find_point_seg (arr : int array) = Ox_gameseg.find_point_seg arr

(* find_connected_distance: packed array → int array (2 ints)
   Packed layout: header(12) + n_segments × 15 per-segment data.
   See Ox_gameseg.find_connected_distance for full layout docs.
   Returns: [| distance (fix) or -1; connected_segment_distance |] *)
let cd_find_connected_distance (arr : int array) = Ox_gameseg.find_connected_distance arr

(* find_connected_distance_segments: packed array → int array (2 ints)
   Packed layout: header(6) + n_segments × 15 per-segment data.
   See Ox_gameseg.find_connected_distance_segments for full layout docs.
   Returns: [| distance (fix) or -1; connected_segment_distance |] *)
let cd_find_connected_distance_segments (arr : int array) = Ox_gameseg.find_connected_distance_segments arr

(* validate_removable_wall: packed int array → int array (8 ints)
   Input: [v0(3), v1(3), v2(3), v3(3), vi0, vi1, vi2, vi3, has_child, tmap_num] = 18 ints
   Output: [side_type, n0x, n0y, n0z, n1x, n1y, n1z, tmap_num] = 8 ints *)
let cd_validate_removable_wall (packed : int array) =
  let v0 = packed.(0), packed.(1), packed.(2) in
  let v1 = packed.(3), packed.(4), packed.(5) in
  let v2 = packed.(6), packed.(7), packed.(8) in
  let v3 = packed.(9), packed.(10), packed.(11) in
  let vi0 = packed.(12) in
  let vi1 = packed.(13) in
  let vi2 = packed.(14) in
  let vi3 = packed.(15) in
  let has_child = packed.(16) <> 0 in
  let tmap_num = packed.(17) in
  let side_type, (n0x, n0y, n0z), (n1x, n1y, n1z), tmap =
    Ox_gameseg.validate_removable_wall ~v0 ~v1 ~v2 ~v3 ~vi0 ~vi1 ~vi2 ~vi3 ~has_child ~tmap_num
  in
  [| side_type; n0x; n0y; n0z; n1x; n1y; n1z; tmap |]
;;

(* C externals for on-demand segment data + side type mutation *)
external fetch_segment_data_c : int -> int array = "cd_ox_fetch_segment_data"
external set_segment_side_type_c : int -> int -> int -> unit = "cd_ox_set_segment_side_type"

(* check_segment_connections: runs OCaml logic under effect handlers.
   Takes highest_segment_index as parameter. Returns error count (0 or 1). *)
let cd_check_segment_connections highest_segment_index =
  Effect.Deep.match_with
    (fun () ->
      Ox_gameseg.check_segment_connections ~highest_segment_index)
    ()
    { retc = (fun x -> x)
    ; exnc = (fun e ->
        Printf.eprintf "[OX] check_segment_connections exception: %s\n"
          (Exn.to_string e);
        Out_channel.flush stderr;
        0)
    ; effc = (fun (type a) (eff : a Effect.t) ->
        match eff with
        | Ox_gameseg.Fetch_segment_data segnum ->
          Some (fun (k : (a, _) Effect.Deep.continuation) ->
            Effect.Deep.continue k (fetch_segment_data_c segnum))
        | Ox_gameseg.Set_segment_side_type (segnum, sidenum, new_type) ->
          Some (fun (k : (a, _) Effect.Deep.continuation) ->
            set_segment_side_type_c segnum sidenum new_type;
            Effect.Deep.continue k ())
        | _ -> None)
    }
;;

let register_callbacks () =
  Callback.register "cd_compute_center_point_on_side" cd_compute_center_point_on_side;
  Callback.register "cd_compute_segment_center" cd_compute_segment_center;
  Callback.register "cd_get_verts_for_normal" cd_get_verts_for_normal;
  Callback.register "cd_create_abs_vertex_lists" cd_create_abs_vertex_lists;
  Callback.register "cd_get_seg_masks" cd_get_seg_masks;
  Callback.register "cd_get_side_dists" cd_get_side_dists;
  Callback.register "cd_extract_vector_from_segment" cd_extract_vector_from_segment;
  Callback.register "cd_extract_orient_from_segment" cd_extract_orient_from_segment;
  Callback.register "cd_find_connect_side" cd_find_connect_side;
  Callback.register "cd_create_shortpos" cd_create_shortpos;
  Callback.register "cd_extract_shortpos" cd_extract_shortpos;
  Callback.register "cd_validate_removable_wall" cd_validate_removable_wall;
  Callback.register "cd_create_walls_on_side" cd_create_walls_on_side;
  Callback.register "cd_check_norms" cd_check_norms;
  Callback.register "cd_create_all_vertex_lists" cd_create_all_vertex_lists;
  Callback.register "cd_create_all_vertnum_lists" cd_create_all_vertnum_lists;
  Callback.register "cd_find_point_seg" cd_find_point_seg;
  Callback.register "cd_find_connected_distance" cd_find_connected_distance;
  Callback.register "cd_find_connected_distance_segments" cd_find_connected_distance_segments;
  Callback.register "cd_check_segment_connections" cd_check_segment_connections
;;
