(* Pure OCaml game logic for gameseq functions.
   Ported from main_d2/gameseq.cpp and main_d2/multi.cpp *)

let pow_shield_boost = 2
let pow_flag_blue = 46
let pow_flag_red = 47
let obj_powerup = 7

(* -- Algebraic effects -------------------------------------------------- *)

type _ Effect.t +=
  | Fetch_bash_to_shield_data : int -> int array Effect.t
  | Write_bash_to_shield : int array -> unit Effect.t
  | Fetch_stuck_objects_data : unit -> int array Effect.t
  | Write_clear_stuck_objects : int array -> unit Effect.t
  | Fetch_init_ammo_energy_data : unit -> int array Effect.t
  | Write_init_ammo_energy : int array -> unit Effect.t
  | Fetch_filter_objects_data : unit -> int array Effect.t

(* bash_to_shield: Replace a powerup object with a shield boost.
   Zeroes out PowerupsInMine/MaxPowerupsAllowed for old type,
   sets id to POW_SHIELD_BOOST, updates vclip info.
   D2 only (NETWORK version from multi.cpp). *)
let bash_to_shield ~objnum =
  (* Fetch [obj_id; shield_vclip_num; shield_frame_time] from C globals *)
  let data = Effect.perform (Fetch_bash_to_shield_data objnum) in
  let old_type = data.(0) in
  let shield_vclip_num = data.(1) in
  let shield_frame_time = data.(2) in
  (* Write back: [objnum; old_type; new_id; vclip_num; frametime] *)
  Effect.perform (Write_bash_to_shield
    [| objnum; old_type; pow_shield_boost; shield_vclip_num; shield_frame_time |])
;;

(* Constants *)
let max_stuck_objects = 32
let obj_weapon = 5
let flare_id = 9
let f1_0 = 0x10000

(* clear_stuck_objects: Clear out all stuck objects. Called for a new ship.
   Ported from main_d2/wall.cpp.
   Fetches packed array: [num_stuck, then for each of 32 entries: wallnum, objnum, obj_type, obj_id]
   Writes back: array of objnums that should get lifeleft = F1_0/8, followed by new num_stuck *)
let clear_stuck_objects () =
  (* Fetch stuck objects data from C:
     data layout: [num_stuck_objects,
       wallnum_0, objnum_0, obj_type_0, obj_id_0,
       wallnum_1, objnum_1, obj_type_1, obj_id_1,
       ...] *)
  let data = Effect.perform (Fetch_stuck_objects_data ()) in
  let num_stuck = ref data.(0) in
  let writeback = Array.create ~len:(max_stuck_objects + 2) (-1) in
  let wb_count = ref 0 in
  for i = 0 to max_stuck_objects - 1 do
    let base = 1 + (i * 4) in
    let wallnum = data.(base) in
    if wallnum <> -1 then begin
      let objnum = data.(base + 1) in
      let obj_type = data.(base + 2) in
      let obj_id = data.(base + 3) in
      if obj_type = obj_weapon && obj_id = flare_id then begin
        writeback.(!wb_count) <- objnum;
        incr wb_count
      end;
      (* wallnum will be cleared by C write-back handler *)
      num_stuck := !num_stuck - 1
    end
  done;
  (* Pack: [num_flares_to_set, objnum_0, objnum_1, ..., new_num_stuck] *)
  let result = Array.create ~len:(!wb_count + 2) 0 in
  result.(0) <- !wb_count;
  for j = 0 to !wb_count - 1 do
    result.(j + 1) <- writeback.(j)
  done;
  result.(!wb_count + 1) <- !num_stuck;
  (* Assert: num_stuck should be 0 *)
  if !num_stuck <> 0 then
    Printf.eprintf "[OX] clear_stuck_objects: Num_stuck_objects=%d, expected 0\n" !num_stuck;
  Effect.perform (Write_clear_stuck_objects result)
;;

(* init_ammo_and_energy: Ensure player has at least minimum energy, shields, and concussion ammo.
   Ported from main_d1/gameseq.cpp and main_d2/gameseq.cpp.
   Fetch data: [energy, shields, secondary_ammo_0, initial_energy, starting_shields, ndl, difficulty_level]
   Write back: [energy, shields, secondary_ammo_0] *)
(* special_reset_objects: Rebuild the free object list and update Highest_object_index.
   Ported from main_d1/object.cpp and main_d2/object.cpp (identical). *)

