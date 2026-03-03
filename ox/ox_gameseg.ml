(* Effect: fetch 87-int segment data array for a given segment number.
   Used by FVI and find_point_seg to access segment data on demand
   instead of pre-packing all segments upfront. *)
type _ Effect.t += Fetch_segment_data : int -> int array Effect.t

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
  (* C uses vm_vec_add2 loop + vm_vec_scale(F1_0/4), NOT vm_vec_avg4.
     fixmul rounds toward -inf for negatives, / 4 rounds toward zero. *)
  let open Ox_math in
  let s = vm_vec_add2 ~a:(vm_vec_add2 ~a:(vm_vec_add2 ~a:v0 ~b:v1) ~b:v2) ~b:v3 in
  let sx, sy, sz = s in
  let scale = 0x10000 / 4 in
  fixmul ~a:sx ~b:scale, fixmul ~a:sy ~b:scale, fixmul ~a:sz ~b:scale
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
  let scale = 0x10000 / 8 in
  Ox_math.fixmul ~a:sx ~b:scale, Ox_math.fixmul ~a:sy ~b:scale, Ox_math.fixmul ~a:sz ~b:scale
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

(* --- find_connected_distance ----------------------------------------- *)
(* BFS to find distance between two points via segment connectivity.
   Packed array layout:
   Header (12 ints):
     [0..2]  p0.x, p0.y, p0.z
     [3]     seg0
     [4..6]  p1.x, p1.y, p1.z
     [7]     seg1
     [8]     max_depth (-1 = unlimited)
     [9]     wid_flag
     [10]    n_segments
     [11]    check_wid_on_adjacency (0=D1 skip, 1=D2 check)

   Per-segment (15 ints each):
     [0..5]   children[0..5]
     [6..11]  wid[0..5] — pre-evaluated WALL_IS_DOORWAY results
     [12..14] center.x, center.y, center.z — pre-computed segment center

   Returns: [| distance (fix) or -1; connected_segment_distance |] *)

let max_loc_point_segs = 64

let find_connected_distance (arr : int array) =
  let p0 = arr.(0), arr.(1), arr.(2) in
  let seg0 = arr.(3) in
  let p1 = arr.(4), arr.(5), arr.(6) in
  let seg1 = arr.(7) in
  let max_depth_raw = arr.(8) in
  let wid_flag = arr.(9) in
  let n_segments = arr.(10) in
  let check_wid_adj = arr.(11) in
  let header = 12 in
  let per_seg = 15 in
  let max_depth =
    if max_depth_raw > max_loc_point_segs - 2
    then max_loc_point_segs - 2
    else max_depth_raw
  in
  let seg_children s i = arr.(header + (s * per_seg) + i) in
  let seg_wid s i = arr.(header + (s * per_seg) + 6 + i) in
  let seg_center s =
    let base = header + (s * per_seg) + 12 in
    arr.(base), arr.(base + 1), arr.(base + 2)
  in
  (* Quick return: same segment *)
  if seg0 = seg1
  then [| Ox_math.vm_vec_dist_quick ~a:p0 ~b:p1; 0 |]
  else (
    (* Adjacency check *)
    let conn_side = ref (-1) in
    for side = 0 to 5 do
      if
        !conn_side = -1 && seg0 >= 0 && seg0 < n_segments && seg_children seg0 side = seg1
      then conn_side := side
    done;
    if
      !conn_side <> -1
      && (check_wid_adj = 0
          || (seg1 >= 0 && seg1 < n_segments && seg_wid seg1 !conn_side land wid_flag <> 0)
         )
    then [| Ox_math.vm_vec_dist_quick ~a:p0 ~b:p1; 1 |]
    else (
      (* BFS *)
      let visited = Array.create ~len:n_segments false in
      let q_start = Array.create ~len:n_segments 0 in
      let q_end = Array.create ~len:n_segments 0 in
      let q_depth = Array.create ~len:n_segments 0 in
      let qtail = ref 0 in
      let qhead = ref 0 in
      let cur_seg = ref seg0 in
      let cur_depth = ref 0 in
      let found = ref false in
      let failed = ref false in
      if seg0 >= 0 && seg0 < n_segments then visited.(seg0) <- true;
      while !cur_seg <> seg1 && not !failed do
        let cs = !cur_seg in
        if cs < 0 || cs >= n_segments
        then failed := true
        else (
          for sidenum = 0 to 5 do
            if (not !failed) && seg_wid cs sidenum land wid_flag <> 0
            then (
              let child = seg_children cs sidenum in
              if child >= 0 && child < n_segments && not visited.(child)
              then (
                let qt = !qtail in
                q_start.(qt) <- cs;
                q_end.(qt) <- child;
                visited.(child) <- true;
                q_depth.(qt) <- !cur_depth + 1;
                qtail := qt + 1;
                if max_depth <> -1 && !cur_depth + 1 = max_depth
                then failed := true
                else if max_depth = -1 && child = seg1
                then (
                  found := true;
                  cur_seg := seg1)))
          done;
          if (not !found) && not !failed
          then
            if !qhead >= !qtail
            then failed := true
            else (
              cur_seg := q_end.(!qhead);
              cur_depth := q_depth.(!qhead);
              qhead := !qhead + 1))
      done;
      if !failed
      then [| -1; 1000 |]
      else (
        (* Path reconstruction: trace back from seg1 to seg0 *)
        let path_centers = Array.create ~len:max_loc_point_segs (0, 0, 0) in
        let num_points = ref 0 in
        (* Find last queue entry ending at seg1 *)
        let qt = ref (!qtail - 1) in
        while !qt >= 0 && q_end.(!qt) <> seg1 do
          qt := !qt - 1
        done;
        if !qt < 0
        then [| -1; 1000 |]
        else (
          (* Walk backwards through BFS tree *)
          let done_ = ref false in
          while !qt >= 0 && not !done_ do
            let this_seg = q_end.(!qt) in
            let parent_seg = q_start.(!qt) in
            if !num_points < max_loc_point_segs
            then (
              path_centers.(!num_points) <- seg_center this_seg;
              num_points := !num_points + 1);
            if parent_seg = seg0
            then done_ := true
            else (
              qt := !qt - 1;
              while !qt >= 0 && q_end.(!qt) <> parent_seg do
                qt := !qt - 1
              done;
              if !qt < 0 then done_ := true)
          done;
          if !qt < 0 && not !done_
          then [| -1; 1000 |]
          else (
            (* Add seg0 center *)
            if !num_points < max_loc_point_segs && seg0 >= 0 && seg0 < n_segments
            then (
              path_centers.(!num_points) <- seg_center seg0;
              num_points := !num_points + 1);
            let np = !num_points in
            if np = 1
            then [| Ox_math.vm_vec_dist_quick ~a:p0 ~b:p1; np |]
            else (
              (* Sum distances along path:
                 p1 -> path_centers[1] -> ... -> path_centers[np-2] -> p0 *)
              let dist = ref 0 in
              dist
              := Ox_math.vm_vec_dist_quick ~a:p1 ~b:path_centers.(1)
                 + Ox_math.vm_vec_dist_quick ~a:p0 ~b:path_centers.(np - 2);
              for i = 1 to np - 3 do
                dist
                := !dist
                   + Ox_math.vm_vec_dist_quick ~a:path_centers.(i) ~b:path_centers.(i + 1)
              done;
              [| !dist; np |]))))))
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

