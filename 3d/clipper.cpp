/*
THE COMPUTER CODE CONTAINED HEREIN IS THE SOLE PROPERTY OF PARALLAX
SOFTWARE CORPORATION ("PARALLAX").  PARALLAX, IN DISTRIBUTING THE CODE TO
END-USERS, AND SUBJECT TO ALL OF THE TERMS AND CONDITIONS HEREIN, GRANTS A
ROYALTY-FREE, PERPETUAL LICENSE TO SUCH END-USERS FOR USE BY SUCH END-USERS
IN USING, DISPLAYING,  AND CREATING DERIVATIVE WORKS THEREOF, SO LONG AS
SUCH USE, DISPLAY OR CREATION IS FOR NON-COMMERCIAL, ROYALTY OR REVENUE
FREE PURPOSES.  IN NO EVENT SHALL THE END-USER USE THE COMPUTER CODE
CONTAINED HEREIN FOR REVENUE-BEARING PURPOSES.  THE END-USER UNDERSTANDS
AND AGREES TO THE TERMS HEREIN AND ACCEPTS THE SAME BY USE OF THIS FILE.
COPYRIGHT 1993-1998 PARALLAX SOFTWARE CORPORATION.  ALL RIGHTS RESERVED.
*/
#include "3d/3d.h"
#include "globvars.h"
#include "clipper.h"
#include "misc/error.h"
#ifdef USE_OX_BRIDGE
#include "ox/bridge.h"
#include <stdio.h>
#endif

int free_point_num = 0;

g3s_point temp_points[MAX_POINTS_IN_POLY];
g3s_point* free_points[MAX_POINTS_IN_POLY];

void init_free_points(void)
{
	int i;

	for (i = 0; i < MAX_POINTS_IN_POLY; i++)
		free_points[i] = &temp_points[i];
}


g3s_point* get_temp_point()
{
	g3s_point* p;

	Assert(free_point_num < MAX_POINTS_IN_POLY);
	p = free_points[free_point_num++];

	p->p3_flags = PF_TEMP_POINT;

	return p;
}

void free_temp_point(g3s_point* p)
{
	Assert(p->p3_flags & PF_TEMP_POINT);

	free_points[--free_point_num] = p;

	p->p3_flags &= ~PF_TEMP_POINT;
}

