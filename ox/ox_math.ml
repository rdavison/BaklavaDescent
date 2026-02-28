(* Shared pure math implementations used by both runtime bridge and tests. *)
let fracbits = 16
let i2f ~a = Int.shift_left a fracbits
let f2i ~a = Int.shift_right a fracbits

(* C returns fix as int32_t, so we emulate int64 -> int32 cast semantics. *)
let wrap_i64_to_fix x =
  let mask32 = Int64.of_string "0xFFFFFFFF" in
  let max_i32 = Int64.of_string "0x7FFFFFFF" in
  let two32 = Int64.of_string "0x100000000" in
  let low32 = Int64.bit_and x mask32 in
  let signed = if Int64.( > ) low32 max_i32 then Int64.( - ) low32 two32 else low32 in
  Int64.to_int_exn signed
;;

let wrap_i32_to_fixang x =
  let low16 = Int.bit_and x 0xFFFF in
  if low16 > 0x7FFF then low16 - 0x10000 else low16
;;

let abs_fix v = wrap_i64_to_fix (Int64.of_int (Int.abs v))
let fixmul ~a ~b = Int64.(wrap_i64_to_fix (shift_right (of_int a * of_int b) fracbits))

let fixdiv ~a ~b =
  if b = 0 then 1 else Int64.(wrap_i64_to_fix (shift_left (of_int a) fracbits / of_int b))
;;

let fixmuldiv ~a ~b ~c =
  if c = 0 then 1 else Int64.(wrap_i64_to_fix (of_int a * of_int b / of_int c))
;;

let long_sqrt a =
  if a <= 0
  then 0
  else
    let module I64 = Stdlib.Int64 in
    let n = I64.of_int a in
    let rec floor_loop lo hi best =
      if lo > hi
      then best
      else (
        let mid = (lo + hi) / 2 in
        let mid64 = I64.of_int mid in
        let sq = I64.mul mid64 mid64 in
        if I64.compare sq n <= 0
        then floor_loop (mid + 1) hi mid
        else floor_loop lo (mid - 1) best)
    in
    let floor = floor_loop 0 46341 0 in
    let floor64 = I64.of_int floor in
    if I64.equal (I64.mul floor64 floor64) n then floor else floor + 1
;;

let quad_sqrt q =
  let module I64 = Stdlib.Int64 in
  if I64.compare q I64.zero <= 0
  then 0L
  else (
    let rec floor_loop lo hi best =
      if I64.compare lo hi > 0
      then best
      else (
        let mid = I64.add lo (I64.div (I64.sub hi lo) 2L) in
        let le_q = I64.compare mid I64.(div q mid) <= 0 in
        if le_q
        then floor_loop (I64.add mid 1L) hi mid
        else floor_loop lo (I64.sub mid 1L) best)
    in
    let floor = floor_loop 1L 3037000500L 0L in
    if I64.equal (I64.mul floor floor) q then floor else I64.add floor 1L)
;;

let fix_sqrt ~a = Int.shift_left (long_sqrt a) 8

(* fix_sincos uses 256-entry quarter-wave indexing plus interpolation.
   We compute the canonical table entries on demand from the same sample points
   used by the original C table (round(sin(i*pi/128) * 16384)). *)
let sincos_lut =
  Array.init 321 ~f:(fun i ->
    Int.of_float
      (Float.round (Float.sin (Float.of_int i *. Float.pi /. 128.0) *. 16384.0)))
;;

let acos_lut =
  Array.init 257 ~f:(fun i ->
    Int.of_float
      (Float.round (Float.acos (Float.of_int i /. 256.0) *. 32768.0 /. Float.pi)))
;;

let asin_lut =
  Array.init 257 ~f:(fun i ->
    Int.of_float
      (Float.round (Float.asin (Float.of_int i /. 256.0) *. 32768.0 /. Float.pi)))
;;

