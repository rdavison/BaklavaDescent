(* 16.16 fixed-point format, matching fix/fix.h in C. *)
let fracbits = 16

(* Convert int -> fixed by shifting into the fractional layout. *)
let i2f i = Int.shift_left i fracbits

(* Convert fixed -> int by dropping fractional bits. *)
let f2i f = Int.shift_right f fracbits

(* Multiply two 16.16 values in 64-bit space, then shift back to 16.16. *)
let fixmul a b =
  Int64.(to_int_exn (shift_right (of_int a * of_int b) fracbits))

(* Divide two 16.16 values by first shifting numerator to preserve precision.
   We mirror C behavior: return 1 on divide-by-zero. *)
let fixdiv a b =
  if b = 0 then 1
  else Int64.(to_int_exn (shift_left (of_int a) fracbits / of_int b))

let () =
  (* Register named callbacks so C can resolve these via caml_named_value(). *)
  Callback.register "cd_i2f" i2f;
  Callback.register "cd_f2i" f2i;
  Callback.register "cd_fixmul" fixmul;
  Callback.register "cd_fixdiv" fixdiv
