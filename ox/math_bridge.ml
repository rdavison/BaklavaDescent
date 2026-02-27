let cd_vm_vec_add ax ay az bx by bz = Ox_math.vm_vec_add (ax, ay, az) (bx, by, bz)
let cd_vm_vec_sub ax ay az bx by bz = Ox_math.vm_vec_sub (ax, ay, az) (bx, by, bz)
let cd_vm_vec_add2 dx dy dz sx sy sz = Ox_math.vm_vec_add2 (dx, dy, dz) (sx, sy, sz)
let cd_vm_vec_sub2 dx dy dz sx sy sz = Ox_math.vm_vec_sub2 (dx, dy, dz) (sx, sy, sz)
let cd_vm_vec_avg ax ay az bx by bz = Ox_math.vm_vec_avg (ax, ay, az) (bx, by, bz)

let cd_vm_vec_avg4 a1 a2 a3 b1 b2 b3 c1 c2 c3 d1 d2 d3 =
  Ox_math.vm_vec_avg4 (a1, a2, a3) (b1, b2, b3) (c1, c2, c3) (d1, d2, d3)

let cd_vm_vec_copy_scale sx sy sz k = Ox_math.vm_vec_copy_scale (sx, sy, sz) k

let cd_vm_vec_scale_add ax ay az bx by bz k =
  Ox_math.vm_vec_scale_add (ax, ay, az) (bx, by, bz) k

let cd_vm_vec_scale_add2 dx dy dz sx sy sz k =
  Ox_math.vm_vec_scale_add2 (dx, dy, dz) (sx, sy, sz) k

let cd_vm_vec_scale2 dx dy dz n d = Ox_math.vm_vec_scale2 (dx, dy, dz) n d
let cd_vm_vec_mag x y z = Ox_math.vm_vec_mag (x, y, z)
let cd_vm_vec_dist x0 y0 z0 x1 y1 z1 = Ox_math.vm_vec_dist (x0, y0, z0) (x1, y1, z1)
let cd_vm_vec_dotprod x0 y0 z0 x1 y1 z1 = Ox_math.vm_vec_dotprod (x0, y0, z0) (x1, y1, z1)
let cd_vm_vec_dot3 x y z vx vy vz = Ox_math.vm_vec_dot3 x y z (vx, vy, vz)

let cd_vm_vec_crossprod x0 y0 z0 x1 y1 z1 =
  Ox_math.vm_vec_crossprod (x0, y0, z0) (x1, y1, z1)

let cd_vm_vec_perp p0x p0y p0z p1x p1y p1z p2x p2y p2z =
  Ox_math.vm_vec_perp (p0x, p0y, p0z) (p1x, p1y, p1z) (p2x, p2y, p2z)

let cd_vm_vec_copy_normalize sx sy sz =
  let m, (nx, ny, nz) = Ox_math.vm_vec_copy_normalize (sx, sy, sz) in
  (m, nx, ny, nz)

let cd_vm_vec_rotate sx sy sz r1 r2 r3 u1 u2 u3 f1 f2 f3 =
  Ox_math.vm_vec_rotate (sx, sy, sz) ((r1, r2, r3), (u1, u2, u3), (f1, f2, f3))

let cd_sincos_2_matrix sinp cosp sinb cosb sinh cosh =
  Ox_math.sincos_2_matrix sinp cosp sinb cosb sinh cosh

let cd_vm_angles_2_matrix p b h = Ox_math.vm_angles_2_matrix (p, b, h)

let cd_vm_vec_ang_2_matrix vx vy vz a = Ox_math.vm_vec_ang_2_matrix (vx, vy, vz) a

let cd_vm_transpose_matrix r1 r2 r3 u1 u2 u3 f1 f2 f3 =
  Ox_math.vm_transpose_matrix ((r1, r2, r3), (u1, u2, u3), (f1, f2, f3))

let cd_vm_matrix_x_matrix s0r1 s0r2 s0r3 s0u1 s0u2 s0u3 s0f1 s0f2 s0f3
    s1r1 s1r2 s1r3 s1u1 s1u2 s1u3 s1f1 s1f2 s1f3 =
  Ox_math.vm_matrix_x_matrix
    ((s0r1, s0r2, s0r3), (s0u1, s0u2, s0u3), (s0f1, s0f2, s0f3))
    ((s1r1, s1r2, s1r3), (s1u1, s1u2, s1u3), (s1f1, s1f2, s1f3))