//clips an edge against one plane.
g3s_point* clip_edge(int plane_flag, g3s_point* on_pnt, g3s_point* off_pnt)
{
#ifdef USE_OX_BRIDGE
	static int ox_bridge_logged = 0;
	if (!ox_bridge_logged)
	{
		fprintf(stderr, "[OX] clip_edge using cd_ox_clip_edge.\n");
		ox_bridge_logged = 1;
	}

	g3s_point* tmp = get_temp_point();

	int32_t nx, ny, nz, nu, nv, nl, nflags;
	uint8_t ncodes;
	cd_ox_clip_edge(
		plane_flag,
		on_pnt->p3_x, on_pnt->p3_y, on_pnt->p3_z,
		on_pnt->p3_u, on_pnt->p3_v, on_pnt->p3_l, on_pnt->p3_flags,
		off_pnt->p3_x, off_pnt->p3_y, off_pnt->p3_z,
		off_pnt->p3_u, off_pnt->p3_v, off_pnt->p3_l,
		&nx, &ny, &nz, &nu, &nv, &nl, &nflags, &ncodes);

	tmp->p3_x = nx;
	tmp->p3_y = ny;
	tmp->p3_z = nz;
	tmp->p3_u = nu;
	tmp->p3_v = nv;
	tmp->p3_l = nl;
	tmp->p3_flags |= nflags;
	tmp->p3_codes = ncodes;

	return tmp;
#else
	fix psx_ratio;
	fix a, b, kn, kd;
	g3s_point* tmp;

	//compute clipping value k = (xs-zs) / (xs-xe-zs+ze)
	//use x or y as appropriate, and negate x/y value as appropriate

	if (plane_flag & (CC_OFF_RIGHT | CC_OFF_LEFT))
	{
		a = on_pnt->p3_x;
		b = off_pnt->p3_x;
	}
	else
	{
		a = on_pnt->p3_y;
		b = off_pnt->p3_y;
	}

	if (plane_flag & (CC_OFF_LEFT | CC_OFF_BOT))
	{
		a = -a;
		b = -b;
	}

	kn = a - on_pnt->p3_z;						//xs-zs
	kd = kn - b + off_pnt->p3_z;				//xs-zs-xe+ze

	tmp = get_temp_point();

	psx_ratio = fixdiv(kn, kd);


	// PSX_HACK!!!!
	//	tmp->p3_x = on_pnt->p3_x + fixmuldiv(off_pnt->p3_x-on_pnt->p3_x,kn,kd);
	//	tmp->p3_y = on_pnt->p3_y + fixmuldiv(off_pnt->p3_y-on_pnt->p3_y,kn,kd);

	tmp->p3_x = on_pnt->p3_x + fixmul((off_pnt->p3_x - on_pnt->p3_x), psx_ratio);
	tmp->p3_y = on_pnt->p3_y + fixmul((off_pnt->p3_y - on_pnt->p3_y), psx_ratio);

	if (plane_flag & (CC_OFF_TOP | CC_OFF_BOT))
		tmp->p3_z = tmp->p3_y;
	else
		tmp->p3_z = tmp->p3_x;

	if (plane_flag & (CC_OFF_LEFT | CC_OFF_BOT))
		tmp->p3_z = -tmp->p3_z;

	if (on_pnt->p3_flags & PF_UVS)
	{
		// PSX_HACK!!!!
		//		tmp->p3_u = on_pnt->p3_u + fixmuldiv(off_pnt->p3_u-on_pnt->p3_u,kn,kd);
		//		tmp->p3_v = on_pnt->p3_v + fixmuldiv(off_pnt->p3_v-on_pnt->p3_v,kn,kd);
		tmp->p3_u = on_pnt->p3_u + fixmul((off_pnt->p3_u - on_pnt->p3_u), psx_ratio);
		tmp->p3_v = on_pnt->p3_v + fixmul((off_pnt->p3_v - on_pnt->p3_v), psx_ratio);

		tmp->p3_flags |= PF_UVS;
	}

	if (on_pnt->p3_flags & PF_LS)
	{
		// PSX_HACK
		//		tmp->p3_r = on_pnt->p3_r + fixmuldiv(off_pnt->p3_r-on_pnt->p3_r,kn,kd);
		//		tmp->p3_g = on_pnt->p3_g + fixmuldiv(off_pnt->p3_g-on_pnt->p3_g,kn,kd);
		//		tmp->p3_b = on_pnt->p3_b + fixmuldiv(off_pnt->p3_b-on_pnt->p3_b,kn,kd);

		tmp->p3_l = on_pnt->p3_l + fixmul((off_pnt->p3_l - on_pnt->p3_l), psx_ratio);

		tmp->p3_flags |= PF_LS;
	}

	g3_code_point(tmp);

	return tmp;
#endif
}

//clips a line to the viewing pyramid.
void clip_line(g3s_point** p0, g3s_point** p1, uint8_t codes_or)
{
#ifdef USE_OX_BRIDGE
	static int ox_bridge_logged = 0;
	if (!ox_bridge_logged)
	{
		fprintf(stderr, "[OX] clip_line using cd_ox_clip_line.\n");
		ox_bridge_logged = 1;
	}

	(*p0)->p3_flags &= ~(PF_UVS | PF_LS);
	(*p1)->p3_flags &= ~(PF_UVS | PF_LS);

	int32_t op0x, op0y, op0z, op1x, op1y, op1z;
	uint8_t op0c, op1c;
	int clipped;
	cd_ox_clip_line(
		(*p0)->p3_x, (*p0)->p3_y, (*p0)->p3_z, (*p0)->p3_codes,
		(*p1)->p3_x, (*p1)->p3_y, (*p1)->p3_z, (*p1)->p3_codes,
		codes_or,
		&op0x, &op0y, &op0z, &op0c,
		&op1x, &op1y, &op1z, &op1c,
		&clipped);

	if ((*p0)->p3_flags & PF_TEMP_POINT) free_temp_point(*p0);
	if ((*p1)->p3_flags & PF_TEMP_POINT) free_temp_point(*p1);

	g3s_point* np0 = get_temp_point();
	np0->p3_x = op0x; np0->p3_y = op0y; np0->p3_z = op0z;
	np0->p3_codes = op0c;
	*p0 = np0;

	g3s_point* np1 = get_temp_point();
	np1->p3_x = op1x; np1->p3_y = op1y; np1->p3_z = op1z;
	np1->p3_codes = op1c;
	*p1 = np1;
#else
	int plane_flag;
	g3s_point* old_p1;

	//might have these left over
	(*p0)->p3_flags &= ~(PF_UVS | PF_LS);
	(*p1)->p3_flags &= ~(PF_UVS | PF_LS);

	for (plane_flag = 1; plane_flag < 16; plane_flag <<= 1)
		if (codes_or & plane_flag)
		{

			if ((*p0)->p3_codes & plane_flag)
			{
				g3s_point* t = *p0; *p0 = *p1; *p1 = t;
			}	//swap!

			old_p1 = *p1;

			*p1 = clip_edge(plane_flag, *p0, *p1);

			if (old_p1->p3_flags & PF_TEMP_POINT)
				free_temp_point(old_p1);

			//[ISB] mac descent bug: codes should be recalculated here, but they weren't
			if ((*p0)->p3_codes & (*p1)->p3_codes) //Entirely off screen now?
				return;
			codes_or = (*p0)->p3_codes | (*p1)->p3_codes;
		}
#endif
}


