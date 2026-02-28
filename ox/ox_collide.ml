(* Pure game logic for collision / damage.
   D1 only -- no ox_math dependency needed. *)

(* Object flags matching main_d1/object.h *)
let of_exploding = 1
let of_destroyed = 4

(* -- Algebraic effects for side effects -------------------------------- *)

type _ Effect.t +=
  | Increment_kills : unit Effect.t
  | Start_boss_death : int -> unit Effect.t
  | Explode_object : int -> unit Effect.t
  | Send_net_robot_explode : (int * int) -> unit Effect.t
  | Query_multi_explode : (int * int) -> bool Effect.t

(* -- Pure decision logic ----------------------------------------------- *)

let apply_damage_to_robot_d1
    ~flags ~shields ~damage
    ~is_boss ~is_multiplayer
    ~obj_id ~killer_objnum =
  (* Robot already exploding? *)
  if flags land of_exploding <> 0 then
    (shields, false, 0)
  (* Robot already dead? *)
  else if shields < 0 then
    (shields, false, 0)
  else begin
    let set_boss_been_hit = is_boss in
    let new_shields = shields - damage in
    if new_shields < 0 then begin
      (* Robot killed *)
      if is_multiplayer then begin
        if Effect.perform (Query_multi_explode (obj_id, killer_objnum)) then begin
          Effect.perform (Send_net_robot_explode (obj_id, killer_objnum));
          (new_shields, set_boss_been_hit, 1)
        end else
          (new_shields, set_boss_been_hit, 0)
      end else begin
        Effect.perform Increment_kills;
        if is_boss then Effect.perform (Start_boss_death obj_id)
        else Effect.perform (Explode_object obj_id);
        (new_shields, set_boss_been_hit, 1)
      end
    end else
      (new_shields, set_boss_been_hit, 0)
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
