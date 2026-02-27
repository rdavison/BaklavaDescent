(* Hermite spline curve functions — pure math, depends only on Ox_math. *)

type vms_equation =
  { x3 : int; x2 : int; x1 : int; x0 : int
  ; y3 : int; y2 : int; y1 : int; y0 : int
  ; z3 : int; z2 : int; z1 : int; z0 : int
  }

let f1_0 = 0x10000

(* Wrap to int32 — C stores results in fix (int32_t) *)
let w x = Ox_math.wrap_i64_to_fix (Int64.of_int x)

let create_curve ~p1:(p1x, p1y, p1z) ~p4:(p4x, p4y, p4z)
    ~r1:(r1x, r1y, r1z) ~r4:(r4x, r4y, r4z) =
  let open Ox_math in
  { x3 = w (fixmul (2 * f1_0) p1x - fixmul (2 * f1_0) p4x + r1x + r4x)
  ; x2 = w (fixmul (-3 * f1_0) p1x + fixmul (3 * f1_0) p4x - fixmul (2 * f1_0) r1x - fixmul (1 * f1_0) r4x)
  ; x1 = r1x
  ; x0 = p1x
  ; y3 = w (fixmul (2 * f1_0) p1y - fixmul (2 * f1_0) p4y + r1y + r4y)
  ; y2 = w (fixmul (-3 * f1_0) p1y + fixmul (3 * f1_0) p4y - fixmul (2 * f1_0) r1y - fixmul (1 * f1_0) r4y)
  ; y1 = r1y
  ; y0 = p1y
  ; z3 = w (fixmul (2 * f1_0) p1z - fixmul (2 * f1_0) p4z + r1z + r4z)
  ; z2 = w (fixmul (-3 * f1_0) p1z + fixmul (3 * f1_0) p4z - fixmul (2 * f1_0) r1z - fixmul (1 * f1_0) r4z)
  ; z1 = r1z
  ; z0 = p1z
  }

let evaluate_curve coeffs ~t =
  let open Ox_math in
  let t2 = fixmul t t in
  let t3 = fixmul t2 t in
  let x = w (fixmul coeffs.x3 t3 + fixmul coeffs.x2 t2 + fixmul coeffs.x1 t + coeffs.x0) in
  let y = w (fixmul coeffs.y3 t3 + fixmul coeffs.y2 t2 + fixmul coeffs.y1 t + coeffs.y0) in
  let z = w (fixmul coeffs.z3 t3 + fixmul coeffs.z2 t2 + fixmul coeffs.z1 t + coeffs.z0) in
  (x, y, z)

(* ACCURACY = 0.1 * F1_0 = 6553 *)
let accuracy = 6553
(* Step = 0.001 * F1_0 = 65 (truncated from 65.536) *)
let step = 65

let curve_dist coeffs ~t0 ~p0 ~dist =
  let rec walk t =
    if t >= f1_0 then -f1_0
    else
      let coord = evaluate_curve coeffs ~t in
      let diff = dist - Ox_math.vm_vec_dist coord p0 in
      if diff < accuracy then t
      else walk (t + step)
  in
  walk t0

let curve_dir coeffs ~t0 =
  let open Ox_math in
  let t2 = fixmul t0 t0 in
  let x = w (fixmul (3 * f1_0) (fixmul coeffs.x3 t2) + fixmul (2 * f1_0) (fixmul coeffs.x2 t0) + coeffs.x1) in
  let y = w (fixmul (3 * f1_0) (fixmul coeffs.y3 t2) + fixmul (2 * f1_0) (fixmul coeffs.y2 t0) + coeffs.y1) in
  let z = w (fixmul (3 * f1_0) (fixmul coeffs.z3 t2) + fixmul (2 * f1_0) (fixmul coeffs.z2 t0) + coeffs.z1) in
  vm_vec_normalize (x, y, z)
