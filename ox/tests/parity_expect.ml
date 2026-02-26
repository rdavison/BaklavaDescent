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

let check_vec3_scale name c_impl ox_impl cases =
  List.iter cases ~f:(fun ((sx, sy, sz), k) ->
      let c_x, c_y, c_z = c_impl sx sy sz k in
      let ox_x, ox_y, ox_z = ox_impl (sx, sy, sz) k in
      printf
        "%s s=(%d,%d,%d) k=%d out=(%d,%d,%d) ox=(%d,%d,%d) eq=%b\n"
        name
        sx
        sy
        sz
        k
        c_x
        c_y
        c_z
        ox_x
        ox_y
        ox_z
        (Int.equal c_x ox_x && Int.equal c_y ox_y && Int.equal c_z ox_z))

let check_stateful_vec3_add2 name c_impl ox_impl cases =
  List.iter cases ~f:(fun ((dx, dy, dz), (sx, sy, sz)) ->
      let c_x, c_y, c_z = c_impl dx dy dz sx sy sz in
      let ox_x, ox_y, ox_z = ox_impl (dx, dy, dz) (sx, sy, sz) in
      printf
        "%s d=(%d,%d,%d) s=(%d,%d,%d) c=(%d,%d,%d) ox=(%d,%d,%d) eq=%b\n"
        name
        dx
        dy
        dz
        sx
        sy
        sz
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
external c_vm_vec_add2 : int -> int -> int -> int -> int -> int -> int * int * int
  = "caml_c_vm_vec_add2_bc" "caml_c_vm_vec_add2"
external c_vm_vec_sub2 : int -> int -> int -> int -> int -> int -> int * int * int
  = "caml_c_vm_vec_sub2_bc" "caml_c_vm_vec_sub2"
external c_vm_vec_avg : int -> int -> int -> int -> int -> int -> int * int * int
  = "caml_c_vm_vec_avg_bc" "caml_c_vm_vec_avg"
external c_vm_vec_avg4
  :  int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int * int * int
  = "caml_c_vm_vec_avg4_bc" "caml_c_vm_vec_avg4"
external c_vm_vec_copy_scale : int -> int -> int -> int -> int * int * int = "caml_c_vm_vec_copy_scale"
external c_vm_vec_scale : int -> int -> int -> int -> int * int * int = "caml_c_vm_vec_scale"
external c_vm_vec_mag_quick : int -> int -> int -> int = "caml_c_vm_vec_mag_quick"
external c_vm_vec_dist_quick : int -> int -> int -> int -> int -> int -> int
  = "caml_c_vm_vec_dist_quick_bc" "caml_c_vm_vec_dist_quick"
external c_vm_vec_dotprod : int -> int -> int -> int -> int -> int -> int
  = "caml_c_vm_vec_dotprod_bc" "caml_c_vm_vec_dotprod"
external c_vm_vec_dot3 : int -> int -> int -> int -> int -> int -> int
  = "caml_c_vm_vec_dot3_bc" "caml_c_vm_vec_dot3"
external c_vm_vec_crossprod : int -> int -> int -> int -> int -> int -> int * int * int
  = "caml_c_vm_vec_crossprod_bc" "caml_c_vm_vec_crossprod"
external c_vm_vec_copy_normalize_quick : int -> int -> int -> int * int * int * int
  = "caml_c_vm_vec_copy_normalize_quick"
external c_vm_vec_normalize_quick : int -> int -> int -> int * int * int * int
  = "caml_c_vm_vec_normalize_quick"
external c_vm_vec_normalized_dir_quick : int -> int -> int -> int -> int -> int -> int * int * int * int
  = "caml_c_vm_vec_normalized_dir_quick_bc" "caml_c_vm_vec_normalized_dir_quick"
external c_vm_vec_make : int -> int -> int -> int * int * int = "caml_c_vm_vec_make"
external c_vm_angvec_make : int -> int -> int -> int * int * int = "caml_c_vm_angvec_make"

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

let vm_vec_add2_cases =
  [
    ((0, 0, 0), (0, 0, 0));
    ((0x10000, 0x20000, -0x10000), (0x10000, -0x10000, 0x8000));
    ((12345, -54321, 99999), (67890, 13579, -24680));
    ((Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value), (1, -1, 2));
  ]

let vm_vec_sub2_cases =
  [
    ((0, 0, 0), (0, 0, 0));
    ((0x10000, 0x20000, -0x10000), (0x10000, -0x10000, 0x8000));
    ((12345, -54321, 99999), (67890, 13579, -24680));
    ((Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value), (1, -1, 2));
  ]

let vm_vec_avg_cases =
  [
    ((0, 0, 0), (0, 0, 0));
    ((0x10000, 0x20000, -0x10000), (0x10000, -0x10000, 0x8000));
    ((12345, -54321, 99999), (67890, 13579, -24680));
    ((Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value), (1, -1, 2));
  ]

let vm_vec_avg4_cases =
  [
    ((0, 0, 0), (0, 0, 0), (0, 0, 0), (0, 0, 0));
    ((0x10000, 0x20000, -0x10000), (0x10000, -0x10000, 0x8000), (12345, -54321, 99999), (67890, 13579, -24680));
    ((Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value), (1, -1, 2), (-1, 1, -2), (7, -7, 14));
  ]

let vm_vec_copy_scale_cases =
  [
    ((0, 0, 0), 0);
    ((0x10000, 0x20000, -0x10000), 0x10000);
    ((12345, -54321, 99999), 321);
    ((Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value), 0x10000);
  ]

let vm_vec_scale_cases =
  [
    ((0, 0, 0), 0);
    ((0x10000, 0x20000, -0x10000), 0x10000);
    ((12345, -54321, 99999), 321);
    ((Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value), 0x10000);
  ]

let vm_vec_mag_quick_cases =
  [
    (0, 0, 0);
    (0x10000, 0x20000, -0x10000);
    (12345, -54321, 99999);
    (Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value);
  ]

let vm_vec_dist_quick_cases =
  [
    ((0, 0, 0), (0, 0, 0));
    ((0x10000, 0x20000, -0x10000), (0x10000, -0x10000, 0x8000));
    ((12345, -54321, 99999), (67890, 13579, -24680));
    ((Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value), (1, -1, 2));
  ]

let vm_vec_dotprod_cases =
  [
    ((0, 0, 0), (0, 0, 0));
    ((0x10000, 0x20000, -0x10000), (0x10000, -0x10000, 0x8000));
    ((12345, -54321, 99999), (67890, 13579, -24680));
    ((Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value), (1, -1, 2));
  ]

let vm_vec_dot3_cases =
  [
    ((0, 0, 0), (0, 0, 0));
    ((0x10000, 0x20000, -0x10000), (0x10000, -0x10000, 0x8000));
    ((12345, -54321, 99999), (67890, 13579, -24680));
    ((Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value), (1, -1, 2));
  ]

let vm_vec_crossprod_cases =
  [
    ((0, 0, 0), (0, 0, 0));
    ((0x10000, 0x20000, -0x10000), (0x10000, -0x10000, 0x8000));
    ((12345, -54321, 99999), (67890, 13579, -24680));
    ((Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value), (1, -1, 2));
  ]

let vm_vec_copy_normalize_quick_cases =
  [
    (0, 0, 0);
    (0x10000, 0x20000, -0x10000);
    (12345, -54321, 99999);
    (Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value);
  ]

let vm_vec_normalize_quick_cases = vm_vec_copy_normalize_quick_cases

let vm_vec_normalized_dir_quick_cases =
  [
    ((0, 0, 0), (0, 0, 0));
    ((0x10000, 0x20000, -0x10000), (0x10000, -0x10000, 0x8000));
    ((12345, -54321, 99999), (67890, 13579, -24680));
    ((Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value), (1, -1, 2));
  ]

let vm_vec_make_cases =
  [
    (0, 0, 0);
    (0x10000, 0x20000, -0x10000);
    (12345, -54321, 99999);
    (Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value);
  ]

let vm_angvec_make_cases =
  [
    (0, 0, 0);
    (32767, -32768, 12345);
    (40000, -40000, 65535);
    (Int32.to_int_exn Int32.max_value, 0, Int32.to_int_exn Int32.min_value);
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

let run_random_stateful_vec3_add2 ~name ~seed ~test_count c_impl ox_impl =
  let gen = Quickcheck.Generator.both vec3_gen vec3_gen in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count gen
  |> Sequence.iter ~f:(fun ((dx, dy, dz), (sx, sy, sz)) ->
         incr total;
         let c_x, c_y, c_z = c_impl dx dy dz sx sy sz in
         let ox_x, ox_y, ox_z = ox_impl (dx, dy, dz) (sx, sy, sz) in
         if not (Int.equal c_x ox_x && Int.equal c_y ox_y && Int.equal c_z ox_z)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some
                  (sprintf
                     "%s d=(%d,%d,%d) s=(%d,%d,%d) c=(%d,%d,%d) ox=(%d,%d,%d)"
                     name
                     dx
                     dy
                     dz
                     sx
                     sy
                     sz
                     c_x
                     c_y
                     c_z
                     ox_x
                     ox_y
                     ox_z)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let check_vec3_avg4 name c_impl ox_impl cases =
  List.iter cases ~f:(fun ((a1, a2, a3), (b1, b2, b3), (c1, c2, c3), (d1, d2, d3)) ->
      let c_x, c_y, c_z = c_impl a1 a2 a3 b1 b2 b3 c1 c2 c3 d1 d2 d3 in
      let ox_x, ox_y, ox_z = ox_impl (a1, a2, a3) (b1, b2, b3) (c1, c2, c3) (d1, d2, d3) in
      printf
        "%s a=(%d,%d,%d) b=(%d,%d,%d) c=(%d,%d,%d) d=(%d,%d,%d) out=(%d,%d,%d) ox=(%d,%d,%d) eq=%b\n"
        name
        a1
        a2
        a3
        b1
        b2
        b3
        c1
        c2
        c3
        d1
        d2
        d3
        c_x
        c_y
        c_z
        ox_x
        ox_y
        ox_z
        (Int.equal c_x ox_x && Int.equal c_y ox_y && Int.equal c_z ox_z))

let run_random_vec3_avg4 ~name ~seed ~test_count c_impl ox_impl =
  let gen =
    Quickcheck.Generator.map
      (Quickcheck.Generator.both vec3_gen (Quickcheck.Generator.both vec3_gen (Quickcheck.Generator.both vec3_gen vec3_gen)))
      ~f:(fun (a, (b, (c, d))) -> a, b, c, d)
  in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count gen
  |> Sequence.iter ~f:(fun ((a1, a2, a3), (b1, b2, b3), (c1, c2, c3), (d1, d2, d3)) ->
         incr total;
         let c_x, c_y, c_z = c_impl a1 a2 a3 b1 b2 b3 c1 c2 c3 d1 d2 d3 in
         let ox_x, ox_y, ox_z = ox_impl (a1, a2, a3) (b1, b2, b3) (c1, c2, c3) (d1, d2, d3) in
         if not (Int.equal c_x ox_x && Int.equal c_y ox_y && Int.equal c_z ox_z)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some
                  (sprintf
                     "%s a=(%d,%d,%d) b=(%d,%d,%d) c=(%d,%d,%d) d=(%d,%d,%d) out=(%d,%d,%d) ox=(%d,%d,%d)"
                     name
                     a1
                     a2
                     a3
                     b1
                     b2
                     b3
                     c1
                     c2
                     c3
                     d1
                     d2
                     d3
                     c_x
                     c_y
                     c_z
                     ox_x
                     ox_y
                     ox_z)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let run_random_vec3_scale ~name ~seed ~test_count c_impl ox_impl =
  let gen = Quickcheck.Generator.both vec3_gen fix_gen in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count gen
  |> Sequence.iter ~f:(fun ((sx, sy, sz), k) ->
         incr total;
         let c_x, c_y, c_z = c_impl sx sy sz k in
         let ox_x, ox_y, ox_z = ox_impl (sx, sy, sz) k in
         if not (Int.equal c_x ox_x && Int.equal c_y ox_y && Int.equal c_z ox_z)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some
                  (sprintf
                     "%s s=(%d,%d,%d) k=%d out=(%d,%d,%d) ox=(%d,%d,%d)"
                     name
                     sx
                     sy
                     sz
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

let check_vec3_to_scalar name c_impl ox_impl cases =
  List.iter cases ~f:(fun (x, y, z) ->
      let c = c_impl x y z in
      let ox = ox_impl (x, y, z) in
      printf "%s v=(%d,%d,%d) c=%d ox=%d eq=%b\n" name x y z c ox (Int.equal c ox))

let run_random_vec3_to_scalar ~name ~seed ~test_count c_impl ox_impl =
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count vec3_gen
  |> Sequence.iter ~f:(fun (x, y, z) ->
         incr total;
         let c = c_impl x y z in
         let ox = ox_impl (x, y, z) in
         if not (Int.equal c ox)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then first_mismatch := Some (sprintf "%s v=(%d,%d,%d) c=%d ox=%d" name x y z c ox)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let check_two_vec3_to_scalar name c_impl ox_impl cases =
  List.iter cases ~f:(fun ((x0, y0, z0), (x1, y1, z1)) ->
      let c = c_impl x0 y0 z0 x1 y1 z1 in
      let ox = ox_impl (x0, y0, z0) (x1, y1, z1) in
      printf
        "%s v0=(%d,%d,%d) v1=(%d,%d,%d) c=%d ox=%d eq=%b\n"
        name
        x0
        y0
        z0
        x1
        y1
        z1
        c
        ox
        (Int.equal c ox))

let run_random_two_vec3_to_scalar ~name ~seed ~test_count c_impl ox_impl =
  let gen = Quickcheck.Generator.both vec3_gen vec3_gen in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count gen
  |> Sequence.iter ~f:(fun ((x0, y0, z0), (x1, y1, z1)) ->
         incr total;
         let c = c_impl x0 y0 z0 x1 y1 z1 in
         let ox = ox_impl (x0, y0, z0) (x1, y1, z1) in
         if not (Int.equal c ox)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some
                  (sprintf
                     "%s v0=(%d,%d,%d) v1=(%d,%d,%d) c=%d ox=%d"
                     name
                     x0
                     y0
                     z0
                     x1
                     y1
                     z1
                     c
                     ox)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let check_vec_copy_normalize_quick name c_impl ox_impl cases =
  List.iter cases ~f:(fun (sx, sy, sz) ->
      let c_m, c_x, c_y, c_z = c_impl sx sy sz in
      let ox_m, (ox_x, ox_y, ox_z) = ox_impl (sx, sy, sz) in
      printf
        "%s s=(%d,%d,%d) m=(c:%d ox:%d) out=(c:%d,%d,%d ox:%d,%d,%d) eq=%b\n"
        name
        sx
        sy
        sz
        c_m
        ox_m
        c_x
        c_y
        c_z
        ox_x
        ox_y
        ox_z
        (Int.equal c_m ox_m && Int.equal c_x ox_x && Int.equal c_y ox_y && Int.equal c_z ox_z))

let run_random_vec_copy_normalize_quick ~name ~seed ~test_count c_impl ox_impl =
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count vec3_gen
  |> Sequence.iter ~f:(fun (sx, sy, sz) ->
         incr total;
         let c_m, c_x, c_y, c_z = c_impl sx sy sz in
         let ox_m, (ox_x, ox_y, ox_z) = ox_impl (sx, sy, sz) in
         if not (Int.equal c_m ox_m && Int.equal c_x ox_x && Int.equal c_y ox_y && Int.equal c_z ox_z)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some
                  (sprintf
                     "%s s=(%d,%d,%d) m=(c:%d ox:%d) out=(c:%d,%d,%d ox:%d,%d,%d)"
                     name
                     sx
                     sy
                     sz
                     c_m
                     ox_m
                     c_x
                     c_y
                     c_z
                     ox_x
                     ox_y
                     ox_z)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let check_vec_normalized_dir_quick name c_impl ox_impl cases =
  List.iter cases ~f:(fun ((ex, ey, ez), (sx, sy, sz)) ->
      let c_m, c_x, c_y, c_z = c_impl ex ey ez sx sy sz in
      let ox_m, (ox_x, ox_y, ox_z) = ox_impl (ex, ey, ez) (sx, sy, sz) in
      printf
        "%s end=(%d,%d,%d) start=(%d,%d,%d) m=(c:%d ox:%d) out=(c:%d,%d,%d ox:%d,%d,%d) eq=%b\n"
        name
        ex
        ey
        ez
        sx
        sy
        sz
        c_m
        ox_m
        c_x
        c_y
        c_z
        ox_x
        ox_y
        ox_z
        (Int.equal c_m ox_m && Int.equal c_x ox_x && Int.equal c_y ox_y && Int.equal c_z ox_z))

let run_random_vec_normalized_dir_quick ~name ~seed ~test_count c_impl ox_impl =
  let gen = Quickcheck.Generator.both vec3_gen vec3_gen in
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count gen
  |> Sequence.iter ~f:(fun ((ex, ey, ez), (sx, sy, sz)) ->
         incr total;
         let c_m, c_x, c_y, c_z = c_impl ex ey ez sx sy sz in
         let ox_m, (ox_x, ox_y, ox_z) = ox_impl (ex, ey, ez) (sx, sy, sz) in
         if not (Int.equal c_m ox_m && Int.equal c_x ox_x && Int.equal c_y ox_y && Int.equal c_z ox_z)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some
                  (sprintf
                     "%s end=(%d,%d,%d) start=(%d,%d,%d) m=(c:%d ox:%d) out=(c:%d,%d,%d ox:%d,%d,%d)"
                     name
                     ex
                     ey
                     ez
                     sx
                     sy
                     sz
                     c_m
                     ox_m
                     c_x
                     c_y
                     c_z
                     ox_x
                     ox_y
                     ox_z)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let check_make3 name c_impl ox_impl cases =
  List.iter cases ~f:(fun (x, y, z) ->
      let c_x, c_y, c_z = c_impl x y z in
      let ox_x, ox_y, ox_z = ox_impl x y z in
      printf
        "%s in=(%d,%d,%d) c=(%d,%d,%d) ox=(%d,%d,%d) eq=%b\n"
        name
        x
        y
        z
        c_x
        c_y
        c_z
        ox_x
        ox_y
        ox_z
        (Int.equal c_x ox_x && Int.equal c_y ox_y && Int.equal c_z ox_z))

let run_random_make3 ~name ~seed ~test_count gen c_impl ox_impl =
  let total = ref 0 in
  let mismatches = ref 0 in
  let first_mismatch = ref None in
  random_values ~seed ~test_count gen
  |> Sequence.iter ~f:(fun (x, y, z) ->
         incr total;
         let c_x, c_y, c_z = c_impl x y z in
         let ox_x, ox_y, ox_z = ox_impl x y z in
         if not (Int.equal c_x ox_x && Int.equal c_y ox_y && Int.equal c_z ox_z)
         then (
           incr mismatches;
           if Option.is_none !first_mismatch
           then
             first_mismatch
             := Some
                  (sprintf
                     "%s in=(%d,%d,%d) c=(%d,%d,%d) ox=(%d,%d,%d)"
                     name
                     x
                     y
                     z
                     c_x
                     c_y
                     c_z
                     ox_x
                     ox_y
                     ox_z)));
  printf "%s random total=%d mismatches=%d\n" name !total !mismatches;
  Option.iter !first_mismatch ~f:(fun s -> printf "first_mismatch %s\n" s);
  if !mismatches <> 0 then failwithf "%s randomized parity failed" name ()

let fixang_gen =
  Quickcheck.Generator.weighted_union
    [
      (3.0, Quickcheck.Generator.of_list [ -32768; -32767; -1; 0; 1; 32766; 32767 ]);
      (7.0, Quickcheck.Generator.map Int32.quickcheck_generator ~f:Int32.to_int_exn);
    ]

let ang3_gen =
  Quickcheck.Generator.map
    (Quickcheck.Generator.both fixang_gen (Quickcheck.Generator.both fixang_gen fixang_gen))
    ~f:(fun (x, (y, z)) -> (x, y, z))

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

let%expect_test "vm_vec_add2 parity C vs Ox" =
  check_stateful_vec3_add2 "vm_vec_add2" c_vm_vec_add2 Ox_math.vm_vec_add2 vm_vec_add2_cases;
  [%expect
    {|
    vm_vec_add2 d=(0,0,0) s=(0,0,0) c=(0,0,0) ox=(0,0,0) eq=true
    vm_vec_add2 d=(65536,131072,-65536) s=(65536,-65536,32768) c=(131072,65536,-32768) ox=(131072,65536,-32768) eq=true
    vm_vec_add2 d=(12345,-54321,99999) s=(67890,13579,-24680) c=(80235,-40742,75319) ox=(80235,-40742,75319) eq=true
    vm_vec_add2 d=(2147483647,0,-2147483648) s=(1,-1,2) c=(-2147483648,-1,-2147483646) ox=(-2147483648,-1,-2147483646) eq=true
    |}]

let%expect_test "vm_vec_sub2 parity C vs Ox" =
  check_stateful_vec3_add2 "vm_vec_sub2" c_vm_vec_sub2 Ox_math.vm_vec_sub2 vm_vec_sub2_cases;
  [%expect
    {|
    vm_vec_sub2 d=(0,0,0) s=(0,0,0) c=(0,0,0) ox=(0,0,0) eq=true
    vm_vec_sub2 d=(65536,131072,-65536) s=(65536,-65536,32768) c=(0,196608,-98304) ox=(0,196608,-98304) eq=true
    vm_vec_sub2 d=(12345,-54321,99999) s=(67890,13579,-24680) c=(-55545,-67900,124679) ox=(-55545,-67900,124679) eq=true
    vm_vec_sub2 d=(2147483647,0,-2147483648) s=(1,-1,2) c=(2147483646,1,2147483646) ox=(2147483646,1,2147483646) eq=true
    |}]

let%expect_test "vm_vec_avg parity C vs Ox" =
  check_vec3_binop "vm_vec_avg" c_vm_vec_avg Ox_math.vm_vec_avg vm_vec_avg_cases;
  [%expect
    {|
    vm_vec_avg a=(0,0,0) b=(0,0,0) c=(0,0,0) ox=(0,0,0) eq=true
    vm_vec_avg a=(65536,131072,-65536) b=(65536,-65536,32768) c=(65536,32768,-16384) ox=(65536,32768,-16384) eq=true
    vm_vec_avg a=(12345,-54321,99999) b=(67890,13579,-24680) c=(40117,-20371,37659) ox=(40117,-20371,37659) eq=true
    vm_vec_avg a=(2147483647,0,-2147483648) b=(1,-1,2) c=(-1073741824,0,-1073741823) ox=(-1073741824,0,-1073741823) eq=true
    |}]

let%expect_test "vm_vec_avg4 parity C vs Ox" =
  check_vec3_avg4 "vm_vec_avg4" c_vm_vec_avg4 Ox_math.vm_vec_avg4 vm_vec_avg4_cases;
  [%expect
    {|
    vm_vec_avg4 a=(0,0,0) b=(0,0,0) c=(0,0,0) d=(0,0,0) out=(0,0,0) ox=(0,0,0) eq=true
    vm_vec_avg4 a=(65536,131072,-65536) b=(65536,-65536,32768) c=(12345,-54321,99999) d=(67890,13579,-24680) out=(52826,6198,10637) ox=(52826,6198,10637) eq=true
    vm_vec_avg4 a=(2147483647,0,-2147483648) b=(1,-1,2) c=(-1,1,-2) d=(7,-7,14) out=(-536870910,-1,-536870908) ox=(-536870910,-1,-536870908) eq=true
    |}]

let%expect_test "vm_vec_copy_scale parity C vs Ox" =
  check_vec3_scale "vm_vec_copy_scale" c_vm_vec_copy_scale Ox_math.vm_vec_copy_scale vm_vec_copy_scale_cases;
  [%expect
    {|
    vm_vec_copy_scale s=(0,0,0) k=0 out=(0,0,0) ox=(0,0,0) eq=true
    vm_vec_copy_scale s=(65536,131072,-65536) k=65536 out=(65536,131072,-65536) ox=(65536,131072,-65536) eq=true
    vm_vec_copy_scale s=(12345,-54321,99999) k=321 out=(60,-267,489) ox=(60,-267,489) eq=true
    vm_vec_copy_scale s=(2147483647,0,-2147483648) k=65536 out=(2147483647,0,-2147483648) ox=(2147483647,0,-2147483648) eq=true
    |}]

let%expect_test "vm_vec_scale parity C vs Ox" =
  check_vec3_scale "vm_vec_scale" c_vm_vec_scale Ox_math.vm_vec_scale vm_vec_scale_cases;
  [%expect
    {|
    vm_vec_scale s=(0,0,0) k=0 out=(0,0,0) ox=(0,0,0) eq=true
    vm_vec_scale s=(65536,131072,-65536) k=65536 out=(65536,131072,-65536) ox=(65536,131072,-65536) eq=true
    vm_vec_scale s=(12345,-54321,99999) k=321 out=(60,-267,489) ox=(60,-267,489) eq=true
    vm_vec_scale s=(2147483647,0,-2147483648) k=65536 out=(2147483647,0,-2147483648) ox=(2147483647,0,-2147483648) eq=true
    |}]

let%expect_test "vm_vec_mag_quick parity C vs Ox" =
  check_vec3_to_scalar "vm_vec_mag_quick" c_vm_vec_mag_quick Ox_math.vm_vec_mag_quick vm_vec_mag_quick_cases;
  [%expect
    {|
    vm_vec_mag_quick v=(0,0,0) c=0 ox=0 eq=true
    vm_vec_mag_quick v=(65536,131072,-65536) c=167936 ox=167936 eq=true
    vm_vec_mag_quick v=(12345,-54321,99999) c=122683 ox=122683 eq=true
    vm_vec_mag_quick v=(2147483647,0,-2147483648) c=1744830463 ox=1744830463 eq=true
    |}]

let%expect_test "vm_vec_dist_quick parity C vs Ox" =
  check_two_vec3_to_scalar
    "vm_vec_dist_quick"
    c_vm_vec_dist_quick
    Ox_math.vm_vec_dist_quick
    vm_vec_dist_quick_cases;
  [%expect
    {|
    vm_vec_dist_quick v0=(0,0,0) v1=(0,0,0) c=0 ox=0 eq=true
    vm_vec_dist_quick v0=(65536,131072,-65536) v1=(65536,-65536,32768) c=233472 ox=233472 eq=true
    vm_vec_dist_quick v0=(12345,-54321,99999) v1=(67890,13579,-24680) c=160556 ox=160556 eq=true
    vm_vec_dist_quick v0=(2147483647,0,-2147483648) v1=(1,-1,2) c=-1342177284 ox=-1342177284 eq=true
    |}]

let%expect_test "vm_vec_dotprod parity C vs Ox" =
  check_two_vec3_to_scalar "vm_vec_dotprod" c_vm_vec_dotprod Ox_math.vm_vec_dotprod vm_vec_dotprod_cases;
  [%expect
    {|
    vm_vec_dotprod v0=(0,0,0) v1=(0,0,0) c=0 ox=0 eq=true
    vm_vec_dotprod v0=(65536,131072,-65536) v1=(65536,-65536,32768) c=-98304 ox=-98304 eq=true
    vm_vec_dotprod v0=(12345,-54321,99999) v1=(67890,13579,-24680) c=-36126 ox=-36126 eq=true
    vm_vec_dotprod v0=(2147483647,0,-2147483648) v1=(1,-1,2) c=-32769 ox=-32769 eq=true
    |}]

let%expect_test "vm_vec_dot3 parity C vs Ox" =
  check_two_vec3_to_scalar
    "vm_vec_dot3"
    c_vm_vec_dot3
    (fun (x, y, z) (vx, vy, vz) -> Ox_math.vm_vec_dot3 x y z (vx, vy, vz))
    vm_vec_dot3_cases;
  [%expect
    {|
    vm_vec_dot3 v0=(0,0,0) v1=(0,0,0) c=0 ox=0 eq=true
    vm_vec_dot3 v0=(65536,131072,-65536) v1=(65536,-65536,32768) c=-98304 ox=-98304 eq=true
    vm_vec_dot3 v0=(12345,-54321,99999) v1=(67890,13579,-24680) c=-36126 ox=-36126 eq=true
    vm_vec_dot3 v0=(2147483647,0,-2147483648) v1=(1,-1,2) c=-32769 ox=-32769 eq=true
    |}]

let%expect_test "vm_vec_crossprod parity C vs Ox" =
  check_vec3_binop "vm_vec_crossprod" c_vm_vec_crossprod Ox_math.vm_vec_crossprod vm_vec_crossprod_cases;
  [%expect
    {|
    vm_vec_crossprod a=(0,0,0) b=(0,0,0) c=(0,0,0) ox=(0,0,0) eq=true
    vm_vec_crossprod a=(65536,131072,-65536) b=(65536,-65536,32768) c=(0,-98304,-196608) ox=(0,-98304,-196608) eq=true
    vm_vec_crossprod a=(12345,-54321,99999) b=(67890,13579,-24680) c=(-264,108239,58830) ox=(-264,108239,58830) eq=true
    vm_vec_crossprod a=(2147483647,0,-2147483648) b=(1,-1,2) c=(32768,-98304,-32768) ox=(32768,-98304,-32768) eq=true
    |}]

let%expect_test "vm_vec_copy_normalize_quick parity C vs Ox" =
  check_vec_copy_normalize_quick
    "vm_vec_copy_normalize_quick"
    c_vm_vec_copy_normalize_quick
    Ox_math.vm_vec_copy_normalize_quick
    vm_vec_copy_normalize_quick_cases;
  [%expect
    {|
    vm_vec_copy_normalize_quick s=(0,0,0) m=(c:0 ox:0) out=(c:0,0,0 ox:0,0,0) eq=true
    vm_vec_copy_normalize_quick s=(65536,131072,-65536) m=(c:167936 ox:167936) out=(c:25575,51150,-25575 ox:25575,51150,-25575) eq=true
    vm_vec_copy_normalize_quick s=(12345,-54321,99999) m=(c:122683 ox:122683) out=(c:6594,-29017,53418 ox:6594,-29017,53418) eq=true
    vm_vec_copy_normalize_quick s=(2147483647,0,-2147483648) m=(c:1744830463 ox:1744830463) out=(c:80659,0,-80659 ox:80659,0,-80659) eq=true
    |}]

let%expect_test "vm_vec_normalize_quick parity C vs Ox" =
  check_vec_copy_normalize_quick
    "vm_vec_normalize_quick"
    c_vm_vec_normalize_quick
    Ox_math.vm_vec_normalize_quick
    vm_vec_normalize_quick_cases;
  [%expect
    {|
    vm_vec_normalize_quick s=(0,0,0) m=(c:0 ox:0) out=(c:0,0,0 ox:0,0,0) eq=true
    vm_vec_normalize_quick s=(65536,131072,-65536) m=(c:167936 ox:167936) out=(c:25575,51150,-25575 ox:25575,51150,-25575) eq=true
    vm_vec_normalize_quick s=(12345,-54321,99999) m=(c:122683 ox:122683) out=(c:6594,-29017,53418 ox:6594,-29017,53418) eq=true
    vm_vec_normalize_quick s=(2147483647,0,-2147483648) m=(c:1744830463 ox:1744830463) out=(c:80659,0,-80659 ox:80659,0,-80659) eq=true
    |}]

let%expect_test "vm_vec_normalized_dir_quick parity C vs Ox" =
  check_vec_normalized_dir_quick
    "vm_vec_normalized_dir_quick"
    c_vm_vec_normalized_dir_quick
    Ox_math.vm_vec_normalized_dir_quick
    vm_vec_normalized_dir_quick_cases;
  [%expect
    {|
    vm_vec_normalized_dir_quick end=(0,0,0) start=(0,0,0) m=(c:0 ox:0) out=(c:0,0,0 ox:0,0,0) eq=true
    vm_vec_normalized_dir_quick end=(65536,131072,-65536) start=(65536,-65536,32768) m=(c:233472 ox:233472) out=(c:0,55188,-27594 ox:0,55188,-27594) eq=true
    vm_vec_normalized_dir_quick end=(12345,-54321,99999) start=(67890,13579,-24680) m=(c:160556 ox:160556) out=(c:-22672,-27715,50891 ox:-22672,-27715,50891) eq=true
    vm_vec_normalized_dir_quick end=(2147483647,0,-2147483648) start=(1,-1,2) m=(c:-1342177284 ox:-1342177284) out=(c:2147483646,1,2147483646 ox:2147483646,1,2147483646) eq=true
    |}]

let%expect_test "vm_vec_make parity C vs Ox" =
  check_make3 "vm_vec_make" c_vm_vec_make Ox_math.vm_vec_make vm_vec_make_cases;
  [%expect
    {|
    vm_vec_make in=(0,0,0) c=(0,0,0) ox=(0,0,0) eq=true
    vm_vec_make in=(65536,131072,-65536) c=(65536,131072,-65536) ox=(65536,131072,-65536) eq=true
    vm_vec_make in=(12345,-54321,99999) c=(12345,-54321,99999) ox=(12345,-54321,99999) eq=true
    vm_vec_make in=(2147483647,0,-2147483648) c=(2147483647,0,-2147483648) ox=(2147483647,0,-2147483648) eq=true
    |}]

let%expect_test "vm_angvec_make parity C vs Ox" =
  check_make3 "vm_angvec_make" c_vm_angvec_make Ox_math.vm_angvec_make vm_angvec_make_cases;
  [%expect
    {|
    vm_angvec_make in=(0,0,0) c=(0,0,0) ox=(0,0,0) eq=true
    vm_angvec_make in=(32767,-32768,12345) c=(32767,-32768,12345) ox=(32767,-32768,12345) eq=true
    vm_angvec_make in=(40000,-40000,65535) c=(-25536,25536,-1) ox=(-25536,25536,-1) eq=true
    vm_angvec_make in=(2147483647,0,-2147483648) c=(-1,0,0) ox=(-1,0,0) eq=true
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

let%expect_test "randomized vm_vec_add2 parity C vs Ox" =
  run_random_stateful_vec3_add2
    ~name:"vm_vec_add2"
    ~seed:"vm-vec-add2-seed-v1"
    ~test_count:5000
    c_vm_vec_add2
    Ox_math.vm_vec_add2;
  [%expect {| vm_vec_add2 random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_sub2 parity C vs Ox" =
  run_random_stateful_vec3_add2
    ~name:"vm_vec_sub2"
    ~seed:"vm-vec-sub2-seed-v1"
    ~test_count:5000
    c_vm_vec_sub2
    Ox_math.vm_vec_sub2;
  [%expect {| vm_vec_sub2 random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_avg parity C vs Ox" =
  run_random_vec3_binop
    ~name:"vm_vec_avg"
    ~seed:"vm-vec-avg-seed-v1"
    ~test_count:5000
    c_vm_vec_avg
    Ox_math.vm_vec_avg;
  [%expect {| vm_vec_avg random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_avg4 parity C vs Ox" =
  run_random_vec3_avg4
    ~name:"vm_vec_avg4"
    ~seed:"vm-vec-avg4-seed-v1"
    ~test_count:5000
    c_vm_vec_avg4
    Ox_math.vm_vec_avg4;
  [%expect {| vm_vec_avg4 random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_copy_scale parity C vs Ox" =
  run_random_vec3_scale
    ~name:"vm_vec_copy_scale"
    ~seed:"vm-vec-copy-scale-seed-v1"
    ~test_count:5000
    c_vm_vec_copy_scale
    Ox_math.vm_vec_copy_scale;
  [%expect {| vm_vec_copy_scale random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_scale parity C vs Ox" =
  run_random_vec3_scale
    ~name:"vm_vec_scale"
    ~seed:"vm-vec-scale-seed-v1"
    ~test_count:5000
    c_vm_vec_scale
    Ox_math.vm_vec_scale;
  [%expect {| vm_vec_scale random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_mag_quick parity C vs Ox" =
  run_random_vec3_to_scalar
    ~name:"vm_vec_mag_quick"
    ~seed:"vm-vec-mag-quick-seed-v1"
    ~test_count:5000
    c_vm_vec_mag_quick
    Ox_math.vm_vec_mag_quick;
  [%expect {| vm_vec_mag_quick random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_dist_quick parity C vs Ox" =
  run_random_two_vec3_to_scalar
    ~name:"vm_vec_dist_quick"
    ~seed:"vm-vec-dist-quick-seed-v1"
    ~test_count:5000
    c_vm_vec_dist_quick
    Ox_math.vm_vec_dist_quick;
  [%expect {| vm_vec_dist_quick random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_dotprod parity C vs Ox" =
  run_random_two_vec3_to_scalar
    ~name:"vm_vec_dotprod"
    ~seed:"vm-vec-dotprod-seed-v1"
    ~test_count:5000
    c_vm_vec_dotprod
    Ox_math.vm_vec_dotprod;
  [%expect {| vm_vec_dotprod random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_dot3 parity C vs Ox" =
  run_random_two_vec3_to_scalar
    ~name:"vm_vec_dot3"
    ~seed:"vm-vec-dot3-seed-v1"
    ~test_count:5000
    c_vm_vec_dot3
    (fun (x, y, z) (vx, vy, vz) -> Ox_math.vm_vec_dot3 x y z (vx, vy, vz));
  [%expect {| vm_vec_dot3 random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_crossprod parity C vs Ox" =
  run_random_vec3_binop
    ~name:"vm_vec_crossprod"
    ~seed:"vm-vec-crossprod-seed-v1"
    ~test_count:5000
    c_vm_vec_crossprod
    Ox_math.vm_vec_crossprod;
  [%expect {| vm_vec_crossprod random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_copy_normalize_quick parity C vs Ox" =
  run_random_vec_copy_normalize_quick
    ~name:"vm_vec_copy_normalize_quick"
    ~seed:"vm-vec-copy-normalize-quick-seed-v1"
    ~test_count:5000
    c_vm_vec_copy_normalize_quick
    Ox_math.vm_vec_copy_normalize_quick;
  [%expect {| vm_vec_copy_normalize_quick random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_normalize_quick parity C vs Ox" =
  run_random_vec_copy_normalize_quick
    ~name:"vm_vec_normalize_quick"
    ~seed:"vm-vec-normalize-quick-seed-v1"
    ~test_count:5000
    c_vm_vec_normalize_quick
    Ox_math.vm_vec_normalize_quick;
  [%expect {| vm_vec_normalize_quick random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_normalized_dir_quick parity C vs Ox" =
  run_random_vec_normalized_dir_quick
    ~name:"vm_vec_normalized_dir_quick"
    ~seed:"vm-vec-normalized-dir-quick-seed-v1"
    ~test_count:5000
    c_vm_vec_normalized_dir_quick
    Ox_math.vm_vec_normalized_dir_quick;
  [%expect {| vm_vec_normalized_dir_quick random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_vec_make parity C vs Ox" =
  run_random_make3
    ~name:"vm_vec_make"
    ~seed:"vm-vec-make-seed-v1"
    ~test_count:5000
    vec3_gen
    c_vm_vec_make
    Ox_math.vm_vec_make;
  [%expect {| vm_vec_make random total=5000 mismatches=0 |}]

let%expect_test "randomized vm_angvec_make parity C vs Ox" =
  run_random_make3
    ~name:"vm_angvec_make"
    ~seed:"vm-angvec-make-seed-v1"
    ~test_count:5000
    ang3_gen
    c_vm_angvec_make
    Ox_math.vm_angvec_make;
  [%expect {| vm_angvec_make random total=5000 mismatches=0 |}]
