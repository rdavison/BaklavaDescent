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

let check_stateful_vec3 name c_impl ox_impl cases =
  List.iter cases ~f:(fun ((dx, dy, dz), (sx, sy, sz), k) ->
      let c_dx, c_dy, c_dz = c_impl dx dy dz sx sy sz k in
      let ox_dx, ox_dy, ox_dz = ox_impl (dx, dy, dz) (sx, sy, sz) k in
      printf
        "%s d=(%d,%d,%d) s=(%d,%d,%d) k=%d c=(%d,%d,%d) ox=(%d,%d,%d) eq=%b\n"
        name
        dx
        dy
        dz
        sx
        sy
        sz
        k
        c_dx
        c_dy
        c_dz
        ox_dx
        ox_dy
        ox_dz
        (Int.equal c_dx ox_dx && Int.equal c_dy ox_dy && Int.equal c_dz ox_dz))

let check_vec3_bin_scale name c_impl ox_impl cases =
  List.iter cases ~f:(fun ((ax, ay, az), (bx, by, bz), k) ->
      let c_x, c_y, c_z = c_impl ax ay az bx by bz k in
      let ox_x, ox_y, ox_z = ox_impl (ax, ay, az) (bx, by, bz) k in
      printf
        "%s a=(%d,%d,%d) b=(%d,%d,%d) k=%d c=(%d,%d,%d) ox=(%d,%d,%d) eq=%b\n"
        name
        ax
        ay
        az
        bx
        by
        bz
        k
        c_x
        c_y
        c_z
        ox_x
        ox_y
        ox_z
        (Int.equal c_x ox_x && Int.equal c_y ox_y && Int.equal c_z ox_z))

let check_stateful_vec3_scale2 name c_impl ox_impl cases =
  List.iter cases ~f:(fun ((dx, dy, dz), n, d) ->
      let c_x, c_y, c_z = c_impl dx dy dz n d in
      let ox_x, ox_y, ox_z = ox_impl (dx, dy, dz) n d in
      printf
        "%s d=(%d,%d,%d) n=%d d=%d c=(%d,%d,%d) ox=(%d,%d,%d) eq=%b\n"
        name
        dx
        dy
        dz
        n
        d
        c_x
        c_y
        c_z
        ox_x
        ox_y
        ox_z
        (Int.equal c_x ox_x && Int.equal c_y ox_y && Int.equal c_z ox_z))

let check_vec3_binop name c_impl ox_impl cases =
  List.iter cases ~f:(fun ((ax, ay, az), (bx, by, bz)) ->
      let c_x, c_y, c_z = c_impl ax ay az bx by bz in
      let ox_x, ox_y, ox_z = ox_impl (ax, ay, az) (bx, by, bz) in
      printf
        "%s a=(%d,%d,%d) b=(%d,%d,%d) c=(%d,%d,%d) ox=(%d,%d,%d) eq=%b\n"
        name
        ax
        ay
        az
        bx
        by
        bz
        c_x
        c_y
        c_z
        ox_x
        ox_y
        ox_z
        (Int.equal c_x ox_x && Int.equal c_y ox_y && Int.equal c_z ox_z))

external c_i2f : int -> int = "caml_c_i2f"
external c_f2i : int -> int = "caml_c_f2i"
external c_fixmul : int -> int -> int = "caml_c_fixmul"
external c_fixdiv : int -> int -> int = "caml_c_fixdiv"
external c_fixmuldiv : int -> int -> int -> int = "caml_c_fixmuldiv"
external c_vm_vec_scale_add2
  :  int -> int -> int -> int -> int -> int -> int -> int * int * int
  = "caml_c_vm_vec_scale_add2_bc" "caml_c_vm_vec_scale_add2"
external c_vm_vec_scale_add
  :  int -> int -> int -> int -> int -> int -> int -> int * int * int
  = "caml_c_vm_vec_scale_add_bc" "caml_c_vm_vec_scale_add"
external c_vm_vec_scale2 : int -> int -> int -> int -> int -> int * int * int = "caml_c_vm_vec_scale2"
external c_vm_vec_add : int -> int -> int -> int -> int -> int -> int * int * int
  = "caml_c_vm_vec_add_bc" "caml_c_vm_vec_add"
