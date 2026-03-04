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
COPYRIGHT 1993-1999 PARALLAX SOFTWARE CORPORATION.  ALL RIGHTS RESERVED.
*/

#include "misc/error.h"

#include "inferno.h"

#include "robot.h"
#include "object.h"
#include "polyobj.h"
#include "platform/mono.h"
#ifdef USE_OX_BRIDGE
#include "ox-bridge/bridge.h"
#include <stdio.h>
#endif

int	N_robot_types = 0;
int	N_robot_joints = 0;

//	Robot stuff
robot_info Robot_info[MAX_ROBOT_TYPES];

//Big array of joint positions.  All robots index into this array

#define deg(a) ((int) (a) * 32768 / 180)

//test data for one robot
jointpos Robot_joints[MAX_ROBOT_JOINTS] = {

//gun 0
					{2,{deg(-30),0,0}},		//rest (2 joints)
					{3,{deg(-40),0,0}},

					{2,{deg(0),0,0}},			//alert
					{3,{deg(0),0,0}},
		
					{2,{deg(0),0,0}},			//fire
					{3,{deg(0),0,0}},
		
					{2,{deg(50),0,0}},		//recoil
					{3,{deg(-50),0,0}},
		
					{2,{deg(10),0,deg(70)}},		//flinch
					{3,{deg(0),deg(20),0}},
		
//gun 1
					{4,{deg(-30),0,0}},		//rest (2 joints)
					{5,{deg(-40),0,0}},

					{4,{deg(0),0,0}},			//alert
					{5,{deg(0),0,0}},
		
					{4,{deg(0),0,0}},			//fire
					{5,{deg(0),0,0}},
		
					{4,{deg(50),0,0}},		//recoil
					{5,{deg(-50),0,0}},
		
					{4,{deg(20),0,deg(-50)}},	//flinch
					{5,{deg(0),0,deg(20)}},
		
//rest of body (the head)

					{1,{deg(70),0,0}},		//rest (1 joint, head)

					{1,{deg(0),0,0}},			//alert
		
					{1,{deg(0),0,0}},			//fire
		
					{1,{deg(0),0,0}},			//recoil

					{1,{deg(-20),deg(15),0}},			//flinch


};

//given an object and a gun number, return position in 3-space of gun
//fills in gun_point
void calc_gun_point(vms_vector *gun_point,object *obj,int gun_num)
{
	polymodel *pm;
	robot_info *r;
	vms_vector pnt;
	vms_matrix m;
	int mn;				//submodel number

	Assert(obj->render_type==RT_POLYOBJ || obj->render_type==RT_MORPH);
	Assert(obj->id < N_robot_types);

	r = &Robot_info[obj->id];
	pm =&Polygon_models[r->model_num];

	if (gun_num >= r->n_guns)
	{
		mprintf((1, "Bashing gun num %d to 0.\n", gun_num));
		//Int3();
		gun_num = 0;
	}

//	Assert(gun_num < r->n_guns);

	pnt = r->gun_points[gun_num];
	mn = r->gun_submodels[gun_num];

#ifdef USE_OX_BRIDGE
	{
		static int ox_logged = 0;
		if (!ox_logged) { printf("[OX] calc_gun_point using cd_ox_calc_gun_point\n"); ox_logged = 1; }
		int32_t packed[86];
		packed[0] = pnt.x; packed[1] = pnt.y; packed[2] = pnt.z;
		packed[3] = mn;
		for (int i = 0; i < MAX_SUBMODELS; i++) {
			packed[4 + i*3 + 0] = obj->rtype.pobj_info.anim_angles[i].p;
			packed[4 + i*3 + 1] = obj->rtype.pobj_info.anim_angles[i].b;
			packed[4 + i*3 + 2] = obj->rtype.pobj_info.anim_angles[i].h;
		}
		for (int i = 0; i < MAX_SUBMODELS; i++) {
			packed[34 + i*3 + 0] = pm->submodel_offsets[i].x;
			packed[34 + i*3 + 1] = pm->submodel_offsets[i].y;
			packed[34 + i*3 + 2] = pm->submodel_offsets[i].z;
		}
		for (int i = 0; i < MAX_SUBMODELS; i++)
			packed[64 + i] = pm->submodel_parents[i];
		packed[74] = obj->orient.rvec.x; packed[75] = obj->orient.rvec.y; packed[76] = obj->orient.rvec.z;
		packed[77] = obj->orient.uvec.x; packed[78] = obj->orient.uvec.y; packed[79] = obj->orient.uvec.z;
		packed[80] = obj->orient.fvec.x; packed[81] = obj->orient.fvec.y; packed[82] = obj->orient.fvec.z;
		packed[83] = obj->pos.x; packed[84] = obj->pos.y; packed[85] = obj->pos.z;
		int32_t ox, oy, oz;
		cd_ox_calc_gun_point(packed, 86, &ox, &oy, &oz);
		gun_point->x = ox; gun_point->y = oy; gun_point->z = oz;
		return;
	}
#endif

	//instance up the tree for this gun
	while (mn != 0)
	{
		vms_vector tpnt;

		vm_angles_2_matrix(&m,&obj->rtype.pobj_info.anim_angles[mn]);
		vm_transpose_matrix(&m);
		vm_vec_rotate(&tpnt,&pnt,&m);

		vm_vec_add(&pnt,&tpnt,&pm->submodel_offsets[mn]);

		mn = pm->submodel_parents[mn];
	}

	//now instance for the entire object

	vm_copy_transpose_matrix(&m,&obj->orient);
	vm_vec_rotate(gun_point,&pnt,&m);
	vm_vec_add2(gun_point,&obj->pos);
}

