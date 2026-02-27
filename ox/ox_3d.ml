(* Pure 3D transformation pipeline functions.
   All functions are stateless — globals like View_position, View_matrix
   are passed in explicitly from the C side. *)

(* Clipping-code constants matching 3d/3d.h *)
let cc_off_left = 1
let cc_off_right = 2
let cc_off_bot = 4
let cc_off_top = 8
let cc_behind = 0x80

(* Point flags matching 3d/3d.h *)
let pf_uvs = 8
let pf_ls = 16

(* Compute clipping codes for a rotated point (x, y, z). *)
let g3_code_point (x, y, z) =
  let cc = 0 in
  let cc = if x > z then cc lor cc_off_right else cc in
  let cc = if y > z then cc lor cc_off_top else cc in
  let cc = if x < Ox_math.neg_i32 z then cc lor cc_off_left else cc in
  let cc = if y < Ox_math.neg_i32 z then cc lor cc_off_bot else cc in
  let cc = if z <= 0 then cc lor cc_behind else cc in
  cc

(* Overflow-safe fixmul-then-divide: returns (ok, result).
   ok=true means the division didn't overflow. *)
let checkmuldiv a b c =
  let q = ref 0L in
  q := Ox_math.fixmulaccum !q a b;
  let qt = !q in
  let high = Int64.to_int_exn (Int64.bit_and (Int64.shift_right qt 32) 0xFFFFFFFFL) in
  let low = Int64.to_int_exn (Int64.bit_and qt 0xFFFFFFFFL) in
  (* sign: if high < 0 negate *)
  let high =
    let h32 = Ox_math.wrap_i64_to_fix (Int64.of_int high) in
    if h32 < 0 then -h32 else h32
  in
  (* shld ecx,eax,1 approximation — must wrap like int32 *)
  let high = Ox_math.wrap_i64_to_fix (Int64.of_int (high * 2)) in
  let high = if low > 0x7FFFFFFF then Ox_math.wrap_i64_to_fix (Int64.of_int (high + 1)) else high in
  if high >= c then false, 0
  else true, Ox_math.fixdivquadlong qt c

(* Rotate a point from world space to view space.
   Returns (rotated_vec, clipping_codes). *)
let g3_rotate_point ~view_pos ~view_matrix src =
  let tempv = Ox_math.vm_vec_sub src view_pos in
  let rotated = Ox_math.vm_vec_rotate tempv view_matrix in
  let codes = g3_code_point rotated in
  rotated, codes

(* Project a rotated 3D point to screen coordinates.
   Takes the rotated point (x, y, z), current codes and flags,
   and canvas half-dimensions (canv_w2, canv_h2).
   Returns (sx, sy, new_flags). *)
let wrap_add a b = Ox_math.wrap_i64_to_fix Int64.(of_int a + of_int b)
let wrap_sub a b = Ox_math.wrap_i64_to_fix Int64.(of_int a - of_int b)

let g3_project_point (x, y, z) ~canv_w2 ~canv_h2 =
  let ok_x, tx = checkmuldiv x canv_w2 z in
  if ok_x then
    let ok_y, ty = checkmuldiv y canv_h2 z in
    if ok_y then
      Some (wrap_add canv_w2 tx, wrap_sub canv_h2 ty)
    else None
  else None

(* Delta rotation: extract column x of view matrix scaled by dx *)
let g3_rotate_delta_x ((r1, _, _), (u1, _, _), (f1, _, _)) dx =
  Ox_math.fixmul r1 dx, Ox_math.fixmul u1 dx, Ox_math.fixmul f1 dx

(* Delta rotation: extract column y of view matrix scaled by dy *)
let g3_rotate_delta_y ((_, r2, _), (_, u2, _), (_, f2, _)) dy =
  Ox_math.fixmul r2 dy, Ox_math.fixmul u2 dy, Ox_math.fixmul f2 dy

(* Delta rotation: extract column z of view matrix scaled by dz *)
let g3_rotate_delta_z ((_, _, r3), (_, _, u3), (_, _, f3)) dz =
  Ox_math.fixmul r3 dz, Ox_math.fixmul u3 dz, Ox_math.fixmul f3 dz

(* Calculate the depth (z in view space) of a world-space point. *)
let g3_calc_point_depth ~view_pos:(vpx, vpy, vpz) ~view_fvec:(fx, fy, fz) (px, py, pz) =
  let q = 0L in
  let q = Ox_math.fixmulaccum q (wrap_sub px vpx) fx in
  let q = Ox_math.fixmulaccum q (wrap_sub py vpy) fy in
  let q = Ox_math.fixmulaccum q (wrap_sub pz vpz) fz in
  Ox_math.fixquadadjust q

(* Perform aspect scaling on a view matrix.
   Takes (view_matrix, window_scale, zoom).
   Returns (scaled_view_matrix, matrix_scale, unscaled_matrix). *)
let scale_matrix view_matrix window_scale zoom =
  let unscaled = view_matrix in
  let f1_0 = 0x10000 in
  let (sx, sy, sz) = window_scale in
  let msx, msy, msz =
    if zoom <= f1_0 then sx, sy, Ox_math.fixmul sz zoom
    else
      let s = Ox_math.fixdiv f1_0 zoom in
      Ox_math.fixmul sx s, Ox_math.fixmul sy s, sz
  in
  let (rvec, uvec, fvec) = view_matrix in
  let scaled_rvec = Ox_math.vm_vec_scale rvec msx in
  let scaled_uvec = Ox_math.vm_vec_scale uvec msy in
  let scaled_fvec = Ox_math.vm_vec_scale fvec msz in
  let scaled_matrix = (scaled_rvec, scaled_uvec, scaled_fvec) in
  let matrix_scale = (msx, msy, msz) in
  scaled_matrix, matrix_scale, unscaled

(* Unproject a 2D screen point to a 3D direction vector.
   Takes screen coords (sx, sy), canvas half-dims, matrix_scale,
   and unscaled_matrix. Returns a unit direction vector. *)
let g3_point_2_vec ~canv_w2 ~canv_h2 ~matrix_scale:(msx, msy, msz) ~unscaled_matrix sx sy =
  let f1_0 = 0x10000 in
  let sx16 = Ox_math.wrap_i64_to_fix (Int64.of_int (Int.shift_left sx 16)) in
  let sy16 = Ox_math.wrap_i64_to_fix (Int64.of_int (Int.shift_left sy 16)) in
  let tx =
    Ox_math.fixmuldiv
      (Ox_math.fixdiv (wrap_sub sx16 canv_w2) canv_w2)
      msz msx
  in
  let ty =
    Ox_math.neg_i32
      (Ox_math.fixmuldiv
         (Ox_math.fixdiv (wrap_sub sy16 canv_h2) canv_h2)
         msz msy)
  in
  let tempv = (tx, ty, f1_0) in
  let _, norm_tempv = Ox_math.vm_vec_normalize tempv in
  let tempm = Ox_math.vm_copy_transpose_matrix unscaled_matrix in
  Ox_math.vm_vec_rotate norm_tempv tempm

(* Instance matrix push: compute new view position and matrix.
   orient=None means translation only (no rotation).
   Returns (new_view_pos, new_view_matrix). *)
let g3_start_instance_matrix ~view_pos ~view_matrix pos orient =
  let tempv = Ox_math.vm_vec_sub view_pos pos in
  match orient with
  | None -> tempv, view_matrix
  | Some orient_mat ->
    let new_view_pos = Ox_math.vm_vec_rotate tempv orient_mat in
    let tempm2 = Ox_math.vm_copy_transpose_matrix orient_mat in
    let new_view_matrix = Ox_math.vm_matrix_x_matrix tempm2 view_matrix in
    new_view_pos, new_view_matrix

(* Clip a point against one frustum plane using fixed-point interpolation.
   Takes on_point fields (xyz, uvl, flags), off_point fields, and plane_flag.
   Returns (new_x, new_y, new_z, new_u, new_v, new_l, new_flags, new_codes). *)
let clip_edge ~plane_flag
    ~on_x ~on_y ~on_z ~on_u ~on_v ~on_l ~on_flags
    ~off_x ~off_y ~off_z ~off_u ~off_v ~off_l =
  let a, b =
    if plane_flag land (cc_off_right lor cc_off_left) <> 0
    then on_x, off_x
    else on_y, off_y
  in
  let a, b =
    if plane_flag land (cc_off_left lor cc_off_bot) <> 0
    then Ox_math.neg_i32 a, Ox_math.neg_i32 b
    else a, b
  in
  let kn = wrap_sub a on_z in
  let kd = wrap_sub (wrap_sub kn b) (Ox_math.neg_i32 off_z) in
  let psx_ratio = Ox_math.fixdiv kn kd in
  let tmp_x = wrap_add on_x (Ox_math.fixmul (wrap_sub off_x on_x) psx_ratio) in
  let tmp_y = wrap_add on_y (Ox_math.fixmul (wrap_sub off_y on_y) psx_ratio) in
  let tmp_z =
    if plane_flag land (cc_off_top lor cc_off_bot) <> 0
    then tmp_y
    else tmp_x
  in
  let tmp_z =
    if plane_flag land (cc_off_left lor cc_off_bot) <> 0
    then Ox_math.neg_i32 tmp_z
    else tmp_z
  in
  let tmp_u, tmp_v, flags_with_uvs =
    if on_flags land pf_uvs <> 0 then
      let u = wrap_add on_u (Ox_math.fixmul (wrap_sub off_u on_u) psx_ratio) in
      let v = wrap_add on_v (Ox_math.fixmul (wrap_sub off_v on_v) psx_ratio) in
      u, v, pf_uvs
    else 0, 0, 0
  in
  let tmp_l, flags_with_ls =
    if on_flags land pf_ls <> 0 then
      let l = wrap_add on_l (Ox_math.fixmul (wrap_sub off_l on_l) psx_ratio) in
      l, pf_ls
    else 0, 0
  in
  let new_flags = flags_with_uvs lor flags_with_ls in
  let new_codes = g3_code_point (tmp_x, tmp_y, tmp_z) in
  (tmp_x, tmp_y, tmp_z, tmp_u, tmp_v, tmp_l, new_flags, new_codes)

(* Check if a plane is facing the viewer.
   Takes view_pos, a point on the plane (v), and the surface normal.
   Returns true if facing. *)
let g3_check_normal_facing ~view_pos v norm =
  let tempv = Ox_math.vm_vec_sub view_pos v in
  Ox_math.vm_vec_dotprod tempv norm > 0

(* Clip a line segment against the viewing pyramid.
   Takes two endpoints (xyz + codes) and combined codes_or.
   Returns (p0_xyz, p0_codes, p1_xyz, p1_codes, clipped_away). *)
let clip_line (p0x, p0y, p0z) p0_codes (p1x, p1y, p1z) p1_codes codes_or =
  let rec loop planes p0x p0y p0z p0c p1x p1y p1z p1c cor =
    match planes with
    | [] -> ((p0x, p0y, p0z), p0c, (p1x, p1y, p1z), p1c, false)
    | pf :: rest ->
      if cor land pf = 0 then
        loop rest p0x p0y p0z p0c p1x p1y p1z p1c cor
      else
        let p0x, p0y, p0z, p0c, p1x, p1y, p1z =
          if p0c land pf <> 0
          then p1x, p1y, p1z, p1c, p0x, p0y, p0z
          else p0x, p0y, p0z, p0c, p1x, p1y, p1z
        in
        let (p1x, p1y, p1z, _, _, _, _, p1c) =
          clip_edge ~plane_flag:pf
            ~on_x:p0x ~on_y:p0y ~on_z:p0z ~on_u:0 ~on_v:0 ~on_l:0 ~on_flags:0
            ~off_x:p1x ~off_y:p1y ~off_z:p1z ~off_u:0 ~off_v:0 ~off_l:0
        in
        if p0c land p1c <> 0 then
          ((p0x, p0y, p0z), p0c, (p1x, p1y, p1z), p1c, true)
        else
          loop rest p0x p0y p0z p0c p1x p1y p1z p1c (p0c lor p1c)
  in
  loop [1; 2; 4; 8] p0x p0y p0z p0_codes p1x p1y p1z p1_codes codes_or

(* Sutherland-Hodgman: clip a polygon against one frustum plane.
   Points are tuples (x, y, z, u, v, l, flags, codes).
   Returns (clipped_points, codes_and, codes_or). *)
let clip_plane plane_flag points =
  let nv = List.length points in
  if nv = 0 then ([], 0xff, 0)
  else
    let pts = Array.of_list points in
    let get i = if i >= nv then pts.(i - nv) else pts.(i) in
    let dest = ref [] in
    let c_and = ref 0xff in
    let c_or = ref 0 in
    for i = 1 to nv do
      let (_, _, _, _, _, _, _, ci_codes) = get i in
      if ci_codes land plane_flag <> 0 then begin
        let (_, _, _, _, _, _, _, prev_codes) = get (i - 1) in
        if prev_codes land plane_flag = 0 then begin
          let (on_x, on_y, on_z, on_u, on_v, on_l, on_flags, _) = get (i - 1) in
          let (off_x, off_y, off_z, off_u, off_v, off_l, _, _) = get i in
          let clipped = clip_edge ~plane_flag
              ~on_x ~on_y ~on_z ~on_u ~on_v ~on_l ~on_flags
              ~off_x ~off_y ~off_z ~off_u ~off_v ~off_l
          in
          let (_, _, _, _, _, _, _, nc) = clipped in
          c_or := !c_or lor nc;
          c_and := !c_and land nc;
          dest := clipped :: !dest
        end;
        let (_, _, _, _, _, _, _, next_codes) = get (i + 1) in
        if next_codes land plane_flag = 0 then begin
          let (on_x, on_y, on_z, on_u, on_v, on_l, on_flags, _) = get (i + 1) in
          let (off_x, off_y, off_z, off_u, off_v, off_l, _, _) = get i in
          let clipped = clip_edge ~plane_flag
              ~on_x ~on_y ~on_z ~on_u ~on_v ~on_l ~on_flags
              ~off_x ~off_y ~off_z ~off_u ~off_v ~off_l
          in
          let (_, _, _, _, _, _, _, nc) = clipped in
          c_or := !c_or lor nc;
          c_and := !c_and land nc;
          dest := clipped :: !dest
        end
      end else begin
        let pt = get i in
        let (_, _, _, _, _, _, _, cc) = pt in
        c_or := !c_or lor cc;
        c_and := !c_and land cc;
        dest := pt :: !dest
      end
    done;
    (List.rev !dest, !c_and, !c_or)

(* Clip a polygon against all 4 frustum planes.
   Returns (clipped_points, final_codes_or, final_codes_and). *)
let clip_polygon ~codes_or ~codes_and points =
  let rec loop planes pts c_or c_and =
    match planes with
    | [] -> (pts, c_or, c_and)
    | pf :: rest ->
      if c_or land pf = 0 then
        loop rest pts c_or c_and
      else
        let (clipped, new_and, new_or) = clip_plane pf pts in
        if new_and <> 0 then
          (clipped, new_or, new_and)
        else
          loop rest clipped new_or new_and
  in
  loop [1; 2; 4; 8] points codes_or codes_and

(* Compute facing check from 3 rotated vertices (no explicit normal).
   Returns true if the polygon faces the viewer. *)
let do_facing_check_computed p0 p1 p2 =
  let tempv = Ox_math.vm_vec_perp p0 p1 p2 in
  Ox_math.vm_vec_dotprod tempv p1 < 0

(* Compute the 4 billboard rod corners.
   Takes bot_vec, bot_width, top_vec, top_width, matrix_scale.
   Returns (corner0, corner1, corner2, corner3, codes_and). *)
let calc_rod_corners ~bot_vec ~bot_width ~top_vec ~top_width ~matrix_scale =
  let (msx, msy, _msz) = matrix_scale in
  let delta_vec = Ox_math.vm_vec_sub bot_vec top_vec in
  let (dx, dy, dz) = delta_vec in
  let delta_vec = (Ox_math.fixdiv dx msx, Ox_math.fixdiv dy msy, dz) in
  let _, delta_vec = Ox_math.vm_vec_normalize delta_vec in
  let _, top_norm = Ox_math.vm_vec_copy_normalize top_vec in
  let rod_norm = Ox_math.vm_vec_crossprod delta_vec top_norm in
  let _, rod_norm = Ox_math.vm_vec_normalize rod_norm in
  let (rnx, rny, rnz) = rod_norm in
  let rod_norm = (Ox_math.fixmul rnx msx, Ox_math.fixmul rny msy, rnz) in
  let tempv_top = Ox_math.vm_vec_copy_scale rod_norm top_width in
  let (tvx, tvy, _tvz) = tempv_top in
  let tempv_top = (tvx, tvy, 0) in
  let corner0 = Ox_math.vm_vec_add top_vec tempv_top in
  let corner1 = Ox_math.vm_vec_sub top_vec tempv_top in
  let tempv_bot = Ox_math.vm_vec_copy_scale rod_norm bot_width in
  let (bvx, bvy, _bvz) = tempv_bot in
  let tempv_bot = (bvx, bvy, 0) in
  let corner2 = Ox_math.vm_vec_sub bot_vec tempv_bot in
  let corner3 = Ox_math.vm_vec_add bot_vec tempv_bot in
  let codes0 = g3_code_point corner0 in
  let codes1 = g3_code_point corner1 in
  let codes2 = g3_code_point corner2 in
  let codes3 = g3_code_point corner3 in
  let codes_and = codes0 land codes1 land codes2 land codes3 in
  (corner0, corner1, corner2, corner3, codes_and)
