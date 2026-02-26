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
#ifdef USE_OX_BRIDGE
#include "ox/bridge.h"
#include <stdio.h>
#endif

void scale_matrix();

//set view from x,y,z & p,b,h, zoom.  Must call one of g3_set_view_*() 
void g3_set_view_angles(vms_vector* view_pos, vms_angvec* view_orient, fix zoom)
{
	View_zoom = zoom;
	View_position = *view_pos;

	vm_angles_2_matrix(&View_matrix, view_orient);

	scale_matrix();
}

//set view from x,y,z, viewer matrix, and zoom.  Must call one of g3_set_view_*() 
void g3_set_view_matrix(vms_vector* view_pos, vms_matrix* view_matrix, fix zoom)
{
	View_zoom = zoom;
	View_position = *view_pos;
	View_matrix = *view_matrix;

	scale_matrix();
}

//performs aspect scaling on global view matrix
void scale_matrix(void)
{
#ifdef USE_OX_BRIDGE
	static int ox_bridge_logged = 0;
	if (!ox_bridge_logged)
	{
		fprintf(stderr, "[OX] scale_matrix using cd_ox_scale_matrix.\n");
		ox_bridge_logged = 1;
	}
	Unscaled_matrix = View_matrix;
	cd_ox_scale_matrix(
		View_matrix.rvec.x, View_matrix.rvec.y, View_matrix.rvec.z,
		View_matrix.uvec.x, View_matrix.uvec.y, View_matrix.uvec.z,
		View_matrix.fvec.x, View_matrix.fvec.y, View_matrix.fvec.z,
		Window_scale.x, Window_scale.y, Window_scale.z,
		View_zoom,
		&View_matrix.rvec.x, &View_matrix.rvec.y, &View_matrix.rvec.z,
		&View_matrix.uvec.x, &View_matrix.uvec.y, &View_matrix.uvec.z,
		&View_matrix.fvec.x, &View_matrix.fvec.y, &View_matrix.fvec.z,
		&Matrix_scale.x, &Matrix_scale.y, &Matrix_scale.z);
#else
	Unscaled_matrix = View_matrix;		//so we can use unscaled if we want

	Matrix_scale = Window_scale;

	if (View_zoom <= f1_0) 		//zoom in by scaling z
		Matrix_scale.z = fixmul(Matrix_scale.z, View_zoom);
	else //zoom out by scaling x&y
	{
		fix s = fixdiv(f1_0, View_zoom);

		Matrix_scale.x = fixmul(Matrix_scale.x, s);
		Matrix_scale.y = fixmul(Matrix_scale.y, s);
	}

	//now scale matrix elements
	vm_vec_scale(&View_matrix.rvec, Matrix_scale.x);
	vm_vec_scale(&View_matrix.uvec, Matrix_scale.y);
	vm_vec_scale(&View_matrix.fvec, Matrix_scale.z);
#endif
}