type _ Effect.t +=
  | Fetch_special_reset_objects_data : unit -> int array Effect.t
  | Write_special_reset_objects : int array -> unit Effect.t

let max_objects = 350
let obj_none = 255

let special_reset_objects () =
  (* Fetch: array of 350 ints = Objects[0..349].type *)
  let obj_types = Effect.perform (Fetch_special_reset_objects_data ()) in
  (* Assert Objects[0].type != OBJ_NONE *)
  if obj_types.(0) = obj_none then
    Printf.eprintf "[OX] special_reset_objects: Assert failed: Objects[0].type == OBJ_NONE\n";
  (* Rebuild free list: iterate from MAX_OBJECTS-1 down to 0 *)
  let num_objects = ref max_objects in
  let highest = ref 0 in
  let free_list = Array.create ~len:max_objects (-1) in
  for i = max_objects - 1 downto 0 do
    if obj_types.(i) = obj_none then begin
      num_objects := !num_objects - 1;
      free_list.(!num_objects) <- i
    end else begin
      if i > !highest then
        highest := i
    end
  done;
  (* Write back: [num_objects, highest_object_index, free_list[num_objects], free_list[num_objects+1], ...] *)
  let n_free = max_objects - !num_objects in
  let result = Array.create ~len:(2 + n_free) 0 in
  result.(0) <- !num_objects;
  result.(1) <- !highest;
  for j = 0 to n_free - 1 do
    result.(2 + j) <- free_list.(!num_objects + j)
  done;
  Effect.perform (Write_special_reset_objects result)
;;

(* update_player_stats: Update time_level/time_total, rolling over hours.
   Ported from main_d1/gameseq.cpp and main_d2/gameseq.cpp (identical logic).
   Fetch data: [frame_time, time_level, hours_level, time_total, hours_total]
   Write back: [time_level, hours_level, time_total, hours_total] *)

type _ Effect.t +=
  | Fetch_update_player_stats_data : unit -> int array Effect.t
  | Write_update_player_stats : int array -> unit Effect.t

let i2f x = x lsl 16

let update_player_stats () =
  let data = Effect.perform (Fetch_update_player_stats_data ()) in
  let frame_time = data.(0) in
  let time_level = ref data.(1) in
  let hours_level = ref data.(2) in
  let time_total = ref data.(3) in
  let hours_total = ref data.(4) in
  time_level := !time_level + frame_time;
  if !time_level > i2f 3600 then begin
    time_level := !time_level - i2f 3600;
    hours_level := !hours_level + 1
  end;
  time_total := !time_total + frame_time;
  if !time_total > i2f 3600 then begin
    time_total := !time_total - i2f 3600;
    hours_total := !hours_total + 1
  end;
  Effect.perform (Write_update_player_stats
    [| !time_level; !hours_level; !time_total; !hours_total |])
;;

(* verify_console_object: Verify Player_num and ConsoleObject are valid,
   then set ConsoleObject = &Objects[Players[Player_num].objnum].
   Ported from main_d1/gameseq.cpp and main_d2/gameseq.cpp (identical logic). *)

type _ Effect.t +=
  | Fetch_verify_console_object_data : unit -> int array Effect.t
  | Write_verify_console_object : int -> unit Effect.t

let obj_player = 4

let verify_console_object () =
  (* Fetch [Player_num, objnum, obj_type, obj_id] *)
  let data = Effect.perform (Fetch_verify_console_object_data ()) in
  let player_num = data.(0) in
  let objnum = data.(1) in
  let obj_type = data.(2) in
  let obj_id = data.(3) in
  (* Assert(Player_num > -1) *)
  if player_num <= -1 then
    Printf.eprintf "[OX] verify_console_object: Assert failed: Player_num=%d <= -1\n" player_num;
  (* Assert(Players[Player_num].objnum > -1) *)
  if objnum <= -1 then
    Printf.eprintf "[OX] verify_console_object: Assert failed: objnum=%d <= -1\n" objnum;
  (* Set ConsoleObject = &Objects[Players[Player_num].objnum] *)
  Effect.perform (Write_verify_console_object objnum);
  (* Assert(ConsoleObject->type == OBJ_PLAYER) *)
  if obj_type <> obj_player then
    Printf.eprintf "[OX] verify_console_object: Assert failed: type=%d != OBJ_PLAYER\n" obj_type;
  (* Assert(ConsoleObject->id == Player_num) *)
  if obj_id <> player_num then
    Printf.eprintf "[OX] verify_console_object: Assert failed: id=%d != Player_num=%d\n" obj_id player_num
