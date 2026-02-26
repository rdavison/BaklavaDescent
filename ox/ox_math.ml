(* Shared pure math implementations used by both runtime bridge and tests. *)
let fracbits = 16

let i2f i = Int.shift_left i fracbits
let f2i f = Int.shift_right f fracbits

(* C returns fix as int32_t, so we emulate int64 -> int32 cast semantics. *)
let wrap_i64_to_fix x =
  let mask32 = Int64.of_string "0xFFFFFFFF" in
  let max_i32 = Int64.of_string "0x7FFFFFFF" in
  let two32 = Int64.of_string "0x100000000" in
  let low32 = Int64.bit_and x mask32 in
  let signed = if Int64.( > ) low32 max_i32 then Int64.( - ) low32 two32 else low32 in
  Int64.to_int_exn signed

let fixmul a b =
  Int64.(wrap_i64_to_fix (shift_right (of_int a * of_int b) fracbits))

let fixdiv a b =
  if b = 0 then 1
  else Int64.(wrap_i64_to_fix (shift_left (of_int a) fracbits / of_int b))

let fixmuldiv a b c =
  if c = 0 then 1
  else Int64.(wrap_i64_to_fix ((of_int a * of_int b) / of_int c))

let long_sqrt a =
  if a <= 0
  then 0
  else
    let module I64 = Stdlib.Int64 in
    let n = I64.of_int a in
    let rec floor_loop lo hi best =
      if lo > hi
      then best
      else
        let mid = (lo + hi) / 2 in
        let mid64 = I64.of_int mid in
        let sq = I64.mul mid64 mid64 in
        if I64.compare sq n <= 0
        then floor_loop (mid + 1) hi mid
        else floor_loop lo (mid - 1) best
    in
    let floor = floor_loop 0 46341 0 in
    let floor64 = I64.of_int floor in
    if I64.equal (I64.mul floor64 floor64) n then floor else floor + 1

let fix_sqrt a = Int.shift_left (long_sqrt a) 8

let wrap_add_i32 a b = Int64.(wrap_i64_to_fix (of_int a + of_int b))

let vm_vec_scale_add2 (dx, dy, dz) (sx, sy, sz) k =
  ( wrap_add_i32 dx (fixmul sx k)
  , wrap_add_i32 dy (fixmul sy k)
  , wrap_add_i32 dz (fixmul sz k) )

let vm_vec_scale_add (ax, ay, az) (bx, by, bz) k =
  ( wrap_add_i32 ax (fixmul bx k)
  , wrap_add_i32 ay (fixmul by k)
  , wrap_add_i32 az (fixmul bz k) )

let vm_vec_scale2 (dx, dy, dz) n d =
  if d = 0 then dx, dy, dz else fixmuldiv dx n d, fixmuldiv dy n d, fixmuldiv dz n d

let vm_vec_add (ax, ay, az) (bx, by, bz) =
  wrap_add_i32 ax bx, wrap_add_i32 ay by, wrap_add_i32 az bz

let vm_vec_sub (ax, ay, az) (bx, by, bz) =
  wrap_add_i32 ax (-bx), wrap_add_i32 ay (-by), wrap_add_i32 az (-bz)

let vm_vec_add2 (dx, dy, dz) (sx, sy, sz) =
  wrap_add_i32 dx sx, wrap_add_i32 dy sy, wrap_add_i32 dz sz

let vm_vec_sub2 (dx, dy, dz) (sx, sy, sz) =
  wrap_add_i32 dx (-sx), wrap_add_i32 dy (-sy), wrap_add_i32 dz (-sz)

let vm_vec_avg (ax, ay, az) (bx, by, bz) =
  (wrap_add_i32 ax bx) / 2, (wrap_add_i32 ay by) / 2, (wrap_add_i32 az bz) / 2

let vm_vec_avg4 (a1, a2, a3) (b1, b2, b3) (c1, c2, c3) (d1, d2, d3) =
  let x = wrap_add_i32 (wrap_add_i32 (wrap_add_i32 a1 b1) c1) d1 in
  let y = wrap_add_i32 (wrap_add_i32 (wrap_add_i32 a2 b2) c2) d2 in
  let z = wrap_add_i32 (wrap_add_i32 (wrap_add_i32 a3 b3) c3) d3 in
  x / 4, y / 4, z / 4

