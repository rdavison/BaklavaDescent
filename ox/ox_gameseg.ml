let side_to_verts =
  [| [| 7; 6; 2; 3 |]
   ; [| 0; 4; 7; 3 |]
   ; [| 0; 1; 5; 4 |]
   ; [| 2; 6; 5; 1 |]
   ; [| 4; 5; 6; 7 |]
   ; [| 3; 2; 1; 0 |]
  |]
;;

let _side_is_quad = 1 [@@warning "-32"]
let _side_is_tri_02 = 2 [@@warning "-32"]
let _side_is_tri_13 = 3 [@@warning "-32"]
let _wleft = 0 [@@warning "-32"]
let wtop = 1
let _wright = 2 [@@warning "-32"]
let wbottom = 3
let wback = 4
let wfront = 5
let plane_dist_tolerance = 250

type vec3 = int * int * int

let compute_center_point_on_side ~(v0 : vec3) ~(v1 : vec3) ~(v2 : vec3) ~(v3 : vec3)
  : vec3
  =
  Ox_math.vm_vec_avg4 ~a:v0 ~b:v1 ~c:v2 ~d:v3
;;

let compute_segment_center
      ~(v0 : vec3)
      ~(v1 : vec3)
      ~(v2 : vec3)
      ~(v3 : vec3)
      ~(v4 : vec3)
      ~(v5 : vec3)
      ~(v6 : vec3)
      ~(v7 : vec3)
  : vec3
  =
  let open Ox_math in
  let s =
    vm_vec_add2
      ~a:
        (vm_vec_add2
           ~a:
             (vm_vec_add2
                ~a:
                  (vm_vec_add2
                     ~a:
                       (vm_vec_add2
                          ~a:(vm_vec_add2 ~a:(vm_vec_add2 ~a:v0 ~b:v1) ~b:v2)
                          ~b:v3)
                     ~b:v4)
                ~b:v5)
           ~b:v6)
      ~b:v7
  in
  let sx, sy, sz = s in
  sx / 8, sy / 8, sz / 8
;;

let get_verts_for_normal ~va ~vb ~vc ~vd =
  let v = [| va; vb; vc; vd |] in
  let w = [| 0; 1; 2; 3 |] in
  for i = 1 to 3 do
    for j = 0 to i - 1 do
      if v.(j) > v.(i)
      then (
        let t = v.(j) in
        v.(j) <- v.(i);
        v.(i) <- t;
        let t = w.(j) in
        w.(j) <- w.(i);
        w.(i) <- t)
    done
  done;
  let negate_flag =
    if (w.(0) + 3) mod 4 = w.(1) || (w.(1) + 3) mod 4 = w.(2) then 1 else 0
  in
  v.(0), v.(1), v.(2), v.(3), negate_flag
;;

let create_abs_vertex_lists ~side_type ~(seg_verts : int array) ~sidenum =
  let sv = side_to_verts.(sidenum) in
  match side_type with
  | 1 ->
    (* SIDE_IS_QUAD *)
    let vertices =
      [| seg_verts.(sv.(0))
       ; seg_verts.(sv.(1))
       ; seg_verts.(sv.(2))
       ; seg_verts.(sv.(3))
       ; 0
       ; 0
      |]
    in
    1, vertices
  | 2 ->
    (* SIDE_IS_TRI_02 *)
    let vertices =
      [| seg_verts.(sv.(0))
       ; seg_verts.(sv.(1))
       ; seg_verts.(sv.(2))
       ; seg_verts.(sv.(2))
       ; seg_verts.(sv.(3))
       ; seg_verts.(sv.(0))
      |]
    in
    2, vertices
  | 3 ->
    (* SIDE_IS_TRI_13 *)
    let vertices =
      [| seg_verts.(sv.(3))
       ; seg_verts.(sv.(0))
       ; seg_verts.(sv.(1))
       ; seg_verts.(sv.(1))
       ; seg_verts.(sv.(2))
       ; seg_verts.(sv.(3))
      |]
    in
    2, vertices
  | _ -> failwith "Illegal side type"