;;

(* init_player_object: Set up Player_num & ConsoleObject.
   If Player_num != 0, copy Players[Player_num] to Players[0] and set Player_num = 0.
   Then set Players[0].objnum = 0, ConsoleObject = &Objects[0], and object fields.
   Ported from main_d1/gameseq.cpp and main_d2/gameseq.cpp (identical logic). *)

type _ Effect.t +=
  | Fetch_init_player_object_data : unit -> int array Effect.t
  | Write_init_player_object : int array -> unit Effect.t

let max_players = 8
let ct_flying = 4
let mt_physics = 1

let init_player_object () =
  (* Fetch [Player_num] *)
  let data = Effect.perform (Fetch_init_player_object_data ()) in
  let player_num = data.(0) in
  (* Assert(Player_num >= 0 && Player_num < MAX_PLAYERS) *)
  if player_num < 0 || player_num >= max_players then
    Printf.eprintf "[OX] init_player_object: Assert failed: Player_num=%d out of range\n" player_num;
  (* Write back [original_player_num, OBJ_PLAYER, CT_FLYING, MT_PHYSICS]
     C handler: if player_num != 0, copies Players[player_num] to Players[0], sets Player_num = 0
     Then sets Players[0].objnum = 0, ConsoleObject = &Objects[0], and object fields *)
  Effect.perform (Write_init_player_object
    [| player_num; obj_player; ct_flying; mt_physics |])
;;

let init_ammo_and_energy () =
  let data = Effect.perform (Fetch_init_ammo_energy_data ()) in
  let energy = data.(0) in
  let shields = data.(1) in
  let secondary_ammo_0 = data.(2) in
  let initial_energy = data.(3) in
  let starting_shields = data.(4) in
  let ndl = data.(5) in
  let difficulty_level = data.(6) in
  let new_energy = if energy < initial_energy then initial_energy else energy in
  let new_shields = if shields < starting_shields then starting_shields else shields in
  let min_ammo = 2 + ndl - difficulty_level in
  let new_ammo = if secondary_ammo_0 < min_ammo then min_ammo else secondary_ammo_0 in
  Effect.perform (Write_init_ammo_energy [| new_energy; new_shields; new_ammo |])
;;

(* gameseq_remove_unused_players: Remove non-player-0 player objects in single-player.
   In single-player mode (NETWORK OFF), deletes Players[i].objnum for i=1..NumNetPlayerPositions-1.
   Ported from main_d1/gameseq.cpp and main_d2/gameseq.cpp (identical logic, non-NETWORK path). *)

type _ Effect.t +=
  | Fetch_remove_unused_players_data : unit -> int array Effect.t
  | Write_remove_unused_players : int array -> unit Effect.t

let gameseq_remove_unused_players () =
  (* Fetch [NumNetPlayerPositions, Players[1].objnum, Players[2].objnum, ..., Players[7].objnum] *)
  let data = Effect.perform (Fetch_remove_unused_players_data ()) in
  let num_net_player_positions = data.(0) in
  (* Collect objnums to delete: indices 1..NumNetPlayerPositions-1 *)
  let to_delete = Array.create ~len:num_net_player_positions 0 in
  let count = ref 0 in
  for i = 1 to num_net_player_positions - 1 do
    to_delete.(!count) <- data.(i);  (* data.(i) = Players[i].objnum *)
    incr count
  done;
  (* Write back: [count, objnum_0, objnum_1, ...] — C handler calls obj_delete on each *)
  let result = Array.create ~len:(!count + 1) 0 in
  result.(0) <- !count;
  for j = 0 to !count - 1 do
    result.(j + 1) <- to_delete.(j)
  done;
  Effect.perform (Write_remove_unused_players result)
;;

(* free_object_slots: Scan the object list, freeing down to num_used objects.
   Returns number of slots freed (D2) or 0 (D1, which returns void).
   Ported from main_d1/object.cpp and main_d2/object.cpp.
   Fetch data: [highest_object_index, is_d2, then per-object: type, flags, id, delete_objnum]
   Write back: [return_value, n_marked, objnum_0, objnum_1, ...] *)

type _ Effect.t +=
  | Fetch_free_object_slots_data : unit -> int array Effect.t
  | Write_free_object_slots : int array -> unit Effect.t

