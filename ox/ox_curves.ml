(* Hermite spline curve functions — pure math, depends only on Ox_math. *)

type vms_equation =
  { x3 : int
  ; x2 : int
  ; x1 : int
  ; x0 : int
  ; y3 : int
  ; y2 : int
  ; y1 : int
  ; y0 : int
  ; z3 : int
  ; z2 : int
  ; z1 : int
  ; z0 : int
  }

let f1_0 = 0x10000

(* Wrap to int32 — C stores results in fix (int32_t) *)
let w x = Ox_math.wrap_i64_to_fix (Int64.of_int x)

let create_curve
      ~p1:(p1x, p1y, p1z)
      ~p4:(p4x, p4y, p4z)
      ~r1:(r1x, r1y, r1z)
      ~r4:(r4x, r4y, r4z)
  =
  let open Ox_math in
  { x3 = w (fixmul ~a:(2 * f1_0) ~b:p1x - fixmul ~a:(2 * f1_0) ~b:p4x + r1x + r4x)
  ; x2 =
      w
        (fixmul ~a:(-3 * f1_0) ~b:p1x
         + fixmul ~a:(3 * f1_0) ~b:p4x
         - fixmul ~a:(2 * f1_0) ~b:r1x
         - fixmul ~a:(1 * f1_0) ~b:r4x)
  ; x1 = r1x
  ; x0 = p1x
  ; y3 = w (fixmul ~a:(2 * f1_0) ~b:p1y - fixmul ~a:(2 * f1_0) ~b:p4y + r1y + r4y)
  ; y2 =
      w
        (fixmul ~a:(-3 * f1_0) ~b:p1y
         + fixmul ~a:(3 * f1_0) ~b:p4y
         - fixmul ~a:(2 * f1_0) ~b:r1y
         - fixmul ~a:(1 * f1_0) ~b:r4y)
  ; y1 = r1y
  ; y0 = p1y
  ; z3 = w (fixmul ~a:(2 * f1_0) ~b:p1z - fixmul ~a:(2 * f1_0) ~b:p4z + r1z + r4z)
  ; z2 =
      w
        (fixmul ~a:(-3 * f1_0) ~b:p1z
         + fixmul ~a:(3 * f1_0) ~b:p4z
         - fixmul ~a:(2 * f1_0) ~b:r1z
         - fixmul ~a:(1 * f1_0) ~b:r4z)
  ; z1 = r1z
  ; z0 = p1z
  }
;;

let evaluate_curve coeffs ~t =
  let open Ox_math in
  let t2 = fixmul ~a:t ~b:t in
  let t3 = fixmul ~a:t2 ~b:t in
  let x =
    w
      (fixmul ~a:coeffs.x3 ~b:t3
       + fixmul ~a:coeffs.x2 ~b:t2
       + fixmul ~a:coeffs.x1 ~b:t
       + coeffs.x0)
  in
  let y =
    w
      (fixmul ~a:coeffs.y3 ~b:t3
       + fixmul ~a:coeffs.y2 ~b:t2
       + fixmul ~a:coeffs.y1 ~b:t
       + coeffs.y0)
  in
  let z =
    w
      (fixmul ~a:coeffs.z3 ~b:t3
       + fixmul ~a:coeffs.z2 ~b:t2
       + fixmul ~a:coeffs.z1 ~b:t
       + coeffs.z0)
  in
  x, y, z
;;

(* ACCURACY = 0.1 * F1_0 = 6553 *)
let accuracy = 6553

(* Step = 0.001 * F1_0 = 65 (truncated from 65.536) *)
let step = 65

let curve_dist coeffs ~t0 ~p0 ~dist =
  let rec walk t =
    if t >= f1_0
    then -f1_0
    else (
      let coord = evaluate_curve coeffs ~t in
      let diff = dist - Ox_math.vm_vec_dist ~a:coord ~b:p0 in
      if diff < accuracy then t else walk (t + step))
  in
  walk t0
;;

let curve_dir coeffs ~t0 =
  let open Ox_math in
  let t2 = fixmul ~a:t0 ~b:t0 in
  let x =
    w
      (fixmul ~a:(3 * f1_0) ~b:(fixmul ~a:coeffs.x3 ~b:t2)
       + fixmul ~a:(2 * f1_0) ~b:(fixmul ~a:coeffs.x2 ~b:t0)
       + coeffs.x1)
  in
  let y =
    w
      (fixmul ~a:(3 * f1_0) ~b:(fixmul ~a:coeffs.y3 ~b:t2)
       + fixmul ~a:(2 * f1_0) ~b:(fixmul ~a:coeffs.y2 ~b:t0)
       + coeffs.y1)
  in
  let z =
    w
      (fixmul ~a:(3 * f1_0) ~b:(fixmul ~a:coeffs.z3 ~b:t2)
       + fixmul ~a:(2 * f1_0) ~b:(fixmul ~a:coeffs.z2 ~b:t0)
       + coeffs.z1)
  in
  vm_vec_normalize ~v:(x, y, z)
;;