(* --- trace_segs + find_point_seg ------------------------------------- *)
(* Packed array layout (same 80-int-per-segment as sphere_intersects_wall):
   Header (6 ints):
     [0..2] p.x, p.y, p.z
     [3]    segnum (hint, -1 if unknown)
     [4]    n_segments
     [5]    doing_lighting_hack (D1: always 0; D2: runtime flag)

   Per-segment (80 ints each):
     [0..5]   children[0..5]
     [6..11]  side_types[0..5]
     [12..19] seg_verts[0..7]
     [20..55] normals: side 0..5, normals[0].xyz then normals[1].xyz
     [56..79] vertex_positions: vert 0..7, xyz

   Returns segment number or -1. *)

let find_point_seg (arr : int array) =
  let px = arr.(0) in
  let py = arr.(1) in
  let pz = arr.(2) in
  let segnum = arr.(3) in
  let n_segments = arr.(4) in
  let doing_lighting_hack = arr.(5) in
  let header = 6 in
  let per_seg = 80 in
  let get_seg_base s = header + (s * per_seg) in
  let unpack_seg s =
    let base = get_seg_base s in
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
  (* trace_segs: recursively find segment containing point by following
     the child side with the most-negative distance. *)
  let rec trace s iterations =
    if s < 0 || s >= n_segments
    then -1
    else if iterations > 1024
    then s
    else (
      let children, side_types, seg_verts, normals, seg_vert_positions = unpack_seg s in
      let centermask, side_dists =
        get_side_dists
          ~checkp:(px, py, pz)
          ~seg_verts
          ~side_types
          ~normals
          ~seg_vert_positions
      in
      if centermask = 0
      then s
      else (
        (* Make a mutable copy of side_dists so we can zero out tried sides *)
        let sd = Array.copy side_dists in
        let result = ref (-1) in
        let continue_ = ref true in
        while !continue_ do
          let biggest_side = ref (-1) in
          let biggest_val = ref 0 in
          let bit = ref 1 in
          for sn = 0 to 5 do
            if centermask land !bit <> 0 && children.(sn) > -1 && sd.(sn) < !biggest_val
            then (
              biggest_val := sd.(sn);
              biggest_side := sn);
            bit := !bit lsl 1
          done;
          if !biggest_side <> -1
          then (
            sd.(!biggest_side) <- 0;
            let check = trace children.(!biggest_side) (iterations + 1) in
            if check <> -1
            then (
              result := check;
              continue_ := false))
          else continue_ := false
        done;
        !result))
  in
  (* find_point_seg: try trace_segs from hint, fall back to exhaustive scan *)
  if segnum >= 0 && segnum < n_segments
  then (
    let newseg = trace segnum 0 in
    if newseg <> -1
    then newseg
    else if doing_lighting_hack = 0
    then (
      (* Exhaustive scan: find first segment where centermask=0 *)
      let found = ref (-1) in
      let s = ref 0 in
      while !s < n_segments && !found = -1 do
        let _children, side_types, seg_verts, normals, seg_vert_positions =
          unpack_seg !s
        in
        let _facemask, _sidemask, centermask =
          get_seg_masks
            ~checkp:(px, py, pz)
            ~rad:0
            ~seg_verts
            ~side_types
            ~normals
            ~seg_vert_positions
        in
        if centermask = 0 then found := !s;
        incr s
      done;
      !found)
    else -1)
  else if doing_lighting_hack = 0
  then (
    (* segnum=-1: no hint, go straight to exhaustive *)
    let found = ref (-1) in
    let s = ref 0 in
    while !s < n_segments && !found = -1 do
      let _children, side_types, seg_verts, normals, seg_vert_positions = unpack_seg !s in
      let _facemask, _sidemask, centermask =
        get_seg_masks
          ~checkp:(px, py, pz)
          ~rad:0
          ~seg_verts
          ~side_types
          ~normals
          ~seg_vert_positions
      in
      if centermask = 0 then found := !s;
      incr s
    done;
    !found)
  else -1