let obj_wall = 0
let obj_fireball = 1
let obj_debris = 8
let obj_flare = 10
let of_should_be_dead = 2

let free_object_slots ~num_used =
  let data = Effect.perform (Fetch_free_object_slots_data ()) in
  let highest = data.(0) in
  let is_d2 = data.(1) <> 0 in
  let num_already_free = ref (max_objects - highest - 1) in
  if max_objects - !num_already_free < num_used then
    Effect.perform (Write_free_object_slots [| 0; 0 |])
  else begin
    let obj_list = Array.create ~len:max_objects 0 in
    let olind = ref 0 in
    let early_ret = ref false in
    let ret_val = ref 0 in
    let i = ref 0 in
    while !i <= highest && not !early_ret do
      let base = 2 + !i * 4 in
      let obj_type = data.(base) in
      let obj_flags = data.(base + 1) in
      if obj_flags land of_should_be_dead <> 0 then begin
        num_already_free := !num_already_free + 1;
        if is_d2 && max_objects - !num_already_free < num_used then begin
          ret_val := !num_already_free;
          early_ret := true
        end
      end else begin
        (match obj_type with
        | t when t = obj_none ->
          num_already_free := !num_already_free + 1;
          if max_objects - !num_already_free < num_used then begin
            ret_val := 0;
            early_ret := true
          end
        | t when t = obj_wall || t = obj_flare ->
          () (* Int3() - curious *)
        | t when t = obj_fireball || t = obj_weapon || t = obj_debris ->
          obj_list.(!olind) <- !i;
          olind := !olind + 1
        | _ -> () (* OBJ_ROBOT, OBJ_HOSTAGE, OBJ_PLAYER, etc. *)
        )
      end;
      i := !i + 1
    done;
    if !early_ret then
      Effect.perform (Write_free_object_slots [| !ret_val; 0 |])
    else begin
      let num_to_free = ref (max_objects - num_used - !num_already_free) in
      let original_num_to_free = !num_to_free in
      if !num_to_free > !olind then
        num_to_free := !olind;
      let mark_dead = Array.create ~len:max_objects 0 in
      let n_marked = ref 0 in
      (* Pass 1: free DEBRIS *)
      for j = 0 to !num_to_free - 1 do
        let base = 2 + obj_list.(j) * 4 in
        if data.(base) = obj_debris then begin
          num_to_free := !num_to_free - 1;
          mark_dead.(!n_marked) <- obj_list.(j);
          n_marked := !n_marked + 1
        end
      done;
      if !num_to_free > 0 then begin
        (* Pass 2: free FIREBALL with delete_objnum == -1 *)
        for j = 0 to !num_to_free - 1 do
          let base = 2 + obj_list.(j) * 4 in
          let obj_type = data.(base) in
          let delete_objnum = data.(base + 3) in
          if obj_type = obj_fireball && delete_objnum = -1 then begin
            num_to_free := !num_to_free - 1;
            mark_dead.(!n_marked) <- obj_list.(j);
            n_marked := !n_marked + 1
          end
        done;
        if !num_to_free > 0 then begin
          (* Pass 3: free WEAPON with id == FLARE_ID *)
          for j = 0 to !num_to_free - 1 do
            let base = 2 + obj_list.(j) * 4 in
            let obj_type = data.(base) in
            let obj_id = data.(base + 2) in
            if obj_type = obj_weapon && obj_id = flare_id then begin
              num_to_free := !num_to_free - 1;
              mark_dead.(!n_marked) <- obj_list.(j);
              n_marked := !n_marked + 1
            end
          done;
          if !num_to_free > 0 then begin
            (* Pass 4: free WEAPON with id != FLARE_ID *)
            for j = 0 to !num_to_free - 1 do
              let base = 2 + obj_list.(j) * 4 in
              let obj_type = data.(base) in
              let obj_id = data.(base + 2) in
              if obj_type = obj_weapon && obj_id <> flare_id then begin
                num_to_free := !num_to_free - 1;
                mark_dead.(!n_marked) <- obj_list.(j);
                n_marked := !n_marked + 1
              end
            done
          end
        end
      end;
      let rv = if is_d2 then original_num_to_free - !num_to_free else 0 in
      let result = Array.create ~len:(2 + !n_marked) 0 in
      result.(0) <- rv;
      result.(1) <- !n_marked;
      for j = 0 to !n_marked - 1 do
        result.(2 + j) <- mark_dead.(j)
      done;
      Effect.perform (Write_free_object_slots result)
    end
  end
