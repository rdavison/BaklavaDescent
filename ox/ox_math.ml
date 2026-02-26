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