let isqrt_guess_lut_entry i =
  if i = 0
  then Int32.to_int_exn Int32.min_value
  else Int.of_float (16777216.0 /. Float.sqrt (Float.of_int i))
;;

let fix_sincos ~a =
  let i = Int.bit_and (Int.shift_right a 8) 0xFF in
  let f = Int.bit_and a 0xFF in
  let ss = sincos_lut.(i) in
  let sinv = Int.shift_left (ss + Int.shift_right ((sincos_lut.(i + 1) - ss) * f) 8) 2 in
  let cc = sincos_lut.(i + 64) in
  let cosv = Int.shift_left (cc + Int.shift_right ((sincos_lut.(i + 65) - cc) * f) 8) 2 in
  sinv, cosv
;;

let fix_fastsincos ~a =
  let i = Int.bit_and (Int.shift_right a 8) 0xFF in
  Int.shift_left sincos_lut.(i) 2, Int.shift_left sincos_lut.(i + 64) 2
;;

let fix_acos ~a =
  let vv = abs_fix a in
  if vv >= 0x10000
  then 0
  else (
    let i = Int.bit_and (Int.shift_right vv 8) 0xFF in
    let f = Int.bit_and vv 0xFF in
    let aa = acos_lut.(i) in
    let aa = aa + Int.shift_right ((acos_lut.(i + 1) - aa) * f) 8 in
    let aa = if a < 0 then 0x8000 - aa else aa in
    wrap_i32_to_fixang aa)
;;

let fix_asin ~a =
  let vv = abs_fix a in
  if vv >= 0x10000
  then 0x4000
  else (
    let i = Int.bit_and (Int.shift_right vv 8) 0xFF in
    let f = Int.bit_and vv 0xFF in
    let aa = asin_lut.(i) in
    let aa = aa + Int.shift_right ((asin_lut.(i + 1) - aa) * f) 8 in
    let aa = if a < 0 then -aa else aa in
    wrap_i32_to_fixang aa)
;;

let fix_atan2 ~cos ~sin =
  let q = Int64.((of_int sin * of_int sin) + (of_int cos * of_int cos)) in
  let m = wrap_i64_to_fix (quad_sqrt q) in
  let abs_no_wrap v = Int64.abs (Int64.of_int v) in
  if m = 0
  then 0
  else if Int64.compare (abs_no_wrap sin) (abs_no_wrap cos) < 0
  then (
    let t = fix_asin ~a:(fixdiv ~a:sin ~b:m) in
    let t = if cos < 0 then 0x8000 - t else t in
    wrap_i32_to_fixang t)
  else (
    let t = fix_acos ~a:(fixdiv ~a:cos ~b:m) in
    let t = if sin < 0 then -t else t in
    wrap_i32_to_fixang t)
;;

let fix_isqrt ~a =
  let table_size = 1024 in
  if a <= 0
  then 0
  else (
    let rec shrink b cnt =
      if b >= table_size then shrink (Int.shift_right b 1) (cnt + 1) else b, cnt
    in
    let b, cnt = shrink a 0 in
    let r0 = Int.shift_right (isqrt_guess_lut_entry b) ((cnt + 1) / 2) in
    let rec iter i r =
      if i >= 3
      then r
      else (
        let old_r = r in
        let rr = fixmul ~a:r ~b:r in
        let term = Int64.(wrap_i64_to_fix (of_int 196608 - of_int (fixmul ~a:rr ~b:a))) in
        let r = fixmul ~a:term ~b:r / 2 in
        if old_r >= r
        then Int64.(wrap_i64_to_fix (of_int r + of_int old_r)) / 2
        else iter (i + 1) r)
    in
    iter 0 r0)
;;

let wrap_add_i32 a b = Int64.(wrap_i64_to_fix (of_int a + of_int b))

let vm_vec_scale_add2 ~dest:(dx, dy, dz) ~src:(sx, sy, sz) ~k =
  ( wrap_add_i32 dx (fixmul ~a:sx ~b:k)
  , wrap_add_i32 dy (fixmul ~a:sy ~b:k)
  , wrap_add_i32 dz (fixmul ~a:sz ~b:k) )
