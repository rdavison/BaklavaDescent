let fracbits = 16

let i2f i = Int.shift_left i fracbits
let f2i f = Int.shift_right f fracbits

let fixmul a b =
  Int64.(to_int_exn (shift_right (of_int a * of_int b) fracbits))

let fixdiv a b =
  if b = 0 then 1
  else Int64.(to_int_exn (shift_left (of_int a) fracbits / of_int b))

let () =
  Callback.register "cd_i2f" i2f;
  Callback.register "cd_f2i" f2i;
  Callback.register "cd_fixmul" fixmul;
  Callback.register "cd_fixdiv" fixdiv