external c_vm_vec_sub : int -> int -> int -> int -> int -> int -> int * int * int
  = "caml_c_vm_vec_sub_bc" "caml_c_vm_vec_sub"

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

let vm_vec_scale_add2_cases =
  [
    ((0, 0, 0), (0, 0, 0), 0);
    ((0x10000, 0x20000, -0x10000), (0x10000, -0x10000, 0x8000), 0x10000);
    ((12345, -54321, 99999), (67890, 13579, -24680), 321);
    ((Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value), (1, -1, 2), 0x10000);
  ]

let vm_vec_scale_add_cases =
  [
    ((0, 0, 0), (0, 0, 0), 0);
    ((0x10000, 0x20000, -0x10000), (0x10000, -0x10000, 0x8000), 0x10000);
    ((12345, -54321, 99999), (67890, 13579, -24680), 321);
    ((Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value), (1, -1, 2), 0x10000);
  ]

let vm_vec_scale2_cases =
  [
    ((0, 0, 0), 0x10000, 0x10000);
    ((0x10000, 0x20000, -0x10000), 0x20000, 0x10000);
    ((12345, -54321, 99999), 67890, 321);
    ((12345, -54321, 99999), 67890, 0);
    ((Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value), 0x10000, 0x8000);
  ]

let vm_vec_add_cases =
  [
    ((0, 0, 0), (0, 0, 0));
    ((0x10000, 0x20000, -0x10000), (0x10000, -0x10000, 0x8000));
    ((12345, -54321, 99999), (67890, 13579, -24680));
    ((Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value), (1, -1, 2));
  ]