;;

let vm_vec_scale_add ~a:(ax, ay, az) ~b:(bx, by, bz) ~k =
  ( wrap_add_i32 ax (fixmul ~a:bx ~b:k)
  , wrap_add_i32 ay (fixmul ~a:by ~b:k)
  , wrap_add_i32 az (fixmul ~a:bz ~b:k) )
;;

let vm_vec_scale2 ~v:(dx, dy, dz) ~n ~d =
  if d = 0
  then dx, dy, dz
  else fixmuldiv ~a:dx ~b:n ~c:d, fixmuldiv ~a:dy ~b:n ~c:d, fixmuldiv ~a:dz ~b:n ~c:d
;;

let vm_vec_add ~a:(ax, ay, az) ~b:(bx, by, bz) =
  wrap_add_i32 ax bx, wrap_add_i32 ay by, wrap_add_i32 az bz
;;

let vm_vec_sub ~a:(ax, ay, az) ~b:(bx, by, bz) =
  wrap_add_i32 ax (-bx), wrap_add_i32 ay (-by), wrap_add_i32 az (-bz)
;;

let vm_vec_add2 ~a:(dx, dy, dz) ~b:(sx, sy, sz) =
  wrap_add_i32 dx sx, wrap_add_i32 dy sy, wrap_add_i32 dz sz
;;

let vm_vec_sub2 ~a:(dx, dy, dz) ~b:(sx, sy, sz) =
  wrap_add_i32 dx (-sx), wrap_add_i32 dy (-sy), wrap_add_i32 dz (-sz)
;;

let vm_vec_avg ~a:(ax, ay, az) ~b:(bx, by, bz) =
  wrap_add_i32 ax bx / 2, wrap_add_i32 ay by / 2, wrap_add_i32 az bz / 2
;;

let vm_vec_avg4 ~a:(a1, a2, a3) ~b:(b1, b2, b3) ~c:(c1, c2, c3) ~d:(d1, d2, d3) =
  let x = wrap_add_i32 (wrap_add_i32 (wrap_add_i32 a1 b1) c1) d1 in
  let y = wrap_add_i32 (wrap_add_i32 (wrap_add_i32 a2 b2) c2) d2 in
  let z = wrap_add_i32 (wrap_add_i32 (wrap_add_i32 a3 b3) c3) d3 in
  x / 4, y / 4, z / 4
;;

let vm_vec_copy_scale ~v:(sx, sy, sz) ~k =
  fixmul ~a:sx ~b:k, fixmul ~a:sy ~b:k, fixmul ~a:sz ~b:k
;;

let vm_vec_scale ~v:(dx, dy, dz) ~k =
  fixmul ~a:dx ~b:k, fixmul ~a:dy ~b:k, fixmul ~a:dz ~b:k
;;

let vm_vec_mag ~v:(x, y, z) =
  let module I64 = Stdlib.Int64 in
  let q =
    I64.add
      (I64.add
         (I64.mul (I64.of_int x) (I64.of_int x))
         (I64.mul (I64.of_int y) (I64.of_int y)))
      (I64.mul (I64.of_int z) (I64.of_int z))
  in
  wrap_i64_to_fix (quad_sqrt q)
;;

let vm_vec_dist ~a ~b = vm_vec_mag ~v:(vm_vec_sub ~a ~b)

let vm_vec_mag_quick ~v:(x, y, z) =
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
;;

let vm_vec_dist_quick ~a ~b = vm_vec_mag_quick ~v:(vm_vec_sub ~a ~b)

let fixquadadjust q =
  let v = wrap_i64_to_fix (Int64.shift_right q 16) in
  let signb = Int64.( < ) (Int64.shift_right q 48) 0L in
  let signv = v < 0 in
  if Bool.( <> ) signb signv then if signb then -0x7FFF_FFFF else 0x7FFF_FFFF else v
