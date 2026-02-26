let check_binop name c_impl ox_impl cases =
  List.iter cases ~f:(fun (a, b) ->
      let c = c_impl a b in
      let ox = ox_impl a b in
      printf "%s a=%d b=%d c=%d ox=%d eq=%b\n" name a b c ox (Int.equal c ox))

external c_fixmul : int -> int -> int = "caml_c_fixmul"
external c_fixdiv : int -> int -> int = "caml_c_fixdiv"

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
