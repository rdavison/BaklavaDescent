(* Bridge adapter for collision logic.
   Serializes the effect tree to a flat int array for C consumption.

   Output array layout:
   [0]   = new_shields
   [1]   = set_boss_been_hit (0 or 1)
   [2..] = serialized result_node *)

let cd_apply_damage_to_robot_d1
    flags shields damage
    is_boss is_multiplayer
    obj_id killer_objnum =
  let new_shields, boss_hit, tree =
    Ox_collide.apply_damage_to_robot_d1
      ~flags ~shields ~damage
      ~is_boss:(is_boss <> 0) ~is_multiplayer:(is_multiplayer <> 0)
      ~obj_id ~killer_objnum
  in
  let tree_size = Ox_collide.node_size tree in
  let buf = Array.create ~len:(2 + tree_size) 0 in
  buf.(0) <- new_shields;
  buf.(1) <- (if boss_hit then 1 else 0);
  let _end_pos = Ox_collide.serialize_node buf 2 tree in
  buf

let () =
  Callback.register "cd_apply_damage_to_robot_d1" cd_apply_damage_to_robot_d1