;;

let u32_mask = Int64.of_string "0xFFFFFFFF"
let u32_bits x = Int64.bit_and (Int64.of_int x) u32_mask
let i32_from_u32 x = wrap_i64_to_fix (Int64.bit_and x u32_mask)
let fixmulaccum q a b = Int64.(q + (of_int a * of_int b))

let fixdivquadlong n d =
  let den = u32_bits d in
  if Int64.equal den 0L then 1 else wrap_i64_to_fix Int64.(n / den)
;;

let fixquadnegate low high =
  let low_u = u32_bits low in
  let new_low_u = Int64.bit_and Int64.(neg low_u) u32_mask in
  let borrow = if Int64.equal new_low_u 0L then 0 else 1 in
  let new_high = wrap_i64_to_fix Int64.(neg (of_int high) - of_int borrow) in
  i32_from_u32 new_low_u, new_high
;;

let ufixdivquadlong nl nh d =
  let den = u32_bits d in
  if Int64.equal den 0L
  then 0
  else (
    let num = Int64.bit_or (Int64.shift_left (u32_bits nh) 32) (u32_bits nl) in
    i32_from_u32 (Stdlib.Int64.unsigned_div num den))
;;

let vm_vec_dotprod ~a:(x0, y0, z0) ~b:(x1, y1, z1) =
  let q =
    Int64.((of_int x0 * of_int x1) + (of_int y0 * of_int y1) + (of_int z0 * of_int z1))
  in
  fixquadadjust q
;;

let vm_vec_dot3 ~x ~y ~z ~v:(vx, vy, vz) = vm_vec_dotprod ~a:(x, y, z) ~b:(vx, vy, vz)
let neg_i32 v = wrap_i64_to_fix (Int64.neg (Int64.of_int v))

let vm_vec_crossprod ~a:(x0, y0, z0) ~b:(x1, y1, z1) =
  let qx = Int64.((of_int y0 * of_int z1) + (of_int (neg_i32 z0) * of_int y1)) in
  let qy = Int64.((of_int z0 * of_int x1) + (of_int (neg_i32 x0) * of_int z1)) in
  let qz = Int64.((of_int x0 * of_int y1) + (of_int (neg_i32 y0) * of_int x1)) in
  fixquadadjust qx, fixquadadjust qy, fixquadadjust qz
;;

let vm_vec_copy_normalize ~v:(sx, sy, sz) =
  let m = vm_vec_mag ~v:(sx, sy, sz) in
  if m > 0
  then m, (fixdiv ~a:sx ~b:m, fixdiv ~a:sy ~b:m, fixdiv ~a:sz ~b:m)
  else m, (sx, sy, sz)
;;

let vm_vec_normalize ~v = vm_vec_copy_normalize ~v

let vm_vec_normalized_dir ~v_end ~v_start =
  vm_vec_normalize ~v:(vm_vec_sub ~a:v_end ~b:v_start)
;;

let vm_vec_copy_normalize_quick ~v:(sx, sy, sz) =
  let m = vm_vec_mag_quick ~v:(sx, sy, sz) in
  if m > 0
  then m, (fixdiv ~a:sx ~b:m, fixdiv ~a:sy ~b:m, fixdiv ~a:sz ~b:m)
  else m, (sx, sy, sz)
;;

let vm_vec_normalize_quick ~v = vm_vec_copy_normalize_quick ~v

let vm_vec_normalized_dir_quick ~v_end ~v_start =
  vm_vec_normalize_quick ~v:(vm_vec_sub ~a:v_end ~b:v_start)
;;

let vm_vec_make ~x ~y ~z = x, y, z

let wrap_i64_to_fixang x =
  let mask16 = Int64.of_string "0xFFFF" in
  let max_i16 = Int64.of_string "0x7FFF" in
  let two16 = Int64.of_string "0x10000" in
  let low16 = Int64.bit_and x mask16 in
  let signed = if Int64.( > ) low16 max_i16 then Int64.( - ) low16 two16 else low16 in
  Int64.to_int_exn signed