;;

(* Lookup a vertex position by absolute vertex index.
   seg_verts maps relative index 0..7 to absolute vertex indices.
   seg_vert_positions.(i) is the position of seg_verts.(i). *)
let lookup_vpos ~(seg_verts : int array) ~(seg_vert_positions : vec3 array) ~abs_idx =
  let rec find i =
    if i >= 8
    then 0, 0, 0 (* should not happen *)
    else if seg_verts.(i) = abs_idx
    then seg_vert_positions.(i)
    else find (i + 1)
  in
  find 0
;;

let get_seg_masks
      ~checkp:(cpx, cpy, cpz)
      ~rad
      ~(seg_verts : int array)
      ~(side_types : int array)
      ~(normals : vec3 array)
      ~(seg_vert_positions : vec3 array)
  =
  let vpos abs_idx = lookup_vpos ~seg_verts ~seg_vert_positions ~abs_idx in
  let facemask = ref 0 in
  let sidemask = ref 0 in
  let centermask = ref 0 in
  let facebit = ref 1 in
  let sidebit = ref 1 in
  for sn = 0 to 5 do
    let side_type = side_types.(sn) in
    let n0 = normals.(sn * 2) in
    let n1 = normals.((sn * 2) + 1) in
    let num_faces, vertex_list =
      create_abs_vertex_lists ~side_type ~seg_verts ~sidenum:sn
    in
    if num_faces = 2
    then (
      let vertnum = min vertex_list.(0) vertex_list.(2) in
      let planep = vpos vertnum in
      let dist =
        if vertex_list.(4) < vertex_list.(1)
        then Ox_math.vm_dist_to_plane ~checkp:(vpos vertex_list.(4)) ~norm:n0 ~planep
        else Ox_math.vm_dist_to_plane ~checkp:(vpos vertex_list.(1)) ~norm:n1 ~planep
      in
      let side_pokes_out = dist > plane_dist_tolerance in
      let side_count = ref 0 in
      let center_count = ref 0 in
      for fn = 0 to 1 do
        let norm = if fn = 0 then n0 else n1 in
        let d = Ox_math.vm_dist_to_plane ~checkp:(cpx, cpy, cpz) ~norm ~planep in
        if d < -plane_dist_tolerance then incr center_count;
        if d - rad < -plane_dist_tolerance
        then (
          facemask := !facemask lor !facebit;
          incr side_count);
        facebit := !facebit lsl 1
      done;
      if not side_pokes_out
      then (
        if !side_count = 2 then sidemask := !sidemask lor !sidebit;
        if !center_count = 2 then centermask := !centermask lor !sidebit)
      else (
        if !side_count > 0 then sidemask := !sidemask lor !sidebit;
        if !center_count > 0 then centermask := !centermask lor !sidebit))
    else (
      let vertnum = ref vertex_list.(0) in
      for i = 1 to 3 do
        if vertex_list.(i) < !vertnum then vertnum := vertex_list.(i)
      done;
      let d =
        Ox_math.vm_dist_to_plane ~checkp:(cpx, cpy, cpz) ~norm:n0 ~planep:(vpos !vertnum)
      in
      if d < -plane_dist_tolerance then centermask := !centermask lor !sidebit;
      if d - rad < -plane_dist_tolerance
      then (
        facemask := !facemask lor !facebit;
        sidemask := !sidemask lor !sidebit);
      facebit := !facebit lsl 2);
    sidebit := !sidebit lsl 1
  done;
  !facemask, !sidemask, !centermask
;;