int clip_plane(int plane_flag, g3s_point** src, g3s_point** dest, int* nv, g3s_codes* cc)
{
	int i;
	g3s_point** save_dest = dest;

	//copy first two verts to end
	src[*nv] = src[0];
	src[*nv + 1] = src[1];

	cc->high = 0xff; cc->low = 0;

	for (i = 1; i <= *nv; i++) 
	{

		if (src[i]->p3_codes & plane_flag) 
		{				//cur point off?

			if (!(src[i - 1]->p3_codes & plane_flag)) {	//prev not off?

				*dest = clip_edge(plane_flag, src[i - 1], src[i]);
				cc->low |= (*dest)->p3_codes;
				cc->high &= (*dest)->p3_codes;
				dest++;
			}

			if (!(src[i + 1]->p3_codes & plane_flag))
			{

				*dest = clip_edge(plane_flag, src[i + 1], src[i]);
				cc->low |= (*dest)->p3_codes;
				cc->high &= (*dest)->p3_codes;
				dest++;
			}

			//see if must free discarded point

			if (src[i]->p3_flags & PF_TEMP_POINT)
				free_temp_point(src[i]);
		}
		else 
		{			//cur not off, copy to dest buffer

			*dest++ = src[i];

			cc->low |= src[i]->p3_codes;
			cc->high &= src[i]->p3_codes;
		}
	}

	return (dest - save_dest);
}


g3s_point** clip_polygon(g3s_point** src, g3s_point** dest, int* nv, g3s_codes* cc)
{
#ifdef USE_OX_BRIDGE
	static int ox_bridge_logged = 0;
	if (!ox_bridge_logged)
	{
		fprintf(stderr, "[OX] clip_polygon using cd_ox_clip_polygon.\n");
		ox_bridge_logged = 1;
	}

	int32_t flat_in[MAX_POINTS_IN_POLY * 8];
	for (int i = 0; i < *nv; i++)
	{
		flat_in[i * 8 + 0] = src[i]->p3_x;
		flat_in[i * 8 + 1] = src[i]->p3_y;
		flat_in[i * 8 + 2] = src[i]->p3_z;
		flat_in[i * 8 + 3] = src[i]->p3_u;
		flat_in[i * 8 + 4] = src[i]->p3_v;
		flat_in[i * 8 + 5] = src[i]->p3_l;
		flat_in[i * 8 + 6] = src[i]->p3_flags & (PF_UVS | PF_LS);
		flat_in[i * 8 + 7] = src[i]->p3_codes;
	}

	int32_t flat_out[MAX_POINTS_IN_POLY * 8];
	int out_nv;
	int32_t out_codes_or, out_codes_and;
	cd_ox_clip_polygon(
		cc->low, cc->high,
		*nv, flat_in,
		&out_nv, flat_out,
		&out_codes_or, &out_codes_and);

	for (int i = 0; i < *nv; i++)
	{
		if (src[i]->p3_flags & PF_TEMP_POINT)
			free_temp_point(src[i]);
	}

	for (int i = 0; i < out_nv; i++)
	{
		g3s_point* p = get_temp_point();
		p->p3_x = flat_out[i * 8 + 0];
		p->p3_y = flat_out[i * 8 + 1];
		p->p3_z = flat_out[i * 8 + 2];
		p->p3_u = flat_out[i * 8 + 3];
		p->p3_v = flat_out[i * 8 + 4];
		p->p3_l = flat_out[i * 8 + 5];
		p->p3_flags |= (uint8_t)flat_out[i * 8 + 6];
		p->p3_codes = (uint8_t)flat_out[i * 8 + 7];
		dest[i] = p;
	}

	cc->low = (uint8_t)out_codes_or;
	cc->high = (uint8_t)out_codes_and;
	*nv = out_nv;
	return dest;
#else
	int plane_flag;
	g3s_point** t;

	for (plane_flag = 1; plane_flag < 16; plane_flag <<= 1)

		if (cc->low &plane_flag)
		{

			*nv = clip_plane(plane_flag, src, dest, nv, cc);

			if (cc->high)		//clipped away
				return dest;

			t = src; src = dest; dest = t;

		}

	return src;		//we swapped after we copied
#endif
}
