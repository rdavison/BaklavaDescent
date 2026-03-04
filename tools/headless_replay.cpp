/*
 * headless_replay.cpp - Headless replay binary for parity testing
 *
 * Replays recorded inputs through game simulation without graphics/audio.
 * Produces state logs for offline comparison between C and OCaml builds.
 *
 * Usage:
 *   headless_replay -replay <file> [-state-log <file>]
 */

#include <cstdio>
#include <cstring>
#include <csignal>

#include "misc/error.h"
#include "platform/timer.h"
#include "cfile/cfile.h"
#include "main_shared/text.h"
#include "main_shared/inferno_shared.h"
#include "main_d2/bm.h"
#include "main_d2/mission.h"
#include "main_d2/gameseq.h"
#include "main_d2/game.h"
#include "main_d2/ai.h"
#include "main_d2/weapon.h"
#include "main_d2/morph.h"
#include "main_d2/fuelcen.h"
#include "main_d2/cntrlcen.h"
#include "main_d2/inferno.h"
#include "main_shared/effects.h"
#include "main_shared/texmerge.h"
#include "2d/gr.h"
#include "main_d2/gamepal.h"
#include "main_d2/gamefont.h"
#include "main_d2/gamesave.h"
#include "main_d2/player.h"
#include "main_d2/object.h"

#ifdef USE_OX_BRIDGE
#include "ox/bridge.h"
#endif

#ifdef OX_REPLAY
#include "ox/input_replayer.h"
#endif

/* Functions declared only in gameseq.cpp, not in headers */
extern void gameseq_init_network_players();
extern void copy_defaults_to_robot_all(void);
extern void init_stuck_objects(void);
extern void reset_network_objects(void);
extern void set_sound_sources(void);

/* Functions from other .cpp files without public header declarations */
extern void load_bitmap_replacements(char *level_name);
extern void load_robot_replacements(char *level_name);
extern int Robot_replacements_loaded;
extern void read_hamfile(void);
extern void load_endlevel_data(int level_num);

/* GameLoop is forward-declared in game.cpp, not in game.h */
extern void GameLoop(int RenderFlag, int ReadControlsFlag);

int main(int argc, char *argv[])
{
#ifndef OX_REPLAY
	fprintf(stderr, "headless_replay: built without OX_REPLAY support\n");
	return 1;
#else
	const char *replay_file = nullptr;
	const char *state_log_file = nullptr;

	/* Parse args */
	for (int i = 1; i < argc; i++) {
		if (strcmp(argv[i], "-replay") == 0 && i + 1 < argc) {
			replay_file = argv[++i];
		} else if (strcmp(argv[i], "-state-log") == 0 && i + 1 < argc) {
			state_log_file = argv[++i];
		} else {
			fprintf(stderr, "Usage: headless_replay -replay <file> [-state-log <file>]\n");
			return 1;
		}
	}

	if (!replay_file) {
		fprintf(stderr, "Usage: headless_replay -replay <file> [-state-log <file>]\n");
		return 1;
	}

#ifdef USE_OX_BRIDGE
	if (cd_ox_init_runtime(argv[0]) != 0) {
		fprintf(stderr, "headless_replay: failed to init OCaml runtime\n");
		return 1;
	}
#endif

	/* Minimal engine init */
	error_init(NULL, NULL);
	timer_init();
	gr_init(0);
	cfile_init("descent2.hog");
	load_text(649);
	gr_use_palette_table(DEFAULT_PALETTE);
	gamefont_init();

	/* Load game data (Robot_info[], Weapon_info[] from HAM) */
	bm_init();

	/* Init replayer */
	if (ox_replayer_init(replay_file, state_log_file) < 0) {
		fprintf(stderr, "headless_replay: failed to init replayer from '%s'\n", replay_file);
		return 1;
	}

	int level_num = ox_replayer_get_level();
	Difficulty_level = ox_replayer_get_difficulty();

	fprintf(stderr, "headless_replay: level=%d difficulty=%d\n", level_num, Difficulty_level);

	/* Load level - inline version of LoadLevel that skips UI rendering */
	build_mission_list(0);
	load_mission(0);
	{
		char *level_name = Level_names[level_num - 1];
		player save_player = Players[Player_num];

		int load_ret = load_level(level_name);
		if (load_ret)
			Error("Couldn't load level file <%s>, error = %d", level_name, load_ret);

		Current_level_num = level_num;
		load_palette(Current_level_palette, 1, 1);

		if (CurrentDataVersion == DataVer::DEMO)
			load_endlevel_data(level_num);

		load_bitmap_replacements(level_name);
		if (Robot_replacements_loaded) {
			read_hamfile();
			Robot_replacements_loaded = 0;
		}
		load_robot_replacements(level_name);
		reset_network_objects();
		Players[Player_num] = save_player;
		set_sound_sources();
	}

	/* Init game state (mirrors StartNewLevelSub) */
	InitPlayerObject();
	Viewer = ConsoleObject;
	gameseq_init_network_players();
	init_player_stats_level(0);
	init_robots_for_level();
	init_ai_objects();
	init_smega_detonates();
	init_morphs();
	init_all_matcens();
	init_thief_for_level();
	init_stuck_objects();
	reset_special_effects();
	copy_defaults_to_robot_all();
	init_controlcen_for_level();
	texmerge_init(10);

	/* Restore exact snapshot from recording */
	ox_replayer_restore_initial_state();

	/* Set game mode */
	Function_mode = FMODE_GAME;

	/* Ignore SIGTRAP from Int3() calls - non-fatal debug traps */
	signal(SIGTRAP, SIG_IGN);

	fprintf(stderr, "headless_replay: starting replay loop\n");

	int frame_count = 0;
	/* Run game loop until replay exhausted (replayer sets Function_mode = FMODE_MENU) */
	while (Function_mode == FMODE_GAME) {
		GameLoop(0, 0);
		frame_count++;
		if (frame_count % 100 == 0)
			fprintf(stderr, "headless_replay: frame %d\n", frame_count);
	}

	fprintf(stderr, "headless_replay: finished after %d frames\n", frame_count);

	ox_replayer_close();

	return 0;
#endif /* OX_REPLAY */
}