let get_side_dists
      ~checkp:(cpx, cpy, cpz)
      ~(seg_verts : int array)
      ~(side_types : int array)
      ~(normals : vec3 array)
      ~(seg_vert_positions : vec3 array)
  =
  let vpos abs_idx = lookup_vpos ~seg_verts ~seg_vert_positions ~abs_idx in
  let mask = ref 0 in
  let side_dists = Array.create ~len:6 0 in
  let facebit = ref 1 in
  let sidebit = ref 1 in
  for sn = 0 to 5 do
    let side_type = side_types.(sn) in
    let n0 = normals.(sn * 2) in
    let n1 = normals.((sn * 2) + 1) in
    let num_faces, vertex_list =
      create_abs_vertex_lists ~side_type ~seg_verts ~sidenum:sn
    in
    side_dists.(sn) <- 0;
    if num_faces = 2
    then (
      let vertnum = min vertex_list.(0) vertex_list.(2) in
      let planep = vpos vertnum in
      let dist =
        if vertex_list.(4) < vertex_list.(1)
        then Ox_math.vm_dist_to_plane ~checkp:(vpos vertex_list.(4)) ~norm:n0 ~planep
        else Ox_math.vm_dist_to_plane ~checkp:(vpos vertex_list.(1)) ~norm:n1 ~planep
      in
      let side_pokes_out = dist > plane_dist_tolerance in
      let center_count = ref 0 in
      for fn = 0 to 1 do
        let norm = if fn = 0 then n0 else n1 in
        let d = Ox_math.vm_dist_to_plane ~checkp:(cpx, cpy, cpz) ~norm ~planep in
        if d < -plane_dist_tolerance
        then (
          incr center_count;
          side_dists.(sn) <- side_dists.(sn) + d);
        facebit := !facebit lsl 1
      done;
      if not side_pokes_out
      then (
        if !center_count = 2
        then (
          mask := !mask lor !sidebit;
          side_dists.(sn) <- side_dists.(sn) / 2))
      else if !center_count > 0
      then (
        mask := !mask lor !sidebit;
        if !center_count = 2 then side_dists.(sn) <- side_dists.(sn) / 2))
    else (
      let vertnum = ref vertex_list.(0) in
      for i = 1 to 3 do
        if vertex_list.(i) < !vertnum then vertnum := vertex_list.(i)
      done;
      let d =
        Ox_math.vm_dist_to_plane ~checkp:(cpx, cpy, cpz) ~norm:n0 ~planep:(vpos !vertnum)
      in
      if d < -plane_dist_tolerance
      then (
        mask := !mask lor !sidebit;
        side_dists.(sn) <- d);
      facebit := !facebit lsl 2);
    sidebit := !sidebit lsl 1
  done;
  !mask, side_dists
;;

let extract_vector_from_segment ~(verts : vec3 array) ~start_side ~end_side =
  let sv_start = side_to_verts.(start_side) in
  let sv_end = side_to_verts.(end_side) in
  let vs = ref (0, 0, 0) in
  let ve = ref (0, 0, 0) in
  for i = 0 to 3 do
    vs := Ox_math.vm_vec_add2 ~a:!vs ~b:verts.(sv_start.(i));
    ve := Ox_math.vm_vec_add2 ~a:!ve ~b:verts.(sv_end.(i))
  done;
  let diff = Ox_math.vm_vec_sub ~a:!ve ~b:!vs in
  Ox_math.vm_vec_scale ~v:diff ~k:(0x10000 / 4)
;;

let extract_orient_from_segment (verts : vec3 array) =
  let fvec = extract_vector_from_segment ~verts ~start_side:wfront ~end_side:wback in
  let uvec = extract_vector_from_segment ~verts ~start_side:wbottom ~end_side:wtop in
  Ox_math.vm_vector_2_matrix ~fvec ~uvec:(Some uvec) ~rvec:None
;;

let max_sides_per_segment = 6

(* find_connect_side: given a segment's children array and a base segment number,
   return the side index that connects to the base segment, or -1 if none. *)