let cd_vm_vector_2_matrix fx fy fz has_uvec ux uy uz has_rvec rx ry rz =
  let uvec = if has_uvec <> 0 then Some (ux, uy, uz) else None in
  let rvec = if has_rvec <> 0 then Some (rx, ry, rz) else None in
  Ox_math.vm_vector_2_matrix (fx, fy, fz) uvec rvec

let cd_vm_vector_2_matrix_norm fx fy fz has_uvec ux uy uz has_rvec rx ry rz =
  let uvec = if has_uvec <> 0 then Some (ux, uy, uz) else None in
  let rvec = if has_rvec <> 0 then Some (rx, ry, rz) else None in
  Ox_math.vm_vector_2_matrix_norm (fx, fy, fz) uvec rvec

let cd_vm_extract_angles_matrix r1 r2 r3 u1 u2 u3 f1 f2 f3 =
  Ox_math.vm_extract_angles_matrix ((r1, r2, r3), (u1, u2, u3), (f1, f2, f3))

let cd_vm_extract_angles_vector_normalized x y z =
  Ox_math.vm_extract_angles_vector_normalized (x, y, z)

let cd_vm_extract_angles_vector ip ib ih vx vy vz =
  Ox_math.vm_extract_angles_vector (ip, ib, ih) (vx, vy, vz)

let cd_vm_vec_delta_ang_norm v0x v0y v0z v1x v1y v1z has_fvec fx fy fz =
  let fvec = if has_fvec <> 0 then Some (fx, fy, fz) else None in
  Ox_math.vm_vec_delta_ang_norm (v0x, v0y, v0z) (v1x, v1y, v1z) fvec

let cd_vm_vec_delta_ang v0x v0y v0z v1x v1y v1z has_fvec fx fy fz =
  let fvec = if has_fvec <> 0 then Some (fx, fy, fz) else None in
  Ox_math.vm_vec_delta_ang (v0x, v0y, v0z) (v1x, v1y, v1z) fvec

let cd_vm_vec_mag_quick x y z = Ox_math.vm_vec_mag_quick (x, y, z)
let cd_vm_vec_dist_quick x0 y0 z0 x1 y1 z1 = Ox_math.vm_vec_dist_quick (x0, y0, z0) (x1, y1, z1)

let cd_vm_vec_copy_normalize_quick sx sy sz =
  let m, (nx, ny, nz) = Ox_math.vm_vec_copy_normalize_quick (sx, sy, sz) in
  (m, nx, ny, nz)

