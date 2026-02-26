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