;;

(* find_point_seg_v2: same algorithm as find_point_seg but fetches segment
   data on demand via Fetch_segment_data effects instead of a pre-packed array.
   The 87-int segment data uses the same layout as FVI packed segments:
     [0..5] children, [6..11] side_types, [12..19] seg_verts,
     [20..55] normals (side*2, xyz each), [56..79] vert positions (8 verts, xyz each),
     [80..85] wid, [86] first_object.
   We only need the first 80 ints (same as the old find_point_seg format). *)
let unpack_seg_from_fetch (seg_data : int array) =
  let children = Array.init 6 ~f:(fun i -> seg_data.(i)) in
  let side_types = Array.init 6 ~f:(fun i -> seg_data.(6 + i)) in
  let seg_verts = Array.init 8 ~f:(fun i -> seg_data.(12 + i)) in
  let normals =
    Array.init 12 ~f:(fun i ->
      let off = 20 + (i * 3) in
      seg_data.(off), seg_data.(off + 1), seg_data.(off + 2))
  in
  let seg_vert_positions =
    Array.init 8 ~f:(fun i ->
      let off = 56 + (i * 3) in
      seg_data.(off), seg_data.(off + 1), seg_data.(off + 2))
  in
  children, side_types, seg_verts, normals, seg_vert_positions
;;

let find_point_seg_v2 ~point:(px, py, pz) ~segnum ~n_segments ~doing_lighting_hack =
  let fetch s = Effect.perform (Fetch_segment_data s) |> unpack_seg_from_fetch in
  let rec trace s iterations =
    if s < 0 || s >= n_segments
    then -1
    else if iterations > 1024
    then s
    else (
      let children, side_types, seg_verts, normals, seg_vert_positions = fetch s in
      let centermask, side_dists =
        get_side_dists
          ~checkp:(px, py, pz)
          ~seg_verts
          ~side_types
          ~normals
          ~seg_vert_positions
      in
      if centermask = 0
      then s
      else (
        let sd = Array.copy side_dists in
        let result = ref (-1) in
        let continue_ = ref true in
        while !continue_ do
          let biggest_side = ref (-1) in
          let biggest_val = ref 0 in
          let bit = ref 1 in
          for sn = 0 to 5 do
            if centermask land !bit <> 0 && children.(sn) > -1 && sd.(sn) < !biggest_val
            then (
              biggest_val := sd.(sn);
              biggest_side := sn);
            bit := !bit lsl 1
          done;
          if !biggest_side <> -1
          then (
            sd.(!biggest_side) <- 0;
            let check = trace children.(!biggest_side) (iterations + 1) in
            if check <> -1
            then (
              result := check;
              continue_ := false))
          else continue_ := false
        done;
        !result))
  in
  let exhaustive_scan () =
    let found = ref (-1) in
    let s = ref 0 in
    while !s < n_segments && !found = -1 do
      let _children, side_types, seg_verts, normals, seg_vert_positions = fetch !s in
      let _facemask, _sidemask, centermask =
        get_seg_masks
          ~checkp:(px, py, pz)
          ~rad:0
          ~seg_verts
          ~side_types
          ~normals
          ~seg_vert_positions
      in
      if centermask = 0 then found := !s;
      incr s
    done;
    !found
  in
  if segnum >= 0 && segnum < n_segments
  then (
    let newseg = trace segnum 0 in
    if newseg <> -1
    then newseg
    else if doing_lighting_hack = 0
    then exhaustive_scan ()
    else -1)
  else if doing_lighting_hack = 0
  then exhaustive_scan ()
  else -1
;;
