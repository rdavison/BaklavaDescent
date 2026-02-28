(* Bridge adapter for collision logic.
   Uses algebraic effects: OCaml performs effects, C handler executes them. *)

external effect_increment_kills : unit -> unit = "cd_ox_effect_increment_kills"
external effect_start_boss_death : int -> unit = "cd_ox_effect_start_boss_death"
external effect_explode_object : int -> unit = "cd_ox_effect_explode_object"
external effect_send_net_robot_explode : int -> int -> unit = "cd_ox_effect_send_net_robot_explode"
external effect_multi_explode_robot_sub : int -> int -> bool = "cd_ox_effect_multi_explode_robot_sub"

let cd_apply_damage_to_robot_d1
    flags shields damage
    is_boss is_multiplayer
    obj_id killer_objnum =
  let new_shields, boss_hit, ret =
    Effect.Deep.match_with
      (fun () ->
        Ox_collide.apply_damage_to_robot_d1
          ~flags ~shields ~damage
          ~is_boss:(is_boss <> 0) ~is_multiplayer:(is_multiplayer <> 0)
          ~obj_id ~killer_objnum)
      ()
      { retc = (fun x -> x);
        exnc = raise;
        effc = fun (type a) (eff : a Effect.t) ->
          match eff with
          | Ox_collide.Increment_kills ->
            Some (fun (k : (a, _) Effect.Deep.continuation) ->
              effect_increment_kills ();
              Effect.Deep.continue k ())
          | Ox_collide.Start_boss_death obj_id ->
            Some (fun (k : (a, _) Effect.Deep.continuation) ->
              effect_start_boss_death obj_id;
              Effect.Deep.continue k ())
          | Ox_collide.Explode_object obj_id ->
            Some (fun (k : (a, _) Effect.Deep.continuation) ->
              effect_explode_object obj_id;
              Effect.Deep.continue k ())
          | Ox_collide.Send_net_robot_explode (obj_id, killer) ->
            Some (fun (k : (a, _) Effect.Deep.continuation) ->
              effect_send_net_robot_explode obj_id killer;
              Effect.Deep.continue k ())
          | Ox_collide.Query_multi_explode (obj_id, killer) ->
            Some (fun (k : (a, _) Effect.Deep.continuation) ->
              let result = effect_multi_explode_robot_sub obj_id killer in
              Effect.Deep.continue k result)
          | _ -> None }
  in
  (new_shields, (if boss_hit then 1 else 0), ret)

(* get_explosion_vclip: 5 scalar args → int *)
let cd_get_explosion_vclip obj_type stage
    exp1_vclip_num exp2_vclip_num expl_vclip_num =
  Ox_collide.get_explosion_vclip ~obj_type ~stage
    ~exp1_vclip_num ~exp2_vclip_num ~expl_vclip_num

let () =
  Callback.register "cd_apply_damage_to_robot_d1" cd_apply_damage_to_robot_d1;
  Callback.register "cd_get_explosion_vclip" cd_get_explosion_vclip