let vm_vec_copy_scale (sx, sy, sz) k =
  fixmul sx k, fixmul sy k, fixmul sz k

let vm_vec_scale (dx, dy, dz) k =
  fixmul dx k, fixmul dy k, fixmul dz k

let quad_sqrt q =
  let module I64 = Stdlib.Int64 in
  if I64.compare q I64.zero <= 0
  then 0L
  else
    let rec floor_loop lo hi best =
      if I64.compare lo hi > 0
      then best
      else
        let mid = I64.add lo (I64.div (I64.sub hi lo) 2L) in
        let sq = I64.mul mid mid in
        if I64.compare sq q <= 0
        then floor_loop (I64.add mid 1L) hi mid
        else floor_loop lo (I64.sub mid 1L) best
    in
    let floor = floor_loop 0L 3037000500L 0L in
    if I64.equal (I64.mul floor floor) q then floor else I64.add floor 1L

let vm_vec_mag (x, y, z) =
  let module I64 = Stdlib.Int64 in
  let q =
    I64.add
      (I64.add (I64.mul (I64.of_int x) (I64.of_int x)) (I64.mul (I64.of_int y) (I64.of_int y)))
      (I64.mul (I64.of_int z) (I64.of_int z))
  in
  wrap_i64_to_fix (quad_sqrt q)

let vm_vec_dist (x0, y0, z0) (x1, y1, z1) = vm_vec_mag (vm_vec_sub (x0, y0, z0) (x1, y1, z1))

let abs_fix v = wrap_i64_to_fix (Int64.of_int (Int.abs v))

let vm_vec_mag_quick (x, y, z) =
  let a = ref (abs_fix x) in
  let b = ref (abs_fix y) in
  let c = ref (abs_fix z) in
  if !a < !b
  then (
    let t = !a in
    a := !b;
    b := t);
  if !b < !c
  then (
    let t = !b in
    b := !c;
    c := t;
    if !a < !b
    then (
      let t2 = !a in
      a := !b;
      b := t2));
  let bc = wrap_add_i32 (!b asr 2) (!c asr 3) in
  wrap_add_i32 !a (wrap_add_i32 bc (bc asr 1))

let vm_vec_dist_quick (x0, y0, z0) (x1, y1, z1) =
  vm_vec_mag_quick (vm_vec_sub (x0, y0, z0) (x1, y1, z1))

let fixquadadjust q =
  let v = wrap_i64_to_fix (Int64.shift_right q 16) in
  let signb = Int64.( < ) (Int64.shift_right q 48) 0L in
  let signv = v < 0 in
  if Bool.( <> ) signb signv then if signb then -0x7FFF_FFFF else 0x7FFF_FFFF else v

let vm_vec_dotprod (x0, y0, z0) (x1, y1, z1) =
  let q =
    Int64.(
      (of_int x0 * of_int x1)
      + (of_int y0 * of_int y1)
      + (of_int z0 * of_int z1))
  in
  fixquadadjust q

let vm_vec_dot3 x y z (vx, vy, vz) = vm_vec_dotprod (x, y, z) (vx, vy, vz)

let neg_i32 v = wrap_i64_to_fix (Int64.neg (Int64.of_int v))

let vm_vec_crossprod (x0, y0, z0) (x1, y1, z1) =
  let qx = Int64.(of_int y0 * of_int z1 + (of_int (neg_i32 z0) * of_int y1)) in
  let qy = Int64.(of_int z0 * of_int x1 + (of_int (neg_i32 x0) * of_int z1)) in
  let qz = Int64.(of_int x0 * of_int y1 + (of_int (neg_i32 y0) * of_int x1)) in
  fixquadadjust qx, fixquadadjust qy, fixquadadjust qz

let vm_vec_copy_normalize_quick (sx, sy, sz) =
  let m = vm_vec_mag_quick (sx, sy, sz) in
  if m > 0 then m, (fixdiv sx m, fixdiv sy m, fixdiv sz m) else m, (sx, sy, sz)

let vm_vec_normalize_quick v = vm_vec_copy_normalize_quick v

