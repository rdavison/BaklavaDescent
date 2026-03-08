(* Pure OCaml morph logic.
   find_min_max: compute bounding box of polymodel submodel vertices. *)

(* -- Algebraic effects for data access --------------------------------- *)

type _ Effect.t +=
  | Fetch_submodel_vertices : (int * int) -> int array Effect.t
  (* Fetch_submodel_vertices (model_num, submodel_num) ->
     flat vertex array [|x0;y0;z0; x1;y1;z1; ...|] *)

(* find_min_max: given flat vertex array [|x0;y0;z0; x1;y1;z1; ...|],
   returns [|minx; miny; minz; maxx; maxy; maxz|].
   Faithfully mirrors C find_min_max from morph.cpp. *)
let find_min_max (verts : int array) =
  let n = Array.length verts / 3 in
  assert (n >= 1);
  (* *minv = *maxv = *vp++; nverts--; *)
  let minx = ref verts.(0) in
  let miny = ref verts.(1) in
  let minz = ref verts.(2) in
  let maxx = ref verts.(0) in
  let maxy = ref verts.(1) in
  let maxz = ref verts.(2) in
  (* while (nverts--) { ... } *)
  for i = 1 to n - 1 do
    let x = verts.(i * 3) in
    let y = verts.(i * 3 + 1) in
    let z = verts.(i * 3 + 2) in
    if x > !maxx then maxx := x;
    if y > !maxy then maxy := y;
    if z > !maxz then maxz := z;
    if x < !minx then minx := x;
    if y < !miny then miny := y;
    if z < !minz then minz := z
  done;
  [| !minx; !miny; !minz; !maxx; !maxy; !maxz |]

(* find_min_max_for_model: fetch vertex data via effect, then compute min/max *)
let find_min_max_for_model ~model_num ~submodel_num =
  let verts = Effect.perform (Fetch_submodel_vertices (model_num, submodel_num)) in
  find_min_max verts

(* update_points: advance morph animation for one submodel.
   Input packed int array layout:
     [0] = frame_time
     [1] = nverts
     [2] = n_morphing_points[submodel_num]
     For each vertex v (0..nverts-1), at offset 3 + v*10:
       [+0] = morph_times[start+v]
       [+1..+3] = morph_vecs[start+v].{x,y,z}
       [+4..+6] = morph_deltas[start+v].{x,y,z}
       [+7..+9] = final_vp.{x,y,z}
   Output packed int array layout:
     [0] = n_morphing_points (updated)
     For each vertex v, at offset 1 + v*4:
       [+0] = morph_times[start+v]
       [+1..+3] = morph_vecs[start+v].{x,y,z} *)
let update_points (data : int array) : int array =
  let frame_time = data.(0) in
  let nverts = data.(1) in
  let n_morphing_points = ref data.(2) in
  let out = Array.create ~len:(1 + nverts * 4) 0 in
  for v = 0 to nverts - 1 do
    let base = 3 + v * 10 in
    let morph_time = data.(base) in
    let vx = ref data.(base + 1) in
    let vy = ref data.(base + 2) in
    let vz = ref data.(base + 3) in
    let dx = data.(base + 4) in
    let dy = data.(base + 5) in
    let dz = data.(base + 6) in
    let final_x = data.(base + 7) in
    let final_y = data.(base + 8) in
    let final_z = data.(base + 9) in
    let out_time = ref morph_time in
    if morph_time <> 0 then begin
      (* morph_times[i] -= FrameTime *)
      out_time := morph_time - frame_time;
      if !out_time <= 0 then begin
        (* snap to final position *)
        vx := final_x;
        vy := final_y;
        vz := final_z;
        out_time := 0;
        n_morphing_points := !n_morphing_points - 1
      end else begin
        (* vm_vec_scale_add2: morph_vecs[i] += morph_deltas[i] * FrameTime *)
        vx := !vx + Ox_math.fixmul ~a:dx ~b:frame_time;
        vy := !vy + Ox_math.fixmul ~a:dy ~b:frame_time;
        vz := !vz + Ox_math.fixmul ~a:dz ~b:frame_time
      end
    end;
    let obase = 1 + v * 4 in
    out.(obase) <- !out_time;
    out.(obase + 1) <- !vx;
    out.(obase + 2) <- !vy;
    out.(obase + 3) <- !vz
  done;
  out.(0) <- !n_morphing_points;
  out