;;

let vm_angvec_make ~p ~b ~h =
  ( wrap_i64_to_fixang (Int64.of_int p)
  , wrap_i64_to_fixang (Int64.of_int b)
  , wrap_i64_to_fixang (Int64.of_int h) )
;;

let vm_dist_to_plane ~checkp ~norm ~planep =
  vm_vec_dotprod ~a:(vm_vec_sub ~a:checkp ~b:planep) ~b:norm
;;

let bitand_i32 a b = wrap_i64_to_fix Int64.(bit_and (of_int a) (of_int b))
let bitor_i32 a b = wrap_i64_to_fix Int64.(bit_or (of_int a) (of_int b))
let shl_i32 a n = wrap_i64_to_fix Int64.(shift_left (of_int a) n)
let asr_i32 a n = wrap_i64_to_fix Int64.(shift_right (of_int a) n)
let abs_i32_c a = wrap_i64_to_fix (Int64.of_int (Int.abs a))

let check_vec ~v:(x, y, z) =
  let x = ref x in
  let y = ref y in
  let z = ref z in
  let check = ref (bitor_i32 (bitor_i32 (abs_i32_c !x) (abs_i32_c !y)) (abs_i32_c !z)) in
  let cnt = ref 0 in
  if !check <> 0
  then
    if bitand_i32 !check 0xFFFC0000 <> 0
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
;;

let vm_vec_perp ~p0 ~p1 ~p2 =
  let t0 = check_vec ~v:(vm_vec_sub ~a:p1 ~b:p0) in
  let t1 = check_vec ~v:(vm_vec_sub ~a:p2 ~b:p1) in
  vm_vec_crossprod ~a:t0 ~b:t1
;;

let vm_vec_normal ~p0 ~p1 ~p2 =
  let _, n = vm_vec_normalize ~v:(vm_vec_perp ~p0 ~p1 ~p2) in
  n
;;

let sincos_2_matrix ~sinp ~cosp ~sinb ~cosb ~sinh ~cosh =
  let sbsh = fixmul ~a:sinb ~b:sinh in
  let cbch = fixmul ~a:cosb ~b:cosh in
  let cbsh = fixmul ~a:cosb ~b:sinh in
  let sbch = fixmul ~a:sinb ~b:cosh in
  let rvec_x = wrap_add_i32 cbch (fixmul ~a:sinp ~b:sbsh) in
  let uvec_z = wrap_add_i32 sbsh (fixmul ~a:sinp ~b:cbch) in
  let uvec_x = wrap_add_i32 (fixmul ~a:sinp ~b:cbsh) (-sbch) in
  let rvec_z = wrap_add_i32 (fixmul ~a:sinp ~b:sbch) (-cbsh) in
  let fvec_x = fixmul ~a:sinh ~b:cosp in
  let rvec_y = fixmul ~a:sinb ~b:cosp in
  let uvec_y = fixmul ~a:cosb ~b:cosp in
  let fvec_z = fixmul ~a:cosh ~b:cosp in
  let fvec_y = neg_i32 sinp in
  (rvec_x, rvec_y, rvec_z), (uvec_x, uvec_y, uvec_z), (fvec_x, fvec_y, fvec_z)
;;

let vm_angles_2_matrix ~v:(p, b, h) =
  let p, b, h = vm_angvec_make ~p ~b ~h in
  let sinp, cosp = fix_sincos ~a:p in
  let sinb, cosb = fix_sincos ~a:b in
  let sinh, cosh = fix_sincos ~a:h in
  sincos_2_matrix ~sinp ~cosp ~sinb ~cosb ~sinh ~cosh
;;

