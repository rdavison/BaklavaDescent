let side_to_verts =
  [|
    [| 7; 6; 2; 3 |]
  ; [| 0; 4; 7; 3 |]
  ; [| 0; 1; 5; 4 |]
  ; [| 2; 6; 5; 1 |]
  ; [| 4; 5; 6; 7 |]
  ; [| 3; 2; 1; 0 |]
  |]

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

let compute_center_point_on_side
  (v0 : vec3)
  (v1 : vec3)
  (v2 : vec3)
  (v3 : vec3)
  : vec3
  =
  Ox_math.vm_vec_avg4 ~a:v0 ~b:v1 ~c:v2 ~d:v3

let compute_segment_center
  (v0 : vec3)
  (v1 : vec3)
  (v2 : vec3)
  (v3 : vec3)
  (v4 : vec3)
  (v5 : vec3)
  (v6 : vec3)
  (v7 : vec3)
  : vec3
  =
  let open Ox_math in
  let s = vm_vec_add2 ~a:(vm_vec_add2 ~a:(vm_vec_add2 ~a:(vm_vec_add2 ~a:(vm_vec_add2 ~a:(vm_vec_add2 ~a:(vm_vec_add2 ~a:v0 ~b:v1) ~b:v2) ~b:v3) ~b:v4) ~b:v5) ~b:v6) ~b:v7 in
  let sx, sy, sz = s in
  sx / 8, sy / 8, sz / 8

let get_verts_for_normal va vb vc vd =
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

let create_abs_vertex_lists side_type (verts : int array) sidenum =
  let sv = side_to_verts.(sidenum) in
  match side_type with
  | 1 ->
    (* SIDE_IS_QUAD *)
    let vertices = [| verts.(sv.(0)); verts.(sv.(1)); verts.(sv.(2)); verts.(sv.(3)); 0; 0 |] in
    1, vertices
  | 2 ->
    (* SIDE_IS_TRI_02 *)
    let vertices =
      [| verts.(sv.(0))
       ; verts.(sv.(1))
       ; verts.(sv.(2))
       ; verts.(sv.(2))
       ; verts.(sv.(3))
       ; verts.(sv.(0))
      |]
    in
    2, vertices
  | 3 ->
    (* SIDE_IS_TRI_13 *)
    let vertices =
      [| verts.(sv.(3))
       ; verts.(sv.(0))
       ; verts.(sv.(1))
       ; verts.(sv.(1))
       ; verts.(sv.(2))
       ; verts.(sv.(3))
      |]
    in
    2, vertices
  | _ -> failwith "Illegal side type"

(* Lookup a vertex position by absolute vertex index.
   seg_verts maps relative index 0..7 to absolute vertex indices.
   seg_vert_positions.(i) is the position of seg_verts.(i). *)
let lookup_vpos (seg_verts : int array) (seg_vert_positions : vec3 array) abs_idx =
  let rec find i =
    if i >= 8 then 0, 0, 0  (* should not happen *)
    else if seg_verts.(i) = abs_idx then seg_vert_positions.(i)
    else find (i + 1)
  in
  find 0

let get_seg_masks
  ~checkp:(cpx, cpy, cpz)
  ~rad
  ~(seg_verts : int array)
  ~(side_types : int array)
  ~(normals : vec3 array)
  ~(seg_vert_positions : vec3 array)
  =
  let vpos = lookup_vpos seg_verts seg_vert_positions in
  let facemask = ref 0 in
  let sidemask = ref 0 in
  let centermask = ref 0 in
  let facebit = ref 1 in
  let sidebit = ref 1 in
  for sn = 0 to 5 do
    let side_type = side_types.(sn) in
    let n0 = normals.(sn * 2) in
    let n1 = normals.((sn * 2) + 1) in
    let num_faces, vertex_list = create_abs_vertex_lists side_type seg_verts sn in
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
      let d = Ox_math.vm_dist_to_plane ~checkp:(cpx, cpy, cpz) ~norm:n0 ~planep:(vpos !vertnum) in
      if d < -plane_dist_tolerance then centermask := !centermask lor !sidebit;
      if d - rad < -plane_dist_tolerance
      then (
        facemask := !facemask lor !facebit;
        sidemask := !sidemask lor !sidebit);
      facebit := !facebit lsl 2);
    sidebit := !sidebit lsl 1
  done;
  !facemask, !sidemask, !centermask

let get_side_dists
  ~checkp:(cpx, cpy, cpz)
  ~(seg_verts : int array)
  ~(side_types : int array)
  ~(normals : vec3 array)
  ~(seg_vert_positions : vec3 array)
  =
  let vpos = lookup_vpos seg_verts seg_vert_positions in
  let mask = ref 0 in
  let side_dists = Array.create ~len: 6 0 in
  let facebit = ref 1 in
  let sidebit = ref 1 in
  for sn = 0 to 5 do
    let side_type = side_types.(sn) in
    let n0 = normals.(sn * 2) in
    let n1 = normals.((sn * 2) + 1) in
    let num_faces, vertex_list = create_abs_vertex_lists side_type seg_verts sn in
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
      let d = Ox_math.vm_dist_to_plane ~checkp:(cpx, cpy, cpz) ~norm:n0 ~planep:(vpos !vertnum) in
      if d < -plane_dist_tolerance
      then (
        mask := !mask lor !sidebit;
        side_dists.(sn) <- d);
      facebit := !facebit lsl 2);
    sidebit := !sidebit lsl 1
  done;
  !mask, side_dists

let extract_vector_from_segment (verts : vec3 array) start_side end_side =
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

let extract_orient_from_segment (verts : vec3 array) =
  let fvec = extract_vector_from_segment verts wfront wback in
  let uvec = extract_vector_from_segment verts wbottom wtop in
  Ox_math.vm_vector_2_matrix ~fvec ~uvec:(Some uvec) ~rvec:None
