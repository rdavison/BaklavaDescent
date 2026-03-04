#include "c_oracle_fvi.h"
#include <cstdlib>
#include <algorithm>

#define IT_NONE  0
#define IT_FACE  1
#define IT_EDGE  2
#define IT_POINT 3

static const int ij_table[3][2] = {
    {2,1},
    {0,2},
    {1,0},
};

extern "C" int c_oracle_oflow_check(int32_t a, int32_t b)
{
    int64_t tmp = (int64_t)abs(a) * (int64_t)abs(b);
    return (tmp >> 47) ? 1 : 0;
}

extern "C" int c_oracle_find_plane_line_intersection(
    c_oracle_vec3* new_pnt,
    const c_oracle_vec3* plane_pnt,
    const c_oracle_vec3* plane_norm,
    const c_oracle_vec3* p0,
    const c_oracle_vec3* p1,
    int32_t rad)
{
    c_oracle_vec3 d, w;
    c_oracle_vm_vec_sub(&d, p1, p0);
    c_oracle_vm_vec_sub(&w, p0, plane_pnt);

    int32_t num = c_oracle_vm_vec_dotprod(plane_norm, &w);
    int32_t den = -c_oracle_vm_vec_dotprod(plane_norm, &d);

    num -= rad;

    if ((den == 0) ||
        (den > 0) &&
        ((num > den) ||
        ((-num) >> 15) >= den) ||
        (den < 0 && num < den))
        return 0;

    {
        int32_t f1_0 = 0x10000;
        if (labs(num) / (f1_0 / 2) >= labs(den)) return 0;
        int32_t k = c_oracle_fixdiv(num, den);

        if (c_oracle_oflow_check(d.x, k) || c_oracle_oflow_check(d.y, k) || c_oracle_oflow_check(d.z, k))
            return 0;
    }

    c_oracle_vm_vec_scale2(&d, num, den);
    c_oracle_vm_vec_add(new_pnt, p0, &d);

    return 1;
}

extern "C" uint32_t c_oracle_check_point_to_face(
    const c_oracle_vec3* checkp,
    const c_oracle_vec3* norm,
    int nv,
    const c_oracle_vec3* vertex_positions)
{
    int32_t cp[3] = { checkp->x, checkp->y, checkp->z };
    int32_t n[3] = { norm->x, norm->y, norm->z };

    int32_t tx = abs(n[0]);
    int32_t ty = abs(n[1]);
    int32_t tz = abs(n[2]);

    int biggest;
    if (tx > ty) { if (tx > tz) biggest = 0; else biggest = 2; }
    else { if (ty > tz) biggest = 1; else biggest = 2; }

    int i, j;
    if (n[biggest] > 0) {
        i = ij_table[biggest][0];
        j = ij_table[biggest][1];
    } else {
        i = ij_table[biggest][1];
        j = ij_table[biggest][0];
    }

    int32_t check_i = cp[i];
    int32_t check_j = cp[j];

    uint32_t edgemask = 0;
    for (int edge = 0; edge < nv; edge++) {
        const c_oracle_vec3* pv0 = &vertex_positions[edge];
        const c_oracle_vec3* pv1 = &vertex_positions[(edge + 1) % nv];
        int32_t v0[3] = { pv0->x, pv0->y, pv0->z };
        int32_t v1[3] = { pv1->x, pv1->y, pv1->z };

        int32_t edge_i = v1[i] - v0[i];
        int32_t edge_j = v1[j] - v0[j];
        int32_t chk_i = check_i - v0[i];
        int32_t chk_j = check_j - v0[j];

        int32_t d = c_oracle_fixmul(chk_i, edge_j) - c_oracle_fixmul(chk_j, edge_i);
        if (d < 0)
            edgemask |= (1 << edge);
    }
    return edgemask;
}

extern "C" int c_oracle_check_sphere_to_face(
    const c_oracle_vec3* pnt,
    const c_oracle_vec3* norm,
    int nv,
    int32_t rad,
    const c_oracle_vec3* vertex_positions)
{
    uint32_t edgemask = c_oracle_check_point_to_face(pnt, norm, nv, vertex_positions);

    if (edgemask == 0)
        return IT_FACE;

    int edgenum;
    for (edgenum = 0; !(edgemask & 1); edgemask >>= 1, edgenum++);

    c_oracle_vec3 v0 = vertex_positions[edgenum];
    c_oracle_vec3 v1 = vertex_positions[(edgenum + 1) % nv];

    c_oracle_vec3 checkvec, edgevec;
    c_oracle_vm_vec_sub(&checkvec, pnt, &v0);
    int32_t edgelen = c_oracle_vm_vec_normalized_dir(&edgevec, &v1, &v0);

    int32_t d = c_oracle_vm_vec_dotprod(&edgevec, &checkvec);

    if (d + rad < 0) return IT_NONE;
    if (d - rad > edgelen) return IT_NONE;

    int itype = IT_POINT;
    c_oracle_vec3 closest_point;

    if (d < 0) closest_point = v0;
    else if (d > edgelen) closest_point = v1;
    else {
        itype = IT_EDGE;
        c_oracle_vm_vec_scale_add(&closest_point, &v0, &edgevec, d);
    }

    int32_t dist = c_oracle_vm_vec_dist(pnt, &closest_point);

    if (dist <= rad)
        return (itype == IT_POINT) ? IT_NONE : itype;
    else
        return IT_NONE;
}

