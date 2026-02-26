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
  Callback.register "cd_vm_vec_rotate" cd_vm_vec_rotate
