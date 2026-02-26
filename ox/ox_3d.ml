(* Pure 3D transformation pipeline functions.
   All functions are stateless — globals like View_position, View_matrix
   are passed in explicitly from the C side. *)

(* Clipping-code constants matching 3d/3d.h *)
let cc_off_left = 1
let cc_off_right = 2
let cc_off_bot = 4
let cc_off_top = 8
let cc_behind = 0x80

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
  (* shld ecx,eax,1 approximation *)
  let high = high * 2 in
  let high = if low > 0x7FFFFFFF then high + 1 else high in
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
let g3_project_point (x, y, z) ~canv_w2 ~canv_h2 =
  let ok_x, tx = checkmuldiv x canv_w2 z in
  if ok_x then
    let ok_y, ty = checkmuldiv y canv_h2 z in
    if ok_y then
      (* PF_PROJECTED = 1 *)
      Some (Ox_math.wrap_i64_to_fix Int64.(of_int canv_w2 + of_int tx),
            Ox_math.wrap_i64_to_fix Int64.(of_int canv_h2 - of_int ty))
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
  let q = Ox_math.fixmulaccum q (px - vpx) fx in
  let q = Ox_math.fixmulaccum q (py - vpy) fy in
  let q = Ox_math.fixmulaccum q (pz - vpz) fz in
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
  let tx =
    Ox_math.fixmuldiv
      (Ox_math.fixdiv (Int.shift_left sx 16 - canv_w2) canv_w2)
      msz msx
  in
  let ty =
    Ox_math.neg_i32
      (Ox_math.fixmuldiv
         (Ox_math.fixdiv (Int.shift_left sy 16 - canv_h2) canv_h2)
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