let () =
  (* Register named callbacks so C can resolve these via caml_named_value(). *)
  Callback.register "cd_i2f" Ox_math.i2f;
  Callback.register "cd_f2i" Ox_math.f2i;
  Callback.register "cd_fixmul" Ox_math.fixmul;
  Callback.register "cd_fixdiv" Ox_math.fixdiv;
  Callback.register "cd_fix_sqrt" Ox_math.fix_sqrt;
  Callback.register "cd_fix_isqrt" Ox_math.fix_isqrt;
  Callback.register "cd_fix_asin" Ox_math.fix_asin;
  Callback.register "cd_fix_acos" Ox_math.fix_acos;
  Callback.register "cd_fix_atan2" Ox_math.fix_atan2;
  Callback.register "cd_fix_sincos" Ox_math.fix_sincos;
  Callback.register "cd_fix_fastsincos" Ox_math.fix_fastsincos;
  Callback.register "cd_vm_vec_add" cd_vm_vec_add;
  Callback.register "cd_vm_vec_sub" cd_vm_vec_sub;
  Callback.register "cd_vm_vec_add2" cd_vm_vec_add2;
  Callback.register "cd_vm_vec_sub2" cd_vm_vec_sub2;
  Callback.register "cd_vm_vec_avg" cd_vm_vec_avg;
  Callback.register "cd_vm_vec_avg4" cd_vm_vec_avg4;
  Callback.register "cd_vm_vec_copy_scale" cd_vm_vec_copy_scale;
  Callback.register "cd_vm_vec_scale_add" cd_vm_vec_scale_add;
  Callback.register "cd_vm_vec_scale_add2" cd_vm_vec_scale_add2;
  Callback.register "cd_vm_vec_scale2" cd_vm_vec_scale2;
  Callback.register "cd_vm_vec_mag" cd_vm_vec_mag;
  Callback.register "cd_vm_vec_dist" cd_vm_vec_dist;
  Callback.register "cd_vm_vec_dotprod" cd_vm_vec_dotprod;
  Callback.register "cd_vm_vec_dot3" cd_vm_vec_dot3;
  Callback.register "cd_vm_vec_crossprod" cd_vm_vec_crossprod;
  Callback.register "cd_vm_vec_perp" cd_vm_vec_perp;
  Callback.register "cd_vm_vec_copy_normalize" cd_vm_vec_copy_normalize;
  Callback.register "cd_vm_vec_rotate" cd_vm_vec_rotate;
  Callback.register "cd_sincos_2_matrix" cd_sincos_2_matrix;
  Callback.register "cd_vm_angles_2_matrix" cd_vm_angles_2_matrix;
  Callback.register "cd_vm_vec_ang_2_matrix" cd_vm_vec_ang_2_matrix;
  Callback.register "cd_vm_transpose_matrix" cd_vm_transpose_matrix;
  Callback.register "cd_vm_matrix_x_matrix" cd_vm_matrix_x_matrix;
  Callback.register "cd_vm_vector_2_matrix" cd_vm_vector_2_matrix;
  Callback.register "cd_vm_vector_2_matrix_norm" cd_vm_vector_2_matrix_norm;
  Callback.register "cd_vm_extract_angles_matrix" cd_vm_extract_angles_matrix;
  Callback.register "cd_vm_extract_angles_vector_normalized" cd_vm_extract_angles_vector_normalized;
  Callback.register "cd_vm_extract_angles_vector" cd_vm_extract_angles_vector;
  Callback.register "cd_vm_vec_delta_ang_norm" cd_vm_vec_delta_ang_norm;
  Callback.register "cd_vm_vec_delta_ang" cd_vm_vec_delta_ang;
  Callback.register "cd_vm_vec_mag_quick" cd_vm_vec_mag_quick;
  Callback.register "cd_vm_vec_dist_quick" cd_vm_vec_dist_quick;
  Callback.register "cd_vm_vec_copy_normalize_quick" cd_vm_vec_copy_normalize_quick;
  (* Force 3D bridge module initialization so its callbacks are registered. *)
  ignore (G3d_bridge.cd_g3_code_point : int -> int -> int -> int);
  (* Force FVI bridge module initialization so its callbacks are registered. *)
  ignore (Fvi_bridge.cd_check_vector_to_sphere_1 :
    int -> int -> int -> int -> int -> int -> int -> int -> int -> int -> int * int * int * int);
  (* Force collide bridge module initialization so its callbacks are registered. *)
  ignore (Collide_bridge.cd_apply_damage_to_robot_d1 :
    int -> int -> int -> int -> int -> int -> int -> int array);
  (* Force physics bridge module initialization so its callbacks are registered. *)
  ignore (Physics_bridge.cd_physics_turn_towards_vector :
    int -> int -> int -> int -> int -> int -> int -> int -> int -> int -> int -> int * int * int);
  ignore (Physics_bridge.cd_do_physics_sim_rot :
    int -> int -> int -> int -> int -> int -> int -> int -> int -> int ->
    int -> int -> int -> int -> int -> int -> int -> int -> int -> int ->
    int * int * int * int * int * int * int * int * int * int * int * int * int * int);
  ignore (Physics_bridge.cd_calc_gun_point : int array -> int * int * int);
  ignore (Physics_bridge.cd_phys_apply_force :
    int -> int -> int -> int -> int -> int -> int -> int * int * int);
  ignore (Physics_bridge.cd_phys_apply_rot :
    int -> int -> int -> int -> int -> int -> int -> int -> int -> int -> int -> int -> int * int * int * int);
  ignore (Physics_bridge.cd_ai_turn_towards_vector :
    int -> int -> int -> int -> int -> int -> int -> int -> int -> int -> int ->
    int -> int -> int -> int -> int -> int * int * int * int * int * int * int * int * int);
  ignore (Physics_bridge.cd_set_thrust_from_velocity :
    int -> int -> int -> int -> int -> int * int * int)
