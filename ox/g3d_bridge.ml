let cd_g3_code_point x y z = Ox_3d.g3_code_point (x, y, z)

let cd_checkmuldiv a b c =
  let ok, r = Ox_3d.checkmuldiv a b c in
  (if ok then 1 else 0), r

let cd_g3_rotate_point sx sy sz vpx vpy vpz r1 r2 r3 u1 u2 u3 f1 f2 f3 =
  let (rx, ry, rz), codes =
    Ox_3d.g3_rotate_point
      ~view_pos:(vpx, vpy, vpz)
      ~view_matrix:((r1, r2, r3), (u1, u2, u3), (f1, f2, f3))
      (sx, sy, sz)
  in
  (rx, ry, rz, codes)

let cd_g3_project_point x y z canv_w2 canv_h2 =
  match Ox_3d.g3_project_point (x, y, z) ~canv_w2 ~canv_h2 with
  | Some (sx, sy) -> (1, sx, sy)
  | None -> (0, 0, 0)

let cd_g3_rotate_delta_x r1 r2 r3 u1 u2 u3 f1 f2 f3 dx =
  Ox_3d.g3_rotate_delta_x ((r1, r2, r3), (u1, u2, u3), (f1, f2, f3)) dx

let cd_g3_rotate_delta_y r1 r2 r3 u1 u2 u3 f1 f2 f3 dy =
  Ox_3d.g3_rotate_delta_y ((r1, r2, r3), (u1, u2, u3), (f1, f2, f3)) dy

let cd_g3_rotate_delta_z r1 r2 r3 u1 u2 u3 f1 f2 f3 dz =
  Ox_3d.g3_rotate_delta_z ((r1, r2, r3), (u1, u2, u3), (f1, f2, f3)) dz

let cd_g3_calc_point_depth px py pz vpx vpy vpz fx fy fz =
  Ox_3d.g3_calc_point_depth ~view_pos:(vpx, vpy, vpz) ~view_fvec:(fx, fy, fz) (px, py, pz)

let cd_scale_matrix r1 r2 r3 u1 u2 u3 f1 f2 f3 wsx wsy wsz zoom =
  let ((or1, or2, or3), (ou1, ou2, ou3), (of1, of2, of3)),
      (msx, msy, msz), _unscaled =
    Ox_3d.scale_matrix ((r1, r2, r3), (u1, u2, u3), (f1, f2, f3))
      (wsx, wsy, wsz) zoom
  in
  (or1, or2, or3, ou1, ou2, ou3, of1, of2, of3, msx, msy, msz)

let cd_g3_start_instance_matrix
    vpx vpy vpz r1 r2 r3 u1 u2 u3 f1 f2 f3
    px py pz has_orient mr1 mr2 mr3 mu1 mu2 mu3 mf1 mf2 mf3 =
  let orient =
    if has_orient <> 0
    then Some ((mr1, mr2, mr3), (mu1, mu2, mu3), (mf1, mf2, mf3))
    else None
  in
  let (nvpx, nvpy, nvpz),
      ((nr1, nr2, nr3), (nu1, nu2, nu3), (nf1, nf2, nf3)) =
    Ox_3d.g3_start_instance_matrix
      ~view_pos:(vpx, vpy, vpz)
      ~view_matrix:((r1, r2, r3), (u1, u2, u3), (f1, f2, f3))
      (px, py, pz) orient
  in
  (nvpx, nvpy, nvpz, nr1, nr2, nr3, nu1, nu2, nu3, nf1, nf2, nf3)

let cd_g3_point_2_vec sx sy canv_w2 canv_h2 msx msy msz ur1 ur2 ur3 uu1 uu2 uu3 uf1 uf2 uf3 =
  let (vx, vy, vz) =
    Ox_3d.g3_point_2_vec
      ~canv_w2 ~canv_h2
      ~matrix_scale:(msx, msy, msz)
      ~unscaled_matrix:((ur1, ur2, ur3), (uu1, uu2, uu3), (uf1, uf2, uf3))
      sx sy
  in
  (vx, vy, vz)

let cd_clip_edge plane_flag
    on_x on_y on_z on_u on_v on_l on_flags
    off_x off_y off_z off_u off_v off_l =
  let (nx, ny, nz, nu, nv, nl, nflags, ncodes) =
    Ox_3d.clip_edge ~plane_flag
      ~on_x ~on_y ~on_z ~on_u ~on_v ~on_l ~on_flags
      ~off_x ~off_y ~off_z ~off_u ~off_v ~off_l
  in
  (nx, ny, nz, nu, nv, nl, nflags, ncodes)

