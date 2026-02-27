#pragma once

#include <stdint.h>
#include "c_oracle.h"

#ifdef __cplusplus
extern "C" {
#endif

#define C_ORACLE_SIDE_IS_QUAD   1
#define C_ORACLE_SIDE_IS_TRI_02 2
#define C_ORACLE_SIDE_IS_TRI_13 3

void c_oracle_compute_center_point_on_side(
    c_oracle_vec3* dest,
    const c_oracle_vec3* v0, const c_oracle_vec3* v1,
    const c_oracle_vec3* v2, const c_oracle_vec3* v3);

void c_oracle_compute_segment_center(
    c_oracle_vec3* dest, const c_oracle_vec3 verts[8]);

void c_oracle_get_verts_for_normal(
    int32_t va, int32_t vb, int32_t vc, int32_t vd,
    int32_t* v0, int32_t* v1, int32_t* v2, int32_t* v3, int32_t* negate_flag);

void c_oracle_create_abs_vertex_lists(
    int32_t* num_faces, int32_t vertices[6],
    int32_t side_type, const int32_t seg_verts[8], int32_t sidenum);

void c_oracle_extract_vector_from_segment(
    c_oracle_vec3* dest, const c_oracle_vec3 verts[8],
    int32_t start_side, int32_t end_side);

void c_oracle_extract_orient_from_segment(
    c_oracle_mat3* dest, const c_oracle_vec3 verts[8]);

#ifdef __cplusplus
}
#endif
