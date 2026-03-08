(* Bridge adapter for morph functions.
   Uses algebraic effects: OCaml performs effects, C handler executes them. *)

(* C external for fetching submodel vertex data from polymodel bytecode *)
external fetch_submodel_vertices : int -> int -> int array
  = "cd_ox_effect_morph_fetch_submodel_vertices"

(* Effect handler *)
let morph_effect_handler
  : type a. a Effect.t -> ((a, _) Effect.Deep.continuation -> _) option
  =
  fun eff ->
  match eff with
  | Ox_morph.Fetch_submodel_vertices (model_num, submodel_num) ->
    Some
      (fun k ->
        let verts = fetch_submodel_vertices model_num submodel_num in
        Effect.Deep.continue k verts)
  | _ -> None
;;

(* Bridge function: C calls this, OCaml computes find_min_max *)
let cd_find_min_max model_num submodel_num =
  try
    Effect.Deep.match_with
      (fun () ->
         Ox_morph.find_min_max_for_model ~model_num ~submodel_num)
      ()
      { retc = (fun x -> x)
      ; exnc = raise
      ; effc = (fun (type a) (eff : a Effect.t) -> morph_effect_handler eff)
      }
  with exn ->
    Printf.eprintf "[OX] find_min_max exception: %s\n" (Exn.to_string exn);
    [| 0; 0; 0; 0; 0; 0 |]
;;

(* Bridge function: C calls this with packed morph data, OCaml computes init_points *)
let cd_init_points (data : int array) : int array =
  try
    Ox_morph.init_points data
  with exn ->
    Printf.eprintf "[OX] init_points exception: %s\n" (Exn.to_string exn);
    Out_channel.flush stderr;
    (* Return zeroed output *)
    let nverts = data.(4) in
    Array.create ~len:(1 + nverts * 7) 0
;;

(* Bridge function: C calls this with packed morph data, OCaml computes update_points *)
let cd_update_points (data : int array) : int array =
  try
    Ox_morph.update_points data
  with exn ->
    Printf.eprintf "[OX] update_points exception: %s\n" (Exn.to_string exn);
    Out_channel.flush stderr;
    (* Return identity: n_morphing_points unchanged, copy times/vecs from input *)
    let nverts = data.(1) in
    let out = Array.create ~len:(1 + nverts * 4) 0 in
    out.(0) <- data.(2);
    for v = 0 to nverts - 1 do
      let ibase = 3 + v * 10 in
      let obase = 1 + v * 4 in
      out.(obase) <- data.(ibase);
      out.(obase + 1) <- data.(ibase + 1);
      out.(obase + 2) <- data.(ibase + 2);
      out.(obase + 3) <- data.(ibase + 3)
    done;
    out
;;

let register_callbacks () =
  Callback.register "cd_find_min_max" cd_find_min_max;
  Callback.register "cd_init_points" cd_init_points;
  Callback.register "cd_update_points" cd_update_points
;;