let vm_vec_sub_cases =
  [
    ((0, 0, 0), (0, 0, 0));
    ((0x10000, 0x20000, -0x10000), (0x10000, -0x10000, 0x8000));
    ((12345, -54321, 99999), (67890, 13579, -24680));
    ((Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value), (1, -1, 2));
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

let vec3_gen =
  Quickcheck.Generator.map
    (Quickcheck.Generator.both fix_gen (Quickcheck.Generator.both fix_gen fix_gen))
    ~f:(fun (x, (y, z)) -> (x, y, z))

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

let run_random_stateful_vec3 ~name ~seed ~test_count c_impl ox_impl =
  let gen =
    Quickcheck.Generator.map
      (Quickcheck.Generator.both vec3_gen (Quickcheck.Generator.both vec3_gen fix_gen))
      ~f:(fun (dest, (src, k)) -> dest, src, k)
  in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count gen
  |> Sequence.iter ~f:(fun ((dx, dy, dz), (sx, sy, sz), k) ->
         incr total;
         let c_dx, c_dy, c_dz = c_impl dx dy dz sx sy sz k in
         let ox_dx, ox_dy, ox_dz = ox_impl (dx, dy, dz) (sx, sy, sz) k in
         if not (Int.equal c_dx ox_dx && Int.equal c_dy ox_dy && Int.equal c_dz ox_dz)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some
                  (sprintf
                     "%s d=(%d,%d,%d) s=(%d,%d,%d) k=%d c=(%d,%d,%d) ox=(%d,%d,%d)"
                     name
                     dx
                     dy
                     dz
                     sx
                     sy
                     sz
                     k
                     c_dx
                     c_dy
                     c_dz
                     ox_dx
                     ox_dy
                     ox_dz)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let run_random_vec3_bin_scale ~name ~seed ~test_count c_impl ox_impl =
  let gen =
    Quickcheck.Generator.map
      (Quickcheck.Generator.both vec3_gen (Quickcheck.Generator.both vec3_gen fix_gen))
      ~f:(fun (a, (b, k)) -> a, b, k)
  in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count gen
  |> Sequence.iter ~f:(fun ((ax, ay, az), (bx, by, bz), k) ->
         incr total;
         let c_x, c_y, c_z = c_impl ax ay az bx by bz k in
         let ox_x, ox_y, ox_z = ox_impl (ax, ay, az) (bx, by, bz) k in
         if not (Int.equal c_x ox_x && Int.equal c_y ox_y && Int.equal c_z ox_z)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some
                  (sprintf
                     "%s a=(%d,%d,%d) b=(%d,%d,%d) k=%d c=(%d,%d,%d) ox=(%d,%d,%d)"
                     name
                     ax
                     ay
                     az
                     bx
                     by
                     bz
                     k
                     c_x
                     c_y
                     c_z
                     ox_x
                     ox_y
                     ox_z)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let run_random_stateful_vec3_scale2 ~name ~seed ~test_count c_impl ox_impl =
  let gen =
    Quickcheck.Generator.map
      (Quickcheck.Generator.both vec3_gen (Quickcheck.Generator.both fix_gen fix_gen))
      ~f:(fun (dest, (n, d)) -> dest, n, d)
  in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count gen
  |> Sequence.iter ~f:(fun ((dx, dy, dz), n, d) ->
         incr total;
         let c_x, c_y, c_z = c_impl dx dy dz n d in
         let ox_x, ox_y, ox_z = ox_impl (dx, dy, dz) n d in
         if not (Int.equal c_x ox_x && Int.equal c_y ox_y && Int.equal c_z ox_z)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some
                  (sprintf
                     "%s d=(%d,%d,%d) n=%d d=%d c=(%d,%d,%d) ox=(%d,%d,%d)"
                     name
                     dx
                     dy
                     dz
                     n
                     d
                     c_x
                     c_y
                     c_z
                     ox_x
                     ox_y
                     ox_z)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let run_random_vec3_binop ~name ~seed ~test_count c_impl ox_impl =
  let gen = Quickcheck.Generator.both vec3_gen vec3_gen in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count gen
  |> Sequence.iter ~f:(fun ((ax, ay, az), (bx, by, bz)) ->
         incr total;
         let c_x, c_y, c_z = c_impl ax ay az bx by bz in
         let ox_x, ox_y, ox_z = ox_impl (ax, ay, az) (bx, by, bz) in
         if not (Int.equal c_x ox_x && Int.equal c_y ox_y && Int.equal c_z ox_z)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some
                  (sprintf
                     "%s a=(%d,%d,%d) b=(%d,%d,%d) c=(%d,%d,%d) ox=(%d,%d,%d)"
                     name
                     ax
                     ay
                     az
                     bx
                     by
                     bz
                     c_x
                     c_y
                     c_z
                     ox_x
                     ox_y
                     ox_z)));
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

let%expect_test "vm_vec_scale_add2 parity C vs Ox" =
  check_stateful_vec3 "vm_vec_scale_add2" c_vm_vec_scale_add2 Ox_math.vm_vec_scale_add2 vm_vec_scale_add2_cases;
  [%expect
    {|
    vm_vec_scale_add2 d=(0,0,0) s=(0,0,0) k=0 c=(0,0,0) ox=(0,0,0) eq=true
    vm_vec_scale_add2 d=(65536,131072,-65536) s=(65536,-65536,32768) k=65536 c=(131072,65536,-32768) ox=(131072,65536,-32768) eq=true
    vm_vec_scale_add2 d=(12345,-54321,99999) s=(67890,13579,-24680) k=321 c=(12677,-54255,99878) ox=(12677,-54255,99878) eq=true
    vm_vec_scale_add2 d=(2147483647,0,-2147483648) s=(1,-1,2) k=65536 c=(-2147483648,-1,-2147483646) ox=(-2147483648,-1,-2147483646) eq=true
    |}]

let%expect_test "vm_vec_scale_add parity C vs Ox" =
  check_vec3_bin_scale "vm_vec_scale_add" c_vm_vec_scale_add Ox_math.vm_vec_scale_add vm_vec_scale_add_cases;
  [%expect
    {|
    vm_vec_scale_add a=(0,0,0) b=(0,0,0) k=0 c=(0,0,0) ox=(0,0,0) eq=true
    vm_vec_scale_add a=(65536,131072,-65536) b=(65536,-65536,32768) k=65536 c=(131072,65536,-32768) ox=(131072,65536,-32768) eq=true
    vm_vec_scale_add a=(12345,-54321,99999) b=(67890,13579,-24680) k=321 c=(12677,-54255,99878) ox=(12677,-54255,99878) eq=true
    vm_vec_scale_add a=(2147483647,0,-2147483648) b=(1,-1,2) k=65536 c=(-2147483648,-1,-2147483646) ox=(-2147483648,-1,-2147483646) eq=true
    |}]

let%expect_test "vm_vec_scale2 parity C vs Ox" =
  check_stateful_vec3_scale2 "vm_vec_scale2" c_vm_vec_scale2 Ox_math.vm_vec_scale2 vm_vec_scale2_cases;
  [%expect
    {|
    vm_vec_scale2 d=(0,0,0) n=65536 d=65536 c=(0,0,0) ox=(0,0,0) eq=true
    vm_vec_scale2 d=(65536,131072,-65536) n=131072 d=65536 c=(131072,262144,-131072) ox=(131072,262144,-131072) eq=true
    vm_vec_scale2 d=(12345,-54321,99999) n=67890 d=321 c=(2610909,-11488637,21149321) ox=(2610909,-11488637,21149321) eq=true
    vm_vec_scale2 d=(12345,-54321,99999) n=67890 d=0 c=(12345,-54321,99999) ox=(12345,-54321,99999) eq=true
    vm_vec_scale2 d=(2147483647,0,-2147483648) n=65536 d=32768 c=(-2,0,0) ox=(-2,0,0) eq=true
    |}]

let%expect_test "vm_vec_add parity C vs Ox" =
  check_vec3_binop "vm_vec_add" c_vm_vec_add Ox_math.vm_vec_add vm_vec_add_cases;
  [%expect
    {|
    vm_vec_add a=(0,0,0) b=(0,0,0) c=(0,0,0) ox=(0,0,0) eq=true
    vm_vec_add a=(65536,131072,-65536) b=(65536,-65536,32768) c=(131072,65536,-32768) ox=(131072,65536,-32768) eq=true
    vm_vec_add a=(12345,-54321,99999) b=(67890,13579,-24680) c=(80235,-40742,75319) ox=(80235,-40742,75319) eq=true
    vm_vec_add a=(2147483647,0,-2147483648) b=(1,-1,2) c=(-2147483648,-1,-2147483646) ox=(-2147483648,-1,-2147483646) eq=true
    |}]

let%expect_test "vm_vec_sub parity C vs Ox" =
  check_vec3_binop "vm_vec_sub" c_vm_vec_sub Ox_math.vm_vec_sub vm_vec_sub_cases;
  [%expect
    {|
    vm_vec_sub a=(0,0,0) b=(0,0,0) c=(0,0,0) ox=(0,0,0) eq=true
    vm_vec_sub a=(65536,131072,-65536) b=(65536,-65536,32768) c=(0,196608,-98304) ox=(0,196608,-98304) eq=true
    vm_vec_sub a=(12345,-54321,99999) b=(67890,13579,-24680) c=(-55545,-67900,124679) ox=(-55545,-67900,124679) eq=true
    vm_vec_sub a=(2147483647,0,-2147483648) b=(1,-1,2) c=(2147483646,1,2147483646) ox=(2147483646,1,2147483646) eq=true
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

let%expect_test "randomized vm_vec_scale_add2 parity C vs Ox" =
  run_random_stateful_vec3
    ~name:"vm_vec_scale_add2"
    ~seed:"vm-vec-scale-add2-seed-v1"
    ~test_count:5000
    c_vm_vec_scale_add2
    Ox_math.vm_vec_scale_add2;
  [%expect {| vm_vec_scale_add2 random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_scale_add parity C vs Ox" =
  run_random_vec3_bin_scale
    ~name:"vm_vec_scale_add"
    ~seed:"vm-vec-scale-add-seed-v1"
    ~test_count:5000
    c_vm_vec_scale_add
    Ox_math.vm_vec_scale_add;
  [%expect {| vm_vec_scale_add random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_scale2 parity C vs Ox" =
  run_random_stateful_vec3_scale2
    ~name:"vm_vec_scale2"
    ~seed:"vm-vec-scale2-seed-v1"
    ~test_count:5000
    c_vm_vec_scale2
    Ox_math.vm_vec_scale2;
  [%expect {| vm_vec_scale2 random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_add parity C vs Ox" =
  run_random_vec3_binop
    ~name:"vm_vec_add"
    ~seed:"vm-vec-add-seed-v1"
    ~test_count:5000
    c_vm_vec_add
    Ox_math.vm_vec_add;
  [%expect {| vm_vec_add random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_sub parity C vs Ox" =
  run_random_vec3_binop
    ~name:"vm_vec_sub"
    ~seed:"vm-vec-sub-seed-v1"
    ~test_count:5000
    c_vm_vec_sub
    Ox_math.vm_vec_sub;
  [%expect {| vm_vec_sub random total=5000 mismatches=0 |}]