//fills in ptr to list of joints, and returns the number of joints in list
//takes the robot type (object id), gun number, and desired state
int robot_get_anim_state(jointpos **jp_list_ptr,int robot_type,int gun_num,int state)
{
	Assert(gun_num <= Robot_info[robot_type].n_guns);

#ifdef USE_OX_BRIDGE
	{
		static int ox_logged = 0;
		if (!ox_logged) { printf("[OX] robot_get_anim_state using cd_ox_robot_get_anim_state\n"); ox_logged = 1; }
		robot_info* ri = &Robot_info[robot_type];
		int n_guns = ri->n_guns;
		int as_len = (n_guns + 1) * N_ANIM_STATES * 2;
		int rj_count = N_robot_joints;
		int rj_len = rj_count * 4;
		int packed_len = as_len + rj_len + 5;
		int32_t packed[packed_len];
		int idx = 0;
		for (int g = 0; g < n_guns + 1; g++)
			for (int s = 0; s < N_ANIM_STATES; s++) {
				packed[idx++] = ri->anim_states[g][s].n_joints;
				packed[idx++] = ri->anim_states[g][s].offset;
			}
		for (int j = 0; j < rj_count; j++) {
			packed[idx++] = Robot_joints[j].jointnum;
			packed[idx++] = Robot_joints[j].angles.p;
			packed[idx++] = Robot_joints[j].angles.b;
			packed[idx++] = Robot_joints[j].angles.h;
		}
		packed[idx++] = n_guns;
		packed[idx++] = gun_num;
		packed[idx++] = state;
		packed[idx++] = as_len;
		packed[idx++] = rj_len;
		int32_t out_buf[MAX_ROBOT_JOINTS * 4];
		int out_count = 0;
		cd_ox_robot_get_anim_state(packed, packed_len, out_buf, &out_count);
		*jp_list_ptr = &Robot_joints[ri->anim_states[gun_num][state].offset];
		return out_count;
	}
#endif

	*jp_list_ptr = &Robot_joints[Robot_info[robot_type].anim_states[gun_num][state].offset];
	return Robot_info[robot_type].anim_states[gun_num][state].n_joints;
}


//for test, set a robot to a specific state
void set_robot_state(object *obj,int state)
{
	int g,j,jo;
	robot_info *ri;
	jointlist *jl;

	Assert(obj->type == OBJ_ROBOT);

	ri = &Robot_info[obj->id];

#ifdef USE_OX_BRIDGE
	{
		static int ox_logged = 0;
		if (!ox_logged) { printf("[OX] set_robot_state using cd_ox_set_robot_state\n"); ox_logged = 1; }
		int n_guns = ri->n_guns;
		int as_len = (n_guns + 1) * N_ANIM_STATES * 2;
		int rj_count = N_robot_joints;
		int rj_len = rj_count * 4;
		int packed_len = as_len + rj_len + 1 + 30 + 1 + 2;
		int32_t packed[packed_len];
		int idx = 0;
		for (int gg = 0; gg < n_guns + 1; gg++)
			for (int s = 0; s < N_ANIM_STATES; s++) {
				packed[idx++] = ri->anim_states[gg][s].n_joints;
				packed[idx++] = ri->anim_states[gg][s].offset;
			}
		for (int jj = 0; jj < rj_count; jj++) {
			packed[idx++] = Robot_joints[jj].jointnum;
			packed[idx++] = Robot_joints[jj].angles.p;
			packed[idx++] = Robot_joints[jj].angles.b;
			packed[idx++] = Robot_joints[jj].angles.h;
		}
		packed[idx++] = n_guns;
		for (int i = 0; i < MAX_SUBMODELS; i++) {
			packed[idx++] = obj->rtype.pobj_info.anim_angles[i].p;
			packed[idx++] = obj->rtype.pobj_info.anim_angles[i].b;
			packed[idx++] = obj->rtype.pobj_info.anim_angles[i].h;
		}
		packed[idx++] = state;
		packed[idx++] = as_len;
		packed[idx++] = rj_len;
		int32_t out_angles[30];
		cd_ox_set_robot_state(packed, packed_len, out_angles);
		for (int i = 0; i < MAX_SUBMODELS; i++) {
			obj->rtype.pobj_info.anim_angles[i].p = out_angles[i*3+0];
			obj->rtype.pobj_info.anim_angles[i].b = out_angles[i*3+1];
			obj->rtype.pobj_info.anim_angles[i].h = out_angles[i*3+2];
		}
		return;
	}
#endif

	for (g=0;g<ri->n_guns+1;g++)
	{
		jl = &ri->anim_states[g][state];

		jo = jl->offset;

		for (j=0;j<jl->n_joints;j++,jo++)
		{
			int jn;

			jn = Robot_joints[jo].jointnum;

			obj->rtype.pobj_info.anim_angles[jn] = Robot_joints[jo].angles;

		}
	}
}

