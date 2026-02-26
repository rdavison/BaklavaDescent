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
#include <stddef.h>
#include <stdio.h>

#include "misc/error.h"

#include "3d/3d.h"
#include "globvars.h"
#ifdef USE_OX_BRIDGE
#include "ox/bridge.h"
#endif

//[ISB] bumped for the moment, from 5. Because fan levels like corrupting memory. 
//[ISB] but I also can't blame them, Parallax never published these static limits. 
//[ISB] TODO: Look into emulating memory corruption
#define MAX_INSTANCE_DEPTH	10

struct instance_context {
	vms_matrix m;
	vms_vector p;
} instance_stack[MAX_INSTANCE_DEPTH];

int instance_depth = 0;

//instance at specified point with specified orientation
//if matrix==NULL, don't modify matrix.  This will be like doing an offset
void g3_start_instance_matrix(vms_vector* pos, vms_matrix* orient)
{
	Assert(instance_depth < MAX_INSTANCE_DEPTH);

	instance_stack[instance_depth].m = View_matrix;
	instance_stack[instance_depth].p = View_position;
	instance_depth++;

#ifdef USE_OX_BRIDGE
	static int ox_bridge_logged = 0;
	if (!ox_bridge_logged)
	{
		fprintf(stderr, "[OX] g3_start_instance_matrix using cd_ox_g3_start_instance_matrix.\n");
		ox_bridge_logged = 1;
	}
	cd_ox_g3_start_instance_matrix(
		View_position.x, View_position.y, View_position.z,
		View_matrix.rvec.x, View_matrix.rvec.y, View_matrix.rvec.z,
		View_matrix.uvec.x, View_matrix.uvec.y, View_matrix.uvec.z,
		View_matrix.fvec.x, View_matrix.fvec.y, View_matrix.fvec.z,
		pos->x, pos->y, pos->z,
		orient ? 1 : 0,
		orient ? orient->rvec.x : 0, orient ? orient->rvec.y : 0, orient ? orient->rvec.z : 0,
		orient ? orient->uvec.x : 0, orient ? orient->uvec.y : 0, orient ? orient->uvec.z : 0,
		orient ? orient->fvec.x : 0, orient ? orient->fvec.y : 0, orient ? orient->fvec.z : 0,
		&View_position.x, &View_position.y, &View_position.z,
		&View_matrix.rvec.x, &View_matrix.rvec.y, &View_matrix.rvec.z,
		&View_matrix.uvec.x, &View_matrix.uvec.y, &View_matrix.uvec.z,
		&View_matrix.fvec.x, &View_matrix.fvec.y, &View_matrix.fvec.z);
#else
	vms_vector tempv;
	vms_matrix tempm, tempm2;

	//step 1: subtract object position from view position

	vm_vec_sub(&tempv, &View_position, pos);


	if (orient)
	{
		//step 2: rotate view vector through object matrix
		vm_vec_rotate(&View_position, &tempv, orient);

		//step 3: rotate object matrix through view_matrix (vm = ob * vm)
		vm_copy_transpose_matrix(&tempm2, orient);

		vm_matrix_x_matrix(&tempm, &tempm2, &View_matrix);
		View_matrix = tempm;
	}
#endif
}


//instance at specified point with specified orientation
//if angles==NULL, don't modify matrix.  This will be like doing an offset
void g3_start_instance_angles(vms_vector* pos, vms_angvec* angles)
{
	vms_matrix tm;

	if (angles == NULL) 
	{
		g3_start_instance_matrix(pos, NULL);
		return;
	}

	vm_angles_2_matrix(&tm, angles);
	g3_start_instance_matrix(pos, &tm);
}


//pops the old context
void g3_done_instance()
{
	instance_depth--;

	Assert(instance_depth >= 0);

	View_position = instance_stack[instance_depth].p;
	View_matrix = instance_stack[instance_depth].m;
}