extern "C" int32_t c_oracle_calc_det_value(
    const c_oracle_vec3* rvec,
    const c_oracle_vec3* uvec,
    const c_oracle_vec3* fvec)
{
    return c_oracle_fixmul(rvec->x, c_oracle_fixmul(uvec->y, fvec->z))
         - c_oracle_fixmul(rvec->x, c_oracle_fixmul(uvec->z, fvec->y))
         - c_oracle_fixmul(rvec->y, c_oracle_fixmul(uvec->x, fvec->z))
         + c_oracle_fixmul(rvec->y, c_oracle_fixmul(uvec->z, fvec->x))
         + c_oracle_fixmul(rvec->z, c_oracle_fixmul(uvec->x, fvec->y))
         - c_oracle_fixmul(rvec->z, c_oracle_fixmul(uvec->y, fvec->x));
}

extern "C" int c_oracle_check_line_to_line(
    int32_t* t1, int32_t* t2,
    const c_oracle_vec3* p1, const c_oracle_vec3* v1,
    const c_oracle_vec3* p2, const c_oracle_vec3* v2)
{
    c_oracle_vec3 rvec, fvec;
    c_oracle_vm_vec_sub(&rvec, p2, p1);
    c_oracle_vm_vec_crossprod(&fvec, v1, v2);
    int32_t cross_mag2 = c_oracle_vm_vec_dotprod(&fvec, &fvec);

    if (cross_mag2 == 0) return 0;

    c_oracle_vec3 uvec;
    uvec = *v2;
    int32_t d = c_oracle_calc_det_value(&rvec, &uvec, &fvec);
    if (c_oracle_oflow_check(d, cross_mag2)) return 0;
    *t1 = c_oracle_fixdiv(d, cross_mag2);

    uvec = *v1;
    d = c_oracle_calc_det_value(&rvec, &uvec, &fvec);
    if (c_oracle_oflow_check(d, cross_mag2)) return 0;
    *t2 = c_oracle_fixdiv(d, cross_mag2);

    return 1;
}

/* Helper: lookup vertex position by absolute index */
static c_oracle_vec3 lookup_vpos(const int32_t seg_verts[8],
    const c_oracle_vec3 seg_vert_positions[8], int32_t abs_idx)
{
    for (int i = 0; i < 8; i++)
        if (seg_verts[i] == abs_idx)
            return seg_vert_positions[i];
    c_oracle_vec3 z = {0, 0, 0};
    return z;
}

extern "C" int c_oracle_check_line_to_face(
    c_oracle_vec3* newp,
    const c_oracle_vec3* p0, const c_oracle_vec3* p1,
    const c_oracle_vec3* side_norm,
    int32_t rad, int facenum, int nv,
    int side_type, int sidenum,
    const int32_t seg_verts[8],
    const c_oracle_vec3 seg_vert_positions[8])
{
    int32_t num_faces;
    int32_t vertex_list[6] = {0};
    c_oracle_create_abs_vertex_lists(&num_faces, vertex_list, side_type, seg_verts, sidenum);

    int32_t vertnum;
    if (num_faces == 2)
        vertnum = std::min(vertex_list[0], vertex_list[2]);
    else {
        vertnum = vertex_list[0];
        for (int i = 1; i < 4; i++)
            if (vertex_list[i] < vertnum)
                vertnum = vertex_list[i];
    }

    c_oracle_vec3 plane_pnt = lookup_vpos(seg_verts, seg_vert_positions, vertnum);
    int pli = c_oracle_find_plane_line_intersection(newp, &plane_pnt, side_norm, p0, p1, rad);
    if (!pli) return IT_NONE;

    c_oracle_vec3 checkp = *newp;
    if (rad != 0)
        c_oracle_vm_vec_scale_add2(&checkp, side_norm, -rad);

    /* Build face vertex positions */
    c_oracle_vec3 face_verts[4];
    for (int i = 0; i < nv; i++)
        face_verts[i] = lookup_vpos(seg_verts, seg_vert_positions, vertex_list[facenum * 3 + i]);

    return c_oracle_check_sphere_to_face(&checkp, side_norm, nv, rad, face_verts);
}

extern "C" int c_oracle_check_vector_to_sphere_1(
    c_oracle_vec3* intp,
    const c_oracle_vec3* p0, const c_oracle_vec3* p1,
    const c_oracle_vec3* sphere_pos, int32_t sphere_rad)
{
    c_oracle_vec3 d, dn, w, closest_point;

    c_oracle_vm_vec_sub(&d, p1, p0);
    c_oracle_vm_vec_sub(&w, sphere_pos, p0);

    int32_t mag_d = c_oracle_vm_vec_copy_normalize(&dn, &d);

    if (mag_d == 0) {
        int32_t int_dist = c_oracle_vm_vec_mag(&w);
        *intp = *p0;
        return (int_dist < sphere_rad) ? int_dist : 0;
    }

    int32_t w_dist = c_oracle_vm_vec_dotprod(&dn, &w);

    if (w_dist < 0) return 0;
    if (w_dist > mag_d + sphere_rad) return 0;

    c_oracle_vm_vec_scale_add(&closest_point, p0, &dn, w_dist);

    int32_t dist = c_oracle_vm_vec_dist(&closest_point, sphere_pos);

    if (dist < sphere_rad) {
        int32_t dist2 = c_oracle_fixmul(dist, dist);
        int32_t rad2 = c_oracle_fixmul(sphere_rad, sphere_rad);
        int32_t shorten = c_oracle_fix_sqrt(rad2 - dist2);
        int32_t int_dist = w_dist - shorten;

        if (int_dist > mag_d || int_dist < 0) {
            *intp = *p0;
            return 1;
        }

        c_oracle_vm_vec_scale_add(intp, p0, &dn, int_dist);
        return int_dist;
    }
    else
        return 0;
}
