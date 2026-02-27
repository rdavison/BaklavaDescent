#pragma once

#include <stdint.h>
#include "c_oracle.h"
#include "c_oracle_gameseg.h"

#ifdef __cplusplus
extern "C" {
#endif

int c_oracle_oflow_check(int32_t a, int32_t b);

int c_oracle_find_plane_line_intersection(
    c_oracle_vec3* new_pnt,
    const c_oracle_vec3* plane_pnt,
    const c_oracle_vec3* plane_norm,
    const c_oracle_vec3* p0,
    const c_oracle_vec3* p1,
    int32_t rad);

uint32_t c_oracle_check_point_to_face(
    const c_oracle_vec3* checkp,
    const c_oracle_vec3* norm,
    int nv,
    const c_oracle_vec3* vertex_positions);

int c_oracle_check_sphere_to_face(
    const c_oracle_vec3* pnt,
    const c_oracle_vec3* norm,
    int nv,
    int32_t rad,
    const c_oracle_vec3* vertex_positions);

int32_t c_oracle_calc_det_value(
    const c_oracle_vec3* rvec,
    const c_oracle_vec3* uvec,
    const c_oracle_vec3* fvec);

int c_oracle_check_line_to_line(
    int32_t* t1, int32_t* t2,
    const c_oracle_vec3* p1, const c_oracle_vec3* v1,
    const c_oracle_vec3* p2, const c_oracle_vec3* v2);

int c_oracle_check_line_to_face(
    c_oracle_vec3* newp,
    const c_oracle_vec3* p0, const c_oracle_vec3* p1,
    const c_oracle_vec3* side_norm,
    int32_t rad, int facenum, int nv,
    int side_type, int sidenum,
    const int32_t seg_verts[8],
    const c_oracle_vec3 seg_vert_positions[8]);

int c_oracle_check_vector_to_sphere_1(
    c_oracle_vec3* intp,
    const c_oracle_vec3* p0, const c_oracle_vec3* p1,
    const c_oracle_vec3* sphere_pos, int32_t sphere_rad);

#ifdef __cplusplus
}
#endif