let find_connect_side ~(children : int array) ~base_seg_num =
  let rec loop s =
    if s >= max_sides_per_segment
    then -1
    else if children.(s) = base_seg_num
    then s
    else loop (s + 1)
  in
  loop 0
;;

let matrix_precision = 9
let matrix_max = 0x7f
let relpos_precision = 10
let vel_precision = 12

let convert_to_byte f =
  if f >= 0x00010000
  then matrix_max
  else if f <= -0x00010000
  then -matrix_max
  else f asr matrix_precision
;;

(* create_shortpos: compress an object's orient/pos/vel into a shortpos.
   orient: 9 ints (rx,ux,fx,ry,uy,fy,rz,uz,fz)
   pos: (x,y,z), vel: (x,y,z), seg_vert0: (x,y,z) position of segment vertex 0
   segnum: object's segment number
   Returns: (bytemat[9], xo, yo, zo, segment, velx, vely, velz) *)
let create_shortpos
      ~(orient : int array)
      ~(pos : vec3)
      ~(vel : vec3)
      ~(seg_vert0 : vec3)
      ~segnum
  =
  let bytemat = Array.init 9 ~f:(fun i -> convert_to_byte orient.(i)) in
  let px, py, pz = pos in
  let v0x, v0y, v0z = seg_vert0 in
  let xo = (px - v0x) asr relpos_precision in
  let yo = (py - v0y) asr relpos_precision in
  let zo = (pz - v0z) asr relpos_precision in
  let vx, vy, vz = vel in
  let velx = vx asr vel_precision in
  let vely = vy asr vel_precision in
  let velz = vz asr vel_precision in
  bytemat, xo, yo, zo, segnum, velx, vely, velz
;;

(* extract_shortpos: decompress a shortpos back to orient/pos/vel.
   bytemat: 9 ints, xo/yo/zo: relative position shorts,
   seg_vert0: (x,y,z), velx/vely/velz: velocity shorts
   Returns: (orient[9], pos(x,y,z), vel(x,y,z)) *)
let extract_shortpos
      ~(bytemat : int array)
      ~xo
      ~yo
      ~zo
      ~(seg_vert0 : vec3)
      ~velx
      ~vely
      ~velz
  =
  let orient = Array.init 9 ~f:(fun i -> bytemat.(i) lsl matrix_precision) in
  let v0x, v0y, v0z = seg_vert0 in
  let pos =
    ( (xo lsl relpos_precision) + v0x
    , (yo lsl relpos_precision) + v0y
    , (zo lsl relpos_precision) + v0z )
  in
  let vel = velx lsl vel_precision, vely lsl vel_precision, velz lsl vel_precision in
  orient, pos, vel
;;

(* --- create_walls_on_side --------------------------------------------- *)
(* Determine side type (quad or triangulated) and compute face normals.
   Combines C functions: create_walls_on_side, add_side_as_quad, add_side_as_2_triangles.
   v0..v3: 4 vertex positions (as vec3), vi0..vi3: their absolute vertex indices,
   has_child: whether there's a child segment on this side.
   Returns (side_type, normal0, normal1). *)

let side_is_quad = 1
let side_is_tri_02 = 2
let side_is_tri_13 = 3
let plane_dist_tolerance = 250
let vec_negate (x, y, z) = -x, -y, -z

(* Helper: look up vertex position by absolute index from our 4 known vertices *)
let make_pos_lookup ~v0 ~vi0 ~v1 ~vi1 ~v2 ~vi2 ~v3 ~vi3 =
  fun vi ->
  if vi = vi0
  then v0
  else if vi = vi1
  then v1
  else if vi = vi2
  then v2
  else if vi = vi3
  then v3
  else failwith "create_walls_on_side: unknown vertex index"
;;