let vm_vec_ang_2_matrix ~v:(vx, vy, vz) ~a =
  let a = wrap_i64_to_fixang (Int64.of_int a) in
  let sinb, cosb = fix_sincos ~a in
  let sinp = neg_i32 vy in
  let cosp = fix_sqrt ~a:(wrap_add_i32 0x10000 (neg_i32 (fixmul ~a:sinp ~b:sinp))) in
  let sinh = fixdiv ~a:vx ~b:cosp in
  let cosh = fixdiv ~a:vz ~b:cosp in
  sincos_2_matrix ~sinp ~cosp ~sinb ~cosb ~sinh ~cosh
;;

let vm_vec_delta_ang_norm ~v0 ~v1 ~fvec =
  let a = fix_acos ~a:(vm_vec_dotprod ~a:v0 ~b:v1) in
  match fvec with
  | None -> a
  | Some f ->
    let t = vm_vec_crossprod ~a:v0 ~b:v1 in
    if vm_vec_dotprod ~a:t ~b:f < 0 then wrap_i32_to_fixang (-a) else a
;;

let vm_vec_delta_ang ~v0 ~v1 ~fvec =
  let _, t0 = vm_vec_copy_normalize ~v:v0 in
  let _, t1 = vm_vec_copy_normalize ~v:v1 in
  vm_vec_delta_ang_norm ~v0:t0 ~v1:t1 ~fvec
;;

let vm_extract_angles_vector_normalized ~v:(x, y, z) =
  let b = 0 in
  let p = fix_asin ~a:(neg_i32 y) in
  let h = if x = 0 && z = 0 then 0 else fix_atan2 ~cos:z ~sin:x in
  vm_angvec_make ~p ~b ~h
;;

let vm_extract_angles_vector ~angles:(p, b, h) ~v =
  let m, t = vm_vec_copy_normalize ~v in
  if m <> 0 then vm_extract_angles_vector_normalized ~v:t else vm_angvec_make ~p ~b ~h
;;

let vm_extract_angles_matrix ~m:(rvec, uvec, fvec) =
  let fx, fy, fz = fvec in
  let _, uy, _ = uvec in
  let _, ry, _ = rvec in
  let h = if fx = 0 && fz = 0 then 0 else fix_atan2 ~cos:fz ~sin:fx in
  let sinh, cosh = fix_sincos ~a:h in
  let cosp =
    if Int.abs sinh > Int.abs cosh then fixdiv ~a:fx ~b:sinh else fixdiv ~a:fz ~b:cosh
  in
  let p = if cosp = 0 && fy = 0 then 0 else fix_atan2 ~cos:cosp ~sin:(neg_i32 fy) in
  let b =
    if cosp = 0
    then 0
    else (
      let sinb = fixdiv ~a:ry ~b:cosp in
      let cosb = fixdiv ~a:uy ~b:cosp in
      if sinb = 0 && cosb = 0 then 0 else fix_atan2 ~cos:cosb ~sin:sinb)
  in
  vm_angvec_make ~p ~b ~h
;;

let vm_vector_2_matrix ~fvec ~uvec ~rvec =
  let bad_vector2 zvec =
    let zx, zy, zz = zvec in
    if zx = 0 && zz = 0
    then (
      let rvec = 0x10000, 0, 0 in
      let uvec = 0, 0, if zy < 0 then 0x10000 else -0x10000 in
      rvec, uvec, zvec)
    else (
      let xvec0 = zz, 0, -zx in
      let _, xvec = vm_vec_normalize ~v:xvec0 in
      let yvec = vm_vec_crossprod ~a:zvec ~b:xvec in
      xvec, yvec, zvec)
  in
  let mz, zvec = vm_vec_copy_normalize ~v:fvec in
  if mz = 0
  then bad_vector2 zvec
  else (
    match uvec, rvec with
    | None, None -> bad_vector2 zvec
    | None, Some r ->
      let mx, xvec = vm_vec_copy_normalize ~v:r in
      if mx = 0
      then bad_vector2 zvec
      else (
        let yvec0 = vm_vec_crossprod ~a:zvec ~b:xvec in
        let my, yvec = vm_vec_normalize ~v:yvec0 in
        if my = 0
        then bad_vector2 zvec
        else (
          let xvec = vm_vec_crossprod ~a:yvec ~b:zvec in
          xvec, yvec, zvec))
    | Some u, _ ->
      let my, yvec = vm_vec_copy_normalize ~v:u in
      if my = 0
      then bad_vector2 zvec
      else (
        let xvec0 = vm_vec_crossprod ~a:yvec ~b:zvec in
        let mx, xvec = vm_vec_normalize ~v:xvec0 in
        if mx = 0
        then bad_vector2 zvec
        else (
          let yvec = vm_vec_crossprod ~a:zvec ~b:xvec in
          xvec, yvec, zvec)))
