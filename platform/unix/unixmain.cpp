/*
The code contained in this file is not the property of Parallax Software,
and is not under the terms of the Parallax Software Source license.
Instead, it is released under the terms of the MIT License,
as described in copying.txt.
*/

#include <stdio.h>

#ifndef BUILD_DESCENT2
#include "main_d1/inferno.h"
#else
#include "main_d2/inferno.h"
#endif
#include "platform/platform.h"
#ifdef USE_OX_BRIDGE
#include "ox/bridge.h"
#endif

#include "SDL.h" //[ISB] required for main replacement macro

int main(int argc, char** argv) //[ISB] oops, must be called with c linkage...
{
#ifdef USE_OX_BRIDGE
	if (cd_ox_init_runtime(argv[0]) != 0)
	{
		fprintf(stderr, "Failed to initialize OxCaml bridge runtime.\n");
		return 1;
	}
	fprintf(stderr, "[OX] OxCaml bridge runtime initialized.\n");
#endif
	return D_DescentMain(argc, (const char**)argv);
}