(* add_side_as_2_triangles logic: determine triangulation and compute normals *)
let triangulate_side ~v0 ~v1 ~v2 ~v3 ~vi0 ~vi1 ~vi2 ~vi3 ~has_child =
  let pos_of = make_pos_lookup ~v0 ~vi0 ~v1 ~vi1 ~v2 ~vi2 ~v3 ~vi3 in
  if not has_child
  then (
    (* Non-wall case: use dot product to choose triangulation *)
    let norm = Ox_math.vm_vec_normal ~p0:v0 ~p1:v1 ~p2:v2 in
    let vec_13 = Ox_math.vm_vec_sub ~a:v3 ~b:v1 in
    let dot = Ox_math.vm_vec_dotprod ~a:norm ~b:vec_13 in
    if dot >= 0
    then (
      let n0 = Ox_math.vm_vec_normal ~p0:v0 ~p1:v1 ~p2:v2 in
      let n1 = Ox_math.vm_vec_normal ~p0:v0 ~p1:v2 ~p2:v3 in
      side_is_tri_02, n0, n1)
    else (
      let n0 = Ox_math.vm_vec_normal ~p0:v0 ~p1:v1 ~p2:v3 in
      let n1 = Ox_math.vm_vec_normal ~p0:v1 ~p1:v2 ~p2:v3 in
      side_is_tri_13, n0, n1))
  else (
    (* Wall case: use get_verts_for_normal for consistent normals *)
    let vs0, _vs1, _vs2, _vs3, _nf =
      get_verts_for_normal ~va:vi0 ~vb:vi1 ~vc:vi2 ~vd:vi3
    in
    if vs0 = vi0 || vs0 = vi2
    then (
      (* TRI_02 *)
      let s0, s1, s2, _, nf0 = get_verts_for_normal ~va:vi0 ~vb:vi1 ~vc:vi2 ~vd:32767 in
      let n0 = Ox_math.vm_vec_normal ~p0:(pos_of s0) ~p1:(pos_of s1) ~p2:(pos_of s2) in
      let n0 = if nf0 <> 0 then vec_negate n0 else n0 in
      let s0, s1, s2, _, nf1 = get_verts_for_normal ~va:vi0 ~vb:vi2 ~vc:vi3 ~vd:32767 in
      let n1 = Ox_math.vm_vec_normal ~p0:(pos_of s0) ~p1:(pos_of s1) ~p2:(pos_of s2) in
      let n1 = if nf1 <> 0 then vec_negate n1 else n1 in
      side_is_tri_02, n0, n1)
    else (
      (* TRI_13 *)
      let s0, s1, s2, _, nf0 = get_verts_for_normal ~va:vi0 ~vb:vi1 ~vc:vi3 ~vd:32767 in
      let n0 = Ox_math.vm_vec_normal ~p0:(pos_of s0) ~p1:(pos_of s1) ~p2:(pos_of s2) in
      let n0 = if nf0 <> 0 then vec_negate n0 else n0 in
      let s0, s1, s2, _, nf1 = get_verts_for_normal ~va:vi1 ~vb:vi2 ~vc:vi3 ~vd:32767 in
      let n1 = Ox_math.vm_vec_normal ~p0:(pos_of s0) ~p1:(pos_of s1) ~p2:(pos_of s2) in
      let n1 = if nf1 <> 0 then vec_negate n1 else n1 in
      side_is_tri_13, n0, n1))
;;

