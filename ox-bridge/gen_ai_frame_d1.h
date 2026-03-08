/* GENERATED FILE - DO NOT EDIT */

#pragma once

#include <stdint.h>
#define AI_FRAME_D1_STATE_SIZE 43

static inline void pack_ai_frame_d1(int32_t* buf, object* obj, ai_static* aip, ai_local* ailp) {
    buf[0] = (int32_t)(aip->SKIP_AI_COUNT);
    buf[1] = (int32_t)(aip->GOAL_STATE);
    buf[2] = (int32_t)(aip->CURRENT_STATE);
    buf[3] = (int32_t)(aip->CLOAKED);
    buf[4] = (int32_t)(aip->CURRENT_GUN);
    buf[5] = (int32_t)(aip->cur_path_index);
    buf[6] = (int32_t)(aip->behavior);
    buf[7] = (int32_t)(aip->hide_index);
    buf[8] = (int32_t)(aip->path_length);
    buf[9] = (int32_t)(aip->SUBMODE);
    buf[10] = (int32_t)(aip->danger_laser_num);
    buf[11] = (int32_t)(aip->danger_laser_signature);
    buf[12] = (int32_t)(aip->GOALSIDE);
    buf[13] = (int32_t)(aip->hide_segment);
    buf[14] = (int32_t)(ailp->next_fire);
    buf[15] = (int32_t)(ailp->player_awareness_type);
    buf[16] = (int32_t)(ailp->player_awareness_time);
    buf[17] = (int32_t)(ailp->mode);
    buf[18] = (int32_t)(ailp->time_since_processed);
    buf[19] = (int32_t)(ailp->consecutive_retries);
    buf[20] = (int32_t)(ailp->retry_count);
    buf[21] = (int32_t)(ailp->goal_state[0]);
    buf[22] = (int32_t)(ailp->goal_state[1]);
    buf[23] = (int32_t)(ailp->goal_state[2]);
    buf[24] = (int32_t)(ailp->goal_state[3]);
    buf[25] = (int32_t)(ailp->goal_state[4]);
    buf[26] = (int32_t)(ailp->goal_state[5]);
    buf[27] = (int32_t)(ailp->goal_state[6]);
    buf[28] = (int32_t)(ailp->goal_state[7]);
    buf[29] = (int32_t)(ailp->time_player_seen);
    buf[30] = (int32_t)(ailp->goal_segment);
    buf[31] = (int32_t)(ailp->rapidfire_count);
    buf[32] = (int32_t)(ailp->achieved_state[0]);
    buf[33] = (int32_t)(ailp->achieved_state[1]);
    buf[34] = (int32_t)(ailp->achieved_state[2]);
    buf[35] = (int32_t)(ailp->achieved_state[3]);
    buf[36] = (int32_t)(ailp->achieved_state[4]);
    buf[37] = (int32_t)(ailp->achieved_state[5]);
    buf[38] = (int32_t)(ailp->achieved_state[6]);
    buf[39] = (int32_t)(ailp->achieved_state[7]);
    buf[40] = (int32_t)(ailp->previous_visibility);
    buf[41] = (int32_t)(ailp->wait_time);
    buf[42] = (int32_t)(obj->shields);
}

static inline void unpack_ai_frame_d1(int32_t* buf, object* obj, ai_static* aip, ai_local* ailp) {
    aip->SKIP_AI_COUNT = buf[0];
    aip->GOAL_STATE = buf[1];
    aip->CURRENT_STATE = buf[2];
    aip->CLOAKED = buf[3];
    aip->CURRENT_GUN = buf[4];
    aip->cur_path_index = buf[5];
    aip->behavior = buf[6];
    aip->hide_index = buf[7];
    aip->path_length = buf[8];
    aip->SUBMODE = buf[9];
    aip->danger_laser_num = buf[10];
    aip->danger_laser_signature = buf[11];
    aip->GOALSIDE = buf[12];
    aip->hide_segment = buf[13];
    ailp->next_fire = buf[14];
    ailp->player_awareness_type = buf[15];
    ailp->player_awareness_time = buf[16];
    ailp->mode = buf[17];
    ailp->time_since_processed = buf[18];
    ailp->consecutive_retries = buf[19];
    ailp->retry_count = buf[20];
    ailp->goal_state[0] = buf[21];
    ailp->goal_state[1] = buf[22];
    ailp->goal_state[2] = buf[23];
    ailp->goal_state[3] = buf[24];
    ailp->goal_state[4] = buf[25];
    ailp->goal_state[5] = buf[26];
    ailp->goal_state[6] = buf[27];
    ailp->goal_state[7] = buf[28];
    ailp->time_player_seen = buf[29];
    ailp->goal_segment = buf[30];
    ailp->rapidfire_count = buf[31];
    ailp->achieved_state[0] = buf[32];
    ailp->achieved_state[1] = buf[33];
    ailp->achieved_state[2] = buf[34];
    ailp->achieved_state[3] = buf[35];
    ailp->achieved_state[4] = buf[36];
    ailp->achieved_state[5] = buf[37];
    ailp->achieved_state[6] = buf[38];
    ailp->achieved_state[7] = buf[39];
    ailp->previous_visibility = buf[40];
    ailp->wait_time = buf[41];
    obj->shields = buf[42];
}