;;

(* copy_defaults_to_robot: Set robot shields from Robot_info defaults.
   D1: just sets shields = robptr->strength.
   D2: additionally adjusts for thief/companion/boss based on level/difficulty.
   Ported from main_d1/gameseq.cpp and main_d2/gameseq.cpp. *)

type _ Effect.t +=
  | Fetch_copy_defaults_to_robot_data : int -> int array Effect.t
  | Write_copy_defaults_to_robot : int array -> unit Effect.t

let obj_robot = 2
let ndl_const = 5  (* NDL = NUM_DIFFICULTY_LEVELS = 5 *)

let copy_defaults_to_robot ~objnum =
  (* Fetch: [obj_type, obj_id, n_robot_types, strength, is_thief, is_companion,
             boss_flag, current_level_num, difficulty_level, is_d2] *)
  let data = Effect.perform (Fetch_copy_defaults_to_robot_data objnum) in
  let obj_type = data.(0) in
  let obj_id = data.(1) in
  let n_robot_types = data.(2) in
  let strength = data.(3) in
  let is_thief = data.(4) <> 0 in
  let is_companion = data.(5) <> 0 in
  let boss_flag = data.(6) <> 0 in
  let current_level_num = data.(7) in
  let difficulty_level = data.(8) in
  let is_d2 = data.(9) <> 0 in
  (* Assert(objp->type == OBJ_ROBOT) *)
  if obj_type <> obj_robot then
    Printf.eprintf "[OX] copy_defaults_to_robot: Assert: type=%d != OBJ_ROBOT\n" obj_type;
  (* Assert(objid < N_robot_types) *)
  if obj_id >= n_robot_types then
    Printf.eprintf "[OX] copy_defaults_to_robot: Assert: id=%d >= N_robot_types=%d\n" obj_id n_robot_types;
  let shields = ref strength in
  if is_d2 then begin
    (* D2: Boost shield for Thief and Buddy based on level *)
    if is_thief || is_companion then begin
      shields := !shields * (abs current_level_num + 7) / 8;
      if is_companion then begin
        match difficulty_level with
        | 0 -> shields := i2f 20000  (* Trainee, basically unkillable *)
        | 1 -> shields := !shields * 3  (* Rookie *)
        | 2 -> shields := !shields * 2  (* Hotshot *)
        | _ -> ()
      end
    end else if boss_flag then
      shields := !shields / (ndl_const + 3) * (difficulty_level + 4);
    (* Additional wimpification of bosses at Trainee *)
    if boss_flag && difficulty_level = 0 then
      shields := !shields / 2
  end;
  (* D1: just shields = robptr->strength, no adjustments *)
  Effect.perform (Write_copy_defaults_to_robot [| objnum; !shields |])
;;

(* copy_defaults_to_robot_all: Copy all values from Robot_info to all robot instances.
   Iterates all objects up to Highest_object_index, calling copy_defaults_to_robot
   for each OBJ_ROBOT. Called at level load time.
   Ported from main_d1/gameseq.cpp and main_d2/gameseq.cpp (identical logic). *)
let copy_defaults_to_robot_all () =
  (* Reuse Fetch_filter_objects_data: [highest_object_index, type_0, id_0, type_1, id_1, ...] *)
  let data = Effect.perform (Fetch_filter_objects_data ()) in
  let highest_object_index = data.(0) in
  for i = 0 to highest_object_index do
    let obj_type = data.(1 + i * 2) in
    if obj_type = obj_robot then
      copy_defaults_to_robot ~objnum:i
  done
;;

(* filter_objects_from_level: Remove flag powerups from single-player levels.
   Iterates all objects up to Highest_object_index and bashes any
   POW_FLAG_RED or POW_FLAG_BLUE powerups to shield boosts.
   D2 only. Ported from main_d2/gameseq.cpp. *)
let filter_objects_from_level () =
  (* Fetch [highest_object_index, type_0, id_0, type_1, id_1, ...] *)
  let data = Effect.perform (Fetch_filter_objects_data ()) in
  let highest_object_index = data.(0) in
  for i = 0 to highest_object_index do
    let obj_type = data.(1 + i * 2) in
    let obj_id = data.(1 + i * 2 + 1) in
    if obj_type = obj_powerup then
      if obj_id = pow_flag_red || obj_id = pow_flag_blue then
        bash_to_shield ~objnum:i
  done
;;