let create_walls_on_side ~v0 ~v1 ~v2 ~v3 ~vi0 ~vi1 ~vi2 ~vi3 ~has_child =
  let pos_of = make_pos_lookup ~v0 ~vi0 ~v1 ~vi1 ~v2 ~vi2 ~v3 ~vi3 in
  (* Step 1: Sort vertices, compute plane normal and planarity *)
  let vm0, vm1, vm2, vm3, negate_flag =
    get_verts_for_normal ~va:vi0 ~vb:vi1 ~vc:vi2 ~vd:vi3
  in
  let vn = Ox_math.vm_vec_normal ~p0:(pos_of vm0) ~p1:(pos_of vm1) ~p2:(pos_of vm2) in
  let dist =
    abs (Ox_math.vm_dist_to_plane ~checkp:(pos_of vm3) ~norm:vn ~planep:(pos_of vm0))
  in
  let vn = if negate_flag <> 0 then vec_negate vn else vn in
  (* Step 2: If planar, return as quad *)
  if dist <= plane_dist_tolerance
  then side_is_quad, vn, vn
  else (
    (* Step 3: Triangulate *)
    let side_type, n0, n1 =
      triangulate_side ~v0 ~v1 ~v2 ~v3 ~vi0 ~vi1 ~vi2 ~vi3 ~has_child
    in
    (* Step 4: De-triangulation check *)
    (* Build vertex list for the computed triangulation *)
    let vl =
      if side_type = side_is_tri_02
      then [| vi0; vi1; vi2; vi2; vi3; vi0 |]
      else [| vi3; vi0; vi1; vi1; vi2; vi3 |]
    in
    let vertnum = min vl.(0) vl.(2) in
    let dist0 =
      Ox_math.vm_dist_to_plane ~checkp:(pos_of vl.(1)) ~norm:n1 ~planep:(pos_of vertnum)
    in
    let dist1 =
      Ox_math.vm_dist_to_plane ~checkp:(pos_of vl.(4)) ~norm:n0 ~planep:(pos_of vertnum)
    in
    let sign v =
      if v > plane_dist_tolerance
      then 1
      else if v < -(plane_dist_tolerance + 1)
      then -1
      else 0
    in
    let s0 = sign dist0 in
    let s1 = sign dist1 in
    if s0 = 0 || s1 = 0 || s0 <> s1
    then (* De-triangulate back to quad *)
      side_is_quad, vn, vn
    else side_type, n0, n1)
;;

(* --- check_norms ------------------------------------------------------ *)
(* Check if two face normals are consistent (should be negations of each other).
   Returns 1 if mismatch, 0 if OK. *)
let check_norms ~(n0 : vec3) ~(n1 : vec3) =
  let n0x, n0y, n0z = n0 in
  let n1x, n1y, n1z = n1 in
  if n0x <> -n1x || n0y <> -n1y || n0z <> -n1z then 1 else 0
;;

(* --- create_all_vertex_lists ------------------------------------------ *)
(* Like create_abs_vertex_lists but returns relative vertex indices (0..7 within segment)
   instead of absolute vertex indices. Takes side_type and sidenum. *)
let create_all_vertex_lists ~side_type ~sidenum =
  let sv = side_to_verts.(sidenum) in
  match side_type with
  | 1 ->
    (* SIDE_IS_QUAD *)
    1, [| sv.(0); sv.(1); sv.(2); sv.(3); 0; 0 |]
  | 2 ->
    (* SIDE_IS_TRI_02 *)
    2, [| sv.(0); sv.(1); sv.(2); sv.(2); sv.(3); sv.(0) |]
  | 3 ->
    (* SIDE_IS_TRI_13 *)
    2, [| sv.(3); sv.(0); sv.(1); sv.(1); sv.(2); sv.(3) |]
  | _ -> failwith (Printf.sprintf "Illegal side type %d" side_type)
;;

(* --- create_all_vertnum_lists ----------------------------------------- *)
(* Returns vertex number indices (0..3 within side) for each face of a side.
   Only depends on side_type. *)
let create_all_vertnum_lists ~side_type =
  match side_type with
  | 1 ->
    (* SIDE_IS_QUAD *)
    1, [| 0; 1; 2; 3; 0; 0 |]
  | 2 ->
    (* SIDE_IS_TRI_02 *)
    2, [| 0; 1; 2; 2; 3; 0 |]
  | 3 ->
    (* SIDE_IS_TRI_13 *)
    2, [| 3; 0; 1; 1; 2; 3 |]
  | _ -> failwith (Printf.sprintf "Illegal side type %d" side_type)
;;
