let check_unop name c_impl ox_impl cases =
  List.iter cases ~f:(fun a ->
      let c = c_impl a in
      let ox = ox_impl a in
      printf "%s a=%d c=%d ox=%d eq=%b\n" name a c ox (Int.equal c ox))

let check_unop_i64 name c_impl ox_impl cases =
  List.iter cases ~f:(fun q ->
      let c = c_impl q in
      let ox = ox_impl q in
      printf
        "%s q=%s c=%d ox=%d eq=%b\n"
        name
        (Int64.to_string q)
        c
        ox
        (Int.equal c ox))

let check_binop_i64_int name c_impl ox_impl cases =
  List.iter cases ~f:(fun (n, d) ->
      let c = c_impl n d in
      let ox = ox_impl n d in
      printf
        "%s n=%s d=%d c=%d ox=%d eq=%b\n"
        name
        (Int64.to_string n)
        d
        c
        ox
        (Int.equal c ox))

let check_ternop_i64_out name c_impl ox_impl cases =
  List.iter cases ~f:(fun (q, a, b) ->
      let c = c_impl q a b in
      let ox = ox_impl q a b in
      printf
        "%s q=%s a=%d b=%d c=%s ox=%s eq=%b\n"
        name
        (Int64.to_string q)
        a
        b
        (Int64.to_string c)
        (Int64.to_string ox)
        (Int64.equal c ox))

let check_unop_pair name c_impl ox_impl cases =
  List.iter cases ~f:(fun a ->
      let c_s, c_c = c_impl a in
      let ox_s, ox_c = ox_impl a in
      printf
        "%s a=%d c=(%d,%d) ox=(%d,%d) eq=%b\n"
        name
        a
        c_s
        c_c
        ox_s
        ox_c
        (Int.equal c_s ox_s && Int.equal c_c ox_c))

let check_binop name c_impl ox_impl cases =
  List.iter cases ~f:(fun (a, b) ->
      let c = c_impl a b in
      let ox = ox_impl a b in
      printf "%s a=%d b=%d c=%d ox=%d eq=%b\n" name a b c ox (Int.equal c ox))

let check_binop_pair name c_impl ox_impl cases =
  List.iter cases ~f:(fun (a, b) ->
      let c_x, c_y = c_impl a b in
      let ox_x, ox_y = ox_impl a b in
      printf
        "%s a=%d b=%d c=(%d,%d) ox=(%d,%d) eq=%b\n"
        name
        a
        b
        c_x
        c_y
        ox_x
        ox_y
        (Int.equal c_x ox_x && Int.equal c_y ox_y))

let check_ternop name c_impl ox_impl cases =
  List.iter cases ~f:(fun (a, b, c_arg) ->
      let c = c_impl a b c_arg in
      let ox = ox_impl a b c_arg in
      printf "%s a=%d b=%d c=%d c_out=%d ox=%d eq=%b\n" name a b c_arg c ox (Int.equal c ox))

let check_stateful_vec3 name c_impl ox_impl cases =
  List.iter cases ~f:(fun ((dx, dy, dz), (sx, sy, sz), k) ->
      let c_dx, c_dy, c_dz = c_impl dx dy dz sx sy sz k in
      let ox_dx, ox_dy, ox_dz = ox_impl (dx, dy, dz) (sx, sy, sz) k in
      printf
        "%s d=(%d,%d,%d) s=(%d,%d,%d) k=%d c=(%d,%d,%d) ox=(%d,%d,%d) eq=%b\n"
        name
        dx
        dy
        dz
        sx
        sy
        sz
        k
        c_dx
        c_dy
        c_dz
        ox_dx
        ox_dy
        ox_dz
        (Int.equal c_dx ox_dx && Int.equal c_dy ox_dy && Int.equal c_dz ox_dz))

let check_vec3_bin_scale name c_impl ox_impl cases =
  List.iter cases ~f:(fun ((ax, ay, az), (bx, by, bz), k) ->
      let c_x, c_y, c_z = c_impl ax ay az bx by bz k in
      let ox_x, ox_y, ox_z = ox_impl (ax, ay, az) (bx, by, bz) k in
      printf
        "%s a=(%d,%d,%d) b=(%d,%d,%d) k=%d c=(%d,%d,%d) ox=(%d,%d,%d) eq=%b\n"
        name
        ax
        ay
        az
        bx
        by
        bz
        k
        c_x
        c_y
        c_z
        ox_x
        ox_y
        ox_z
        (Int.equal c_x ox_x && Int.equal c_y ox_y && Int.equal c_z ox_z))

let check_stateful_vec3_scale2 name c_impl ox_impl cases =
  List.iter cases ~f:(fun ((dx, dy, dz), n, d) ->
      let c_x, c_y, c_z = c_impl dx dy dz n d in
      let ox_x, ox_y, ox_z = ox_impl (dx, dy, dz) n d in
      printf
        "%s d=(%d,%d,%d) n=%d d=%d c=(%d,%d,%d) ox=(%d,%d,%d) eq=%b\n"
        name
        dx
        dy
        dz
        n
        d
        c_x
        c_y
        c_z
        ox_x
        ox_y
        ox_z
        (Int.equal c_x ox_x && Int.equal c_y ox_y && Int.equal c_z ox_z))

let check_vec3_binop name c_impl ox_impl cases =
  List.iter cases ~f:(fun ((ax, ay, az), (bx, by, bz)) ->
      let c_x, c_y, c_z = c_impl ax ay az bx by bz in
      let ox_x, ox_y, ox_z = ox_impl (ax, ay, az) (bx, by, bz) in
      printf
        "%s a=(%d,%d,%d) b=(%d,%d,%d) c=(%d,%d,%d) ox=(%d,%d,%d) eq=%b\n"
        name
        ax
        ay
        az
        bx
        by
        bz
        c_x
        c_y
        c_z
        ox_x
        ox_y
        ox_z
        (Int.equal c_x ox_x && Int.equal c_y ox_y && Int.equal c_z ox_z))

let check_vec3_scale name c_impl ox_impl cases =
  List.iter cases ~f:(fun ((sx, sy, sz), k) ->
      let c_x, c_y, c_z = c_impl sx sy sz k in
      let ox_x, ox_y, ox_z = ox_impl (sx, sy, sz) k in
      printf
        "%s s=(%d,%d,%d) k=%d out=(%d,%d,%d) ox=(%d,%d,%d) eq=%b\n"
        name
        sx
        sy
        sz
        k
        c_x
        c_y
        c_z
        ox_x
        ox_y
        ox_z
        (Int.equal c_x ox_x && Int.equal c_y ox_y && Int.equal c_z ox_z))

let check_stateful_vec3_add2 name c_impl ox_impl cases =
  List.iter cases ~f:(fun ((dx, dy, dz), (sx, sy, sz)) ->
      let c_x, c_y, c_z = c_impl dx dy dz sx sy sz in
      let ox_x, ox_y, ox_z = ox_impl (dx, dy, dz) (sx, sy, sz) in
      printf
        "%s d=(%d,%d,%d) s=(%d,%d,%d) c=(%d,%d,%d) ox=(%d,%d,%d) eq=%b\n"
        name
        dx
        dy
        dz
        sx
        sy
        sz
        c_x
        c_y
        c_z
        ox_x
        ox_y
        ox_z
        (Int.equal c_x ox_x && Int.equal c_y ox_y && Int.equal c_z ox_z))

external c_i2f : int -> int = "caml_c_i2f"
external c_f2i : int -> int = "caml_c_f2i"
external c_fixmul : int -> int -> int = "caml_c_fixmul"
external c_fixdiv : int -> int -> int = "caml_c_fixdiv"
external c_fixmuldiv : int -> int -> int -> int = "caml_c_fixmuldiv"
external c_long_sqrt : int -> int = "caml_c_long_sqrt"
external c_quad_sqrt : int64 -> int = "caml_c_quad_sqrt"
external c_fixquadadjust : int64 -> int = "caml_c_fixquadadjust"
external c_fixmulaccum : int64 -> int -> int -> int64 = "caml_c_fixmulaccum"
external c_fixdivquadlong : int64 -> int -> int = "caml_c_fixdivquadlong"
external c_fixquadnegate : int -> int -> int * int = "caml_c_fixquadnegate"
external c_ufixdivquadlong : int -> int -> int -> int = "caml_c_ufixdivquadlong"
external c_fix_sqrt : int -> int = "caml_c_fix_sqrt"
external c_fix_isqrt : int -> int = "caml_c_fix_isqrt"
external c_fix_sincos : int -> int * int = "caml_c_fix_sincos"
external c_fix_fastsincos : int -> int * int = "caml_c_fix_fastsincos"
external c_fix_acos : int -> int = "caml_c_fix_acos"
external c_fix_asin : int -> int = "caml_c_fix_asin"
external c_fix_atan2 : int -> int -> int = "caml_c_fix_atan2"
external c_vm_vec_scale_add2
  :  int -> int -> int -> int -> int -> int -> int -> int * int * int
  = "caml_c_vm_vec_scale_add2_bc" "caml_c_vm_vec_scale_add2"
external c_vm_vec_scale_add
  :  int -> int -> int -> int -> int -> int -> int -> int * int * int
  = "caml_c_vm_vec_scale_add_bc" "caml_c_vm_vec_scale_add"
external c_vm_vec_scale2 : int -> int -> int -> int -> int -> int * int * int = "caml_c_vm_vec_scale2"
external c_vm_vec_add : int -> int -> int -> int -> int -> int -> int * int * int
  = "caml_c_vm_vec_add_bc" "caml_c_vm_vec_add"
external c_vm_vec_sub : int -> int -> int -> int -> int -> int -> int * int * int
  = "caml_c_vm_vec_sub_bc" "caml_c_vm_vec_sub"
external c_vm_vec_add2 : int -> int -> int -> int -> int -> int -> int * int * int
  = "caml_c_vm_vec_add2_bc" "caml_c_vm_vec_add2"
external c_vm_vec_sub2 : int -> int -> int -> int -> int -> int -> int * int * int
  = "caml_c_vm_vec_sub2_bc" "caml_c_vm_vec_sub2"
external c_vm_vec_avg : int -> int -> int -> int -> int -> int -> int * int * int
  = "caml_c_vm_vec_avg_bc" "caml_c_vm_vec_avg"
external c_vm_vec_avg4
  :  int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int * int * int
  = "caml_c_vm_vec_avg4_bc" "caml_c_vm_vec_avg4"
external c_vm_vec_copy_scale : int -> int -> int -> int -> int * int * int = "caml_c_vm_vec_copy_scale"
external c_vm_vec_scale : int -> int -> int -> int -> int * int * int = "caml_c_vm_vec_scale"
external c_vm_vec_mag : int -> int -> int -> int = "caml_c_vm_vec_mag"
external c_vm_vec_mag_quick : int -> int -> int -> int = "caml_c_vm_vec_mag_quick"
external c_vm_vec_dist : int -> int -> int -> int -> int -> int -> int
  = "caml_c_vm_vec_dist_bc" "caml_c_vm_vec_dist"
external c_vm_vec_dist_quick : int -> int -> int -> int -> int -> int -> int
  = "caml_c_vm_vec_dist_quick_bc" "caml_c_vm_vec_dist_quick"
external c_vm_vec_dotprod : int -> int -> int -> int -> int -> int -> int
  = "caml_c_vm_vec_dotprod_bc" "caml_c_vm_vec_dotprod"
external c_vm_vec_dot3 : int -> int -> int -> int -> int -> int -> int
  = "caml_c_vm_vec_dot3_bc" "caml_c_vm_vec_dot3"
external c_vm_vec_crossprod : int -> int -> int -> int -> int -> int -> int * int * int
  = "caml_c_vm_vec_crossprod_bc" "caml_c_vm_vec_crossprod"
external c_vm_vec_copy_normalize : int -> int -> int -> int * int * int * int
  = "caml_c_vm_vec_copy_normalize"
external c_vm_vec_normalize : int -> int -> int -> int * int * int * int = "caml_c_vm_vec_normalize"
external c_vm_vec_normalized_dir : int -> int -> int -> int -> int -> int -> int * int * int * int
  = "caml_c_vm_vec_normalized_dir_bc" "caml_c_vm_vec_normalized_dir"
external c_vm_vec_copy_normalize_quick : int -> int -> int -> int * int * int * int
  = "caml_c_vm_vec_copy_normalize_quick"
external c_vm_vec_normalize_quick : int -> int -> int -> int * int * int * int
  = "caml_c_vm_vec_normalize_quick"
external c_vm_vec_normalized_dir_quick : int -> int -> int -> int -> int -> int -> int * int * int * int
  = "caml_c_vm_vec_normalized_dir_quick_bc" "caml_c_vm_vec_normalized_dir_quick"
external c_vm_vec_make : int -> int -> int -> int * int * int = "caml_c_vm_vec_make"
external c_vm_check_vec : int -> int -> int -> int * int * int = "caml_c_vm_check_vec"
external c_vm_angvec_make : int -> int -> int -> int * int * int = "caml_c_vm_angvec_make"
external c_vm_dist_to_plane : int -> int -> int -> int -> int -> int -> int -> int -> int -> int
  = "caml_c_vm_dist_to_plane_bc" "caml_c_vm_dist_to_plane"
external c_vm_vec_perp
  :  int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int * int * int
  = "caml_c_vm_vec_perp_bc" "caml_c_vm_vec_perp"
external c_vm_vec_normal
  :  int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int * int * int
  = "caml_c_vm_vec_normal_bc" "caml_c_vm_vec_normal"
external c_vm_vec_delta_ang_norm_raw
  :  int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> bool
  -> int
  -> int
  -> int
  -> int
  = "caml_c_vm_vec_delta_ang_norm_bc" "caml_c_vm_vec_delta_ang_norm"
external c_vm_vec_delta_ang_raw
  :  int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> bool
  -> int
  -> int
  -> int
  -> int
  = "caml_c_vm_vec_delta_ang_bc" "caml_c_vm_vec_delta_ang"
external c_sincos_2_matrix_raw
  :  int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int * int * int * int * int * int * int * int * int
  = "caml_c_sincos_2_matrix_bc" "caml_c_sincos_2_matrix"
external c_vm_angles_2_matrix_raw
  :  int
  -> int
  -> int
  -> int * int * int * int * int * int * int * int * int
  = "caml_c_vm_angles_2_matrix_bc" "caml_c_vm_angles_2_matrix"
external c_vm_vec_ang_2_matrix_raw
  :  int
  -> int
  -> int
  -> int
  -> int * int * int * int * int * int * int * int * int
  = "caml_c_vm_vec_ang_2_matrix_bc" "caml_c_vm_vec_ang_2_matrix"
external c_vm_extract_angles_matrix_raw
  :  int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int * int * int
  = "caml_c_vm_extract_angles_matrix_bc" "caml_c_vm_extract_angles_matrix"
external c_vm_extract_angles_vector_normalized
  :  int
  -> int
  -> int
  -> int * int * int
  = "caml_c_vm_extract_angles_vector_normalized"
external c_vm_extract_angles_vector_raw
  :  int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int * int * int
  = "caml_c_vm_extract_angles_vector_bc" "caml_c_vm_extract_angles_vector"
external c_vm_vector_2_matrix_raw
  :  int
  -> int
  -> int
  -> bool
  -> int
  -> int
  -> int
  -> bool
  -> int
  -> int
  -> int
  -> int * int * int * int * int * int * int * int * int
  = "caml_c_vm_vector_2_matrix_bc" "caml_c_vm_vector_2_matrix"
external c_vm_vector_2_matrix_norm_raw
  :  int
  -> int
  -> int
  -> bool
  -> int
  -> int
  -> int
  -> bool
  -> int
  -> int
  -> int
  -> int * int * int * int * int * int * int * int * int
  = "caml_c_vm_vector_2_matrix_norm_bc" "caml_c_vm_vector_2_matrix_norm"
external c_vm_vec_rotate_raw
  :  int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int * int * int
  = "caml_c_vm_vec_rotate_bc" "caml_c_vm_vec_rotate"
external c_vm_transpose_matrix_raw
  :  int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int * int * int * int * int * int * int * int * int
  = "caml_c_vm_transpose_matrix_bc" "caml_c_vm_transpose_matrix"
external c_vm_copy_transpose_matrix_raw
  :  int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int * int * int * int * int * int * int * int * int
  = "caml_c_vm_copy_transpose_matrix_bc" "caml_c_vm_copy_transpose_matrix"
external c_vm_matrix_x_matrix_raw
  :  int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int * int * int * int * int * int * int * int * int
  = "caml_c_vm_matrix_x_matrix_bc" "caml_c_vm_matrix_x_matrix"

type vec3 = int * int * int
type mat3 = vec3 * vec3 * vec3

let eq_vec3 (ax, ay, az) (bx, by, bz) = Int.equal ax bx && Int.equal ay by && Int.equal az bz

let eq_mat3 (ar, au, af) (br, bu, bf) = eq_vec3 ar br && eq_vec3 au bu && eq_vec3 af bf

let flat_of_mat3 ((r1, r2, r3), (u1, u2, u3), (f1, f2, f3) : mat3) = r1, r2, r3, u1, u2, u3, f1, f2, f3

let mat3_of_flat (r1, r2, r3, u1, u2, u3, f1, f2, f3) : mat3 = (r1, r2, r3), (u1, u2, u3), (f1, f2, f3)

let c_vm_vec_rotate (sx, sy, sz) mat =
  let rx, ry, rz, ux, uy, uz, fx, fy, fz = flat_of_mat3 mat in
  c_vm_vec_rotate_raw sx sy sz rx ry rz ux uy uz fx fy fz

let c_vm_transpose_matrix mat =
  let rx, ry, rz, ux, uy, uz, fx, fy, fz = flat_of_mat3 mat in
  mat3_of_flat (c_vm_transpose_matrix_raw rx ry rz ux uy uz fx fy fz)

let c_vm_copy_transpose_matrix mat =
  let rx, ry, rz, ux, uy, uz, fx, fy, fz = flat_of_mat3 mat in
  mat3_of_flat (c_vm_copy_transpose_matrix_raw rx ry rz ux uy uz fx fy fz)

let c_vm_vector_2_matrix fvec uvec rvec =
  let fx, fy, fz = fvec in
  let has_u, ux, uy, uz =
    match uvec with
    | Some (x, y, z) -> true, x, y, z
    | None -> false, 0, 0, 0
  in
  let has_r, rx, ry, rz =
    match rvec with
    | Some (x, y, z) -> true, x, y, z
    | None -> false, 0, 0, 0
  in
  mat3_of_flat (c_vm_vector_2_matrix_raw fx fy fz has_u ux uy uz has_r rx ry rz)

let c_vm_vector_2_matrix_norm fvec uvec rvec =
  let fx, fy, fz = fvec in
  let has_u, ux, uy, uz =
    match uvec with
    | Some (x, y, z) -> true, x, y, z
    | None -> false, 0, 0, 0
  in
  let has_r, rx, ry, rz =
    match rvec with
    | Some (x, y, z) -> true, x, y, z
    | None -> false, 0, 0, 0
  in
  mat3_of_flat (c_vm_vector_2_matrix_norm_raw fx fy fz has_u ux uy uz has_r rx ry rz)

let c_sincos_2_matrix sinp cosp sinb cosb sinh cosh =
  mat3_of_flat (c_sincos_2_matrix_raw sinp cosp sinb cosb sinh cosh)

let c_vm_angles_2_matrix (p, b, h) = mat3_of_flat (c_vm_angles_2_matrix_raw p b h)

let c_vm_vec_ang_2_matrix (vx, vy, vz) a = mat3_of_flat (c_vm_vec_ang_2_matrix_raw vx vy vz a)

let c_vm_extract_angles_matrix mat =
  let rx, ry, rz, ux, uy, uz, fx, fy, fz = flat_of_mat3 mat in
  c_vm_extract_angles_matrix_raw rx ry rz ux uy uz fx fy fz

let c_vm_extract_angles_vector (p, b, h) (x, y, z) =
  c_vm_extract_angles_vector_raw p b h x y z

let c_vm_vec_delta_ang_norm (v0x, v0y, v0z) (v1x, v1y, v1z) fvec =
  let has_f, fx, fy, fz =
    match fvec with
    | Some (x, y, z) -> true, x, y, z
    | None -> false, 0, 0, 0
  in
  c_vm_vec_delta_ang_norm_raw v0x v0y v0z v1x v1y v1z has_f fx fy fz

let c_vm_vec_delta_ang (v0x, v0y, v0z) (v1x, v1y, v1z) fvec =
  let has_f, fx, fy, fz =
    match fvec with
    | Some (x, y, z) -> true, x, y, z
    | None -> false, 0, 0, 0
  in
  c_vm_vec_delta_ang_raw v0x v0y v0z v1x v1y v1z has_f fx fy fz

let c_vm_matrix_x_matrix m0 m1 =
  let r0x, r0y, r0z, u0x, u0y, u0z, f0x, f0y, f0z = flat_of_mat3 m0 in
  let r1x, r1y, r1z, u1x, u1y, u1z, f1x, f1y, f1z = flat_of_mat3 m1 in
  mat3_of_flat
    (c_vm_matrix_x_matrix_raw
       r0x
       r0y
       r0z
       u0x
       u0y
       u0z
       f0x
       f0y
       f0z
       r1x
       r1y
       r1z
       u1x
       u1y
       u1z
       f1x
       f1y
       f1z)

let i2f_cases = [ -10; -1; 0; 1; 10; 1234 ]
let f2i_cases = [ -655360; -65536; -1; 0; 1; 65535; 65536; 131072; 12345678 ]

let mul_cases =
  [
    (0x10000, 0x10000);
    (0x20000, 0x8000);
    (-0x10000, 0x10000);
    (0x199A, 0xA0000);
    (12345, 67890);
    (-12345, 67890);
  ]

let div_cases =
  [
    (0x10000, 0x10000);
    (0x20000, 0x8000);
    (-0x10000, 0x10000);
    (0xA0000, 0x199A);
    (12345678, 321);
    (0x10000, 0);
  ]

let muldiv_cases =
  [
    (0x10000, 0x10000, 0x10000);
    (0x20000, 0x8000, 0x10000);
    (-0x10000, 0x10000, 0x10000);
    (12345, 67890, 321);
    (12345, 67890, 0);
  ]

let long_sqrt_cases =
  [
    Int32.to_int_exn Int32.min_value;
    -1;
    0;
    1;
    2;
    3;
    4;
    255;
    256;
    257;
    2147395600;
    Int32.to_int_exn Int32.max_value;
  ]

let quad_sqrt_cases =
  [
    Int64.min_value;
    -1L;
    0L;
    1L;
    2L;
    3L;
    4L;
    255L;
    256L;
    257L;
    Int64.of_int 2147395600;
    Int64.of_int (Int32.to_int_exn Int32.max_value);
    Int64.succ (Int64.of_int (Int32.to_int_exn Int32.max_value));
    9223372030926249001L;
    Int64.max_value;
  ]

let fixquadadjust_cases =
  [
    Int64.min_value;
    -9223372030926249001L;
    Int64.shift_left (Int64.of_int 1) 47;
    Int64.shift_left (Int64.neg (Int64.of_int 1)) 47;
    Int64.shift_left (Int64.of_int 1) 31;
    Int64.shift_left (Int64.neg (Int64.of_int 1)) 31;
    -1L;
    0L;
    1L;
    65535L;
    65536L;
    Int64.shift_left (Int64.of_int 2147483647) 16;
    Int64.shift_left (Int64.of_int (-2147483647)) 16;
    9223372030926249001L;
    Int64.max_value;
  ]

let fixmulaccum_cases =
  [
    (0L, 0, 0);
    (0L, 65536, 65536);
    (1234567890123L, -12345, 67890);
    (-1234567890123L, Int32.to_int_exn Int32.max_value, 1);
    (Int64.of_int 9000000000000000, 1000000, -1000000);
  ]

let fixdivquadlong_cases =
  [
    (0L, 1);
    (1L, 1);
    (-1L, 1);
    (9223372036854775807L, -1);
    (-9223372036854775807L, 2);
    (1234567890123456789L, 65536);
    (-1234567890123456789L, 65536);
    (12345L, 0);
  ]

let fixquadnegate_cases =
  [
    (0, 0);
    (1, 0);
    (-1, 0);
    (Int32.to_int_exn Int32.max_value, 1);
    (Int32.to_int_exn Int32.min_value, -1);
    (123456789, -987654321);
  ]

let ufixdivquadlong_cases =
  [
    (0, 0, 1);
    (1, 0, 1);
    (-1, 0, 1);
    (0, -1, 2);
    (12345, 67890, 321);
    (Int32.to_int_exn Int32.max_value, Int32.to_int_exn Int32.max_value, 65536);
    (-1, -1, -1);
  ]

let fix_sqrt_cases =
  [ -1; 0; 1; 2; 255; 256; 257; 65536; 262144; 2147395600; Int32.to_int_exn Int32.max_value ]

let fix_isqrt_cases =
  [ 0; 1; 2; 255; 256; 257; 65536; 262144; 2147395600; Int32.to_int_exn Int32.max_value ]

let fix_sincos_cases =
  [
    Int32.to_int_exn Int32.min_value;
    -0x10000;
    -0x8000;
    -257;
    -256;
    -255;
    -1;
    0;
    1;
    255;
    256;
    257;
    0x4000;
    0x8000;
    0xFFFF;
    0x10000;
    Int32.to_int_exn Int32.max_value;
  ]

let fix_fastsincos_cases =
  [
    Int32.to_int_exn Int32.min_value;
    -0x10000;
    -0x8000;
    -1;
    0;
    1;
    0x3FFF;
    0x4000;
    0x7FFF;
    0x8000;
    0xFFFF;
    0x10000;
    Int32.to_int_exn Int32.max_value;
  ]

let fix_acos_cases =
  [
    Int32.to_int_exn Int32.min_value;
    -0x10000;
    -0x8000;
    -1;
    0;
    1;
    0x7FFF;
    0x8000;
    0xFFFF;
    0x10000;
    Int32.to_int_exn Int32.max_value;
  ]

let fix_asin_cases =
  [
    Int32.to_int_exn Int32.min_value;
    -0x10000;
    -0x8000;
    -1;
    0;
    1;
    0x7FFF;
    0x8000;
    0xFFFF;
    0x10000;
    Int32.to_int_exn Int32.max_value;
  ]

let fix_atan2_cases =
  [
    (0x10000, 0);
    (0, 0x10000);
    (-0x10000, 0);
    (0, -0x10000);
    (0x10000, 0x10000);
    (0x10000, -0x10000);
    (0, 0);
    (12345, -54321);
    (Int32.to_int_exn Int32.max_value, Int32.to_int_exn Int32.min_value);
    (Int32.to_int_exn Int32.min_value, Int32.to_int_exn Int32.max_value);
  ]

let vm_vec_scale_add2_cases =
  [
    ((0, 0, 0), (0, 0, 0), 0);
    ((0x10000, 0x20000, -0x10000), (0x10000, -0x10000, 0x8000), 0x10000);
    ((12345, -54321, 99999), (67890, 13579, -24680), 321);
    ((Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value), (1, -1, 2), 0x10000);
  ]

let vm_vec_scale_add_cases =
  [
    ((0, 0, 0), (0, 0, 0), 0);
    ((0x10000, 0x20000, -0x10000), (0x10000, -0x10000, 0x8000), 0x10000);
    ((12345, -54321, 99999), (67890, 13579, -24680), 321);
    ((Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value), (1, -1, 2), 0x10000);
  ]

let vm_vec_scale2_cases =
  [
    ((0, 0, 0), 0x10000, 0x10000);
    ((0x10000, 0x20000, -0x10000), 0x20000, 0x10000);
    ((12345, -54321, 99999), 67890, 321);
    ((12345, -54321, 99999), 67890, 0);
    ((Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value), 0x10000, 0x8000);
  ]

let vm_vec_add_cases =
  [
    ((0, 0, 0), (0, 0, 0));
    ((0x10000, 0x20000, -0x10000), (0x10000, -0x10000, 0x8000));
    ((12345, -54321, 99999), (67890, 13579, -24680));
    ((Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value), (1, -1, 2));
  ]

let vm_vec_sub_cases =
  [
    ((0, 0, 0), (0, 0, 0));
    ((0x10000, 0x20000, -0x10000), (0x10000, -0x10000, 0x8000));
    ((12345, -54321, 99999), (67890, 13579, -24680));
    ((Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value), (1, -1, 2));
  ]

let vm_vec_add2_cases =
  [
    ((0, 0, 0), (0, 0, 0));
    ((0x10000, 0x20000, -0x10000), (0x10000, -0x10000, 0x8000));
    ((12345, -54321, 99999), (67890, 13579, -24680));
    ((Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value), (1, -1, 2));
  ]

let vm_vec_sub2_cases =
  [
    ((0, 0, 0), (0, 0, 0));
    ((0x10000, 0x20000, -0x10000), (0x10000, -0x10000, 0x8000));
    ((12345, -54321, 99999), (67890, 13579, -24680));
    ((Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value), (1, -1, 2));
  ]

let vm_vec_avg_cases =
  [
    ((0, 0, 0), (0, 0, 0));
    ((0x10000, 0x20000, -0x10000), (0x10000, -0x10000, 0x8000));
    ((12345, -54321, 99999), (67890, 13579, -24680));
    ((Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value), (1, -1, 2));
  ]

let vm_vec_avg4_cases =
  [
    ((0, 0, 0), (0, 0, 0), (0, 0, 0), (0, 0, 0));
    ((0x10000, 0x20000, -0x10000), (0x10000, -0x10000, 0x8000), (12345, -54321, 99999), (67890, 13579, -24680));
    ((Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value), (1, -1, 2), (-1, 1, -2), (7, -7, 14));
  ]

let vm_vec_copy_scale_cases =
  [
    ((0, 0, 0), 0);
    ((0x10000, 0x20000, -0x10000), 0x10000);
    ((12345, -54321, 99999), 321);
    ((Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value), 0x10000);
  ]

let vm_vec_scale_cases =
  [
    ((0, 0, 0), 0);
    ((0x10000, 0x20000, -0x10000), 0x10000);
    ((12345, -54321, 99999), 321);
    ((Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value), 0x10000);
  ]

let vm_vec_mag_cases =
  [
    (0, 0, 0);
    (0x10000, 0x20000, -0x10000);
    (12345, -54321, 99999);
    (0x3fffffff, -0x3fffffff, 0);
  ]

let vm_vec_mag_quick_cases =
  [
    (0, 0, 0);
    (0x10000, 0x20000, -0x10000);
    (12345, -54321, 99999);
    (Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value);
  ]

let vm_vec_dist_cases =
  [
    ((0, 0, 0), (0, 0, 0));
    ((0x10000, 0x20000, -0x10000), (0x10000, -0x10000, 0x8000));
    ((12345, -54321, 99999), (67890, 13579, -24680));
    ((0x3fffffff, -0x3fffffff, 0), (-0x3fffffff, 0x3fffffff, 1));
  ]

let vm_vec_dist_quick_cases =
  [
    ((0, 0, 0), (0, 0, 0));
    ((0x10000, 0x20000, -0x10000), (0x10000, -0x10000, 0x8000));
    ((12345, -54321, 99999), (67890, 13579, -24680));
    ((Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value), (1, -1, 2));
  ]

let vm_vec_dotprod_cases =
  [
    ((0, 0, 0), (0, 0, 0));
    ((0x10000, 0x20000, -0x10000), (0x10000, -0x10000, 0x8000));
    ((12345, -54321, 99999), (67890, 13579, -24680));
    ((Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value), (1, -1, 2));
  ]

let vm_vec_dot3_cases =
  [
    ((0, 0, 0), (0, 0, 0));
    ((0x10000, 0x20000, -0x10000), (0x10000, -0x10000, 0x8000));
    ((12345, -54321, 99999), (67890, 13579, -24680));
    ((Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value), (1, -1, 2));
  ]

let vm_vec_crossprod_cases =
  [
    ((0, 0, 0), (0, 0, 0));
    ((0x10000, 0x20000, -0x10000), (0x10000, -0x10000, 0x8000));
    ((12345, -54321, 99999), (67890, 13579, -24680));
    ((Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value), (1, -1, 2));
  ]

let vm_vec_copy_normalize_cases =
  [
    (0, 0, 0);
    (0x10000, 0x20000, -0x10000);
    (12345, -54321, 99999);
    (0x3fffffff, -0x3fffffff, 0);
  ]

let vm_vec_normalize_cases = vm_vec_copy_normalize_cases

let vm_vec_normalized_dir_cases =
  [
    ((0, 0, 0), (0, 0, 0));
    ((0x10000, 0x20000, -0x10000), (0x10000, -0x10000, 0x8000));
    ((12345, -54321, 99999), (67890, 13579, -24680));
    ((0x3fffffff, -0x3fffffff, 0), (-0x3fffffff, 0x3fffffff, 1));
  ]

let vm_vec_copy_normalize_quick_cases =
  [
    (0, 0, 0);
    (0x10000, 0x20000, -0x10000);
    (12345, -54321, 99999);
    (Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value);
  ]

let vm_vec_normalize_quick_cases = vm_vec_copy_normalize_quick_cases

let vm_vec_normalized_dir_quick_cases =
  [
    ((0, 0, 0), (0, 0, 0));
    ((0x10000, 0x20000, -0x10000), (0x10000, -0x10000, 0x8000));
    ((12345, -54321, 99999), (67890, 13579, -24680));
    ((Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value), (1, -1, 2));
  ]

let vm_vec_make_cases =
  [
    (0, 0, 0);
    (0x10000, 0x20000, -0x10000);
    (12345, -54321, 99999);
    (Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value);
  ]

let vm_check_vec_cases =
  [
    (0, 0, 0);
    (1, 2, 3);
    (0x7fff, -0x7fff, 0x4000);
    (0x100000, 0x200000, -0x300000);
    (0x3fffffff, -0x3fffffff, 0x1234567);
  ]

let vm_angvec_make_cases =
  [
    (0, 0, 0);
    (32767, -32768, 12345);
    (40000, -40000, 65535);
    (Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value);
  ]

let vm_dist_to_plane_cases =
  [
    ((0, 0, 0), (0, 0, 0), (0, 0, 0));
    ((0x10000, 0x20000, -0x10000), (0x10000, -0x10000, 0x8000), (0x10000, 0x10000, 0x10000));
    ((12345, -54321, 99999), (67890, 13579, -24680), (-11111, 22222, -33333));
    ((Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value), (1, -1, 2), (7, -7, 14));
  ]

let vm_vec_perp_cases =
  [
    ((0, 0, 0), (0, 0, 0), (0, 0, 0));
    ((0x10000, 0x20000, -0x10000), (0x10000, -0x10000, 0x8000), (0x30000, 0x10000, 0x20000));
    ((12345, -54321, 99999), (67890, 13579, -24680), (-11111, 22222, -33333));
    ((Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn (Int32.succ Int32.min_value)), (1, -1, 2), (7, -7, 14));
  ]

let vm_vec_normal_cases = vm_vec_perp_cases

let vm_vec_delta_ang_cases =
  [
    ((0x10000, 0, 0), (0x10000, 0, 0), None);
    ((0x10000, 0, 0), (0, 0x10000, 0), None);
    ((0x10000, 0, 0), (0, 0x10000, 0), Some (0, 0, 0x10000));
    ((0x10000, 0, 0), (0, 0x10000, 0), Some (0, 0, -0x10000));
    ((0, 0, 0), (0x10000, 0, 0), Some (0, 0, 0x10000));
    ((12345, -54321, 99999), (67890, 13579, -24680), Some (-11111, 22222, -33333));
    ((Int32.to_int_exn Int32.max_value, 1, Int32.to_int_exn Int32.min_value), (1, -1, 2), None);
  ]

let mat_identity = ((0x10000, 0, 0), (0, 0x10000, 0), (0, 0, 0x10000))

let mat_sample =
  ( (12345, -54321, 99999)
  , (67890, 13579, -24680)
  , (-11111, 22222, -33333) )

let mat_extreme =
  ( (Int32.to_int_exn Int32.max_value, 1, 2)
  , (-3, Int32.to_int_exn Int32.min_value, 4)
  , (5, -6, 7) )

let vm_vec_rotate_cases =
  [
    ((0, 0, 0), mat_identity);
    ((0x10000, 0x20000, -0x10000), mat_identity);
    ((12345, -54321, 99999), mat_sample);
    ((Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value), mat_extreme);
  ]

let vm_matrix_cases = [ mat_identity; mat_sample; mat_extreme ]

let vm_matrix_x_matrix_cases =
  [
    (mat_identity, mat_identity);
    (mat_identity, mat_sample);
    (mat_sample, mat_identity);
    (mat_sample, mat_extreme);
    (mat_extreme, mat_sample);
    (mat_extreme, mat_extreme);
  ]

let vm_vector_2_matrix_cases =
  [
    ((0x10000, 0, 0), None, None);
    ((0, 0x10000, 0), None, None);
    ((0, 0, 0), None, None);
    ((0x10000, 0x2000, 0x3000), Some (0, 0x10000, 0), None);
    ((0x10000, 0x2000, 0x3000), None, Some (0x10000, 0, 0));
    ((0x10000, 0x2000, 0x3000), Some (0, 0x10000, 0), Some (0x10000, 0, 0));
    ((0x10000, 0x2000, 0x3000), Some (0, 0, 0), Some (0x10000, 0, 0));
  ]

let vm_vector_2_matrix_norm_cases = vm_vector_2_matrix_cases

let sincos_2_matrix_cases =
  [
    (0, 0x10000, 0, 0x10000, 0, 0x10000);
    (0x2000, 0xFF00, 0x1000, 0xF000, 0x0800, 0xF800);
    (12345, -54321, 22222, -33333, 44444, -55555);
    (Int32.to_int_exn Int32.max_value, 0x10000, Int32.to_int_exn Int32.min_value, 0x8000, -0x10000, 0x20000);
  ]

let vm_angles_2_matrix_cases =
  [
    (0, 0, 0);
    (0x1000, 0x2000, 0x3000);
    (-0x4000, 0x7FFF, -0x7FFF);
    (40000, -40000, 65535);
    (Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value);
  ]

let vm_vec_ang_2_matrix_cases =
  [
    ((0x10000, 0, 0), 0);
    ((0x2000, -0x4000, 0x7000), 0x1200);
    ((12345, -54321, 99999), -12345);
    ((Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value), 32767);
    ((-0x10000, 0x10000, 0x10000), -32768);
  ]

let vm_extract_angles_vector_normalized_cases =
  [
    (0x10000, 0, 0);
    (0, 0x10000, 0);
    (0, -0x10000, 0);
    (0, 0, 0x10000);
    (46340, 0, 46340);
    (12345, -54321, 99999);
    (Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value);
  ]

let vm_extract_angles_vector_cases =
  [
    ((0, 0, 0), (0, 0, 0));
    ((111, 222, 333), (0, 0, 0));
    ((0, 0, 0), (0x10000, 0, 0));
    ((-123, 456, -789), (0, 0x10000, 0));
    ((Int32.to_int_exn Int32.max_value, 17, Int32.to_int_exn Int32.min_value), (12345, -54321, 99999));
  ]

let vm_extract_angles_matrix_cases =
  [ mat_identity; mat_sample; mat_extreme; Ox_math.vm_angles_2_matrix (0x1000, 0x2000, 0x3000) ]

let edge_fix_values =
  [
    Int32.to_int_exn Int32.min_value;
    Int32.to_int_exn Int32.max_value;
    -0x4000_0000;
    -0x10000;
    -1;
    0;
    1;
    0x7FFF;
    0x8000;
    0xFFFF;
    0x10000;
    0x20000;
    0x4000_0000;
  ]

let fix_gen =
  Quickcheck.Generator.weighted_union
    [
      (3.0, Quickcheck.Generator.of_list edge_fix_values);
      (7.0, Quickcheck.Generator.map Int32.quickcheck_generator ~f:Int32.to_int_exn);
    ]

let fix_nonneg_gen =
  Quickcheck.Generator.weighted_union
    [
      (3.0, Quickcheck.Generator.of_list fix_isqrt_cases);
      (7.0, Quickcheck.Generator.map Int32.quickcheck_generator ~f:(fun v -> Int.max 0 (Int32.to_int_exn v)));
    ]

let int64_edge_values =
  [ Int64.min_value; Int64.max_value; -1L; 0L; 1L; Int64.of_int Int.min_value; Int64.of_int Int.max_value ]

let int64_gen =
  let from_halves hi lo =
    let hi64 = Int64.shift_left (Int64.of_int32 hi) 32 in
    let lo64 = Int64.bit_and (Int64.of_int32 lo) 0xFFFF_FFFFL in
    Int64.bit_or hi64 lo64
  in
  Quickcheck.Generator.weighted_union
    [
      (3.0, Quickcheck.Generator.of_list int64_edge_values);
      (7.0, Quickcheck.Generator.map (Quickcheck.Generator.both Int32.quickcheck_generator Int32.quickcheck_generator) ~f:(fun (hi, lo) -> from_halves hi lo));
    ]

let clamp_fixmulaccum_q q = Int.max (-9_000_000_000_000_000) (Int.min 9_000_000_000_000_000 q)

let fixmulaccum_q_gen =
  Quickcheck.Generator.map Int.quickcheck_generator ~f:(fun q -> Int64.of_int (clamp_fixmulaccum_q q))

let small_fix_gen =
  Quickcheck.Generator.map Int.quickcheck_generator ~f:(fun q -> Int.max (-1_000_000) (Int.min 1_000_000 q))

let random_values ~seed ~test_count gen =
  Quickcheck.random_sequence ~seed:(`Deterministic seed) gen |> fun seq -> Sequence.take seq test_count

let vec3_gen =
  Quickcheck.Generator.map
    (Quickcheck.Generator.both fix_gen (Quickcheck.Generator.both fix_gen fix_gen))
    ~f:(fun (x, (y, z)) -> (x, y, z))

let vec3_option_gen =
  Quickcheck.Generator.weighted_union
    [ (1.0, Quickcheck.Generator.return None); (3.0, Quickcheck.Generator.map vec3_gen ~f:Option.some) ]

let mat3_gen =
  Quickcheck.Generator.map
    (Quickcheck.Generator.both vec3_gen (Quickcheck.Generator.both vec3_gen vec3_gen))
    ~f:(fun (rvec, (uvec, fvec)) -> (rvec, uvec, fvec))

let clamp_mag_safe v = Int.max (-0x3fffffff) (Int.min 0x3fffffff v)

let fix_mag_safe_gen =
  Quickcheck.Generator.weighted_union
    [
      (3.0, Quickcheck.Generator.of_list [ -0x3fffffff; -0x10000; -1; 0; 1; 0x10000; 0x3fffffff ]);
      (7.0, Quickcheck.Generator.map Int32.quickcheck_generator ~f:(fun v -> clamp_mag_safe (Int32.to_int_exn v)));
    ]

let vec3_mag_safe_gen =
  Quickcheck.Generator.map
    (Quickcheck.Generator.both fix_mag_safe_gen (Quickcheck.Generator.both fix_mag_safe_gen fix_mag_safe_gen))
    ~f:(fun (x, (y, z)) -> (x, y, z))

let vec3_option_mag_safe_gen =
  Quickcheck.Generator.weighted_union
    [
      (1.0, Quickcheck.Generator.return None);
      (3.0, Quickcheck.Generator.map vec3_mag_safe_gen ~f:Option.some);
    ]

let vec3_with_optional_axes_gen =
  Quickcheck.Generator.map
    (Quickcheck.Generator.both
       vec3_mag_safe_gen
       (Quickcheck.Generator.both vec3_option_mag_safe_gen vec3_option_mag_safe_gen))
    ~f:(fun (fvec, (uvec, rvec)) -> (fvec, uvec, rvec))

let run_random_unop_with_gen ~name ~seed ~test_count ~gen c_impl ox_impl =
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count gen
  |> Sequence.iter ~f:(fun a ->
         incr total;
         let c = c_impl a in
         let ox = ox_impl a in
         if not (Int.equal c ox)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then first_mismatch := Some (sprintf "%s a=%d c=%d ox=%d" name a c ox)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let run_random_unop ~name ~seed ~test_count c_impl ox_impl =
  run_random_unop_with_gen ~name ~seed ~test_count ~gen:fix_gen c_impl ox_impl

let run_random_unop_i64 ~name ~seed ~test_count c_impl ox_impl =
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count int64_gen
  |> Sequence.iter ~f:(fun q ->
         incr total;
         let c = c_impl q in
         let ox = ox_impl q in
         if not (Int.equal c ox)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some
                  (sprintf
                     "%s q=%s c=%d ox=%d"
                     name
                     (Int64.to_string q)
                     c
                     ox)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let run_random_binop_i64_int_with_gen ~name ~seed ~test_count ~gen c_impl ox_impl =
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count gen
  |> Sequence.iter ~f:(fun (n, d) ->
         incr total;
         let c = c_impl n d in
         let ox = ox_impl n d in
         if not (Int.equal c ox)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some
                  (sprintf
                     "%s n=%s d=%d c=%d ox=%d"
                     name
                     (Int64.to_string n)
                     d
                     c
                     ox)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let run_random_ternop_i64_out_with_gen ~name ~seed ~test_count ~gen c_impl ox_impl =
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count gen
  |> Sequence.iter ~f:(fun (q, a, b) ->
         incr total;
         let c = c_impl q a b in
         let ox = ox_impl q a b in
         if not (Int64.equal c ox)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some
                  (sprintf
                     "%s q=%s a=%d b=%d c=%s ox=%s"
                     name
                     (Int64.to_string q)
                     a
                     b
                     (Int64.to_string c)
                     (Int64.to_string ox))));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let run_random_unop_pair ~name ~seed ~test_count c_impl ox_impl =
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count fix_gen
  |> Sequence.iter ~f:(fun a ->
         incr total;
         let c_s, c_c = c_impl a in
         let ox_s, ox_c = ox_impl a in
         if not (Int.equal c_s ox_s && Int.equal c_c ox_c)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some
                  (sprintf
                     "%s a=%d c=(%d,%d) ox=(%d,%d)"
                     name
                     a
                     c_s
                     c_c
                     ox_s
                     ox_c)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let run_random_binop ~name ~seed ~test_count c_impl ox_impl =
  let gen = Quickcheck.Generator.both fix_gen fix_gen in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count gen
  |> Sequence.iter ~f:(fun (a, b) ->
         incr total;
         let c = c_impl a b in
         let ox = ox_impl a b in
         if not (Int.equal c ox)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then first_mismatch := Some (sprintf "%s a=%d b=%d c=%d ox=%d" name a b c ox)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let run_random_binop_pair ~name ~seed ~test_count c_impl ox_impl =
  let gen = Quickcheck.Generator.both fix_gen fix_gen in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count gen
  |> Sequence.iter ~f:(fun (a, b) ->
         incr total;
         let c_x, c_y = c_impl a b in
         let ox_x, ox_y = ox_impl a b in
         if not (Int.equal c_x ox_x && Int.equal c_y ox_y)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some
                  (sprintf
                     "%s a=%d b=%d c=(%d,%d) ox=(%d,%d)"
                     name
                     a
                     b
                     c_x
                     c_y
                     ox_x
                     ox_y)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let run_random_ternop ~name ~seed ~test_count c_impl ox_impl =
  let gen =
    Quickcheck.Generator.map
      (Quickcheck.Generator.both fix_gen (Quickcheck.Generator.both fix_gen fix_gen))
      ~f:(fun (a, (b, c_arg)) -> (a, b, c_arg))
  in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count gen
  |> Sequence.iter ~f:(fun (a, b, c_arg) ->
         incr total;
         let c = c_impl a b c_arg in
         let ox = ox_impl a b c_arg in
         if not (Int.equal c ox)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some (sprintf "%s a=%d b=%d c=%d c_out=%d ox=%d" name a b c_arg c ox)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let run_random_stateful_vec3 ~name ~seed ~test_count c_impl ox_impl =
  let gen =
    Quickcheck.Generator.map
      (Quickcheck.Generator.both vec3_gen (Quickcheck.Generator.both vec3_gen fix_gen))
      ~f:(fun (dest, (src, k)) -> dest, src, k)
  in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count gen
  |> Sequence.iter ~f:(fun ((dx, dy, dz), (sx, sy, sz), k) ->
         incr total;
         let c_dx, c_dy, c_dz = c_impl dx dy dz sx sy sz k in
         let ox_dx, ox_dy, ox_dz = ox_impl (dx, dy, dz) (sx, sy, sz) k in
         if not (Int.equal c_dx ox_dx && Int.equal c_dy ox_dy && Int.equal c_dz ox_dz)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some
                  (sprintf
                     "%s d=(%d,%d,%d) s=(%d,%d,%d) k=%d c=(%d,%d,%d) ox=(%d,%d,%d)"
                     name
                     dx
                     dy
                     dz
                     sx
                     sy
                     sz
                     k
                     c_dx
                     c_dy
                     c_dz
                     ox_dx
                     ox_dy
                     ox_dz)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let run_random_vec3_bin_scale ~name ~seed ~test_count c_impl ox_impl =
  let gen =
    Quickcheck.Generator.map
      (Quickcheck.Generator.both vec3_gen (Quickcheck.Generator.both vec3_gen fix_gen))
      ~f:(fun (a, (b, k)) -> a, b, k)
  in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count gen
  |> Sequence.iter ~f:(fun ((ax, ay, az), (bx, by, bz), k) ->
         incr total;
         let c_x, c_y, c_z = c_impl ax ay az bx by bz k in
         let ox_x, ox_y, ox_z = ox_impl (ax, ay, az) (bx, by, bz) k in
         if not (Int.equal c_x ox_x && Int.equal c_y ox_y && Int.equal c_z ox_z)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some
                  (sprintf
                     "%s a=(%d,%d,%d) b=(%d,%d,%d) k=%d c=(%d,%d,%d) ox=(%d,%d,%d)"
                     name
                     ax
                     ay
                     az
                     bx
                     by
                     bz
                     k
                     c_x
                     c_y
                     c_z
                     ox_x
                     ox_y
                     ox_z)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let run_random_stateful_vec3_scale2 ~name ~seed ~test_count c_impl ox_impl =
  let gen =
    Quickcheck.Generator.map
      (Quickcheck.Generator.both vec3_gen (Quickcheck.Generator.both fix_gen fix_gen))
      ~f:(fun (dest, (n, d)) -> dest, n, d)
  in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count gen
  |> Sequence.iter ~f:(fun ((dx, dy, dz), n, d) ->
         incr total;
         let c_x, c_y, c_z = c_impl dx dy dz n d in
         let ox_x, ox_y, ox_z = ox_impl (dx, dy, dz) n d in
         if not (Int.equal c_x ox_x && Int.equal c_y ox_y && Int.equal c_z ox_z)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some
                  (sprintf
                     "%s d=(%d,%d,%d) n=%d d=%d c=(%d,%d,%d) ox=(%d,%d,%d)"
                     name
                     dx
                     dy
                     dz
                     n
                     d
                     c_x
                     c_y
                     c_z
                     ox_x
                     ox_y
                     ox_z)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let run_random_vec3_binop ~name ~seed ~test_count c_impl ox_impl =
  let gen = Quickcheck.Generator.both vec3_gen vec3_gen in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count gen
  |> Sequence.iter ~f:(fun ((ax, ay, az), (bx, by, bz)) ->
         incr total;
         let c_x, c_y, c_z = c_impl ax ay az bx by bz in
         let ox_x, ox_y, ox_z = ox_impl (ax, ay, az) (bx, by, bz) in
         if not (Int.equal c_x ox_x && Int.equal c_y ox_y && Int.equal c_z ox_z)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some
                  (sprintf
                     "%s a=(%d,%d,%d) b=(%d,%d,%d) c=(%d,%d,%d) ox=(%d,%d,%d)"
                     name
                     ax
                     ay
                     az
                     bx
                     by
                     bz
                     c_x
                     c_y
                     c_z
                     ox_x
                     ox_y
                     ox_z)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let run_random_stateful_vec3_add2 ~name ~seed ~test_count c_impl ox_impl =
  let gen = Quickcheck.Generator.both vec3_gen vec3_gen in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count gen
  |> Sequence.iter ~f:(fun ((dx, dy, dz), (sx, sy, sz)) ->
         incr total;
         let c_x, c_y, c_z = c_impl dx dy dz sx sy sz in
         let ox_x, ox_y, ox_z = ox_impl (dx, dy, dz) (sx, sy, sz) in
         if not (Int.equal c_x ox_x && Int.equal c_y ox_y && Int.equal c_z ox_z)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some
                  (sprintf
                     "%s d=(%d,%d,%d) s=(%d,%d,%d) c=(%d,%d,%d) ox=(%d,%d,%d)"
                     name
                     dx
                     dy
                     dz
                     sx
                     sy
                     sz
                     c_x
                     c_y
                     c_z
                     ox_x
                     ox_y
                     ox_z)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let check_vec3_avg4 name c_impl ox_impl cases =
  List.iter cases ~f:(fun ((a1, a2, a3), (b1, b2, b3), (c1, c2, c3), (d1, d2, d3)) ->
      let c_x, c_y, c_z = c_impl a1 a2 a3 b1 b2 b3 c1 c2 c3 d1 d2 d3 in
      let ox_x, ox_y, ox_z = ox_impl (a1, a2, a3) (b1, b2, b3) (c1, c2, c3) (d1, d2, d3) in
      printf
        "%s a=(%d,%d,%d) b=(%d,%d,%d) c=(%d,%d,%d) d=(%d,%d,%d) out=(%d,%d,%d) ox=(%d,%d,%d) eq=%b\n"
        name
        a1
        a2
        a3
        b1
        b2
        b3
        c1
        c2
        c3
        d1
        d2
        d3
        c_x
        c_y
        c_z
        ox_x
        ox_y
        ox_z
        (Int.equal c_x ox_x && Int.equal c_y ox_y && Int.equal c_z ox_z))

let run_random_vec3_avg4 ~name ~seed ~test_count c_impl ox_impl =
  let gen =
    Quickcheck.Generator.map
      (Quickcheck.Generator.both vec3_gen (Quickcheck.Generator.both vec3_gen (Quickcheck.Generator.both vec3_gen vec3_gen)))
      ~f:(fun (a, (b, (c, d))) -> a, b, c, d)
  in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count gen
  |> Sequence.iter ~f:(fun ((a1, a2, a3), (b1, b2, b3), (c1, c2, c3), (d1, d2, d3)) ->
         incr total;
         let c_x, c_y, c_z = c_impl a1 a2 a3 b1 b2 b3 c1 c2 c3 d1 d2 d3 in
         let ox_x, ox_y, ox_z = ox_impl (a1, a2, a3) (b1, b2, b3) (c1, c2, c3) (d1, d2, d3) in
         if not (Int.equal c_x ox_x && Int.equal c_y ox_y && Int.equal c_z ox_z)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some
                  (sprintf
                     "%s a=(%d,%d,%d) b=(%d,%d,%d) c=(%d,%d,%d) d=(%d,%d,%d) out=(%d,%d,%d) ox=(%d,%d,%d)"
                     name
                     a1
                     a2
                     a3
                     b1
                     b2
                     b3
                     c1
                     c2
                     c3
                     d1
                     d2
                     d3
                     c_x
                     c_y
                     c_z
                     ox_x
                     ox_y
                     ox_z)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let run_random_vec3_scale ~name ~seed ~test_count c_impl ox_impl =
  let gen = Quickcheck.Generator.both vec3_gen fix_gen in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count gen
  |> Sequence.iter ~f:(fun ((sx, sy, sz), k) ->
         incr total;
         let c_x, c_y, c_z = c_impl sx sy sz k in
         let ox_x, ox_y, ox_z = ox_impl (sx, sy, sz) k in
         if not (Int.equal c_x ox_x && Int.equal c_y ox_y && Int.equal c_z ox_z)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some
                  (sprintf
                     "%s s=(%d,%d,%d) k=%d out=(%d,%d,%d) ox=(%d,%d,%d)"
                     name
                     sx
                     sy
                     sz
                     k
                     c_x
                     c_y
                     c_z
                     ox_x
                     ox_y
                     ox_z)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let check_vec3_to_scalar name c_impl ox_impl cases =
  List.iter cases ~f:(fun (x, y, z) ->
      let c = c_impl x y z in
      let ox = ox_impl (x, y, z) in
      printf "%s v=(%d,%d,%d) c=%d ox=%d eq=%b\n" name x y z c ox (Int.equal c ox))

let run_random_vec3_to_scalar_with_gen ~name ~seed ~test_count ~gen c_impl ox_impl =
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count gen
  |> Sequence.iter ~f:(fun (x, y, z) ->
         incr total;
         let c = c_impl x y z in
         let ox = ox_impl (x, y, z) in
         if not (Int.equal c ox)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then first_mismatch := Some (sprintf "%s v=(%d,%d,%d) c=%d ox=%d" name x y z c ox)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let run_random_vec3_to_scalar ~name ~seed ~test_count c_impl ox_impl =
  run_random_vec3_to_scalar_with_gen ~name ~seed ~test_count ~gen:vec3_gen c_impl ox_impl

let check_two_vec3_to_scalar name c_impl ox_impl cases =
  List.iter cases ~f:(fun ((x0, y0, z0), (x1, y1, z1)) ->
      let c = c_impl x0 y0 z0 x1 y1 z1 in
      let ox = ox_impl (x0, y0, z0) (x1, y1, z1) in
      printf
        "%s v0=(%d,%d,%d) v1=(%d,%d,%d) c=%d ox=%d eq=%b\n"
        name
        x0
        y0
        z0
        x1
        y1
        z1
        c
        ox
        (Int.equal c ox))

let run_random_two_vec3_to_scalar_with_gen ~name ~seed ~test_count ~gen c_impl ox_impl =
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count gen
  |> Sequence.iter ~f:(fun ((x0, y0, z0), (x1, y1, z1)) ->
         incr total;
         let c = c_impl x0 y0 z0 x1 y1 z1 in
         let ox = ox_impl (x0, y0, z0) (x1, y1, z1) in
         if not (Int.equal c ox)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some
                  (sprintf
                     "%s v0=(%d,%d,%d) v1=(%d,%d,%d) c=%d ox=%d"
                     name
                     x0
                     y0
                     z0
                     x1
                     y1
                     z1
                     c
                     ox)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let run_random_two_vec3_to_scalar ~name ~seed ~test_count c_impl ox_impl =
  run_random_two_vec3_to_scalar_with_gen
    ~name
    ~seed
    ~test_count
    ~gen:(Quickcheck.Generator.both vec3_gen vec3_gen)
    c_impl
    ox_impl

let check_two_vec3_opt_to_scalar name c_impl ox_impl cases =
  let fmt_opt = function
    | None -> "None"
    | Some (x, y, z) -> sprintf "Some(%d,%d,%d)" x y z
  in
  List.iter cases ~f:(fun ((x0, y0, z0), (x1, y1, z1), fvec) ->
      let c = c_impl (x0, y0, z0) (x1, y1, z1) fvec in
      let ox = ox_impl (x0, y0, z0) (x1, y1, z1) fvec in
      printf
        "%s v0=(%d,%d,%d) v1=(%d,%d,%d) f=%s c=%d ox=%d eq=%b\n"
        name
        x0
        y0
        z0
        x1
        y1
        z1
        (fmt_opt fvec)
        c
        ox
        (Int.equal c ox))

let run_random_two_vec3_opt_to_scalar ~name ~seed ~test_count c_impl ox_impl =
  let gen =
    Quickcheck.Generator.map
      (Quickcheck.Generator.both vec3_gen (Quickcheck.Generator.both vec3_gen vec3_option_gen))
      ~f:(fun (v0, (v1, fvec)) -> (v0, v1, fvec))
  in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count gen
  |> Sequence.iter ~f:(fun (v0, v1, fvec) ->
         incr total;
         let c = c_impl v0 v1 fvec in
         let ox = ox_impl v0 v1 fvec in
         if not (Int.equal c ox)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then first_mismatch := Some (sprintf "%s mismatch" name)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let check_stateful_ang3_from_vec name c_impl ox_impl cases =
  List.iter cases ~f:(fun ((p0, b0, h0), (x, y, z)) ->
      let c_p, c_b, c_h = c_impl (p0, b0, h0) (x, y, z) in
      let ox_p, ox_b, ox_h = ox_impl (p0, b0, h0) (x, y, z) in
      printf
        "%s a0=(%d,%d,%d) v=(%d,%d,%d) c=(%d,%d,%d) ox=(%d,%d,%d) eq=%b\n"
        name
        p0
        b0
        h0
        x
        y
        z
        c_p
        c_b
        c_h
        ox_p
        ox_b
        ox_h
        (Int.equal c_p ox_p && Int.equal c_b ox_b && Int.equal c_h ox_h))

let run_random_stateful_ang3_from_vec ~name ~seed ~test_count c_impl ox_impl =
  let fixang_gen_local =
    Quickcheck.Generator.weighted_union
      [
        (3.0, Quickcheck.Generator.of_list [ -32768; -32767; -1; 0; 1; 32766; 32767 ]);
        (7.0, Quickcheck.Generator.map Int32.quickcheck_generator ~f:Int32.to_int_exn);
      ]
  in
  let ang3_gen_local =
    Quickcheck.Generator.map
      (Quickcheck.Generator.both
         fixang_gen_local
         (Quickcheck.Generator.both fixang_gen_local fixang_gen_local))
      ~f:(fun (x, (y, z)) -> (x, y, z))
  in
  let gen = Quickcheck.Generator.both ang3_gen_local vec3_gen in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count gen
  |> Sequence.iter ~f:(fun (a0, v) ->
         incr total;
         let c_p, c_b, c_h = c_impl a0 v in
         let ox_p, ox_b, ox_h = ox_impl a0 v in
         if not (Int.equal c_p ox_p && Int.equal c_b ox_b && Int.equal c_h ox_h)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then first_mismatch := Some (sprintf "%s mismatch" name)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let check_vec_copy_normalize_quick name c_impl ox_impl cases =
  List.iter cases ~f:(fun (sx, sy, sz) ->
      let c_m, c_x, c_y, c_z = c_impl sx sy sz in
      let ox_m, (ox_x, ox_y, ox_z) = ox_impl (sx, sy, sz) in
      printf
        "%s s=(%d,%d,%d) m=(c:%d ox:%d) out=(c:%d,%d,%d ox:%d,%d,%d) eq=%b\n"
        name
        sx
        sy
        sz
        c_m
        ox_m
        c_x
        c_y
        c_z
        ox_x
        ox_y
        ox_z
        (Int.equal c_m ox_m && Int.equal c_x ox_x && Int.equal c_y ox_y && Int.equal c_z ox_z))

let run_random_vec_copy_normalize_with_gen ~name ~seed ~test_count ~gen c_impl ox_impl =
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count gen
  |> Sequence.iter ~f:(fun (sx, sy, sz) ->
         incr total;
         let c_m, c_x, c_y, c_z = c_impl sx sy sz in
         let ox_m, (ox_x, ox_y, ox_z) = ox_impl (sx, sy, sz) in
         if not (Int.equal c_m ox_m && Int.equal c_x ox_x && Int.equal c_y ox_y && Int.equal c_z ox_z)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some
                  (sprintf
                     "%s s=(%d,%d,%d) m=(c:%d ox:%d) out=(c:%d,%d,%d ox:%d,%d,%d)"
                     name
                     sx
                     sy
                     sz
                     c_m
                     ox_m
                     c_x
                     c_y
                     c_z
                     ox_x
                     ox_y
                     ox_z)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let run_random_vec_copy_normalize_quick ~name ~seed ~test_count c_impl ox_impl =
  run_random_vec_copy_normalize_with_gen ~name ~seed ~test_count ~gen:vec3_gen c_impl ox_impl

let check_vec_normalized_dir_quick name c_impl ox_impl cases =
  List.iter cases ~f:(fun ((ex, ey, ez), (sx, sy, sz)) ->
      let c_m, c_x, c_y, c_z = c_impl ex ey ez sx sy sz in
      let ox_m, (ox_x, ox_y, ox_z) = ox_impl (ex, ey, ez) (sx, sy, sz) in
      printf
        "%s end=(%d,%d,%d) start=(%d,%d,%d) m=(c:%d ox:%d) out=(c:%d,%d,%d ox:%d,%d,%d) eq=%b\n"
        name
        ex
        ey
        ez
        sx
        sy
        sz
        c_m
        ox_m
        c_x
        c_y
        c_z
        ox_x
        ox_y
        ox_z
        (Int.equal c_m ox_m && Int.equal c_x ox_x && Int.equal c_y ox_y && Int.equal c_z ox_z))

let run_random_vec_normalized_dir_with_gen ~name ~seed ~test_count ~gen c_impl ox_impl =
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count gen
  |> Sequence.iter ~f:(fun ((ex, ey, ez), (sx, sy, sz)) ->
         incr total;
         let c_m, c_x, c_y, c_z = c_impl ex ey ez sx sy sz in
         let ox_m, (ox_x, ox_y, ox_z) = ox_impl (ex, ey, ez) (sx, sy, sz) in
         if not (Int.equal c_m ox_m && Int.equal c_x ox_x && Int.equal c_y ox_y && Int.equal c_z ox_z)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some
                  (sprintf
                     "%s end=(%d,%d,%d) start=(%d,%d,%d) m=(c:%d ox:%d) out=(c:%d,%d,%d ox:%d,%d,%d)"
                     name
                     ex
                     ey
                     ez
                     sx
                     sy
                     sz
                     c_m
                     ox_m
                     c_x
                     c_y
                     c_z
                     ox_x
                     ox_y
                     ox_z)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let run_random_vec_normalized_dir_quick ~name ~seed ~test_count c_impl ox_impl =
  run_random_vec_normalized_dir_with_gen
    ~name
    ~seed
    ~test_count
    ~gen:(Quickcheck.Generator.both vec3_gen vec3_gen)
    c_impl
    ox_impl

let check_make3 name c_impl ox_impl cases =
  List.iter cases ~f:(fun (x, y, z) ->
      let c_x, c_y, c_z = c_impl x y z in
      let ox_x, ox_y, ox_z = ox_impl x y z in
      printf
        "%s in=(%d,%d,%d) c=(%d,%d,%d) ox=(%d,%d,%d) eq=%b\n"
        name
        x
        y
        z
        c_x
        c_y
        c_z
        ox_x
        ox_y
        ox_z
        (Int.equal c_x ox_x && Int.equal c_y ox_y && Int.equal c_z ox_z))

let run_random_make3 ~name ~seed ~test_count gen c_impl ox_impl =
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count gen
  |> Sequence.iter ~f:(fun (x, y, z) ->
         incr total;
         let c_x, c_y, c_z = c_impl x y z in
         let ox_x, ox_y, ox_z = ox_impl x y z in
         if not (Int.equal c_x ox_x && Int.equal c_y ox_y && Int.equal c_z ox_z)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some
                  (sprintf
                     "%s in=(%d,%d,%d) c=(%d,%d,%d) ox=(%d,%d,%d)"
                     name
                     x
                     y
                     z
                     c_x
                     c_y
                     c_z
                     ox_x
                     ox_y
                     ox_z)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let check_three_vec3_to_scalar name c_impl ox_impl cases =
  List.iter cases ~f:(fun (checkp, norm, planep) ->
      let cx, cy, cz = checkp in
      let nx, ny, nz = norm in
      let px, py, pz = planep in
      let c = c_impl cx cy cz nx ny nz px py pz in
      let ox = ox_impl checkp norm planep in
      printf
        "%s check=(%d,%d,%d) norm=(%d,%d,%d) plane=(%d,%d,%d) c=%d ox=%d eq=%b\n"
        name
        cx
        cy
        cz
        nx
        ny
        nz
        px
        py
        pz
        c
        ox
        (Int.equal c ox))

let run_random_three_vec3_to_scalar ~name ~seed ~test_count c_impl ox_impl =
  let gen =
    Quickcheck.Generator.map
      (Quickcheck.Generator.both vec3_gen (Quickcheck.Generator.both vec3_gen vec3_gen))
      ~f:(fun (a, (b, c)) -> a, b, c)
  in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count gen
  |> Sequence.iter ~f:(fun (checkp, norm, planep) ->
         let cx, cy, cz = checkp in
         let nx, ny, nz = norm in
         let px, py, pz = planep in
         incr total;
         let c = c_impl cx cy cz nx ny nz px py pz in
         let ox = ox_impl checkp norm planep in
         if not (Int.equal c ox)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some
                  (sprintf
                     "%s check=(%d,%d,%d) norm=(%d,%d,%d) plane=(%d,%d,%d) c=%d ox=%d"
                     name
                     cx
                     cy
                     cz
                     nx
                     ny
                     nz
                     px
                     py
                     pz
                     c
                     ox)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let check_three_vec3_to_vec3 name c_impl ox_impl cases =
  List.iter cases ~f:(fun (p0, p1, p2) ->
      let p0x, p0y, p0z = p0 in
      let p1x, p1y, p1z = p1 in
      let p2x, p2y, p2z = p2 in
      let c_x, c_y, c_z = c_impl p0x p0y p0z p1x p1y p1z p2x p2y p2z in
      let ox_x, ox_y, ox_z = ox_impl p0 p1 p2 in
      printf
        "%s p0=(%d,%d,%d) p1=(%d,%d,%d) p2=(%d,%d,%d) c=(%d,%d,%d) ox=(%d,%d,%d) eq=%b\n"
        name
        p0x
        p0y
        p0z
        p1x
        p1y
        p1z
        p2x
        p2y
        p2z
        c_x
        c_y
        c_z
        ox_x
        ox_y
        ox_z
        (Int.equal c_x ox_x && Int.equal c_y ox_y && Int.equal c_z ox_z))

let run_random_three_vec3_to_vec3 ~name ~seed ~test_count c_impl ox_impl =
  let gen =
    Quickcheck.Generator.map
      (Quickcheck.Generator.both vec3_gen (Quickcheck.Generator.both vec3_gen vec3_gen))
      ~f:(fun (a, (b, c)) -> a, b, c)
  in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count gen
  |> Sequence.iter ~f:(fun (p0, p1, p2) ->
         let p0x, p0y, p0z = p0 in
         let p1x, p1y, p1z = p1 in
         let p2x, p2y, p2z = p2 in
         incr total;
         let c_x, c_y, c_z = c_impl p0x p0y p0z p1x p1y p1z p2x p2y p2z in
         let ox_x, ox_y, ox_z = ox_impl p0 p1 p2 in
         if not (Int.equal c_x ox_x && Int.equal c_y ox_y && Int.equal c_z ox_z)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some
                  (sprintf
                     "%s p0=(%d,%d,%d) p1=(%d,%d,%d) p2=(%d,%d,%d) c=(%d,%d,%d) ox=(%d,%d,%d)"
                     name
                     p0x
                     p0y
                     p0z
                     p1x
                     p1y
                     p1z
                     p2x
                     p2y
                     p2z
                     c_x
                     c_y
                     c_z
                     ox_x
                     ox_y
                     ox_z)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let fix_no_min_gen =
  Quickcheck.Generator.map Int32.quickcheck_generator ~f:(fun i ->
      if Int32.equal i Int32.min_value then Int32.succ i else i)
  |> Quickcheck.Generator.map ~f:Int32.to_int_exn

let vec3_no_min_gen =
  Quickcheck.Generator.map
    (Quickcheck.Generator.both fix_no_min_gen (Quickcheck.Generator.both fix_no_min_gen fix_no_min_gen))
    ~f:(fun (x, (y, z)) -> (x, y, z))

let vec3_perp_gen =
  Quickcheck.Generator.map vec3_no_min_gen ~f:(fun (x, y, z) -> (x asr 1, y asr 1, z asr 1))

let run_random_three_vec3_to_vec3_no_min ~name ~seed ~test_count c_impl ox_impl =
  let gen =
    Quickcheck.Generator.map
      (Quickcheck.Generator.both vec3_perp_gen (Quickcheck.Generator.both vec3_perp_gen vec3_perp_gen))
      ~f:(fun (a, (b, c)) -> a, b, c)
  in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count gen
  |> Sequence.iter ~f:(fun (p0, p1, p2) ->
         let p0x, p0y, p0z = p0 in
         let p1x, p1y, p1z = p1 in
         let p2x, p2y, p2z = p2 in
         incr total;
         let c_x, c_y, c_z = c_impl p0x p0y p0z p1x p1y p1z p2x p2y p2z in
         let ox_x, ox_y, ox_z = ox_impl p0 p1 p2 in
         if not (Int.equal c_x ox_x && Int.equal c_y ox_y && Int.equal c_z ox_z)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some
                  (sprintf
                     "%s p0=(%d,%d,%d) p1=(%d,%d,%d) p2=(%d,%d,%d) c=(%d,%d,%d) ox=(%d,%d,%d)"
                     name
                     p0x
                     p0y
                     p0z
                     p1x
                     p1y
                     p1z
                     p2x
                     p2y
                     p2z
                     c_x
                     c_y
                     c_z
                     ox_x
                     ox_y
                     ox_z)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let check_vec3_mat_to_vec3
    (name : string)
    (c_impl : vec3 -> mat3 -> vec3)
    (ox_impl : vec3 -> mat3 -> vec3)
    (cases : (vec3 * mat3) list)
  =
  List.iter cases ~f:(fun (v, m) ->
      let vx, vy, vz = v in
      let c_x, c_y, c_z = c_impl v m in
      let ox_x, ox_y, ox_z = ox_impl v m in
      let r1, r2, r3, u1, u2, u3, f1, f2, f3 = flat_of_mat3 m in
      printf
        "%s v=(%d,%d,%d) m=[%d,%d,%d;%d,%d,%d;%d,%d,%d] c=(%d,%d,%d) ox=(%d,%d,%d) eq=%b\n"
        name
        vx
        vy
        vz
        r1
        r2
        r3
        u1
        u2
        u3
        f1
        f2
        f3
        c_x
        c_y
        c_z
        ox_x
        ox_y
        ox_z
        (Int.equal c_x ox_x && Int.equal c_y ox_y && Int.equal c_z ox_z))

let check_mat_unop
    (name : string)
    (c_impl : mat3 -> mat3)
    (ox_impl : mat3 -> mat3)
    (cases : mat3 list)
  =
  List.iter cases ~f:(fun m ->
      let c_m = c_impl m in
      let ox_m = ox_impl m in
      let eq = if eq_mat3 c_m ox_m then "true" else "false" in
      let c_r1, c_r2, c_r3, c_u1, c_u2, c_u3, c_f1, c_f2, c_f3 = flat_of_mat3 c_m in
      let ox_r1, ox_r2, ox_r3, ox_u1, ox_u2, ox_u3, ox_f1, ox_f2, ox_f3 = flat_of_mat3 ox_m in
      printf
        "%s c=[%d,%d,%d;%d,%d,%d;%d,%d,%d] ox=[%d,%d,%d;%d,%d,%d;%d,%d,%d] eq=%s\n"
        name
        c_r1
        c_r2
        c_r3
        c_u1
        c_u2
        c_u3
        c_f1
        c_f2
        c_f3
        ox_r1
        ox_r2
        ox_r3
        ox_u1
        ox_u2
        ox_u3
        ox_f1
        ox_f2
        ox_f3
        eq)

let check_mat_binop
    (name : string)
    (c_impl : mat3 -> mat3 -> mat3)
    (ox_impl : mat3 -> mat3 -> mat3)
    (cases : (mat3 * mat3) list)
  =
  List.iter cases ~f:(fun (m0, m1) ->
      let c_m = c_impl m0 m1 in
      let ox_m = ox_impl m0 m1 in
      let eq = if eq_mat3 c_m ox_m then "true" else "false" in
      let c_r1, c_r2, c_r3, c_u1, c_u2, c_u3, c_f1, c_f2, c_f3 = flat_of_mat3 c_m in
      let ox_r1, ox_r2, ox_r3, ox_u1, ox_u2, ox_u3, ox_f1, ox_f2, ox_f3 = flat_of_mat3 ox_m in
      printf
        "%s c=[%d,%d,%d;%d,%d,%d;%d,%d,%d] ox=[%d,%d,%d;%d,%d,%d;%d,%d,%d] eq=%s\n"
        name
        c_r1
        c_r2
        c_r3
        c_u1
        c_u2
        c_u3
        c_f1
        c_f2
        c_f3
        ox_r1
        ox_r2
        ox_r3
        ox_u1
        ox_u2
        ox_u3
        ox_f1
        ox_f2
        ox_f3
        eq)

let check_mat_to_ang3
    (name : string)
    (c_impl : mat3 -> int * int * int)
    (ox_impl : mat3 -> int * int * int)
    (cases : mat3 list)
  =
  List.iter cases ~f:(fun m ->
      let c_p, c_b, c_h = c_impl m in
      let ox_p, ox_b, ox_h = ox_impl m in
      printf
        "%s c=(%d,%d,%d) ox=(%d,%d,%d) eq=%b\n"
        name
        c_p
        c_b
        c_h
        ox_p
        ox_b
        ox_h
        (Int.equal c_p ox_p && Int.equal c_b ox_b && Int.equal c_h ox_h))

let check_vec3_opt_opt_to_mat
    (name : string)
    (c_impl : vec3 -> vec3 option -> vec3 option -> mat3)
    (ox_impl : vec3 -> vec3 option -> vec3 option -> mat3)
    (cases : (vec3 * vec3 option * vec3 option) list)
  =
  let fmt_opt = function
    | None -> "None"
    | Some (x, y, z) -> sprintf "Some(%d,%d,%d)" x y z
  in
  List.iter cases ~f:(fun (fvec, uvec, rvec) ->
      let c_m = c_impl fvec uvec rvec in
      let ox_m = ox_impl fvec uvec rvec in
      let eq = if eq_mat3 c_m ox_m then "true" else "false" in
      let c_r1, c_r2, c_r3, c_u1, c_u2, c_u3, c_f1, c_f2, c_f3 = flat_of_mat3 c_m in
      let ox_r1, ox_r2, ox_r3, ox_u1, ox_u2, ox_u3, ox_f1, ox_f2, ox_f3 = flat_of_mat3 ox_m in
      let fx, fy, fz = fvec in
      printf
        "%s f=(%d,%d,%d) u=%s r=%s c=[%d,%d,%d;%d,%d,%d;%d,%d,%d] ox=[%d,%d,%d;%d,%d,%d;%d,%d,%d] eq=%s\n"
        name
        fx
        fy
        fz
        (fmt_opt uvec)
        (fmt_opt rvec)
        c_r1
        c_r2
        c_r3
        c_u1
        c_u2
        c_u3
        c_f1
        c_f2
        c_f3
        ox_r1
        ox_r2
        ox_r3
        ox_u1
        ox_u2
        ox_u3
        ox_f1
        ox_f2
        ox_f3
        eq)

let check_six_fix_to_mat
    (name : string)
    (c_impl : int -> int -> int -> int -> int -> int -> mat3)
    (ox_impl : int -> int -> int -> int -> int -> int -> mat3)
    (cases : (int * int * int * int * int * int) list)
  =
  List.iter cases ~f:(fun (sinp, cosp, sinb, cosb, sinh, cosh) ->
      let c_m = c_impl sinp cosp sinb cosb sinh cosh in
      let ox_m = ox_impl sinp cosp sinb cosb sinh cosh in
      let eq = if eq_mat3 c_m ox_m then "true" else "false" in
      let c_r1, c_r2, c_r3, c_u1, c_u2, c_u3, c_f1, c_f2, c_f3 = flat_of_mat3 c_m in
      let ox_r1, ox_r2, ox_r3, ox_u1, ox_u2, ox_u3, ox_f1, ox_f2, ox_f3 = flat_of_mat3 ox_m in
      printf
        "%s s=(%d,%d,%d,%d,%d,%d) c=[%d,%d,%d;%d,%d,%d;%d,%d,%d] ox=[%d,%d,%d;%d,%d,%d;%d,%d,%d] eq=%s\n"
        name
        sinp
        cosp
        sinb
        cosb
        sinh
        cosh
        c_r1
        c_r2
        c_r3
        c_u1
        c_u2
        c_u3
        c_f1
        c_f2
        c_f3
        ox_r1
        ox_r2
        ox_r3
        ox_u1
        ox_u2
        ox_u3
        ox_f1
        ox_f2
        ox_f3
        eq)

let check_ang3_to_mat
    (name : string)
    (c_impl : int * int * int -> mat3)
    (ox_impl : int * int * int -> mat3)
    (cases : (int * int * int) list)
  =
  List.iter cases ~f:(fun ((p, b, h) as ang) ->
      let c_m = c_impl ang in
      let ox_m = ox_impl ang in
      let eq = if eq_mat3 c_m ox_m then "true" else "false" in
      let c_r1, c_r2, c_r3, c_u1, c_u2, c_u3, c_f1, c_f2, c_f3 = flat_of_mat3 c_m in
      let ox_r1, ox_r2, ox_r3, ox_u1, ox_u2, ox_u3, ox_f1, ox_f2, ox_f3 = flat_of_mat3 ox_m in
      printf
        "%s a=(%d,%d,%d) c=[%d,%d,%d;%d,%d,%d;%d,%d,%d] ox=[%d,%d,%d;%d,%d,%d;%d,%d,%d] eq=%s\n"
        name
        p
        b
        h
        c_r1
        c_r2
        c_r3
        c_u1
        c_u2
        c_u3
        c_f1
        c_f2
        c_f3
        ox_r1
        ox_r2
        ox_r3
        ox_u1
        ox_u2
        ox_u3
        ox_f1
        ox_f2
        ox_f3
        eq)

let check_vec3_fixang_to_mat
    (name : string)
    (c_impl : vec3 -> int -> mat3)
    (ox_impl : vec3 -> int -> mat3)
    (cases : (vec3 * int) list)
  =
  List.iter cases ~f:(fun (v, a) ->
      let c_m = c_impl v a in
      let ox_m = ox_impl v a in
      let eq = if eq_mat3 c_m ox_m then "true" else "false" in
      let vx, vy, vz = v in
      let c_r1, c_r2, c_r3, c_u1, c_u2, c_u3, c_f1, c_f2, c_f3 = flat_of_mat3 c_m in
      let ox_r1, ox_r2, ox_r3, ox_u1, ox_u2, ox_u3, ox_f1, ox_f2, ox_f3 = flat_of_mat3 ox_m in
      printf
        "%s v=(%d,%d,%d) a=%d c=[%d,%d,%d;%d,%d,%d;%d,%d,%d] ox=[%d,%d,%d;%d,%d,%d;%d,%d,%d] eq=%s\n"
        name
        vx
        vy
        vz
        a
        c_r1
        c_r2
        c_r3
        c_u1
        c_u2
        c_u3
        c_f1
        c_f2
        c_f3
        ox_r1
        ox_r2
        ox_r3
        ox_u1
        ox_u2
        ox_u3
        ox_f1
        ox_f2
        ox_f3
        eq)

let run_random_vec3_mat_to_vec3
    ~(name : string)
    ~(seed : string)
    ~(test_count : int)
    (c_impl : vec3 -> mat3 -> vec3)
    (ox_impl : vec3 -> mat3 -> vec3)
  =
  let gen = Quickcheck.Generator.both vec3_gen mat3_gen in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count gen
  |> Sequence.iter ~f:(fun (v, m) ->
         incr total;
         let c_x, c_y, c_z = c_impl v m in
         let ox_x, ox_y, ox_z = ox_impl v m in
         if not (Int.equal c_x ox_x && Int.equal c_y ox_y && Int.equal c_z ox_z)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             let vx, vy, vz = v in
             first_mismatch
             := Some
                  (sprintf
                     "%s v=(%d,%d,%d) c=(%d,%d,%d) ox=(%d,%d,%d)"
                     name
                     vx
                     vy
                     vz
                     c_x
                     c_y
                     c_z
                     ox_x
                     ox_y
                     ox_z)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let run_random_mat_unop
    ~(name : string)
    ~(seed : string)
    ~(test_count : int)
    (c_impl : mat3 -> mat3)
    (ox_impl : mat3 -> mat3)
  =
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count mat3_gen
  |> Sequence.iter ~f:(fun m ->
         incr total;
         let c_m = c_impl m in
         let ox_m = ox_impl m in
         if not (eq_mat3 c_m ox_m)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then first_mismatch := Some (sprintf "%s matrix mismatch" name)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let run_random_mat_to_ang3
    ~(name : string)
    ~(seed : string)
    ~(test_count : int)
    (c_impl : mat3 -> int * int * int)
    (ox_impl : mat3 -> int * int * int)
  =
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count mat3_gen
  |> Sequence.iter ~f:(fun m ->
         incr total;
         let c_p, c_b, c_h = c_impl m in
         let ox_p, ox_b, ox_h = ox_impl m in
         if not (Int.equal c_p ox_p && Int.equal c_b ox_b && Int.equal c_h ox_h)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then first_mismatch := Some (sprintf "%s angle mismatch" name)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let run_random_mat_binop
    ~(name : string)
    ~(seed : string)
    ~(test_count : int)
    (c_impl : mat3 -> mat3 -> mat3)
    (ox_impl : mat3 -> mat3 -> mat3)
  =
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  let gen = Quickcheck.Generator.both mat3_gen mat3_gen in
  random_values ~seed ~test_count gen
  |> Sequence.iter ~f:(fun (m0, m1) ->
         incr total;
         let c_m = c_impl m0 m1 in
         let ox_m = ox_impl m0 m1 in
         if not (eq_mat3 c_m ox_m)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then first_mismatch := Some (sprintf "%s matrix mismatch" name)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let run_random_vec3_opt_opt_to_mat
    ~(name : string)
    ~(seed : string)
    ~(test_count : int)
    ~(gen : (vec3 * vec3 option * vec3 option) Quickcheck.Generator.t)
    (c_impl : vec3 -> vec3 option -> vec3 option -> mat3)
    (ox_impl : vec3 -> vec3 option -> vec3 option -> mat3)
  =
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count gen
  |> Sequence.iter ~f:(fun (fvec, uvec, rvec) ->
         incr total;
         let c_m = c_impl fvec uvec rvec in
         let ox_m = ox_impl fvec uvec rvec in
         if not (eq_mat3 c_m ox_m)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then first_mismatch := Some (sprintf "%s matrix mismatch" name)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let run_random_six_fix_to_mat
    ~(name : string)
    ~(seed : string)
    ~(test_count : int)
    (c_impl : int -> int -> int -> int -> int -> int -> mat3)
    (ox_impl : int -> int -> int -> int -> int -> int -> mat3)
  =
  let gen =
    Quickcheck.Generator.both
      fix_gen
      (Quickcheck.Generator.both
         fix_gen
         (Quickcheck.Generator.both
            fix_gen
            (Quickcheck.Generator.both fix_gen (Quickcheck.Generator.both fix_gen fix_gen))))
    |> Quickcheck.Generator.map ~f:(fun (sinp, (cosp, (sinb, (cosb, (sinh, cosh))))) ->
           (sinp, cosp, sinb, cosb, sinh, cosh))
  in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count gen
  |> Sequence.iter ~f:(fun (sinp, cosp, sinb, cosb, sinh, cosh) ->
         incr total;
         let c_m = c_impl sinp cosp sinb cosb sinh cosh in
         let ox_m = ox_impl sinp cosp sinb cosb sinh cosh in
         if not (eq_mat3 c_m ox_m)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then first_mismatch := Some (sprintf "%s matrix mismatch" name)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let run_random_ang3_to_mat
    ~(name : string)
    ~(seed : string)
    ~(test_count : int)
    (c_impl : int * int * int -> mat3)
    (ox_impl : int * int * int -> mat3)
  =
  let fixang_gen_local =
    Quickcheck.Generator.weighted_union
      [
        (3.0, Quickcheck.Generator.of_list [ -32768; -32767; -1; 0; 1; 32766; 32767 ]);
        (7.0, Quickcheck.Generator.map Int32.quickcheck_generator ~f:Int32.to_int_exn);
      ]
  in
  let ang3_gen_local =
    Quickcheck.Generator.map
      (Quickcheck.Generator.both
         fixang_gen_local
         (Quickcheck.Generator.both fixang_gen_local fixang_gen_local))
      ~f:(fun (x, (y, z)) -> (x, y, z))
  in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count ang3_gen_local
  |> Sequence.iter ~f:(fun ang ->
         incr total;
         let c_m = c_impl ang in
         let ox_m = ox_impl ang in
         if not (eq_mat3 c_m ox_m)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then first_mismatch := Some (sprintf "%s matrix mismatch" name)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let run_random_vec3_fixang_to_mat
    ~(name : string)
    ~(seed : string)
    ~(test_count : int)
    (c_impl : vec3 -> int -> mat3)
    (ox_impl : vec3 -> int -> mat3)
  =
  let fixang_gen_local =
    Quickcheck.Generator.weighted_union
      [
        (3.0, Quickcheck.Generator.of_list [ -32768; -32767; -1; 0; 1; 32766; 32767 ]);
        (7.0, Quickcheck.Generator.map Int32.quickcheck_generator ~f:Int32.to_int_exn);
      ]
  in
  let gen = Quickcheck.Generator.both vec3_gen fixang_gen_local in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count gen
  |> Sequence.iter ~f:(fun (v, a) ->
         incr total;
         let c_m = c_impl v a in
         let ox_m = ox_impl v a in
         if not (eq_mat3 c_m ox_m)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then first_mismatch := Some (sprintf "%s matrix mismatch" name)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let fixang_gen =
  Quickcheck.Generator.weighted_union
    [
      (3.0, Quickcheck.Generator.of_list [ -32768; -32767; -1; 0; 1; 32766; 32767 ]);
      (7.0, Quickcheck.Generator.map Int32.quickcheck_generator ~f:Int32.to_int_exn);
    ]

let ang3_gen =
  Quickcheck.Generator.map
    (Quickcheck.Generator.both fixang_gen (Quickcheck.Generator.both fixang_gen fixang_gen))
    ~f:(fun (x, (y, z)) -> (x, y, z))

let%expect_test "i2f parity C vs Ox" =
  check_unop "i2f" c_i2f Ox_math.i2f i2f_cases;
  [%expect
    {|
    i2f a=-10 c=-655360 ox=-655360 eq=true
    i2f a=-1 c=-65536 ox=-65536 eq=true
    i2f a=0 c=0 ox=0 eq=true
    i2f a=1 c=65536 ox=65536 eq=true
    i2f a=10 c=655360 ox=655360 eq=true
    i2f a=1234 c=80871424 ox=80871424 eq=true
    |}]

let%expect_test "f2i parity C vs Ox" =
  check_unop "f2i" c_f2i Ox_math.f2i f2i_cases;
  [%expect
    {|
    f2i a=-655360 c=-10 ox=-10 eq=true
    f2i a=-65536 c=-1 ox=-1 eq=true
    f2i a=-1 c=-1 ox=-1 eq=true
    f2i a=0 c=0 ox=0 eq=true
    f2i a=1 c=0 ox=0 eq=true
    f2i a=65535 c=0 ox=0 eq=true
    f2i a=65536 c=1 ox=1 eq=true
    f2i a=131072 c=2 ox=2 eq=true
    f2i a=12345678 c=188 ox=188 eq=true
    |}]

let%expect_test "fixmul parity C vs Ox" =
  check_binop "fixmul" c_fixmul Ox_math.fixmul mul_cases;
  [%expect
    {|
    fixmul a=65536 b=65536 c=65536 ox=65536 eq=true
    fixmul a=131072 b=32768 c=65536 ox=65536 eq=true
    fixmul a=-65536 b=65536 c=-65536 ox=-65536 eq=true
    fixmul a=6554 b=655360 c=65540 ox=65540 eq=true
    fixmul a=12345 b=67890 c=12788 ox=12788 eq=true
    fixmul a=-12345 b=67890 c=-12789 ox=-12789 eq=true
    |}]

let%expect_test "fixdiv parity C vs Ox" =
  check_binop "fixdiv" c_fixdiv Ox_math.fixdiv div_cases;
  [%expect
    {|
    fixdiv a=65536 b=65536 c=65536 ox=65536 eq=true
    fixdiv a=131072 b=32768 c=262144 ox=262144 eq=true
    fixdiv a=-65536 b=65536 c=-65536 ox=-65536 eq=true
    fixdiv a=655360 b=6554 c=6553200 ox=6553200 eq=true
    fixdiv a=12345678 b=321 c=-1774449062 ox=-1774449062 eq=true
    fixdiv a=65536 b=0 c=1 ox=1 eq=true
    |}]

let%expect_test "fixmuldiv parity C vs Ox" =
  check_ternop "fixmuldiv" c_fixmuldiv Ox_math.fixmuldiv muldiv_cases;
  [%expect
    {|
    fixmuldiv a=65536 b=65536 c=65536 c_out=65536 ox=65536 eq=true
    fixmuldiv a=131072 b=32768 c=65536 c_out=65536 ox=65536 eq=true
    fixmuldiv a=-65536 b=65536 c=65536 c_out=-65536 ox=-65536 eq=true
    fixmuldiv a=12345 b=67890 c=321 c_out=2610909 ox=2610909 eq=true
    fixmuldiv a=12345 b=67890 c=0 c_out=1 ox=1 eq=true
    |}]

let%expect_test "long_sqrt parity C vs Ox" =
  check_unop "long_sqrt" c_long_sqrt Ox_math.long_sqrt long_sqrt_cases;
  [%expect {|
    long_sqrt a=-2147483648 c=0 ox=0 eq=true
    long_sqrt a=-1 c=0 ox=0 eq=true
    long_sqrt a=0 c=0 ox=0 eq=true
    long_sqrt a=1 c=1 ox=1 eq=true
    long_sqrt a=2 c=2 ox=2 eq=true
    long_sqrt a=3 c=2 ox=2 eq=true
    long_sqrt a=4 c=2 ox=2 eq=true
    long_sqrt a=255 c=16 ox=16 eq=true
    long_sqrt a=256 c=16 ox=16 eq=true
    long_sqrt a=257 c=17 ox=17 eq=true
    long_sqrt a=2147395600 c=46340 ox=46340 eq=true
    long_sqrt a=2147483647 c=46341 ox=46341 eq=true
    |}]

let%expect_test "quad_sqrt parity C vs Ox" =
  check_unop_i64
    "quad_sqrt"
    c_quad_sqrt
    (fun q -> Ox_math.wrap_i64_to_fix (Ox_math.quad_sqrt q))
    quad_sqrt_cases;
  [%expect {|
    quad_sqrt q=-9223372036854775808 c=0 ox=0 eq=true
    quad_sqrt q=-1 c=0 ox=0 eq=true
    quad_sqrt q=0 c=0 ox=0 eq=true
    quad_sqrt q=1 c=1 ox=1 eq=true
    quad_sqrt q=2 c=2 ox=2 eq=true
    quad_sqrt q=3 c=2 ox=2 eq=true
    quad_sqrt q=4 c=2 ox=2 eq=true
    quad_sqrt q=255 c=16 ox=16 eq=true
    quad_sqrt q=256 c=16 ox=16 eq=true
    quad_sqrt q=257 c=17 ox=17 eq=true
    quad_sqrt q=2147395600 c=46340 ox=46340 eq=true
    quad_sqrt q=2147483647 c=46341 ox=46341 eq=true
    quad_sqrt q=2147483648 c=46341 ox=46341 eq=true
    quad_sqrt q=9223372030926249001 c=-1257966797 ox=-1257966797 eq=true
    quad_sqrt q=9223372036854775807 c=-1257966796 ox=-1257966796 eq=true
    |}]

let%expect_test "fixquadadjust parity C vs Ox" =
  check_unop_i64 "fixquadadjust" c_fixquadadjust Ox_math.fixquadadjust fixquadadjust_cases;
  [%expect {|
    fixquadadjust q=-9223372036854775808 c=-2147483647 ox=-2147483647 eq=true
    fixquadadjust q=-9223372030926249001 c=-2147483647 ox=-2147483647 eq=true
    fixquadadjust q=140737488355328 c=2147483647 ox=2147483647 eq=true
    fixquadadjust q=-140737488355328 c=-2147483648 ox=-2147483648 eq=true
    fixquadadjust q=2147483648 c=32768 ox=32768 eq=true
    fixquadadjust q=-2147483648 c=-32768 ox=-32768 eq=true
    fixquadadjust q=-1 c=-1 ox=-1 eq=true
    fixquadadjust q=0 c=0 ox=0 eq=true
    fixquadadjust q=1 c=0 ox=0 eq=true
    fixquadadjust q=65535 c=0 ox=0 eq=true
    fixquadadjust q=65536 c=1 ox=1 eq=true
    fixquadadjust q=140737488289792 c=2147483647 ox=2147483647 eq=true
    fixquadadjust q=-140737488289792 c=-2147483647 ox=-2147483647 eq=true
    fixquadadjust q=9223372030926249001 c=2147483647 ox=2147483647 eq=true
    fixquadadjust q=9223372036854775807 c=2147483647 ox=2147483647 eq=true
    |}]

let%expect_test "fixmulaccum parity C vs Ox" =
  check_ternop_i64_out "fixmulaccum" c_fixmulaccum Ox_math.fixmulaccum fixmulaccum_cases;
  [%expect {|
    fixmulaccum q=0 a=0 b=0 c=0 ox=0 eq=true
    fixmulaccum q=0 a=65536 b=65536 c=4294967296 ox=4294967296 eq=true
    fixmulaccum q=1234567890123 a=-12345 b=67890 c=1233729788073 ox=1233729788073 eq=true
    fixmulaccum q=-1234567890123 a=2147483647 b=1 c=-1232420406476 ox=-1232420406476 eq=true
    fixmulaccum q=9000000000000000 a=1000000 b=-1000000 c=8999000000000000 ox=8999000000000000 eq=true
    |}]

let%expect_test "fixdivquadlong parity C vs Ox" =
  check_binop_i64_int "fixdivquadlong" c_fixdivquadlong Ox_math.fixdivquadlong fixdivquadlong_cases;
  [%expect {|
    fixdivquadlong n=0 d=1 c=0 ox=0 eq=true
    fixdivquadlong n=1 d=1 c=1 ox=1 eq=true
    fixdivquadlong n=-1 d=1 c=-1 ox=-1 eq=true
    fixdivquadlong n=9223372036854775807 d=-1 c=-2147483648 ox=-2147483648 eq=true
    fixdivquadlong n=-9223372036854775807 d=2 c=1 ox=1 eq=true
    fixdivquadlong n=1234567890123456789 d=65536 c=284458473 ox=284458473 eq=true
    fixdivquadlong n=-1234567890123456789 d=65536 c=-284458473 ox=-284458473 eq=true
    fixdivquadlong n=12345 d=0 c=1 ox=1 eq=true
    |}]

let%expect_test "fixquadnegate parity C vs Ox" =
  check_binop_pair "fixquadnegate" c_fixquadnegate Ox_math.fixquadnegate fixquadnegate_cases;
  [%expect {|
    fixquadnegate a=0 b=0 c=(0,0) ox=(0,0) eq=true
    fixquadnegate a=1 b=0 c=(-1,-1) ox=(-1,-1) eq=true
    fixquadnegate a=-1 b=0 c=(1,-1) ox=(1,-1) eq=true
    fixquadnegate a=2147483647 b=1 c=(-2147483647,-2) ox=(-2147483647,-2) eq=true
    fixquadnegate a=-2147483648 b=-1 c=(-2147483648,0) ox=(-2147483648,0) eq=true
    fixquadnegate a=123456789 b=-987654321 c=(-123456789,987654320) ox=(-123456789,987654320) eq=true
    |}]

let%expect_test "ufixdivquadlong parity C vs Ox" =
  check_ternop "ufixdivquadlong" c_ufixdivquadlong Ox_math.ufixdivquadlong ufixdivquadlong_cases;
  [%expect {|
    ufixdivquadlong a=0 b=0 c=1 c_out=0 ox=0 eq=true
    ufixdivquadlong a=1 b=0 c=1 c_out=1 ox=1 eq=true
    ufixdivquadlong a=-1 b=0 c=1 c_out=-1 ox=-1 eq=true
    ufixdivquadlong a=0 b=-1 c=2 c_out=-2147483648 ox=-2147483648 eq=true
    ufixdivquadlong a=12345 b=67890 c=321 c_out=2127413745 ox=2127413745 eq=true
    ufixdivquadlong a=2147483647 b=2147483647 c=65536 c_out=-32769 ox=-32769 eq=true
    ufixdivquadlong a=-1 b=-1 c=-1 c_out=1 ox=1 eq=true
    |}]

let%expect_test "fix_sqrt parity C vs Ox" =
  check_unop "fix_sqrt" c_fix_sqrt Ox_math.fix_sqrt fix_sqrt_cases;
  [%expect
    {|
    fix_sqrt a=-1 c=0 ox=0 eq=true
    fix_sqrt a=0 c=0 ox=0 eq=true
    fix_sqrt a=1 c=256 ox=256 eq=true
    fix_sqrt a=2 c=512 ox=512 eq=true
    fix_sqrt a=255 c=4096 ox=4096 eq=true
    fix_sqrt a=256 c=4096 ox=4096 eq=true
    fix_sqrt a=257 c=4352 ox=4352 eq=true
    fix_sqrt a=65536 c=65536 ox=65536 eq=true
    fix_sqrt a=262144 c=131072 ox=131072 eq=true
    fix_sqrt a=2147395600 c=11863040 ox=11863040 eq=true
    fix_sqrt a=2147483647 c=11863296 ox=11863296 eq=true
    |}]

let%expect_test "fix_isqrt parity C vs Ox" =
  check_unop "fix_isqrt" c_fix_isqrt Ox_math.fix_isqrt fix_isqrt_cases;
  [%expect {|
    fix_isqrt a=0 c=0 ox=0 eq=true
    fix_isqrt a=1 c=47511552 ox=47511552 eq=true
    fix_isqrt a=2 c=35589575 ox=35589575 eq=true
    fix_isqrt a=255 c=1050638 ox=1050638 eq=true
    fix_isqrt a=256 c=1048576 ox=1048576 eq=true
    fix_isqrt a=257 c=1046540 ox=1046540 eq=true
    fix_isqrt a=65536 c=65499 ox=65499 eq=true
    fix_isqrt a=262144 c=32749 ox=32749 eq=true
    fix_isqrt a=2147395600 c=400 ox=400 eq=true
    fix_isqrt a=2147483647 c=400 ox=400 eq=true
    |}]

let%expect_test "fix_sincos parity C vs Ox" =
  check_unop_pair "fix_sincos" c_fix_sincos Ox_math.fix_sincos fix_sincos_cases;
  [%expect {|
    fix_sincos a=-2147483648 c=(0,65536) ox=(0,65536) eq=true
    fix_sincos a=-65536 c=(0,65536) ox=(0,65536) eq=true
    fix_sincos a=-32768 c=(0,-65536) ox=(0,-65536) eq=true
    fix_sincos a=-257 c=(-1616,65512) ox=(-1616,65512) eq=true
    fix_sincos a=-256 c=(-1608,65516) ox=(-1608,65516) eq=true
    fix_sincos a=-255 c=(-1604,65516) ox=(-1604,65516) eq=true
    fix_sincos a=-1 c=(-8,65532) ox=(-8,65532) eq=true
    fix_sincos a=0 c=(0,65536) ox=(0,65536) eq=true
    fix_sincos a=1 c=(4,65532) ox=(4,65532) eq=true
    fix_sincos a=255 c=(1600,65516) ox=(1600,65516) eq=true
    fix_sincos a=256 c=(1608,65516) ox=(1608,65516) eq=true
    fix_sincos a=257 c=(1612,65512) ox=(1612,65512) eq=true
    fix_sincos a=16384 c=(65536,0) ox=(65536,0) eq=true
    fix_sincos a=32768 c=(0,-65536) ox=(0,-65536) eq=true
    fix_sincos a=65535 c=(-8,65532) ox=(-8,65532) eq=true
    fix_sincos a=65536 c=(0,65536) ox=(0,65536) eq=true
    fix_sincos a=2147483647 c=(-8,65532) ox=(-8,65532) eq=true
    |}]

let%expect_test "fix_fastsincos parity C vs Ox" =
  check_unop_pair "fix_fastsincos" c_fix_fastsincos Ox_math.fix_fastsincos fix_fastsincos_cases;
  [%expect {|
    fix_fastsincos a=-2147483648 c=(0,65536) ox=(0,65536) eq=true
    fix_fastsincos a=-65536 c=(0,65536) ox=(0,65536) eq=true
    fix_fastsincos a=-32768 c=(0,-65536) ox=(0,-65536) eq=true
    fix_fastsincos a=-1 c=(-1608,65516) ox=(-1608,65516) eq=true
    fix_fastsincos a=0 c=(0,65536) ox=(0,65536) eq=true
    fix_fastsincos a=1 c=(0,65536) ox=(0,65536) eq=true
    fix_fastsincos a=16383 c=(65516,1608) ox=(65516,1608) eq=true
    fix_fastsincos a=16384 c=(65536,0) ox=(65536,0) eq=true
    fix_fastsincos a=32767 c=(1608,-65516) ox=(1608,-65516) eq=true
    fix_fastsincos a=32768 c=(0,-65536) ox=(0,-65536) eq=true
    fix_fastsincos a=65535 c=(-1608,65516) ox=(-1608,65516) eq=true
    fix_fastsincos a=65536 c=(0,65536) ox=(0,65536) eq=true
    fix_fastsincos a=2147483647 c=(-1608,65516) ox=(-1608,65516) eq=true
    |}]

let%expect_test "fix_acos parity C vs Ox" =
  check_unop "fix_acos" c_fix_acos Ox_math.fix_acos fix_acos_cases;
  [%expect {|
    fix_acos a=-2147483648 c=16384 ox=16384 eq=true
    fix_acos a=-65536 c=0 ox=0 eq=true
    fix_acos a=-32768 c=21845 ox=21845 eq=true
    fix_acos a=-1 c=16385 ox=16385 eq=true
    fix_acos a=0 c=16384 ox=16384 eq=true
    fix_acos a=1 c=16383 ox=16383 eq=true
    fix_acos a=32767 c=10923 ox=10923 eq=true
    fix_acos a=32768 c=10923 ox=10923 eq=true
    fix_acos a=65535 c=3 ox=3 eq=true
    fix_acos a=65536 c=0 ox=0 eq=true
    fix_acos a=2147483647 c=0 ox=0 eq=true
    |}]

let%expect_test "fix_asin parity C vs Ox" =
  check_unop "fix_asin" c_fix_asin Ox_math.fix_asin fix_asin_cases;
  [%expect {|
    fix_asin a=-2147483648 c=0 ox=0 eq=true
    fix_asin a=-65536 c=16384 ox=16384 eq=true
    fix_asin a=-32768 c=-5461 ox=-5461 eq=true
    fix_asin a=-1 c=0 ox=0 eq=true
    fix_asin a=0 c=0 ox=0 eq=true
    fix_asin a=1 c=0 ox=0 eq=true
    fix_asin a=32767 c=5460 ox=5460 eq=true
    fix_asin a=32768 c=5461 ox=5461 eq=true
    fix_asin a=65535 c=16380 ox=16380 eq=true
    fix_asin a=65536 c=16384 ox=16384 eq=true
    fix_asin a=2147483647 c=16384 ox=16384 eq=true
    |}]

let%expect_test "fix_atan2 parity C vs Ox" =
  check_binop "fix_atan2" c_fix_atan2 Ox_math.fix_atan2 fix_atan2_cases;
  [%expect {|
    fix_atan2 a=65536 b=0 c=0 ox=0 eq=true
    fix_atan2 a=0 b=65536 c=16384 ox=16384 eq=true
    fix_atan2 a=-65536 b=0 c=-32768 ox=-32768 eq=true
    fix_atan2 a=0 b=-65536 c=-16384 ox=-16384 eq=true
    fix_atan2 a=65536 b=65536 c=8192 ox=8192 eq=true
    fix_atan2 a=65536 b=-65536 c=-8192 ox=-8192 eq=true
    fix_atan2 a=0 b=0 c=0 ox=0 eq=true
    fix_atan2 a=12345 b=-54321 c=-14053 ox=-14053 eq=true
    fix_atan2 a=2147483647 b=-2147483648 c=0 ox=0 eq=true
    fix_atan2 a=-2147483648 b=2147483647 c=16384 ox=16384 eq=true
    |}]

let%expect_test "vm_vec_scale_add2 parity C vs Ox" =
  check_stateful_vec3 "vm_vec_scale_add2" c_vm_vec_scale_add2 Ox_math.vm_vec_scale_add2 vm_vec_scale_add2_cases;
  [%expect
    {|
    vm_vec_scale_add2 d=(0,0,0) s=(0,0,0) k=0 c=(0,0,0) ox=(0,0,0) eq=true
    vm_vec_scale_add2 d=(65536,131072,-65536) s=(65536,-65536,32768) k=65536 c=(131072,65536,-32768) ox=(131072,65536,-32768) eq=true
    vm_vec_scale_add2 d=(12345,-54321,99999) s=(67890,13579,-24680) k=321 c=(12677,-54255,99878) ox=(12677,-54255,99878) eq=true
    vm_vec_scale_add2 d=(2147483647,0,-2147483648) s=(1,-1,2) k=65536 c=(-2147483648,-1,-2147483646) ox=(-2147483648,-1,-2147483646) eq=true
    |}]

let%expect_test "vm_vec_scale_add parity C vs Ox" =
  check_vec3_bin_scale "vm_vec_scale_add" c_vm_vec_scale_add Ox_math.vm_vec_scale_add vm_vec_scale_add_cases;
  [%expect
    {|
    vm_vec_scale_add a=(0,0,0) b=(0,0,0) k=0 c=(0,0,0) ox=(0,0,0) eq=true
    vm_vec_scale_add a=(65536,131072,-65536) b=(65536,-65536,32768) k=65536 c=(131072,65536,-32768) ox=(131072,65536,-32768) eq=true
    vm_vec_scale_add a=(12345,-54321,99999) b=(67890,13579,-24680) k=321 c=(12677,-54255,99878) ox=(12677,-54255,99878) eq=true
    vm_vec_scale_add a=(2147483647,0,-2147483648) b=(1,-1,2) k=65536 c=(-2147483648,-1,-2147483646) ox=(-2147483648,-1,-2147483646) eq=true
    |}]

let%expect_test "vm_vec_scale2 parity C vs Ox" =
  check_stateful_vec3_scale2 "vm_vec_scale2" c_vm_vec_scale2 Ox_math.vm_vec_scale2 vm_vec_scale2_cases;
  [%expect
    {|
    vm_vec_scale2 d=(0,0,0) n=65536 d=65536 c=(0,0,0) ox=(0,0,0) eq=true
    vm_vec_scale2 d=(65536,131072,-65536) n=131072 d=65536 c=(131072,262144,-131072) ox=(131072,262144,-131072) eq=true
    vm_vec_scale2 d=(12345,-54321,99999) n=67890 d=321 c=(2610909,-11488637,21149321) ox=(2610909,-11488637,21149321) eq=true
    vm_vec_scale2 d=(12345,-54321,99999) n=67890 d=0 c=(12345,-54321,99999) ox=(12345,-54321,99999) eq=true
    vm_vec_scale2 d=(2147483647,0,-2147483648) n=65536 d=32768 c=(-2,0,0) ox=(-2,0,0) eq=true
    |}]

let%expect_test "vm_vec_add parity C vs Ox" =
  check_vec3_binop "vm_vec_add" c_vm_vec_add Ox_math.vm_vec_add vm_vec_add_cases;
  [%expect
    {|
    vm_vec_add a=(0,0,0) b=(0,0,0) c=(0,0,0) ox=(0,0,0) eq=true
    vm_vec_add a=(65536,131072,-65536) b=(65536,-65536,32768) c=(131072,65536,-32768) ox=(131072,65536,-32768) eq=true
    vm_vec_add a=(12345,-54321,99999) b=(67890,13579,-24680) c=(80235,-40742,75319) ox=(80235,-40742,75319) eq=true
    vm_vec_add a=(2147483647,0,-2147483648) b=(1,-1,2) c=(-2147483648,-1,-2147483646) ox=(-2147483648,-1,-2147483646) eq=true
    |}]

let%expect_test "vm_vec_sub parity C vs Ox" =
  check_vec3_binop "vm_vec_sub" c_vm_vec_sub Ox_math.vm_vec_sub vm_vec_sub_cases;
  [%expect
    {|
    vm_vec_sub a=(0,0,0) b=(0,0,0) c=(0,0,0) ox=(0,0,0) eq=true
    vm_vec_sub a=(65536,131072,-65536) b=(65536,-65536,32768) c=(0,196608,-98304) ox=(0,196608,-98304) eq=true
    vm_vec_sub a=(12345,-54321,99999) b=(67890,13579,-24680) c=(-55545,-67900,124679) ox=(-55545,-67900,124679) eq=true
    vm_vec_sub a=(2147483647,0,-2147483648) b=(1,-1,2) c=(2147483646,1,2147483646) ox=(2147483646,1,2147483646) eq=true
    |}]

let%expect_test "vm_vec_add2 parity C vs Ox" =
  check_stateful_vec3_add2 "vm_vec_add2" c_vm_vec_add2 Ox_math.vm_vec_add2 vm_vec_add2_cases;
  [%expect
    {|
    vm_vec_add2 d=(0,0,0) s=(0,0,0) c=(0,0,0) ox=(0,0,0) eq=true
    vm_vec_add2 d=(65536,131072,-65536) s=(65536,-65536,32768) c=(131072,65536,-32768) ox=(131072,65536,-32768) eq=true
    vm_vec_add2 d=(12345,-54321,99999) s=(67890,13579,-24680) c=(80235,-40742,75319) ox=(80235,-40742,75319) eq=true
    vm_vec_add2 d=(2147483647,0,-2147483648) s=(1,-1,2) c=(-2147483648,-1,-2147483646) ox=(-2147483648,-1,-2147483646) eq=true
    |}]

let%expect_test "vm_vec_sub2 parity C vs Ox" =
  check_stateful_vec3_add2 "vm_vec_sub2" c_vm_vec_sub2 Ox_math.vm_vec_sub2 vm_vec_sub2_cases;
  [%expect
    {|
    vm_vec_sub2 d=(0,0,0) s=(0,0,0) c=(0,0,0) ox=(0,0,0) eq=true
    vm_vec_sub2 d=(65536,131072,-65536) s=(65536,-65536,32768) c=(0,196608,-98304) ox=(0,196608,-98304) eq=true
    vm_vec_sub2 d=(12345,-54321,99999) s=(67890,13579,-24680) c=(-55545,-67900,124679) ox=(-55545,-67900,124679) eq=true
    vm_vec_sub2 d=(2147483647,0,-2147483648) s=(1,-1,2) c=(2147483646,1,2147483646) ox=(2147483646,1,2147483646) eq=true
    |}]

let%expect_test "vm_vec_avg parity C vs Ox" =
  check_vec3_binop "vm_vec_avg" c_vm_vec_avg Ox_math.vm_vec_avg vm_vec_avg_cases;
  [%expect
    {|
    vm_vec_avg a=(0,0,0) b=(0,0,0) c=(0,0,0) ox=(0,0,0) eq=true
    vm_vec_avg a=(65536,131072,-65536) b=(65536,-65536,32768) c=(65536,32768,-16384) ox=(65536,32768,-16384) eq=true
    vm_vec_avg a=(12345,-54321,99999) b=(67890,13579,-24680) c=(40117,-20371,37659) ox=(40117,-20371,37659) eq=true
    vm_vec_avg a=(2147483647,0,-2147483648) b=(1,-1,2) c=(-1073741824,0,-1073741823) ox=(-1073741824,0,-1073741823) eq=true
    |}]

let%expect_test "vm_vec_avg4 parity C vs Ox" =
  check_vec3_avg4 "vm_vec_avg4" c_vm_vec_avg4 Ox_math.vm_vec_avg4 vm_vec_avg4_cases;
  [%expect
    {|
    vm_vec_avg4 a=(0,0,0) b=(0,0,0) c=(0,0,0) d=(0,0,0) out=(0,0,0) ox=(0,0,0) eq=true
    vm_vec_avg4 a=(65536,131072,-65536) b=(65536,-65536,32768) c=(12345,-54321,99999) d=(67890,13579,-24680) out=(52826,6198,10637) ox=(52826,6198,10637) eq=true
    vm_vec_avg4 a=(2147483647,0,-2147483648) b=(1,-1,2) c=(-1,1,-2) d=(7,-7,14) out=(-536870910,-1,-536870908) ox=(-536870910,-1,-536870908) eq=true
    |}]

let%expect_test "vm_vec_copy_scale parity C vs Ox" =
  check_vec3_scale "vm_vec_copy_scale" c_vm_vec_copy_scale Ox_math.vm_vec_copy_scale vm_vec_copy_scale_cases;
  [%expect
    {|
    vm_vec_copy_scale s=(0,0,0) k=0 out=(0,0,0) ox=(0,0,0) eq=true
    vm_vec_copy_scale s=(65536,131072,-65536) k=65536 out=(65536,131072,-65536) ox=(65536,131072,-65536) eq=true
    vm_vec_copy_scale s=(12345,-54321,99999) k=321 out=(60,-267,489) ox=(60,-267,489) eq=true
    vm_vec_copy_scale s=(2147483647,0,-2147483648) k=65536 out=(2147483647,0,-2147483648) ox=(2147483647,0,-2147483648) eq=true
    |}]

let%expect_test "vm_vec_scale parity C vs Ox" =
  check_vec3_scale "vm_vec_scale" c_vm_vec_scale Ox_math.vm_vec_scale vm_vec_scale_cases;
  [%expect
    {|
    vm_vec_scale s=(0,0,0) k=0 out=(0,0,0) ox=(0,0,0) eq=true
    vm_vec_scale s=(65536,131072,-65536) k=65536 out=(65536,131072,-65536) ox=(65536,131072,-65536) eq=true
    vm_vec_scale s=(12345,-54321,99999) k=321 out=(60,-267,489) ox=(60,-267,489) eq=true
    vm_vec_scale s=(2147483647,0,-2147483648) k=65536 out=(2147483647,0,-2147483648) ox=(2147483647,0,-2147483648) eq=true
    |}]

let%expect_test "vm_vec_mag parity C vs Ox" =
  check_vec3_to_scalar "vm_vec_mag" c_vm_vec_mag Ox_math.vm_vec_mag vm_vec_mag_cases;
  [%expect
    {|
    vm_vec_mag v=(0,0,0) c=0 ox=0 eq=true
    vm_vec_mag v=(65536,131072,-65536) c=160530 ox=160530 eq=true
    vm_vec_mag v=(12345,-54321,99999) c=114469 ox=114469 eq=true
    vm_vec_mag v=(1073741823,-1073741823,0) c=1518500249 ox=1518500249 eq=true
    |}]

let%expect_test "vm_vec_mag_quick parity C vs Ox" =
  check_vec3_to_scalar "vm_vec_mag_quick" c_vm_vec_mag_quick Ox_math.vm_vec_mag_quick vm_vec_mag_quick_cases;
  [%expect
    {|
    vm_vec_mag_quick v=(0,0,0) c=0 ox=0 eq=true
    vm_vec_mag_quick v=(65536,131072,-65536) c=167936 ox=167936 eq=true
    vm_vec_mag_quick v=(12345,-54321,99999) c=122683 ox=122683 eq=true
    vm_vec_mag_quick v=(2147483647,0,-2147483648) c=1744830463 ox=1744830463 eq=true
    |}]

let%expect_test "vm_vec_dist parity C vs Ox" =
  check_two_vec3_to_scalar "vm_vec_dist" c_vm_vec_dist Ox_math.vm_vec_dist vm_vec_dist_cases;
  [%expect
    {|
    vm_vec_dist v0=(0,0,0) v1=(0,0,0) c=0 ox=0 eq=true
    vm_vec_dist v0=(65536,131072,-65536) v1=(65536,-65536,32768) c=219815 ox=219815 eq=true
    vm_vec_dist v0=(12345,-54321,99999) v1=(67890,13579,-24680) c=152449 ox=152449 eq=true
    vm_vec_dist v0=(1073741823,-1073741823,0) v1=(-1073741823,1073741823,1) c=-1257966798 ox=-1257966798 eq=true
    |}]

let%expect_test "vm_vec_dist_quick parity C vs Ox" =
  check_two_vec3_to_scalar
    "vm_vec_dist_quick"
    c_vm_vec_dist_quick
    Ox_math.vm_vec_dist_quick
    vm_vec_dist_quick_cases;
  [%expect
    {|
    vm_vec_dist_quick v0=(0,0,0) v1=(0,0,0) c=0 ox=0 eq=true
    vm_vec_dist_quick v0=(65536,131072,-65536) v1=(65536,-65536,32768) c=233472 ox=233472 eq=true
    vm_vec_dist_quick v0=(12345,-54321,99999) v1=(67890,13579,-24680) c=160556 ox=160556 eq=true
    vm_vec_dist_quick v0=(2147483647,0,-2147483648) v1=(1,-1,2) c=-1342177284 ox=-1342177284 eq=true
    |}]

let%expect_test "vm_vec_dotprod parity C vs Ox" =
  check_two_vec3_to_scalar "vm_vec_dotprod" c_vm_vec_dotprod Ox_math.vm_vec_dotprod vm_vec_dotprod_cases;
  [%expect
    {|
    vm_vec_dotprod v0=(0,0,0) v1=(0,0,0) c=0 ox=0 eq=true
    vm_vec_dotprod v0=(65536,131072,-65536) v1=(65536,-65536,32768) c=-98304 ox=-98304 eq=true
    vm_vec_dotprod v0=(12345,-54321,99999) v1=(67890,13579,-24680) c=-36126 ox=-36126 eq=true
    vm_vec_dotprod v0=(2147483647,0,-2147483648) v1=(1,-1,2) c=-32769 ox=-32769 eq=true
    |}]

let%expect_test "vm_vec_dot3 parity C vs Ox" =
  check_two_vec3_to_scalar
    "vm_vec_dot3"
    c_vm_vec_dot3
    (fun (x, y, z) (vx, vy, vz) -> Ox_math.vm_vec_dot3 x y z (vx, vy, vz))
    vm_vec_dot3_cases;
  [%expect
    {|
    vm_vec_dot3 v0=(0,0,0) v1=(0,0,0) c=0 ox=0 eq=true
    vm_vec_dot3 v0=(65536,131072,-65536) v1=(65536,-65536,32768) c=-98304 ox=-98304 eq=true
    vm_vec_dot3 v0=(12345,-54321,99999) v1=(67890,13579,-24680) c=-36126 ox=-36126 eq=true
    vm_vec_dot3 v0=(2147483647,0,-2147483648) v1=(1,-1,2) c=-32769 ox=-32769 eq=true
    |}]

let%expect_test "vm_vec_crossprod parity C vs Ox" =
  check_vec3_binop "vm_vec_crossprod" c_vm_vec_crossprod Ox_math.vm_vec_crossprod vm_vec_crossprod_cases;
  [%expect
    {|
    vm_vec_crossprod a=(0,0,0) b=(0,0,0) c=(0,0,0) ox=(0,0,0) eq=true
    vm_vec_crossprod a=(65536,131072,-65536) b=(65536,-65536,32768) c=(0,-98304,-196608) ox=(0,-98304,-196608) eq=true
    vm_vec_crossprod a=(12345,-54321,99999) b=(67890,13579,-24680) c=(-264,108239,58830) ox=(-264,108239,58830) eq=true
    vm_vec_crossprod a=(2147483647,0,-2147483648) b=(1,-1,2) c=(32768,-98304,-32768) ox=(32768,-98304,-32768) eq=true
    |}]

let%expect_test "vm_vec_copy_normalize parity C vs Ox" =
  check_vec_copy_normalize_quick
    "vm_vec_copy_normalize"
    c_vm_vec_copy_normalize
    Ox_math.vm_vec_copy_normalize
    vm_vec_copy_normalize_cases;
  [%expect
    {|
    vm_vec_copy_normalize s=(0,0,0) m=(c:0 ox:0) out=(c:0,0,0 ox:0,0,0) eq=true
    vm_vec_copy_normalize s=(65536,131072,-65536) m=(c:160530 ox:160530) out=(c:26754,53509,-26754 ox:26754,53509,-26754) eq=true
    vm_vec_copy_normalize s=(12345,-54321,99999) m=(c:114469 ox:114469) out=(c:7067,-31099,57251 ox:7067,-31099,57251) eq=true
    vm_vec_copy_normalize s=(1073741823,-1073741823,0) m=(c:1518500249 ox:1518500249) out=(c:46340,-46340,0 ox:46340,-46340,0) eq=true
    |}]

let%expect_test "vm_vec_normalize parity C vs Ox" =
  check_vec_copy_normalize_quick
    "vm_vec_normalize"
    c_vm_vec_normalize
    Ox_math.vm_vec_normalize
    vm_vec_normalize_cases;
  [%expect
    {|
    vm_vec_normalize s=(0,0,0) m=(c:0 ox:0) out=(c:0,0,0 ox:0,0,0) eq=true
    vm_vec_normalize s=(65536,131072,-65536) m=(c:160530 ox:160530) out=(c:26754,53509,-26754 ox:26754,53509,-26754) eq=true
    vm_vec_normalize s=(12345,-54321,99999) m=(c:114469 ox:114469) out=(c:7067,-31099,57251 ox:7067,-31099,57251) eq=true
    vm_vec_normalize s=(1073741823,-1073741823,0) m=(c:1518500249 ox:1518500249) out=(c:46340,-46340,0 ox:46340,-46340,0) eq=true
    |}]

let%expect_test "vm_vec_normalized_dir parity C vs Ox" =
  check_vec_normalized_dir_quick
    "vm_vec_normalized_dir"
    c_vm_vec_normalized_dir
    Ox_math.vm_vec_normalized_dir
    vm_vec_normalized_dir_cases;
  [%expect
    {|
    vm_vec_normalized_dir end=(0,0,0) start=(0,0,0) m=(c:0 ox:0) out=(c:0,0,0 ox:0,0,0) eq=true
    vm_vec_normalized_dir end=(65536,131072,-65536) start=(65536,-65536,32768) m=(c:219815 ox:219815) out=(c:0,58617,-29308 ox:0,58617,-29308) eq=true
    vm_vec_normalized_dir end=(12345,-54321,99999) start=(67890,13579,-24680) m=(c:152449 ox:152449) out=(c:-23878,-29189,53598 ox:-23878,-29189,53598) eq=true
    vm_vec_normalized_dir end=(1073741823,-1073741823,0) start=(-1073741823,1073741823,1) m=(c:-1257966798 ox:-1257966798) out=(c:2147483646,-2147483646,-1 ox:2147483646,-2147483646,-1) eq=true
    |}]

let%expect_test "vm_vec_copy_normalize_quick parity C vs Ox" =
  check_vec_copy_normalize_quick
    "vm_vec_copy_normalize_quick"
    c_vm_vec_copy_normalize_quick
    Ox_math.vm_vec_copy_normalize_quick
    vm_vec_copy_normalize_quick_cases;
  [%expect
    {|
    vm_vec_copy_normalize_quick s=(0,0,0) m=(c:0 ox:0) out=(c:0,0,0 ox:0,0,0) eq=true
    vm_vec_copy_normalize_quick s=(65536,131072,-65536) m=(c:167936 ox:167936) out=(c:25575,51150,-25575 ox:25575,51150,-25575) eq=true
    vm_vec_copy_normalize_quick s=(12345,-54321,99999) m=(c:122683 ox:122683) out=(c:6594,-29017,53418 ox:6594,-29017,53418) eq=true
    vm_vec_copy_normalize_quick s=(2147483647,0,-2147483648) m=(c:1744830463 ox:1744830463) out=(c:80659,0,-80659 ox:80659,0,-80659) eq=true
    |}]

let%expect_test "vm_vec_normalize_quick parity C vs Ox" =
  check_vec_copy_normalize_quick
    "vm_vec_normalize_quick"
    c_vm_vec_normalize_quick
    Ox_math.vm_vec_normalize_quick
    vm_vec_normalize_quick_cases;
  [%expect
    {|
    vm_vec_normalize_quick s=(0,0,0) m=(c:0 ox:0) out=(c:0,0,0 ox:0,0,0) eq=true
    vm_vec_normalize_quick s=(65536,131072,-65536) m=(c:167936 ox:167936) out=(c:25575,51150,-25575 ox:25575,51150,-25575) eq=true
    vm_vec_normalize_quick s=(12345,-54321,99999) m=(c:122683 ox:122683) out=(c:6594,-29017,53418 ox:6594,-29017,53418) eq=true
    vm_vec_normalize_quick s=(2147483647,0,-2147483648) m=(c:1744830463 ox:1744830463) out=(c:80659,0,-80659 ox:80659,0,-80659) eq=true
    |}]

let%expect_test "vm_vec_normalized_dir_quick parity C vs Ox" =
  check_vec_normalized_dir_quick
    "vm_vec_normalized_dir_quick"
    c_vm_vec_normalized_dir_quick
    Ox_math.vm_vec_normalized_dir_quick
    vm_vec_normalized_dir_quick_cases;
  [%expect
    {|
    vm_vec_normalized_dir_quick end=(0,0,0) start=(0,0,0) m=(c:0 ox:0) out=(c:0,0,0 ox:0,0,0) eq=true
    vm_vec_normalized_dir_quick end=(65536,131072,-65536) start=(65536,-65536,32768) m=(c:233472 ox:233472) out=(c:0,55188,-27594 ox:0,55188,-27594) eq=true
    vm_vec_normalized_dir_quick end=(12345,-54321,99999) start=(67890,13579,-24680) m=(c:160556 ox:160556) out=(c:-22672,-27715,50891 ox:-22672,-27715,50891) eq=true
    vm_vec_normalized_dir_quick end=(2147483647,0,-2147483648) start=(1,-1,2) m=(c:-1342177284 ox:-1342177284) out=(c:2147483646,1,2147483646 ox:2147483646,1,2147483646) eq=true
    |}]

let%expect_test "vm_vec_make parity C vs Ox" =
  check_make3 "vm_vec_make" c_vm_vec_make Ox_math.vm_vec_make vm_vec_make_cases;
  [%expect
    {|
    vm_vec_make in=(0,0,0) c=(0,0,0) ox=(0,0,0) eq=true
    vm_vec_make in=(65536,131072,-65536) c=(65536,131072,-65536) ox=(65536,131072,-65536) eq=true
    vm_vec_make in=(12345,-54321,99999) c=(12345,-54321,99999) ox=(12345,-54321,99999) eq=true
    vm_vec_make in=(2147483647,0,-2147483648) c=(2147483647,0,-2147483648) ox=(2147483647,0,-2147483648) eq=true
    |}]

let%expect_test "vm_check_vec parity C vs Ox" =
  check_make3
    "vm_check_vec"
    c_vm_check_vec
    (fun x y z -> Ox_math.check_vec (x, y, z))
    vm_check_vec_cases;
  [%expect {|
    vm_check_vec in=(0,0,0) c=(0,0,0) ox=(0,0,0) eq=true
    vm_check_vec in=(1,2,3) c=(0,0,0) ox=(0,0,0) eq=true
    vm_check_vec in=(32767,-32767,16384) c=(8191,-8192,4096) ox=(8191,-8192,4096) eq=true
    vm_check_vec in=(1048576,2097152,-3145728) c=(65536,131072,-196608) ox=(65536,131072,-196608) eq=true
    vm_check_vec in=(1073741823,-1073741823,19088743) c=(262143,-262144,4660) ox=(262143,-262144,4660) eq=true
    |}]

let%expect_test "vm_angvec_make parity C vs Ox" =
  check_make3 "vm_angvec_make" c_vm_angvec_make Ox_math.vm_angvec_make vm_angvec_make_cases;
  [%expect
    {|
    vm_angvec_make in=(0,0,0) c=(0,0,0) ox=(0,0,0) eq=true
    vm_angvec_make in=(32767,-32768,12345) c=(32767,-32768,12345) ox=(32767,-32768,12345) eq=true
    vm_angvec_make in=(40000,-40000,65535) c=(-25536,25536,-1) ox=(-25536,25536,-1) eq=true
    vm_angvec_make in=(2147483647,0,-2147483648) c=(-1,0,0) ox=(-1,0,0) eq=true
    |}]

let%expect_test "vm_dist_to_plane parity C vs Ox" =
  check_three_vec3_to_scalar "vm_dist_to_plane" c_vm_dist_to_plane Ox_math.vm_dist_to_plane vm_dist_to_plane_cases;
  [%expect
    {|
    vm_dist_to_plane check=(0,0,0) norm=(0,0,0) plane=(0,0,0) c=0 ox=0 eq=true
    vm_dist_to_plane check=(65536,131072,-65536) norm=(65536,-65536,32768) plane=(65536,65536,65536) c=-131072 ox=-131072 eq=true
    vm_dist_to_plane check=(12345,-54321,99999) norm=(67890,13579,-24680) plane=(-11111,22222,-33333) c=-41773 ox=-41773 eq=true
    vm_dist_to_plane check=(2147483647,0,-2147483648) norm=(1,-1,2) plane=(7,-7,14) c=98303 ox=98303 eq=true
    |}]

let%expect_test "vm_vec_perp parity C vs Ox" =
  check_three_vec3_to_vec3 "vm_vec_perp" c_vm_vec_perp Ox_math.vm_vec_perp vm_vec_perp_cases;
  [%expect
    {|
    vm_vec_perp p0=(0,0,0) p1=(0,0,0) p2=(0,0,0) c=(0,0,0) ox=(0,0,0) eq=true
    vm_vec_perp p0=(65536,131072,-65536) p1=(65536,-65536,32768) p2=(196608,65536,131072) c=(-491520,196608,393216) ox=(-491520,196608,393216) eq=true
    vm_vec_perp p0=(12345,-54321,99999) p1=(67890,13579,-24680) p2=(-11111,22222,-33333) c=(7477,157629,89176) ox=(7477,157629,89176) eq=true
    vm_vec_perp p0=(2147483647,0,-2147483647) p1=(1,-1,2) p2=(7,-7,14) c=(-2,0,2) ox=(-2,0,2) eq=true
    |}]

let%expect_test "vm_vec_normal parity C vs Ox" =
  check_three_vec3_to_vec3 "vm_vec_normal" c_vm_vec_normal Ox_math.vm_vec_normal vm_vec_normal_cases;
  [%expect
    {|
    vm_vec_normal p0=(0,0,0) p1=(0,0,0) p2=(0,0,0) c=(0,0,0) ox=(0,0,0) eq=true
    vm_vec_normal p0=(65536,131072,-65536) p1=(65536,-65536,32768) p2=(196608,65536,131072) c=(-48847,19539,39078) ox=(-48847,19539,39078) eq=true
    vm_vec_normal p0=(12345,-54321,99999) p1=(67890,13579,-24680) p2=(-11111,22222,-33333) c=(2703,56992,32242) ox=(2703,56992,32242) eq=true
    vm_vec_normal p0=(2147483647,0,-2147483647) p1=(1,-1,2) p2=(7,-7,14) c=(-43690,0,43690) ox=(-43690,0,43690) eq=true
    |}]

let%expect_test "vm_vec_delta_ang_norm parity C vs Ox" =
  check_two_vec3_opt_to_scalar
    "vm_vec_delta_ang_norm"
    c_vm_vec_delta_ang_norm
    Ox_math.vm_vec_delta_ang_norm
    vm_vec_delta_ang_cases;
  [%expect {|
    vm_vec_delta_ang_norm v0=(65536,0,0) v1=(65536,0,0) f=None c=0 ox=0 eq=true
    vm_vec_delta_ang_norm v0=(65536,0,0) v1=(0,65536,0) f=None c=16384 ox=16384 eq=true
    vm_vec_delta_ang_norm v0=(65536,0,0) v1=(0,65536,0) f=Some(0,0,65536) c=16384 ox=16384 eq=true
    vm_vec_delta_ang_norm v0=(65536,0,0) v1=(0,65536,0) f=Some(0,0,-65536) c=-16384 ox=-16384 eq=true
    vm_vec_delta_ang_norm v0=(0,0,0) v1=(65536,0,0) f=Some(0,0,65536) c=16384 ox=16384 eq=true
    vm_vec_delta_ang_norm v0=(12345,-54321,99999) v1=(67890,13579,-24680) f=Some(-11111,22222,-33333) c=22474 ox=22474 eq=true
    vm_vec_delta_ang_norm v0=(2147483647,1,-2147483648) v1=(1,-1,2) f=None c=21846 ox=21846 eq=true
    |}]

let%expect_test "vm_vec_delta_ang parity C vs Ox" =
  check_two_vec3_opt_to_scalar
    "vm_vec_delta_ang"
    c_vm_vec_delta_ang
    Ox_math.vm_vec_delta_ang
    vm_vec_delta_ang_cases;
  [%expect {|
    vm_vec_delta_ang v0=(65536,0,0) v1=(65536,0,0) f=None c=0 ox=0 eq=true
    vm_vec_delta_ang v0=(65536,0,0) v1=(0,65536,0) f=None c=16384 ox=16384 eq=true
    vm_vec_delta_ang v0=(65536,0,0) v1=(0,65536,0) f=Some(0,0,65536) c=16384 ox=16384 eq=true
    vm_vec_delta_ang v0=(65536,0,0) v1=(0,65536,0) f=Some(0,0,-65536) c=-16384 ox=-16384 eq=true
    vm_vec_delta_ang v0=(0,0,0) v1=(65536,0,0) f=Some(0,0,65536) c=16384 ox=16384 eq=true
    vm_vec_delta_ang v0=(12345,-54321,99999) v1=(67890,13579,-24680) f=Some(-11111,22222,-33333) c=19360 ox=19360 eq=true
    vm_vec_delta_ang v0=(2147483647,1,-2147483648) v1=(1,-1,2) f=None c=0 ox=0 eq=true
    |}]

let%expect_test "vm_extract_angles_vector_normalized parity C vs Ox" =
  check_make3
    "vm_extract_angles_vector_normalized"
    c_vm_extract_angles_vector_normalized
    (fun x y z -> Ox_math.vm_extract_angles_vector_normalized (x, y, z))
    vm_extract_angles_vector_normalized_cases;
  [%expect {|
    vm_extract_angles_vector_normalized in=(65536,0,0) c=(0,0,16384) ox=(0,0,16384) eq=true
    vm_extract_angles_vector_normalized in=(0,65536,0) c=(16384,0,0) ox=(16384,0,0) eq=true
    vm_extract_angles_vector_normalized in=(0,-65536,0) c=(16384,0,0) ox=(16384,0,0) eq=true
    vm_extract_angles_vector_normalized in=(0,0,65536) c=(0,0,0) ox=(0,0,0) eq=true
    vm_extract_angles_vector_normalized in=(46340,0,46340) c=(0,0,8192) ox=(0,0,8192) eq=true
    vm_extract_angles_vector_normalized in=(12345,-54321,99999) c=(10191,0,1280) ox=(10191,0,1280) eq=true
    vm_extract_angles_vector_normalized in=(2147483647,0,-2147483648) c=(0,0,16384) ox=(0,0,16384) eq=true
    |}]

let%expect_test "vm_extract_angles_vector parity C vs Ox" =
  check_stateful_ang3_from_vec
    "vm_extract_angles_vector"
    c_vm_extract_angles_vector
    Ox_math.vm_extract_angles_vector
    vm_extract_angles_vector_cases;
  [%expect {|
    vm_extract_angles_vector a0=(0,0,0) v=(0,0,0) c=(0,0,0) ox=(0,0,0) eq=true
    vm_extract_angles_vector a0=(111,222,333) v=(0,0,0) c=(111,222,333) ox=(111,222,333) eq=true
    vm_extract_angles_vector a0=(0,0,0) v=(65536,0,0) c=(0,0,16384) ox=(0,0,16384) eq=true
    vm_extract_angles_vector a0=(-123,456,-789) v=(0,65536,0) c=(16384,0,0) ox=(16384,0,0) eq=true
    vm_extract_angles_vector a0=(2147483647,17,-2147483648) v=(12345,-54321,99999) c=(5157,0,1280) ox=(5157,0,1280) eq=true
    |}]

let%expect_test "vm_extract_angles_matrix parity C vs Ox" =
  check_mat_to_ang3
    "vm_extract_angles_matrix"
    c_vm_extract_angles_matrix
    Ox_math.vm_extract_angles_matrix
    vm_extract_angles_matrix_cases;
  [%expect {|
    vm_extract_angles_matrix c=(0,0,0) ox=(0,0,0) eq=true
    vm_extract_angles_matrix c=(-5882,-13829,-29413) ox=(-5882,-13829,-29413) eq=true
    vm_extract_angles_matrix c=(6711,16384,6143) ox=(6711,16384,6143) eq=true
    vm_extract_angles_matrix c=(4095,8192,12288) ox=(4095,8192,12288) eq=true
    |}]

let%expect_test "vm_vec_rotate parity C vs Ox" =
  check_vec3_mat_to_vec3 "vm_vec_rotate" c_vm_vec_rotate Ox_math.vm_vec_rotate vm_vec_rotate_cases;
  [%expect
    {|
    vm_vec_rotate v=(0,0,0) m=[65536,0,0;0,65536,0;0,0,65536] c=(0,0,0) ox=(0,0,0) eq=true
    vm_vec_rotate v=(65536,131072,-65536) m=[65536,0,0;0,65536,0;0,0,65536] c=(65536,131072,-65536) ox=(65536,131072,-65536) eq=true
    vm_vec_rotate v=(12345,-54321,99999) m=[12345,-54321,99999;67890,13579,-24680;-11111,22222,-33333] c=(199935,-36126,-71374) ox=(199935,-36126,-71374) eq=true
    vm_vec_rotate v=(2147483647,0,-2147483648) m=[2147483647,1,2;-3,-2147483648,4;5,-6,7] c=(2147483647,-229376,-65537) ox=(2147483647,-229376,-65537) eq=true
    |}]

let%expect_test "vm_transpose_matrix parity C vs Ox" =
  check_mat_unop "vm_transpose_matrix" c_vm_transpose_matrix Ox_math.vm_transpose_matrix vm_matrix_cases;
  [%expect
    {|
    vm_transpose_matrix c=[65536,0,0;0,65536,0;0,0,65536] ox=[65536,0,0;0,65536,0;0,0,65536] eq=true
    vm_transpose_matrix c=[12345,67890,-11111;-54321,13579,22222;99999,-24680,-33333] ox=[12345,67890,-11111;-54321,13579,22222;99999,-24680,-33333] eq=true
    vm_transpose_matrix c=[2147483647,-3,5;1,-2147483648,-6;2,4,7] ox=[2147483647,-3,5;1,-2147483648,-6;2,4,7] eq=true
    |}]

let%expect_test "vm_copy_transpose_matrix parity C vs Ox" =
  check_mat_unop "vm_copy_transpose_matrix" c_vm_copy_transpose_matrix Ox_math.vm_copy_transpose_matrix vm_matrix_cases;
  [%expect
    {|
    vm_copy_transpose_matrix c=[65536,0,0;0,65536,0;0,0,65536] ox=[65536,0,0;0,65536,0;0,0,65536] eq=true
    vm_copy_transpose_matrix c=[12345,67890,-11111;-54321,13579,22222;99999,-24680,-33333] ox=[12345,67890,-11111;-54321,13579,22222;99999,-24680,-33333] eq=true
    vm_copy_transpose_matrix c=[2147483647,-3,5;1,-2147483648,-6;2,4,7] ox=[2147483647,-3,5;1,-2147483648,-6;2,4,7] eq=true
    |}]

let%expect_test "vm_matrix_x_matrix parity C vs Ox" =
  check_mat_binop "vm_matrix_x_matrix" c_vm_matrix_x_matrix Ox_math.vm_matrix_x_matrix vm_matrix_x_matrix_cases;
  [%expect
    {|
    vm_matrix_x_matrix c=[65536,0,0;0,65536,0;0,0,65536] ox=[65536,0,0;0,65536,0;0,0,65536] eq=true
    vm_matrix_x_matrix c=[12345,-54321,99999;67890,13579,-24680;-11111,22222,-33333] ox=[12345,-54321,99999;67890,13579,-24680;-11111,22222,-33333] eq=true
    vm_matrix_x_matrix c=[12345,-54321,99999;67890,13579,-24680;-11111,22222,-33333] ox=[12345,-54321,99999;67890,13579,-24680;-11111,22222,-33333] eq=true
    vm_matrix_x_matrix c=[404520960,-1779990527,2147483647;-2147483647,-444956669,808714233;-7,-4,6] ox=[404520960,-1779990527,2147483647;-2147483647,-444956669,808714233;-7,-4,6] eq=true
    vm_matrix_x_matrix c=[404520969,1779990519,7;2147483647,-444956669,0;-364085252,-728170494,-3] ox=[404520969,1779990519,7;2147483647,-444956669,0;-364085252,-728170494,-3] eq=true
    vm_matrix_x_matrix c=[2147483647,-1,65536;0,2147483647,-131072;163840,196607,0] ox=[2147483647,-1,65536;0,2147483647,-131072;163840,196607,0] eq=true
    |}]

let%expect_test "vm_vector_2_matrix parity C vs Ox" =
  check_vec3_opt_opt_to_mat
    "vm_vector_2_matrix"
    c_vm_vector_2_matrix
    Ox_math.vm_vector_2_matrix
    vm_vector_2_matrix_cases;
  [%expect
    {|
    vm_vector_2_matrix f=(65536,0,0) u=None r=None c=[0,0,-65536;0,65536,0;65536,0,0] ox=[0,0,-65536;0,65536,0;65536,0,0] eq=true
    vm_vector_2_matrix f=(0,65536,0) u=None r=None c=[65536,0,0;0,0,-65536;0,65536,0] ox=[65536,0,0;0,0,-65536;0,65536,0] eq=true
    vm_vector_2_matrix f=(0,0,0) u=None r=None c=[65536,0,0;0,0,-65536;0,0,0] ox=[65536,0,0;0,0,-65536;0,0,0] eq=true
    vm_vector_2_matrix f=(65536,8192,12288) u=Some(0,65536,0) r=None c=[12077,0,-64412;-7854,65044,-1473;63932,7991,11987] ox=[12077,0,-64412;-7854,65044,-1473;63932,7991,11987] eq=true
    vm_vector_2_matrix f=(65536,8192,12288) u=None r=Some(65536,0,0) c=[14405,-35461,-53193;0,54527,-36350;63932,7991,11987] ox=[14405,-35461,-53193;0,54527,-36350;63932,7991,11987] eq=true
    vm_vector_2_matrix f=(65536,8192,12288) u=Some(0,65536,0) r=Some(65536,0,0) c=[12077,0,-64412;-7854,65044,-1473;63932,7991,11987] ox=[12077,0,-64412;-7854,65044,-1473;63932,7991,11987] eq=true
    vm_vector_2_matrix f=(65536,8192,12288) u=Some(0,0,0) r=Some(65536,0,0) c=[12077,0,-64412;-7854,65044,-1473;63932,7991,11987] ox=[12077,0,-64412;-7854,65044,-1473;63932,7991,11987] eq=true
    |}]

let%expect_test "vm_vector_2_matrix_norm parity C vs Ox" =
  check_vec3_opt_opt_to_mat
    "vm_vector_2_matrix_norm"
    c_vm_vector_2_matrix_norm
    Ox_math.vm_vector_2_matrix_norm
    vm_vector_2_matrix_norm_cases;
  [%expect
    {|
    vm_vector_2_matrix_norm f=(65536,0,0) u=None r=None c=[0,0,-65536;0,65536,0;65536,0,0] ox=[0,0,-65536;0,65536,0;65536,0,0] eq=true
    vm_vector_2_matrix_norm f=(0,65536,0) u=None r=None c=[65536,0,0;0,0,-65536;0,65536,0] ox=[65536,0,0;0,0,-65536;0,65536,0] eq=true
    vm_vector_2_matrix_norm f=(0,0,0) u=None r=None c=[65536,0,0;0,0,-65536;0,0,0] ox=[65536,0,0;0,0,-65536;0,0,0] eq=true
    vm_vector_2_matrix_norm f=(65536,8192,12288) u=Some(0,65536,0) r=None c=[12077,0,-64412;-8052,66676,-1510;65536,8192,12288] ox=[12077,0,-64412;-8052,66676,-1510;65536,8192,12288] eq=true
    vm_vector_2_matrix_norm f=(65536,8192,12288) u=None r=Some(65536,0,0) c=[14767,-36351,-54526;0,54526,-36351;65536,8192,12288] ox=[14767,-36351,-54526;0,54526,-36351;65536,8192,12288] eq=true
    vm_vector_2_matrix_norm f=(65536,8192,12288) u=Some(0,65536,0) r=Some(65536,0,0) c=[12077,0,-64412;-8052,66676,-1510;65536,8192,12288] ox=[12077,0,-64412;-8052,66676,-1510;65536,8192,12288] eq=true
    vm_vector_2_matrix_norm f=(65536,8192,12288) u=Some(0,0,0) r=Some(65536,0,0) c=[12077,0,-64412;-8052,66676,-1510;65536,8192,12288] ox=[12077,0,-64412;-8052,66676,-1510;65536,8192,12288] eq=true
    |}]

let%expect_test "sincos_2_matrix parity C vs Ox" =
  check_six_fix_to_mat
    "sincos_2_matrix"
    c_sincos_2_matrix
    Ox_math.sincos_2_matrix
    sincos_2_matrix_cases;
  [%expect
    {|
    sincos_2_matrix s=(0,65536,0,65536,0,65536) c=[65536,0,0;0,65536,0;0,0,65536] ox=[65536,0,0;0,65536,0;0,0,65536] eq=true
    sincos_2_matrix s=(8192,65280,4096,61440,2048,63488) c=[59536,4080,-1424;-3728,61200,7568;2040,-8192,63240] ox=[59536,4080,-1424;-3728,61200,7568;2040,-8192,63240] eq=true
    sincos_2_matrix s=(12345,-54321,22222,-33333,44444,-55555) c=[31094,-18420,19057;14579,27628,20392;-36839,-12345,46048] ox=[31094,-18420,19057;14579,27628,20392;-36839,-12345,46048] eq=true
    sincos_2_matrix s=(2147483647,65536,-2147483648,32768,-65536,131072) c=[98304,-2147483648,32768;-1073741824,32768,-1;-65536,-2147483647,131072] ox=[98304,-2147483648,32768;-1073741824,32768,-1;-65536,-2147483647,131072] eq=true
    |}]

let%expect_test "vm_angles_2_matrix parity C vs Ox" =
  check_ang3_to_mat
    "vm_angles_2_matrix"
    c_vm_angles_2_matrix
    Ox_math.vm_angles_2_matrix
    vm_angles_2_matrix_cases;
  [%expect {|
    vm_angles_2_matrix a=(0,0,0) c=[65536,0,0;0,65536,0;0,0,65536] ox=[65536,0,0;0,65536,0;0,0,65536] eq=true
    vm_angles_2_matrix a=(4096,8192,12288) c=[34117,42813,-36027;-1349,42813,49599;55939,-25080,23171] ox=[34117,42813,-36027;-1349,42813,49599;55939,-25080,23171] eq=true
    vm_angles_2_matrix a=(-16384,32767,-32767) c=[65537,0,-4;-4,0,-65537;0,65536,0] ox=[65537,0,-4;-4,0,-65537;0,65536,0] eq=true
    vm_angles_2_matrix a=(40000,-40000,65535) c=[-50398,-32214,-26773;-41885,38765,32205;6,41884,-50401] ox=[-50398,-32214,-26773;-41885,38765,32205;6,41884,-50401] eq=true
    vm_angles_2_matrix a=(2147483647,0,-2147483648) c=[65536,0,0;0,65532,-8;0,8,65532] ox=[65536,0,0;0,65532,-8;0,8,65532] eq=true
    |}]

let%expect_test "vm_vec_ang_2_matrix parity C vs Ox" =
  check_vec3_fixang_to_mat
    "vm_vec_ang_2_matrix"
    c_vm_vec_ang_2_matrix
    Ox_math.vm_vec_ang_2_matrix
    vm_vec_ang_2_matrix_cases;
  [%expect {|
    vm_vec_ang_2_matrix v=(65536,0,0) a=0 c=[0,0,-65536;0,65536,0;65536,0,0] ox=[0,0,-65536;0,65536,0;65536,0,0] eq=true
    vm_vec_ang_2_matrix v=(8192,-16384,28672) a=4608 c=[27657,27144,-4481;-10742,57392,10303;8191,-16384,28671] ox=[27657,27144,-4481;-10742,57392,10303;8191,-16384,28671] eq=true
    vm_vec_ang_2_matrix v=(12345,-54321,99999) a=-12345 c=[50276,-34135,-144731;171483,13918,35312;12344,-54321,99999] ox=[50276,-34135,-144731;171483,13918,35312;12344,-54321,99999] eq=true
    vm_vec_ang_2_matrix v=(2147483647,0,-2147483648) a=32767 c=[-2147483648,4,2147483647;131072,-65536,131071;2147483647,0,-2147483648] ox=[-2147483648,4,2147483647;131072,-65536,131071;2147483647,0,-2147483648] eq=true
    vm_vec_ang_2_matrix v=(-65536,65536,65536) a=-32768 c=[-1,0,1;1,0,1;0,65536,0] ox=[-1,0,1;1,0,1;0,65536,0] eq=true
    |}]

let%expect_test "randomized fixmul parity C vs Ox" =
  run_random_binop ~name:"fixmul" ~seed:"fixmul-seed-v1" ~test_count:5000 c_fixmul Ox_math.fixmul;
  [%expect {| fixmul random total=5000 mismatches=0 |}]

let%expect_test "randomized fixdiv parity C vs Ox" =
  run_random_binop ~name:"fixdiv" ~seed:"fixdiv-seed-v1" ~test_count:5000 c_fixdiv Ox_math.fixdiv;
  [%expect {| fixdiv random total=5000 mismatches=0 |}]

let%expect_test "randomized fixmuldiv parity C vs Ox" =
  run_random_ternop
    ~name:"fixmuldiv"
    ~seed:"fixmuldiv-seed-v1"
    ~test_count:5000
    c_fixmuldiv
    Ox_math.fixmuldiv;
  [%expect {| fixmuldiv random total=5000 mismatches=0 |}]

let%expect_test "randomized long_sqrt parity C vs Ox" =
  run_random_unop ~name:"long_sqrt" ~seed:"long-sqrt-seed-v1" ~test_count:5000 c_long_sqrt Ox_math.long_sqrt;
  [%expect {| long_sqrt random total=5000 mismatches=0 |}]

let%expect_test "randomized quad_sqrt parity C vs Ox" =
  run_random_unop_i64
    ~name:"quad_sqrt"
    ~seed:"quad-sqrt-seed-v1"
    ~test_count:5000
    c_quad_sqrt
    (fun q -> Ox_math.wrap_i64_to_fix (Ox_math.quad_sqrt q));
  [%expect {| quad_sqrt random total=5000 mismatches=0 |}]

let%expect_test "randomized fixquadadjust parity C vs Ox" =
  run_random_unop_i64
    ~name:"fixquadadjust"
    ~seed:"fixquadadjust-seed-v1"
    ~test_count:5000
    c_fixquadadjust
    Ox_math.fixquadadjust;
  [%expect {| fixquadadjust random total=5000 mismatches=0 |}]

let%expect_test "randomized fixmulaccum parity C vs Ox" =
  let gen =
    Quickcheck.Generator.map
      (Quickcheck.Generator.both fixmulaccum_q_gen (Quickcheck.Generator.both small_fix_gen small_fix_gen))
      ~f:(fun (q, (a, b)) -> q, a, b)
  in
  run_random_ternop_i64_out_with_gen
    ~name:"fixmulaccum"
    ~seed:"fixmulaccum-seed-v1"
    ~test_count:5000
    ~gen
    c_fixmulaccum
    Ox_math.fixmulaccum;
  [%expect {| fixmulaccum random total=5000 mismatches=0 |}]

let%expect_test "randomized fixdivquadlong parity C vs Ox" =
  let gen =
    Quickcheck.Generator.map
      (Quickcheck.Generator.both int64_gen fix_gen)
      ~f:(fun (n, d) -> n, if Int.equal d 0 then 1 else d)
  in
  run_random_binop_i64_int_with_gen
    ~name:"fixdivquadlong"
    ~seed:"fixdivquadlong-seed-v1"
    ~test_count:5000
    ~gen
    c_fixdivquadlong
    Ox_math.fixdivquadlong;
  [%expect {| fixdivquadlong random total=5000 mismatches=0 |}]

let%expect_test "randomized fixquadnegate parity C vs Ox" =
  run_random_binop_pair
    ~name:"fixquadnegate"
    ~seed:"fixquadnegate-seed-v1"
    ~test_count:5000
    c_fixquadnegate
    Ox_math.fixquadnegate;
  [%expect {| fixquadnegate random total=5000 mismatches=0 |}]

let%expect_test "randomized ufixdivquadlong parity C vs Ox" =
  run_random_ternop
    ~name:"ufixdivquadlong"
    ~seed:"ufixdivquadlong-seed-v1"
    ~test_count:5000
    (fun nl nh d ->
      let d = if Int.equal d 0 then 1 else d in
      c_ufixdivquadlong nl nh d)
    (fun nl nh d ->
      let d = if Int.equal d 0 then 1 else d in
      Ox_math.ufixdivquadlong nl nh d);
  [%expect {| ufixdivquadlong random total=5000 mismatches=0 |}]

let%expect_test "randomized fix_sqrt parity C vs Ox" =
  run_random_unop ~name:"fix_sqrt" ~seed:"fix-sqrt-seed-v1" ~test_count:5000 c_fix_sqrt Ox_math.fix_sqrt;
  [%expect {| fix_sqrt random total=5000 mismatches=0 |}]

let%expect_test "randomized fix_isqrt parity C vs Ox" =
  run_random_unop_with_gen
    ~name:"fix_isqrt"
    ~seed:"fix-isqrt-seed-v1"
    ~test_count:5000
    ~gen:fix_nonneg_gen
    c_fix_isqrt
    Ox_math.fix_isqrt;
  [%expect {| fix_isqrt random total=5000 mismatches=0 |}]

let%expect_test "randomized fix_sincos parity C vs Ox" =
  run_random_unop_pair
    ~name:"fix_sincos"
    ~seed:"fix-sincos-seed-v1"
    ~test_count:5000
    c_fix_sincos
    Ox_math.fix_sincos;
  [%expect {| fix_sincos random total=5000 mismatches=0 |}]

let%expect_test "randomized fix_fastsincos parity C vs Ox" =
  run_random_unop_pair
    ~name:"fix_fastsincos"
    ~seed:"fix-fastsincos-seed-v1"
    ~test_count:5000
    c_fix_fastsincos
    Ox_math.fix_fastsincos;
  [%expect {| fix_fastsincos random total=5000 mismatches=0 |}]

let%expect_test "randomized fix_acos parity C vs Ox" =
  run_random_unop ~name:"fix_acos" ~seed:"fix-acos-seed-v1" ~test_count:5000 c_fix_acos Ox_math.fix_acos;
  [%expect {| fix_acos random total=5000 mismatches=0 |}]

let%expect_test "randomized fix_asin parity C vs Ox" =
  run_random_unop ~name:"fix_asin" ~seed:"fix-asin-seed-v1" ~test_count:5000 c_fix_asin Ox_math.fix_asin;
  [%expect {| fix_asin random total=5000 mismatches=0 |}]

let%expect_test "randomized fix_atan2 parity C vs Ox" =
  run_random_binop ~name:"fix_atan2" ~seed:"fix-atan2-seed-v1" ~test_count:5000 c_fix_atan2 Ox_math.fix_atan2;
  [%expect {| fix_atan2 random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_scale_add2 parity C vs Ox" =
  run_random_stateful_vec3
    ~name:"vm_vec_scale_add2"
    ~seed:"vm-vec-scale-add2-seed-v1"
    ~test_count:5000
    c_vm_vec_scale_add2
    Ox_math.vm_vec_scale_add2;
  [%expect {| vm_vec_scale_add2 random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_scale_add parity C vs Ox" =
  run_random_vec3_bin_scale
    ~name:"vm_vec_scale_add"
    ~seed:"vm-vec-scale-add-seed-v1"
    ~test_count:5000
    c_vm_vec_scale_add
    Ox_math.vm_vec_scale_add;
  [%expect {| vm_vec_scale_add random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_scale2 parity C vs Ox" =
  run_random_stateful_vec3_scale2
    ~name:"vm_vec_scale2"
    ~seed:"vm-vec-scale2-seed-v1"
    ~test_count:5000
    c_vm_vec_scale2
    Ox_math.vm_vec_scale2;
  [%expect {| vm_vec_scale2 random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_add parity C vs Ox" =
  run_random_vec3_binop
    ~name:"vm_vec_add"
    ~seed:"vm-vec-add-seed-v1"
    ~test_count:5000
    c_vm_vec_add
    Ox_math.vm_vec_add;
  [%expect {| vm_vec_add random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_sub parity C vs Ox" =
  run_random_vec3_binop
    ~name:"vm_vec_sub"
    ~seed:"vm-vec-sub-seed-v1"
    ~test_count:5000
    c_vm_vec_sub
    Ox_math.vm_vec_sub;
  [%expect {| vm_vec_sub random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_add2 parity C vs Ox" =
  run_random_stateful_vec3_add2
    ~name:"vm_vec_add2"
    ~seed:"vm-vec-add2-seed-v1"
    ~test_count:5000
    c_vm_vec_add2
    Ox_math.vm_vec_add2;
  [%expect {| vm_vec_add2 random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_sub2 parity C vs Ox" =
  run_random_stateful_vec3_add2
    ~name:"vm_vec_sub2"
    ~seed:"vm-vec-sub2-seed-v1"
    ~test_count:5000
    c_vm_vec_sub2
    Ox_math.vm_vec_sub2;
  [%expect {| vm_vec_sub2 random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_avg parity C vs Ox" =
  run_random_vec3_binop
    ~name:"vm_vec_avg"
    ~seed:"vm-vec-avg-seed-v1"
    ~test_count:5000
    c_vm_vec_avg
    Ox_math.vm_vec_avg;
  [%expect {| vm_vec_avg random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_avg4 parity C vs Ox" =
  run_random_vec3_avg4
    ~name:"vm_vec_avg4"
    ~seed:"vm-vec-avg4-seed-v1"
    ~test_count:5000
    c_vm_vec_avg4
    Ox_math.vm_vec_avg4;
  [%expect {| vm_vec_avg4 random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_copy_scale parity C vs Ox" =
  run_random_vec3_scale
    ~name:"vm_vec_copy_scale"
    ~seed:"vm-vec-copy-scale-seed-v1"
    ~test_count:5000
    c_vm_vec_copy_scale
    Ox_math.vm_vec_copy_scale;
  [%expect {| vm_vec_copy_scale random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_scale parity C vs Ox" =
  run_random_vec3_scale
    ~name:"vm_vec_scale"
    ~seed:"vm-vec-scale-seed-v1"
    ~test_count:5000
    c_vm_vec_scale
    Ox_math.vm_vec_scale;
  [%expect {| vm_vec_scale random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_mag parity C vs Ox" =
  run_random_vec3_to_scalar_with_gen
    ~name:"vm_vec_mag"
    ~seed:"vm-vec-mag-seed-v1"
    ~test_count:5000
    ~gen:vec3_mag_safe_gen
    c_vm_vec_mag
    Ox_math.vm_vec_mag;
  [%expect {| vm_vec_mag random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_mag_quick parity C vs Ox" =
  run_random_vec3_to_scalar
    ~name:"vm_vec_mag_quick"
    ~seed:"vm-vec-mag-quick-seed-v1"
    ~test_count:5000
    c_vm_vec_mag_quick
    Ox_math.vm_vec_mag_quick;
  [%expect {| vm_vec_mag_quick random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_dist parity C vs Ox" =
  run_random_two_vec3_to_scalar_with_gen
    ~name:"vm_vec_dist"
    ~seed:"vm-vec-dist-seed-v1"
    ~test_count:5000
    ~gen:(Quickcheck.Generator.both vec3_mag_safe_gen vec3_mag_safe_gen)
    c_vm_vec_dist
    Ox_math.vm_vec_dist;
  [%expect {| vm_vec_dist random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_dist_quick parity C vs Ox" =
  run_random_two_vec3_to_scalar
    ~name:"vm_vec_dist_quick"
    ~seed:"vm-vec-dist-quick-seed-v1"
    ~test_count:5000
    c_vm_vec_dist_quick
    Ox_math.vm_vec_dist_quick;
  [%expect {| vm_vec_dist_quick random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_dotprod parity C vs Ox" =
  run_random_two_vec3_to_scalar
    ~name:"vm_vec_dotprod"
    ~seed:"vm-vec-dotprod-seed-v1"
    ~test_count:5000
    c_vm_vec_dotprod
    Ox_math.vm_vec_dotprod;
  [%expect {| vm_vec_dotprod random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_dot3 parity C vs Ox" =
  run_random_two_vec3_to_scalar
    ~name:"vm_vec_dot3"
    ~seed:"vm-vec-dot3-seed-v1"
    ~test_count:5000
    c_vm_vec_dot3
    (fun (x, y, z) (vx, vy, vz) -> Ox_math.vm_vec_dot3 x y z (vx, vy, vz));
  [%expect {| vm_vec_dot3 random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_crossprod parity C vs Ox" =
  run_random_vec3_binop
    ~name:"vm_vec_crossprod"
    ~seed:"vm-vec-crossprod-seed-v1"
    ~test_count:5000
    c_vm_vec_crossprod
    Ox_math.vm_vec_crossprod;
  [%expect {| vm_vec_crossprod random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_copy_normalize parity C vs Ox" =
  run_random_vec_copy_normalize_with_gen
    ~name:"vm_vec_copy_normalize"
    ~seed:"vm-vec-copy-normalize-seed-v1"
    ~test_count:5000
    ~gen:vec3_mag_safe_gen
    c_vm_vec_copy_normalize
    Ox_math.vm_vec_copy_normalize;
  [%expect {| vm_vec_copy_normalize random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_normalize parity C vs Ox" =
  run_random_vec_copy_normalize_with_gen
    ~name:"vm_vec_normalize"
    ~seed:"vm-vec-normalize-seed-v1"
    ~test_count:5000
    ~gen:vec3_mag_safe_gen
    c_vm_vec_normalize
    Ox_math.vm_vec_normalize;
  [%expect {| vm_vec_normalize random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_normalized_dir parity C vs Ox" =
  run_random_vec_normalized_dir_with_gen
    ~name:"vm_vec_normalized_dir"
    ~seed:"vm-vec-normalized-dir-seed-v1"
    ~test_count:5000
    ~gen:(Quickcheck.Generator.both vec3_mag_safe_gen vec3_mag_safe_gen)
    c_vm_vec_normalized_dir
    Ox_math.vm_vec_normalized_dir;
  [%expect {| vm_vec_normalized_dir random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_copy_normalize_quick parity C vs Ox" =
  run_random_vec_copy_normalize_quick
    ~name:"vm_vec_copy_normalize_quick"
    ~seed:"vm-vec-copy-normalize-quick-seed-v1"
    ~test_count:5000
    c_vm_vec_copy_normalize_quick
    Ox_math.vm_vec_copy_normalize_quick;
  [%expect {| vm_vec_copy_normalize_quick random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_normalize_quick parity C vs Ox" =
  run_random_vec_copy_normalize_quick
    ~name:"vm_vec_normalize_quick"
    ~seed:"vm-vec-normalize-quick-seed-v1"
    ~test_count:5000
    c_vm_vec_normalize_quick
    Ox_math.vm_vec_normalize_quick;
  [%expect {| vm_vec_normalize_quick random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_normalized_dir_quick parity C vs Ox" =
  run_random_vec_normalized_dir_quick
    ~name:"vm_vec_normalized_dir_quick"
    ~seed:"vm-vec-normalized-dir-quick-seed-v1"
    ~test_count:5000
    c_vm_vec_normalized_dir_quick
    Ox_math.vm_vec_normalized_dir_quick;
  [%expect {| vm_vec_normalized_dir_quick random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_make parity C vs Ox" =
  run_random_make3
    ~name:"vm_vec_make"
    ~seed:"vm-vec-make-seed-v1"
    ~test_count:5000
    vec3_gen
    c_vm_vec_make
    Ox_math.vm_vec_make;
  [%expect {| vm_vec_make random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_check_vec parity C vs Ox" =
  run_random_make3
    ~name:"vm_check_vec"
    ~seed:"vm-check-vec-seed-v1"
    ~test_count:5000
    vec3_mag_safe_gen
    c_vm_check_vec
    (fun x y z -> Ox_math.check_vec (x, y, z));
  [%expect {| vm_check_vec random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_angvec_make parity C vs Ox" =
  run_random_make3
    ~name:"vm_angvec_make"
    ~seed:"vm-angvec-make-seed-v1"
    ~test_count:5000
    ang3_gen
    c_vm_angvec_make
    Ox_math.vm_angvec_make;
  [%expect {| vm_angvec_make random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_dist_to_plane parity C vs Ox" =
  run_random_three_vec3_to_scalar
    ~name:"vm_dist_to_plane"
    ~seed:"vm-dist-to-plane-seed-v1"
    ~test_count:5000
    c_vm_dist_to_plane
    Ox_math.vm_dist_to_plane;
  [%expect {| vm_dist_to_plane random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_perp parity C vs Ox" =
  run_random_three_vec3_to_vec3_no_min
    ~name:"vm_vec_perp"
    ~seed:"vm-vec-perp-seed-v1"
    ~test_count:5000
    c_vm_vec_perp
    Ox_math.vm_vec_perp;
  [%expect {| vm_vec_perp random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_normal parity C vs Ox" =
  run_random_three_vec3_to_vec3_no_min
    ~name:"vm_vec_normal"
    ~seed:"vm-vec-normal-seed-v1"
    ~test_count:5000
    c_vm_vec_normal
    Ox_math.vm_vec_normal;
  [%expect {| vm_vec_normal random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_delta_ang_norm parity C vs Ox" =
  run_random_two_vec3_opt_to_scalar
    ~name:"vm_vec_delta_ang_norm"
    ~seed:"vm-vec-delta-ang-norm-seed-v1"
    ~test_count:5000
    c_vm_vec_delta_ang_norm
    Ox_math.vm_vec_delta_ang_norm;
  [%expect {| vm_vec_delta_ang_norm random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_delta_ang parity C vs Ox" =
  run_random_two_vec3_opt_to_scalar
    ~name:"vm_vec_delta_ang"
    ~seed:"vm-vec-delta-ang-seed-v1"
    ~test_count:5000
    c_vm_vec_delta_ang
    Ox_math.vm_vec_delta_ang;
  [%expect {| vm_vec_delta_ang random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_extract_angles_vector_normalized parity C vs Ox" =
  run_random_make3
    ~name:"vm_extract_angles_vector_normalized"
    ~seed:"vm-extract-angles-vector-normalized-seed-v1"
    ~test_count:5000
    vec3_gen
    c_vm_extract_angles_vector_normalized
    (fun x y z -> Ox_math.vm_extract_angles_vector_normalized (x, y, z));
  [%expect {| vm_extract_angles_vector_normalized random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_extract_angles_vector parity C vs Ox" =
  run_random_stateful_ang3_from_vec
    ~name:"vm_extract_angles_vector"
    ~seed:"vm-extract-angles-vector-seed-v1"
    ~test_count:5000
    c_vm_extract_angles_vector
    Ox_math.vm_extract_angles_vector;
  [%expect {| vm_extract_angles_vector random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_extract_angles_matrix parity C vs Ox" =
  run_random_mat_to_ang3
    ~name:"vm_extract_angles_matrix"
    ~seed:"vm-extract-angles-matrix-seed-v1"
    ~test_count:5000
    c_vm_extract_angles_matrix
    Ox_math.vm_extract_angles_matrix;
  [%expect {| vm_extract_angles_matrix random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_rotate parity C vs Ox" =
  run_random_vec3_mat_to_vec3
    ~name:"vm_vec_rotate"
    ~seed:"vm-vec-rotate-seed-v1"
    ~test_count:5000
    c_vm_vec_rotate
    Ox_math.vm_vec_rotate;
  [%expect {| vm_vec_rotate random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_transpose_matrix parity C vs Ox" =
  run_random_mat_unop
    ~name:"vm_transpose_matrix"
    ~seed:"vm-transpose-matrix-seed-v1"
    ~test_count:5000
    c_vm_transpose_matrix
    Ox_math.vm_transpose_matrix;
  [%expect {| vm_transpose_matrix random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_copy_transpose_matrix parity C vs Ox" =
  run_random_mat_unop
    ~name:"vm_copy_transpose_matrix"
    ~seed:"vm-copy-transpose-matrix-seed-v1"
    ~test_count:5000
    c_vm_copy_transpose_matrix
    Ox_math.vm_copy_transpose_matrix;
  [%expect {| vm_copy_transpose_matrix random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_matrix_x_matrix parity C vs Ox" =
  run_random_mat_binop
    ~name:"vm_matrix_x_matrix"
    ~seed:"vm-matrix-x-matrix-seed-v1"
    ~test_count:5000
    c_vm_matrix_x_matrix
    Ox_math.vm_matrix_x_matrix;
  [%expect {| vm_matrix_x_matrix random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vector_2_matrix parity C vs Ox" =
  run_random_vec3_opt_opt_to_mat
    ~name:"vm_vector_2_matrix"
    ~seed:"vm-vector-2-matrix-seed-v1"
    ~test_count:5000
    ~gen:vec3_with_optional_axes_gen
    c_vm_vector_2_matrix
    Ox_math.vm_vector_2_matrix;
  [%expect {| vm_vector_2_matrix random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vector_2_matrix_norm parity C vs Ox" =
  run_random_vec3_opt_opt_to_mat
    ~name:"vm_vector_2_matrix_norm"
    ~seed:"vm-vector-2-matrix-norm-seed-v1"
    ~test_count:5000
    ~gen:vec3_with_optional_axes_gen
    c_vm_vector_2_matrix_norm
    Ox_math.vm_vector_2_matrix_norm;
  [%expect {| vm_vector_2_matrix_norm random total=5000 mismatches=0 |}]

let%expect_test "randomized sincos_2_matrix parity C vs Ox" =
  run_random_six_fix_to_mat
    ~name:"sincos_2_matrix"
    ~seed:"sincos-2-matrix-seed-v1"
    ~test_count:5000
    c_sincos_2_matrix
    Ox_math.sincos_2_matrix;
  [%expect {| sincos_2_matrix random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_angles_2_matrix parity C vs Ox" =
  run_random_ang3_to_mat
    ~name:"vm_angles_2_matrix"
    ~seed:"vm-angles-2-matrix-seed-v1"
    ~test_count:5000
    c_vm_angles_2_matrix
    Ox_math.vm_angles_2_matrix;
  [%expect {| vm_angles_2_matrix random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_ang_2_matrix parity C vs Ox" =
  run_random_vec3_fixang_to_mat
    ~name:"vm_vec_ang_2_matrix"
    ~seed:"vm-vec-ang-2-matrix-seed-v1"
    ~test_count:5000
    c_vm_vec_ang_2_matrix
    Ox_math.vm_vec_ang_2_matrix;
  [%expect {| vm_vec_ang_2_matrix random total=5000 mismatches=0 |}]

(* ---- 3D pipeline parity tests ---- *)

external c_g3_code_point : int -> int -> int -> int = "caml_c_g3_code_point"

external c_checkmuldiv : int -> int -> int -> int * int = "caml_c_checkmuldiv"

external c_g3_rotate_point
  :  int -> int -> int
  -> int -> int -> int
  -> int -> int -> int
  -> int -> int -> int
  -> int -> int -> int
  -> int * int * int * int
  = "caml_c_g3_rotate_point_bc" "caml_c_g3_rotate_point"

external c_g3_project_point
  :  int -> int -> int -> int -> int
  -> int * int * int
  = "caml_c_g3_project_point"

external c_g3_rotate_delta_x
  :  int -> int -> int
  -> int -> int -> int
  -> int -> int -> int
  -> int
  -> int * int * int
  = "caml_c_g3_rotate_delta_x_bc" "caml_c_g3_rotate_delta_x"

external c_g3_rotate_delta_y
  :  int -> int -> int
  -> int -> int -> int
  -> int -> int -> int
  -> int
  -> int * int * int
  = "caml_c_g3_rotate_delta_y_bc" "caml_c_g3_rotate_delta_y"

external c_g3_rotate_delta_z
  :  int -> int -> int
  -> int -> int -> int
  -> int -> int -> int
  -> int
  -> int * int * int
  = "caml_c_g3_rotate_delta_z_bc" "caml_c_g3_rotate_delta_z"

external c_g3_calc_point_depth
  :  int -> int -> int
  -> int -> int -> int
  -> int -> int -> int
  -> int
  = "caml_c_g3_calc_point_depth_bc" "caml_c_g3_calc_point_depth"

external c_scale_matrix
  :  int -> int -> int
  -> int -> int -> int
  -> int -> int -> int
  -> int -> int -> int
  -> int
  -> int * int * int * int * int * int * int * int * int * int * int * int
  = "caml_c_scale_matrix_bc" "caml_c_scale_matrix"

external c_g3_start_instance_matrix
  :  int -> int -> int
  -> int -> int -> int
  -> int -> int -> int
  -> int -> int -> int
  -> int -> int -> int
  -> int
  -> int -> int -> int
  -> int -> int -> int
  -> int -> int -> int
  -> int * int * int * int * int * int * int * int * int * int * int * int
  = "caml_c_g3_start_instance_matrix_bc" "caml_c_g3_start_instance_matrix"

external c_g3_point_2_vec
  :  int -> int
  -> int -> int
  -> int -> int -> int
  -> int -> int -> int
  -> int -> int -> int
  -> int -> int -> int
  -> int * int * int
  = "caml_c_g3_point_2_vec_bc" "caml_c_g3_point_2_vec"

let g3_code_point_cases =
  [ (0, 0, 0x10000)     (* origin in front *)
  ; (0x20000, 0, 0x10000)  (* x > z -> OFF_RIGHT *)
  ; (0, 0x20000, 0x10000)  (* y > z -> OFF_TOP *)
  ; (-0x20000, 0, 0x10000) (* x < -z -> OFF_LEFT *)
  ; (0, -0x20000, 0x10000) (* y < -z -> OFF_BOT *)
  ; (0, 0, -1)             (* z <= 0 -> BEHIND *)
  ; (0, 0, 0)              (* z == 0 -> BEHIND *)
  ; (0x10000, 0x10000, 0x10000) (* x==z, y==z: on boundary, no clipping *)
  ; (0x10001, 0x10001, 0x10000) (* just past boundary -> RIGHT | TOP *)
  ; (-0x10001, -0x10001, 0x10000) (* OFF_LEFT | OFF_BOT *)
  ]

let%expect_test "g3_code_point parity C vs Ox" =
  List.iter g3_code_point_cases ~f:(fun (x, y, z) ->
      let c = c_g3_code_point x y z in
      let ox = Ox_3d.g3_code_point (x, y, z) in
      printf "g3_code_point (%d,%d,%d) c=0x%02x ox=0x%02x eq=%b\n" x y z c ox (Int.equal c ox));
  [%expect {|
    g3_code_point (0,0,65536) c=0x00 ox=0x00 eq=true
    g3_code_point (131072,0,65536) c=0x02 ox=0x02 eq=true
    g3_code_point (0,131072,65536) c=0x08 ox=0x08 eq=true
    g3_code_point (-131072,0,65536) c=0x01 ox=0x01 eq=true
    g3_code_point (0,-131072,65536) c=0x04 ox=0x04 eq=true
    g3_code_point (0,0,-1) c=0x8f ox=0x8f eq=true
    g3_code_point (0,0,0) c=0x80 ox=0x80 eq=true
    g3_code_point (65536,65536,65536) c=0x00 ox=0x00 eq=true
    g3_code_point (65537,65537,65536) c=0x0a ox=0x0a eq=true
    g3_code_point (-65537,-65537,65536) c=0x05 ox=0x05 eq=true
    |}]

let checkmuldiv_cases =
  [ (0x10000, 0x10000, 0x10000)  (* 1 * 1 / 1 = 1 *)
  ; (0x20000, 0x30000, 0x10000)  (* 2 * 3 / 1 = 6 *)
  ; (0x10000, 0x8000, 0x10000)   (* 1 * 0.5 / 1 = 0.5 *)
  ; (0x7FFFFFFF, 0x7FFFFFFF, 0x10000) (* large values -> overflow *)
  ; (0x10000, 0x10000, 0)        (* divide by zero *)
  ; (100, 200, 0x10000)          (* small values *)
  ]

let%expect_test "checkmuldiv parity C vs Ox" =
  List.iter checkmuldiv_cases ~f:(fun (a, b, c) ->
      let c_ok, c_r = c_checkmuldiv a b c in
      let ox_ok, ox_r = Ox_3d.checkmuldiv a b c in
      let ox_ok_i = if ox_ok then 1 else 0 in
      printf "checkmuldiv a=%d b=%d c=%d c_ok=%d c_r=%d ox_ok=%d ox_r=%d eq=%b\n"
        a b c c_ok c_r ox_ok_i ox_r (Int.equal c_ok ox_ok_i && Int.equal c_r ox_r));
  [%expect {|
    checkmuldiv a=65536 b=65536 c=65536 c_ok=1 c_r=65536 ox_ok=1 ox_r=65536 eq=true
    checkmuldiv a=131072 b=196608 c=65536 c_ok=1 c_r=393216 ox_ok=1 ox_r=393216 eq=true
    checkmuldiv a=65536 b=32768 c=65536 c_ok=1 c_r=32768 ox_ok=1 ox_r=32768 eq=true
    checkmuldiv a=2147483647 b=2147483647 c=65536 c_ok=0 c_r=0 ox_ok=0 ox_r=0 eq=true
    checkmuldiv a=65536 b=65536 c=0 c_ok=0 c_r=0 ox_ok=0 ox_r=0 eq=true
    checkmuldiv a=100 b=200 c=65536 c_ok=1 c_r=0 ox_ok=1 ox_r=0 eq=true |}]

(* Identity matrix for simple rotation tests *)
let id_mat = (0x10000, 0, 0, 0, 0x10000, 0, 0, 0, 0x10000)

let%expect_test "g3_rotate_point parity C vs Ox" =
  let cases =
    [ (* point at origin, view at origin, identity matrix *)
      ((0, 0, 0), (0, 0, 0), id_mat)
    ; (* point in front of viewer *)
      ((0, 0, 0x30000), (0, 0, 0), id_mat)
    ; (* point offset from viewer *)
      ((0x10000, 0x20000, 0x30000), (0, 0, 0), id_mat)
    ; (* viewer offset *)
      ((0x20000, 0, 0x40000), (0x10000, 0, 0x10000), id_mat)
    ]
  in
  List.iter cases ~f:(fun ((sx, sy, sz), (vpx, vpy, vpz), (r1, r2, r3, u1, u2, u3, f1, f2, f3)) ->
      let c_rx, c_ry, c_rz, c_codes = c_g3_rotate_point sx sy sz vpx vpy vpz r1 r2 r3 u1 u2 u3 f1 f2 f3 in
      let (ox_rx, ox_ry, ox_rz), ox_codes =
        Ox_3d.g3_rotate_point
          ~view_pos:(vpx, vpy, vpz)
          ~view_matrix:((r1, r2, r3), (u1, u2, u3), (f1, f2, f3))
          (sx, sy, sz)
      in
      let eq = c_rx = ox_rx && c_ry = ox_ry && c_rz = ox_rz && c_codes = ox_codes in
      printf "g3_rotate_point c=(%d,%d,%d,0x%02x) ox=(%d,%d,%d,0x%02x) eq=%b\n"
        c_rx c_ry c_rz c_codes ox_rx ox_ry ox_rz ox_codes eq);
  [%expect {|
    g3_rotate_point c=(0,0,0,0x80) ox=(0,0,0,0x80) eq=true
    g3_rotate_point c=(0,0,196608,0x00) ox=(0,0,196608,0x00) eq=true
    g3_rotate_point c=(65536,131072,196608,0x00) ox=(65536,131072,196608,0x00) eq=true
    g3_rotate_point c=(65536,0,196608,0x00) ox=(65536,0,196608,0x00) eq=true |}]

let%expect_test "g3_project_point parity C vs Ox" =
  let cases =
    [ (0, 0, 0x10000, 160 * 0x10000, 100 * 0x10000)  (* center *)
    ; (0x8000, 0, 0x10000, 160 * 0x10000, 100 * 0x10000)  (* right of center *)
    ; (0, -0x8000, 0x10000, 160 * 0x10000, 100 * 0x10000) (* below center *)
    ]
  in
  List.iter cases ~f:(fun (x, y, z, cw2, ch2) ->
      let c_ok, c_sx, c_sy = c_g3_project_point x y z cw2 ch2 in
      let ox_result = Ox_3d.g3_project_point (x, y, z) ~canv_w2:cw2 ~canv_h2:ch2 in
      let ox_ok, ox_sx, ox_sy =
        match ox_result with
        | Some (sx, sy) -> 1, sx, sy
        | None -> 0, 0, 0
      in
      let eq = c_ok = ox_ok && c_sx = ox_sx && c_sy = ox_sy in
      printf "g3_project_point (%d,%d,%d) c_ok=%d c=(%d,%d) ox_ok=%d ox=(%d,%d) eq=%b\n"
        x y z c_ok c_sx c_sy ox_ok ox_sx ox_sy eq);
  [%expect {|
    g3_project_point (0,0,65536) c_ok=1 c=(10485760,6553600) ox_ok=1 ox=(10485760,6553600) eq=true
    g3_project_point (32768,0,65536) c_ok=1 c=(15728640,6553600) ox_ok=1 ox=(15728640,6553600) eq=true
    g3_project_point (0,-32768,65536) c_ok=1 c=(10485760,9830400) ox_ok=1 ox=(10485760,9830400) eq=true |}]

let%expect_test "g3_rotate_delta_x parity C vs Ox" =
  let mat = (0x10000, 0x8000, 0, 0, 0x10000, 0, 0, 0, 0x10000) in
  let (r1, r2, r3, u1, u2, u3, f1, f2, f3) = mat in
  let dx = 0x20000 in
  let c_rx, c_ry, c_rz = c_g3_rotate_delta_x r1 r2 r3 u1 u2 u3 f1 f2 f3 dx in
  let ox_rx, ox_ry, ox_rz =
    Ox_3d.g3_rotate_delta_x ((r1, r2, r3), (u1, u2, u3), (f1, f2, f3)) dx
  in
  let eq = c_rx = ox_rx && c_ry = ox_ry && c_rz = ox_rz in
  printf "g3_rotate_delta_x c=(%d,%d,%d) ox=(%d,%d,%d) eq=%b\n" c_rx c_ry c_rz ox_rx ox_ry ox_rz eq;
  [%expect {| g3_rotate_delta_x c=(131072,0,0) ox=(131072,0,0) eq=true |}]

let%expect_test "g3_rotate_delta_y parity C vs Ox" =
  let mat = (0x10000, 0x8000, 0, 0, 0x10000, 0, 0, 0, 0x10000) in
  let (r1, r2, r3, u1, u2, u3, f1, f2, f3) = mat in
  let dy = 0x20000 in
  let c_rx, c_ry, c_rz = c_g3_rotate_delta_y r1 r2 r3 u1 u2 u3 f1 f2 f3 dy in
  let ox_rx, ox_ry, ox_rz =
    Ox_3d.g3_rotate_delta_y ((r1, r2, r3), (u1, u2, u3), (f1, f2, f3)) dy
  in
  let eq = c_rx = ox_rx && c_ry = ox_ry && c_rz = ox_rz in
  printf "g3_rotate_delta_y c=(%d,%d,%d) ox=(%d,%d,%d) eq=%b\n" c_rx c_ry c_rz ox_rx ox_ry ox_rz eq;
  [%expect {| g3_rotate_delta_y c=(65536,131072,0) ox=(65536,131072,0) eq=true |}]

let%expect_test "g3_rotate_delta_z parity C vs Ox" =
  let mat = (0x10000, 0x8000, 0, 0, 0x10000, 0, 0, 0, 0x10000) in
  let (r1, r2, r3, u1, u2, u3, f1, f2, f3) = mat in
  let dz = 0x20000 in
  let c_rx, c_ry, c_rz = c_g3_rotate_delta_z r1 r2 r3 u1 u2 u3 f1 f2 f3 dz in
  let ox_rx, ox_ry, ox_rz =
    Ox_3d.g3_rotate_delta_z ((r1, r2, r3), (u1, u2, u3), (f1, f2, f3)) dz
  in
  let eq = c_rx = ox_rx && c_ry = ox_ry && c_rz = ox_rz in
  printf "g3_rotate_delta_z c=(%d,%d,%d) ox=(%d,%d,%d) eq=%b\n" c_rx c_ry c_rz ox_rx ox_ry ox_rz eq;
  [%expect {| g3_rotate_delta_z c=(0,0,131072) ox=(0,0,131072) eq=true |}]

let%expect_test "g3_calc_point_depth parity C vs Ox" =
  let cases =
    [ ((0x30000, 0, 0x50000), (0x10000, 0, 0x10000), (0, 0, 0x10000))
    ; ((0, 0, 0), (0, 0, 0), (0x10000, 0, 0))
    ; ((0x10000, 0x20000, 0x30000), (0, 0, 0), (0x4000, 0x4000, 0x4000))
    ]
  in
  List.iter cases ~f:(fun ((px, py, pz), (vpx, vpy, vpz), (fx, fy, fz)) ->
      let c_depth = c_g3_calc_point_depth px py pz vpx vpy vpz fx fy fz in
      let ox_depth =
        Ox_3d.g3_calc_point_depth
          ~view_pos:(vpx, vpy, vpz) ~view_fvec:(fx, fy, fz) (px, py, pz)
      in
      printf "g3_calc_point_depth c=%d ox=%d eq=%b\n" c_depth ox_depth (Int.equal c_depth ox_depth));
  [%expect {|
    g3_calc_point_depth c=262144 ox=262144 eq=true
    g3_calc_point_depth c=0 ox=0 eq=true
    g3_calc_point_depth c=98304 ox=98304 eq=true
    |}]

let%expect_test "scale_matrix parity C vs Ox" =
  let cases =
    [ (* identity matrix, unity window scale, zoom = 1.0 *)
      ((0x10000, 0, 0, 0, 0x10000, 0, 0, 0, 0x10000),
       (0x10000, 0x10000, 0x10000), 0x10000)
    ; (* zoom in (zoom < 1.0) *)
      ((0x10000, 0, 0, 0, 0x10000, 0, 0, 0, 0x10000),
       (0x10000, 0x10000, 0x10000), 0x8000)
    ; (* zoom out (zoom > 1.0) *)
      ((0x10000, 0, 0, 0, 0x10000, 0, 0, 0, 0x10000),
       (0x10000, 0x10000, 0x10000), 0x20000)
    ]
  in
  List.iter cases ~f:(fun ((r1, r2, r3, u1, u2, u3, f1, f2, f3), (wsx, wsy, wsz), zoom) ->
      let (cr1, cr2, cr3, cu1, cu2, cu3, cf1, cf2, cf3, cmsx, cmsy, cmsz) =
        c_scale_matrix r1 r2 r3 u1 u2 u3 f1 f2 f3 wsx wsy wsz zoom
      in
      let (scaled_mat, (omsx, omsy, omsz), _unscaled) =
        Ox_3d.scale_matrix
          ((r1, r2, r3), (u1, u2, u3), (f1, f2, f3))
          (wsx, wsy, wsz) zoom
      in
      let ((or1, or2, or3), (ou1, ou2, ou3), (of1, of2, of3)) = scaled_mat in
      let eq =
        cr1 = or1 && cr2 = or2 && cr3 = or3
        && cu1 = ou1 && cu2 = ou2 && cu3 = ou3
        && cf1 = of1 && cf2 = of2 && cf3 = of3
        && cmsx = omsx && cmsy = omsy && cmsz = omsz
      in
      printf "scale_matrix zoom=%d c_mat=(%d,%d,%d/%d,%d,%d/%d,%d,%d) c_ms=(%d,%d,%d) eq=%b\n"
        zoom cr1 cr2 cr3 cu1 cu2 cu3 cf1 cf2 cf3 cmsx cmsy cmsz eq);
  [%expect {|
    scale_matrix zoom=65536 c_mat=(65536,0,0/0,65536,0/0,0,65536) c_ms=(65536,65536,65536) eq=true
    scale_matrix zoom=32768 c_mat=(65536,0,0/0,65536,0/0,0,32768) c_ms=(65536,65536,32768) eq=true
    scale_matrix zoom=131072 c_mat=(32768,0,0/0,32768,0/0,0,65536) c_ms=(32768,32768,65536) eq=true |}]

(* ---- Randomized 3D pipeline parity tests ---- *)

let%expect_test "randomized g3_code_point parity C vs Ox" =
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed:"g3-code-point-seed-v1" ~test_count:5000 vec3_gen
  |> Sequence.iter ~f:(fun (x, y, z) ->
         incr total;
         let c = c_g3_code_point x y z in
         let ox = Ox_3d.g3_code_point (x, y, z) in
         if not (Int.equal c ox)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some (sprintf "g3_code_point (%d,%d,%d) c=0x%02x ox=0x%02x" x y z c ox)));
  printf "g3_code_point random total=%d mismatches=%d\n" !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "g3_code_point randomized parity failed" ();
  [%expect {| g3_code_point random total=5000 mismatches=0 |}]

let%expect_test "randomized checkmuldiv parity C vs Ox" =
  let gen =
    Quickcheck.Generator.map
      (Quickcheck.Generator.both fix_gen (Quickcheck.Generator.both fix_gen fix_gen))
      ~f:(fun (a, (b, c)) -> (a, b, c))
  in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed:"checkmuldiv-seed-v1" ~test_count:5000 gen
  |> Sequence.iter ~f:(fun (a, b, c) ->
         incr total;
         let c_ok, c_r = c_checkmuldiv a b c in
         let ox_ok_b, ox_r = Ox_3d.checkmuldiv a b c in
         let ox_ok = if ox_ok_b then 1 else 0 in
         if not (Int.equal c_ok ox_ok && Int.equal c_r ox_r)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some
                  (sprintf
                     "checkmuldiv a=%d b=%d c=%d c_ok=%d c_r=%d ox_ok=%d ox_r=%d"
                     a b c c_ok c_r ox_ok ox_r)));
  printf "checkmuldiv random total=%d mismatches=%d\n" !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "checkmuldiv randomized parity failed" ();
  [%expect {| checkmuldiv random total=5000 mismatches=0 |}]

let%expect_test "randomized g3_rotate_point parity C vs Ox" =
  let gen =
    Quickcheck.Generator.map
      (Quickcheck.Generator.both vec3_gen (Quickcheck.Generator.both vec3_gen mat3_gen))
      ~f:(fun (src, (vp, mat)) -> (src, vp, mat))
  in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed:"g3-rotate-point-seed-v1" ~test_count:5000 gen
  |> Sequence.iter ~f:(fun ((sx, sy, sz), (vpx, vpy, vpz), ((r1, r2, r3), (u1, u2, u3), (f1, f2, f3))) ->
         incr total;
         let c_rx, c_ry, c_rz, c_codes =
           c_g3_rotate_point sx sy sz vpx vpy vpz r1 r2 r3 u1 u2 u3 f1 f2 f3
         in
         let (ox_rx, ox_ry, ox_rz), ox_codes =
           Ox_3d.g3_rotate_point
             ~view_pos:(vpx, vpy, vpz)
             ~view_matrix:((r1, r2, r3), (u1, u2, u3), (f1, f2, f3))
             (sx, sy, sz)
         in
         if not (c_rx = ox_rx && c_ry = ox_ry && c_rz = ox_rz && c_codes = ox_codes)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some
                  (sprintf
                     "g3_rotate_point c=(%d,%d,%d,0x%02x) ox=(%d,%d,%d,0x%02x)"
                     c_rx c_ry c_rz c_codes ox_rx ox_ry ox_rz ox_codes)));
  printf "g3_rotate_point random total=%d mismatches=%d\n" !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "g3_rotate_point randomized parity failed" ();
  [%expect {| g3_rotate_point random total=5000 mismatches=0 |}]

let%expect_test "randomized g3_project_point parity C vs Ox" =
  (* Use positive z values to get interesting projection behavior *)
  let pos_fix_gen =
    Quickcheck.Generator.map fix_gen ~f:(fun v ->
      (* Ensure result fits in positive int32 range [1, 0x7FFFFFFF] *)
      let v = Ox_math.wrap_i64_to_fix (Int64.of_int v) in
      let v = if v = -2147483648 then 2147483647 else if v < 0 then -v else v in
      Int.max 1 v)
  in
  let gen =
    Quickcheck.Generator.map
      (Quickcheck.Generator.both vec3_gen (Quickcheck.Generator.both pos_fix_gen pos_fix_gen))
      ~f:(fun ((x, y, z), (cw2, ch2)) -> (x, y, z, cw2, ch2))
  in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed:"g3-project-point-seed-v1" ~test_count:5000 gen
  |> Sequence.iter ~f:(fun (x, y, z, cw2, ch2) ->
         incr total;
         let c_ok, c_sx, c_sy = c_g3_project_point x y z cw2 ch2 in
         let ox_result = Ox_3d.g3_project_point (x, y, z) ~canv_w2:cw2 ~canv_h2:ch2 in
         let ox_ok, ox_sx, ox_sy =
           match ox_result with
           | Some (sx, sy) -> 1, sx, sy
           | None -> 0, 0, 0
         in
         if not (c_ok = ox_ok && c_sx = ox_sx && c_sy = ox_sy)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some
                  (sprintf
                     "g3_project_point (%d,%d,%d) cw2=%d ch2=%d c=(%d,%d,%d) ox=(%d,%d,%d)"
                     x y z cw2 ch2 c_ok c_sx c_sy ox_ok ox_sx ox_sy)));
  printf "g3_project_point random total=%d mismatches=%d\n" !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "g3_project_point randomized parity failed" ();
  [%expect {| g3_project_point random total=5000 mismatches=0 |}]

let%expect_test "randomized g3_rotate_delta_x parity C vs Ox" =
  let gen = Quickcheck.Generator.both mat3_gen fix_gen in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed:"g3-rotate-delta-x-seed-v1" ~test_count:5000 gen
  |> Sequence.iter ~f:(fun (((r1, r2, r3), (u1, u2, u3), (f1, f2, f3)), dx) ->
         incr total;
         let c_rx, c_ry, c_rz = c_g3_rotate_delta_x r1 r2 r3 u1 u2 u3 f1 f2 f3 dx in
         let ox_rx, ox_ry, ox_rz =
           Ox_3d.g3_rotate_delta_x ((r1, r2, r3), (u1, u2, u3), (f1, f2, f3)) dx
         in
         if not (c_rx = ox_rx && c_ry = ox_ry && c_rz = ox_rz)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some
                  (sprintf "g3_rotate_delta_x c=(%d,%d,%d) ox=(%d,%d,%d)"
                     c_rx c_ry c_rz ox_rx ox_ry ox_rz)));
  printf "g3_rotate_delta_x random total=%d mismatches=%d\n" !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "g3_rotate_delta_x randomized parity failed" ();
  [%expect {| g3_rotate_delta_x random total=5000 mismatches=0 |}]

let%expect_test "randomized g3_rotate_delta_y parity C vs Ox" =
  let gen = Quickcheck.Generator.both mat3_gen fix_gen in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed:"g3-rotate-delta-y-seed-v1" ~test_count:5000 gen
  |> Sequence.iter ~f:(fun (((r1, r2, r3), (u1, u2, u3), (f1, f2, f3)), dy) ->
         incr total;
         let c_rx, c_ry, c_rz = c_g3_rotate_delta_y r1 r2 r3 u1 u2 u3 f1 f2 f3 dy in
         let ox_rx, ox_ry, ox_rz =
           Ox_3d.g3_rotate_delta_y ((r1, r2, r3), (u1, u2, u3), (f1, f2, f3)) dy
         in
         if not (c_rx = ox_rx && c_ry = ox_ry && c_rz = ox_rz)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some
                  (sprintf "g3_rotate_delta_y c=(%d,%d,%d) ox=(%d,%d,%d)"
                     c_rx c_ry c_rz ox_rx ox_ry ox_rz)));
  printf "g3_rotate_delta_y random total=%d mismatches=%d\n" !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "g3_rotate_delta_y randomized parity failed" ();
  [%expect {| g3_rotate_delta_y random total=5000 mismatches=0 |}]

let%expect_test "randomized g3_rotate_delta_z parity C vs Ox" =
  let gen = Quickcheck.Generator.both mat3_gen fix_gen in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed:"g3-rotate-delta-z-seed-v1" ~test_count:5000 gen
  |> Sequence.iter ~f:(fun (((r1, r2, r3), (u1, u2, u3), (f1, f2, f3)), dz) ->
         incr total;
         let c_rx, c_ry, c_rz = c_g3_rotate_delta_z r1 r2 r3 u1 u2 u3 f1 f2 f3 dz in
         let ox_rx, ox_ry, ox_rz =
           Ox_3d.g3_rotate_delta_z ((r1, r2, r3), (u1, u2, u3), (f1, f2, f3)) dz
         in
         if not (c_rx = ox_rx && c_ry = ox_ry && c_rz = ox_rz)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some
                  (sprintf "g3_rotate_delta_z c=(%d,%d,%d) ox=(%d,%d,%d)"
                     c_rx c_ry c_rz ox_rx ox_ry ox_rz)));
  printf "g3_rotate_delta_z random total=%d mismatches=%d\n" !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "g3_rotate_delta_z randomized parity failed" ();
  [%expect {| g3_rotate_delta_z random total=5000 mismatches=0 |}]

let%expect_test "randomized g3_calc_point_depth parity C vs Ox" =
  let gen =
    Quickcheck.Generator.map
      (Quickcheck.Generator.both vec3_gen (Quickcheck.Generator.both vec3_gen vec3_gen))
      ~f:(fun (pnt, (vp, fvec)) -> (pnt, vp, fvec))
  in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed:"g3-calc-point-depth-seed-v1" ~test_count:5000 gen
  |> Sequence.iter ~f:(fun ((px, py, pz), (vpx, vpy, vpz), (fx, fy, fz)) ->
         incr total;
         let c_d = c_g3_calc_point_depth px py pz vpx vpy vpz fx fy fz in
         let ox_d =
           Ox_3d.g3_calc_point_depth ~view_pos:(vpx, vpy, vpz) ~view_fvec:(fx, fy, fz) (px, py, pz)
         in
         if not (Int.equal c_d ox_d)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some (sprintf "g3_calc_point_depth c=%d ox=%d" c_d ox_d)));
  printf "g3_calc_point_depth random total=%d mismatches=%d\n" !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "g3_calc_point_depth randomized parity failed" ();
  [%expect {| g3_calc_point_depth random total=5000 mismatches=0 |}]

let%expect_test "randomized scale_matrix parity C vs Ox" =
  let gen =
    Quickcheck.Generator.map
      (Quickcheck.Generator.both mat3_gen (Quickcheck.Generator.both vec3_gen fix_gen))
      ~f:(fun (mat, (ws, zoom)) -> (mat, ws, zoom))
  in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed:"scale-matrix-seed-v1" ~test_count:5000 gen
  |> Sequence.iter ~f:(fun (((r1, r2, r3), (u1, u2, u3), (f1, f2, f3)), (wsx, wsy, wsz), zoom) ->
         incr total;
         let (cr1, cr2, cr3, cu1, cu2, cu3, cf1, cf2, cf3, cmsx, cmsy, cmsz) =
           c_scale_matrix r1 r2 r3 u1 u2 u3 f1 f2 f3 wsx wsy wsz zoom
         in
         let (scaled_mat, (omsx, omsy, omsz), _unscaled) =
           Ox_3d.scale_matrix
             ((r1, r2, r3), (u1, u2, u3), (f1, f2, f3))
             (wsx, wsy, wsz) zoom
         in
         let ((or1, or2, or3), (ou1, ou2, ou3), (of1, of2, of3)) = scaled_mat in
         let eq =
           cr1 = or1 && cr2 = or2 && cr3 = or3
           && cu1 = ou1 && cu2 = ou2 && cu3 = ou3
           && cf1 = of1 && cf2 = of2 && cf3 = of3
           && cmsx = omsx && cmsy = omsy && cmsz = omsz
         in
         if not eq
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some
                  (sprintf "scale_matrix zoom=%d c_ms=(%d,%d,%d) ox_ms=(%d,%d,%d)"
                     zoom cmsx cmsy cmsz omsx omsy omsz)));
  printf "scale_matrix random total=%d mismatches=%d\n" !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "scale_matrix randomized parity failed" ();
  [%expect {| scale_matrix random total=5000 mismatches=0 |}]

let%expect_test "randomized g3_start_instance_matrix parity C vs Ox" =
  let gen =
    Quickcheck.Generator.map
      (Quickcheck.Generator.both
         (Quickcheck.Generator.both vec3_gen mat3_gen)
         (Quickcheck.Generator.both vec3_gen (Quickcheck.Generator.both (Quickcheck.Generator.of_list [0; 1]) mat3_gen)))
      ~f:(fun ((vp, vm), (pos, (has_orient, orient))) -> (vp, vm, pos, has_orient, orient))
  in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed:"g3-start-instance-matrix-seed-v1" ~test_count:5000 gen
  |> Sequence.iter ~f:(fun ((vpx, vpy, vpz),
                            ((r1, r2, r3), (u1, u2, u3), (f1, f2, f3)),
                            (px, py, pz), has_orient,
                            ((mr1, mr2, mr3), (mu1, mu2, mu3), (mf1, mf2, mf3))) ->
         incr total;
         let (cnvpx, cnvpy, cnvpz, cnr1, cnr2, cnr3, cnu1, cnu2, cnu3, cnf1, cnf2, cnf3) =
           c_g3_start_instance_matrix
             vpx vpy vpz r1 r2 r3 u1 u2 u3 f1 f2 f3
             px py pz has_orient mr1 mr2 mr3 mu1 mu2 mu3 mf1 mf2 mf3
         in
         let orient = if has_orient <> 0 then Some ((mr1, mr2, mr3), (mu1, mu2, mu3), (mf1, mf2, mf3)) else None in
         let (onvpx, onvpy, onvpz),
             ((onr1, onr2, onr3), (onu1, onu2, onu3), (onf1, onf2, onf3)) =
           Ox_3d.g3_start_instance_matrix
             ~view_pos:(vpx, vpy, vpz)
             ~view_matrix:((r1, r2, r3), (u1, u2, u3), (f1, f2, f3))
             (px, py, pz) orient
         in
         let eq = cnvpx = onvpx && cnvpy = onvpy && cnvpz = onvpz
                  && cnr1 = onr1 && cnr2 = onr2 && cnr3 = onr3
                  && cnu1 = onu1 && cnu2 = onu2 && cnu3 = onu3
                  && cnf1 = onf1 && cnf2 = onf2 && cnf3 = onf3
         in
         if not eq
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some
                  (sprintf "g3_start_instance_matrix has_orient=%d c_vp=(%d,%d,%d) ox_vp=(%d,%d,%d)"
                     has_orient cnvpx cnvpy cnvpz onvpx onvpy onvpz)));
  printf "g3_start_instance_matrix random total=%d mismatches=%d\n" !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "g3_start_instance_matrix randomized parity failed" ();
  [%expect {| g3_start_instance_matrix random total=5000 mismatches=0 |}]

let%expect_test "randomized g3_point_2_vec parity C vs Ox" =
  let short_gen = Quickcheck.Generator.map Int.quickcheck_generator ~f:(fun v -> Int.max (-32768) (Int.min 32767 v)) in
  let nonzero_fix_gen = Quickcheck.Generator.map fix_gen ~f:(fun v ->
    let v = Ox_math.wrap_i64_to_fix (Int64.of_int v) in
    if v = 0 then 1 else v) in
  let gen =
    Quickcheck.Generator.map
      (Quickcheck.Generator.both
         (Quickcheck.Generator.both short_gen short_gen)
         (Quickcheck.Generator.both
            (Quickcheck.Generator.both nonzero_fix_gen nonzero_fix_gen)
            (Quickcheck.Generator.both vec3_gen mat3_gen)))
      ~f:(fun ((sx, sy), ((cw2, ch2), (ms, um))) -> (sx, sy, cw2, ch2, ms, um))
  in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed:"g3-point-2-vec-seed-v1" ~test_count:5000 gen
  |> Sequence.iter ~f:(fun (sx, sy, canv_w2, canv_h2,
                            (msx, msy, msz),
                            ((ur1, ur2, ur3), (uu1, uu2, uu3), (uf1, uf2, uf3))) ->
         (* Skip cases where matrix_scale x or y is zero to avoid div-by-zero *)
         if msx <> 0 && msy <> 0 then (
           incr total;
           let (cvx, cvy, cvz) =
             c_g3_point_2_vec sx sy canv_w2 canv_h2 msx msy msz
               ur1 ur2 ur3 uu1 uu2 uu3 uf1 uf2 uf3
           in
           let (ovx, ovy, ovz) =
             Ox_3d.g3_point_2_vec
               ~canv_w2 ~canv_h2
               ~matrix_scale:(msx, msy, msz)
               ~unscaled_matrix:((ur1, ur2, ur3), (uu1, uu2, uu3), (uf1, uf2, uf3))
               sx sy
           in
           if not (cvx = ovx && cvy = ovy && cvz = ovz)
           then (
             incr mismatches;
             if Option.is_none !first_mismatch
             then
               first_mismatch
               := Some
                    (sprintf "g3_point_2_vec (%d,%d) c=(%d,%d,%d) ox=(%d,%d,%d)"
                       sx sy cvx cvy cvz ovx ovy ovz))));
  printf "g3_point_2_vec random total=%d mismatches=%d\n" !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "g3_point_2_vec randomized parity failed" ();
  [%expect {| g3_point_2_vec random total=4507 mismatches=0 |}]

(* ---- Drawing helpers: clip_edge, g3_check_normal_facing, calc_rod_corners ---- *)

external c_clip_edge
  :  int
  -> int -> int -> int
  -> int -> int -> int -> int
  -> int -> int -> int
  -> int -> int -> int
  -> int * int * int * int * int * int * int * int
  = "caml_c_clip_edge_bc" "caml_c_clip_edge"

external c_g3_check_normal_facing
  :  int -> int -> int
  -> int -> int -> int
  -> int -> int -> int
  -> int
  = "caml_c_g3_check_normal_facing_bc" "caml_c_g3_check_normal_facing"

external c_calc_rod_corners
  :  int -> int -> int -> int
  -> int -> int -> int -> int
  -> int -> int -> int
  -> int * int * int * int * int * int * int * int * int * int * int * int * int
  = "caml_c_calc_rod_corners_bc" "caml_c_calc_rod_corners"

let%expect_test "randomized clip_edge parity C vs Ox" =
  let plane_flag_gen = Quickcheck.Generator.of_list [1; 2; 4; 8] in
  let flag_gen = Quickcheck.Generator.of_list [0; 8; 16; 24] in
  let gen =
    Quickcheck.Generator.map
      (Quickcheck.Generator.both
         (Quickcheck.Generator.both plane_flag_gen
            (Quickcheck.Generator.both vec3_gen vec3_gen))
         (Quickcheck.Generator.both
            (Quickcheck.Generator.both vec3_gen flag_gen)
            vec3_gen))
      ~f:(fun ((pf, (on_xyz, on_uvl)), ((off_xyz, flags), off_uvl)) ->
        (pf, on_xyz, on_uvl, flags, off_xyz, off_uvl))
  in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed:"clip-edge-seed-v1" ~test_count:5000 gen
  |> Sequence.iter ~f:(fun (plane_flag,
                            (on_x, on_y, on_z), (on_u, on_v, on_l), on_flags,
                            (off_x, off_y, off_z), (off_u, off_v, off_l)) ->
         incr total;
         let (cnx, cny, cnz, cnu, cnv, cnl, cnflags, cncodes) =
           c_clip_edge plane_flag
             on_x on_y on_z on_u on_v on_l on_flags
             off_x off_y off_z off_u off_v off_l
         in
         let (onx, ony, onz, onu, onv, onl, onflags, oncodes) =
           Ox_3d.clip_edge ~plane_flag
             ~on_x ~on_y ~on_z ~on_u ~on_v ~on_l ~on_flags
             ~off_x ~off_y ~off_z ~off_u ~off_v ~off_l
         in
         let eq = cnx = onx && cny = ony && cnz = onz
                  && cnu = onu && cnv = onv && cnl = onl
                  && cnflags = onflags && cncodes = oncodes
         in
         if not eq
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some
                  (sprintf "clip_edge pf=%d c=(%d,%d,%d) ox=(%d,%d,%d) c_codes=%d ox_codes=%d"
                     plane_flag cnx cny cnz onx ony onz cncodes oncodes)));
  printf "clip_edge random total=%d mismatches=%d\n" !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "clip_edge randomized parity failed" ();
  [%expect {| clip_edge random total=5000 mismatches=0 |}]

external c_clip_line
  :  int -> int -> int -> int
  -> int -> int -> int -> int
  -> int
  -> int * int * int * int * int * int * int * int * int
  = "caml_c_clip_line_bc" "caml_c_clip_line"

let%expect_test "randomized clip_line parity C vs Ox" =
  let codes_gen =
    Quickcheck.Generator.map
      (Quickcheck.Generator.both vec3_gen vec3_gen)
      ~f:(fun ((x, y, z), _) ->
        let cc = Ox_3d.g3_code_point (x, y, z) in
        (x, y, z, cc))
  in
  let gen =
    Quickcheck.Generator.both codes_gen codes_gen
  in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed:"clip-line-seed-v1" ~test_count:5000 gen
  |> Sequence.iter ~f:(fun ((p0x, p0y, p0z, p0c), (p1x, p1y, p1z, p1c)) ->
         let codes_or = p0c lor p1c in
         if codes_or land 0x80 = 0 && codes_or <> 0 then (
           incr total;
           let (cp0x, cp0y, cp0z, cp0c, cp1x, cp1y, cp1z, cp1c, c_clip) =
             c_clip_line p0x p0y p0z p0c p1x p1y p1z p1c codes_or
           in
           let ((op0x, op0y, op0z), op0c,
                (op1x, op1y, op1z), op1c,
                o_clip_b) =
             Ox_3d.clip_line (p0x, p0y, p0z) p0c (p1x, p1y, p1z) p1c codes_or
           in
           let o_clip = if o_clip_b then 1 else 0 in
           let eq = cp0x = op0x && cp0y = op0y && cp0z = op0z && cp0c = op0c
                    && cp1x = op1x && cp1y = op1y && cp1z = op1z && cp1c = op1c
                    && c_clip = o_clip
           in
           if not eq
           then (
             incr mismatches;
             if Option.is_none !first_mismatch
             then
               first_mismatch
               := Some
                    (sprintf "clip_line c_p0=(%d,%d,%d/%d) o_p0=(%d,%d,%d/%d) c_clip=%d o_clip=%d"
                       cp0x cp0y cp0z cp0c op0x op0y op0z op0c c_clip o_clip))));
  printf "clip_line random total=%d mismatches=%d\n" !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "clip_line randomized parity failed" ();
  [%expect {| clip_line random total=1133 mismatches=0 |}]

external c_clip_polygon
  :  int -> int -> int array -> int array
  = "caml_c_clip_polygon"

let%expect_test "randomized clip_polygon parity C vs Ox" =
  (* Generate random polygons (3-6 vertices) with mixed codes *)
  let vert_gen =
    Quickcheck.Generator.map
      (Quickcheck.Generator.both
         (Quickcheck.Generator.both fix_gen fix_gen)
         (Quickcheck.Generator.both fix_gen
            (Quickcheck.Generator.both fix_gen fix_gen)))
      ~f:(fun ((x, y), (z, (u, v))) -> (x, y, z, u, v))
  in
  let flag_gen = Quickcheck.Generator.of_list [0; 8; 16; 24] in
  let poly_gen =
    Quickcheck.Generator.bind
      (Quickcheck.Generator.of_list [3; 4; 5; 6])
      ~f:(fun nv ->
        Quickcheck.Generator.map
          (Quickcheck.Generator.list_with_length nv
             (Quickcheck.Generator.both vert_gen flag_gen))
          ~f:(fun verts -> (nv, verts)))
  in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed:"clip-polygon-seed-v1" ~test_count:5000 poly_gen
  |> Sequence.iter ~f:(fun (nv, verts) ->
         (* Build flat input array *)
         let codes_list = List.map verts ~f:(fun ((x, y, z, _u, _v), _flags) ->
           Ox_3d.g3_code_point (x, y, z)) in
         let codes_or = List.fold codes_list ~init:0 ~f:(lor) in
         let codes_and = List.fold codes_list ~init:0xff ~f:(land) in
         (* Skip if all behind or no clipping needed *)
         if codes_or land 0x80 = 0 && codes_or <> 0 && codes_and = 0 then begin
           incr total;
           let arr = Array.create ~len:(1 + nv * 8) 0 in
           arr.(0) <- nv;
           List.iteri verts ~f:(fun i ((x, y, z, u, v), flags) ->
             let codes = List.nth_exn codes_list i in
             let b = 1 + i * 8 in
             arr.(b) <- x; arr.(b+1) <- y; arr.(b+2) <- z;
             arr.(b+3) <- u; arr.(b+4) <- v; arr.(b+5) <- 0;
             arr.(b+6) <- flags; arr.(b+7) <- codes);
           (* C oracle *)
           let c_result = c_clip_polygon codes_or codes_and arr in
           (* OCaml *)
           let points = List.mapi verts ~f:(fun i ((x, y, z, u, v), flags) ->
             let codes = List.nth_exn codes_list i in
             (x, y, z, u, v, 0, flags, codes)) in
           let (o_clipped, o_codes_or, o_codes_and) =
             Ox_3d.clip_polygon ~codes_or ~codes_and points in
           let o_nv = List.length o_clipped in
           let o_result = Array.create ~len:(2 + o_nv * 8) 0 in
           o_result.(0) <- o_codes_or;
           o_result.(1) <- o_codes_and;
           List.iteri o_clipped ~f:(fun i (x, y, z, u, v, l, flags, codes) ->
             let b = 2 + i * 8 in
             o_result.(b) <- x; o_result.(b+1) <- y; o_result.(b+2) <- z;
             o_result.(b+3) <- u; o_result.(b+4) <- v; o_result.(b+5) <- l;
             o_result.(b+6) <- flags; o_result.(b+7) <- codes);
           (* Compare *)
           let c_len = Array.length c_result in
           let o_len = Array.length o_result in
           let mismatch =
             if c_len <> o_len then true
             else
               let m = ref false in
               for i = 0 to c_len - 1 do
                 if c_result.(i) <> o_result.(i) then m := true
               done;
               !m
           in
           if mismatch then begin
             incr mismatches;
             if Option.is_none !first_mismatch then begin
               let c_nv = (c_len - 2) / 8 in
               first_mismatch :=
                 Some (sprintf
                   "clip_polygon nv_in=%d codes_or=%d c_nv=%d o_nv=%d c_cor=%d o_cor=%d c_cand=%d o_cand=%d"
                   nv codes_or c_nv o_nv
                   c_result.(0) o_result.(0) c_result.(1) o_result.(1))
             end
           end
         end);
  printf "clip_polygon random total=%d mismatches=%d\n" !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "clip_polygon randomized parity failed" ();
  [%expect {| clip_polygon random total=274 mismatches=0 |}]

let%expect_test "randomized g3_check_normal_facing parity C vs Ox" =
  let gen =
    Quickcheck.Generator.map
      (Quickcheck.Generator.both vec3_gen (Quickcheck.Generator.both vec3_gen vec3_gen))
      ~f:(fun (vp, (v, n)) -> (vp, v, n))
  in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed:"g3-check-normal-facing-seed-v1" ~test_count:5000 gen
  |> Sequence.iter ~f:(fun ((vpx, vpy, vpz), (vx, vy, vz), (nx, ny, nz)) ->
         incr total;
         let c_res = c_g3_check_normal_facing vpx vpy vpz vx vy vz nx ny nz in
         let ox_res =
           if Ox_3d.g3_check_normal_facing
                ~view_pos:(vpx, vpy, vpz) (vx, vy, vz) (nx, ny, nz)
           then 1 else 0
         in
         if c_res <> ox_res
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some
                  (sprintf "g3_check_normal_facing vp=(%d,%d,%d) c=%d ox=%d"
                     vpx vpy vpz c_res ox_res)));
  printf "g3_check_normal_facing random total=%d mismatches=%d\n" !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "g3_check_normal_facing randomized parity failed" ();
  [%expect {| g3_check_normal_facing random total=5000 mismatches=0 |}]

let%expect_test "randomized calc_rod_corners parity C vs Ox" =
  let rod_fix_gen = Quickcheck.Generator.map Int.quickcheck_generator ~f:(fun v ->
    Int.max (-500_000) (Int.min 500_000 v)) in
  let rod_vec3_gen =
    Quickcheck.Generator.map
      (Quickcheck.Generator.both rod_fix_gen (Quickcheck.Generator.both rod_fix_gen rod_fix_gen))
      ~f:(fun (x, (y, z)) -> (x, y, z)) in
  let nonzero_fix_gen = Quickcheck.Generator.map rod_fix_gen ~f:(fun v ->
    if v = 0 then 0x10000 else v) in
  let width_gen = Quickcheck.Generator.map rod_fix_gen ~f:(fun v ->
    Int.max 1 (Int.abs v)) in
  let gen =
    Quickcheck.Generator.map
      (Quickcheck.Generator.both
         (Quickcheck.Generator.both rod_vec3_gen width_gen)
         (Quickcheck.Generator.both
            (Quickcheck.Generator.both rod_vec3_gen width_gen)
            (Quickcheck.Generator.both
               (Quickcheck.Generator.both nonzero_fix_gen nonzero_fix_gen)
               nonzero_fix_gen)))
      ~f:(fun ((bot, bw), ((top, tw), ((msx, msy), msz))) ->
        (bot, bw, top, tw, msx, msy, msz))
  in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed:"calc-rod-corners-seed-v1" ~test_count:5000 gen
  |> Sequence.iter ~f:(fun ((bx, by, bz), bw, (tx, ty, tz), tw, msx, msy, msz) ->
         if msx <> 0 && msy <> 0 then (
           incr total;
           let (cc0x, cc0y, cc0z, cc1x, cc1y, cc1z,
                cc2x, cc2y, cc2z, cc3x, cc3y, cc3z, cca) =
             c_calc_rod_corners bx by bz bw tx ty tz tw msx msy msz
           in
           let ((o0x, o0y, o0z), (o1x, o1y, o1z),
                (o2x, o2y, o2z), (o3x, o3y, o3z), oca) =
             Ox_3d.calc_rod_corners
               ~bot_vec:(bx, by, bz) ~bot_width:bw
               ~top_vec:(tx, ty, tz) ~top_width:tw
               ~matrix_scale:(msx, msy, msz)
           in
           let eq = cc0x = o0x && cc0y = o0y && cc0z = o0z
                    && cc1x = o1x && cc1y = o1y && cc1z = o1z
                    && cc2x = o2x && cc2y = o2y && cc2z = o2z
                    && cc3x = o3x && cc3y = o3y && cc3z = o3z
                    && cca = oca
           in
           if not eq
           then (
             incr mismatches;
             if Option.is_none !first_mismatch
             then
               first_mismatch
               := Some
                    (sprintf "calc_rod_corners c0=(%d,%d,%d)/(%d,%d,%d) o0=(%d,%d,%d)/(%d,%d,%d) cca=%d oca=%d"
                       cc0x cc0y cc0z cc1x cc1y cc1z o0x o0y o0z o1x o1y o1z cca oca))));
  printf "calc_rod_corners random total=%d mismatches=%d\n" !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "calc_rod_corners randomized parity failed" ();
  [%expect {| calc_rod_corners random total=5000 mismatches=0 |}]

external c_do_facing_check_computed
  : int -> int -> int -> int -> int -> int -> int -> int -> int
  -> int
  = "caml_c_do_facing_check_computed_bc" "caml_c_do_facing_check_computed"

let%expect_test "randomized do_facing_check_computed parity C vs Ox" =
  let gen =
    Quickcheck.Generator.map
      (Quickcheck.Generator.both vec3_mag_safe_gen (Quickcheck.Generator.both vec3_mag_safe_gen vec3_mag_safe_gen))
      ~f:(fun (p0, (p1, p2)) -> (p0, p1, p2))
  in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed:"do-facing-check-computed-seed-v1" ~test_count:5000 gen
  |> Sequence.iter ~f:(fun ((p0x, p0y, p0z), (p1x, p1y, p1z), (p2x, p2y, p2z)) ->
         incr total;
         let c_res = c_do_facing_check_computed p0x p0y p0z p1x p1y p1z p2x p2y p2z in
         let ox_res =
           if Ox_3d.do_facing_check_computed (p0x, p0y, p0z) (p1x, p1y, p1z) (p2x, p2y, p2z)
           then 1 else 0
         in
         if c_res <> ox_res
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some
                  (sprintf "do_facing_check_computed p0=(%d,%d,%d) p1=(%d,%d,%d) p2=(%d,%d,%d) c=%d ox=%d"
                     p0x p0y p0z p1x p1y p1z p2x p2y p2z c_res ox_res)));
  printf "do_facing_check_computed random total=%d mismatches=%d\n" !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "do_facing_check_computed randomized parity failed" ();
  [%expect {| do_facing_check_computed random total=5000 mismatches=0 |}]

(* ---- Gameseg parity tests ---- *)

external c_compute_center_point_on_side_raw
  :  int -> int -> int -> int -> int -> int
  -> int -> int -> int -> int -> int -> int
  -> int * int * int
  = "caml_c_compute_center_point_on_side_bc" "caml_c_compute_center_point_on_side"

let c_compute_center_point_on_side (v0x, v0y, v0z) (v1x, v1y, v1z) (v2x, v2y, v2z) (v3x, v3y, v3z) =
  c_compute_center_point_on_side_raw v0x v0y v0z v1x v1y v1z v2x v2y v2z v3x v3y v3z

external c_compute_segment_center : int array -> int * int * int
  = "caml_c_compute_segment_center"

let c_compute_segment_center_vecs verts =
  let arr = Array.create ~len: 24 0 in
  Array.iteri verts ~f:(fun i (x, y, z) ->
    arr.(i * 3) <- x; arr.((i * 3) + 1) <- y; arr.((i * 3) + 2) <- z);
  c_compute_segment_center arr

external c_get_verts_for_normal : int -> int -> int -> int -> int * int * int * int * int
  = "caml_c_get_verts_for_normal"

external c_create_abs_vertex_lists : int -> int array -> int -> int * int * int * int * int * int * int
  = "caml_c_create_abs_vertex_lists"

let c_create_abs_vertex_lists_unpacked side_type seg_verts sidenum =
  let nf, v0, v1, v2, v3, v4, v5 = c_create_abs_vertex_lists side_type seg_verts sidenum in
  nf, [| v0; v1; v2; v3; v4; v5 |]

external c_extract_vector_from_segment : int array -> int * int * int
  = "caml_c_extract_vector_from_segment"

external c_extract_orient_from_segment : int array -> int * int * int * int * int * int * int * int * int
  = "caml_c_extract_orient_from_segment"

let%expect_test "compute_center_point_on_side parity C vs Ox" =
  let cases =
    [ (0x10000, 0, 0), (0, 0x10000, 0), (0, 0, 0x10000), (-0x10000, 0, 0)
    ; (100, 200, 300), (400, 500, 600), (700, 800, 900), (1000, 1100, 1200)
    ]
  in
  List.iter cases ~f:(fun (v0, v1, v2, v3) ->
    let cx, cy, cz = c_compute_center_point_on_side v0 v1 v2 v3 in
    let ox, oy, oz = Ox_gameseg.compute_center_point_on_side v0 v1 v2 v3 in
    printf "compute_center_point_on_side c=(%d,%d,%d) ox=(%d,%d,%d) eq=%b\n"
      cx cy cz ox oy oz (cx = ox && cy = oy && cz = oz));
  [%expect {|
    compute_center_point_on_side c=(0,16384,16384) ox=(0,16384,16384) eq=true
    compute_center_point_on_side c=(550,650,750) ox=(550,650,750) eq=true
    |}]

let%expect_test "compute_segment_center parity C vs Ox" =
  let verts = [|
    (0, 0, 0); (0x10000, 0, 0); (0x10000, 0x10000, 0); (0, 0x10000, 0);
    (0, 0, 0x10000); (0x10000, 0, 0x10000); (0x10000, 0x10000, 0x10000); (0, 0x10000, 0x10000)
  |] in
  let cx, cy, cz = c_compute_segment_center_vecs verts in
  let ox, oy, oz =
    Ox_gameseg.compute_segment_center verts.(0) verts.(1) verts.(2) verts.(3)
      verts.(4) verts.(5) verts.(6) verts.(7)
  in
  printf "compute_segment_center c=(%d,%d,%d) ox=(%d,%d,%d) eq=%b\n"
    cx cy cz ox oy oz (cx = ox && cy = oy && cz = oz);
  [%expect {| compute_segment_center c=(32768,32768,32768) ox=(32768,32768,32768) eq=true |}]

let%expect_test "get_verts_for_normal parity C vs Ox" =
  let cases = [ (3, 1, 4, 2); (10, 5, 3, 7); (100, 200, 50, 150); (1, 2, 3, 32767) ] in
  List.iter cases ~f:(fun (va, vb, vc, vd) ->
    let cv0, cv1, cv2, cv3, cnf = c_get_verts_for_normal va vb vc vd in
    let ov0, ov1, ov2, ov3, onf = Ox_gameseg.get_verts_for_normal va vb vc vd in
    let eq = cv0 = ov0 && cv1 = ov1 && cv2 = ov2 && cv3 = ov3 && cnf = onf in
    printf "get_verts_for_normal (%d,%d,%d,%d) c=(%d,%d,%d,%d,%d) ox=(%d,%d,%d,%d,%d) eq=%b\n"
      va vb vc vd cv0 cv1 cv2 cv3 cnf ov0 ov1 ov2 ov3 onf eq);
  [%expect {|
    get_verts_for_normal (3,1,4,2) c=(1,2,3,4,0) ox=(1,2,3,4,0) eq=true
    get_verts_for_normal (10,5,3,7) c=(3,5,7,10,1) ox=(3,5,7,10,1) eq=true
    get_verts_for_normal (100,200,50,150) c=(50,100,150,200,1) ox=(50,100,150,200,1) eq=true
    get_verts_for_normal (1,2,3,32767) c=(1,2,3,32767,0) ox=(1,2,3,32767,0) eq=true
    |}]

let%expect_test "create_abs_vertex_lists parity C vs Ox" =
  let seg_verts = [| 10; 20; 30; 40; 50; 60; 70; 80 |] in
  let cases = [ (1, 0); (1, 3); (2, 0); (2, 5); (3, 1); (3, 4) ] in
  List.iter cases ~f:(fun (side_type, sidenum) ->
    let cnf, cv0, cv1, cv2, cv3, cv4, cv5 = c_create_abs_vertex_lists side_type seg_verts sidenum in
    let onf, overts = Ox_gameseg.create_abs_vertex_lists side_type seg_verts sidenum in
    let eq = cnf = onf && cv0 = overts.(0) && cv1 = overts.(1) && cv2 = overts.(2)
             && cv3 = overts.(3) && cv4 = overts.(4) && cv5 = overts.(5) in
    printf "create_abs_vertex_lists type=%d side=%d c=(%d,[%d,%d,%d,%d,%d,%d]) ox=(%d,[%d,%d,%d,%d,%d,%d]) eq=%b\n"
      side_type sidenum cnf cv0 cv1 cv2 cv3 cv4 cv5 onf
      overts.(0) overts.(1) overts.(2) overts.(3) overts.(4) overts.(5) eq);
  [%expect {|
    create_abs_vertex_lists type=1 side=0 c=(1,[80,70,30,40,0,0]) ox=(1,[80,70,30,40,0,0]) eq=true
    create_abs_vertex_lists type=1 side=3 c=(1,[30,70,60,20,0,0]) ox=(1,[30,70,60,20,0,0]) eq=true
    create_abs_vertex_lists type=2 side=0 c=(2,[80,70,30,30,40,80]) ox=(2,[80,70,30,30,40,80]) eq=true
    create_abs_vertex_lists type=2 side=5 c=(2,[40,30,20,20,10,40]) ox=(2,[40,30,20,20,10,40]) eq=true
    create_abs_vertex_lists type=3 side=1 c=(2,[40,10,50,50,80,40]) ox=(2,[40,10,50,50,80,40]) eq=true
    create_abs_vertex_lists type=3 side=4 c=(2,[80,50,60,60,70,80]) ox=(2,[80,50,60,60,70,80]) eq=true
    |}]

let%expect_test "extract_vector_from_segment parity C vs Ox" =
  (* Unit cube vertices *)
  let verts = [|
    (0, 0, 0); (0x10000, 0, 0); (0x10000, 0x10000, 0); (0, 0x10000, 0);
    (0, 0, 0x10000); (0x10000, 0, 0x10000); (0x10000, 0x10000, 0x10000); (0, 0x10000, 0x10000)
  |] in
  let arr = Array.create ~len: 26 0 in
  Array.iteri verts ~f:(fun i (x, y, z) ->
    arr.(i * 3) <- x; arr.((i * 3) + 1) <- y; arr.((i * 3) + 2) <- z);
  (* WFRONT=5, WBACK=4 *)
  arr.(24) <- 5; arr.(25) <- 4;
  let cx, cy, cz = c_extract_vector_from_segment arr in
  let verts_arr = Array.init 8 ~f:(fun i ->
    let b = i * 3 in arr.(b), arr.(b + 1), arr.(b + 2)) in
  let ox, oy, oz = Ox_gameseg.extract_vector_from_segment verts_arr 5 4 in
  printf "extract_vector_from_segment c=(%d,%d,%d) ox=(%d,%d,%d) eq=%b\n"
    cx cy cz ox oy oz (cx = ox && cy = oy && cz = oz);
  (* WBOTTOM=3, WTOP=1 *)
  arr.(24) <- 3; arr.(25) <- 1;
  let cx, cy, cz = c_extract_vector_from_segment arr in
  let ox, oy, oz = Ox_gameseg.extract_vector_from_segment verts_arr 3 1 in
  printf "extract_vector_from_segment c=(%d,%d,%d) ox=(%d,%d,%d) eq=%b\n"
    cx cy cz ox oy oz (cx = ox && cy = oy && cz = oz);
  [%expect {|
    extract_vector_from_segment c=(0,0,65536) ox=(0,0,65536) eq=true
    extract_vector_from_segment c=(-65536,0,0) ox=(-65536,0,0) eq=true
    |}]

let%expect_test "extract_orient_from_segment parity C vs Ox" =
  let verts = [|
    (0, 0, 0); (0x10000, 0, 0); (0x10000, 0x10000, 0); (0, 0x10000, 0);
    (0, 0, 0x10000); (0x10000, 0, 0x10000); (0x10000, 0x10000, 0x10000); (0, 0x10000, 0x10000)
  |] in
  let arr = Array.create ~len: 24 0 in
  Array.iteri verts ~f:(fun i (x, y, z) ->
    arr.(i * 3) <- x; arr.((i * 3) + 1) <- y; arr.((i * 3) + 2) <- z);
  let cr1, cr2, cr3, cu1, cu2, cu3, cf1, cf2, cf3 = c_extract_orient_from_segment arr in
  let verts_arr = Array.init 8 ~f:(fun i ->
    let b = i * 3 in arr.(b), arr.(b + 1), arr.(b + 2)) in
  let (or1, or2, or3), (ou1, ou2, ou3), (of1, of2, of3) =
    Ox_gameseg.extract_orient_from_segment verts_arr in
  let eq = cr1 = or1 && cr2 = or2 && cr3 = or3
    && cu1 = ou1 && cu2 = ou2 && cu3 = ou3
    && cf1 = of1 && cf2 = of2 && cf3 = of3 in
  printf "extract_orient_from_segment c=[%d,%d,%d;%d,%d,%d;%d,%d,%d] ox=[%d,%d,%d;%d,%d,%d;%d,%d,%d] eq=%b\n"
    cr1 cr2 cr3 cu1 cu2 cu3 cf1 cf2 cf3
    or1 or2 or3 ou1 ou2 ou3 of1 of2 of3 eq;
  [%expect {| extract_orient_from_segment c=[0,65536,0;-65536,0,0;0,0,65536] ox=[0,65536,0;-65536,0,0;0,0,65536] eq=true |}]

(* ---- FVI parity tests ---- *)

external c_check_point_to_face : int array -> int
  = "caml_c_check_point_to_face"

external c_find_plane_line_intersection : int array -> int * int * int * int
  = "caml_c_find_plane_line_intersection"

external c_check_sphere_to_face : int array -> int
  = "caml_c_check_sphere_to_face"

external c_calc_det_value
  : int -> int -> int -> int -> int -> int -> int -> int -> int -> int
  = "caml_c_calc_det_value_bc" "caml_c_calc_det_value"

external c_check_line_to_line : int array -> int * int * int
  = "caml_c_check_line_to_line"

external c_check_line_to_face : int array -> int * int * int * int
  = "caml_c_check_line_to_face"

external c_check_vector_to_sphere_1 : int array -> int * int * int * int
  = "caml_c_check_vector_to_sphere_1"

(* Helper: build a unit-cube-like segment for testing *)
let test_seg_verts = [| 0; 1; 2; 3; 4; 5; 6; 7 |]
let test_seg_vert_positions : Ox_fvi.vec3 array =
  [| (0, 0, 0); (0x10000, 0, 0); (0x10000, 0x10000, 0); (0, 0x10000, 0);
     (0, 0, 0x10000); (0x10000, 0, 0x10000); (0x10000, 0x10000, 0x10000); (0, 0x10000, 0x10000) |]

let%expect_test "calc_det_value parity C vs Ox" =
  let cases = [
    ((0x10000, 0, 0), (0, 0x10000, 0), (0, 0, 0x10000));
    ((0x10000, 0x8000, 0), (0, 0x10000, 0x4000), (0x2000, 0, 0x10000));
    ((12345, -67890, 11111), (22222, -33333, 44444), (-55555, 66666, -77777));
  ] in
  List.iter cases ~f:(fun ((rx, ry, rz), (ux, uy, uz), (fx, fy, fz)) ->
    let c_res = c_calc_det_value rx ry rz ux uy uz fx fy fz in
    let ox_res = Ox_fvi.calc_det_value (rx, ry, rz) (ux, uy, uz) (fx, fy, fz) in
    printf "calc_det_value c=%d ox=%d eq=%b\n" c_res ox_res (c_res = ox_res));
  [%expect {|
    calc_det_value c=65536 ox=65536 eq=true
    calc_det_value c=66560 ox=66560 eq=true
    calc_det_value c=9686 ox=9686 eq=true
    |}]

let%expect_test "randomized calc_det_value parity C vs Ox" =
  let gen =
    Quickcheck.Generator.map
      (Quickcheck.Generator.both vec3_gen (Quickcheck.Generator.both vec3_gen vec3_gen))
      ~f:(fun (r, (u, f)) -> (r, u, f))
  in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed:"calc-det-value-seed-v1" ~test_count:5000 gen
  |> Sequence.iter ~f:(fun ((rx, ry, rz), (ux, uy, uz), (fx, fy, fz)) ->
         incr total;
         let c_res = c_calc_det_value rx ry rz ux uy uz fx fy fz in
         let ox_res = Ox_fvi.calc_det_value (rx, ry, rz) (ux, uy, uz) (fx, fy, fz) in
         if c_res <> ox_res then (
           incr mismatches;
           if Option.is_none !first_mismatch then
             first_mismatch := Some (sprintf "calc_det_value r=(%d,%d,%d) c=%d ox=%d"
               rx ry rz c_res ox_res)));
  printf "calc_det_value random total=%d mismatches=%d\n" !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "calc_det_value randomized parity failed" ();
  [%expect {| calc_det_value random total=5000 mismatches=0 |}]

let%expect_test "randomized check_line_to_line parity C vs Ox" =
  let gen =
    Quickcheck.Generator.map
      (Quickcheck.Generator.both
         (Quickcheck.Generator.both vec3_mag_safe_gen vec3_mag_safe_gen)
         (Quickcheck.Generator.both vec3_mag_safe_gen vec3_mag_safe_gen))
      ~f:(fun ((p1, v1), (p2, v2)) -> (p1, v1, p2, v2))
  in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed:"check-line-to-line-seed-v1" ~test_count:5000 gen
  |> Sequence.iter ~f:(fun ((p1x, p1y, p1z), (v1x, v1y, v1z), (p2x, p2y, p2z), (v2x, v2y, v2z)) ->
         incr total;
         let arr = [| p1x; p1y; p1z; v1x; v1y; v1z; p2x; p2y; p2z; v2x; v2y; v2z |] in
         let (c_ok, c_t1, c_t2) = c_check_line_to_line arr in
         let (ox_ok_b, ox_t1, ox_t2) = Ox_fvi.check_line_to_line
           (p1x, p1y, p1z) (v1x, v1y, v1z) (p2x, p2y, p2z) (v2x, v2y, v2z) in
         let ox_ok = if ox_ok_b then 1 else 0 in
         let eq = c_ok = ox_ok && (c_ok = 0 || (c_t1 = ox_t1 && c_t2 = ox_t2)) in
         if not eq then (
           incr mismatches;
           if Option.is_none !first_mismatch then
             first_mismatch := Some (sprintf "check_line_to_line c_ok=%d ox_ok=%d c_t1=%d ox_t1=%d"
               c_ok ox_ok c_t1 ox_t1)));
  printf "check_line_to_line random total=%d mismatches=%d\n" !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "check_line_to_line randomized parity failed" ();
  [%expect {| check_line_to_line random total=5000 mismatches=0 |}]

let%expect_test "randomized check_point_to_face parity C vs Ox" =
  (* Generate a triangle face with 3 vertices, check a random point *)
  let gen =
    Quickcheck.Generator.map
      (Quickcheck.Generator.both vec3_mag_safe_gen
         (Quickcheck.Generator.both vec3_mag_safe_gen
            (Quickcheck.Generator.both vec3_mag_safe_gen vec3_mag_safe_gen)))
      ~f:(fun (cp, (n, (v0, v1))) -> (cp, n, v0, v1))
  in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed:"check-point-to-face-seed-v1" ~test_count:5000 gen
  |> Sequence.iter ~f:(fun ((cpx, cpy, cpz), (nx, ny, nz), (v0x, v0y, v0z), (v1x, v1y, v1z)) ->
         (* Use 3 vertices for a triangle *)
         let v2x = v0x + v1x in
         let v2y = v0y + v1y in
         let v2z = v0z + v1z in
         let nv = 3 in
         incr total;
         let arr = [| cpx; cpy; cpz; nx; ny; nz; nv;
                      v0x; v0y; v0z; v1x; v1y; v1z; v2x; v2y; v2z |] in
         let c_res = c_check_point_to_face arr in
         let verts = [| (v0x, v0y, v0z); (v1x, v1y, v1z); (v2x, v2y, v2z) |] in
         let ox_res = Ox_fvi.check_point_to_face
           ~checkp:(cpx, cpy, cpz) ~norm:(nx, ny, nz) ~nv ~vertex_positions:verts in
         if c_res <> ox_res then (
           incr mismatches;
           if Option.is_none !first_mismatch then
             first_mismatch := Some (sprintf "check_point_to_face c=%d ox=%d cp=(%d,%d,%d)"
               c_res ox_res cpx cpy cpz)));
  printf "check_point_to_face random total=%d mismatches=%d\n" !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "check_point_to_face randomized parity failed" ();
  [%expect {| check_point_to_face random total=5000 mismatches=0 |}]

let%expect_test "randomized find_plane_line_intersection parity C vs Ox" =
  let gen =
    Quickcheck.Generator.map
      (Quickcheck.Generator.both
         (Quickcheck.Generator.both vec3_mag_safe_gen vec3_mag_safe_gen)
         (Quickcheck.Generator.both
            (Quickcheck.Generator.both vec3_mag_safe_gen vec3_mag_safe_gen)
            fix_gen))
      ~f:(fun ((pp, pn), ((p0, p1), rad)) -> (pp, pn, p0, p1, rad))
  in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed:"find-plane-line-int-seed-v1" ~test_count:5000 gen
  |> Sequence.iter ~f:(fun ((ppx, ppy, ppz), (pnx, pny, pnz), (p0x, p0y, p0z), (p1x, p1y, p1z), rad) ->
         incr total;
         let arr = [| ppx; ppy; ppz; pnx; pny; pnz; p0x; p0y; p0z; p1x; p1y; p1z; rad |] in
         let (c_found, c_nx, c_ny, c_nz) = c_find_plane_line_intersection arr in
         let ox_result = Ox_fvi.find_plane_line_intersection
           ~plane_pnt:(ppx, ppy, ppz) ~plane_norm:(pnx, pny, pnz)
           ~p0:(p0x, p0y, p0z) ~p1:(p1x, p1y, p1z) ~rad in
         let (ox_found, ox_nx, ox_ny, ox_nz) = match ox_result with
           | None -> (0, 0, 0, 0)
           | Some (_, (nx, ny, nz)) -> (1, nx, ny, nz)
         in
         let eq = c_found = ox_found && (c_found = 0 || (c_nx = ox_nx && c_ny = ox_ny && c_nz = ox_nz)) in
         if not eq then (
           incr mismatches;
           if Option.is_none !first_mismatch then
             first_mismatch := Some (sprintf "find_plane_line_intersection c_found=%d ox_found=%d c=(%d,%d,%d) ox=(%d,%d,%d)"
               c_found ox_found c_nx c_ny c_nz ox_nx ox_ny ox_nz)));
  printf "find_plane_line_intersection random total=%d mismatches=%d\n" !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "find_plane_line_intersection randomized parity failed" ();
  [%expect {| find_plane_line_intersection random total=5000 mismatches=0 |}]

let%expect_test "randomized check_sphere_to_face parity C vs Ox" =
  let rad_gen = Quickcheck.Generator.map Int.quickcheck_generator ~f:(fun v ->
    Int.max 1 (Int.abs v land 0xFFFF)) in
  let gen =
    Quickcheck.Generator.map
      (Quickcheck.Generator.both
         (Quickcheck.Generator.both vec3_mag_safe_gen vec3_mag_safe_gen)
         (Quickcheck.Generator.both rad_gen
            (Quickcheck.Generator.both vec3_mag_safe_gen
               (Quickcheck.Generator.both vec3_mag_safe_gen vec3_mag_safe_gen))))
      ~f:(fun ((pnt, norm), (rad, (v0, (v1, v2)))) -> (pnt, norm, rad, v0, v1, v2))
  in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed:"check-sphere-to-face-seed-v1" ~test_count:5000 gen
  |> Sequence.iter ~f:(fun ((px, py, pz), (nx, ny, nz), rad, (v0x, v0y, v0z), (v1x, v1y, v1z), (v2x, v2y, v2z)) ->
         let nv = 3 in
         incr total;
         let arr = [| px; py; pz; nx; ny; nz; nv; rad;
                      v0x; v0y; v0z; v1x; v1y; v1z; v2x; v2y; v2z |] in
         let c_res = c_check_sphere_to_face arr in
         let verts = [| (v0x, v0y, v0z); (v1x, v1y, v1z); (v2x, v2y, v2z) |] in
         let ox_res = Ox_fvi.check_sphere_to_face
           ~pnt:(px, py, pz) ~norm:(nx, ny, nz) ~nv ~rad ~vertex_positions:verts in
         if c_res <> ox_res then (
           incr mismatches;
           if Option.is_none !first_mismatch then
             first_mismatch := Some (sprintf "check_sphere_to_face c=%d ox=%d pnt=(%d,%d,%d)"
               c_res ox_res px py pz)));
  printf "check_sphere_to_face random total=%d mismatches=%d\n" !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "check_sphere_to_face randomized parity failed" ();
  [%expect {| check_sphere_to_face random total=5000 mismatches=0 |}]

let%expect_test "check_line_to_face parity C vs Ox" =
  (* Test with a simple quad face: front face of unit cube, side 5 *)
  let p0 = (0x8000, 0x8000, -0x10000) in  (* behind the front face *)
  let p1 = (0x8000, 0x8000, 0x10000) in   (* through the front face *)
  let norm = (0, 0, -0x10000) in  (* front face normal points -z *)
  let rad = 0 in
  let facenum = 0 in
  let nv = 4 in
  let side_type = 1 in  (* SIDE_IS_QUAD *)
  let sidenum = 5 in    (* front face *)
  let (p0x, p0y, p0z) = p0 in
  let (p1x, p1y, p1z) = p1 in
  let (nx, ny, nz) = norm in
  let arr = Array.create ~len:46 0 in
  arr.(0) <- p0x; arr.(1) <- p0y; arr.(2) <- p0z;
  arr.(3) <- p1x; arr.(4) <- p1y; arr.(5) <- p1z;
  arr.(6) <- nx; arr.(7) <- ny; arr.(8) <- nz;
  arr.(9) <- rad; arr.(10) <- facenum; arr.(11) <- nv;
  arr.(12) <- side_type; arr.(13) <- sidenum;
  for i = 0 to 7 do arr.(14 + i) <- test_seg_verts.(i) done;
  Array.iteri test_seg_vert_positions ~f:(fun i (x, y, z) ->
    arr.(22 + i * 3) <- x; arr.(22 + i * 3 + 1) <- y; arr.(22 + i * 3 + 2) <- z);
  let (c_hit, c_nx, c_ny, c_nz) = c_check_line_to_face arr in
  let num_faces, vertex_list = Ox_gameseg.create_abs_vertex_lists side_type test_seg_verts sidenum in
  let (ox_hit, (ox_nx, ox_ny, ox_nz)) = Ox_fvi.check_line_to_face
    ~p0 ~p1 ~norm ~rad ~facenum ~nv ~num_faces ~vertex_list
    ~seg_verts:test_seg_verts ~seg_vert_positions:test_seg_vert_positions in
  let eq = c_hit = ox_hit && (c_hit = 0 || (c_nx = ox_nx && c_ny = ox_ny && c_nz = ox_nz)) in
  printf "check_line_to_face hit c=%d ox=%d newp c=(%d,%d,%d) ox=(%d,%d,%d) eq=%b\n"
    c_hit ox_hit c_nx c_ny c_nz ox_nx ox_ny ox_nz eq;
  [%expect {| check_line_to_face hit c=1 ox=1 newp c=(32768,32768,0) ox=(32768,32768,0) eq=true |}]

let%expect_test "randomized check_vector_to_sphere_1 parity C vs Ox" =
  let sphere_rad_gen = Quickcheck.Generator.map Int.quickcheck_generator ~f:(fun v ->
    Int.max 0x100 (Int.abs v land 0x7FFFF)) in
  let gen =
    Quickcheck.Generator.map
      (Quickcheck.Generator.both
         (Quickcheck.Generator.both vec3_mag_safe_gen vec3_mag_safe_gen)
         (Quickcheck.Generator.both vec3_mag_safe_gen sphere_rad_gen))
      ~f:(fun ((p0, p1), (sp, sr)) -> (p0, p1, sp, sr))
  in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed:"check-vector-to-sphere-1-seed-v1" ~test_count:5000 gen
  |> Sequence.iter ~f:(fun ((p0x, p0y, p0z), (p1x, p1y, p1z), (spx, spy, spz), srad) ->
         incr total;
         let arr = [| p0x; p0y; p0z; p1x; p1y; p1z; spx; spy; spz; srad |] in
         let (c_dist, c_ix, c_iy, c_iz) = c_check_vector_to_sphere_1 arr in
         let (ox_dist, (ox_ix, ox_iy, ox_iz)) = Ox_fvi.check_vector_to_sphere_1
           ~p0:(p0x, p0y, p0z) ~p1:(p1x, p1y, p1z)
           ~sphere_pos:(spx, spy, spz) ~sphere_rad:srad in
         let eq = c_dist = ox_dist && (c_dist = 0 || (c_ix = ox_ix && c_iy = ox_iy && c_iz = ox_iz)) in
         if not eq then (
           incr mismatches;
           if Option.is_none !first_mismatch then
             first_mismatch := Some (sprintf "check_vector_to_sphere_1 c_dist=%d ox_dist=%d c=(%d,%d,%d) ox=(%d,%d,%d)"
               c_dist ox_dist c_ix c_iy c_iz ox_ix ox_iy ox_iz)));
  printf "check_vector_to_sphere_1 random total=%d mismatches=%d\n" !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "check_vector_to_sphere_1 randomized parity failed" ();
  [%expect {| check_vector_to_sphere_1 random total=5000 mismatches=0 |}]

(* ============================================================ *)
(* Curves parity tests                                          *)
(* ============================================================ *)

external c_create_curve : int array -> int * int * int * int * int * int * int * int * int * int * int * int = "caml_c_create_curve"
external c_evaluate_curve : int array -> int * int * int = "caml_c_evaluate_curve"
external c_curve_dist : int array -> int = "caml_c_curve_dist"
external c_curve_dir : int array -> int * int * int = "caml_c_curve_dir"

let eq_of_ox (eq : Ox_curves.vms_equation) =
  (eq.x3, eq.x2, eq.x1, eq.x0, eq.y3, eq.y2, eq.y1, eq.y0, eq.z3, eq.z2, eq.z1, eq.z0)

let eq_arr (eq : Ox_curves.vms_equation) =
  [| eq.x3; eq.x2; eq.x1; eq.x0; eq.y3; eq.y2; eq.y1; eq.y0; eq.z3; eq.z2; eq.z1; eq.z0 |]

let%expect_test "create_curve deterministic parity C vs Ox" =
  let cases =
    [ ((0x10000, 0, 0), (0x20000, 0, 0), (0x10000, 0, 0), (0x10000, 0, 0))
    ; ((0, 0x10000, 0), (0, 0x20000, 0x10000), (0, 0x10000, 0), (0, 0, 0x10000))
    ; ((0x8000, 0x8000, 0x8000), (-0x8000, -0x8000, -0x8000), (0x10000, 0x10000, 0x10000), (-0x10000, -0x10000, -0x10000))
    ]
  in
  List.iter cases ~f:(fun ((p1x,p1y,p1z),(p4x,p4y,p4z),(r1x,r1y,r1z),(r4x,r4y,r4z)) ->
    let arr = [| p1x;p1y;p1z;p4x;p4y;p4z;r1x;r1y;r1z;r4x;r4y;r4z |] in
    let c = c_create_curve arr in
    let ox = eq_of_ox (Ox_curves.create_curve ~p1:(p1x,p1y,p1z) ~p4:(p4x,p4y,p4z) ~r1:(r1x,r1y,r1z) ~r4:(r4x,r4y,r4z)) in
    let eq = [%compare.equal: int * int * int * int * int * int * int * int * int * int * int * int] c ox in
    printf "create_curve eq=%b\n" eq);
  [%expect {|
    create_curve eq=true
    create_curve eq=true
    create_curve eq=true |}]

let%expect_test "create_curve randomized parity C vs Ox" =
  let gen =
    Quickcheck.Generator.map
      (Quickcheck.Generator.both
         (Quickcheck.Generator.both vec3_mag_safe_gen vec3_mag_safe_gen)
         (Quickcheck.Generator.both vec3_mag_safe_gen vec3_mag_safe_gen))
      ~f:(fun ((a,b),(c,d)) -> (a,b,c,d))
  in
  let total = ref 0 in
  let mismatches = ref 0 in
  random_values ~seed:"create-curve-seed-v1" ~test_count:3000 gen
  |> Sequence.iter ~f:(fun ((p1x,p1y,p1z),(p4x,p4y,p4z),(r1x,r1y,r1z),(r4x,r4y,r4z)) ->
       incr total;
       let arr = [| p1x;p1y;p1z;p4x;p4y;p4z;r1x;r1y;r1z;r4x;r4y;r4z |] in
       let c = c_create_curve arr in
       let ox = eq_of_ox (Ox_curves.create_curve ~p1:(p1x,p1y,p1z) ~p4:(p4x,p4y,p4z) ~r1:(r1x,r1y,r1z) ~r4:(r4x,r4y,r4z)) in
       if not ([%compare.equal: int * int * int * int * int * int * int * int * int * int * int * int] c ox) then
         incr mismatches);
  printf "create_curve random total=%d mismatches=%d\n" !total !mismatches;
  if !mismatches <> 0 then failwithf "create_curve randomized parity failed" ();
  [%expect {| create_curve random total=3000 mismatches=0 |}]

let%expect_test "evaluate_curve deterministic parity C vs Ox" =
  let eq = Ox_curves.create_curve
    ~p1:(0x10000, 0, 0) ~p4:(0x20000, 0, 0)
    ~r1:(0x10000, 0, 0) ~r4:(0x10000, 0, 0) in
  let ts = [ 0; 0x4000; 0x8000; 0xC000; 0x10000 ] in
  List.iter ts ~f:(fun t ->
    let arr = Array.append (eq_arr eq) [| t |] in
    let c = c_evaluate_curve arr in
    let ox = Ox_curves.evaluate_curve eq ~t in
    let eq_v = [%compare.equal: int * int * int] c ox in
    printf "evaluate_curve t=%d eq=%b\n" t eq_v);
  [%expect {|
    evaluate_curve t=0 eq=true
    evaluate_curve t=16384 eq=true
    evaluate_curve t=32768 eq=true
    evaluate_curve t=49152 eq=true
    evaluate_curve t=65536 eq=true |}]

let%expect_test "evaluate_curve randomized parity C vs Ox" =
  let eq = Ox_curves.create_curve
    ~p1:(0x10000, 0x20000, 0x30000) ~p4:(0x40000, 0x50000, 0x60000)
    ~r1:(0x10000, 0x10000, 0x10000) ~r4:(-0x10000, -0x10000, -0x10000) in
  let t_gen = Quickcheck.Generator.map Int.quickcheck_generator ~f:(fun v ->
    Int.abs v land 0xFFFF) in
  let total = ref 0 in
  let mismatches = ref 0 in
  random_values ~seed:"evaluate-curve-seed-v1" ~test_count:3000 t_gen
  |> Sequence.iter ~f:(fun t ->
       incr total;
       let arr = Array.append (eq_arr eq) [| t |] in
       let c = c_evaluate_curve arr in
       let ox = Ox_curves.evaluate_curve eq ~t in
       if not ([%compare.equal: int * int * int] c ox) then
         incr mismatches);
  printf "evaluate_curve random total=%d mismatches=%d\n" !total !mismatches;
  if !mismatches <> 0 then failwithf "evaluate_curve randomized parity failed" ();
  [%expect {| evaluate_curve random total=3000 mismatches=0 |}]

let%expect_test "curve_dist deterministic parity C vs Ox" =
  let eq = Ox_curves.create_curve
    ~p1:(0x10000, 0, 0) ~p4:(0x50000, 0, 0)
    ~r1:(0x40000, 0, 0) ~r4:(0x40000, 0, 0) in
  let p0 = Ox_curves.evaluate_curve eq ~t:0 in
  let (p0x, p0y, p0z) = p0 in
  let dist = 0x10000 in
  let arr = Array.concat [ eq_arr eq; [| 0; p0x; p0y; p0z; dist |] ] in
  let c = c_curve_dist arr in
  let ox = Ox_curves.curve_dist eq ~t0:0 ~p0 ~dist in
  printf "curve_dist c=%d ox=%d eq=%b\n" c ox (c = ox);
  [%expect {| curve_dist c=14755 ox=14755 eq=true |}]

let%expect_test "curve_dir deterministic parity C vs Ox" =
  let eq = Ox_curves.create_curve
    ~p1:(0x10000, 0, 0) ~p4:(0x20000, 0, 0)
    ~r1:(0x10000, 0, 0) ~r4:(0x10000, 0, 0) in
  let ts = [ 0; 0x4000; 0x8000; 0xC000 ] in
  List.iter ts ~f:(fun t0 ->
    let arr = Array.append (eq_arr eq) [| t0 |] in
    let c = c_curve_dir arr in
    let (_, ox) = Ox_curves.curve_dir eq ~t0 in
    let eq_v = [%compare.equal: int * int * int] c ox in
    printf "curve_dir t0=%d eq=%b\n" t0 eq_v);
  [%expect {|
    curve_dir t0=0 eq=true
    curve_dir t0=16384 eq=true
    curve_dir t0=32768 eq=true
    curve_dir t0=49152 eq=true |}]

let%expect_test "curve_dir randomized parity C vs Ox" =
  let eq = Ox_curves.create_curve
    ~p1:(0x10000, 0x20000, 0x30000) ~p4:(0x40000, 0x50000, 0x60000)
    ~r1:(0x10000, 0x10000, 0x10000) ~r4:(-0x10000, -0x10000, -0x10000) in
  let t_gen = Quickcheck.Generator.map Int.quickcheck_generator ~f:(fun v ->
    Int.abs v land 0xFFFF) in
  let total = ref 0 in
  let mismatches = ref 0 in
  random_values ~seed:"curve-dir-seed-v1" ~test_count:3000 t_gen
  |> Sequence.iter ~f:(fun t0 ->
       incr total;
       let arr = Array.append (eq_arr eq) [| t0 |] in
       let c = c_curve_dir arr in
       let (_, ox) = Ox_curves.curve_dir eq ~t0 in
       if not ([%compare.equal: int * int * int] c ox) then
         incr mismatches);
  printf "curve_dir random total=%d mismatches=%d\n" !total !mismatches;
  if !mismatches <> 0 then failwithf "curve_dir randomized parity failed" ();
  [%expect {| curve_dir random total=3000 mismatches=0 |}]

(* --- physics_turn_towards_vector parity tests --- *)

external c_physics_turn_towards_vector
  : int -> int -> int -> int -> int -> int -> int -> int -> int -> int -> int
  -> int * int * int
  = "caml_c_physics_turn_towards_vector_bc" "caml_c_physics_turn_towards_vector"

let%expect_test "physics_turn_towards_vector zero goal returns unchanged rotvel" =
  let c = c_physics_turn_towards_vector 0 0 0  100 0 200  0x10000 0  500 600 700 in
  let ox = Ox_physics.physics_turn_towards_vector
    ~goal:(0, 0, 0) ~fvec:(100, 0, 200) ~rate:0x10000
    ~is_morph:false ~cur_rotvel:(500, 600, 700) in
  printf "c=(%d,%d,%d) ox=(%d,%d,%d) eq=%b\n"
    (let (a,_,_) = c in a) (let (_,a,_) = c in a) (let (_,_,a) = c in a)
    (let (a,_,_) = ox in a) (let (_,a,_) = ox in a) (let (_,_,a) = ox in a)
    ([%compare.equal: int * int * int] c ox);
  [%expect {| c=(500,600,700) ox=(500,600,700) eq=true |}]

let%expect_test "physics_turn_towards_vector basic forward" =
  let c = c_physics_turn_towards_vector 0 0 0x10000  0x10000 0 0  0x10000 0  0 0 0 in
  let ox = Ox_physics.physics_turn_towards_vector
    ~goal:(0, 0, 0x10000) ~fvec:(0x10000, 0, 0) ~rate:0x10000
    ~is_morph:false ~cur_rotvel:(0, 0, 0) in
  printf "c=(%d,%d,%d) ox=(%d,%d,%d) eq=%b\n"
    (let (a,_,_) = c in a) (let (_,a,_) = c in a) (let (_,_,a) = c in a)
    (let (a,_,_) = ox in a) (let (_,a,_) = ox in a) (let (_,_,a) = ox in a)
    ([%compare.equal: int * int * int] c ox);
  [%expect {| c=(0,-16384,0) ox=(0,-16384,0) eq=true |}]

let%expect_test "randomized physics_turn_towards_vector parity C vs Ox" =
  let rate_gen = Quickcheck.Generator.map Int.quickcheck_generator ~f:(fun v ->
    let v = Int.abs v land 0x1FFFF in
    if v = 0 then 0x10000 else v) in
  let bool_gen = Quickcheck.Generator.map Int.quickcheck_generator ~f:(fun v ->
    v land 1) in
  let gen =
    Quickcheck.Generator.map
      (Quickcheck.Generator.both
        (Quickcheck.Generator.both vec3_mag_safe_gen vec3_mag_safe_gen)
        (Quickcheck.Generator.both
          (Quickcheck.Generator.both rate_gen bool_gen)
          vec3_mag_safe_gen))
      ~f:(fun ((goal, fvec), ((rate, is_morph), rotvel)) ->
        (goal, fvec, rate, is_morph, rotvel))
  in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed:"physics-turn-towards-v1" ~test_count:5000 gen
  |> Sequence.iter ~f:(fun ((gx,gy,gz), (fx,fy,fz), rate, is_morph, (crx,cry,crz)) ->
       incr total;
       let c = c_physics_turn_towards_vector gx gy gz fx fy fz rate is_morph crx cry crz in
       let ox = Ox_physics.physics_turn_towards_vector
         ~goal:(gx,gy,gz) ~fvec:(fx,fy,fz) ~rate
         ~is_morph:(is_morph <> 0) ~cur_rotvel:(crx,cry,crz) in
       if not ([%compare.equal: int * int * int] c ox) then (
         incr mismatches;
         if Option.is_none !first_mismatch then
           first_mismatch := Some (
             sprintf "goal=(%d,%d,%d) fvec=(%d,%d,%d) rate=%d morph=%d rotvel=(%d,%d,%d) c=(%d,%d,%d) ox=(%d,%d,%d)"
               gx gy gz fx fy fz rate is_morph crx cry crz
               (let (a,_,_) = c in a) (let (_,a,_) = c in a) (let (_,_,a) = c in a)
               (let (a,_,_) = ox in a) (let (_,a,_) = ox in a) (let (_,_,a) = ox in a))));
  printf "physics_turn_towards_vector random total=%d mismatches=%d\n" !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "physics_turn_towards_vector parity failed" ();
  [%expect {| physics_turn_towards_vector random total=5000 mismatches=0 |}]

(* --- do_physics_sim_rot parity tests --- *)

external c_do_physics_sim_rot
  : int -> int -> int -> int -> int -> int -> int -> int -> int -> int ->
    int -> int -> int -> int -> int -> int -> int -> int -> int -> int ->
    int * int * int * int * int * int * int * int * int * int * int * int * int * int
  = "caml_c_do_physics_sim_rot_bc" "caml_c_do_physics_sim_rot"

let unpack_sim_rot_result (tag, r1, r2, r3, u1, u2, u3, f1, f2, f3,
                           rvx, rvy, rvz, turnroll) =
  (tag, ((r1,r2,r3),(u1,u2,u3),(f1,f2,f3)), (rvx,rvy,rvz), turnroll)

let ox_do_physics_sim_rot rvx rvy rvz rtx rty rtz
    o_rx o_ry o_rz o_ux o_uy o_uz o_fx o_fy o_fz
    drag mass flags turnroll frame_time =
  let orient = ((o_rx,o_ry,o_rz),(o_ux,o_uy,o_uz),(o_fx,o_fy,o_fz)) in
  match Ox_physics.do_physics_sim_rot
    ~rotvel:(rvx,rvy,rvz) ~rotthrust:(rtx,rty,rtz)
    ~orient ~drag ~mass ~flags ~turnroll ~frame_time
  with
  | None -> (0, ((0,0,0),(0,0,0),(0,0,0)), (0,0,0), 0)
  | Some (orient, rotvel, turnroll) ->
    (1, orient, rotvel, turnroll)

let print_sim_rot_result label (tag, ((r1,r2,r3),(u1,u2,u3),(f1,f2,f3)),
                                (rvx,rvy,rvz), turnroll) =
  if tag = 0 then printf "%s=no_change " label
  else printf "%s=(orient=[%d,%d,%d;%d,%d,%d;%d,%d,%d] rv=(%d,%d,%d) tr=%d) "
    label r1 r2 r3 u1 u2 u3 f1 f2 f3 rvx rvy rvz turnroll

let%expect_test "do_physics_sim_rot zero rotvel and zero rotthrust => no change" =
  let c = c_do_physics_sim_rot 0 0 0  0 0 0
      0x10000 0 0  0 0x10000 0  0 0 0x10000
      0 0x10000 0 0 1024 in
  let c = unpack_sim_rot_result c in
  let ox = ox_do_physics_sim_rot 0 0 0  0 0 0
      0x10000 0 0  0 0x10000 0  0 0 0x10000
      0 0x10000 0 0 1024 in
  print_sim_rot_result "c" c;
  print_sim_rot_result "ox" ox;
  let eq = Poly.(c = ox) in
  printf "eq=%b\n" eq;
  [%expect {| c=no_change ox=no_change eq=false |}]

let%expect_test "do_physics_sim_rot simple rotation no drag" =
  (* rotvel.y = 0x4000 (heading), no drag, no thrust, identity orient *)
  let c = c_do_physics_sim_rot 0 0x4000 0  0 0 0
      0x10000 0 0  0 0x10000 0  0 0 0x10000
      0 0x10000 0 0 0x10000 in
  let c = unpack_sim_rot_result c in
  let ox = ox_do_physics_sim_rot 0 0x4000 0  0 0 0
      0x10000 0 0  0 0x10000 0  0 0 0x10000
      0 0x10000 0 0 0x10000 in
  print_sim_rot_result "c" c;
  print_sim_rot_result "ox" ox;
  let eq = Poly.(c = ox) in
  printf "eq=%b\n" eq;
  [%expect {| c=(orient=[0,0,-65536;0,65536,0;65536,0,0] rv=(0,16384,0) tr=0) ox=(orient=[0,0,-65536;0,65536,0;65536,0,0] rv=(0,16384,0) tr=0) eq=true |}]

let%expect_test "do_physics_sim_rot with drag no thrust" =
  (* rotvel.x = 0x8000, drag=0x2000, no thrust flag *)
  let c = c_do_physics_sim_rot 0x8000 0 0  0 0 0
      0x10000 0 0  0 0x10000 0  0 0 0x10000
      0x2000 0x10000 0 0 1024 in
  let c = unpack_sim_rot_result c in
  let ox = ox_do_physics_sim_rot 0x8000 0 0  0 0 0
      0x10000 0 0  0 0x10000 0  0 0 0x10000
      0x2000 0x10000 0 0 1024 in
  print_sim_rot_result "c" c;
  print_sim_rot_result "ox" ox;
  let eq = Poly.(c = ox) in
  printf "eq=%b\n" eq;
  [%expect {| c=(orient=[65536,0,0;0,65497,2208;0,-2208,65497] rv=(22528,0,0) tr=0) ox=(orient=[65536,0,0;0,65497,2208;0,-2208,65497] rv=(22528,0,0) tr=0) eq=true |}]

let%expect_test "randomized do_physics_sim_rot parity C vs Ox" =
  let state = Random.State.make [| 54321 |] in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  let gen_fix () = Random.State.int state 0x40000 - 0x20000 in
  let gen_small () = Random.State.int state 0x10000 in
  (* Generate valid-ish orient matrices: use angles_2_matrix *)
  let gen_orient () =
    let p = Random.State.int state 0x10000 in
    let b = Random.State.int state 0x10000 in
    let h = Random.State.int state 0x10000 in
    Ox_math.vm_angles_2_matrix (p, b, h)
  in
  for _ = 1 to 5000 do
    let rvx = gen_fix () in
    let rvy = gen_fix () in
    let rvz = gen_fix () in
    let rtx = gen_fix () in
    let rty = gen_fix () in
    let rtz = gen_fix () in
    let ((o_rx,o_ry,o_rz),(o_ux,o_uy,o_uz),(o_fx,o_fy,o_fz)) = gen_orient () in
    let drag = gen_small () in
    let mass = gen_small () + 1 in
    (* Random flags: PF_USES_THRUST=0x40, PF_TURNROLL=0x01, PF_FREE_SPINNING=0x100 *)
    let flags = Random.State.int state 0x200 in
    let turnroll = Random.State.int state 0x10000 - 0x8000 in
    let frame_time = Random.State.int state 4096 + 256 in
    incr total;
    let c = c_do_physics_sim_rot rvx rvy rvz rtx rty rtz
        o_rx o_ry o_rz o_ux o_uy o_uz o_fx o_fy o_fz
        drag mass flags turnroll frame_time in
    let c = unpack_sim_rot_result c in
    let ox = ox_do_physics_sim_rot rvx rvy rvz rtx rty rtz
        o_rx o_ry o_rz o_ux o_uy o_uz o_fx o_fy o_fz
        drag mass flags turnroll frame_time in
    if Poly.(c <> ox) then begin
      incr mismatches;
      if Option.is_none !first_mismatch then begin
        let (ct, ((cr1,cr2,cr3),(cu1,cu2,cu3),(cf1,cf2,cf3)), (crx,cry,crz), ctr) = c in
        let (ot, ((or1,or2,or3),(ou1,ou2,ou3),(of1,of2,of3)), (orx,ory,orz), otr) = ox in
        first_mismatch := Some (sprintf
          "rv=(%d,%d,%d) rt=(%d,%d,%d) drag=%d mass=%d flags=%d tr=%d ft=%d c=(tag=%d orient=[%d,%d,%d;%d,%d,%d;%d,%d,%d] rv=(%d,%d,%d) tr=%d) ox=(tag=%d orient=[%d,%d,%d;%d,%d,%d;%d,%d,%d] rv=(%d,%d,%d) tr=%d)"
          rvx rvy rvz rtx rty rtz drag mass flags turnroll frame_time
          ct cr1 cr2 cr3 cu1 cu2 cu3 cf1 cf2 cf3 crx cry crz ctr
          ot or1 or2 or3 ou1 ou2 ou3 of1 of2 of3 orx ory orz otr)
      end
    end
  done;
  printf "do_physics_sim_rot random total=%d mismatches=%d\n" !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "do_physics_sim_rot parity failed" ();
  [%expect {| do_physics_sim_rot random total=5000 mismatches=0 |}]

(* --- calc_gun_point parity tests --- *)

external c_calc_gun_point : int array -> int * int * int
  = "caml_c_calc_gun_point"

let pack_gun_point_args ~gun_point:(gpx,gpy,gpz) ~start_mn
    ~anim_angles ~offsets ~parents
    ~orient:((r1,r2,r3),(u1,u2,u3),(f1,f2,f3))
    ~pos:(px,py,pz) =
  let a = Array.create ~len:86 0 in
  a.(0) <- gpx; a.(1) <- gpy; a.(2) <- gpz;
  a.(3) <- start_mn;
  Array.iteri anim_angles ~f:(fun i (p,b,h) ->
    let base = 4 + i * 3 in
    a.(base) <- p; a.(base+1) <- b; a.(base+2) <- h);
  Array.iteri offsets ~f:(fun i (x,y,z) ->
    let base = 34 + i * 3 in
    a.(base) <- x; a.(base+1) <- y; a.(base+2) <- z);
  Array.iteri parents ~f:(fun i v -> a.(64 + i) <- v);
  a.(74) <- r1; a.(75) <- r2; a.(76) <- r3;
  a.(77) <- u1; a.(78) <- u2; a.(79) <- u3;
  a.(80) <- f1; a.(81) <- f2; a.(82) <- f3;
  a.(83) <- px; a.(84) <- py; a.(85) <- pz;
  a

let%expect_test "calc_gun_point identity orient no hierarchy" =
  (* gun_point at (0x10000, 0, 0), start_mn=0 (no hierarchy walk),
     identity orient, pos at origin => result = gun_point *)
  let n = 10 in
  let anim_angles = Array.init n ~f:(fun _ -> (0,0,0)) in
  let offsets = Array.init n ~f:(fun _ -> (0,0,0)) in
  let parents = Array.init n ~f:(fun _ -> 0) in
  let orient = ((0x10000,0,0),(0,0x10000,0),(0,0,0x10000)) in
  let pos = (0, 0, 0) in
  let packed = pack_gun_point_args
    ~gun_point:(0x10000, 0, 0) ~start_mn:0
    ~anim_angles ~offsets ~parents ~orient ~pos in
  let c = c_calc_gun_point packed in
  let ox = Ox_physics.calc_gun_point
    ~gun_point:(0x10000, 0, 0) ~start_mn:0
    ~anim_angles ~offsets ~parents ~orient ~pos in
  printf "c=(%d,%d,%d) ox=(%d,%d,%d) eq=%b\n"
    (let (x,_,_) = c in x) (let (_,y,_) = c in y) (let (_,_,z) = c in z)
    (let (x,_,_) = ox in x) (let (_,y,_) = ox in y) (let (_,_,z) = ox in z)
    Poly.(c = ox);
  [%expect {| c=(65536,0,0) ox=(65536,0,0) eq=true |}]

let%expect_test "calc_gun_point with one hierarchy level" =
  (* gun at origin, start_mn=1, parent[1]=0, offset[1]=(0x10000,0,0),
     anim_angles[1]=(0,0,0) => identity rotation, pnt = gun + offset = (0x10000,0,0)
     identity orient, pos=(0x20000,0,0) => result = (0x30000,0,0) *)
  let n = 10 in
  let anim_angles = Array.init n ~f:(fun _ -> (0,0,0)) in
  let offsets = Array.init n ~f:(fun i ->
    if i = 1 then (0x10000, 0, 0) else (0, 0, 0)) in
  let parents = Array.init n ~f:(fun _ -> 0) in
  let orient = ((0x10000,0,0),(0,0x10000,0),(0,0,0x10000)) in
  let pos = (0x20000, 0, 0) in
  let packed = pack_gun_point_args
    ~gun_point:(0, 0, 0) ~start_mn:1
    ~anim_angles ~offsets ~parents ~orient ~pos in
  let c = c_calc_gun_point packed in
  let ox = Ox_physics.calc_gun_point
    ~gun_point:(0, 0, 0) ~start_mn:1
    ~anim_angles ~offsets ~parents ~orient ~pos in
  printf "c=(%d,%d,%d) ox=(%d,%d,%d) eq=%b\n"
    (let (x,_,_) = c in x) (let (_,y,_) = c in y) (let (_,_,z) = c in z)
    (let (x,_,_) = ox in x) (let (_,y,_) = ox in y) (let (_,_,z) = ox in z)
    Poly.(c = ox);
  [%expect {| c=(196608,0,0) ox=(196608,0,0) eq=true |}]

let%expect_test "calc_gun_point with two hierarchy levels" =
  (* gun at (0x8000,0,0), start_mn=2, parent[2]=1, parent[1]=0
     anim_angles all zero (identity), offsets[2]=(0,0x4000,0), offsets[1]=(0x10000,0,0)
     identity orient, pos=(0,0,0)
     Walk: mn=2: rotate pnt by identity, add offset[2] => (0x8000,0x4000,0)
           mn=1: rotate by identity, add offset[1] => (0x18000,0x4000,0)
     Then transpose identity orient, rotate => same, add pos => (0x18000,0x4000,0) *)
  let n = 10 in
  let anim_angles = Array.init n ~f:(fun _ -> (0,0,0)) in
  let offsets = Array.init n ~f:(fun i ->
    if i = 2 then (0, 0x4000, 0)
    else if i = 1 then (0x10000, 0, 0)
    else (0, 0, 0)) in
  let parents = Array.init n ~f:(fun i ->
    if i = 2 then 1 else 0) in
  let orient = ((0x10000,0,0),(0,0x10000,0),(0,0,0x10000)) in
  let pos = (0, 0, 0) in
  let packed = pack_gun_point_args
    ~gun_point:(0x8000, 0, 0) ~start_mn:2
    ~anim_angles ~offsets ~parents ~orient ~pos in
  let c = c_calc_gun_point packed in
  let ox = Ox_physics.calc_gun_point
    ~gun_point:(0x8000, 0, 0) ~start_mn:2
    ~anim_angles ~offsets ~parents ~orient ~pos in
  printf "c=(%d,%d,%d) ox=(%d,%d,%d) eq=%b\n"
    (let (x,_,_) = c in x) (let (_,y,_) = c in y) (let (_,_,z) = c in z)
    (let (x,_,_) = ox in x) (let (_,y,_) = ox in y) (let (_,_,z) = ox in z)
    Poly.(c = ox);
  [%expect {| c=(98304,16384,0) ox=(98304,16384,0) eq=true |}]

let%expect_test "randomized calc_gun_point parity C vs Ox" =
  let state = Random.State.make [| 99999 |] in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  let n = 10 in
  let gen_fix () = Random.State.int state 0x40000 - 0x20000 in
  let gen_angle () = Random.State.int state 0x10000 in
  let gen_orient () =
    let p = gen_angle () in
    let b = gen_angle () in
    let h = gen_angle () in
    Ox_math.vm_angles_2_matrix (p, b, h)
  in
  for _ = 1 to 5000 do
    let gun_point = (gen_fix (), gen_fix (), gen_fix ()) in
    (* Random hierarchy depth 0-3 *)
    let depth = Random.State.int state 4 in
    let anim_angles = Array.init n ~f:(fun _ -> (gen_angle (), gen_angle (), gen_angle ())) in
    let offsets = Array.init n ~f:(fun _ -> (gen_fix (), gen_fix (), gen_fix ())) in
    (* Build parent chain: 1->0, 2->1, 3->2, etc. up to depth *)
    let parents = Array.init n ~f:(fun i ->
      if i > 0 && i <= depth then i - 1 else 0) in
    let start_mn = if depth = 0 then 0 else depth in
    let orient = gen_orient () in
    let pos = (gen_fix (), gen_fix (), gen_fix ()) in
    incr total;
    let packed = pack_gun_point_args
      ~gun_point ~start_mn ~anim_angles ~offsets ~parents ~orient ~pos in
    let c = c_calc_gun_point packed in
    let ox = Ox_physics.calc_gun_point
      ~gun_point ~start_mn ~anim_angles ~offsets ~parents ~orient ~pos in
    if Poly.(c <> ox) then begin
      incr mismatches;
      if Option.is_none !first_mismatch then begin
        let (cx, cy, cz) = c in
        let (oxx, oxy, oxz) = ox in
        first_mismatch := Some (sprintf
          "gun=(%d,%d,%d) start_mn=%d c=(%d,%d,%d) ox=(%d,%d,%d)"
          (let (x,_,_) = gun_point in x) (let (_,y,_) = gun_point in y) (let (_,_,z) = gun_point in z)
          start_mn cx cy cz oxx oxy oxz)
      end
    end
  done;
  printf "calc_gun_point random total=%d mismatches=%d\n" !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "calc_gun_point parity failed" ();
  [%expect {| calc_gun_point random total=5000 mismatches=0 |}]

(* --- phys_apply_force parity tests --- *)

external c_phys_apply_force
  : int -> int -> int -> int -> int -> int -> int -> int * int * int
  = "caml_c_phys_apply_force_bc" "caml_c_phys_apply_force"

let%expect_test "phys_apply_force zero force" =
  let c = c_phys_apply_force 0x10000 0 0  0 0 0  0x10000 in
  let ox = Ox_physics.phys_apply_force
    ~velocity:(0x10000, 0, 0)
    ~force_vec:(0, 0, 0)
    ~mass:0x10000 in
  printf "c=(%d,%d,%d) ox=(%d,%d,%d) eq=%b\n"
    (let (x,_,_) = c in x) (let (_,y,_) = c in y) (let (_,_,z) = c in z)
    (let (x,_,_) = ox in x) (let (_,y,_) = ox in y) (let (_,_,z) = ox in z)
    Poly.(c = ox);
  [%expect {| c=(65536,0,0) ox=(65536,0,0) eq=true |}]

let%expect_test "phys_apply_force unit force unit mass" =
  (* velocity=(0,0,0), force=(f1_0,0,0), mass=f1_0
     scale = fixdiv(f1_0, f1_0) = f1_0
     new_vel = (0,0,0) + (f1_0,0,0) * f1_0 = (f1_0,0,0) *)
  let c = c_phys_apply_force 0 0 0  0x10000 0 0  0x10000 in
  let ox = Ox_physics.phys_apply_force
    ~velocity:(0, 0, 0) ~force_vec:(0x10000, 0, 0) ~mass:0x10000 in
  printf "c=(%d,%d,%d) ox=(%d,%d,%d) eq=%b\n"
    (let (x,_,_) = c in x) (let (_,y,_) = c in y) (let (_,_,z) = c in z)
    (let (x,_,_) = ox in x) (let (_,y,_) = ox in y) (let (_,_,z) = ox in z)
    Poly.(c = ox);
  [%expect {| c=(65536,0,0) ox=(65536,0,0) eq=true |}]

let%expect_test "phys_apply_force mass zero guard" =
  (* D2: mass=0 should return velocity unchanged *)
  let c = c_phys_apply_force 100 200 300  1000 2000 3000  0 in
  let ox = Ox_physics.phys_apply_force
    ~velocity:(100, 200, 300) ~force_vec:(1000, 2000, 3000) ~mass:0 in
  printf "c=(%d,%d,%d) ox=(%d,%d,%d) eq=%b\n"
    (let (x,_,_) = c in x) (let (_,y,_) = c in y) (let (_,_,z) = c in z)
    (let (x,_,_) = ox in x) (let (_,y,_) = ox in y) (let (_,_,z) = ox in z)
    Poly.(c = ox);
  [%expect {| c=(100,200,300) ox=(100,200,300) eq=true |}]

let%expect_test "randomized phys_apply_force parity C vs Ox" =
  let state = Random.State.make [| 77777 |] in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  let gen_fix () = Random.State.int state 0x40000 - 0x20000 in
  for _ = 1 to 5000 do
    let vx = gen_fix () in
    let vy = gen_fix () in
    let vz = gen_fix () in
    let fx = gen_fix () in
    let fy = gen_fix () in
    let fz = gen_fix () in
    let mass = Random.State.int state 0x80000 + 1 in
    incr total;
    let c = c_phys_apply_force vx vy vz fx fy fz mass in
    let ox = Ox_physics.phys_apply_force
      ~velocity:(vx, vy, vz) ~force_vec:(fx, fy, fz) ~mass in
    if Poly.(c <> ox) then begin
      incr mismatches;
      if Option.is_none !first_mismatch then begin
        let (cx, cy, cz) = c in
        let (oxx, oxy, oxz) = ox in
        first_mismatch := Some (sprintf
          "v=(%d,%d,%d) f=(%d,%d,%d) mass=%d c=(%d,%d,%d) ox=(%d,%d,%d)"
          vx vy vz fx fy fz mass cx cy cz oxx oxy oxz)
      end
    end
  done;
  printf "phys_apply_force random total=%d mismatches=%d\n" !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "phys_apply_force parity failed" ();
  [%expect {| phys_apply_force random total=5000 mismatches=0 |}]

(* --- phys_apply_rot parity tests --- *)

external c_phys_apply_rot
  : int -> int -> int -> int -> int -> int -> int -> int -> int -> int -> int -> int ->
    int * int * int * int
  = "caml_c_phys_apply_rot_bc" "caml_c_phys_apply_rot"

let%expect_test "phys_apply_rot zero force" =
  (* Zero force vec → physics_turn_towards_vector returns cur_rotvel unchanged *)
  let c = c_phys_apply_rot 0 0 0  0x10000 0  0x10000 0 0  0  100 200 0 in
  let ox =
    let ((rx, ry, rz), skip_ai) = Ox_physics.phys_apply_rot
      ~force_vec:(0, 0, 0) ~mass:0x10000 ~is_robot:false
      ~fvec:(0x10000, 0, 0) ~is_morph:false ~cur_rotvel:(100, 200, 0) in
    (rx, ry, rz, if skip_ai then 1 else 0) in
  let (cx,cy,cz,cs) = c in
  let (oxx,oxy,oxz,oxs) = ox in
  printf "c=(%d,%d,%d,%d) ox=(%d,%d,%d,%d) eq=%b\n"
    cx cy cz cs oxx oxy oxz oxs Poly.(c = ox);
  [%expect {| c=(100,200,0,0) ox=(100,200,0,0) eq=true |}]

let%expect_test "phys_apply_rot robot sets skip_ai" =
  (* Large force relative to mass, is_robot=true => skip_ai=1 *)
  let c = c_phys_apply_rot 0 0x10000 0  0x10000 1  0x10000 0 0  0  0 0 0 in
  let ox =
    let ((rx, ry, rz), skip_ai) = Ox_physics.phys_apply_rot
      ~force_vec:(0, 0x10000, 0) ~mass:0x10000 ~is_robot:true
      ~fvec:(0x10000, 0, 0) ~is_morph:false ~cur_rotvel:(0, 0, 0) in
    (rx, ry, rz, if skip_ai then 1 else 0) in
  let (cx,cy,cz,cs) = c in
  let (oxx,oxy,oxz,oxs) = ox in
  printf "c=(%d,%d,%d,%d) ox=(%d,%d,%d,%d) eq=%b\n"
    cx cy cz cs oxx oxy oxz oxs Poly.(c = ox);
  printf "skip_ai c=%d ox=%d\n" cs oxs;
  [%expect {|
    c=(8192,-8192,0,1) ox=(8192,-8192,0,1) eq=true
    skip_ai c=1 ox=1
    |}]

let%expect_test "randomized phys_apply_rot parity C vs Ox" =
  let state = Random.State.make [| 88888 |] in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  let gen_fix () = Random.State.int state 0x40000 - 0x20000 in
  for _ = 1 to 5000 do
    let fx = gen_fix () in
    let fy = gen_fix () in
    let fz = gen_fix () in
    let mass = Random.State.int state 0x80000 + 1 in
    let is_robot = Random.State.int state 2 in
    (* Generate valid fvec via normalize *)
    let fvx = gen_fix () in
    let fvy = gen_fix () in
    let fvz = gen_fix () in
    let is_morph = Random.State.int state 2 in
    let crx = gen_fix () in
    let cry = gen_fix () in
    let crz = 0 in
    incr total;
    let c = c_phys_apply_rot fx fy fz mass is_robot fvx fvy fvz is_morph crx cry crz in
    let ox =
      let ((rx, ry, rz), skip_ai) = Ox_physics.phys_apply_rot
        ~force_vec:(fx, fy, fz) ~mass ~is_robot:(is_robot <> 0)
        ~fvec:(fvx, fvy, fvz) ~is_morph:(is_morph <> 0)
        ~cur_rotvel:(crx, cry, crz) in
      (rx, ry, rz, if skip_ai then 1 else 0) in
    if Poly.(c <> ox) then begin
      incr mismatches;
      if Option.is_none !first_mismatch then begin
        let (cx, cy, cz, cs) = c in
        let (oxx, oxy, oxz, oxs) = ox in
        first_mismatch := Some (sprintf
          "f=(%d,%d,%d) mass=%d robot=%d fvec=(%d,%d,%d) morph=%d rv=(%d,%d,%d) c=(%d,%d,%d,%d) ox=(%d,%d,%d,%d)"
          fx fy fz mass is_robot fvx fvy fvz is_morph crx cry crz
          cx cy cz cs oxx oxy oxz oxs)
      end
    end
  done;
  printf "phys_apply_rot random total=%d mismatches=%d\n" !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "phys_apply_rot parity failed" ();
  [%expect {| phys_apply_rot random total=5000 mismatches=0 |}]

(* ---------- ai_turn_towards_vector ---------- *)

external c_ai_turn_towards_vector
  : int -> int -> int -> int -> int -> int -> int -> int -> int -> int -> int ->
    int -> int -> int -> int -> int -> int * int * int * int * int * int * int * int * int
  = "caml_c_ai_turn_towards_vector_bc" "caml_c_ai_turn_towards_vector"

let%expect_test "ai_turn_towards_vector facing goal (no interpolation)" =
  (* When dot >= F1_0 - frame_time/2, no interpolation — just vm_vector_2_matrix *)
  let gx = 0 and gy = 0 and gz = 0x10000 in
  let fx = 0 and fy = 0 and fz = 0x10000 in  (* already facing goal *)
  let rx = 0x10000 and ry = 0 and rz = 0 in
  let rate = 0x10000 and frame_time = 0x1000 in
  let c = c_ai_turn_towards_vector gx gy gz fx fy fz rx ry rz rate frame_time 0 0 0 0 0 in
  let ox = Ox_physics.ai_turn_towards_vector
    ~goal:(gx, gy, gz) ~fvec:(fx, fy, fz) ~rvec:(rx, ry, rz)
    ~rate ~frame_time ~seismic_mag:0 ~robot_mass:0 ~rand_vec:(0, 0, 0) in
  let ((orx, ory, orz), (oux, ouy, ouz), (ofx, ofy, ofz)) = ox in
  let (crx, cry, crz, cux, cuy, cuz, cfx, cfy, cfz) = c in
  printf "c=(%d,%d,%d,%d,%d,%d,%d,%d,%d)\n" crx cry crz cux cuy cuz cfx cfy cfz;
  printf "ox=(%d,%d,%d,%d,%d,%d,%d,%d,%d)\n" orx ory orz oux ouy ouz ofx ofy ofz;
  printf "eq=%b\n" (crx=orx && cry=ory && crz=orz && cux=oux && cuy=ouy && cuz=ouz && cfx=ofx && cfy=ofy && cfz=ofz);
  [%expect {|
    c=(65536,0,0,0,65536,0,0,0,65536)
    ox=(65536,0,0,0,65536,0,0,0,65536)
    eq=true
    |}]

let%expect_test "ai_turn_towards_vector 90-degree turn" =
  (* Goal is +x, facing +z, should interpolate *)
  let gx = 0x10000 and gy = 0 and gz = 0 in
  let fx = 0 and fy = 0 and fz = 0x10000 in
  let rx = 0x10000 and ry = 0 and rz = 0 in
  let rate = 0x10000 and frame_time = 0x1000 in
  let c = c_ai_turn_towards_vector gx gy gz fx fy fz rx ry rz rate frame_time 0 0 0 0 0 in
  let ox = Ox_physics.ai_turn_towards_vector
    ~goal:(gx, gy, gz) ~fvec:(fx, fy, fz) ~rvec:(rx, ry, rz)
    ~rate ~frame_time ~seismic_mag:0 ~robot_mass:0 ~rand_vec:(0, 0, 0) in
  let ((orx, ory, orz), (oux, ouy, ouz), (ofx, ofy, ofz)) = ox in
  let (crx, cry, crz, cux, cuy, cuz, cfx, cfy, cfz) = c in
  printf "c=(%d,%d,%d,%d,%d,%d,%d,%d,%d)\n" crx cry crz cux cuy cuz cfx cfy cfz;
  printf "ox=(%d,%d,%d,%d,%d,%d,%d,%d,%d)\n" orx ory orz oux ouy ouz ofx ofy ofz;
  printf "eq=%b\n" (crx=orx && cry=ory && crz=orz && cux=oux && cuy=ouy && cuz=ouz && cfx=ofx && cfy=ofy && cfz=ofz);
  [%expect {|
    c=(65408,0,-4087,0,65536,0,4087,0,65408)
    ox=(65408,0,-4087,0,65536,0,4087,0,65408)
    eq=true
    |}]

let%expect_test "randomized ai_turn_towards_vector parity C vs Ox (D1, no seismic)" =
  let state = Random.State.make [| 99999 |] in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  let gen_fix () = Random.State.int state 0x40000 - 0x20000 in
  for _ = 1 to 5000 do
    let gx = gen_fix () in
    let gy = gen_fix () in
    let gz = gen_fix () in
    let fx = gen_fix () in
    let fy = gen_fix () in
    let fz = gen_fix () in
    let rx = gen_fix () in
    let ry = gen_fix () in
    let rz = gen_fix () in
    let rate = Random.State.int state 0x40000 + 1 in
    let frame_time = Random.State.int state 0x2000 + 1 in
    incr total;
    let c = c_ai_turn_towards_vector gx gy gz fx fy fz rx ry rz rate frame_time 0 0 0 0 0 in
    let ox =
      let ((orx, ory, orz), (oux, ouy, ouz), (ofx, ofy, ofz)) =
        Ox_physics.ai_turn_towards_vector
          ~goal:(gx, gy, gz) ~fvec:(fx, fy, fz) ~rvec:(rx, ry, rz)
          ~rate ~frame_time ~seismic_mag:0 ~robot_mass:0 ~rand_vec:(0, 0, 0) in
      (orx, ory, orz, oux, ouy, ouz, ofx, ofy, ofz) in
    if Poly.(c <> ox) then begin
      incr mismatches;
      if Option.is_none !first_mismatch then begin
        let (crx, cry, crz, cux, cuy, cuz, cfx, cfy, cfz) = c in
        let (orx, ory, orz, oux, ouy, ouz, ofx, ofy, ofz) = ox in
        first_mismatch := Some (sprintf
          "g=(%d,%d,%d) f=(%d,%d,%d) r=(%d,%d,%d) rate=%d ft=%d c=(%d,%d,%d,%d,%d,%d,%d,%d,%d) ox=(%d,%d,%d,%d,%d,%d,%d,%d,%d)"
          gx gy gz fx fy fz rx ry rz rate frame_time
          crx cry crz cux cuy cuz cfx cfy cfz
          orx ory orz oux ouy ouz ofx ofy ofz)
      end
    end
  done;
  printf "ai_turn_towards_vector random total=%d mismatches=%d\n" !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "ai_turn_towards_vector parity failed" ();
  [%expect {| ai_turn_towards_vector random total=5000 mismatches=0 |}]

let%expect_test "randomized ai_turn_towards_vector parity C vs Ox (D2, with seismic)" =
  let state = Random.State.make [| 77777 |] in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  let gen_fix () = Random.State.int state 0x40000 - 0x20000 in
  for _ = 1 to 5000 do
    let gx = gen_fix () in
    let gy = gen_fix () in
    let gz = gen_fix () in
    let fx = gen_fix () in
    let fy = gen_fix () in
    let fz = gen_fix () in
    let rx = gen_fix () in
    let ry = gen_fix () in
    let rz = gen_fix () in
    let rate = Random.State.int state 0x40000 + 1 in
    let frame_time = Random.State.int state 0x2000 + 1 in
    let seismic_mag = Random.State.int state 0x10000 in
    let robot_mass = Random.State.int state 0x80000 + 1 in
    let rvx = gen_fix () in
    let rvy = gen_fix () in
    let rvz = gen_fix () in
    incr total;
    let c = c_ai_turn_towards_vector gx gy gz fx fy fz rx ry rz rate frame_time
        seismic_mag robot_mass rvx rvy rvz in
    let ox =
      let ((orx, ory, orz), (oux, ouy, ouz), (ofx, ofy, ofz)) =
        Ox_physics.ai_turn_towards_vector
          ~goal:(gx, gy, gz) ~fvec:(fx, fy, fz) ~rvec:(rx, ry, rz)
          ~rate ~frame_time ~seismic_mag ~robot_mass ~rand_vec:(rvx, rvy, rvz) in
      (orx, ory, orz, oux, ouy, ouz, ofx, ofy, ofz) in
    if Poly.(c <> ox) then begin
      incr mismatches;
      if Option.is_none !first_mismatch then begin
        let (crx, cry, crz, cux, cuy, cuz, cfx, cfy, cfz) = c in
        let (orx, ory, orz, oux, ouy, ouz, ofx, ofy, ofz) = ox in
        first_mismatch := Some (sprintf
          "g=(%d,%d,%d) f=(%d,%d,%d) r=(%d,%d,%d) rate=%d ft=%d sm=%d rm=%d rv=(%d,%d,%d) c=(%d,%d,%d,%d,%d,%d,%d,%d,%d) ox=(%d,%d,%d,%d,%d,%d,%d,%d,%d)"
          gx gy gz fx fy fz rx ry rz rate frame_time seismic_mag robot_mass rvx rvy rvz
          crx cry crz cux cuy cuz cfx cfy cfz
          orx ory orz oux ouy ouz ofx ofy ofz)
      end
    end
  done;
  printf "ai_turn_towards_vector seismic random total=%d mismatches=%d\n" !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "ai_turn_towards_vector seismic parity failed" ();
  [%expect {| ai_turn_towards_vector seismic random total=5000 mismatches=0 |}]

(* ---------- set_thrust_from_velocity ---------- *)

external c_set_thrust_from_velocity
  : int -> int -> int -> int -> int -> int * int * int
  = "caml_c_set_thrust_from_velocity"

let%expect_test "set_thrust_from_velocity zero velocity" =
  let c = c_set_thrust_from_velocity 0x10000 0x8000 0 0 0 in
  let ox = Ox_physics.set_thrust_from_velocity
    ~mass:0x10000 ~drag:0x8000 ~velocity:(0, 0, 0) in
  printf "c=(%d,%d,%d) ox=(%d,%d,%d) eq=%b\n"
    (let (x,_,_) = c in x) (let (_,y,_) = c in y) (let (_,_,z) = c in z)
    (let (x,_,_) = ox in x) (let (_,y,_) = ox in y) (let (_,_,z) = ox in z)
    Poly.(c = ox);
  [%expect {| c=(0,0,0) ox=(0,0,0) eq=true |}]

let%expect_test "set_thrust_from_velocity unit velocity" =
  (* mass=F1_0, drag=F1_0/2: k = fixmuldiv(F1_0, F1_0/2, F1_0/2) = F1_0 *)
  let c = c_set_thrust_from_velocity 0x10000 0x8000 0x10000 0 0 in
  let ox = Ox_physics.set_thrust_from_velocity
    ~mass:0x10000 ~drag:0x8000 ~velocity:(0x10000, 0, 0) in
  printf "c=(%d,%d,%d) ox=(%d,%d,%d) eq=%b\n"
    (let (x,_,_) = c in x) (let (_,y,_) = c in y) (let (_,_,z) = c in z)
    (let (x,_,_) = ox in x) (let (_,y,_) = ox in y) (let (_,_,z) = ox in z)
    Poly.(c = ox);
  [%expect {| c=(65536,0,0) ox=(65536,0,0) eq=true |}]

let%expect_test "randomized set_thrust_from_velocity parity C vs Ox" =
  let state = Random.State.make [| 55555 |] in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  let gen_fix () = Random.State.int state 0x40000 - 0x20000 in
  for _ = 1 to 5000 do
    let mass = Random.State.int state 0x80000 + 1 in
    (* drag must be < F1_0 to avoid div-by-zero in F1_0 - drag *)
    let drag = Random.State.int state 0xFFFE + 1 in
    let vx = gen_fix () in
    let vy = gen_fix () in
    let vz = gen_fix () in
    incr total;
    let c = c_set_thrust_from_velocity mass drag vx vy vz in
    let ox = Ox_physics.set_thrust_from_velocity
      ~mass ~drag ~velocity:(vx, vy, vz) in
    if Poly.(c <> ox) then begin
      incr mismatches;
      if Option.is_none !first_mismatch then begin
        let (cx, cy, cz) = c in
        let (oxx, oxy, oxz) = ox in
        first_mismatch := Some (sprintf
          "mass=%d drag=%d v=(%d,%d,%d) c=(%d,%d,%d) ox=(%d,%d,%d)"
          mass drag vx vy vz cx cy cz oxx oxy oxz)
      end
    end
  done;
  printf "set_thrust_from_velocity random total=%d mismatches=%d\n" !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "set_thrust_from_velocity parity failed" ();
  [%expect {| set_thrust_from_velocity random total=5000 mismatches=0 |}]

(* ---------- move_towards_vector ---------- *)

external c_move_towards_vector
  : int -> int -> int -> int -> int -> int -> int -> int -> int -> int -> int ->
    int -> int -> int -> int -> int -> int * int * int
  = "caml_c_move_towards_vector_bc" "caml_c_move_towards_vector"

let%expect_test "move_towards_vector zero goal" =
  let c = c_move_towards_vector 0x10000 0 0  0 0 0  0x10000 0 0
      0x1000 0 0x20000 0 1 0 0 in
  let ox = Ox_physics.move_towards_vector
    ~velocity:(0x10000, 0, 0) ~vec_goal:(0, 0, 0) ~fvec:(0x10000, 0, 0)
    ~frame_time:0x1000 ~difficulty:0 ~max_speed:0x20000
    ~attack_type:0 ~dot_based:true ~is_thief:false ~is_kamikaze:false in
  printf "c=(%d,%d,%d) ox=(%d,%d,%d) eq=%b\n"
    (let (x,_,_) = c in x) (let (_,y,_) = c in y) (let (_,_,z) = c in z)
    (let (x,_,_) = ox in x) (let (_,y,_) = ox in y) (let (_,_,z) = ox in z)
    Poly.(c = ox);
  [%expect {| c=(65536,0,0) ox=(65536,0,0) eq=true |}]

let%expect_test "randomized move_towards_vector parity C vs Ox" =
  let state = Random.State.make [| 11111 |] in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  let gen_fix () = Random.State.int state 0x40000 - 0x20000 in
  for _ = 1 to 5000 do
    let vx = gen_fix () in
    let vy = gen_fix () in
    let vz = gen_fix () in
    let gx = gen_fix () in
    let gy = gen_fix () in
    let gz = gen_fix () in
    let fx = gen_fix () in
    let fy = gen_fix () in
    let fz = gen_fix () in
    let frame_time = Random.State.int state 0x2000 + 1 in
    let difficulty = Random.State.int state 5 in
    let max_speed = Random.State.int state 0x40000 + 1 in
    let attack_type = Random.State.int state 2 in
    let dot_based = Random.State.int state 2 in
    let is_thief = Random.State.int state 2 in
    let is_kamikaze = Random.State.int state 2 in
    incr total;
    let c = c_move_towards_vector vx vy vz gx gy gz fx fy fz
        frame_time difficulty max_speed attack_type dot_based is_thief is_kamikaze in
    let ox = Ox_physics.move_towards_vector
      ~velocity:(vx, vy, vz) ~vec_goal:(gx, gy, gz) ~fvec:(fx, fy, fz)
      ~frame_time ~difficulty ~max_speed ~attack_type
      ~dot_based:(dot_based <> 0) ~is_thief:(is_thief <> 0) ~is_kamikaze:(is_kamikaze <> 0) in
    if Poly.(c <> ox) then begin
      incr mismatches;
      if Option.is_none !first_mismatch then begin
        let (cx, cy, cz) = c in
        let (oxx, oxy, oxz) = ox in
        first_mismatch := Some (sprintf
          "v=(%d,%d,%d) g=(%d,%d,%d) f=(%d,%d,%d) ft=%d diff=%d ms=%d at=%d db=%d th=%d kam=%d c=(%d,%d,%d) ox=(%d,%d,%d)"
          vx vy vz gx gy gz fx fy fz frame_time difficulty max_speed attack_type dot_based is_thief is_kamikaze
          cx cy cz oxx oxy oxz)
      end
    end
  done;
  printf "move_towards_vector random total=%d mismatches=%d\n" !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "move_towards_vector parity failed" ();
  [%expect {| move_towards_vector random total=5000 mismatches=0 |}]

(* ---------- move_around_player ---------- *)

external c_move_around_player
  : int array -> int * int * int
  = "caml_c_move_around_player"

let%expect_test "move_around_player fast_flag=0 returns unchanged" =
  let packed = [| 100; 200; 300; 0;0;0; 0;0;0x10000; 0x1000; 0; 5; 0;
                  0;0;0; 0x20000; 0; 0 |] in
  let c = c_move_around_player packed in
  let ox = Ox_physics.move_around_player
    ~velocity:(100, 200, 300) ~vec_to_player:(0, 0, 0) ~fvec:(0, 0, 0x10000)
    ~frame_time:0x1000 ~frame_count:0 ~objnum:5 ~fast_flag:0
    ~shields:0 ~strength:0 ~field_of_view:0 ~max_speed:0x20000
    ~player_cloaked:false ~skip_objnum1:false in
  printf "c=(%d,%d,%d) ox=(%d,%d,%d) eq=%b\n"
    (let (x,_,_) = c in x) (let (_,y,_) = c in y) (let (_,_,z) = c in z)
    (let (x,_,_) = ox in x) (let (_,y,_) = ox in y) (let (_,_,z) = ox in z)
    Poly.(c = ox);
  [%expect {| c=(100,200,300) ox=(100,200,300) eq=true |}]

let%expect_test "randomized move_around_player parity C vs Ox" =
  let state = Random.State.make [| 22222 |] in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  let gen_fix () = Random.State.int state 0x40000 - 0x20000 in
  for _ = 1 to 5000 do
    let vx = gen_fix () in let vy = gen_fix () in let vz = gen_fix () in
    let px = gen_fix () in let py = gen_fix () in let pz = gen_fix () in
    let fx = gen_fix () in let fy = gen_fix () in let fz = gen_fix () in
    let frame_time = Random.State.int state 0x2000 + 1 in
    let frame_count = Random.State.int state 10000 in
    let objnum = Random.State.int state 200 in
    let fast_flag = Random.State.int state 5 - 1 in (* -1 to 3 *)
    let shields = gen_fix () in
    let strength = Random.State.int state 0x40000 + 1 in
    let field_of_view = gen_fix () in
    let max_speed = Random.State.int state 0x40000 + 1 in
    let player_cloaked = Random.State.int state 2 in
    let skip_objnum1 = Random.State.int state 2 in
    let packed = [| vx; vy; vz; px; py; pz; fx; fy; fz;
                    frame_time; frame_count; objnum; fast_flag;
                    shields; strength; field_of_view; max_speed;
                    player_cloaked; skip_objnum1 |] in
    incr total;
    let c = c_move_around_player packed in
    let ox = Ox_physics.move_around_player
      ~velocity:(vx, vy, vz) ~vec_to_player:(px, py, pz) ~fvec:(fx, fy, fz)
      ~frame_time ~frame_count ~objnum ~fast_flag
      ~shields ~strength ~field_of_view ~max_speed
      ~player_cloaked:(player_cloaked <> 0) ~skip_objnum1:(skip_objnum1 <> 0) in
    if Poly.(c <> ox) then begin
      incr mismatches;
      if Option.is_none !first_mismatch then begin
        let (cx, cy, cz) = c in
        let (oxx, oxy, oxz) = ox in
        first_mismatch := Some (sprintf
          "v=(%d,%d,%d) p=(%d,%d,%d) ff=%d fc=%d obj=%d c=(%d,%d,%d) ox=(%d,%d,%d)"
          vx vy vz px py pz fast_flag frame_count objnum cx cy cz oxx oxy oxz)
      end
    end
  done;
  printf "move_around_player random total=%d mismatches=%d\n" !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "move_around_player parity failed" ();
  [%expect {| move_around_player random total=5000 mismatches=0 |}]

(* ---------- move_away_from_player ---------- *)

external c_move_away_from_player
  : int -> int -> int -> int -> int -> int -> int -> int -> int -> int -> int -> int ->
    int -> int -> int -> int -> int -> int * int * int
  = "caml_c_move_away_from_player_bc" "caml_c_move_away_from_player"

let%expect_test "move_away_from_player no attack" =
  let c = c_move_away_from_player
      0 0 0  0x10000 0 0  0 0x10000 0  0x10000 0 0
      0x1000 0 5 0 0x20000 in
  let ox = Ox_physics.move_away_from_player
    ~velocity:(0, 0, 0) ~vec_to_player:(0x10000, 0, 0)
    ~uvec:(0, 0x10000, 0) ~rvec:(0x10000, 0, 0)
    ~frame_time:0x1000 ~frame_count:0 ~objnum:5 ~attack_type:0 ~max_speed:0x20000 in
  printf "c=(%d,%d,%d) ox=(%d,%d,%d) eq=%b\n"
    (let (x,_,_) = c in x) (let (_,y,_) = c in y) (let (_,_,z) = c in z)
    (let (x,_,_) = ox in x) (let (_,y,_) = ox in y) (let (_,_,z) = ox in z)
    Poly.(c = ox);
  [%expect {| c=(-65536,0,0) ox=(-65536,0,0) eq=true |}]

let%expect_test "randomized move_away_from_player parity C vs Ox" =
  let state = Random.State.make [| 33333 |] in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  let gen_fix () = Random.State.int state 0x40000 - 0x20000 in
  for _ = 1 to 5000 do
    let vx = gen_fix () in let vy = gen_fix () in let vz = gen_fix () in
    let px = gen_fix () in let py = gen_fix () in let pz = gen_fix () in
    let ux = gen_fix () in let uy = gen_fix () in let uz = gen_fix () in
    let rx = gen_fix () in let ry = gen_fix () in let rz = gen_fix () in
    let frame_time = Random.State.int state 0x2000 + 1 in
    let frame_count = Random.State.int state 10000 in
    let objnum = Random.State.int state 200 in
    let attack_type = Random.State.int state 2 in
    let max_speed = Random.State.int state 0x40000 + 1 in
    incr total;
    let c = c_move_away_from_player vx vy vz px py pz ux uy uz rx ry rz
        frame_time frame_count objnum attack_type max_speed in
    let ox = Ox_physics.move_away_from_player
      ~velocity:(vx, vy, vz) ~vec_to_player:(px, py, pz)
      ~uvec:(ux, uy, uz) ~rvec:(rx, ry, rz)
      ~frame_time ~frame_count ~objnum ~attack_type ~max_speed in
    if Poly.(c <> ox) then begin
      incr mismatches;
      if Option.is_none !first_mismatch then begin
        let (cx, cy, cz) = c in
        let (oxx, oxy, oxz) = ox in
        first_mismatch := Some (sprintf
          "v=(%d,%d,%d) p=(%d,%d,%d) at=%d fc=%d obj=%d c=(%d,%d,%d) ox=(%d,%d,%d)"
          vx vy vz px py pz attack_type frame_count objnum cx cy cz oxx oxy oxz)
      end
    end
  done;
  printf "move_away_from_player random total=%d mismatches=%d\n" !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "move_away_from_player parity failed" ();
  [%expect {| move_away_from_player random total=5000 mismatches=0 |}]

(* ---------- set_object_turnroll ---------- *)

external c_set_object_turnroll
  : int -> int -> int -> int
  = "caml_c_set_object_turnroll"

let%expect_test "set_object_turnroll zero rotvel" =
  let c = c_set_object_turnroll 0 0 0x1000 in
  let ox = Ox_physics.set_object_turnroll
    ~rotvel_y:0 ~turnroll:0 ~frame_time:0x1000 in
  printf "c=%d ox=%d eq=%b\n" c ox (c = ox);
  [%expect {| c=0 ox=0 eq=true |}]

let%expect_test "randomized set_object_turnroll parity C vs Ox" =
  let state = Random.State.make [| 44444 |] in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  let gen_fix () = Random.State.int state 0x40000 - 0x20000 in
  for _ = 1 to 5000 do
    let rotvel_y = gen_fix () in
    let turnroll = gen_fix () in
    let frame_time = Random.State.int state 0x2000 + 1 in
    incr total;
    let c = c_set_object_turnroll rotvel_y turnroll frame_time in
    let ox = Ox_physics.set_object_turnroll ~rotvel_y ~turnroll ~frame_time in
    if c <> ox then begin
      incr mismatches;
      if Option.is_none !first_mismatch then
        first_mismatch := Some (sprintf
          "rotvel_y=%d turnroll=%d ft=%d c=%d ox=%d"
          rotvel_y turnroll frame_time c ox)
    end
  done;
  printf "set_object_turnroll random total=%d mismatches=%d\n" !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "set_object_turnroll parity failed" ();
  [%expect {| set_object_turnroll random total=5000 mismatches=0 |}]

(* ---------- lead_player ---------- *)

external c_lead_player
  : int -> int -> int -> int -> int -> int -> int -> int -> int ->
    int -> int -> int -> int -> int -> int -> int -> int * int * int * int
  = "caml_c_lead_player_bc" "caml_c_lead_player"

let%expect_test "lead_player cloaked returns failure" =
  let c = c_lead_player
    0 0 0  0x100000 0 0  0x40000 0 0  0x10000 0 0
    1 0x80000 0 2 in
  let ox =
    match Ox_physics.lead_player
      ~fire_point:(0, 0, 0) ~believed_player_pos:(0x100000, 0, 0)
      ~player_velocity:(0x40000, 0, 0) ~fvec:(0x10000, 0, 0)
      ~player_cloaked:true ~max_weapon_speed:0x80000
      ~is_matter:false ~difficulty_level:2
    with None -> (0, 0, 0, 0) | Some (x, y, z) -> (1, x, y, z)
  in
  printf "c=(%d,%d,%d,%d) ox=(%d,%d,%d,%d) eq=%b\n"
    (let (a,_,_,_) = c in a) (let (_,b,_,_) = c in b)
    (let (_,_,c_,_) = c in c_) (let (_,_,_,d) = c in d)
    (let (a,_,_,_) = ox in a) (let (_,b,_,_) = ox in b)
    (let (_,_,c_,_) = ox in c_) (let (_,_,_,d) = ox in d)
    Poly.(c = ox);
  [%expect {| c=(0,0,0,0) ox=(0,0,0,0) eq=true |}]

let%expect_test "randomized lead_player parity C vs Ox" =
  let state = Random.State.make [| 55555 |] in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  let gen_fix () = Random.State.int state 0x400000 - 0x200000 in
  let gen_vel () = Random.State.int state 0x100000 - 0x80000 in
  for _ = 1 to 5000 do
    let fpx = gen_fix () in let fpy = gen_fix () in let fpz = gen_fix () in
    let bpx = fpx + gen_fix () in let bpy = fpy + gen_fix () in let bpz = fpz + gen_fix () in
    let pvx = gen_vel () in let pvy = gen_vel () in let pvz = gen_vel () in
    let fvx = gen_fix () in let fvy = gen_fix () in let fvz = gen_fix () in
    let player_cloaked = if Random.State.int state 10 = 0 then 1 else 0 in
    let max_weapon_speed = Random.State.int state 0x200000 + 0x10000 in
    let is_matter = if Random.State.int state 4 = 0 then 1 else 0 in
    let difficulty_level = Random.State.int state 5 in
    incr total;
    let c = c_lead_player fpx fpy fpz bpx bpy bpz pvx pvy pvz
        fvx fvy fvz player_cloaked max_weapon_speed is_matter difficulty_level in
    let ox =
      match Ox_physics.lead_player
        ~fire_point:(fpx, fpy, fpz) ~believed_player_pos:(bpx, bpy, bpz)
        ~player_velocity:(pvx, pvy, pvz) ~fvec:(fvx, fvy, fvz)
        ~player_cloaked:(player_cloaked <> 0) ~max_weapon_speed
        ~is_matter:(is_matter <> 0) ~difficulty_level
      with None -> (0, 0, 0, 0) | Some (x, y, z) -> (1, x, y, z)
    in
    if Poly.(c <> ox) then begin
      incr mismatches;
      if Option.is_none !first_mismatch then begin
        let (cs, cfx, cfy, cfz) = c in
        let (os, ofx, ofy, ofz) = ox in
        first_mismatch := Some (sprintf
          "fp=(%d,%d,%d) bp=(%d,%d,%d) pv=(%d,%d,%d) cloak=%d ws=%d mat=%d diff=%d c=(%d,%d,%d,%d) ox=(%d,%d,%d,%d)"
          fpx fpy fpz bpx bpy bpz pvx pvy pvz player_cloaked max_weapon_speed is_matter difficulty_level
          cs cfx cfy cfz os ofx ofy ofz)
      end
    end
  done;
  printf "lead_player random total=%d mismatches=%d\n" !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "lead_player parity failed" ();
  [%expect {| lead_player random total=5000 mismatches=0 |}]
