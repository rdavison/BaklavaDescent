let check_unop name c_impl ox_impl cases =
  List.iter cases ~f:(fun a ->
      let c = c_impl a in
      let ox = ox_impl a in
      printf "%s a=%d c=%d ox=%d eq=%b\n" name a c ox (Int.equal c ox))

let check_binop name c_impl ox_impl cases =
  List.iter cases ~f:(fun (a, b) ->
      let c = c_impl a b in
      let ox = ox_impl a b in
      printf "%s a=%d b=%d c=%d ox=%d eq=%b\n" name a b c ox (Int.equal c ox))

let check_ternop name c_impl ox_impl cases =
  List.iter cases ~f:(fun (a, b, c_arg) ->
      let c = c_impl a b c_arg in
      let ox = ox_impl a b c_arg in
      printf "%s a=%d b=%d c=%d c_out=%d ox=%d eq=%b\n" name a b c_arg c ox (Int.equal c ox))

external c_i2f : int -> int = "caml_c_i2f"
external c_f2i : int -> int = "caml_c_f2i"
external c_fixmul : int -> int -> int = "caml_c_fixmul"
external c_fixdiv : int -> int -> int = "caml_c_fixdiv"
external c_fixmuldiv : int -> int -> int -> int = "caml_c_fixmuldiv"

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

let random_values ~seed ~test_count gen =
  Quickcheck.random_sequence ~seed:(`Deterministic seed) gen |> fun seq -> Sequence.take seq test_count

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
