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
