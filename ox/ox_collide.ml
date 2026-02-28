(* Pure game logic for collision / damage.
   D1 only -- no ox_math dependency needed. *)

(* Object flags matching main_d1/object.h *)
let of_exploding = 1
let of_destroyed = 4

(* -- Effect tree types ------------------------------------------------ *)

type damage_effect =
  | Increment_kills
  | Start_boss_death of int          (* obj_id *)
  | Explode_object of int            (* obj_id *)
  | Send_net_robot_explode of int * int  (* obj_id, killer *)

type result_node =
  | Leaf of int * damage_effect list        (* return_value, effects *)
  | Query_multi_explode of int * int (* obj_id, killer *)
      * result_node * result_node    (* then_branch, else_branch *)

(* -- Flat-int serialization -------------------------------------------- *)

(* Effect tag encoding:
   0 = Increment_kills        (0 args)
   1 = Start_boss_death       (1 arg: obj_id)
   2 = Explode_object         (1 arg: obj_id)
   3 = Send_net_robot_explode (2 args: obj_id, killer) *)

let serialize_effect buf pos = function
  | Increment_kills ->
    buf.(pos) <- 0;
    pos + 1
  | Start_boss_death obj_id ->
    buf.(pos) <- 1;
    buf.(pos + 1) <- obj_id;
    pos + 2
  | Explode_object obj_id ->
    buf.(pos) <- 2;
    buf.(pos + 1) <- obj_id;
    pos + 2
  | Send_net_robot_explode (obj_id, killer) ->
    buf.(pos) <- 3;
    buf.(pos + 1) <- obj_id;
    buf.(pos + 2) <- killer;
    pos + 3

let rec serialize_node buf pos = function
  | Leaf (ret, effects) ->
    buf.(pos) <- 0;  (* tag = Leaf *)
    buf.(pos + 1) <- ret;
    buf.(pos + 2) <- List.length effects;
    let p = ref (pos + 3) in
    List.iter effects ~f:(fun e -> p := serialize_effect buf !p e);
    !p
  | Query_multi_explode (obj_id, killer, then_branch, else_branch) ->
    buf.(pos) <- 1;  (* tag = Query *)
    buf.(pos + 1) <- obj_id;
    buf.(pos + 2) <- killer;
    (* then_len placeholder at pos+3 *)
    let then_start = pos + 4 in
    let then_end = serialize_node buf then_start then_branch in
    buf.(pos + 3) <- then_end - then_start;
    let else_end = serialize_node buf then_end else_branch in
    else_end

(* Upper bound on serialized size for pre-allocating buffer *)
let rec node_size = function
  | Leaf (_, effects) ->
    3 + List.fold effects ~init:0 ~f:(fun acc e ->
      acc + (match e with
        | Increment_kills -> 1
        | Start_boss_death _ -> 2
        | Explode_object _ -> 2
        | Send_net_robot_explode _ -> 3))
  | Query_multi_explode (_, _, t, e) ->
    4 + node_size t + node_size e

(* -- Pure decision logic ----------------------------------------------- *)

let apply_damage_to_robot_d1
    ~flags ~shields ~damage
    ~is_boss ~is_multiplayer
    ~obj_id ~killer_objnum =
  (* Robot already exploding? *)
  if flags land of_exploding <> 0 then
    (shields, false, Leaf (0, []))
  (* Robot already dead? *)
  else if shields < 0 then
    (shields, false, Leaf (0, []))
  else begin
    let set_boss_been_hit = is_boss in
    let new_shields = shields - damage in
    if new_shields < 0 then begin
      (* Robot killed *)
      if is_multiplayer then
        let then_branch =
          Leaf (1, [ Send_net_robot_explode (obj_id, killer_objnum) ])
        in
        let else_branch = Leaf (0, []) in
        (new_shields, set_boss_been_hit,
         Query_multi_explode (obj_id, killer_objnum,
                              then_branch, else_branch))
      else begin
        let effects =
          [ Increment_kills ] @
          (if is_boss then [ Start_boss_death obj_id ]
           else [ Explode_object obj_id ])
        in
        (new_shields, set_boss_been_hit, Leaf (1, effects))
      end
    end else
      (new_shields, set_boss_been_hit, Leaf (0, []))
  end

(* ── get_explosion_vclip ────────────────────────────────── *)

let obj_robot = 2
let obj_player = 4
let vclip_small_explosion = 2

(* Pure function: extracts vclip_num from pre-extracted scalar args.
   obj_type, stage, exp1_vclip_num, exp2_vclip_num, expl_vclip_num *)
let get_explosion_vclip ~obj_type ~stage
    ~exp1_vclip_num ~exp2_vclip_num ~expl_vclip_num =
  if obj_type = obj_robot then begin
    if stage = 0 && exp1_vclip_num > -1 then exp1_vclip_num
    else if stage = 1 && exp2_vclip_num > -1 then exp2_vclip_num
    else vclip_small_explosion
  end
  else if obj_type = obj_player && expl_vclip_num > -1 then expl_vclip_num
  else vclip_small_explosion