let vm_vec_normalized_dir_quick v_end v_start =
  vm_vec_normalize_quick (vm_vec_sub v_end v_start)

let vm_vec_make x y z = x, y, z

let wrap_i64_to_fixang x =
  let mask16 = Int64.of_string "0xFFFF" in
  let max_i16 = Int64.of_string "0x7FFF" in
  let two16 = Int64.of_string "0x10000" in
  let low16 = Int64.bit_and x mask16 in
  let signed = if Int64.( > ) low16 max_i16 then Int64.( - ) low16 two16 else low16 in
  Int64.to_int_exn signed

let vm_angvec_make p b h =
  wrap_i64_to_fixang (Int64.of_int p), wrap_i64_to_fixang (Int64.of_int b), wrap_i64_to_fixang (Int64.of_int h)

let vm_dist_to_plane checkp norm planep = vm_vec_dotprod (vm_vec_sub checkp planep) norm

let bitand_i32 a b = wrap_i64_to_fix Int64.(bit_and (of_int a) (of_int b))
let bitor_i32 a b = wrap_i64_to_fix Int64.(bit_or (of_int a) (of_int b))
let shl_i32 a n = wrap_i64_to_fix Int64.(shift_left (of_int a) n)
let asr_i32 a n = wrap_i64_to_fix Int64.(shift_right (of_int a) n)
let abs_i32_c a = wrap_i64_to_fix (Int64.of_int (Int.abs a))

let check_vec (x, y, z) =
  let x = ref x in
  let y = ref y in
  let z = ref z in
  let check = ref (bitor_i32 (bitor_i32 (abs_i32_c !x) (abs_i32_c !y)) (abs_i32_c !z)) in
  let cnt = ref 0 in
  if !check <> 0
  then if bitand_i32 !check 0xFFFC0000 <> 0
  then (
    while bitand_i32 !check 0xFFF00000 <> 0 do
      cnt := !cnt + 4;
      check := asr_i32 !check 4
    done;
    while bitand_i32 !check 0xFFFC0000 <> 0 do
      cnt := !cnt + 2;
      check := asr_i32 !check 2
    done;
    x := asr_i32 !x !cnt;
    y := asr_i32 !y !cnt;
    z := asr_i32 !z !cnt)
  else if bitand_i32 !check 0xFFFF8000 = 0
  then (
    while bitand_i32 !check 0xFFFFF000 = 0 do
      cnt := !cnt + 4;
      check := shl_i32 !check 4
    done;
    while bitand_i32 !check 0xFFFF8000 = 0 do
      cnt := !cnt + 2;
      check := shl_i32 !check 2
    done;
    x := asr_i32 !x !cnt;
    y := asr_i32 !y !cnt;
    z := asr_i32 !z !cnt);
  !x, !y, !z

let vm_vec_perp p0 p1 p2 =
  let t0 = check_vec (vm_vec_sub p1 p0) in
  let t1 = check_vec (vm_vec_sub p2 p1) in
  vm_vec_crossprod t0 t1

let vm_vec_rotate src (rvec, uvec, fvec) =
  vm_vec_dotprod src rvec, vm_vec_dotprod src uvec, vm_vec_dotprod src fvec

let vm_transpose_matrix ((r1, r2, r3), (u1, u2, u3), (f1, f2, f3)) =
  (r1, u1, f1), (r2, u2, f2), (r3, u3, f3)

let vm_copy_transpose_matrix src = vm_transpose_matrix src

let vm_matrix_x_matrix
    ((r0x, r0y, r0z), (u0x, u0y, u0z), (f0x, f0y, f0z))
    (r1, u1, f1)
  =
  ( (vm_vec_dot3 r0x u0x f0x r1, vm_vec_dot3 r0y u0y f0y r1, vm_vec_dot3 r0z u0z f0z r1)
  , (vm_vec_dot3 r0x u0x f0x u1, vm_vec_dot3 r0y u0y f0y u1, vm_vec_dot3 r0z u0z f0z u1)
  , (vm_vec_dot3 r0x u0x f0x f1, vm_vec_dot3 r0y u0y f0y f1, vm_vec_dot3 r0z u0z f0z f1) )
