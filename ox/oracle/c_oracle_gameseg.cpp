#include "c_oracle_gameseg.h"
#include <algorithm>

static const int Side_to_verts[6][4] = {
    {7,6,2,3},  // left
    {0,4,7,3},  // top
    {0,1,5,4},  // right
    {2,6,5,1},  // bottom
    {4,5,6,7},  // back
    {3,2,1,0},  // front
};

extern "C" void c_oracle_compute_center_point_on_side(
    c_oracle_vec3* dest,
    const c_oracle_vec3* v0, const c_oracle_vec3* v1,
    const c_oracle_vec3* v2, const c_oracle_vec3* v3)
{
    dest->x = 0; dest->y = 0; dest->z = 0;
    c_oracle_vec3 tmp;
    tmp = *v0; c_oracle_vm_vec_add2(dest, &tmp);
    tmp = *v1; c_oracle_vm_vec_add2(dest, &tmp);
    tmp = *v2; c_oracle_vm_vec_add2(dest, &tmp);
    tmp = *v3; c_oracle_vm_vec_add2(dest, &tmp);
    c_oracle_vm_vec_scale(dest, 0x10000 / 4);
}

extern "C" void c_oracle_compute_segment_center(
    c_oracle_vec3* dest, const c_oracle_vec3 verts[8])
{
    dest->x = 0; dest->y = 0; dest->z = 0;
    for (int i = 0; i < 8; i++)
    {
        c_oracle_vec3 tmp = verts[i];
        c_oracle_vm_vec_add2(dest, &tmp);
    }
    c_oracle_vm_vec_scale(dest, 0x10000 / 8);
}

extern "C" void c_oracle_get_verts_for_normal(
    int32_t va, int32_t vb, int32_t vc, int32_t vd,
    int32_t* v0, int32_t* v1, int32_t* v2, int32_t* v3, int32_t* negate_flag)
{
    int v[4] = {va, vb, vc, vd};
    int w[4] = {0, 1, 2, 3};

    for (int i = 1; i < 4; i++)
        for (int j = 0; j < i; j++)
            if (v[j] > v[i])
            {
                std::swap(v[j], v[i]);
                std::swap(w[j], w[i]);
            }

    *v0 = v[0];
    *v1 = v[1];
    *v2 = v[2];
    *v3 = v[3];

    if (((w[0] + 3) % 4 == w[1]) || ((w[1] + 3) % 4 == w[2]))
        *negate_flag = 1;
    else
        *negate_flag = 0;
}

extern "C" void c_oracle_create_abs_vertex_lists(
    int32_t* num_faces, int32_t vertices[6],
    int32_t side_type, const int32_t seg_verts[8], int32_t sidenum)
{
    const int* sv = Side_to_verts[sidenum];

    switch (side_type)
    {
    case C_ORACLE_SIDE_IS_QUAD:
        vertices[0] = seg_verts[sv[0]];
        vertices[1] = seg_verts[sv[1]];
        vertices[2] = seg_verts[sv[2]];
        vertices[3] = seg_verts[sv[3]];
        vertices[4] = 0;
        vertices[5] = 0;
        *num_faces = 1;
        break;
    case C_ORACLE_SIDE_IS_TRI_02:
        *num_faces = 2;
        vertices[0] = seg_verts[sv[0]];
        vertices[1] = seg_verts[sv[1]];
        vertices[2] = seg_verts[sv[2]];
        vertices[3] = seg_verts[sv[2]];
        vertices[4] = seg_verts[sv[3]];
        vertices[5] = seg_verts[sv[0]];
        break;
    case C_ORACLE_SIDE_IS_TRI_13:
        *num_faces = 2;
        vertices[0] = seg_verts[sv[3]];
        vertices[1] = seg_verts[sv[0]];
        vertices[2] = seg_verts[sv[1]];
        vertices[3] = seg_verts[sv[1]];
        vertices[4] = seg_verts[sv[2]];
        vertices[5] = seg_verts[sv[3]];
        break;
    default:
        *num_faces = 0;
        break;
    }
}

extern "C" void c_oracle_extract_vector_from_segment(
    c_oracle_vec3* dest, const c_oracle_vec3 verts[8],
    int32_t start_side, int32_t end_side)
{
    c_oracle_vec3 vs = {0, 0, 0};
    c_oracle_vec3 ve = {0, 0, 0};

    for (int i = 0; i < 4; i++)
    {
        c_oracle_vec3 tmp_s = verts[Side_to_verts[start_side][i]];
        c_oracle_vm_vec_add2(&vs, &tmp_s);
        c_oracle_vec3 tmp_e = verts[Side_to_verts[end_side][i]];
        c_oracle_vm_vec_add2(&ve, &tmp_e);
    }

    c_oracle_vm_vec_sub(dest, &ve, &vs);
    c_oracle_vm_vec_scale(dest, 0x10000 / 4);
}

extern "C" void c_oracle_extract_orient_from_segment(
    c_oracle_mat3* dest, const c_oracle_vec3 verts[8])
{
    c_oracle_vec3 fvec, uvec;
    c_oracle_extract_vector_from_segment(&fvec, verts, 5, 4); // WFRONT=5, WBACK=4
    c_oracle_extract_vector_from_segment(&uvec, verts, 3, 1); // WBOTTOM=3, WTOP=1

    c_oracle_vm_vector_2_matrix(dest, &fvec, &uvec, nullptr);
}
