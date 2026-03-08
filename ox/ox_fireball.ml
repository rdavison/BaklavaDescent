(* Pure OCaml game logic for fireball/explosion functions.
   Ported from main_d2/fireball.cpp *)

let max_exploding_walls = 10
let sound_exploding_wall = 31
let f1_0 = 0x10000

(* -- Algebraic effects -------------------------------------------------- *)

type _ Effect.t +=
  | Alloc_expl_wall_slot : (int * int) -> int Effect.t
      (* (segnum, sidenum) -> finds free slot in expl_wall_list,
         sets segnum/sidenum/time=0, returns slot index or -1 if full *)
  | Digi_link_sound_to_pos : (int * int * int * int * int * int * int * int) -> unit Effect.t
      (* (sound_id, segnum, sidenum, px, py, pz, forever, max_volume) *)

(* explode_wall: Find a free slot in the exploding walls list,
   set it up, compute center point on side, and play explosion sound.
   Ported from main_d2/fireball.cpp *)
let explode_wall ~segnum ~sidenum =
  (* Find a free slot and set it up *)
  let slot = Effect.perform (Alloc_expl_wall_slot (segnum, sidenum)) in
  if slot = -1 then
    (* No free slot — C would mprintf + Int3 here, but we just return *)
    ()
  else begin
    (* Compute center point on side for sound positioning *)
    let seg_data = Effect.perform (Ox_gameseg.Fetch_segment_data segnum) in
    let sv = Ox_gameseg.side_to_verts.(sidenum) in
    let v i =
      seg_data.(56 + i * 3), seg_data.(56 + i * 3 + 1), seg_data.(56 + i * 3 + 2)
    in
    let px, py, pz =
      Ox_gameseg.compute_center_point_on_side
        ~v0:(v sv.(0)) ~v1:(v sv.(1)) ~v2:(v sv.(2)) ~v3:(v sv.(3))
    in
    (* Play one long sound for whole door wall explosion *)
    Effect.perform
      (Digi_link_sound_to_pos
         (sound_exploding_wall, segnum, sidenum, px, py, pz, 0, f1_0))
  end
;;
