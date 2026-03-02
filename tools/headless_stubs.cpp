/*
 * headless_stubs.cpp - No-op stubs for platform backends
 *
 * Replaces SDL graphics, OpenAL audio, FluidSynth MIDI, and unix entry point
 * so headless_replay can link without pulling in those dependencies.
 */

#include "platform/platform.h"
#include "platform/i_sound.h"

/* Globals normally defined in sdl/gr_sdl.cpp */
int WindowWidth = 320;
int WindowHeight = 200;
int BestFit = 0;
int Fullscreen = 0;
int SwapInterval = 0;
/* platform/platform.h stubs (normally sdl/gr_sdl.cpp) */
/* Note: plat_read_chocolate_cfg, plat_save_chocolate_cfg, NoOpenGL
 * are already defined in platform/platform_config.cpp */
int plat_init() { return 0; }
int plat_create_window() { return 0; }
void plat_close_window() {}
void plat_close() {}
void plat_display_error(const char* msg) {}
void plat_update_window() {}
int plat_check_gr_mode(int mode) { return 0; }
int plat_set_gr_mode(int mode) { return 0; }
void plat_write_palette(int start, int end, uint8_t* data) {}
void plat_blank_palette() {}
void plat_read_palette(uint8_t* dest) {}
void plat_wait_for_vbl() {}
void plat_present_canvas(int sync) {}
void plat_blit_canvas(grs_canvas *canv) {}
void plat_do_events() {}
void plat_set_mouse_relative_mode(int state) {}

/* platform/i_sound.h stubs (normally openal/al_sound.cpp + al_player.cpp) */
int plat_init_audio() { return 1; }
void plat_close_audio() {}
int plat_get_new_sound_handle() { return 0; }
void plat_set_sound_data(int handle, unsigned char* data, int length, int sampleRate) {}
void plat_set_sound_position(int handle, int volume, int angle) {}
void plat_set_sound_angle(int handle, int angle) {}
void plat_set_sound_volume(int handle, int volume) {}
void plat_set_sound_loop_points(int handle, int start, int end) {}
void plat_start_sound(int handle, int loop) {}
void plat_stop_sound(int handle) {}
int plat_check_if_sound_playing(int handle) { return 0; }
int plat_check_if_sound_finished(int handle) { return 1; }

int plat_start_midi(MidiSequencer *sequencer) { return 0; }
uint32_t plat_get_preferred_midi_sample_rate() { return 48000; }
void plat_close_midi() {}
void plat_set_music_volume(int volume) {}
void plat_start_midi_song(HMPFile* song, bool loop) {}
void plat_stop_midi_song() {}

void midi_set_music_samplerate(void* opaquesource, uint32_t samplerate) {}
bool midi_queue_slots_available(void* opaquesource) { return false; }
void midi_dequeue_midi_buffers(void* opaquesource) {}
void midi_queue_buffer(void* opaquesource, int numSamples, uint16_t* data) {}
void* midi_start_source() { return nullptr; }
void midi_stop_source(void* opaquesource) {}
void midi_check_status(void* opaquesource) {}
bool midi_check_finished(void* opaquesource) { return true; }

void plat_start_hq_song(int sample_rate, std::vector<float>&& song_data, bool loop) {}
void plat_stop_hq_song() {}

/* Mouse stubs (normally sdl/mouse_sdl.cpp) */
#include "platform/mouse.h"
void mouse_get_delta(int* dx, int* dy) { *dx = 0; *dy = 0; }
int mouse_get_btns() { return 0; }

/* MVE audio stubs */
void mvesnd_init_audio(int format, int samplerate, int stereo) {}
void mvesnd_queue_audio_buffer(int len, short* data) {}
void mvesnd_close() {}
void mvesnd_pause() {}
void mvesnd_resume() {}