#include "platform/mono.h"

//set the animation angles for this robot.  Gun fields of robot info must
//be filled in.
void robot_set_angles(robot_info *r,polymodel *pm,vms_angvec angs[N_ANIM_STATES][MAX_SUBMODELS])
{
	int m,g,state;
	int gun_nums[MAX_SUBMODELS];			//which gun each submodel is part of

#ifdef USE_OX_BRIDGE
	{
		static int ox_logged = 0;
		if (!ox_logged) { printf("[OX] robot_set_angles using cd_ox_robot_set_angles\n"); ox_logged = 1; }
		int32_t packed[171];
		int idx = 0;
		packed[idx++] = r->n_guns;
		for (int i = 0; i < MAX_GUNS; i++)
			packed[idx++] = r->gun_submodels[i];
		packed[idx++] = pm->n_models;
		for (int i = 0; i < MAX_SUBMODELS; i++)
			packed[idx++] = pm->submodel_parents[i];
		for (int s = 0; s < N_ANIM_STATES; s++)
			for (int mm = 0; mm < MAX_SUBMODELS; mm++) {
				packed[idx++] = angs[s][mm].p;
				packed[idx++] = angs[s][mm].b;
				packed[idx++] = angs[s][mm].h;
			}
		packed[idx++] = N_robot_joints;
		int32_t out_buf[2048];
		int out_len = 0;
		cd_ox_robot_set_angles(packed, 171, out_buf, &out_len);
		int n_guns = r->n_guns;
		int as_len = (n_guns + 1) * N_ANIM_STATES * 2;
		int oi = 0;
		for (int gg = 0; gg < n_guns + 1; gg++)
			for (int ss = 0; ss < N_ANIM_STATES; ss++) {
				r->anim_states[gg][ss].n_joints = out_buf[oi++];
				r->anim_states[gg][ss].offset = out_buf[oi++];
			}
		int n_new_joints = out_buf[oi++];
		for (int j = 0; j < n_new_joints; j++) {
			Robot_joints[N_robot_joints].jointnum = out_buf[oi++];
			Robot_joints[N_robot_joints].angles.p = out_buf[oi++];
			Robot_joints[N_robot_joints].angles.b = out_buf[oi++];
			Robot_joints[N_robot_joints].angles.h = out_buf[oi++];
			N_robot_joints++;
			Assert(N_robot_joints < MAX_ROBOT_JOINTS);
		}
		return;
	}
#endif

	for (m=0;m<pm->n_models;m++)
		gun_nums[m] = r->n_guns;		//assume part of body...

	gun_nums[0] = -1;		//body never animates, at least for now

	for (g=0;g<r->n_guns;g++)
	{
		m = r->gun_submodels[g];

		while (m != 0)
		{
			gun_nums[m] = g;				//...unless we find it in a gun
			m = pm->submodel_parents[m];
		}
	}

	for (g=0;g<r->n_guns+1;g++)
	{
		//mprintf(0,"Gun %d:\n",g);

		for (state=0;state<N_ANIM_STATES;state++)
		{
			//mprintf(0," State %d:\n",state);

			r->anim_states[g][state].n_joints = 0;
			r->anim_states[g][state].offset = N_robot_joints;

			for (m=0;m<pm->n_models;m++)
			{
				if (gun_nums[m] == g)
				{
					//mprintf(0,"  Joint %d: %x %x %x\n",m,angs[state][m].pitch,angs[state][m].bank,angs[state][m].head);
					Robot_joints[N_robot_joints].jointnum = m;
					Robot_joints[N_robot_joints].angles = angs[state][m];
					r->anim_states[g][state].n_joints++;
					N_robot_joints++;
					Assert(N_robot_joints < MAX_ROBOT_JOINTS);
				}
			}
		}
	}
}