let cd_g3_check_normal_facing vpx vpy vpz vx vy vz nx ny nz =
  let facing =
    Ox_3d.g3_check_normal_facing
      ~view_pos:(vpx, vpy, vpz) (vx, vy, vz) (nx, ny, nz)
  in
  if facing then 1 else 0

let cd_do_facing_check_computed p0x p0y p0z p1x p1y p1z p2x p2y p2z =
  if Ox_3d.do_facing_check_computed (p0x, p0y, p0z) (p1x, p1y, p1z) (p2x, p2y, p2z)
  then 1 else 0

let cd_clip_line p0x p0y p0z p0_codes p1x p1y p1z p1_codes codes_or =
  let ((rp0x, rp0y, rp0z), rp0c,
       (rp1x, rp1y, rp1z), rp1c,
       clipped) =
    Ox_3d.clip_line (p0x, p0y, p0z) p0_codes (p1x, p1y, p1z) p1_codes codes_or
  in
  (rp0x, rp0y, rp0z, rp0c,
   rp1x, rp1y, rp1z, rp1c,
   (if clipped then 1 else 0))

let cd_clip_polygon codes_or codes_and (arr : int array) =
  let nv = arr.(0) in
  let points = List.init nv ~f:(fun i ->
    let b = 1 + i * 8 in
    (arr.(b), arr.(b+1), arr.(b+2),
     arr.(b+3), arr.(b+4), arr.(b+5),
     arr.(b+6), arr.(b+7)))
  in
  let (clipped, final_or, final_and) =
    Ox_3d.clip_polygon ~codes_or ~codes_and points
  in
  let out_nv = List.length clipped in
  let result = Array.create ~len:(2 + out_nv * 8) 0 in
  result.(0) <- final_or;
  result.(1) <- final_and;
  List.iteri clipped ~f:(fun i (x, y, z, u, v, l, flags, codes) ->
    let b = 2 + i * 8 in
    result.(b) <- x;
    result.(b+1) <- y;
    result.(b+2) <- z;
    result.(b+3) <- u;
    result.(b+4) <- v;
    result.(b+5) <- l;
    result.(b+6) <- flags;
    result.(b+7) <- codes);
  result

let cd_calc_rod_corners bx by bz bw tx ty tz tw msx msy msz =
  let ((c0x, c0y, c0z), (c1x, c1y, c1z), (c2x, c2y, c2z), (c3x, c3y, c3z), codes_and) =
    Ox_3d.calc_rod_corners
      ~bot_vec:(bx, by, bz) ~bot_width:bw
      ~top_vec:(tx, ty, tz) ~top_width:tw
      ~matrix_scale:(msx, msy, msz)
  in
  (c0x, c0y, c0z, c1x, c1y, c1z, c2x, c2y, c2z, c3x, c3y, c3z, codes_and)

let () =
  Callback.register "cd_g3_code_point" cd_g3_code_point;
  Callback.register "cd_checkmuldiv" cd_checkmuldiv;
  Callback.register "cd_g3_rotate_point" cd_g3_rotate_point;
  Callback.register "cd_g3_project_point" cd_g3_project_point;
  Callback.register "cd_g3_rotate_delta_x" cd_g3_rotate_delta_x;
  Callback.register "cd_g3_rotate_delta_y" cd_g3_rotate_delta_y;
  Callback.register "cd_g3_rotate_delta_z" cd_g3_rotate_delta_z;
  Callback.register "cd_g3_calc_point_depth" cd_g3_calc_point_depth;
  Callback.register "cd_scale_matrix" cd_scale_matrix;
  Callback.register "cd_g3_start_instance_matrix" cd_g3_start_instance_matrix;
  Callback.register "cd_g3_point_2_vec" cd_g3_point_2_vec;
  Callback.register "cd_clip_edge" cd_clip_edge;
  Callback.register "cd_clip_line" cd_clip_line;
  Callback.register "cd_clip_polygon" cd_clip_polygon;
  Callback.register "cd_g3_check_normal_facing" cd_g3_check_normal_facing;
  Callback.register "cd_do_facing_check_computed" cd_do_facing_check_computed;
  Callback.register "cd_calc_rod_corners" cd_calc_rod_corners