;;

let vm_vector_2_matrix_norm ~fvec ~uvec ~rvec =
  let bad_vector2 zvec =
    let zx, zy, zz = zvec in
    if zx = 0 && zz = 0
    then (
      let rvec = 0x10000, 0, 0 in
      let uvec = 0, 0, if zy < 0 then 0x10000 else -0x10000 in
      rvec, uvec, zvec)
    else (
      let xvec0 = zz, 0, -zx in
      let _, xvec = vm_vec_normalize ~v:xvec0 in
      let yvec = vm_vec_crossprod ~a:zvec ~b:xvec in
      xvec, yvec, zvec)
  in
  let zvec = fvec in
  match uvec, rvec with
  | None, None -> bad_vector2 zvec
  | None, Some xvec ->
    let yvec0 = vm_vec_crossprod ~a:zvec ~b:xvec in
    let my, yvec = vm_vec_normalize ~v:yvec0 in
    if my = 0
    then bad_vector2 zvec
    else (
      let xvec = vm_vec_crossprod ~a:yvec ~b:zvec in
      xvec, yvec, zvec)
  | Some yvec, _ ->
    let xvec0 = vm_vec_crossprod ~a:yvec ~b:zvec in
    let mx, xvec = vm_vec_normalize ~v:xvec0 in
    if mx = 0
    then bad_vector2 zvec
    else (
      let yvec = vm_vec_crossprod ~a:zvec ~b:xvec in
      xvec, yvec, zvec)
;;

let vm_vec_rotate ~src ~m:(rvec, uvec, fvec) =
  ( vm_vec_dotprod ~a:src ~b:rvec
  , vm_vec_dotprod ~a:src ~b:uvec
  , vm_vec_dotprod ~a:src ~b:fvec )
;;

let vm_transpose_matrix ~m:((r1, r2, r3), (u1, u2, u3), (f1, f2, f3)) =
  (r1, u1, f1), (r2, u2, f2), (r3, u3, f3)
;;

let vm_copy_transpose_matrix ~m = vm_transpose_matrix ~m

let vm_matrix_x_matrix
      ~a:((r0x, r0y, r0z), (u0x, u0y, u0z), (f0x, f0y, f0z))
      ~b:(r1, u1, f1)
  =
  ( ( vm_vec_dot3 ~x:r0x ~y:u0x ~z:f0x ~v:r1
    , vm_vec_dot3 ~x:r0y ~y:u0y ~z:f0y ~v:r1
    , vm_vec_dot3 ~x:r0z ~y:u0z ~z:f0z ~v:r1 )
  , ( vm_vec_dot3 ~x:r0x ~y:u0x ~z:f0x ~v:u1
    , vm_vec_dot3 ~x:r0y ~y:u0y ~z:f0y ~v:u1
    , vm_vec_dot3 ~x:r0z ~y:u0z ~z:f0z ~v:u1 )
  , ( vm_vec_dot3 ~x:r0x ~y:u0x ~z:f0x ~v:f1
    , vm_vec_dot3 ~x:r0y ~y:u0y ~z:f0y ~v:f1
    , vm_vec_dot3 ~x:r0z ~y:u0z ~z:f0z ~v:f1 ) )
;;
