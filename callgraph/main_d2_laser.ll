; ModuleID = '/Users/richard/code/ChocolateDescent/main_d2/laser.cpp'
source_filename = "/Users/richard/code/ChocolateDescent/main_d2/laser.cpp"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

%struct.weapon_info = type { i8, i8, i16, i16, i8, i8, i16, i8, i8, i16, i8, i8, i16, i8, i8, i8, i8, i8, i8, i8, i8, i8, i32, i32, i32, %struct.bitmap_index, i32, i32, i32, [5 x i32], [5 x i32], i32, i32, i32, i32, i32, i32, i32, %struct.bitmap_index, %struct.bitmap_index }
%struct.bitmap_index = type { i16 }
%struct.object = type { i32, i8, i8, i16, i16, i8, i8, i8, i8, i16, i16, %struct.vms_vector, %struct.vms_matrix, i32, i32, %struct.vms_vector, i8, i8, i8, i8, i32, %union.anon, %union.anon.0, %union.anon.1 }
%struct.vms_matrix = type { %struct.vms_vector, %struct.vms_vector, %struct.vms_vector }
%struct.vms_vector = type { i32, i32, i32 }
%union.anon = type { %struct.physics_info }
%struct.physics_info = type { %struct.vms_vector, %struct.vms_vector, i32, i32, i32, %struct.vms_vector, %struct.vms_vector, i16, i16 }
%union.anon.0 = type { %struct.ai_static }
%struct.ai_static = type { i8, [11 x i8], i16, i16, i16, i8, i8, i16, i32, i32 }
%union.anon.1 = type { %struct.polyobj_info }
%struct.polyobj_info = type { i32, [10 x %struct.vms_angvec], i32, i32, i32 }
%struct.vms_angvec = type { i16, i16, i16 }
%struct.muzzle_info = type { i32, i16, %struct.vms_vector }
%struct.polymodel = type { i32, i32, ptr, [10 x i32], [10 x %struct.vms_vector], [10 x %struct.vms_vector], [10 x %struct.vms_vector], [10 x i32], [10 x i8], [10 x %struct.vms_vector], [10 x %struct.vms_vector], %struct.vms_vector, %struct.vms_vector, i32, i8, i16, i8 }
%struct.player = type { [9 x i8], [4 x i8], i16, i8, i32, i32, i32, i32, i32, i32, i8, i8, i8, i8, i16, i16, i16, [10 x i16], [10 x i16], i16, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i16, i8, i8, i32, i8, i8 }
%struct.robot_info = type { i32, [8 x %struct.vms_vector], [8 x i8], i16, i16, i16, i16, i8, i8, i8, i8, i8, i8, i8, i8, i16, i8, i8, i32, i32, i32, i32, [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i8], [5 x i8], i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, [3 x i8], i8, i8, i8, i8, [9 x [5 x %struct.jointlist]], i32 }
%struct.jointlist = type { i16, i16 }
%struct.window_rendered_data = type { i32, ptr, i32, i32, i32, [50 x i16] }
%struct.laser_info_s = type { i16, i16, i32, i32, i16, i16, i32 }
%struct.fvi_query = type { ptr, ptr, i32, i32, i16, ptr, i32 }
%struct.fvi_info = type { i32, %struct.vms_vector, i32, i32, i32, i32, %struct.vms_vector, i32, [100 x i32] }
%struct.player_ship = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, [8 x %struct.vms_vector] }

@Laser_rapid_fire = global i32 0, align 4, !dbg !0
@Guided_missile = global [8 x ptr] zeroinitializer, align 8, !dbg !29
@Guided_missile_sig = global [8 x i32] [i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1], align 4, !dbg !181
@Multi_is_guided = global i8 0, align 1, !dbg !184
@Weapon_info = external global [0 x %struct.weapon_info], align 4
@.str = private unnamed_addr constant [44 x i8] c"Invalid weapon render type in Laser_render\0A\00", align 1, !dbg !187
@Objects = external global [0 x %struct.object], align 4
@GameTime = external global i32, align 4
@Laser_offset = global i32 0, align 4, !dbg !193
@Muzzle_data = global [8 x %struct.muzzle_info] zeroinitializer, align 4, !dbg !256
@Muzzle_queue_index = global i32 0, align 4, !dbg !254
@.str.1 = private unnamed_addr constant [48 x i8] c"Invalid weapon render type in Laser_create_new\0A\00", align 1, !dbg !195
@.str.2 = private unnamed_addr constant [19 x i8] c"laser_radius != -1\00", align 1, !dbg !200
@.str.3 = private unnamed_addr constant [55 x i8] c"/Users/richard/code/ChocolateDescent/main_d2/laser.cpp\00", align 1, !dbg !205
@.str.4 = private unnamed_addr constant [12 x i8] c"rtype != -1\00", align 1, !dbg !210
@Polygon_models = external global [0 x %struct.polymodel], align 8
@BounceCheat = external global i8, align 1
@Highest_object_index = external global i32, align 4
@.str.5 = private unnamed_addr constant [36 x i8] c"%i Omega blobs deleted in frame %i\0A\00", align 1, !dbg !215
@FrameCount = external global i32, align 4
@Game_mode = external global i32, align 4
@Doing_lighting_hack_flag = external global i32, align 4
@FrameTime = external global i32, align 4
@Difficulty_level = external global i32, align 4
@Omega_charge = global i32 65536, align 4, !dbg !220
@Last_omega_fire_frame = global i32 0, align 4, !dbg !222
@Player_is_dead = external global i32, align 4
@Primary_weapon = external global i8, align 1
@Players = external global [12 x %struct.player], align 4
@Player_num = external global i32, align 4
@Next_laser_fire_time = external global i32, align 4
@Viewer = external global ptr, align 8
@.str.6 = private unnamed_addr constant [66 x i8] c"Trying to fire Omega Cannon, but gun is outside mine.  Aborting!\0A\00", align 1, !dbg !224
@.str.7 = private unnamed_addr constant [23 x i8] c"hit_data.hit_seg != -1\00", align 1, !dbg !229
@N_weapon_types = external global i32, align 4
@.str.8 = private unnamed_addr constant [29 x i8] c"weapon_type < N_weapon_types\00", align 1, !dbg !234
@.str.9 = private unnamed_addr constant [38 x i8] c"Can't create laser - Out of objects!\0A\00", align 1, !dbg !239
@CurrentLogicVersion = external global i32, align 4
@Fusion_charge = external global i32, align 4
@Newdemo_state = external global i32, align 4
@.str.10 = private unnamed_addr constant [72 x i8] c"Warning: Laser tip outside mine.  Laser not being moved to end of gun.\0A\00", align 1, !dbg !244
@.str.11 = private unnamed_addr constant [69 x i8] c"Warning: Laser from parent=%i stuck in wall or object, didn't fire!\0A\00", align 1, !dbg !249
@Min_trackable_dot = global i32 57344, align 4, !dbg !266
@Robot_info = external global [0 x %struct.robot_info], align 4
@Robots_kill_robots_cheat = external global i32, align 4
@.str.12 = private unnamed_addr constant [51 x i8] c"tracker->ctype.laser_info.parent_type == OBJ_ROBOT\00", align 1, !dbg !268
@.str.13 = private unnamed_addr constant [68 x i8] c"(Weapon_info[tracker->id].homing_flag) || (tracker->id == OMEGA_ID)\00", align 1, !dbg !273
@ConsoleObject = external global ptr, align 8
@Window_rendered_data = external global [3 x %struct.window_rendered_data], align 8
@.str.14 = private unnamed_addr constant [80 x i8] c"Note: Calling find_homing_object_complete because no suitable rendered window.\0A\00", align 1, !dbg !278
@.str.15 = private unnamed_addr constant [11 x i8] c"rval != -2\00", align 1, !dbg !283
@Player_ship = external global ptr, align 8
@.str.16 = private unnamed_addr constant [42 x i8] c"Your DELAYED laser is stuck thru a wall!\0A\00", align 1, !dbg !286
@.str.17 = private unnamed_addr constant [34 x i8] c"Your laser is stuck thru a wall!\0A\00", align 1, !dbg !291
@.str.18 = private unnamed_addr constant [35 x i8] c"Your laser is stuck in an object!\0A\00", align 1, !dbg !296
@.str.19 = private unnamed_addr constant [30 x i8] c"Guided missile %s activated!\0A\00", align 1, !dbg !301
@Missile_viewer = external global ptr, align 8
@Player_fired_laser_this_frame = external global i32, align 4
@.str.20 = private unnamed_addr constant [31 x i8] c"obj->control_type == CT_WEAPON\00", align 1, !dbg !306
@Last_laser_fired_time = global i32 0, align 4, !dbg !311
@Zbonkers = global i32 0, align 4, !dbg !313
@_ZZ22do_laser_firing_playervE17Spreadfire_toggle = internal global i32 0, align 4, !dbg !315
@_ZZ22do_laser_firing_playervE17Helix_orientation = internal global i32 0, align 4, !dbg !321
@Primary_weapon_to_weapon_info = external global [10 x i8], align 1
@Global_laser_firing_count = external global i32, align 4
@Lightning_gun_num = global i32 1, align 4, !dbg !323
@Lightning_start_time = global i32 -655360, align 4, !dbg !325
@Lightning_last_time = global i32 0, align 4, !dbg !327
@.str.21 = private unnamed_addr constant [44 x i8] c"Warning: Lightning bolt has hit seg of -1.\0A\00", align 1, !dbg !329
@.str.22 = private unnamed_addr constant [47 x i8] c"Can't create lightning blob - Out of objects!\0A\00", align 1, !dbg !331
@.str.23 = private unnamed_addr constant [36 x i8] c"Invalid helix_orientation value %x\0A\00", align 1, !dbg !336
@CurrentDataVersion = external global i32, align 4
@.str.24 = private unnamed_addr constant [37 x i8] c"Weapon_info[objp->id].children != -1\00", align 1, !dbg !338
@.str.25 = private unnamed_addr constant [70 x i8] c"Warning -- too many objects near smart bomb explosion.  See laser.c.\0A\00", align 1, !dbg !343
@.str.26 = private unnamed_addr constant [14 x i8] c"blob_id != -1\00", align 1, !dbg !348
@.str.27 = private unnamed_addr constant [24 x i8] c"objp->type == OBJ_ROBOT\00", align 1, !dbg !353
@Missile_gun = global i32 0, align 4, !dbg !358
@Proximity_dropped = global i32 0, align 4, !dbg !360
@Smartmines_dropped = global i32 0, align 4, !dbg !362
@Secondary_weapon = external global i8, align 1
@.str.28 = private unnamed_addr constant [41 x i8] c"Secondary_weapon < MAX_SECONDARY_WEAPONS\00", align 1, !dbg !364
@Secondary_weapon_to_weapon_info = external global [10 x i8], align 1
@Next_missile_fire_time = external global i32, align 4
@Secondary_weapon_to_gun_num = external global [10 x i8], align 1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z12Laser_renderP6object(ptr noundef %0) #0 !dbg !449 {
  %2 = alloca ptr, align 8
  %3 = alloca %struct.bitmap_index, align 2
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !452, !DIExpression(), !453)
  %4 = load ptr, ptr %2, align 8, !dbg !454
  %5 = getelementptr inbounds nuw %struct.object, ptr %4, i32 0, i32 2, !dbg !455
  %6 = load i8, ptr %5, align 1, !dbg !455
  %7 = zext i8 %6 to i64, !dbg !456
  %8 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %7, !dbg !456
  %9 = getelementptr inbounds nuw %struct.weapon_info, ptr %8, i32 0, i32 0, !dbg !457
  %10 = load i8, ptr %9, align 4, !dbg !457
  %11 = sext i8 %10 to i32, !dbg !456
  switch i32 %11, label %26 [
    i32 0, label %12
    i32 1, label %13
    i32 2, label %24
    i32 3, label %25
  ], !dbg !458

12:                                               ; preds = %1
  call void @_Z4Int3v(), !dbg !459
  br label %27, !dbg !461

13:                                               ; preds = %1
  %14 = load ptr, ptr %2, align 8, !dbg !462
  %15 = load ptr, ptr %2, align 8, !dbg !463
  %16 = getelementptr inbounds nuw %struct.object, ptr %15, i32 0, i32 2, !dbg !464
  %17 = load i8, ptr %16, align 1, !dbg !464
  %18 = zext i8 %17 to i64, !dbg !465
  %19 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %18, !dbg !465
  %20 = getelementptr inbounds nuw %struct.weapon_info, ptr %19, i32 0, i32 25, !dbg !466
  call void @llvm.memcpy.p0.p0.i64(ptr align 2 %3, ptr align 4 %20, i64 2, i1 false), !dbg !465
  %21 = getelementptr inbounds nuw %struct.bitmap_index, ptr %3, i32 0, i32 0, !dbg !467
  %22 = load i16, ptr %21, align 2, !dbg !467
  %23 = zext i16 %22 to i64, !dbg !467
  call void @_Z16draw_object_blobP6object12bitmap_index(ptr noundef %14, i64 %23), !dbg !467
  br label %27, !dbg !468

24:                                               ; preds = %1
  br label %27, !dbg !469

25:                                               ; preds = %1
  call void @_Z4Int3v(), !dbg !470
  br label %26, !dbg !470

26:                                               ; preds = %1, %25
  call void (ptr, ...) @_Z5ErrorPKcz(ptr noundef @.str), !dbg !471
  br label %27, !dbg !472

27:                                               ; preds = %26, %24, %13, %12
  ret void, !dbg !473
}

declare void @_Z4Int3v() #1

declare void @_Z16draw_object_blobP6object12bitmap_index(ptr noundef, i64) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

declare void @_Z5ErrorPKcz(ptr noundef, ...) #1

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define noundef i32 @_Z17laser_are_relatedii(i32 noundef %0, i32 noundef %1) #3 !dbg !474 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
    #dbg_declare(ptr %4, !477, !DIExpression(), !478)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !479, !DIExpression(), !480)
  %6 = load i32, ptr %4, align 4, !dbg !481
  %7 = icmp slt i32 %6, 0, !dbg !483
  br i1 %7, label %11, label %8, !dbg !484

8:                                                ; preds = %2
  %9 = load i32, ptr %5, align 4, !dbg !485
  %10 = icmp slt i32 %9, 0, !dbg !486
  br i1 %10, label %11, label %12, !dbg !484

11:                                               ; preds = %8, %2
  store i32 0, ptr %3, align 4, !dbg !487
  br label %356, !dbg !487

12:                                               ; preds = %8
  %13 = load i32, ptr %4, align 4, !dbg !488
  %14 = sext i32 %13 to i64, !dbg !490
  %15 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %14, !dbg !490
  %16 = getelementptr inbounds nuw %struct.object, ptr %15, i32 0, i32 1, !dbg !491
  %17 = load i8, ptr %16, align 4, !dbg !491
  %18 = zext i8 %17 to i32, !dbg !490
  %19 = icmp eq i32 %18, 5, !dbg !492
  br i1 %19, label %20, label %108, !dbg !492

20:                                               ; preds = %12
  %21 = load i32, ptr %4, align 4, !dbg !493
  %22 = sext i32 %21 to i64, !dbg !495
  %23 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %22, !dbg !495
  %24 = getelementptr inbounds nuw %struct.object, ptr %23, i32 0, i32 22, !dbg !496
  %25 = getelementptr inbounds nuw %struct.laser_info_s, ptr %24, i32 0, i32 1, !dbg !497
  %26 = load i16, ptr %25, align 2, !dbg !497
  %27 = sext i16 %26 to i32, !dbg !495
  %28 = load i32, ptr %5, align 4, !dbg !498
  %29 = icmp eq i32 %27, %28, !dbg !499
  br i1 %29, label %30, label %107, !dbg !500

30:                                               ; preds = %20
  %31 = load i32, ptr %4, align 4, !dbg !501
  %32 = sext i32 %31 to i64, !dbg !502
  %33 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %32, !dbg !502
  %34 = getelementptr inbounds nuw %struct.object, ptr %33, i32 0, i32 22, !dbg !503
  %35 = getelementptr inbounds nuw %struct.laser_info_s, ptr %34, i32 0, i32 2, !dbg !504
  %36 = load i32, ptr %35, align 4, !dbg !504
  %37 = load i32, ptr %5, align 4, !dbg !505
  %38 = sext i32 %37 to i64, !dbg !506
  %39 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %38, !dbg !506
  %40 = getelementptr inbounds nuw %struct.object, ptr %39, i32 0, i32 0, !dbg !507
  %41 = load i32, ptr %40, align 4, !dbg !507
  %42 = icmp eq i32 %36, %41, !dbg !508
  br i1 %42, label %43, label %107, !dbg !500

43:                                               ; preds = %30
  %44 = load i32, ptr %4, align 4, !dbg !509
  %45 = sext i32 %44 to i64, !dbg !511
  %46 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %45, !dbg !511
  %47 = getelementptr inbounds nuw %struct.object, ptr %46, i32 0, i32 2, !dbg !512
  %48 = load i8, ptr %47, align 1, !dbg !512
  %49 = zext i8 %48 to i32, !dbg !511
  %50 = icmp eq i32 %49, 34, !dbg !513
  br i1 %50, label %51, label %61, !dbg !514

51:                                               ; preds = %43
  %52 = load i32, ptr @GameTime, align 4, !dbg !515
  %53 = load i32, ptr %4, align 4, !dbg !516
  %54 = sext i32 %53 to i64, !dbg !517
  %55 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %54, !dbg !517
  %56 = getelementptr inbounds nuw %struct.object, ptr %55, i32 0, i32 22, !dbg !518
  %57 = getelementptr inbounds nuw %struct.laser_info_s, ptr %56, i32 0, i32 3, !dbg !519
  %58 = load i32, ptr %57, align 4, !dbg !519
  %59 = add nsw i32 %58, 16384, !dbg !520
  %60 = icmp sgt i32 %52, %59, !dbg !521
  br i1 %60, label %105, label %61, !dbg !522

61:                                               ; preds = %51, %43
  %62 = load i32, ptr %4, align 4, !dbg !523
  %63 = sext i32 %62 to i64, !dbg !524
  %64 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %63, !dbg !524
  %65 = getelementptr inbounds nuw %struct.object, ptr %64, i32 0, i32 2, !dbg !525
  %66 = load i8, ptr %65, align 1, !dbg !525
  %67 = zext i8 %66 to i32, !dbg !524
  %68 = icmp eq i32 %67, 37, !dbg !526
  br i1 %68, label %69, label %79, !dbg !527

69:                                               ; preds = %61
  %70 = load i32, ptr @GameTime, align 4, !dbg !528
  %71 = load i32, ptr %4, align 4, !dbg !529
  %72 = sext i32 %71 to i64, !dbg !530
  %73 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %72, !dbg !530
  %74 = getelementptr inbounds nuw %struct.object, ptr %73, i32 0, i32 22, !dbg !531
  %75 = getelementptr inbounds nuw %struct.laser_info_s, ptr %74, i32 0, i32 3, !dbg !532
  %76 = load i32, ptr %75, align 4, !dbg !532
  %77 = add nsw i32 %76, 131072, !dbg !533
  %78 = icmp sgt i32 %70, %77, !dbg !534
  br i1 %78, label %105, label %79, !dbg !535

79:                                               ; preds = %69, %61
  %80 = load i32, ptr %4, align 4, !dbg !536
  %81 = sext i32 %80 to i64, !dbg !537
  %82 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %81, !dbg !537
  %83 = getelementptr inbounds nuw %struct.object, ptr %82, i32 0, i32 2, !dbg !538
  %84 = load i8, ptr %83, align 1, !dbg !538
  %85 = zext i8 %84 to i32, !dbg !537
  %86 = icmp eq i32 %85, 16, !dbg !539
  br i1 %86, label %95, label %87, !dbg !540

87:                                               ; preds = %79
  %88 = load i32, ptr %4, align 4, !dbg !541
  %89 = sext i32 %88 to i64, !dbg !542
  %90 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %89, !dbg !542
  %91 = getelementptr inbounds nuw %struct.object, ptr %90, i32 0, i32 2, !dbg !543
  %92 = load i8, ptr %91, align 1, !dbg !543
  %93 = zext i8 %92 to i32, !dbg !542
  %94 = icmp eq i32 %93, 38, !dbg !544
  br i1 %94, label %95, label %106, !dbg !545

95:                                               ; preds = %87, %79
  %96 = load i32, ptr @GameTime, align 4, !dbg !546
  %97 = load i32, ptr %4, align 4, !dbg !547
  %98 = sext i32 %97 to i64, !dbg !548
  %99 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %98, !dbg !548
  %100 = getelementptr inbounds nuw %struct.object, ptr %99, i32 0, i32 22, !dbg !549
  %101 = getelementptr inbounds nuw %struct.laser_info_s, ptr %100, i32 0, i32 3, !dbg !550
  %102 = load i32, ptr %101, align 4, !dbg !550
  %103 = add nsw i32 %102, 262144, !dbg !551
  %104 = icmp sgt i32 %96, %103, !dbg !552
  br i1 %104, label %105, label %106, !dbg !535

105:                                              ; preds = %95, %69, %51
  store i32 0, ptr %3, align 4, !dbg !553
  br label %356, !dbg !553

106:                                              ; preds = %95, %87
  store i32 1, ptr %3, align 4, !dbg !555
  br label %356, !dbg !555

107:                                              ; preds = %30, %20
  br label %108, !dbg !556

108:                                              ; preds = %107, %12
  %109 = load i32, ptr %5, align 4, !dbg !557
  %110 = sext i32 %109 to i64, !dbg !559
  %111 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %110, !dbg !559
  %112 = getelementptr inbounds nuw %struct.object, ptr %111, i32 0, i32 1, !dbg !560
  %113 = load i8, ptr %112, align 4, !dbg !560
  %114 = zext i8 %113 to i32, !dbg !559
  %115 = icmp eq i32 %114, 5, !dbg !561
  br i1 %115, label %116, label %204, !dbg !561

116:                                              ; preds = %108
  %117 = load i32, ptr %5, align 4, !dbg !562
  %118 = sext i32 %117 to i64, !dbg !564
  %119 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %118, !dbg !564
  %120 = getelementptr inbounds nuw %struct.object, ptr %119, i32 0, i32 22, !dbg !565
  %121 = getelementptr inbounds nuw %struct.laser_info_s, ptr %120, i32 0, i32 1, !dbg !566
  %122 = load i16, ptr %121, align 2, !dbg !566
  %123 = sext i16 %122 to i32, !dbg !564
  %124 = load i32, ptr %4, align 4, !dbg !567
  %125 = icmp eq i32 %123, %124, !dbg !568
  br i1 %125, label %126, label %203, !dbg !569

126:                                              ; preds = %116
  %127 = load i32, ptr %5, align 4, !dbg !570
  %128 = sext i32 %127 to i64, !dbg !571
  %129 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %128, !dbg !571
  %130 = getelementptr inbounds nuw %struct.object, ptr %129, i32 0, i32 22, !dbg !572
  %131 = getelementptr inbounds nuw %struct.laser_info_s, ptr %130, i32 0, i32 2, !dbg !573
  %132 = load i32, ptr %131, align 4, !dbg !573
  %133 = load i32, ptr %4, align 4, !dbg !574
  %134 = sext i32 %133 to i64, !dbg !575
  %135 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %134, !dbg !575
  %136 = getelementptr inbounds nuw %struct.object, ptr %135, i32 0, i32 0, !dbg !576
  %137 = load i32, ptr %136, align 4, !dbg !576
  %138 = icmp eq i32 %132, %137, !dbg !577
  br i1 %138, label %139, label %203, !dbg !569

139:                                              ; preds = %126
  %140 = load i32, ptr %5, align 4, !dbg !578
  %141 = sext i32 %140 to i64, !dbg !580
  %142 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %141, !dbg !580
  %143 = getelementptr inbounds nuw %struct.object, ptr %142, i32 0, i32 2, !dbg !581
  %144 = load i8, ptr %143, align 1, !dbg !581
  %145 = zext i8 %144 to i32, !dbg !580
  %146 = icmp eq i32 %145, 34, !dbg !582
  br i1 %146, label %147, label %157, !dbg !583

147:                                              ; preds = %139
  %148 = load i32, ptr @GameTime, align 4, !dbg !584
  %149 = load i32, ptr %5, align 4, !dbg !585
  %150 = sext i32 %149 to i64, !dbg !586
  %151 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %150, !dbg !586
  %152 = getelementptr inbounds nuw %struct.object, ptr %151, i32 0, i32 22, !dbg !587
  %153 = getelementptr inbounds nuw %struct.laser_info_s, ptr %152, i32 0, i32 3, !dbg !588
  %154 = load i32, ptr %153, align 4, !dbg !588
  %155 = add nsw i32 %154, 16384, !dbg !589
  %156 = icmp sgt i32 %148, %155, !dbg !590
  br i1 %156, label %201, label %157, !dbg !591

157:                                              ; preds = %147, %139
  %158 = load i32, ptr %5, align 4, !dbg !592
  %159 = sext i32 %158 to i64, !dbg !593
  %160 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %159, !dbg !593
  %161 = getelementptr inbounds nuw %struct.object, ptr %160, i32 0, i32 2, !dbg !594
  %162 = load i8, ptr %161, align 1, !dbg !594
  %163 = zext i8 %162 to i32, !dbg !593
  %164 = icmp eq i32 %163, 37, !dbg !595
  br i1 %164, label %165, label %175, !dbg !596

165:                                              ; preds = %157
  %166 = load i32, ptr @GameTime, align 4, !dbg !597
  %167 = load i32, ptr %5, align 4, !dbg !598
  %168 = sext i32 %167 to i64, !dbg !599
  %169 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %168, !dbg !599
  %170 = getelementptr inbounds nuw %struct.object, ptr %169, i32 0, i32 22, !dbg !600
  %171 = getelementptr inbounds nuw %struct.laser_info_s, ptr %170, i32 0, i32 3, !dbg !601
  %172 = load i32, ptr %171, align 4, !dbg !601
  %173 = add nsw i32 %172, 131072, !dbg !602
  %174 = icmp sgt i32 %166, %173, !dbg !603
  br i1 %174, label %201, label %175, !dbg !604

175:                                              ; preds = %165, %157
  %176 = load i32, ptr %5, align 4, !dbg !605
  %177 = sext i32 %176 to i64, !dbg !606
  %178 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %177, !dbg !606
  %179 = getelementptr inbounds nuw %struct.object, ptr %178, i32 0, i32 2, !dbg !607
  %180 = load i8, ptr %179, align 1, !dbg !607
  %181 = zext i8 %180 to i32, !dbg !606
  %182 = icmp eq i32 %181, 16, !dbg !608
  br i1 %182, label %191, label %183, !dbg !609

183:                                              ; preds = %175
  %184 = load i32, ptr %5, align 4, !dbg !610
  %185 = sext i32 %184 to i64, !dbg !611
  %186 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %185, !dbg !611
  %187 = getelementptr inbounds nuw %struct.object, ptr %186, i32 0, i32 2, !dbg !612
  %188 = load i8, ptr %187, align 1, !dbg !612
  %189 = zext i8 %188 to i32, !dbg !611
  %190 = icmp eq i32 %189, 38, !dbg !613
  br i1 %190, label %191, label %202, !dbg !614

191:                                              ; preds = %183, %175
  %192 = load i32, ptr @GameTime, align 4, !dbg !615
  %193 = load i32, ptr %5, align 4, !dbg !616
  %194 = sext i32 %193 to i64, !dbg !617
  %195 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %194, !dbg !617
  %196 = getelementptr inbounds nuw %struct.object, ptr %195, i32 0, i32 22, !dbg !618
  %197 = getelementptr inbounds nuw %struct.laser_info_s, ptr %196, i32 0, i32 3, !dbg !619
  %198 = load i32, ptr %197, align 4, !dbg !619
  %199 = add nsw i32 %198, 262144, !dbg !620
  %200 = icmp sgt i32 %192, %199, !dbg !621
  br i1 %200, label %201, label %202, !dbg !604

201:                                              ; preds = %191, %165, %147
  store i32 0, ptr %3, align 4, !dbg !622
  br label %356, !dbg !622

202:                                              ; preds = %191, %183
  store i32 1, ptr %3, align 4, !dbg !624
  br label %356, !dbg !624

203:                                              ; preds = %126, %116
  br label %204, !dbg !625

204:                                              ; preds = %203, %108
  %205 = load i32, ptr %4, align 4, !dbg !626
  %206 = sext i32 %205 to i64, !dbg !628
  %207 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %206, !dbg !628
  %208 = getelementptr inbounds nuw %struct.object, ptr %207, i32 0, i32 1, !dbg !629
  %209 = load i8, ptr %208, align 4, !dbg !629
  %210 = zext i8 %209 to i32, !dbg !628
  %211 = icmp ne i32 %210, 5, !dbg !630
  br i1 %211, label %220, label %212, !dbg !631

212:                                              ; preds = %204
  %213 = load i32, ptr %5, align 4, !dbg !632
  %214 = sext i32 %213 to i64, !dbg !633
  %215 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %214, !dbg !633
  %216 = getelementptr inbounds nuw %struct.object, ptr %215, i32 0, i32 1, !dbg !634
  %217 = load i8, ptr %216, align 4, !dbg !634
  %218 = zext i8 %217 to i32, !dbg !633
  %219 = icmp ne i32 %218, 5, !dbg !635
  br i1 %219, label %220, label %221, !dbg !631

220:                                              ; preds = %212, %204
  store i32 0, ptr %3, align 4, !dbg !636
  br label %356, !dbg !636

221:                                              ; preds = %212
  %222 = load i32, ptr %4, align 4, !dbg !637
  %223 = sext i32 %222 to i64, !dbg !639
  %224 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %223, !dbg !639
  %225 = getelementptr inbounds nuw %struct.object, ptr %224, i32 0, i32 22, !dbg !640
  %226 = getelementptr inbounds nuw %struct.laser_info_s, ptr %225, i32 0, i32 2, !dbg !641
  %227 = load i32, ptr %226, align 4, !dbg !641
  %228 = load i32, ptr %5, align 4, !dbg !642
  %229 = sext i32 %228 to i64, !dbg !643
  %230 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %229, !dbg !643
  %231 = getelementptr inbounds nuw %struct.object, ptr %230, i32 0, i32 22, !dbg !644
  %232 = getelementptr inbounds nuw %struct.laser_info_s, ptr %231, i32 0, i32 2, !dbg !645
  %233 = load i32, ptr %232, align 4, !dbg !645
  %234 = icmp eq i32 %227, %233, !dbg !646
  br i1 %234, label %235, label %290, !dbg !646

235:                                              ; preds = %221
  %236 = load i32, ptr %4, align 4, !dbg !647
  %237 = sext i32 %236 to i64, !dbg !649
  %238 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %237, !dbg !649
  %239 = getelementptr inbounds nuw %struct.object, ptr %238, i32 0, i32 2, !dbg !650
  %240 = load i8, ptr %239, align 1, !dbg !650
  %241 = zext i8 %240 to i32, !dbg !649
  %242 = icmp eq i32 %241, 16, !dbg !651
  br i1 %242, label %267, label %243, !dbg !652

243:                                              ; preds = %235
  %244 = load i32, ptr %5, align 4, !dbg !653
  %245 = sext i32 %244 to i64, !dbg !654
  %246 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %245, !dbg !654
  %247 = getelementptr inbounds nuw %struct.object, ptr %246, i32 0, i32 2, !dbg !655
  %248 = load i8, ptr %247, align 1, !dbg !655
  %249 = zext i8 %248 to i32, !dbg !654
  %250 = icmp eq i32 %249, 16, !dbg !656
  br i1 %250, label %267, label %251, !dbg !657

251:                                              ; preds = %243
  %252 = load i32, ptr %4, align 4, !dbg !658
  %253 = sext i32 %252 to i64, !dbg !659
  %254 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %253, !dbg !659
  %255 = getelementptr inbounds nuw %struct.object, ptr %254, i32 0, i32 2, !dbg !660
  %256 = load i8, ptr %255, align 1, !dbg !660
  %257 = zext i8 %256 to i32, !dbg !659
  %258 = icmp eq i32 %257, 38, !dbg !661
  br i1 %258, label %267, label %259, !dbg !662

259:                                              ; preds = %251
  %260 = load i32, ptr %5, align 4, !dbg !663
  %261 = sext i32 %260 to i64, !dbg !664
  %262 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %261, !dbg !664
  %263 = getelementptr inbounds nuw %struct.object, ptr %262, i32 0, i32 2, !dbg !665
  %264 = load i8, ptr %263, align 1, !dbg !665
  %265 = zext i8 %264 to i32, !dbg !664
  %266 = icmp eq i32 %265, 38, !dbg !666
  br i1 %266, label %267, label %289, !dbg !662

267:                                              ; preds = %259, %251, %243, %235
  %268 = load i32, ptr @GameTime, align 4, !dbg !667
  %269 = load i32, ptr %4, align 4, !dbg !670
  %270 = sext i32 %269 to i64, !dbg !671
  %271 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %270, !dbg !671
  %272 = getelementptr inbounds nuw %struct.object, ptr %271, i32 0, i32 22, !dbg !672
  %273 = getelementptr inbounds nuw %struct.laser_info_s, ptr %272, i32 0, i32 3, !dbg !673
  %274 = load i32, ptr %273, align 4, !dbg !673
  %275 = add nsw i32 %274, 32768, !dbg !674
  %276 = icmp sgt i32 %268, %275, !dbg !675
  br i1 %276, label %287, label %277, !dbg !676

277:                                              ; preds = %267
  %278 = load i32, ptr @GameTime, align 4, !dbg !677
  %279 = load i32, ptr %5, align 4, !dbg !678
  %280 = sext i32 %279 to i64, !dbg !679
  %281 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %280, !dbg !679
  %282 = getelementptr inbounds nuw %struct.object, ptr %281, i32 0, i32 22, !dbg !680
  %283 = getelementptr inbounds nuw %struct.laser_info_s, ptr %282, i32 0, i32 3, !dbg !681
  %284 = load i32, ptr %283, align 4, !dbg !681
  %285 = add nsw i32 %284, 32768, !dbg !682
  %286 = icmp sgt i32 %278, %285, !dbg !683
  br i1 %286, label %287, label %288, !dbg !676

287:                                              ; preds = %277, %267
  store i32 0, ptr %3, align 4, !dbg !684
  br label %356, !dbg !684

288:                                              ; preds = %277
  store i32 1, ptr %3, align 4, !dbg !685
  br label %356, !dbg !685

289:                                              ; preds = %259
  store i32 1, ptr %3, align 4, !dbg !686
  br label %356, !dbg !686

290:                                              ; preds = %221
  %291 = load i32, ptr %4, align 4, !dbg !687
  %292 = sext i32 %291 to i64, !dbg !689
  %293 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %292, !dbg !689
  %294 = getelementptr inbounds nuw %struct.object, ptr %293, i32 0, i32 2, !dbg !690
  %295 = load i8, ptr %294, align 1, !dbg !690
  %296 = zext i8 %295 to i32, !dbg !689
  %297 = icmp eq i32 %296, 53, !dbg !691
  br i1 %297, label %354, label %298, !dbg !692

298:                                              ; preds = %290
  %299 = load i32, ptr %5, align 4, !dbg !693
  %300 = sext i32 %299 to i64, !dbg !694
  %301 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %300, !dbg !694
  %302 = getelementptr inbounds nuw %struct.object, ptr %301, i32 0, i32 2, !dbg !695
  %303 = load i8, ptr %302, align 1, !dbg !695
  %304 = zext i8 %303 to i32, !dbg !694
  %305 = icmp eq i32 %304, 53, !dbg !696
  br i1 %305, label %354, label %306, !dbg !697

306:                                              ; preds = %298
  %307 = load i32, ptr %4, align 4, !dbg !698
  %308 = sext i32 %307 to i64, !dbg !699
  %309 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %308, !dbg !699
  %310 = getelementptr inbounds nuw %struct.object, ptr %309, i32 0, i32 2, !dbg !700
  %311 = load i8, ptr %310, align 1, !dbg !700
  %312 = zext i8 %311 to i32, !dbg !699
  %313 = icmp eq i32 %312, 16, !dbg !701
  br i1 %313, label %354, label %314, !dbg !702

314:                                              ; preds = %306
  %315 = load i32, ptr %5, align 4, !dbg !703
  %316 = sext i32 %315 to i64, !dbg !704
  %317 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %316, !dbg !704
  %318 = getelementptr inbounds nuw %struct.object, ptr %317, i32 0, i32 2, !dbg !705
  %319 = load i8, ptr %318, align 1, !dbg !705
  %320 = zext i8 %319 to i32, !dbg !704
  %321 = icmp eq i32 %320, 16, !dbg !706
  br i1 %321, label %354, label %322, !dbg !707

322:                                              ; preds = %314
  %323 = load i32, ptr %4, align 4, !dbg !708
  %324 = sext i32 %323 to i64, !dbg !709
  %325 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %324, !dbg !709
  %326 = getelementptr inbounds nuw %struct.object, ptr %325, i32 0, i32 2, !dbg !710
  %327 = load i8, ptr %326, align 1, !dbg !710
  %328 = zext i8 %327 to i32, !dbg !709
  %329 = icmp eq i32 %328, 38, !dbg !711
  br i1 %329, label %354, label %330, !dbg !712

330:                                              ; preds = %322
  %331 = load i32, ptr %5, align 4, !dbg !713
  %332 = sext i32 %331 to i64, !dbg !714
  %333 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %332, !dbg !714
  %334 = getelementptr inbounds nuw %struct.object, ptr %333, i32 0, i32 2, !dbg !715
  %335 = load i8, ptr %334, align 1, !dbg !715
  %336 = zext i8 %335 to i32, !dbg !714
  %337 = icmp eq i32 %336, 38, !dbg !716
  br i1 %337, label %354, label %338, !dbg !717

338:                                              ; preds = %330
  %339 = load i32, ptr %4, align 4, !dbg !718
  %340 = sext i32 %339 to i64, !dbg !719
  %341 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %340, !dbg !719
  %342 = getelementptr inbounds nuw %struct.object, ptr %341, i32 0, i32 2, !dbg !720
  %343 = load i8, ptr %342, align 1, !dbg !720
  %344 = zext i8 %343 to i32, !dbg !719
  %345 = icmp eq i32 %344, 51, !dbg !721
  br i1 %345, label %354, label %346, !dbg !722

346:                                              ; preds = %338
  %347 = load i32, ptr %5, align 4, !dbg !723
  %348 = sext i32 %347 to i64, !dbg !724
  %349 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %348, !dbg !724
  %350 = getelementptr inbounds nuw %struct.object, ptr %349, i32 0, i32 2, !dbg !725
  %351 = load i8, ptr %350, align 1, !dbg !725
  %352 = zext i8 %351 to i32, !dbg !724
  %353 = icmp eq i32 %352, 51, !dbg !726
  br i1 %353, label %354, label %355, !dbg !722

354:                                              ; preds = %346, %338, %330, %322, %314, %306, %298, %290
  store i32 0, ptr %3, align 4, !dbg !727
  br label %356, !dbg !727

355:                                              ; preds = %346
  store i32 1, ptr %3, align 4, !dbg !728
  br label %356, !dbg !728

356:                                              ; preds = %355, %354, %289, %288, %287, %220, %202, %201, %106, %105, %11
  %357 = load i32, ptr %3, align 4, !dbg !729
  ret i32 %357, !dbg !729
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z15do_muzzle_stuffiP10vms_vector(i32 noundef %0, ptr noundef %1) #0 !dbg !730 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !734, !DIExpression(), !735)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !736, !DIExpression(), !737)
  %5 = call noundef i32 @_Z23timer_get_fixed_secondsv(), !dbg !738
  %6 = load i32, ptr @Muzzle_queue_index, align 4, !dbg !739
  %7 = sext i32 %6 to i64, !dbg !740
  %8 = getelementptr inbounds [8 x %struct.muzzle_info], ptr @Muzzle_data, i64 0, i64 %7, !dbg !740
  %9 = getelementptr inbounds nuw %struct.muzzle_info, ptr %8, i32 0, i32 0, !dbg !741
  store i32 %5, ptr %9, align 4, !dbg !742
  %10 = load i32, ptr %3, align 4, !dbg !743
  %11 = trunc i32 %10 to i16, !dbg !743
  %12 = load i32, ptr @Muzzle_queue_index, align 4, !dbg !744
  %13 = sext i32 %12 to i64, !dbg !745
  %14 = getelementptr inbounds [8 x %struct.muzzle_info], ptr @Muzzle_data, i64 0, i64 %13, !dbg !745
  %15 = getelementptr inbounds nuw %struct.muzzle_info, ptr %14, i32 0, i32 1, !dbg !746
  store i16 %11, ptr %15, align 4, !dbg !747
  %16 = load ptr, ptr %4, align 8, !dbg !748
  %17 = load i32, ptr @Muzzle_queue_index, align 4, !dbg !749
  %18 = sext i32 %17 to i64, !dbg !750
  %19 = getelementptr inbounds [8 x %struct.muzzle_info], ptr @Muzzle_data, i64 0, i64 %18, !dbg !750
  %20 = getelementptr inbounds nuw %struct.muzzle_info, ptr %19, i32 0, i32 2, !dbg !751
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %20, ptr align 4 %16, i64 12, i1 false), !dbg !752
  %21 = load i32, ptr @Muzzle_queue_index, align 4, !dbg !753
  %22 = add nsw i32 %21, 1, !dbg !753
  store i32 %22, ptr @Muzzle_queue_index, align 4, !dbg !753
  %23 = load i32, ptr @Muzzle_queue_index, align 4, !dbg !754
  %24 = icmp sge i32 %23, 8, !dbg !756
  br i1 %24, label %25, label %26, !dbg !756

25:                                               ; preds = %2
  store i32 0, ptr @Muzzle_queue_index, align 4, !dbg !757
  br label %26, !dbg !758

26:                                               ; preds = %25, %2
  ret void, !dbg !759
}

declare noundef i32 @_Z23timer_get_fixed_secondsv() #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z20create_weapon_objectiiP10vms_vector(i32 noundef %0, i32 noundef %1, ptr noundef %2) #0 !dbg !760 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  store i32 %0, ptr %4, align 4
    #dbg_declare(ptr %4, !763, !DIExpression(), !764)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !765, !DIExpression(), !766)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !767, !DIExpression(), !768)
    #dbg_declare(ptr %7, !769, !DIExpression(), !770)
  store i32 -1, ptr %7, align 4, !dbg !770
    #dbg_declare(ptr %8, !771, !DIExpression(), !772)
  store i32 -1, ptr %8, align 4, !dbg !772
    #dbg_declare(ptr %9, !773, !DIExpression(), !774)
    #dbg_declare(ptr %10, !775, !DIExpression(), !776)
  %11 = load i32, ptr %4, align 4, !dbg !777
  %12 = sext i32 %11 to i64, !dbg !778
  %13 = getelementptr inbounds [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %12, !dbg !778
  %14 = getelementptr inbounds nuw %struct.weapon_info, ptr %13, i32 0, i32 0, !dbg !779
  %15 = load i8, ptr %14, align 4, !dbg !779
  %16 = sext i8 %15 to i32, !dbg !778
  switch i32 %16, label %32 [
    i32 1, label %17
    i32 2, label %23
    i32 0, label %24
    i32 -1, label %25
    i32 3, label %26
  ], !dbg !780

17:                                               ; preds = %3
  store i32 3, ptr %7, align 4, !dbg !781
  %18 = load i32, ptr %4, align 4, !dbg !783
  %19 = sext i32 %18 to i64, !dbg !784
  %20 = getelementptr inbounds [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %19, !dbg !784
  %21 = getelementptr inbounds nuw %struct.weapon_info, ptr %20, i32 0, i32 26, !dbg !785
  %22 = load i32, ptr %21, align 4, !dbg !785
  store i32 %22, ptr %8, align 4, !dbg !786
  br label %33, !dbg !787

23:                                               ; preds = %3
  store i32 0, ptr %8, align 4, !dbg !788
  store i32 1, ptr %7, align 4, !dbg !789
  br label %33, !dbg !790

24:                                               ; preds = %3
  call void @_Z4Int3v(), !dbg !791
  br label %33, !dbg !792

25:                                               ; preds = %3
  store i32 0, ptr %7, align 4, !dbg !793
  store i32 65536, ptr %8, align 4, !dbg !794
  br label %33, !dbg !795

26:                                               ; preds = %3
  store i32 7, ptr %7, align 4, !dbg !796
  %27 = load i32, ptr %4, align 4, !dbg !797
  %28 = sext i32 %27 to i64, !dbg !798
  %29 = getelementptr inbounds [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %28, !dbg !798
  %30 = getelementptr inbounds nuw %struct.weapon_info, ptr %29, i32 0, i32 26, !dbg !799
  %31 = load i32, ptr %30, align 4, !dbg !799
  store i32 %31, ptr %8, align 4, !dbg !800
  br label %33, !dbg !801

32:                                               ; preds = %3
  call void (ptr, ...) @_Z5ErrorPKcz(ptr noundef @.str.1), !dbg !802
  br label %33, !dbg !803

33:                                               ; preds = %32, %26, %25, %24, %23, %17
  %34 = load i32, ptr %8, align 4, !dbg !804
  %35 = icmp ne i32 %34, -1, !dbg !804
  %36 = zext i1 %35 to i32, !dbg !804
  call void @_Z7_AssertiPKcS0_i(i32 noundef %36, ptr noundef @.str.2, ptr noundef @.str.3, i32 noundef 263), !dbg !804
  %37 = load i32, ptr %7, align 4, !dbg !805
  %38 = icmp ne i32 %37, -1, !dbg !805
  %39 = zext i1 %38 to i32, !dbg !805
  call void @_Z7_AssertiPKcS0_i(i32 noundef %39, ptr noundef @.str.4, ptr noundef @.str.3, i32 noundef 264), !dbg !805
  %40 = load i32, ptr %4, align 4, !dbg !806
  %41 = trunc i32 %40 to i8, !dbg !806
  %42 = load i32, ptr %5, align 4, !dbg !807
  %43 = load ptr, ptr %6, align 8, !dbg !808
  %44 = load i32, ptr %8, align 4, !dbg !809
  %45 = load i32, ptr %7, align 4, !dbg !810
  %46 = trunc i32 %45 to i8, !dbg !810
  %47 = call noundef i32 @_Z10obj_createhhiP10vms_vectorP10vms_matrixihhh(i8 noundef zeroext 5, i8 noundef zeroext %41, i32 noundef %42, ptr noundef %43, ptr noundef null, i32 noundef %44, i8 noundef zeroext 9, i8 noundef zeroext 1, i8 noundef zeroext %46), !dbg !811
  store i32 %47, ptr %9, align 4, !dbg !812
  %48 = load i32, ptr %9, align 4, !dbg !813
  %49 = sext i32 %48 to i64, !dbg !814
  %50 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %49, !dbg !814
  store ptr %50, ptr %10, align 8, !dbg !815
  %51 = load i32, ptr %4, align 4, !dbg !816
  %52 = sext i32 %51 to i64, !dbg !818
  %53 = getelementptr inbounds [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %52, !dbg !818
  %54 = getelementptr inbounds nuw %struct.weapon_info, ptr %53, i32 0, i32 0, !dbg !819
  %55 = load i8, ptr %54, align 4, !dbg !819
  %56 = sext i8 %55 to i32, !dbg !818
  %57 = icmp eq i32 %56, 2, !dbg !820
  br i1 %57, label %58, label %88, !dbg !820

58:                                               ; preds = %33
  %59 = load ptr, ptr %10, align 8, !dbg !821
  %60 = getelementptr inbounds nuw %struct.object, ptr %59, i32 0, i32 2, !dbg !823
  %61 = load i8, ptr %60, align 1, !dbg !823
  %62 = zext i8 %61 to i64, !dbg !824
  %63 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %62, !dbg !824
  %64 = getelementptr inbounds nuw %struct.weapon_info, ptr %63, i32 0, i32 2, !dbg !825
  %65 = load i16, ptr %64, align 2, !dbg !825
  %66 = sext i16 %65 to i32, !dbg !824
  %67 = load ptr, ptr %10, align 8, !dbg !826
  %68 = getelementptr inbounds nuw %struct.object, ptr %67, i32 0, i32 23, !dbg !827
  %69 = getelementptr inbounds nuw %struct.polyobj_info, ptr %68, i32 0, i32 0, !dbg !828
  store i32 %66, ptr %69, align 4, !dbg !829
  %70 = load ptr, ptr %10, align 8, !dbg !830
  %71 = getelementptr inbounds nuw %struct.object, ptr %70, i32 0, i32 23, !dbg !831
  %72 = getelementptr inbounds nuw %struct.polyobj_info, ptr %71, i32 0, i32 0, !dbg !832
  %73 = load i32, ptr %72, align 4, !dbg !832
  %74 = sext i32 %73 to i64, !dbg !833
  %75 = getelementptr inbounds [0 x %struct.polymodel], ptr @Polygon_models, i64 0, i64 %74, !dbg !833
  %76 = getelementptr inbounds nuw %struct.polymodel, ptr %75, i32 0, i32 13, !dbg !834
  %77 = load i32, ptr %76, align 4, !dbg !834
  %78 = load ptr, ptr %10, align 8, !dbg !835
  %79 = getelementptr inbounds nuw %struct.object, ptr %78, i32 0, i32 2, !dbg !836
  %80 = load i8, ptr %79, align 1, !dbg !836
  %81 = zext i8 %80 to i64, !dbg !837
  %82 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %81, !dbg !837
  %83 = getelementptr inbounds nuw %struct.weapon_info, ptr %82, i32 0, i32 34, !dbg !838
  %84 = load i32, ptr %83, align 4, !dbg !838
  %85 = call noundef i32 @_Z6fixdivii(i32 noundef %77, i32 noundef %84), !dbg !839
  %86 = load ptr, ptr %10, align 8, !dbg !840
  %87 = getelementptr inbounds nuw %struct.object, ptr %86, i32 0, i32 13, !dbg !841
  store i32 %85, ptr %87, align 4, !dbg !842
  br label %88, !dbg !843

88:                                               ; preds = %58, %33
  %89 = load i32, ptr %4, align 4, !dbg !844
  %90 = sext i32 %89 to i64, !dbg !845
  %91 = getelementptr inbounds [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %90, !dbg !845
  %92 = getelementptr inbounds nuw %struct.weapon_info, ptr %91, i32 0, i32 31, !dbg !846
  %93 = load i32, ptr %92, align 4, !dbg !846
  %94 = load ptr, ptr %10, align 8, !dbg !847
  %95 = getelementptr inbounds nuw %struct.object, ptr %94, i32 0, i32 21, !dbg !848
  %96 = getelementptr inbounds nuw %struct.physics_info, ptr %95, i32 0, i32 2, !dbg !849
  store i32 %93, ptr %96, align 4, !dbg !850
  %97 = load i32, ptr %4, align 4, !dbg !851
  %98 = sext i32 %97 to i64, !dbg !852
  %99 = getelementptr inbounds [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %98, !dbg !852
  %100 = getelementptr inbounds nuw %struct.weapon_info, ptr %99, i32 0, i32 32, !dbg !853
  %101 = load i32, ptr %100, align 4, !dbg !853
  %102 = load ptr, ptr %10, align 8, !dbg !854
  %103 = getelementptr inbounds nuw %struct.object, ptr %102, i32 0, i32 21, !dbg !855
  %104 = getelementptr inbounds nuw %struct.physics_info, ptr %103, i32 0, i32 3, !dbg !856
  store i32 %101, ptr %104, align 4, !dbg !857
  %105 = load ptr, ptr %10, align 8, !dbg !858
  %106 = getelementptr inbounds nuw %struct.object, ptr %105, i32 0, i32 21, !dbg !858
  %107 = getelementptr inbounds nuw %struct.physics_info, ptr %106, i32 0, i32 1, !dbg !858
  %108 = getelementptr inbounds nuw %struct.vms_vector, ptr %107, i32 0, i32 2, !dbg !858
  store i32 0, ptr %108, align 4, !dbg !858
  %109 = load ptr, ptr %10, align 8, !dbg !858
  %110 = getelementptr inbounds nuw %struct.object, ptr %109, i32 0, i32 21, !dbg !858
  %111 = getelementptr inbounds nuw %struct.physics_info, ptr %110, i32 0, i32 1, !dbg !858
  %112 = getelementptr inbounds nuw %struct.vms_vector, ptr %111, i32 0, i32 1, !dbg !858
  store i32 0, ptr %112, align 4, !dbg !858
  %113 = load ptr, ptr %10, align 8, !dbg !858
  %114 = getelementptr inbounds nuw %struct.object, ptr %113, i32 0, i32 21, !dbg !858
  %115 = getelementptr inbounds nuw %struct.physics_info, ptr %114, i32 0, i32 1, !dbg !858
  %116 = getelementptr inbounds nuw %struct.vms_vector, ptr %115, i32 0, i32 0, !dbg !858
  store i32 0, ptr %116, align 4, !dbg !858
  %117 = load i32, ptr %4, align 4, !dbg !859
  %118 = sext i32 %117 to i64, !dbg !861
  %119 = getelementptr inbounds [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %118, !dbg !861
  %120 = getelementptr inbounds nuw %struct.weapon_info, ptr %119, i32 0, i32 15, !dbg !862
  %121 = load i8, ptr %120, align 4, !dbg !862
  %122 = sext i8 %121 to i32, !dbg !861
  %123 = icmp eq i32 %122, 1, !dbg !863
  br i1 %123, label %124, label %132, !dbg !863

124:                                              ; preds = %88
  %125 = load ptr, ptr %10, align 8, !dbg !864
  %126 = getelementptr inbounds nuw %struct.object, ptr %125, i32 0, i32 21, !dbg !865
  %127 = getelementptr inbounds nuw %struct.physics_info, ptr %126, i32 0, i32 8, !dbg !866
  %128 = load i16, ptr %127, align 2, !dbg !867
  %129 = zext i16 %128 to i32, !dbg !867
  %130 = or i32 %129, 4, !dbg !867
  %131 = trunc i32 %130 to i16, !dbg !867
  store i16 %131, ptr %127, align 2, !dbg !867
  br label %132, !dbg !864

132:                                              ; preds = %124, %88
  %133 = load i32, ptr %4, align 4, !dbg !868
  %134 = sext i32 %133 to i64, !dbg !870
  %135 = getelementptr inbounds [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %134, !dbg !870
  %136 = getelementptr inbounds nuw %struct.weapon_info, ptr %135, i32 0, i32 15, !dbg !871
  %137 = load i8, ptr %136, align 4, !dbg !871
  %138 = sext i8 %137 to i32, !dbg !870
  %139 = icmp eq i32 %138, 2, !dbg !872
  br i1 %139, label %143, label %140, !dbg !873

140:                                              ; preds = %132
  %141 = load i8, ptr @BounceCheat, align 1, !dbg !874
  %142 = icmp ne i8 %141, 0, !dbg !874
  br i1 %142, label %143, label %151, !dbg !873

143:                                              ; preds = %140, %132
  %144 = load ptr, ptr %10, align 8, !dbg !875
  %145 = getelementptr inbounds nuw %struct.object, ptr %144, i32 0, i32 21, !dbg !876
  %146 = getelementptr inbounds nuw %struct.physics_info, ptr %145, i32 0, i32 8, !dbg !877
  %147 = load i16, ptr %146, align 2, !dbg !878
  %148 = zext i16 %147 to i32, !dbg !878
  %149 = or i32 %148, 516, !dbg !878
  %150 = trunc i32 %149 to i16, !dbg !878
  store i16 %150, ptr %146, align 2, !dbg !878
  br label %151, !dbg !875

151:                                              ; preds = %143, %140
  %152 = load i32, ptr %9, align 4, !dbg !879
  ret i32 %152, !dbg !880
}

declare void @_Z7_AssertiPKcS0_i(i32 noundef, ptr noundef, ptr noundef, i32 noundef) #1

declare noundef i32 @_Z10obj_createhhiP10vms_vectorP10vms_matrixihhh(i8 noundef zeroext, i8 noundef zeroext, i32 noundef, ptr noundef, ptr noundef, i32 noundef, i8 noundef zeroext, i8 noundef zeroext, i8 noundef zeroext) #1

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z6fixdivii(i32 noundef %0, i32 noundef %1) #3 !dbg !881 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
    #dbg_declare(ptr %4, !884, !DIExpression(), !885)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !886, !DIExpression(), !887)
  %6 = load i32, ptr %5, align 4, !dbg !888
  %7 = icmp eq i32 %6, 0, !dbg !890
  br i1 %7, label %8, label %9, !dbg !890

8:                                                ; preds = %2
  store i32 1, ptr %3, align 4, !dbg !891
  br label %17, !dbg !891

9:                                                ; preds = %2
  %10 = load i32, ptr %4, align 4, !dbg !892
  %11 = sext i32 %10 to i64, !dbg !892
  %12 = shl i64 %11, 16, !dbg !893
  %13 = load i32, ptr %5, align 4, !dbg !894
  %14 = sext i32 %13 to i64, !dbg !894
  %15 = sdiv i64 %12, %14, !dbg !895
  %16 = trunc i64 %15 to i32, !dbg !896
  store i32 %16, ptr %3, align 4, !dbg !897
  br label %17, !dbg !897

17:                                               ; preds = %9, %8
  %18 = load i32, ptr %3, align 4, !dbg !898
  ret i32 %18, !dbg !898
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z22delete_old_omega_blobsP6object(ptr noundef %0) #0 !dbg !899 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !900, !DIExpression(), !901)
    #dbg_declare(ptr %3, !902, !DIExpression(), !903)
    #dbg_declare(ptr %4, !904, !DIExpression(), !905)
    #dbg_declare(ptr %5, !906, !DIExpression(), !907)
  store i32 0, ptr %5, align 4, !dbg !907
  %6 = load ptr, ptr %2, align 8, !dbg !908
  %7 = getelementptr inbounds nuw %struct.object, ptr %6, i32 0, i32 22, !dbg !909
  %8 = getelementptr inbounds nuw %struct.laser_info_s, ptr %7, i32 0, i32 1, !dbg !910
  %9 = load i16, ptr %8, align 2, !dbg !910
  %10 = sext i16 %9 to i32, !dbg !908
  store i32 %10, ptr %4, align 4, !dbg !911
  store i32 0, ptr %3, align 4, !dbg !912
  br label %11, !dbg !914

11:                                               ; preds = %48, %1
  %12 = load i32, ptr %3, align 4, !dbg !915
  %13 = load i32, ptr @Highest_object_index, align 4, !dbg !917
  %14 = icmp sle i32 %12, %13, !dbg !918
  br i1 %14, label %15, label %51, !dbg !919

15:                                               ; preds = %11
  %16 = load i32, ptr %3, align 4, !dbg !920
  %17 = sext i32 %16 to i64, !dbg !922
  %18 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %17, !dbg !922
  %19 = getelementptr inbounds nuw %struct.object, ptr %18, i32 0, i32 1, !dbg !923
  %20 = load i8, ptr %19, align 4, !dbg !923
  %21 = zext i8 %20 to i32, !dbg !922
  %22 = icmp eq i32 %21, 5, !dbg !924
  br i1 %22, label %23, label %47, !dbg !924

23:                                               ; preds = %15
  %24 = load i32, ptr %3, align 4, !dbg !925
  %25 = sext i32 %24 to i64, !dbg !927
  %26 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %25, !dbg !927
  %27 = getelementptr inbounds nuw %struct.object, ptr %26, i32 0, i32 2, !dbg !928
  %28 = load i8, ptr %27, align 1, !dbg !928
  %29 = zext i8 %28 to i32, !dbg !927
  %30 = icmp eq i32 %29, 35, !dbg !929
  br i1 %30, label %31, label %46, !dbg !929

31:                                               ; preds = %23
  %32 = load i32, ptr %3, align 4, !dbg !930
  %33 = sext i32 %32 to i64, !dbg !932
  %34 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %33, !dbg !932
  %35 = getelementptr inbounds nuw %struct.object, ptr %34, i32 0, i32 22, !dbg !933
  %36 = getelementptr inbounds nuw %struct.laser_info_s, ptr %35, i32 0, i32 1, !dbg !934
  %37 = load i16, ptr %36, align 2, !dbg !934
  %38 = sext i16 %37 to i32, !dbg !932
  %39 = load i32, ptr %4, align 4, !dbg !935
  %40 = icmp eq i32 %38, %39, !dbg !936
  br i1 %40, label %41, label %45, !dbg !936

41:                                               ; preds = %31
  %42 = load i32, ptr %3, align 4, !dbg !937
  call void @_Z10obj_deletei(i32 noundef %42), !dbg !939
  %43 = load i32, ptr %5, align 4, !dbg !940
  %44 = add nsw i32 %43, 1, !dbg !940
  store i32 %44, ptr %5, align 4, !dbg !940
  br label %45, !dbg !941

45:                                               ; preds = %41, %31
  br label %46, !dbg !935

46:                                               ; preds = %45, %23
  br label %47, !dbg !942

47:                                               ; preds = %46, %15
  br label %48, !dbg !943

48:                                               ; preds = %47
  %49 = load i32, ptr %3, align 4, !dbg !944
  %50 = add nsw i32 %49, 1, !dbg !944
  store i32 %50, ptr %3, align 4, !dbg !944
  br label %11, !dbg !945, !llvm.loop !946

51:                                               ; preds = %11
  %52 = load i32, ptr %5, align 4, !dbg !949
  %53 = load i32, ptr @FrameCount, align 4, !dbg !949
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.5, i32 noundef %52, i32 noundef %53), !dbg !949
  ret void, !dbg !950
}

declare void @_Z10obj_deletei(i32 noundef) #1

declare void @_Z8_mprintfiPKcz(i32 noundef, ptr noundef, ...) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z18create_omega_blobsiP10vms_vectorS0_P6object(i32 noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 !dbg !951 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca %struct.vms_vector, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca %struct.vms_vector, align 4
  %17 = alloca %struct.vms_vector, align 4
  %18 = alloca %struct.vms_vector, align 4
  %19 = alloca [16 x i32], align 4
  %20 = alloca %struct.vms_vector, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca %struct.vms_vector, align 4
  %24 = alloca ptr, align 8
  store i32 %0, ptr %5, align 4
    #dbg_declare(ptr %5, !954, !DIExpression(), !955)
  store ptr %1, ptr %6, align 8
    #dbg_declare(ptr %6, !956, !DIExpression(), !957)
  store ptr %2, ptr %7, align 8
    #dbg_declare(ptr %7, !958, !DIExpression(), !959)
  store ptr %3, ptr %8, align 8
    #dbg_declare(ptr %8, !960, !DIExpression(), !961)
    #dbg_declare(ptr %9, !962, !DIExpression(), !963)
    #dbg_declare(ptr %10, !964, !DIExpression(), !965)
    #dbg_declare(ptr %11, !966, !DIExpression(), !967)
  store i32 -1, ptr %11, align 4, !dbg !967
    #dbg_declare(ptr %12, !968, !DIExpression(), !969)
    #dbg_declare(ptr %13, !970, !DIExpression(), !971)
    #dbg_declare(ptr %14, !972, !DIExpression(), !973)
    #dbg_declare(ptr %15, !974, !DIExpression(), !975)
    #dbg_declare(ptr %16, !976, !DIExpression(), !977)
    #dbg_declare(ptr %17, !978, !DIExpression(), !979)
    #dbg_declare(ptr %18, !980, !DIExpression(), !981)
    #dbg_declare(ptr %19, !982, !DIExpression(), !986)
  %25 = load i32, ptr @Game_mode, align 4, !dbg !987
  %26 = and i32 %25, 38, !dbg !989
  %27 = icmp ne i32 %26, 0, !dbg !987
  br i1 %27, label %28, label %30, !dbg !987

28:                                               ; preds = %4
  %29 = load ptr, ptr %8, align 8, !dbg !990
  call void @_Z22delete_old_omega_blobsP6object(ptr noundef %29), !dbg !991
  br label %30, !dbg !991

30:                                               ; preds = %28, %4
  %31 = load ptr, ptr %7, align 8, !dbg !992
  %32 = load ptr, ptr %6, align 8, !dbg !993
  %33 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %12, ptr noundef %31, ptr noundef %32), !dbg !994
  %34 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %12), !dbg !995
  store i32 %34, ptr %13, align 4, !dbg !996
  %35 = load i32, ptr %13, align 4, !dbg !997
  %36 = icmp slt i32 %35, 589824, !dbg !999
  br i1 %36, label %37, label %45, !dbg !999

37:                                               ; preds = %30
  store i32 196608, ptr %15, align 4, !dbg !1000
  %38 = load i32, ptr %13, align 4, !dbg !1002
  %39 = load i32, ptr %15, align 4, !dbg !1003
  %40 = sdiv i32 %38, %39, !dbg !1004
  store i32 %40, ptr %14, align 4, !dbg !1005
  %41 = load i32, ptr %14, align 4, !dbg !1006
  %42 = icmp eq i32 %41, 0, !dbg !1008
  br i1 %42, label %43, label %44, !dbg !1008

43:                                               ; preds = %37
  store i32 1, ptr %14, align 4, !dbg !1009
  br label %44, !dbg !1010

44:                                               ; preds = %43, %37
  br label %64, !dbg !1011

45:                                               ; preds = %30
  store i32 327680, ptr %15, align 4, !dbg !1012
  %46 = load i32, ptr %13, align 4, !dbg !1014
  %47 = load i32, ptr %15, align 4, !dbg !1015
  %48 = sdiv i32 %46, %47, !dbg !1016
  store i32 %48, ptr %14, align 4, !dbg !1017
  %49 = load i32, ptr %14, align 4, !dbg !1018
  %50 = icmp sgt i32 %49, 16, !dbg !1020
  br i1 %50, label %51, label %55, !dbg !1020

51:                                               ; preds = %45
  store i32 16, ptr %14, align 4, !dbg !1021
  %52 = load i32, ptr %13, align 4, !dbg !1023
  %53 = load i32, ptr %14, align 4, !dbg !1024
  %54 = sdiv i32 %52, %53, !dbg !1025
  store i32 %54, ptr %15, align 4, !dbg !1026
  br label %63, !dbg !1027

55:                                               ; preds = %45
  %56 = load i32, ptr %14, align 4, !dbg !1028
  %57 = icmp slt i32 %56, 3, !dbg !1030
  br i1 %57, label %58, label %62, !dbg !1030

58:                                               ; preds = %55
  store i32 3, ptr %14, align 4, !dbg !1031
  %59 = load i32, ptr %13, align 4, !dbg !1033
  %60 = load i32, ptr %14, align 4, !dbg !1034
  %61 = sdiv i32 %59, %60, !dbg !1035
  store i32 %61, ptr %15, align 4, !dbg !1036
  br label %62, !dbg !1037

62:                                               ; preds = %58, %55
  br label %63

63:                                               ; preds = %62, %51
  br label %64

64:                                               ; preds = %63, %44
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %16, ptr align 4 %12, i64 12, i1 false), !dbg !1038
  %65 = load i32, ptr %15, align 4, !dbg !1039
  %66 = call noundef ptr @_Z12vm_vec_scaleP10vms_vectori(ptr noundef %16, i32 noundef %65), !dbg !1040
  %67 = load ptr, ptr %6, align 8, !dbg !1041
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %17, ptr align 4 %67, i64 12, i1 false), !dbg !1042
  %68 = load i32, ptr %5, align 4, !dbg !1043
  store i32 %68, ptr %10, align 4, !dbg !1044
  %69 = load i32, ptr %13, align 4, !dbg !1045
  %70 = icmp slt i32 %69, 786432, !dbg !1047
  br i1 %70, label %71, label %84, !dbg !1047

71:                                               ; preds = %64
  store i32 0, ptr %9, align 4, !dbg !1048
  br label %72, !dbg !1051

72:                                               ; preds = %80, %71
  %73 = load i32, ptr %9, align 4, !dbg !1052
  %74 = load i32, ptr %14, align 4, !dbg !1054
  %75 = icmp slt i32 %73, %74, !dbg !1055
  br i1 %75, label %76, label %83, !dbg !1056

76:                                               ; preds = %72
  %77 = load i32, ptr %9, align 4, !dbg !1057
  %78 = sext i32 %77 to i64, !dbg !1058
  %79 = getelementptr inbounds [16 x i32], ptr %19, i64 0, i64 %78, !dbg !1058
  store i32 0, ptr %79, align 4, !dbg !1059
  br label %80, !dbg !1058

80:                                               ; preds = %76
  %81 = load i32, ptr %9, align 4, !dbg !1060
  %82 = add nsw i32 %81, 1, !dbg !1060
  store i32 %82, ptr %9, align 4, !dbg !1060
  br label %72, !dbg !1061, !llvm.loop !1062

83:                                               ; preds = %72
  br label %110, !dbg !1064

84:                                               ; preds = %64
  %85 = call noundef ptr @_Z17vm_vec_scale_add2P10vms_vectorS0_i(ptr noundef %17, ptr noundef %16, i32 noundef 32768), !dbg !1065
  store i32 0, ptr %9, align 4, !dbg !1067
  br label %86, !dbg !1069

86:                                               ; preds = %106, %84
  %87 = load i32, ptr %9, align 4, !dbg !1070
  %88 = load i32, ptr %14, align 4, !dbg !1072
  %89 = sdiv i32 %88, 2, !dbg !1073
  %90 = icmp slt i32 %87, %89, !dbg !1074
  br i1 %90, label %91, label %109, !dbg !1075

91:                                               ; preds = %86
  %92 = load i32, ptr %9, align 4, !dbg !1076
  %93 = mul nsw i32 65536, %92, !dbg !1078
  %94 = add nsw i32 %93, 16384, !dbg !1079
  %95 = load i32, ptr %9, align 4, !dbg !1080
  %96 = sext i32 %95 to i64, !dbg !1081
  %97 = getelementptr inbounds [16 x i32], ptr %19, i64 0, i64 %96, !dbg !1081
  store i32 %94, ptr %97, align 4, !dbg !1082
  %98 = load i32, ptr %9, align 4, !dbg !1083
  %99 = mul nsw i32 65536, %98, !dbg !1084
  %100 = load i32, ptr %14, align 4, !dbg !1085
  %101 = sub nsw i32 %100, 1, !dbg !1086
  %102 = load i32, ptr %9, align 4, !dbg !1087
  %103 = sub nsw i32 %101, %102, !dbg !1088
  %104 = sext i32 %103 to i64, !dbg !1089
  %105 = getelementptr inbounds [16 x i32], ptr %19, i64 0, i64 %104, !dbg !1089
  store i32 %99, ptr %105, align 4, !dbg !1090
  br label %106, !dbg !1091

106:                                              ; preds = %91
  %107 = load i32, ptr %9, align 4, !dbg !1092
  %108 = add nsw i32 %107, 1, !dbg !1092
  store i32 %108, ptr %9, align 4, !dbg !1092
  br label %86, !dbg !1093, !llvm.loop !1094

109:                                              ; preds = %86
  br label %110

110:                                              ; preds = %109, %83
  call void @_Z18make_random_vectorP10vms_vector(ptr noundef %18), !dbg !1096
  %111 = load ptr, ptr %8, align 8, !dbg !1097
  %112 = getelementptr inbounds nuw %struct.object, ptr %111, i32 0, i32 12, !dbg !1098
  %113 = getelementptr inbounds nuw %struct.vms_matrix, ptr %112, i32 0, i32 1, !dbg !1099
  %114 = call noundef ptr @_Z17vm_vec_scale_add2P10vms_vectorS0_i(ptr noundef %18, ptr noundef %113, i32 noundef -32768), !dbg !1100
  store i32 1, ptr @Doing_lighting_hack_flag, align 4, !dbg !1101
  store i32 0, ptr %9, align 4, !dbg !1102
  br label %115, !dbg !1104

115:                                              ; preds = %212, %110
  %116 = load i32, ptr %9, align 4, !dbg !1105
  %117 = load i32, ptr %14, align 4, !dbg !1107
  %118 = icmp slt i32 %116, %117, !dbg !1108
  br i1 %118, label %119, label %215, !dbg !1109

119:                                              ; preds = %115
    #dbg_declare(ptr %20, !1110, !DIExpression(), !1112)
    #dbg_declare(ptr %21, !1113, !DIExpression(), !1114)
    #dbg_declare(ptr %22, !1115, !DIExpression(), !1116)
  %120 = load i32, ptr %9, align 4, !dbg !1117
  %121 = load i32, ptr %14, align 4, !dbg !1119
  %122 = sub nsw i32 %121, 1, !dbg !1120
  %123 = icmp eq i32 %120, %122, !dbg !1121
  br i1 %123, label %124, label %126, !dbg !1121

124:                                              ; preds = %119
  %125 = call noundef ptr @_Z17vm_vec_scale_add2P10vms_vectorS0_i(ptr noundef %17, ptr noundef %16, i32 noundef 30720), !dbg !1122
  br label %126, !dbg !1122

126:                                              ; preds = %124, %119
  %127 = load i32, ptr %9, align 4, !dbg !1123
  %128 = srem i32 %127, 4, !dbg !1125
  %129 = icmp eq i32 %128, 3, !dbg !1126
  br i1 %129, label %130, label %132, !dbg !1126

130:                                              ; preds = %126
    #dbg_declare(ptr %23, !1127, !DIExpression(), !1129)
  call void @_Z18make_random_vectorP10vms_vector(ptr noundef %23), !dbg !1130
  %131 = call noundef ptr @_Z17vm_vec_scale_add2P10vms_vectorS0_i(ptr noundef %18, ptr noundef %23, i32 noundef 16384), !dbg !1131
  br label %132, !dbg !1132

132:                                              ; preds = %130, %126
  %133 = load i32, ptr %9, align 4, !dbg !1133
  %134 = sext i32 %133 to i64, !dbg !1134
  %135 = getelementptr inbounds [16 x i32], ptr %19, i64 0, i64 %134, !dbg !1134
  %136 = load i32, ptr %135, align 4, !dbg !1134
  %137 = call noundef ptr @_Z16vm_vec_scale_addP10vms_vectorS0_S0_i(ptr noundef %20, ptr noundef %17, ptr noundef %18, i32 noundef %136), !dbg !1135
  %138 = load i32, ptr %10, align 4, !dbg !1136
  %139 = call noundef i32 @_Z14find_point_segP10vms_vectori(ptr noundef %20, i32 noundef %138), !dbg !1137
  store i32 %139, ptr %22, align 4, !dbg !1138
  %140 = load i32, ptr %22, align 4, !dbg !1139
  %141 = icmp ne i32 %140, -1, !dbg !1141
  br i1 %141, label %142, label %210, !dbg !1141

142:                                              ; preds = %132
    #dbg_declare(ptr %24, !1142, !DIExpression(), !1144)
  %143 = load i32, ptr %22, align 4, !dbg !1145
  store i32 %143, ptr %10, align 4, !dbg !1146
  %144 = load i32, ptr %22, align 4, !dbg !1147
  %145 = call noundef i32 @_Z10obj_createhhiP10vms_vectorP10vms_matrixihhh(i8 noundef zeroext 5, i8 noundef zeroext 35, i32 noundef %144, ptr noundef %20, ptr noundef null, i32 noundef 0, i8 noundef zeroext 9, i8 noundef zeroext 1, i8 noundef zeroext 7), !dbg !1148
  store i32 %145, ptr %21, align 4, !dbg !1149
  %146 = load i32, ptr %21, align 4, !dbg !1150
  %147 = icmp eq i32 %146, -1, !dbg !1152
  br i1 %147, label %148, label %149, !dbg !1152

148:                                              ; preds = %142
  br label %216, !dbg !1153

149:                                              ; preds = %142
  %150 = load i32, ptr %21, align 4, !dbg !1154
  store i32 %150, ptr %11, align 4, !dbg !1155
  %151 = load i32, ptr %21, align 4, !dbg !1156
  %152 = sext i32 %151 to i64, !dbg !1157
  %153 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %152, !dbg !1157
  store ptr %153, ptr %24, align 8, !dbg !1158
  %154 = load ptr, ptr %24, align 8, !dbg !1159
  %155 = getelementptr inbounds nuw %struct.object, ptr %154, i32 0, i32 20, !dbg !1160
  store i32 1073741822, ptr %155, align 4, !dbg !1161
  %156 = load ptr, ptr %24, align 8, !dbg !1162
  %157 = getelementptr inbounds nuw %struct.object, ptr %156, i32 0, i32 21, !dbg !1163
  %158 = getelementptr inbounds nuw %struct.physics_info, ptr %157, i32 0, i32 0, !dbg !1164
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %158, ptr align 4 %12, i64 12, i1 false), !dbg !1165
  %159 = load ptr, ptr %24, align 8, !dbg !1166
  %160 = getelementptr inbounds nuw %struct.object, ptr %159, i32 0, i32 21, !dbg !1167
  %161 = getelementptr inbounds nuw %struct.physics_info, ptr %160, i32 0, i32 0, !dbg !1168
  %162 = call noundef ptr @_Z12vm_vec_scaleP10vms_vectori(ptr noundef %161, i32 noundef 262144), !dbg !1169
  %163 = load ptr, ptr %24, align 8, !dbg !1170
  %164 = getelementptr inbounds nuw %struct.object, ptr %163, i32 0, i32 2, !dbg !1171
  %165 = load i8, ptr %164, align 1, !dbg !1171
  %166 = zext i8 %165 to i64, !dbg !1172
  %167 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %166, !dbg !1172
  %168 = getelementptr inbounds nuw %struct.weapon_info, ptr %167, i32 0, i32 26, !dbg !1173
  %169 = load i32, ptr %168, align 4, !dbg !1173
  %170 = load ptr, ptr %24, align 8, !dbg !1174
  %171 = getelementptr inbounds nuw %struct.object, ptr %170, i32 0, i32 13, !dbg !1175
  store i32 %169, ptr %171, align 4, !dbg !1176
  %172 = load i32, ptr @FrameTime, align 4, !dbg !1177
  %173 = mul nsw i32 32, %172, !dbg !1178
  %174 = load ptr, ptr %24, align 8, !dbg !1179
  %175 = getelementptr inbounds nuw %struct.object, ptr %174, i32 0, i32 2, !dbg !1180
  %176 = load i8, ptr %175, align 1, !dbg !1180
  %177 = zext i8 %176 to i64, !dbg !1181
  %178 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %177, !dbg !1181
  %179 = getelementptr inbounds nuw %struct.weapon_info, ptr %178, i32 0, i32 29, !dbg !1182
  %180 = load i32, ptr @Difficulty_level, align 4, !dbg !1183
  %181 = sext i32 %180 to i64, !dbg !1181
  %182 = getelementptr inbounds [5 x i32], ptr %179, i64 0, i64 %181, !dbg !1181
  %183 = load i32, ptr %182, align 4, !dbg !1181
  %184 = call noundef i32 @_Z6fixmulii(i32 noundef %173, i32 noundef %183), !dbg !1184
  %185 = load ptr, ptr %24, align 8, !dbg !1185
  %186 = getelementptr inbounds nuw %struct.object, ptr %185, i32 0, i32 14, !dbg !1186
  store i32 %184, ptr %186, align 4, !dbg !1187
  %187 = load ptr, ptr %8, align 8, !dbg !1188
  %188 = getelementptr inbounds nuw %struct.object, ptr %187, i32 0, i32 1, !dbg !1189
  %189 = load i8, ptr %188, align 4, !dbg !1189
  %190 = zext i8 %189 to i16, !dbg !1188
  %191 = load ptr, ptr %24, align 8, !dbg !1190
  %192 = getelementptr inbounds nuw %struct.object, ptr %191, i32 0, i32 22, !dbg !1191
  %193 = getelementptr inbounds nuw %struct.laser_info_s, ptr %192, i32 0, i32 0, !dbg !1192
  store i16 %190, ptr %193, align 4, !dbg !1193
  %194 = load ptr, ptr %8, align 8, !dbg !1194
  %195 = getelementptr inbounds nuw %struct.object, ptr %194, i32 0, i32 0, !dbg !1195
  %196 = load i32, ptr %195, align 4, !dbg !1195
  %197 = load ptr, ptr %24, align 8, !dbg !1196
  %198 = getelementptr inbounds nuw %struct.object, ptr %197, i32 0, i32 22, !dbg !1197
  %199 = getelementptr inbounds nuw %struct.laser_info_s, ptr %198, i32 0, i32 2, !dbg !1198
  store i32 %196, ptr %199, align 4, !dbg !1199
  %200 = load ptr, ptr %8, align 8, !dbg !1200
  %201 = ptrtoint ptr %200 to i64, !dbg !1201
  %202 = sub i64 %201, ptrtoint (ptr @Objects to i64), !dbg !1201
  %203 = sdiv exact i64 %202, 268, !dbg !1201
  %204 = trunc i64 %203 to i16, !dbg !1200
  %205 = load ptr, ptr %24, align 8, !dbg !1202
  %206 = getelementptr inbounds nuw %struct.object, ptr %205, i32 0, i32 22, !dbg !1203
  %207 = getelementptr inbounds nuw %struct.laser_info_s, ptr %206, i32 0, i32 1, !dbg !1204
  store i16 %204, ptr %207, align 2, !dbg !1205
  %208 = load ptr, ptr %24, align 8, !dbg !1206
  %209 = getelementptr inbounds nuw %struct.object, ptr %208, i32 0, i32 6, !dbg !1207
  store i8 0, ptr %209, align 1, !dbg !1208
  br label %210, !dbg !1209

210:                                              ; preds = %149, %132
  %211 = call noundef ptr @_Z11vm_vec_add2P10vms_vectorS0_(ptr noundef %17, ptr noundef %16), !dbg !1210
  br label %212, !dbg !1211

212:                                              ; preds = %210
  %213 = load i32, ptr %9, align 4, !dbg !1212
  %214 = add nsw i32 %213, 1, !dbg !1212
  store i32 %214, ptr %9, align 4, !dbg !1212
  br label %115, !dbg !1213, !llvm.loop !1214

215:                                              ; preds = %115
  br label %216, !dbg !1216

216:                                              ; preds = %215, %148
  %217 = load i32, ptr %11, align 4, !dbg !1216
  %218 = icmp ne i32 %217, -1, !dbg !1218
  br i1 %218, label %219, label %235, !dbg !1218

219:                                              ; preds = %216
  %220 = load i32, ptr %11, align 4, !dbg !1219
  %221 = sext i32 %220 to i64, !dbg !1221
  %222 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %221, !dbg !1221
  %223 = getelementptr inbounds nuw %struct.object, ptr %222, i32 0, i32 21, !dbg !1222
  %224 = getelementptr inbounds nuw %struct.physics_info, ptr %223, i32 0, i32 0, !dbg !1223
  %225 = load i32, ptr @Difficulty_level, align 4, !dbg !1224
  %226 = sext i32 %225 to i64, !dbg !1225
  %227 = getelementptr inbounds [5 x i32], ptr getelementptr inbounds nuw (%struct.weapon_info, ptr getelementptr inbounds ([0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 35), i32 0, i32 30), i64 0, i64 %226, !dbg !1225
  %228 = load i32, ptr %227, align 4, !dbg !1225
  %229 = sdiv i32 %228, 4, !dbg !1226
  %230 = call noundef ptr @_Z12vm_vec_scaleP10vms_vectori(ptr noundef %224, i32 noundef %229), !dbg !1227
  %231 = load i32, ptr %11, align 4, !dbg !1228
  %232 = sext i32 %231 to i64, !dbg !1229
  %233 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %232, !dbg !1229
  %234 = getelementptr inbounds nuw %struct.object, ptr %233, i32 0, i32 6, !dbg !1230
  store i8 1, ptr %234, align 1, !dbg !1231
  br label %235, !dbg !1232

235:                                              ; preds = %219, %216
  store i32 0, ptr @Doing_lighting_hack_flag, align 4, !dbg !1233
  ret void, !dbg !1234
}

declare noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef, ptr noundef, ptr noundef) #1

declare noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef) #1

declare noundef ptr @_Z12vm_vec_scaleP10vms_vectori(ptr noundef, i32 noundef) #1

declare noundef ptr @_Z17vm_vec_scale_add2P10vms_vectorS0_i(ptr noundef, ptr noundef, i32 noundef) #1

declare void @_Z18make_random_vectorP10vms_vector(ptr noundef) #1

declare noundef ptr @_Z16vm_vec_scale_addP10vms_vectorS0_S0_i(ptr noundef, ptr noundef, ptr noundef, i32 noundef) #1

declare noundef i32 @_Z14find_point_segP10vms_vectori(ptr noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z6fixmulii(i32 noundef %0, i32 noundef %1) #3 !dbg !1235 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !1236, !DIExpression(), !1237)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !1238, !DIExpression(), !1239)
  %5 = load i32, ptr %3, align 4, !dbg !1240
  %6 = sext i32 %5 to i64, !dbg !1240
  %7 = load i32, ptr %4, align 4, !dbg !1241
  %8 = sext i32 %7 to i64, !dbg !1241
  %9 = mul nsw i64 %6, %8, !dbg !1242
  %10 = ashr i64 %9, 16, !dbg !1243
  %11 = trunc i64 %10 to i32, !dbg !1244
  ret i32 %11, !dbg !1245
}

declare noundef ptr @_Z11vm_vec_add2P10vms_vectorS0_(ptr noundef, ptr noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z18omega_charge_framev() #0 !dbg !1246 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
    #dbg_declare(ptr %1, !1249, !DIExpression(), !1250)
    #dbg_declare(ptr %2, !1251, !DIExpression(), !1252)
  %4 = load i32, ptr @Omega_charge, align 4, !dbg !1253
  %5 = icmp eq i32 %4, 65536, !dbg !1255
  br i1 %5, label %6, label %7, !dbg !1255

6:                                                ; preds = %0
  br label %94, !dbg !1256

7:                                                ; preds = %0
  %8 = call noundef i32 @_Z17player_has_weaponii(i32 noundef 9, i32 noundef 0), !dbg !1257
  %9 = and i32 %8, 1, !dbg !1259
  %10 = icmp ne i32 %9, 0, !dbg !1260
  br i1 %10, label %12, label %11, !dbg !1261

11:                                               ; preds = %7
  br label %94, !dbg !1262

12:                                               ; preds = %7
  %13 = load i32, ptr @Player_is_dead, align 4, !dbg !1263
  %14 = icmp ne i32 %13, 0, !dbg !1263
  br i1 %14, label %15, label %16, !dbg !1263

15:                                               ; preds = %12
  br label %94, !dbg !1265

16:                                               ; preds = %12
  %17 = load i8, ptr @Primary_weapon, align 1, !dbg !1266
  %18 = sext i8 %17 to i32, !dbg !1266
  %19 = icmp eq i32 %18, 9, !dbg !1268
  br i1 %19, label %20, label %33, !dbg !1269

20:                                               ; preds = %16
  %21 = load i32, ptr @Omega_charge, align 4, !dbg !1270
  %22 = icmp eq i32 %21, 0, !dbg !1271
  br i1 %22, label %23, label %33, !dbg !1272

23:                                               ; preds = %20
  %24 = load i32, ptr @Player_num, align 4, !dbg !1273
  %25 = sext i32 %24 to i64, !dbg !1274
  %26 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %25, !dbg !1274
  %27 = getelementptr inbounds nuw %struct.player, ptr %26, i32 0, i32 8, !dbg !1275
  %28 = load i32, ptr %27, align 4, !dbg !1275
  %29 = icmp eq i32 %28, 0, !dbg !1276
  br i1 %29, label %30, label %33, !dbg !1272

30:                                               ; preds = %23
  %31 = load i8, ptr @Primary_weapon, align 1, !dbg !1277
  %32 = add i8 %31, -1, !dbg !1277
  store i8 %32, ptr @Primary_weapon, align 1, !dbg !1277
  call void @_Z18auto_select_weaponi(i32 noundef 0), !dbg !1279
  br label %33, !dbg !1280

33:                                               ; preds = %30, %23, %20, %16
  %34 = load i32, ptr @Last_omega_fire_frame, align 4, !dbg !1281
  %35 = load i32, ptr @FrameCount, align 4, !dbg !1283
  %36 = icmp eq i32 %34, %35, !dbg !1284
  br i1 %36, label %42, label %37, !dbg !1285

37:                                               ; preds = %33
  %38 = load i32, ptr @Last_omega_fire_frame, align 4, !dbg !1286
  %39 = load i32, ptr @FrameCount, align 4, !dbg !1287
  %40 = sub nsw i32 %39, 1, !dbg !1288
  %41 = icmp eq i32 %38, %40, !dbg !1289
  br i1 %41, label %42, label %43, !dbg !1285

42:                                               ; preds = %37, %33
  br label %94, !dbg !1290

43:                                               ; preds = %37
  %44 = load i32, ptr @Player_num, align 4, !dbg !1291
  %45 = sext i32 %44 to i64, !dbg !1293
  %46 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %45, !dbg !1293
  %47 = getelementptr inbounds nuw %struct.player, ptr %46, i32 0, i32 8, !dbg !1294
  %48 = load i32, ptr %47, align 4, !dbg !1294
  %49 = icmp ne i32 %48, 0, !dbg !1293
  br i1 %49, label %50, label %94, !dbg !1293

50:                                               ; preds = %43
    #dbg_declare(ptr %3, !1295, !DIExpression(), !1297)
  %51 = load i32, ptr @Omega_charge, align 4, !dbg !1298
  store i32 %51, ptr %2, align 4, !dbg !1299
  %52 = load i32, ptr @FrameTime, align 4, !dbg !1300
  %53 = sdiv i32 %52, 4, !dbg !1301
  %54 = load i32, ptr @Omega_charge, align 4, !dbg !1302
  %55 = add nsw i32 %54, %53, !dbg !1302
  store i32 %55, ptr @Omega_charge, align 4, !dbg !1302
  %56 = load i32, ptr @Omega_charge, align 4, !dbg !1303
  %57 = icmp sgt i32 %56, 65536, !dbg !1305
  br i1 %57, label %58, label %59, !dbg !1305

58:                                               ; preds = %50
  store i32 65536, ptr @Omega_charge, align 4, !dbg !1306
  br label %59, !dbg !1307

59:                                               ; preds = %58, %50
  %60 = load i32, ptr @Omega_charge, align 4, !dbg !1308
  %61 = load i32, ptr %2, align 4, !dbg !1309
  %62 = sub nsw i32 %60, %61, !dbg !1310
  store i32 %62, ptr %1, align 4, !dbg !1311
  %63 = load i32, ptr %1, align 4, !dbg !1312
  %64 = call noundef i32 @_Z6fixmulii(i32 noundef 732461, i32 noundef %63), !dbg !1313
  store i32 %64, ptr %3, align 4, !dbg !1314
  %65 = load i32, ptr @Difficulty_level, align 4, !dbg !1315
  %66 = icmp slt i32 %65, 2, !dbg !1317
  br i1 %66, label %67, label %74, !dbg !1317

67:                                               ; preds = %59
  %68 = load i32, ptr %3, align 4, !dbg !1318
  %69 = load i32, ptr @Difficulty_level, align 4, !dbg !1319
  %70 = add nsw i32 %69, 2, !dbg !1320
  %71 = call noundef i32 @_Z3i2fi(i32 noundef %70), !dbg !1321
  %72 = sdiv i32 %71, 4, !dbg !1322
  %73 = call noundef i32 @_Z6fixmulii(i32 noundef %68, i32 noundef %72), !dbg !1323
  store i32 %73, ptr %3, align 4, !dbg !1324
  br label %74, !dbg !1325

74:                                               ; preds = %67, %59
  %75 = load i32, ptr %3, align 4, !dbg !1326
  %76 = load i32, ptr @Player_num, align 4, !dbg !1327
  %77 = sext i32 %76 to i64, !dbg !1328
  %78 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %77, !dbg !1328
  %79 = getelementptr inbounds nuw %struct.player, ptr %78, i32 0, i32 8, !dbg !1329
  %80 = load i32, ptr %79, align 4, !dbg !1330
  %81 = sub nsw i32 %80, %75, !dbg !1330
  store i32 %81, ptr %79, align 4, !dbg !1330
  %82 = load i32, ptr @Player_num, align 4, !dbg !1331
  %83 = sext i32 %82 to i64, !dbg !1333
  %84 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %83, !dbg !1333
  %85 = getelementptr inbounds nuw %struct.player, ptr %84, i32 0, i32 8, !dbg !1334
  %86 = load i32, ptr %85, align 4, !dbg !1334
  %87 = icmp slt i32 %86, 0, !dbg !1335
  br i1 %87, label %88, label %93, !dbg !1335

88:                                               ; preds = %74
  %89 = load i32, ptr @Player_num, align 4, !dbg !1336
  %90 = sext i32 %89 to i64, !dbg !1337
  %91 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %90, !dbg !1337
  %92 = getelementptr inbounds nuw %struct.player, ptr %91, i32 0, i32 8, !dbg !1338
  store i32 0, ptr %92, align 4, !dbg !1339
  br label %93, !dbg !1337

93:                                               ; preds = %88, %74
  br label %94, !dbg !1340

94:                                               ; preds = %6, %11, %15, %42, %93, %43
  ret void, !dbg !1341
}

declare noundef i32 @_Z17player_has_weaponii(i32 noundef, i32 noundef) #1

declare void @_Z18auto_select_weaponi(i32 noundef) #1

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z3i2fi(i32 noundef %0) #3 !dbg !1342 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !1345, !DIExpression(), !1346)
  %3 = load i32, ptr %2, align 4, !dbg !1347
  %4 = shl i32 %3, 16, !dbg !1348
  ret i32 %4, !dbg !1349
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z14do_omega_stuffP6objectP10vms_vectorS0_(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !1350 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct.vms_vector, align 4
  %10 = alloca i32, align 4
  %11 = alloca %struct.fvi_query, align 8
  %12 = alloca %struct.fvi_info, align 4
  %13 = alloca i32, align 4
  %14 = alloca %struct.vms_vector, align 4
  %15 = alloca %struct.vms_vector, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !1353, !DIExpression(), !1354)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !1355, !DIExpression(), !1356)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !1357, !DIExpression(), !1358)
    #dbg_declare(ptr %7, !1359, !DIExpression(), !1360)
    #dbg_declare(ptr %8, !1361, !DIExpression(), !1362)
    #dbg_declare(ptr %9, !1363, !DIExpression(), !1364)
    #dbg_declare(ptr %10, !1365, !DIExpression(), !1366)
  %16 = load ptr, ptr %4, align 8, !dbg !1367
  %17 = getelementptr inbounds nuw %struct.object, ptr %16, i32 0, i32 2, !dbg !1368
  %18 = load i8, ptr %17, align 1, !dbg !1368
  %19 = zext i8 %18 to i32, !dbg !1367
  store i32 %19, ptr %10, align 4, !dbg !1366
  %20 = load i32, ptr %10, align 4, !dbg !1369
  %21 = load i32, ptr @Player_num, align 4, !dbg !1371
  %22 = icmp eq i32 %20, %21, !dbg !1372
  br i1 %22, label %23, label %53, !dbg !1372

23:                                               ; preds = %3
  %24 = load i32, ptr @Omega_charge, align 4, !dbg !1373
  %25 = icmp sge i32 %24, 8192, !dbg !1376
  br i1 %25, label %42, label %26, !dbg !1377

26:                                               ; preds = %23
  %27 = load i32, ptr @Omega_charge, align 4, !dbg !1378
  %28 = icmp ne i32 %27, 0, !dbg !1378
  br i1 %28, label %29, label %36, !dbg !1379

29:                                               ; preds = %26
  %30 = load i32, ptr %10, align 4, !dbg !1380
  %31 = sext i32 %30 to i64, !dbg !1381
  %32 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %31, !dbg !1381
  %33 = getelementptr inbounds nuw %struct.player, ptr %32, i32 0, i32 8, !dbg !1382
  %34 = load i32, ptr %33, align 4, !dbg !1382
  %35 = icmp ne i32 %34, 0, !dbg !1381
  br i1 %35, label %36, label %42, !dbg !1383

36:                                               ; preds = %29, %26
  %37 = load ptr, ptr %6, align 8, !dbg !1384
  %38 = ptrtoint ptr %37 to i64, !dbg !1386
  %39 = sub i64 %38, ptrtoint (ptr @Objects to i64), !dbg !1386
  %40 = sdiv exact i64 %39, 268, !dbg !1386
  %41 = trunc i64 %40 to i32, !dbg !1384
  call void @_Z10obj_deletei(i32 noundef %41), !dbg !1387
  br label %167, !dbg !1388

42:                                               ; preds = %29, %23
  %43 = load i32, ptr @FrameTime, align 4, !dbg !1389
  %44 = load i32, ptr @Omega_charge, align 4, !dbg !1390
  %45 = sub nsw i32 %44, %43, !dbg !1390
  store i32 %45, ptr @Omega_charge, align 4, !dbg !1390
  %46 = load i32, ptr @Omega_charge, align 4, !dbg !1391
  %47 = icmp slt i32 %46, 0, !dbg !1393
  br i1 %47, label %48, label %49, !dbg !1393

48:                                               ; preds = %42
  store i32 0, ptr @Omega_charge, align 4, !dbg !1394
  br label %49, !dbg !1395

49:                                               ; preds = %48, %42
  %50 = load i32, ptr @GameTime, align 4, !dbg !1396
  %51 = add nsw i32 %50, 1, !dbg !1397
  store i32 %51, ptr @Next_laser_fire_time, align 4, !dbg !1398
  %52 = load i32, ptr @FrameCount, align 4, !dbg !1399
  store i32 %52, ptr @Last_omega_fire_frame, align 4, !dbg !1400
  br label %53, !dbg !1401

53:                                               ; preds = %49, %3
  %54 = load ptr, ptr %6, align 8, !dbg !1402
  %55 = getelementptr inbounds nuw %struct.object, ptr %54, i32 0, i32 22, !dbg !1403
  %56 = getelementptr inbounds nuw %struct.laser_info_s, ptr %55, i32 0, i32 0, !dbg !1404
  store i16 4, ptr %56, align 4, !dbg !1405
  %57 = load i32, ptr %10, align 4, !dbg !1406
  %58 = sext i32 %57 to i64, !dbg !1407
  %59 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %58, !dbg !1407
  %60 = getelementptr inbounds nuw %struct.player, ptr %59, i32 0, i32 4, !dbg !1408
  %61 = load i32, ptr %60, align 4, !dbg !1408
  %62 = trunc i32 %61 to i16, !dbg !1407
  %63 = load ptr, ptr %6, align 8, !dbg !1409
  %64 = getelementptr inbounds nuw %struct.object, ptr %63, i32 0, i32 22, !dbg !1410
  %65 = getelementptr inbounds nuw %struct.laser_info_s, ptr %64, i32 0, i32 1, !dbg !1411
  store i16 %62, ptr %65, align 2, !dbg !1412
  %66 = load i32, ptr %10, align 4, !dbg !1413
  %67 = sext i32 %66 to i64, !dbg !1414
  %68 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %67, !dbg !1414
  %69 = getelementptr inbounds nuw %struct.player, ptr %68, i32 0, i32 4, !dbg !1415
  %70 = load i32, ptr %69, align 4, !dbg !1415
  %71 = sext i32 %70 to i64, !dbg !1416
  %72 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %71, !dbg !1416
  %73 = getelementptr inbounds nuw %struct.object, ptr %72, i32 0, i32 0, !dbg !1417
  %74 = load i32, ptr %73, align 4, !dbg !1417
  %75 = load ptr, ptr %6, align 8, !dbg !1418
  %76 = getelementptr inbounds nuw %struct.object, ptr %75, i32 0, i32 22, !dbg !1419
  %77 = getelementptr inbounds nuw %struct.laser_info_s, ptr %76, i32 0, i32 2, !dbg !1420
  store i32 %74, ptr %77, align 4, !dbg !1421
  %78 = load ptr, ptr %5, align 8, !dbg !1422
  %79 = load ptr, ptr %6, align 8, !dbg !1423
  %80 = call noundef i32 @_Z18find_homing_objectP10vms_vectorP6object(ptr noundef %78, ptr noundef %79), !dbg !1424
  store i32 %80, ptr %7, align 4, !dbg !1425
  %81 = load ptr, ptr %5, align 8, !dbg !1426
  %82 = load ptr, ptr %4, align 8, !dbg !1427
  %83 = getelementptr inbounds nuw %struct.object, ptr %82, i32 0, i32 9, !dbg !1428
  %84 = load i16, ptr %83, align 2, !dbg !1428
  %85 = sext i16 %84 to i32, !dbg !1427
  %86 = call noundef i32 @_Z14find_point_segP10vms_vectori(ptr noundef %81, i32 noundef %85), !dbg !1429
  store i32 %86, ptr %8, align 4, !dbg !1430
  %87 = load ptr, ptr %4, align 8, !dbg !1431
  %88 = load ptr, ptr @Viewer, align 8, !dbg !1433
  %89 = icmp eq ptr %87, %88, !dbg !1434
  br i1 %89, label %90, label %99, !dbg !1434

90:                                               ; preds = %53
  %91 = load ptr, ptr %6, align 8, !dbg !1435
  %92 = getelementptr inbounds nuw %struct.object, ptr %91, i32 0, i32 2, !dbg !1436
  %93 = load i8, ptr %92, align 1, !dbg !1436
  %94 = zext i8 %93 to i64, !dbg !1437
  %95 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %94, !dbg !1437
  %96 = getelementptr inbounds nuw %struct.weapon_info, ptr %95, i32 0, i32 6, !dbg !1438
  %97 = load i16, ptr %96, align 4, !dbg !1438
  %98 = sext i16 %97 to i32, !dbg !1437
  call void @_Z16digi_play_sampleii(i32 noundef %98, i32 noundef 65536), !dbg !1439
  br label %114, !dbg !1439

99:                                               ; preds = %53
  %100 = load ptr, ptr %6, align 8, !dbg !1440
  %101 = getelementptr inbounds nuw %struct.object, ptr %100, i32 0, i32 2, !dbg !1441
  %102 = load i8, ptr %101, align 1, !dbg !1441
  %103 = zext i8 %102 to i64, !dbg !1442
  %104 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %103, !dbg !1442
  %105 = getelementptr inbounds nuw %struct.weapon_info, ptr %104, i32 0, i32 6, !dbg !1443
  %106 = load i16, ptr %105, align 4, !dbg !1443
  %107 = sext i16 %106 to i32, !dbg !1442
  %108 = load ptr, ptr %6, align 8, !dbg !1444
  %109 = getelementptr inbounds nuw %struct.object, ptr %108, i32 0, i32 9, !dbg !1445
  %110 = load i16, ptr %109, align 2, !dbg !1445
  %111 = load ptr, ptr %6, align 8, !dbg !1446
  %112 = getelementptr inbounds nuw %struct.object, ptr %111, i32 0, i32 11, !dbg !1447
  %113 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef %107, i16 noundef signext %110, i16 noundef signext 0, ptr noundef %112, i32 noundef 0, i32 noundef 65536), !dbg !1448
  br label %114

114:                                              ; preds = %99, %90
  %115 = load ptr, ptr %6, align 8, !dbg !1449
  %116 = ptrtoint ptr %115 to i64, !dbg !1450
  %117 = sub i64 %116, ptrtoint (ptr @Objects to i64), !dbg !1450
  %118 = sdiv exact i64 %117, 268, !dbg !1450
  %119 = trunc i64 %118 to i32, !dbg !1449
  call void @_Z10obj_deletei(i32 noundef %119), !dbg !1451
  %120 = load i32, ptr %7, align 4, !dbg !1452
  %121 = icmp eq i32 %120, -1, !dbg !1454
  br i1 %121, label %122, label %158, !dbg !1454

122:                                              ; preds = %114
    #dbg_declare(ptr %11, !1455, !DIExpression(), !1469)
    #dbg_declare(ptr %12, !1470, !DIExpression(), !1486)
    #dbg_declare(ptr %13, !1487, !DIExpression(), !1488)
    #dbg_declare(ptr %14, !1489, !DIExpression(), !1490)
    #dbg_declare(ptr %15, !1491, !DIExpression(), !1492)
  call void @_Z18make_random_vectorP10vms_vector(ptr noundef %14), !dbg !1493
  %123 = load ptr, ptr %4, align 8, !dbg !1494
  %124 = getelementptr inbounds nuw %struct.object, ptr %123, i32 0, i32 12, !dbg !1495
  %125 = getelementptr inbounds nuw %struct.vms_matrix, ptr %124, i32 0, i32 2, !dbg !1496
  %126 = call noundef ptr @_Z16vm_vec_scale_addP10vms_vectorS0_S0_i(ptr noundef %15, ptr noundef %125, ptr noundef %14, i32 noundef 4096), !dbg !1497
  %127 = load ptr, ptr %5, align 8, !dbg !1498
  %128 = call noundef ptr @_Z16vm_vec_scale_addP10vms_vectorS0_S0_i(ptr noundef %9, ptr noundef %127, ptr noundef %15, i32 noundef 5242880), !dbg !1499
  %129 = load i32, ptr %8, align 4, !dbg !1500
  %130 = getelementptr inbounds nuw %struct.fvi_query, ptr %11, i32 0, i32 2, !dbg !1501
  store i32 %129, ptr %130, align 8, !dbg !1502
  %131 = getelementptr inbounds nuw %struct.fvi_query, ptr %11, i32 0, i32 2, !dbg !1503
  %132 = load i32, ptr %131, align 8, !dbg !1503
  %133 = icmp eq i32 %132, -1, !dbg !1505
  br i1 %133, label %134, label %135, !dbg !1505

134:                                              ; preds = %122
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 1, ptr noundef @.str.6), !dbg !1506
  br label %167, !dbg !1508

135:                                              ; preds = %122
  %136 = load ptr, ptr %5, align 8, !dbg !1509
  %137 = getelementptr inbounds nuw %struct.fvi_query, ptr %11, i32 0, i32 0, !dbg !1510
  store ptr %136, ptr %137, align 8, !dbg !1511
  %138 = getelementptr inbounds nuw %struct.fvi_query, ptr %11, i32 0, i32 1, !dbg !1512
  store ptr %9, ptr %138, align 8, !dbg !1513
  %139 = getelementptr inbounds nuw %struct.fvi_query, ptr %11, i32 0, i32 3, !dbg !1514
  store i32 0, ptr %139, align 4, !dbg !1515
  %140 = load ptr, ptr %4, align 8, !dbg !1516
  %141 = ptrtoint ptr %140 to i64, !dbg !1517
  %142 = sub i64 %141, ptrtoint (ptr @Objects to i64), !dbg !1517
  %143 = sdiv exact i64 %142, 268, !dbg !1517
  %144 = trunc i64 %143 to i16, !dbg !1516
  %145 = getelementptr inbounds nuw %struct.fvi_query, ptr %11, i32 0, i32 4, !dbg !1518
  store i16 %144, ptr %145, align 8, !dbg !1519
  %146 = getelementptr inbounds nuw %struct.fvi_query, ptr %11, i32 0, i32 5, !dbg !1520
  store ptr null, ptr %146, align 8, !dbg !1521
  %147 = getelementptr inbounds nuw %struct.fvi_query, ptr %11, i32 0, i32 6, !dbg !1522
  store i32 21, ptr %147, align 8, !dbg !1523
  %148 = call noundef i32 @_Z24find_vector_intersectionP9fvi_queryP8fvi_info(ptr noundef %11, ptr noundef %12), !dbg !1524
  store i32 %148, ptr %13, align 4, !dbg !1525
  %149 = load i32, ptr %13, align 4, !dbg !1526
  %150 = icmp ne i32 %149, 0, !dbg !1528
  br i1 %150, label %151, label %157, !dbg !1528

151:                                              ; preds = %135
  %152 = getelementptr inbounds nuw %struct.fvi_info, ptr %12, i32 0, i32 2, !dbg !1529
  %153 = load i32, ptr %152, align 4, !dbg !1529
  %154 = icmp ne i32 %153, -1, !dbg !1529
  %155 = zext i1 %154 to i32, !dbg !1529
  call void @_Z7_AssertiPKcS0_i(i32 noundef %155, ptr noundef @.str.7, ptr noundef @.str.3, i32 noundef 603), !dbg !1529
  %156 = getelementptr inbounds nuw %struct.fvi_info, ptr %12, i32 0, i32 1, !dbg !1531
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %9, ptr align 4 %156, i64 12, i1 false), !dbg !1532
  br label %157, !dbg !1533

157:                                              ; preds = %151, %135
  br label %163, !dbg !1534

158:                                              ; preds = %114
  %159 = load i32, ptr %7, align 4, !dbg !1535
  %160 = sext i32 %159 to i64, !dbg !1536
  %161 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %160, !dbg !1536
  %162 = getelementptr inbounds nuw %struct.object, ptr %161, i32 0, i32 11, !dbg !1537
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %9, ptr align 4 %162, i64 12, i1 false), !dbg !1538
  br label %163

163:                                              ; preds = %158, %157
  %164 = load i32, ptr %8, align 4, !dbg !1539
  %165 = load ptr, ptr %5, align 8, !dbg !1540
  %166 = load ptr, ptr %4, align 8, !dbg !1541
  call void @_Z18create_omega_blobsiP10vms_vectorS0_P6object(i32 noundef %164, ptr noundef %165, ptr noundef %9, ptr noundef %166), !dbg !1542
  br label %167, !dbg !1543

167:                                              ; preds = %163, %134, %36
  ret void, !dbg !1543
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z18find_homing_objectP10vms_vectorP6object(ptr noundef %0, ptr noundef %1) #0 !dbg !1544 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca %struct.vms_vector, align 4
  %15 = alloca i32, align 4
  %16 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !1547, !DIExpression(), !1548)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !1549, !DIExpression(), !1550)
    #dbg_declare(ptr %6, !1551, !DIExpression(), !1552)
    #dbg_declare(ptr %7, !1553, !DIExpression(), !1554)
  store i32 -131072, ptr %7, align 4, !dbg !1554
    #dbg_declare(ptr %8, !1555, !DIExpression(), !1556)
  store i32 -1, ptr %8, align 4, !dbg !1556
  %17 = load ptr, ptr %5, align 8, !dbg !1557
  %18 = getelementptr inbounds nuw %struct.object, ptr %17, i32 0, i32 2, !dbg !1557
  %19 = load i8, ptr %18, align 1, !dbg !1557
  %20 = zext i8 %19 to i64, !dbg !1557
  %21 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %20, !dbg !1557
  %22 = getelementptr inbounds nuw %struct.weapon_info, ptr %21, i32 0, i32 16, !dbg !1557
  %23 = load i8, ptr %22, align 1, !dbg !1557
  %24 = icmp ne i8 %23, 0, !dbg !1557
  br i1 %24, label %31, label %25, !dbg !1557

25:                                               ; preds = %2
  %26 = load ptr, ptr %5, align 8, !dbg !1557
  %27 = getelementptr inbounds nuw %struct.object, ptr %26, i32 0, i32 2, !dbg !1557
  %28 = load i8, ptr %27, align 1, !dbg !1557
  %29 = zext i8 %28 to i32, !dbg !1557
  %30 = icmp eq i32 %29, 35, !dbg !1557
  br label %31, !dbg !1557

31:                                               ; preds = %25, %2
  %32 = phi i1 [ true, %2 ], [ %30, %25 ]
  %33 = zext i1 %32 to i32, !dbg !1557
  call void @_Z7_AssertiPKcS0_i(i32 noundef %33, ptr noundef @.str.13, ptr noundef @.str.3, i32 noundef 1127), !dbg !1557
  %34 = load i32, ptr @Game_mode, align 4, !dbg !1558
  %35 = and i32 %34, 38, !dbg !1560
  %36 = icmp ne i32 %35, 0, !dbg !1558
  br i1 %36, label %37, label %41, !dbg !1558

37:                                               ; preds = %31
  %38 = load ptr, ptr %5, align 8, !dbg !1561
  %39 = load ptr, ptr %4, align 8, !dbg !1562
  %40 = call noundef i32 @_Z32call_find_homing_object_completeP6objectP10vms_vector(ptr noundef %38, ptr noundef %39), !dbg !1563
  store i32 %40, ptr %3, align 4, !dbg !1564
  br label %272, !dbg !1564

41:                                               ; preds = %31
    #dbg_declare(ptr %9, !1565, !DIExpression(), !1567)
  store i32 57344, ptr %9, align 4, !dbg !1568
  %42 = load ptr, ptr %5, align 8, !dbg !1569
  %43 = getelementptr inbounds nuw %struct.object, ptr %42, i32 0, i32 1, !dbg !1571
  %44 = load i8, ptr %43, align 4, !dbg !1571
  %45 = zext i8 %44 to i32, !dbg !1569
  %46 = icmp eq i32 %45, 5, !dbg !1572
  br i1 %46, label %47, label %54, !dbg !1573

47:                                               ; preds = %41
  %48 = load ptr, ptr %5, align 8, !dbg !1574
  %49 = getelementptr inbounds nuw %struct.object, ptr %48, i32 0, i32 2, !dbg !1575
  %50 = load i8, ptr %49, align 1, !dbg !1575
  %51 = zext i8 %50 to i32, !dbg !1574
  %52 = icmp eq i32 %51, 35, !dbg !1576
  br i1 %52, label %53, label %54, !dbg !1573

53:                                               ; preds = %47
  store i32 61440, ptr %9, align 4, !dbg !1577
  br label %54, !dbg !1578

54:                                               ; preds = %53, %47, %41
  %55 = load ptr, ptr %5, align 8, !dbg !1579
  %56 = getelementptr inbounds nuw %struct.object, ptr %55, i32 0, i32 22, !dbg !1581
  %57 = getelementptr inbounds nuw %struct.laser_info_s, ptr %56, i32 0, i32 1, !dbg !1582
  %58 = load i16, ptr %57, align 2, !dbg !1582
  %59 = sext i16 %58 to i32, !dbg !1579
  %60 = load i32, ptr @Player_num, align 4, !dbg !1583
  %61 = sext i32 %60 to i64, !dbg !1584
  %62 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %61, !dbg !1584
  %63 = getelementptr inbounds nuw %struct.player, ptr %62, i32 0, i32 4, !dbg !1585
  %64 = load i32, ptr %63, align 4, !dbg !1585
  %65 = icmp ne i32 %59, %64, !dbg !1586
  br i1 %65, label %66, label %81, !dbg !1586

66:                                               ; preds = %54
  %67 = load i32, ptr @Player_num, align 4, !dbg !1587
  %68 = sext i32 %67 to i64, !dbg !1590
  %69 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %68, !dbg !1590
  %70 = getelementptr inbounds nuw %struct.player, ptr %69, i32 0, i32 7, !dbg !1591
  %71 = load i32, ptr %70, align 4, !dbg !1591
  %72 = and i32 %71, 2048, !dbg !1592
  %73 = icmp ne i32 %72, 0, !dbg !1593
  br i1 %73, label %80, label %74, !dbg !1594

74:                                               ; preds = %66
  %75 = load ptr, ptr @ConsoleObject, align 8, !dbg !1595
  %76 = ptrtoint ptr %75 to i64, !dbg !1596
  %77 = sub i64 %76, ptrtoint (ptr @Objects to i64), !dbg !1596
  %78 = sdiv exact i64 %77, 268, !dbg !1596
  %79 = trunc i64 %78 to i32, !dbg !1595
  store i32 %79, ptr %8, align 4, !dbg !1597
  br label %80, !dbg !1598

80:                                               ; preds = %74, %66
  br label %269, !dbg !1599

81:                                               ; preds = %54
    #dbg_declare(ptr %10, !1600, !DIExpression(), !1602)
  store i32 -1, ptr %10, align 4, !dbg !1602
    #dbg_declare(ptr %11, !1603, !DIExpression(), !1604)
    #dbg_declare(ptr %12, !1605, !DIExpression(), !1606)
  store i32 0, ptr %6, align 4, !dbg !1607
  br label %82, !dbg !1609

82:                                               ; preds = %114, %81
  %83 = load i32, ptr %6, align 4, !dbg !1610
  %84 = icmp slt i32 %83, 3, !dbg !1612
  br i1 %84, label %85, label %117, !dbg !1613

85:                                               ; preds = %82
  %86 = load i32, ptr %6, align 4, !dbg !1614
  %87 = sext i32 %86 to i64, !dbg !1616
  %88 = getelementptr inbounds [3 x %struct.window_rendered_data], ptr @Window_rendered_data, i64 0, i64 %87, !dbg !1616
  %89 = getelementptr inbounds nuw %struct.window_rendered_data, ptr %88, i32 0, i32 0, !dbg !1617
  %90 = load i32, ptr %89, align 8, !dbg !1617
  %91 = load i32, ptr @FrameCount, align 4, !dbg !1618
  %92 = sub nsw i32 %91, 1, !dbg !1619
  %93 = icmp sge i32 %90, %92, !dbg !1620
  br i1 %93, label %94, label %113, !dbg !1620

94:                                               ; preds = %85
  %95 = load i32, ptr %6, align 4, !dbg !1621
  %96 = sext i32 %95 to i64, !dbg !1623
  %97 = getelementptr inbounds [3 x %struct.window_rendered_data], ptr @Window_rendered_data, i64 0, i64 %96, !dbg !1623
  %98 = getelementptr inbounds nuw %struct.window_rendered_data, ptr %97, i32 0, i32 1, !dbg !1624
  %99 = load ptr, ptr %98, align 8, !dbg !1624
  %100 = load ptr, ptr @ConsoleObject, align 8, !dbg !1625
  %101 = icmp eq ptr %99, %100, !dbg !1626
  br i1 %101, label %102, label %112, !dbg !1626

102:                                              ; preds = %94
  %103 = load i32, ptr %6, align 4, !dbg !1627
  %104 = sext i32 %103 to i64, !dbg !1629
  %105 = getelementptr inbounds [3 x %struct.window_rendered_data], ptr @Window_rendered_data, i64 0, i64 %104, !dbg !1629
  %106 = getelementptr inbounds nuw %struct.window_rendered_data, ptr %105, i32 0, i32 2, !dbg !1630
  %107 = load i32, ptr %106, align 8, !dbg !1630
  %108 = icmp ne i32 %107, 0, !dbg !1629
  br i1 %108, label %111, label %109, !dbg !1631

109:                                              ; preds = %102
  %110 = load i32, ptr %6, align 4, !dbg !1632
  store i32 %110, ptr %10, align 4, !dbg !1634
  br label %118, !dbg !1635

111:                                              ; preds = %102
  br label %112, !dbg !1630

112:                                              ; preds = %111, %94
  br label %113, !dbg !1625

113:                                              ; preds = %112, %85
  br label %114, !dbg !1636

114:                                              ; preds = %113
  %115 = load i32, ptr %6, align 4, !dbg !1637
  %116 = add nsw i32 %115, 1, !dbg !1637
  store i32 %116, ptr %6, align 4, !dbg !1637
  br label %82, !dbg !1638, !llvm.loop !1639

117:                                              ; preds = %82
  br label %118, !dbg !1641

118:                                              ; preds = %117, %109
  %119 = load i32, ptr %10, align 4, !dbg !1641
  %120 = icmp eq i32 %119, -1, !dbg !1643
  br i1 %120, label %121, label %125, !dbg !1643

121:                                              ; preds = %118
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.14), !dbg !1644
  %122 = load ptr, ptr %5, align 8, !dbg !1646
  %123 = load ptr, ptr %4, align 8, !dbg !1647
  %124 = call noundef i32 @_Z32call_find_homing_object_completeP6objectP10vms_vector(ptr noundef %122, ptr noundef %123), !dbg !1648
  store i32 %124, ptr %3, align 4, !dbg !1649
  br label %272, !dbg !1649

125:                                              ; preds = %118
  store i32 16384000, ptr %12, align 4, !dbg !1650
  %126 = load ptr, ptr %5, align 8, !dbg !1651
  %127 = getelementptr inbounds nuw %struct.object, ptr %126, i32 0, i32 2, !dbg !1653
  %128 = load i8, ptr %127, align 1, !dbg !1653
  %129 = zext i8 %128 to i32, !dbg !1651
  %130 = icmp eq i32 %129, 35, !dbg !1654
  br i1 %130, label %131, label %132, !dbg !1654

131:                                              ; preds = %125
  store i32 5242880, ptr %12, align 4, !dbg !1655
  br label %132, !dbg !1656

132:                                              ; preds = %131, %125
  %133 = load i32, ptr %10, align 4, !dbg !1657
  %134 = sext i32 %133 to i64, !dbg !1659
  %135 = getelementptr inbounds [3 x %struct.window_rendered_data], ptr @Window_rendered_data, i64 0, i64 %134, !dbg !1659
  %136 = getelementptr inbounds nuw %struct.window_rendered_data, ptr %135, i32 0, i32 4, !dbg !1660
  %137 = load i32, ptr %136, align 8, !dbg !1660
  %138 = sub nsw i32 %137, 1, !dbg !1661
  store i32 %138, ptr %6, align 4, !dbg !1662
  br label %139, !dbg !1663

139:                                              ; preds = %265, %132
  %140 = load i32, ptr %6, align 4, !dbg !1664
  %141 = icmp sge i32 %140, 0, !dbg !1666
  br i1 %141, label %142, label %268, !dbg !1667

142:                                              ; preds = %139
    #dbg_declare(ptr %13, !1668, !DIExpression(), !1670)
    #dbg_declare(ptr %14, !1671, !DIExpression(), !1672)
    #dbg_declare(ptr %15, !1673, !DIExpression(), !1674)
  %143 = load i32, ptr %10, align 4, !dbg !1675
  %144 = sext i32 %143 to i64, !dbg !1676
  %145 = getelementptr inbounds [3 x %struct.window_rendered_data], ptr @Window_rendered_data, i64 0, i64 %144, !dbg !1676
  %146 = getelementptr inbounds nuw %struct.window_rendered_data, ptr %145, i32 0, i32 5, !dbg !1677
  %147 = load i32, ptr %6, align 4, !dbg !1678
  %148 = sext i32 %147 to i64, !dbg !1676
  %149 = getelementptr inbounds [50 x i16], ptr %146, i64 0, i64 %148, !dbg !1676
  %150 = load i16, ptr %149, align 2, !dbg !1676
  %151 = sext i16 %150 to i32, !dbg !1676
  store i32 %151, ptr %15, align 4, !dbg !1674
    #dbg_declare(ptr %16, !1679, !DIExpression(), !1680)
  %152 = load i32, ptr %15, align 4, !dbg !1681
  %153 = sext i32 %152 to i64, !dbg !1682
  %154 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %153, !dbg !1682
  store ptr %154, ptr %16, align 8, !dbg !1680
  %155 = load i32, ptr %15, align 4, !dbg !1683
  %156 = load i32, ptr @Player_num, align 4, !dbg !1685
  %157 = sext i32 %156 to i64, !dbg !1686
  %158 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %157, !dbg !1686
  %159 = getelementptr inbounds nuw %struct.player, ptr %158, i32 0, i32 4, !dbg !1687
  %160 = load i32, ptr %159, align 4, !dbg !1687
  %161 = icmp eq i32 %155, %160, !dbg !1688
  br i1 %161, label %162, label %163, !dbg !1688

162:                                              ; preds = %142
  br label %265, !dbg !1689

163:                                              ; preds = %142
  %164 = load ptr, ptr %16, align 8, !dbg !1690
  %165 = getelementptr inbounds nuw %struct.object, ptr %164, i32 0, i32 1, !dbg !1692
  %166 = load i8, ptr %165, align 4, !dbg !1692
  %167 = zext i8 %166 to i32, !dbg !1690
  %168 = icmp eq i32 %167, 2, !dbg !1693
  br i1 %168, label %169, label %196, !dbg !1693

169:                                              ; preds = %163
  %170 = load ptr, ptr %16, align 8, !dbg !1694
  %171 = getelementptr inbounds nuw %struct.object, ptr %170, i32 0, i32 22, !dbg !1697
  %172 = getelementptr inbounds nuw %struct.ai_static, ptr %171, i32 0, i32 1, !dbg !1698
  %173 = getelementptr inbounds [11 x i8], ptr %172, i64 0, i64 6, !dbg !1694
  %174 = load i8, ptr %173, align 1, !dbg !1694
  %175 = icmp ne i8 %174, 0, !dbg !1694
  br i1 %175, label %176, label %177, !dbg !1694

176:                                              ; preds = %169
  br label %265, !dbg !1699

177:                                              ; preds = %169
  %178 = load ptr, ptr %16, align 8, !dbg !1700
  %179 = getelementptr inbounds nuw %struct.object, ptr %178, i32 0, i32 2, !dbg !1702
  %180 = load i8, ptr %179, align 1, !dbg !1702
  %181 = zext i8 %180 to i64, !dbg !1703
  %182 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %181, !dbg !1703
  %183 = getelementptr inbounds nuw %struct.robot_info, ptr %182, i32 0, i32 37, !dbg !1704
  %184 = load i8, ptr %183, align 1, !dbg !1704
  %185 = icmp ne i8 %184, 0, !dbg !1703
  br i1 %185, label %186, label %195, !dbg !1703

186:                                              ; preds = %177
  %187 = load ptr, ptr %5, align 8, !dbg !1705
  %188 = getelementptr inbounds nuw %struct.object, ptr %187, i32 0, i32 22, !dbg !1707
  %189 = getelementptr inbounds nuw %struct.laser_info_s, ptr %188, i32 0, i32 0, !dbg !1708
  %190 = load i16, ptr %189, align 4, !dbg !1708
  %191 = sext i16 %190 to i32, !dbg !1705
  %192 = icmp eq i32 %191, 4, !dbg !1709
  br i1 %192, label %193, label %194, !dbg !1709

193:                                              ; preds = %186
  br label %265, !dbg !1710

194:                                              ; preds = %186
  br label %195, !dbg !1711

195:                                              ; preds = %194, %177
  br label %196, !dbg !1712

196:                                              ; preds = %195, %163
  %197 = load ptr, ptr %16, align 8, !dbg !1713
  %198 = getelementptr inbounds nuw %struct.object, ptr %197, i32 0, i32 11, !dbg !1714
  %199 = load ptr, ptr %4, align 8, !dbg !1715
  %200 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %14, ptr noundef %198, ptr noundef %199), !dbg !1716
  %201 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %14), !dbg !1717
  store i32 %201, ptr %11, align 4, !dbg !1718
  %202 = load i32, ptr %11, align 4, !dbg !1719
  %203 = load i32, ptr %12, align 4, !dbg !1721
  %204 = icmp slt i32 %202, %203, !dbg !1722
  br i1 %204, label %205, label %264, !dbg !1722

205:                                              ; preds = %196
  %206 = load ptr, ptr %5, align 8, !dbg !1723
  %207 = getelementptr inbounds nuw %struct.object, ptr %206, i32 0, i32 12, !dbg !1723
  %208 = getelementptr inbounds nuw %struct.vms_matrix, ptr %207, i32 0, i32 2, !dbg !1723
  %209 = call noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef %14, ptr noundef %208), !dbg !1723
  store i32 %209, ptr %13, align 4, !dbg !1725
  %210 = load i32, ptr %13, align 4, !dbg !1726
  %211 = load i32, ptr %9, align 4, !dbg !1728
  %212 = icmp sgt i32 %210, %211, !dbg !1729
  br i1 %212, label %213, label %229, !dbg !1729

213:                                              ; preds = %205
  %214 = load i32, ptr %13, align 4, !dbg !1730
  %215 = load i32, ptr %7, align 4, !dbg !1733
  %216 = icmp sgt i32 %214, %215, !dbg !1734
  br i1 %216, label %217, label %228, !dbg !1734

217:                                              ; preds = %213
  %218 = load ptr, ptr %5, align 8, !dbg !1735
  %219 = load i32, ptr %15, align 4, !dbg !1738
  %220 = sext i32 %219 to i64, !dbg !1739
  %221 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %220, !dbg !1739
  %222 = call noundef i32 @_Z27object_to_object_visibilityP6objectS0_i(ptr noundef %218, ptr noundef %221, i32 noundef 2), !dbg !1740
  %223 = icmp ne i32 %222, 0, !dbg !1740
  br i1 %223, label %224, label %227, !dbg !1740

224:                                              ; preds = %217
  %225 = load i32, ptr %13, align 4, !dbg !1741
  store i32 %225, ptr %7, align 4, !dbg !1743
  %226 = load i32, ptr %15, align 4, !dbg !1744
  store i32 %226, ptr %8, align 4, !dbg !1745
  br label %227, !dbg !1746

227:                                              ; preds = %224, %217
  br label %228, !dbg !1747

228:                                              ; preds = %227, %213
  br label %263, !dbg !1748

229:                                              ; preds = %205
  %230 = load i32, ptr %13, align 4, !dbg !1749
  %231 = load i32, ptr %9, align 4, !dbg !1751
  %232 = sub nsw i32 65536, %231, !dbg !1752
  %233 = mul nsw i32 %232, 2, !dbg !1753
  %234 = sub nsw i32 65536, %233, !dbg !1754
  %235 = icmp sgt i32 %230, %234, !dbg !1755
  br i1 %235, label %236, label %262, !dbg !1755

236:                                              ; preds = %229
  %237 = call noundef i32 @_Z16vm_vec_normalizeP10vms_vector(ptr noundef %14), !dbg !1756
  %238 = load ptr, ptr %5, align 8, !dbg !1758
  %239 = getelementptr inbounds nuw %struct.object, ptr %238, i32 0, i32 12, !dbg !1758
  %240 = getelementptr inbounds nuw %struct.vms_matrix, ptr %239, i32 0, i32 2, !dbg !1758
  %241 = call noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef %14, ptr noundef %240), !dbg !1758
  store i32 %241, ptr %13, align 4, !dbg !1759
  %242 = load i32, ptr %13, align 4, !dbg !1760
  %243 = load i32, ptr %9, align 4, !dbg !1762
  %244 = icmp sgt i32 %242, %243, !dbg !1763
  br i1 %244, label %245, label %261, !dbg !1763

245:                                              ; preds = %236
  %246 = load i32, ptr %13, align 4, !dbg !1764
  %247 = load i32, ptr %7, align 4, !dbg !1767
  %248 = icmp sgt i32 %246, %247, !dbg !1768
  br i1 %248, label %249, label %260, !dbg !1768

249:                                              ; preds = %245
  %250 = load ptr, ptr %5, align 8, !dbg !1769
  %251 = load i32, ptr %15, align 4, !dbg !1772
  %252 = sext i32 %251 to i64, !dbg !1773
  %253 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %252, !dbg !1773
  %254 = call noundef i32 @_Z27object_to_object_visibilityP6objectS0_i(ptr noundef %250, ptr noundef %253, i32 noundef 2), !dbg !1774
  %255 = icmp ne i32 %254, 0, !dbg !1774
  br i1 %255, label %256, label %259, !dbg !1774

256:                                              ; preds = %249
  %257 = load i32, ptr %13, align 4, !dbg !1775
  store i32 %257, ptr %7, align 4, !dbg !1777
  %258 = load i32, ptr %15, align 4, !dbg !1778
  store i32 %258, ptr %8, align 4, !dbg !1779
  br label %259, !dbg !1780

259:                                              ; preds = %256, %249
  br label %260, !dbg !1781

260:                                              ; preds = %259, %245
  br label %261, !dbg !1782

261:                                              ; preds = %260, %236
  br label %262, !dbg !1783

262:                                              ; preds = %261, %229
  br label %263

263:                                              ; preds = %262, %228
  br label %264, !dbg !1784

264:                                              ; preds = %263, %196
  br label %265, !dbg !1785

265:                                              ; preds = %264, %193, %176, %162
  %266 = load i32, ptr %6, align 4, !dbg !1786
  %267 = add nsw i32 %266, -1, !dbg !1786
  store i32 %267, ptr %6, align 4, !dbg !1786
  br label %139, !dbg !1787, !llvm.loop !1788

268:                                              ; preds = %139
  br label %269

269:                                              ; preds = %268, %80
  br label %270

270:                                              ; preds = %269
  %271 = load i32, ptr %8, align 4, !dbg !1790
  store i32 %271, ptr %3, align 4, !dbg !1791
  br label %272, !dbg !1791

272:                                              ; preds = %270, %121, %37
  %273 = load i32, ptr %3, align 4, !dbg !1792
  ret i32 %273, !dbg !1792
}

declare void @_Z16digi_play_sampleii(i32 noundef, i32 noundef) #1

declare noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef, i16 noundef signext, i16 noundef signext, ptr noundef, i32 noundef, i32 noundef) #1

declare noundef i32 @_Z24find_vector_intersectionP9fvi_queryP8fvi_info(ptr noundef, ptr noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z16Laser_create_newP10vms_vectorS0_iiii(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5) #0 !dbg !1793 {
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca ptr, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca %struct.vms_vector, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  store ptr %0, ptr %8, align 8
    #dbg_declare(ptr %8, !1796, !DIExpression(), !1797)
  store ptr %1, ptr %9, align 8
    #dbg_declare(ptr %9, !1798, !DIExpression(), !1799)
  store i32 %2, ptr %10, align 4
    #dbg_declare(ptr %10, !1800, !DIExpression(), !1801)
  store i32 %3, ptr %11, align 4
    #dbg_declare(ptr %11, !1802, !DIExpression(), !1803)
  store i32 %4, ptr %12, align 4
    #dbg_declare(ptr %12, !1804, !DIExpression(), !1805)
  store i32 %5, ptr %13, align 4
    #dbg_declare(ptr %13, !1806, !DIExpression(), !1807)
    #dbg_declare(ptr %14, !1808, !DIExpression(), !1809)
    #dbg_declare(ptr %15, !1810, !DIExpression(), !1811)
    #dbg_declare(ptr %16, !1812, !DIExpression(), !1813)
    #dbg_declare(ptr %17, !1814, !DIExpression(), !1815)
    #dbg_declare(ptr %18, !1816, !DIExpression(), !1817)
    #dbg_declare(ptr %19, !1818, !DIExpression(), !1819)
  store i32 0, ptr %19, align 4, !dbg !1819
  %26 = load i32, ptr %12, align 4, !dbg !1820
  %27 = load i32, ptr @N_weapon_types, align 4, !dbg !1820
  %28 = icmp slt i32 %26, %27, !dbg !1820
  %29 = zext i1 %28 to i32, !dbg !1820
  call void @_Z7_AssertiPKcS0_i(i32 noundef %29, ptr noundef @.str.8, ptr noundef @.str.3, i32 noundef 624), !dbg !1820
  %30 = load i32, ptr %12, align 4, !dbg !1821
  %31 = icmp slt i32 %30, 0, !dbg !1823
  br i1 %31, label %36, label %32, !dbg !1824

32:                                               ; preds = %6
  %33 = load i32, ptr %12, align 4, !dbg !1825
  %34 = load i32, ptr @N_weapon_types, align 4, !dbg !1826
  %35 = icmp sge i32 %33, %34, !dbg !1827
  br i1 %35, label %36, label %37, !dbg !1824

36:                                               ; preds = %32, %6
  store i32 0, ptr %12, align 4, !dbg !1828
  br label %37, !dbg !1829

37:                                               ; preds = %36, %32
  %38 = load i32, ptr %11, align 4, !dbg !1830
  %39 = sext i32 %38 to i64, !dbg !1832
  %40 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %39, !dbg !1832
  %41 = getelementptr inbounds nuw %struct.object, ptr %40, i32 0, i32 1, !dbg !1833
  %42 = load i8, ptr %41, align 4, !dbg !1833
  %43 = zext i8 %42 to i32, !dbg !1832
  %44 = icmp eq i32 %43, 2, !dbg !1834
  br i1 %44, label %45, label %48, !dbg !1834

45:                                               ; preds = %37
  %46 = load i32, ptr %10, align 4, !dbg !1835
  %47 = load ptr, ptr %9, align 8, !dbg !1836
  call void @_Z15do_muzzle_stuffiP10vms_vector(i32 noundef %46, ptr noundef %47), !dbg !1837
  br label %48, !dbg !1837

48:                                               ; preds = %45, %37
  %49 = load i32, ptr %12, align 4, !dbg !1838
  %50 = load i32, ptr %10, align 4, !dbg !1839
  %51 = load ptr, ptr %9, align 8, !dbg !1840
  %52 = call noundef i32 @_Z20create_weapon_objectiiP10vms_vector(i32 noundef %49, i32 noundef %50, ptr noundef %51), !dbg !1841
  store i32 %52, ptr %14, align 4, !dbg !1842
  %53 = load i32, ptr %14, align 4, !dbg !1843
  %54 = icmp slt i32 %53, 0, !dbg !1845
  br i1 %54, label %55, label %56, !dbg !1845

55:                                               ; preds = %48
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 1, ptr noundef @.str.9), !dbg !1846
  store i32 -1, ptr %7, align 4, !dbg !1848
  br label %737, !dbg !1848

56:                                               ; preds = %48
  %57 = load i32, ptr %14, align 4, !dbg !1849
  %58 = sext i32 %57 to i64, !dbg !1850
  %59 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %58, !dbg !1850
  store ptr %59, ptr %15, align 8, !dbg !1851
  %60 = load i32, ptr %12, align 4, !dbg !1852
  %61 = icmp eq i32 %60, 35, !dbg !1854
  br i1 %61, label %62, label %128, !dbg !1855

62:                                               ; preds = %56
  %63 = load i32, ptr @CurrentLogicVersion, align 4, !dbg !1856
  %64 = icmp sge i32 %63, 1, !dbg !1857
  br i1 %64, label %65, label %128, !dbg !1855

65:                                               ; preds = %62
  %66 = load ptr, ptr %15, align 8, !dbg !1858
  %67 = getelementptr inbounds nuw %struct.object, ptr %66, i32 0, i32 12, !dbg !1860
  %68 = load ptr, ptr %8, align 8, !dbg !1861
  %69 = load i32, ptr %11, align 4, !dbg !1862
  %70 = sext i32 %69 to i64, !dbg !1863
  %71 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %70, !dbg !1863
  %72 = getelementptr inbounds nuw %struct.object, ptr %71, i32 0, i32 12, !dbg !1864
  %73 = getelementptr inbounds nuw %struct.vms_matrix, ptr %72, i32 0, i32 1, !dbg !1865
  %74 = call noundef ptr @_Z18vm_vector_2_matrixP10vms_matrixP10vms_vectorS2_S2_(ptr noundef %67, ptr noundef %68, ptr noundef %73, ptr noundef null), !dbg !1866
  %75 = load i32, ptr %11, align 4, !dbg !1867
  %76 = sext i32 %75 to i64, !dbg !1869
  %77 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %76, !dbg !1869
  %78 = load ptr, ptr @Viewer, align 8, !dbg !1870
  %79 = icmp ne ptr %77, %78, !dbg !1871
  br i1 %79, label %80, label %121, !dbg !1872

80:                                               ; preds = %65
  %81 = load i32, ptr %11, align 4, !dbg !1873
  %82 = sext i32 %81 to i64, !dbg !1874
  %83 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %82, !dbg !1874
  %84 = getelementptr inbounds nuw %struct.object, ptr %83, i32 0, i32 1, !dbg !1875
  %85 = load i8, ptr %84, align 4, !dbg !1875
  %86 = zext i8 %85 to i32, !dbg !1874
  %87 = icmp ne i32 %86, 5, !dbg !1876
  br i1 %87, label %88, label %121, !dbg !1872

88:                                               ; preds = %80
  %89 = load ptr, ptr %15, align 8, !dbg !1877
  %90 = getelementptr inbounds nuw %struct.object, ptr %89, i32 0, i32 2, !dbg !1880
  %91 = load i8, ptr %90, align 1, !dbg !1880
  %92 = zext i8 %91 to i64, !dbg !1881
  %93 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %92, !dbg !1881
  %94 = getelementptr inbounds nuw %struct.weapon_info, ptr %93, i32 0, i32 4, !dbg !1882
  %95 = load i8, ptr %94, align 2, !dbg !1882
  %96 = sext i8 %95 to i32, !dbg !1881
  %97 = icmp sgt i32 %96, -1, !dbg !1883
  br i1 %97, label %98, label %120, !dbg !1883

98:                                               ; preds = %88
  %99 = load ptr, ptr %15, align 8, !dbg !1884
  %100 = getelementptr inbounds nuw %struct.object, ptr %99, i32 0, i32 9, !dbg !1885
  %101 = load i16, ptr %100, align 2, !dbg !1885
  %102 = load ptr, ptr %15, align 8, !dbg !1886
  %103 = getelementptr inbounds nuw %struct.object, ptr %102, i32 0, i32 11, !dbg !1887
  %104 = load ptr, ptr %15, align 8, !dbg !1888
  %105 = getelementptr inbounds nuw %struct.object, ptr %104, i32 0, i32 2, !dbg !1889
  %106 = load i8, ptr %105, align 1, !dbg !1889
  %107 = zext i8 %106 to i64, !dbg !1890
  %108 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %107, !dbg !1890
  %109 = getelementptr inbounds nuw %struct.weapon_info, ptr %108, i32 0, i32 27, !dbg !1891
  %110 = load i32, ptr %109, align 4, !dbg !1891
  %111 = load ptr, ptr %15, align 8, !dbg !1892
  %112 = getelementptr inbounds nuw %struct.object, ptr %111, i32 0, i32 2, !dbg !1893
  %113 = load i8, ptr %112, align 1, !dbg !1893
  %114 = zext i8 %113 to i64, !dbg !1894
  %115 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %114, !dbg !1894
  %116 = getelementptr inbounds nuw %struct.weapon_info, ptr %115, i32 0, i32 4, !dbg !1895
  %117 = load i8, ptr %116, align 2, !dbg !1895
  %118 = sext i8 %117 to i32, !dbg !1894
  %119 = call noundef ptr @_Z26object_create_muzzle_flashsP10vms_vectorii(i16 noundef signext %101, ptr noundef %103, i32 noundef %110, i32 noundef %118), !dbg !1896
  br label %120, !dbg !1896

120:                                              ; preds = %98, %88
  br label %121, !dbg !1897

121:                                              ; preds = %120, %80, %65
  %122 = load i32, ptr %11, align 4, !dbg !1898
  %123 = sext i32 %122 to i64, !dbg !1899
  %124 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %123, !dbg !1899
  %125 = load ptr, ptr %9, align 8, !dbg !1900
  %126 = load ptr, ptr %15, align 8, !dbg !1901
  call void @_Z14do_omega_stuffP6objectP10vms_vectorS0_(ptr noundef %124, ptr noundef %125, ptr noundef %126), !dbg !1902
  %127 = load i32, ptr %14, align 4, !dbg !1903
  store i32 %127, ptr %7, align 4, !dbg !1904
  br label %737, !dbg !1904

128:                                              ; preds = %62, %56
  %129 = load i32, ptr %11, align 4, !dbg !1905
  %130 = sext i32 %129 to i64, !dbg !1907
  %131 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %130, !dbg !1907
  %132 = getelementptr inbounds nuw %struct.object, ptr %131, i32 0, i32 1, !dbg !1908
  %133 = load i8, ptr %132, align 4, !dbg !1908
  %134 = zext i8 %133 to i32, !dbg !1907
  %135 = icmp eq i32 %134, 4, !dbg !1909
  br i1 %135, label %136, label %214, !dbg !1909

136:                                              ; preds = %128
  %137 = load i32, ptr %12, align 4, !dbg !1910
  %138 = icmp eq i32 %137, 14, !dbg !1913
  br i1 %138, label %139, label %162, !dbg !1913

139:                                              ; preds = %136
  %140 = load i32, ptr @Fusion_charge, align 4, !dbg !1914
  %141 = icmp sle i32 %140, 0, !dbg !1917
  br i1 %141, label %142, label %146, !dbg !1917

142:                                              ; preds = %139
  %143 = load ptr, ptr %15, align 8, !dbg !1918
  %144 = getelementptr inbounds nuw %struct.object, ptr %143, i32 0, i32 22, !dbg !1919
  %145 = getelementptr inbounds nuw %struct.laser_info_s, ptr %144, i32 0, i32 6, !dbg !1920
  store i32 65536, ptr %145, align 4, !dbg !1921
  br label %161, !dbg !1918

146:                                              ; preds = %139
  %147 = load i32, ptr @Fusion_charge, align 4, !dbg !1922
  %148 = icmp sle i32 %147, 262144, !dbg !1924
  br i1 %148, label %149, label %156, !dbg !1924

149:                                              ; preds = %146
  %150 = load i32, ptr @Fusion_charge, align 4, !dbg !1925
  %151 = sdiv i32 %150, 2, !dbg !1926
  %152 = add nsw i32 65536, %151, !dbg !1927
  %153 = load ptr, ptr %15, align 8, !dbg !1928
  %154 = getelementptr inbounds nuw %struct.object, ptr %153, i32 0, i32 22, !dbg !1929
  %155 = getelementptr inbounds nuw %struct.laser_info_s, ptr %154, i32 0, i32 6, !dbg !1930
  store i32 %152, ptr %155, align 4, !dbg !1931
  br label %160, !dbg !1928

156:                                              ; preds = %146
  %157 = load ptr, ptr %15, align 8, !dbg !1932
  %158 = getelementptr inbounds nuw %struct.object, ptr %157, i32 0, i32 22, !dbg !1933
  %159 = getelementptr inbounds nuw %struct.laser_info_s, ptr %158, i32 0, i32 6, !dbg !1934
  store i32 262144, ptr %159, align 4, !dbg !1935
  br label %160

160:                                              ; preds = %156, %149
  br label %161

161:                                              ; preds = %160, %142
  br label %213, !dbg !1936

162:                                              ; preds = %136
  %163 = load i32, ptr %12, align 4, !dbg !1937
  %164 = icmp sge i32 %163, 0, !dbg !1939
  br i1 %164, label %165, label %184, !dbg !1940

165:                                              ; preds = %162
  %166 = load i32, ptr %12, align 4, !dbg !1941
  %167 = icmp sle i32 %166, 5, !dbg !1942
  br i1 %167, label %168, label %184, !dbg !1943

168:                                              ; preds = %165
  %169 = load i32, ptr %11, align 4, !dbg !1944
  %170 = sext i32 %169 to i64, !dbg !1945
  %171 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %170, !dbg !1945
  %172 = getelementptr inbounds nuw %struct.object, ptr %171, i32 0, i32 2, !dbg !1946
  %173 = load i8, ptr %172, align 1, !dbg !1946
  %174 = zext i8 %173 to i64, !dbg !1947
  %175 = getelementptr inbounds nuw [12 x %struct.player], ptr @Players, i64 0, i64 %174, !dbg !1947
  %176 = getelementptr inbounds nuw %struct.player, ptr %175, i32 0, i32 7, !dbg !1948
  %177 = load i32, ptr %176, align 4, !dbg !1948
  %178 = and i32 %177, 1024, !dbg !1949
  %179 = icmp ne i32 %178, 0, !dbg !1950
  br i1 %179, label %180, label %184, !dbg !1943

180:                                              ; preds = %168
  %181 = load ptr, ptr %15, align 8, !dbg !1951
  %182 = getelementptr inbounds nuw %struct.object, ptr %181, i32 0, i32 22, !dbg !1952
  %183 = getelementptr inbounds nuw %struct.laser_info_s, ptr %182, i32 0, i32 6, !dbg !1953
  store i32 49152, ptr %183, align 4, !dbg !1954
  br label %212, !dbg !1951

184:                                              ; preds = %168, %165, %162
  %185 = load i32, ptr %12, align 4, !dbg !1955
  %186 = icmp eq i32 %185, 37, !dbg !1957
  br i1 %186, label %187, label %211, !dbg !1957

187:                                              ; preds = %184
  %188 = load i32, ptr %11, align 4, !dbg !1958
  %189 = load i32, ptr @Player_num, align 4, !dbg !1961
  %190 = sext i32 %189 to i64, !dbg !1962
  %191 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %190, !dbg !1962
  %192 = getelementptr inbounds nuw %struct.player, ptr %191, i32 0, i32 4, !dbg !1963
  %193 = load i32, ptr %192, align 4, !dbg !1963
  %194 = icmp eq i32 %188, %193, !dbg !1964
  br i1 %194, label %195, label %210, !dbg !1964

195:                                              ; preds = %187
  %196 = load ptr, ptr %15, align 8, !dbg !1965
  %197 = load i32, ptr @Player_num, align 4, !dbg !1967
  %198 = sext i32 %197 to i64, !dbg !1968
  %199 = getelementptr inbounds [8 x ptr], ptr @Guided_missile, i64 0, i64 %198, !dbg !1968
  store ptr %196, ptr %199, align 8, !dbg !1969
  %200 = load ptr, ptr %15, align 8, !dbg !1970
  %201 = getelementptr inbounds nuw %struct.object, ptr %200, i32 0, i32 0, !dbg !1971
  %202 = load i32, ptr %201, align 4, !dbg !1971
  %203 = load i32, ptr @Player_num, align 4, !dbg !1972
  %204 = sext i32 %203 to i64, !dbg !1973
  %205 = getelementptr inbounds [8 x i32], ptr @Guided_missile_sig, i64 0, i64 %204, !dbg !1973
  store i32 %202, ptr %205, align 4, !dbg !1974
  %206 = load i32, ptr @Newdemo_state, align 4, !dbg !1975
  %207 = icmp eq i32 %206, 1, !dbg !1977
  br i1 %207, label %208, label %209, !dbg !1977

208:                                              ; preds = %195
  call void @_Z27newdemo_record_guided_startv(), !dbg !1978
  br label %209, !dbg !1978

209:                                              ; preds = %208, %195
  br label %210, !dbg !1979

210:                                              ; preds = %209, %187
  br label %211, !dbg !1980

211:                                              ; preds = %210, %184
  br label %212

212:                                              ; preds = %211, %180
  br label %213

213:                                              ; preds = %212, %161
  br label %214, !dbg !1981

214:                                              ; preds = %213, %128
  %215 = load i32, ptr %12, align 4, !dbg !1982
  %216 = icmp eq i32 %215, 19, !dbg !1984
  br i1 %216, label %229, label %217, !dbg !1985

217:                                              ; preds = %214
  %218 = load i32, ptr %12, align 4, !dbg !1986
  %219 = icmp eq i32 %218, 47, !dbg !1987
  br i1 %219, label %229, label %220, !dbg !1988

220:                                              ; preds = %217
  %221 = load i32, ptr %12, align 4, !dbg !1989
  %222 = icmp eq i32 %221, 29, !dbg !1990
  br i1 %222, label %229, label %223, !dbg !1991

223:                                              ; preds = %220
  %224 = load i32, ptr %12, align 4, !dbg !1992
  %225 = icmp eq i32 %224, 49, !dbg !1993
  br i1 %225, label %229, label %226, !dbg !1994

226:                                              ; preds = %223
  %227 = load i32, ptr %12, align 4, !dbg !1995
  %228 = icmp eq i32 %227, 54, !dbg !1996
  br i1 %228, label %229, label %237, !dbg !1994

229:                                              ; preds = %226, %223, %220, %217, %214
  %230 = load ptr, ptr %15, align 8, !dbg !1997
  %231 = getelementptr inbounds nuw %struct.object, ptr %230, i32 0, i32 21, !dbg !1998
  %232 = getelementptr inbounds nuw %struct.physics_info, ptr %231, i32 0, i32 8, !dbg !1999
  %233 = load i16, ptr %232, align 2, !dbg !2000
  %234 = zext i16 %233 to i32, !dbg !2000
  %235 = or i32 %234, 4, !dbg !2000
  %236 = trunc i32 %235 to i16, !dbg !2000
  store i16 %236, ptr %232, align 2, !dbg !2000
  br label %237, !dbg !1997

237:                                              ; preds = %229, %226
  %238 = load i32, ptr %12, align 4, !dbg !2001
  %239 = sext i32 %238 to i64, !dbg !2003
  %240 = getelementptr inbounds [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %239, !dbg !2003
  %241 = getelementptr inbounds nuw %struct.weapon_info, ptr %240, i32 0, i32 0, !dbg !2004
  %242 = load i8, ptr %241, align 4, !dbg !2004
  %243 = sext i8 %242 to i32, !dbg !2003
  %244 = icmp eq i32 %243, 2, !dbg !2005
  br i1 %244, label %245, label %255, !dbg !2005

245:                                              ; preds = %237
  %246 = load ptr, ptr %15, align 8, !dbg !2006
  %247 = getelementptr inbounds nuw %struct.object, ptr %246, i32 0, i32 23, !dbg !2007
  %248 = getelementptr inbounds nuw %struct.polyobj_info, ptr %247, i32 0, i32 0, !dbg !2008
  %249 = load i32, ptr %248, align 4, !dbg !2008
  %250 = sext i32 %249 to i64, !dbg !2009
  %251 = getelementptr inbounds [0 x %struct.polymodel], ptr @Polygon_models, i64 0, i64 %250, !dbg !2009
  %252 = getelementptr inbounds nuw %struct.polymodel, ptr %251, i32 0, i32 13, !dbg !2010
  %253 = load i32, ptr %252, align 4, !dbg !2010
  %254 = mul nsw i32 %253, 2, !dbg !2011
  store i32 %254, ptr %19, align 4, !dbg !2012
  br label %255, !dbg !2013

255:                                              ; preds = %245, %237
  %256 = load i32, ptr %12, align 4, !dbg !2014
  %257 = icmp eq i32 %256, 9, !dbg !2016
  br i1 %257, label %258, label %266, !dbg !2016

258:                                              ; preds = %255
  %259 = load ptr, ptr %15, align 8, !dbg !2017
  %260 = getelementptr inbounds nuw %struct.object, ptr %259, i32 0, i32 21, !dbg !2018
  %261 = getelementptr inbounds nuw %struct.physics_info, ptr %260, i32 0, i32 8, !dbg !2019
  %262 = load i16, ptr %261, align 2, !dbg !2020
  %263 = zext i16 %262 to i32, !dbg !2020
  %264 = or i32 %263, 16, !dbg !2020
  %265 = trunc i32 %264 to i16, !dbg !2020
  store i16 %265, ptr %261, align 2, !dbg !2020
  br label %266, !dbg !2017

266:                                              ; preds = %258, %255
  %267 = load ptr, ptr %15, align 8, !dbg !2021
  %268 = getelementptr inbounds nuw %struct.object, ptr %267, i32 0, i32 2, !dbg !2022
  %269 = load i8, ptr %268, align 1, !dbg !2022
  %270 = zext i8 %269 to i64, !dbg !2023
  %271 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %270, !dbg !2023
  %272 = getelementptr inbounds nuw %struct.weapon_info, ptr %271, i32 0, i32 29, !dbg !2024
  %273 = load i32, ptr @Difficulty_level, align 4, !dbg !2025
  %274 = sext i32 %273 to i64, !dbg !2023
  %275 = getelementptr inbounds [5 x i32], ptr %272, i64 0, i64 %274, !dbg !2023
  %276 = load i32, ptr %275, align 4, !dbg !2023
  %277 = load ptr, ptr %15, align 8, !dbg !2026
  %278 = getelementptr inbounds nuw %struct.object, ptr %277, i32 0, i32 14, !dbg !2027
  store i32 %276, ptr %278, align 4, !dbg !2028
  %279 = load ptr, ptr %15, align 8, !dbg !2029
  %280 = getelementptr inbounds nuw %struct.object, ptr %279, i32 0, i32 2, !dbg !2030
  %281 = load i8, ptr %280, align 1, !dbg !2030
  %282 = zext i8 %281 to i64, !dbg !2031
  %283 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %282, !dbg !2031
  %284 = getelementptr inbounds nuw %struct.weapon_info, ptr %283, i32 0, i32 36, !dbg !2032
  %285 = load i32, ptr %284, align 4, !dbg !2032
  %286 = load ptr, ptr %15, align 8, !dbg !2033
  %287 = getelementptr inbounds nuw %struct.object, ptr %286, i32 0, i32 20, !dbg !2034
  store i32 %285, ptr %287, align 4, !dbg !2035
  %288 = load i32, ptr %11, align 4, !dbg !2036
  %289 = sext i32 %288 to i64, !dbg !2037
  %290 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %289, !dbg !2037
  %291 = getelementptr inbounds nuw %struct.object, ptr %290, i32 0, i32 1, !dbg !2038
  %292 = load i8, ptr %291, align 4, !dbg !2038
  %293 = zext i8 %292 to i16, !dbg !2037
  %294 = load ptr, ptr %15, align 8, !dbg !2039
  %295 = getelementptr inbounds nuw %struct.object, ptr %294, i32 0, i32 22, !dbg !2040
  %296 = getelementptr inbounds nuw %struct.laser_info_s, ptr %295, i32 0, i32 0, !dbg !2041
  store i16 %293, ptr %296, align 4, !dbg !2042
  %297 = load i32, ptr %11, align 4, !dbg !2043
  %298 = sext i32 %297 to i64, !dbg !2044
  %299 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %298, !dbg !2044
  %300 = getelementptr inbounds nuw %struct.object, ptr %299, i32 0, i32 0, !dbg !2045
  %301 = load i32, ptr %300, align 4, !dbg !2045
  %302 = load ptr, ptr %15, align 8, !dbg !2046
  %303 = getelementptr inbounds nuw %struct.object, ptr %302, i32 0, i32 22, !dbg !2047
  %304 = getelementptr inbounds nuw %struct.laser_info_s, ptr %303, i32 0, i32 2, !dbg !2048
  store i32 %301, ptr %304, align 4, !dbg !2049
  %305 = load i32, ptr %11, align 4, !dbg !2050
  %306 = trunc i32 %305 to i16, !dbg !2050
  %307 = load ptr, ptr %15, align 8, !dbg !2051
  %308 = getelementptr inbounds nuw %struct.object, ptr %307, i32 0, i32 22, !dbg !2052
  %309 = getelementptr inbounds nuw %struct.laser_info_s, ptr %308, i32 0, i32 1, !dbg !2053
  store i16 %306, ptr %309, align 2, !dbg !2054
  %310 = load i32, ptr %11, align 4, !dbg !2055
  %311 = sext i32 %310 to i64, !dbg !2057
  %312 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %311, !dbg !2057
  %313 = getelementptr inbounds nuw %struct.object, ptr %312, i32 0, i32 1, !dbg !2058
  %314 = load i8, ptr %313, align 4, !dbg !2058
  %315 = zext i8 %314 to i32, !dbg !2057
  %316 = icmp eq i32 %315, 5, !dbg !2059
  br i1 %316, label %317, label %385, !dbg !2059

317:                                              ; preds = %266
    #dbg_declare(ptr %20, !2060, !DIExpression(), !2062)
  %318 = load i32, ptr %11, align 4, !dbg !2063
  store i32 %318, ptr %20, align 4, !dbg !2062
    #dbg_declare(ptr %21, !2064, !DIExpression(), !2065)
  store i32 0, ptr %21, align 4, !dbg !2066
  br label %319, !dbg !2067

319:                                              ; preds = %359, %317
  %320 = load i32, ptr %21, align 4, !dbg !2068
  %321 = add nsw i32 %320, 1, !dbg !2068
  store i32 %321, ptr %21, align 4, !dbg !2068
  %322 = icmp slt i32 %320, 10, !dbg !2069
  br i1 %322, label %323, label %331, !dbg !2070

323:                                              ; preds = %319
  %324 = load i32, ptr %20, align 4, !dbg !2071
  %325 = sext i32 %324 to i64, !dbg !2072
  %326 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %325, !dbg !2072
  %327 = getelementptr inbounds nuw %struct.object, ptr %326, i32 0, i32 1, !dbg !2073
  %328 = load i8, ptr %327, align 4, !dbg !2073
  %329 = zext i8 %328 to i32, !dbg !2072
  %330 = icmp eq i32 %329, 5, !dbg !2074
  br label %331

331:                                              ; preds = %323, %319
  %332 = phi i1 [ false, %319 ], [ %330, %323 ], !dbg !2075
  br i1 %332, label %333, label %383, !dbg !2067

333:                                              ; preds = %331
    #dbg_declare(ptr %22, !2076, !DIExpression(), !2078)
  %334 = load i32, ptr %20, align 4, !dbg !2079
  %335 = sext i32 %334 to i64, !dbg !2080
  %336 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %335, !dbg !2080
  %337 = getelementptr inbounds nuw %struct.object, ptr %336, i32 0, i32 22, !dbg !2081
  %338 = getelementptr inbounds nuw %struct.laser_info_s, ptr %337, i32 0, i32 1, !dbg !2082
  %339 = load i16, ptr %338, align 2, !dbg !2082
  %340 = sext i16 %339 to i32, !dbg !2080
  store i32 %340, ptr %22, align 4, !dbg !2083
  %341 = load i32, ptr %22, align 4, !dbg !2084
  %342 = sext i32 %341 to i64, !dbg !2086
  %343 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %342, !dbg !2086
  %344 = getelementptr inbounds nuw %struct.object, ptr %343, i32 0, i32 0, !dbg !2087
  %345 = load i32, ptr %344, align 4, !dbg !2087
  %346 = load i32, ptr %20, align 4, !dbg !2088
  %347 = sext i32 %346 to i64, !dbg !2089
  %348 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %347, !dbg !2089
  %349 = getelementptr inbounds nuw %struct.object, ptr %348, i32 0, i32 22, !dbg !2090
  %350 = getelementptr inbounds nuw %struct.laser_info_s, ptr %349, i32 0, i32 2, !dbg !2091
  %351 = load i32, ptr %350, align 4, !dbg !2091
  %352 = icmp ne i32 %345, %351, !dbg !2092
  br i1 %352, label %353, label %354, !dbg !2092

353:                                              ; preds = %333
  br label %384, !dbg !2093

354:                                              ; preds = %333
  %355 = load i32, ptr %22, align 4, !dbg !2094
  %356 = load i32, ptr %20, align 4, !dbg !2096
  %357 = icmp eq i32 %355, %356, !dbg !2097
  br i1 %357, label %358, label %359, !dbg !2097

358:                                              ; preds = %354
  call void @_Z4Int3v(), !dbg !2098
  br label %384, !dbg !2100

359:                                              ; preds = %354
  %360 = load i32, ptr %22, align 4, !dbg !2101
  store i32 %360, ptr %20, align 4, !dbg !2102
  %361 = load i32, ptr %20, align 4, !dbg !2103
  %362 = trunc i32 %361 to i16, !dbg !2103
  %363 = load ptr, ptr %15, align 8, !dbg !2104
  %364 = getelementptr inbounds nuw %struct.object, ptr %363, i32 0, i32 22, !dbg !2105
  %365 = getelementptr inbounds nuw %struct.laser_info_s, ptr %364, i32 0, i32 1, !dbg !2106
  store i16 %362, ptr %365, align 2, !dbg !2107
  %366 = load i32, ptr %20, align 4, !dbg !2108
  %367 = sext i32 %366 to i64, !dbg !2109
  %368 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %367, !dbg !2109
  %369 = getelementptr inbounds nuw %struct.object, ptr %368, i32 0, i32 1, !dbg !2110
  %370 = load i8, ptr %369, align 4, !dbg !2110
  %371 = zext i8 %370 to i16, !dbg !2109
  %372 = load ptr, ptr %15, align 8, !dbg !2111
  %373 = getelementptr inbounds nuw %struct.object, ptr %372, i32 0, i32 22, !dbg !2112
  %374 = getelementptr inbounds nuw %struct.laser_info_s, ptr %373, i32 0, i32 0, !dbg !2113
  store i16 %371, ptr %374, align 4, !dbg !2114
  %375 = load i32, ptr %20, align 4, !dbg !2115
  %376 = sext i32 %375 to i64, !dbg !2116
  %377 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %376, !dbg !2116
  %378 = getelementptr inbounds nuw %struct.object, ptr %377, i32 0, i32 0, !dbg !2117
  %379 = load i32, ptr %378, align 4, !dbg !2117
  %380 = load ptr, ptr %15, align 8, !dbg !2118
  %381 = getelementptr inbounds nuw %struct.object, ptr %380, i32 0, i32 22, !dbg !2119
  %382 = getelementptr inbounds nuw %struct.laser_info_s, ptr %381, i32 0, i32 2, !dbg !2120
  store i32 %379, ptr %382, align 4, !dbg !2121
  br label %319, !dbg !2067, !llvm.loop !2122

383:                                              ; preds = %331
  br label %384, !dbg !2124

384:                                              ; preds = %383, %358, %353
  br label %385, !dbg !2124

385:                                              ; preds = %384, %266
  %386 = load ptr, ptr %15, align 8, !dbg !2125
  %387 = getelementptr inbounds nuw %struct.object, ptr %386, i32 0, i32 7, !dbg !2127
  %388 = load i8, ptr %387, align 4, !dbg !2127
  %389 = zext i8 %388 to i32, !dbg !2125
  %390 = icmp eq i32 %389, 1, !dbg !2128
  br i1 %390, label %400, label %391, !dbg !2129

391:                                              ; preds = %385
  %392 = load ptr, ptr %15, align 8, !dbg !2130
  %393 = getelementptr inbounds nuw %struct.object, ptr %392, i32 0, i32 2, !dbg !2131
  %394 = load i8, ptr %393, align 1, !dbg !2131
  %395 = zext i8 %394 to i64, !dbg !2132
  %396 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %395, !dbg !2132
  %397 = getelementptr inbounds nuw %struct.weapon_info, ptr %396, i32 0, i32 16, !dbg !2133
  %398 = load i8, ptr %397, align 1, !dbg !2133
  %399 = icmp ne i8 %398, 0, !dbg !2134
  br i1 %399, label %400, label %410, !dbg !2129

400:                                              ; preds = %391, %385
  %401 = load ptr, ptr %15, align 8, !dbg !2135
  %402 = getelementptr inbounds nuw %struct.object, ptr %401, i32 0, i32 12, !dbg !2136
  %403 = load ptr, ptr %8, align 8, !dbg !2137
  %404 = load i32, ptr %11, align 4, !dbg !2138
  %405 = sext i32 %404 to i64, !dbg !2139
  %406 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %405, !dbg !2139
  %407 = getelementptr inbounds nuw %struct.object, ptr %406, i32 0, i32 12, !dbg !2140
  %408 = getelementptr inbounds nuw %struct.vms_matrix, ptr %407, i32 0, i32 1, !dbg !2141
  %409 = call noundef ptr @_Z18vm_vector_2_matrixP10vms_matrixP10vms_vectorS2_S2_(ptr noundef %402, ptr noundef %403, ptr noundef %408, ptr noundef null), !dbg !2142
  br label %410, !dbg !2142

410:                                              ; preds = %400, %391
  %411 = load i32, ptr %11, align 4, !dbg !2143
  %412 = sext i32 %411 to i64, !dbg !2145
  %413 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %412, !dbg !2145
  %414 = load ptr, ptr @Viewer, align 8, !dbg !2146
  %415 = icmp ne ptr %413, %414, !dbg !2147
  br i1 %415, label %416, label %457, !dbg !2148

416:                                              ; preds = %410
  %417 = load i32, ptr %11, align 4, !dbg !2149
  %418 = sext i32 %417 to i64, !dbg !2150
  %419 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %418, !dbg !2150
  %420 = getelementptr inbounds nuw %struct.object, ptr %419, i32 0, i32 1, !dbg !2151
  %421 = load i8, ptr %420, align 4, !dbg !2151
  %422 = zext i8 %421 to i32, !dbg !2150
  %423 = icmp ne i32 %422, 5, !dbg !2152
  br i1 %423, label %424, label %457, !dbg !2148

424:                                              ; preds = %416
  %425 = load ptr, ptr %15, align 8, !dbg !2153
  %426 = getelementptr inbounds nuw %struct.object, ptr %425, i32 0, i32 2, !dbg !2156
  %427 = load i8, ptr %426, align 1, !dbg !2156
  %428 = zext i8 %427 to i64, !dbg !2157
  %429 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %428, !dbg !2157
  %430 = getelementptr inbounds nuw %struct.weapon_info, ptr %429, i32 0, i32 4, !dbg !2158
  %431 = load i8, ptr %430, align 2, !dbg !2158
  %432 = sext i8 %431 to i32, !dbg !2157
  %433 = icmp sgt i32 %432, -1, !dbg !2159
  br i1 %433, label %434, label %456, !dbg !2159

434:                                              ; preds = %424
  %435 = load ptr, ptr %15, align 8, !dbg !2160
  %436 = getelementptr inbounds nuw %struct.object, ptr %435, i32 0, i32 9, !dbg !2161
  %437 = load i16, ptr %436, align 2, !dbg !2161
  %438 = load ptr, ptr %15, align 8, !dbg !2162
  %439 = getelementptr inbounds nuw %struct.object, ptr %438, i32 0, i32 11, !dbg !2163
  %440 = load ptr, ptr %15, align 8, !dbg !2164
  %441 = getelementptr inbounds nuw %struct.object, ptr %440, i32 0, i32 2, !dbg !2165
  %442 = load i8, ptr %441, align 1, !dbg !2165
  %443 = zext i8 %442 to i64, !dbg !2166
  %444 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %443, !dbg !2166
  %445 = getelementptr inbounds nuw %struct.weapon_info, ptr %444, i32 0, i32 27, !dbg !2167
  %446 = load i32, ptr %445, align 4, !dbg !2167
  %447 = load ptr, ptr %15, align 8, !dbg !2168
  %448 = getelementptr inbounds nuw %struct.object, ptr %447, i32 0, i32 2, !dbg !2169
  %449 = load i8, ptr %448, align 1, !dbg !2169
  %450 = zext i8 %449 to i64, !dbg !2170
  %451 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %450, !dbg !2170
  %452 = getelementptr inbounds nuw %struct.weapon_info, ptr %451, i32 0, i32 4, !dbg !2171
  %453 = load i8, ptr %452, align 2, !dbg !2171
  %454 = sext i8 %453 to i32, !dbg !2170
  %455 = call noundef ptr @_Z26object_create_muzzle_flashsP10vms_vectorii(i16 noundef signext %437, ptr noundef %439, i32 noundef %446, i32 noundef %454), !dbg !2172
  br label %456, !dbg !2172

456:                                              ; preds = %434, %424
  br label %457, !dbg !2173

457:                                              ; preds = %456, %416, %410
  store i32 65536, ptr %18, align 4, !dbg !2174
  %458 = load ptr, ptr %15, align 8, !dbg !2175
  %459 = getelementptr inbounds nuw %struct.object, ptr %458, i32 0, i32 2, !dbg !2177
  %460 = load i8, ptr %459, align 1, !dbg !2177
  %461 = zext i8 %460 to i64, !dbg !2178
  %462 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %461, !dbg !2178
  %463 = getelementptr inbounds nuw %struct.weapon_info, ptr %462, i32 0, i32 6, !dbg !2179
  %464 = load i16, ptr %463, align 4, !dbg !2179
  %465 = sext i16 %464 to i32, !dbg !2178
  %466 = icmp sgt i32 %465, -1, !dbg !2180
  br i1 %466, label %467, label %510, !dbg !2180

467:                                              ; preds = %457
  %468 = load i32, ptr %13, align 4, !dbg !2181
  %469 = icmp ne i32 %468, 0, !dbg !2181
  br i1 %469, label %470, label %509, !dbg !2181

470:                                              ; preds = %467
  %471 = load i32, ptr %11, align 4, !dbg !2184
  %472 = sext i32 %471 to i64, !dbg !2184
  %473 = load ptr, ptr @Viewer, align 8, !dbg !2187
  %474 = ptrtoint ptr %473 to i64, !dbg !2188
  %475 = sub i64 %474, ptrtoint (ptr @Objects to i64), !dbg !2188
  %476 = sdiv exact i64 %475, 268, !dbg !2188
  %477 = icmp eq i64 %472, %476, !dbg !2189
  br i1 %477, label %478, label %492, !dbg !2189

478:                                              ; preds = %470
  %479 = load i32, ptr %12, align 4, !dbg !2190
  %480 = icmp eq i32 %479, 11, !dbg !2193
  br i1 %480, label %481, label %482, !dbg !2193

481:                                              ; preds = %478
  store i32 32768, ptr %18, align 4, !dbg !2194
  br label %482, !dbg !2195

482:                                              ; preds = %481, %478
  %483 = load ptr, ptr %15, align 8, !dbg !2196
  %484 = getelementptr inbounds nuw %struct.object, ptr %483, i32 0, i32 2, !dbg !2197
  %485 = load i8, ptr %484, align 1, !dbg !2197
  %486 = zext i8 %485 to i64, !dbg !2198
  %487 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %486, !dbg !2198
  %488 = getelementptr inbounds nuw %struct.weapon_info, ptr %487, i32 0, i32 6, !dbg !2199
  %489 = load i16, ptr %488, align 4, !dbg !2199
  %490 = sext i16 %489 to i32, !dbg !2198
  %491 = load i32, ptr %18, align 4, !dbg !2200
  call void @_Z16digi_play_sampleii(i32 noundef %490, i32 noundef %491), !dbg !2201
  br label %508, !dbg !2202

492:                                              ; preds = %470
  %493 = load ptr, ptr %15, align 8, !dbg !2203
  %494 = getelementptr inbounds nuw %struct.object, ptr %493, i32 0, i32 2, !dbg !2205
  %495 = load i8, ptr %494, align 1, !dbg !2205
  %496 = zext i8 %495 to i64, !dbg !2206
  %497 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %496, !dbg !2206
  %498 = getelementptr inbounds nuw %struct.weapon_info, ptr %497, i32 0, i32 6, !dbg !2207
  %499 = load i16, ptr %498, align 4, !dbg !2207
  %500 = sext i16 %499 to i32, !dbg !2206
  %501 = load ptr, ptr %15, align 8, !dbg !2208
  %502 = getelementptr inbounds nuw %struct.object, ptr %501, i32 0, i32 9, !dbg !2209
  %503 = load i16, ptr %502, align 2, !dbg !2209
  %504 = load ptr, ptr %15, align 8, !dbg !2210
  %505 = getelementptr inbounds nuw %struct.object, ptr %504, i32 0, i32 11, !dbg !2211
  %506 = load i32, ptr %18, align 4, !dbg !2212
  %507 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef %500, i16 noundef signext %503, i16 noundef signext 0, ptr noundef %505, i32 noundef 0, i32 noundef %506), !dbg !2213
  br label %508

508:                                              ; preds = %492, %482
  br label %509, !dbg !2214

509:                                              ; preds = %508, %467
  br label %510, !dbg !2215

510:                                              ; preds = %509, %457
  %511 = load i32, ptr %11, align 4, !dbg !2216
  %512 = sext i32 %511 to i64, !dbg !2218
  %513 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %512, !dbg !2218
  %514 = getelementptr inbounds nuw %struct.object, ptr %513, i32 0, i32 1, !dbg !2219
  %515 = load i8, ptr %514, align 4, !dbg !2219
  %516 = zext i8 %515 to i32, !dbg !2218
  %517 = icmp eq i32 %516, 4, !dbg !2220
  br i1 %517, label %518, label %567, !dbg !2221

518:                                              ; preds = %510
  %519 = load i32, ptr %12, align 4, !dbg !2222
  %520 = sext i32 %519 to i64, !dbg !2223
  %521 = getelementptr inbounds [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %520, !dbg !2223
  %522 = getelementptr inbounds nuw %struct.weapon_info, ptr %521, i32 0, i32 0, !dbg !2224
  %523 = load i8, ptr %522, align 4, !dbg !2224
  %524 = sext i8 %523 to i32, !dbg !2223
  %525 = icmp ne i32 %524, -1, !dbg !2225
  br i1 %525, label %526, label %567, !dbg !2226

526:                                              ; preds = %518
  %527 = load i32, ptr %12, align 4, !dbg !2227
  %528 = icmp ne i32 %527, 9, !dbg !2228
  br i1 %528, label %529, label %567, !dbg !2226

529:                                              ; preds = %526
    #dbg_declare(ptr %23, !2229, !DIExpression(), !2231)
    #dbg_declare(ptr %24, !2232, !DIExpression(), !2233)
  %530 = load ptr, ptr %15, align 8, !dbg !2234
  %531 = getelementptr inbounds nuw %struct.object, ptr %530, i32 0, i32 11, !dbg !2235
  %532 = load ptr, ptr %8, align 8, !dbg !2236
  %533 = load i32, ptr @Laser_offset, align 4, !dbg !2237
  %534 = load i32, ptr %19, align 4, !dbg !2238
  %535 = sdiv i32 %534, 2, !dbg !2239
  %536 = add nsw i32 %533, %535, !dbg !2240
  %537 = call noundef ptr @_Z16vm_vec_scale_addP10vms_vectorS0_S0_i(ptr noundef %23, ptr noundef %531, ptr noundef %532, i32 noundef %536), !dbg !2241
  %538 = load ptr, ptr %15, align 8, !dbg !2242
  %539 = getelementptr inbounds nuw %struct.object, ptr %538, i32 0, i32 9, !dbg !2243
  %540 = load i16, ptr %539, align 2, !dbg !2243
  %541 = sext i16 %540 to i32, !dbg !2242
  %542 = call noundef i32 @_Z14find_point_segP10vms_vectori(ptr noundef %23, i32 noundef %541), !dbg !2244
  store i32 %542, ptr %24, align 4, !dbg !2245
  %543 = load i32, ptr %24, align 4, !dbg !2246
  %544 = load ptr, ptr %15, align 8, !dbg !2248
  %545 = getelementptr inbounds nuw %struct.object, ptr %544, i32 0, i32 9, !dbg !2249
  %546 = load i16, ptr %545, align 2, !dbg !2249
  %547 = sext i16 %546 to i32, !dbg !2248
  %548 = icmp ne i32 %543, %547, !dbg !2250
  br i1 %548, label %549, label %563, !dbg !2250

549:                                              ; preds = %529
  %550 = load i32, ptr %24, align 4, !dbg !2251
  %551 = icmp ne i32 %550, -1, !dbg !2254
  br i1 %551, label %552, label %561, !dbg !2254

552:                                              ; preds = %549
  %553 = load ptr, ptr %15, align 8, !dbg !2255
  %554 = getelementptr inbounds nuw %struct.object, ptr %553, i32 0, i32 11, !dbg !2257
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %554, ptr align 4 %23, i64 12, i1 false), !dbg !2258
  %555 = load ptr, ptr %15, align 8, !dbg !2259
  %556 = ptrtoint ptr %555 to i64, !dbg !2260
  %557 = sub i64 %556, ptrtoint (ptr @Objects to i64), !dbg !2260
  %558 = sdiv exact i64 %557, 268, !dbg !2260
  %559 = trunc i64 %558 to i32, !dbg !2259
  %560 = load i32, ptr %24, align 4, !dbg !2261
  call void @_Z10obj_relinkii(i32 noundef %559, i32 noundef %560), !dbg !2262
  br label %562, !dbg !2263

561:                                              ; preds = %549
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.10), !dbg !2264
  br label %562

562:                                              ; preds = %561, %552
  br label %566, !dbg !2265

563:                                              ; preds = %529
  %564 = load ptr, ptr %15, align 8, !dbg !2266
  %565 = getelementptr inbounds nuw %struct.object, ptr %564, i32 0, i32 11, !dbg !2267
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %565, ptr align 4 %23, i64 12, i1 false), !dbg !2268
  br label %566

566:                                              ; preds = %563, %562
  br label %567, !dbg !2269

567:                                              ; preds = %566, %526, %518, %510
  %568 = load i32, ptr %12, align 4, !dbg !2270
  %569 = icmp eq i32 %568, 16, !dbg !2272
  br i1 %569, label %573, label %570, !dbg !2273

570:                                              ; preds = %567
  %571 = load i32, ptr %12, align 4, !dbg !2274
  %572 = icmp eq i32 %571, 38, !dbg !2275
  br i1 %572, label %573, label %596, !dbg !2273

573:                                              ; preds = %570, %567
  %574 = load i32, ptr %11, align 4, !dbg !2276
  %575 = sext i32 %574 to i64, !dbg !2278
  %576 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %575, !dbg !2278
  %577 = getelementptr inbounds nuw %struct.object, ptr %576, i32 0, i32 21, !dbg !2279
  %578 = getelementptr inbounds nuw %struct.physics_info, ptr %577, i32 0, i32 0, !dbg !2280
  %579 = call noundef i32 @_Z16vm_vec_mag_quickP10vms_vector(ptr noundef %578), !dbg !2281
  store i32 %579, ptr %16, align 4, !dbg !2282
  %580 = load i32, ptr %11, align 4, !dbg !2283
  %581 = sext i32 %580 to i64, !dbg !2283
  %582 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %581, !dbg !2283
  %583 = getelementptr inbounds nuw %struct.object, ptr %582, i32 0, i32 21, !dbg !2283
  %584 = getelementptr inbounds nuw %struct.physics_info, ptr %583, i32 0, i32 0, !dbg !2283
  %585 = load i32, ptr %11, align 4, !dbg !2283
  %586 = sext i32 %585 to i64, !dbg !2283
  %587 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %586, !dbg !2283
  %588 = getelementptr inbounds nuw %struct.object, ptr %587, i32 0, i32 12, !dbg !2283
  %589 = getelementptr inbounds nuw %struct.vms_matrix, ptr %588, i32 0, i32 2, !dbg !2283
  %590 = call noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef %584, ptr noundef %589), !dbg !2283
  %591 = icmp slt i32 %590, 0, !dbg !2285
  br i1 %591, label %592, label %595, !dbg !2285

592:                                              ; preds = %573
  %593 = load i32, ptr %16, align 4, !dbg !2286
  %594 = sub nsw i32 0, %593, !dbg !2287
  store i32 %594, ptr %16, align 4, !dbg !2288
  br label %595, !dbg !2289

595:                                              ; preds = %592, %573
  br label %597, !dbg !2290

596:                                              ; preds = %570
  store i32 0, ptr %16, align 4, !dbg !2291
  br label %597

597:                                              ; preds = %596, %595
  %598 = load ptr, ptr %15, align 8, !dbg !2292
  %599 = getelementptr inbounds nuw %struct.object, ptr %598, i32 0, i32 2, !dbg !2293
  %600 = load i8, ptr %599, align 1, !dbg !2293
  %601 = zext i8 %600 to i64, !dbg !2294
  %602 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %601, !dbg !2294
  %603 = getelementptr inbounds nuw %struct.weapon_info, ptr %602, i32 0, i32 30, !dbg !2295
  %604 = load i32, ptr @Difficulty_level, align 4, !dbg !2296
  %605 = sext i32 %604 to i64, !dbg !2294
  %606 = getelementptr inbounds [5 x i32], ptr %603, i64 0, i64 %605, !dbg !2294
  %607 = load i32, ptr %606, align 4, !dbg !2294
  store i32 %607, ptr %17, align 4, !dbg !2297
  %608 = load ptr, ptr %15, align 8, !dbg !2298
  %609 = getelementptr inbounds nuw %struct.object, ptr %608, i32 0, i32 2, !dbg !2300
  %610 = load i8, ptr %609, align 1, !dbg !2300
  %611 = zext i8 %610 to i64, !dbg !2301
  %612 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %611, !dbg !2301
  %613 = getelementptr inbounds nuw %struct.weapon_info, ptr %612, i32 0, i32 17, !dbg !2302
  %614 = load i8, ptr %613, align 2, !dbg !2302
  %615 = zext i8 %614 to i32, !dbg !2301
  %616 = icmp ne i32 %615, 128, !dbg !2303
  br i1 %616, label %617, label %633, !dbg !2303

617:                                              ; preds = %597
    #dbg_declare(ptr %25, !2304, !DIExpression(), !2306)
  %618 = call noundef i32 @_Z6P_Randv(), !dbg !2307
  %619 = load ptr, ptr %15, align 8, !dbg !2308
  %620 = getelementptr inbounds nuw %struct.object, ptr %619, i32 0, i32 2, !dbg !2309
  %621 = load i8, ptr %620, align 1, !dbg !2309
  %622 = zext i8 %621 to i64, !dbg !2310
  %623 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %622, !dbg !2310
  %624 = getelementptr inbounds nuw %struct.weapon_info, ptr %623, i32 0, i32 17, !dbg !2311
  %625 = load i8, ptr %624, align 2, !dbg !2311
  %626 = zext i8 %625 to i32, !dbg !2310
  %627 = mul nsw i32 %618, %626, !dbg !2312
  %628 = ashr i32 %627, 6, !dbg !2313
  %629 = sub nsw i32 65536, %628, !dbg !2314
  store i32 %629, ptr %25, align 4, !dbg !2315
  %630 = load i32, ptr %17, align 4, !dbg !2316
  %631 = load i32, ptr %25, align 4, !dbg !2317
  %632 = call noundef i32 @_Z6fixmulii(i32 noundef %630, i32 noundef %631), !dbg !2318
  store i32 %632, ptr %17, align 4, !dbg !2319
  br label %633, !dbg !2320

633:                                              ; preds = %617, %597
  %634 = load ptr, ptr %15, align 8, !dbg !2321
  %635 = getelementptr inbounds nuw %struct.object, ptr %634, i32 0, i32 2, !dbg !2323
  %636 = load i8, ptr %635, align 1, !dbg !2323
  %637 = zext i8 %636 to i32, !dbg !2321
  %638 = icmp eq i32 %637, 19, !dbg !2324
  br i1 %638, label %663, label %639, !dbg !2325

639:                                              ; preds = %633
  %640 = load ptr, ptr %15, align 8, !dbg !2326
  %641 = getelementptr inbounds nuw %struct.object, ptr %640, i32 0, i32 2, !dbg !2327
  %642 = load i8, ptr %641, align 1, !dbg !2327
  %643 = zext i8 %642 to i32, !dbg !2326
  %644 = icmp eq i32 %643, 47, !dbg !2328
  br i1 %644, label %663, label %645, !dbg !2329

645:                                              ; preds = %639
  %646 = load ptr, ptr %15, align 8, !dbg !2330
  %647 = getelementptr inbounds nuw %struct.object, ptr %646, i32 0, i32 2, !dbg !2331
  %648 = load i8, ptr %647, align 1, !dbg !2331
  %649 = zext i8 %648 to i32, !dbg !2330
  %650 = icmp eq i32 %649, 29, !dbg !2332
  br i1 %650, label %663, label %651, !dbg !2333

651:                                              ; preds = %645
  %652 = load ptr, ptr %15, align 8, !dbg !2334
  %653 = getelementptr inbounds nuw %struct.object, ptr %652, i32 0, i32 2, !dbg !2335
  %654 = load i8, ptr %653, align 1, !dbg !2335
  %655 = zext i8 %654 to i32, !dbg !2334
  %656 = icmp eq i32 %655, 49, !dbg !2336
  br i1 %656, label %663, label %657, !dbg !2337

657:                                              ; preds = %651
  %658 = load ptr, ptr %15, align 8, !dbg !2338
  %659 = getelementptr inbounds nuw %struct.object, ptr %658, i32 0, i32 2, !dbg !2339
  %660 = load i8, ptr %659, align 1, !dbg !2339
  %661 = zext i8 %660 to i32, !dbg !2338
  %662 = icmp eq i32 %661, 54, !dbg !2340
  br i1 %662, label %663, label %666, !dbg !2337

663:                                              ; preds = %657, %651, %645, %639, %633
  %664 = load i32, ptr %17, align 4, !dbg !2341
  %665 = sdiv i32 %664, 4, !dbg !2341
  store i32 %665, ptr %17, align 4, !dbg !2341
  br label %666, !dbg !2342

666:                                              ; preds = %663, %657
  %667 = load ptr, ptr %15, align 8, !dbg !2343
  %668 = getelementptr inbounds nuw %struct.object, ptr %667, i32 0, i32 2, !dbg !2345
  %669 = load i8, ptr %668, align 1, !dbg !2345
  %670 = zext i8 %669 to i64, !dbg !2346
  %671 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %670, !dbg !2346
  %672 = getelementptr inbounds nuw %struct.weapon_info, ptr %671, i32 0, i32 33, !dbg !2347
  %673 = load i32, ptr %672, align 4, !dbg !2347
  %674 = icmp ne i32 %673, 0, !dbg !2348
  br i1 %674, label %675, label %678, !dbg !2348

675:                                              ; preds = %666
  %676 = load i32, ptr %17, align 4, !dbg !2349
  %677 = sdiv i32 %676, 2, !dbg !2349
  store i32 %677, ptr %17, align 4, !dbg !2349
  br label %678, !dbg !2350

678:                                              ; preds = %675, %666
  %679 = load ptr, ptr %15, align 8, !dbg !2351
  %680 = getelementptr inbounds nuw %struct.object, ptr %679, i32 0, i32 21, !dbg !2352
  %681 = getelementptr inbounds nuw %struct.physics_info, ptr %680, i32 0, i32 0, !dbg !2353
  %682 = load ptr, ptr %8, align 8, !dbg !2354
  %683 = load i32, ptr %17, align 4, !dbg !2355
  %684 = load i32, ptr %16, align 4, !dbg !2356
  %685 = add nsw i32 %683, %684, !dbg !2357
  %686 = call noundef ptr @_Z17vm_vec_copy_scaleP10vms_vectorS0_i(ptr noundef %681, ptr noundef %682, i32 noundef %685), !dbg !2358
  %687 = load i32, ptr %12, align 4, !dbg !2359
  %688 = sext i32 %687 to i64, !dbg !2361
  %689 = getelementptr inbounds [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %688, !dbg !2361
  %690 = getelementptr inbounds nuw %struct.weapon_info, ptr %689, i32 0, i32 33, !dbg !2362
  %691 = load i32, ptr %690, align 4, !dbg !2362
  %692 = icmp ne i32 %691, 0, !dbg !2363
  br i1 %692, label %693, label %715, !dbg !2363

693:                                              ; preds = %678
  %694 = load ptr, ptr %15, align 8, !dbg !2364
  %695 = getelementptr inbounds nuw %struct.object, ptr %694, i32 0, i32 21, !dbg !2366
  %696 = getelementptr inbounds nuw %struct.physics_info, ptr %695, i32 0, i32 0, !dbg !2367
  %697 = load ptr, ptr %15, align 8, !dbg !2368
  %698 = getelementptr inbounds nuw %struct.object, ptr %697, i32 0, i32 21, !dbg !2369
  %699 = getelementptr inbounds nuw %struct.physics_info, ptr %698, i32 0, i32 1, !dbg !2370
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %699, ptr align 4 %696, i64 12, i1 false), !dbg !2371
  %700 = load ptr, ptr %15, align 8, !dbg !2372
  %701 = getelementptr inbounds nuw %struct.object, ptr %700, i32 0, i32 21, !dbg !2373
  %702 = getelementptr inbounds nuw %struct.physics_info, ptr %701, i32 0, i32 1, !dbg !2374
  %703 = load ptr, ptr %15, align 8, !dbg !2375
  %704 = getelementptr inbounds nuw %struct.object, ptr %703, i32 0, i32 2, !dbg !2376
  %705 = load i8, ptr %704, align 1, !dbg !2376
  %706 = zext i8 %705 to i64, !dbg !2377
  %707 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %706, !dbg !2377
  %708 = getelementptr inbounds nuw %struct.weapon_info, ptr %707, i32 0, i32 33, !dbg !2378
  %709 = load i32, ptr %708, align 4, !dbg !2378
  %710 = load i32, ptr %17, align 4, !dbg !2379
  %711 = load i32, ptr %16, align 4, !dbg !2380
  %712 = add nsw i32 %710, %711, !dbg !2381
  %713 = call noundef i32 @_Z6fixdivii(i32 noundef %709, i32 noundef %712), !dbg !2382
  %714 = call noundef ptr @_Z12vm_vec_scaleP10vms_vectori(ptr noundef %702, i32 noundef %713), !dbg !2383
  br label %715, !dbg !2384

715:                                              ; preds = %693, %678
  %716 = load ptr, ptr %15, align 8, !dbg !2385
  %717 = getelementptr inbounds nuw %struct.object, ptr %716, i32 0, i32 1, !dbg !2387
  %718 = load i8, ptr %717, align 4, !dbg !2387
  %719 = zext i8 %718 to i32, !dbg !2385
  %720 = icmp eq i32 %719, 5, !dbg !2388
  br i1 %720, label %721, label %735, !dbg !2389

721:                                              ; preds = %715
  %722 = load ptr, ptr %15, align 8, !dbg !2390
  %723 = getelementptr inbounds nuw %struct.object, ptr %722, i32 0, i32 2, !dbg !2391
  %724 = load i8, ptr %723, align 1, !dbg !2391
  %725 = zext i8 %724 to i32, !dbg !2390
  %726 = icmp eq i32 %725, 9, !dbg !2392
  br i1 %726, label %727, label %735, !dbg !2389

727:                                              ; preds = %721
  %728 = call noundef i32 @_Z6P_Randv(), !dbg !2393
  %729 = sub nsw i32 %728, 16384, !dbg !2394
  %730 = shl i32 %729, 2, !dbg !2395
  %731 = load ptr, ptr %15, align 8, !dbg !2396
  %732 = getelementptr inbounds nuw %struct.object, ptr %731, i32 0, i32 20, !dbg !2397
  %733 = load i32, ptr %732, align 4, !dbg !2398
  %734 = add nsw i32 %733, %730, !dbg !2398
  store i32 %734, ptr %732, align 4, !dbg !2398
  br label %735, !dbg !2396

735:                                              ; preds = %727, %721, %715
  %736 = load i32, ptr %14, align 4, !dbg !2399
  store i32 %736, ptr %7, align 4, !dbg !2400
  br label %737, !dbg !2400

737:                                              ; preds = %735, %121, %55
  %738 = load i32, ptr %7, align 4, !dbg !2401
  ret i32 %738, !dbg !2401
}

declare noundef ptr @_Z18vm_vector_2_matrixP10vms_matrixP10vms_vectorS2_S2_(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #1

declare noundef ptr @_Z26object_create_muzzle_flashsP10vms_vectorii(i16 noundef signext, ptr noundef, i32 noundef, i32 noundef) #1

declare void @_Z27newdemo_record_guided_startv() #1

declare void @_Z10obj_relinkii(i32 noundef, i32 noundef) #1

declare noundef i32 @_Z16vm_vec_mag_quickP10vms_vector(ptr noundef) #1

declare noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef, ptr noundef) #1

declare noundef i32 @_Z6P_Randv() #1

declare noundef ptr @_Z17vm_vec_copy_scaleP10vms_vectorS0_i(ptr noundef, ptr noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z21Laser_create_new_easyP10vms_vectorS0_iii(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4) #0 !dbg !2402 {
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca %struct.fvi_query, align 8
  %13 = alloca %struct.fvi_info, align 4
  %14 = alloca ptr, align 8
  %15 = alloca i32, align 4
  store ptr %0, ptr %7, align 8
    #dbg_declare(ptr %7, !2405, !DIExpression(), !2406)
  store ptr %1, ptr %8, align 8
    #dbg_declare(ptr %8, !2407, !DIExpression(), !2408)
  store i32 %2, ptr %9, align 4
    #dbg_declare(ptr %9, !2409, !DIExpression(), !2410)
  store i32 %3, ptr %10, align 4
    #dbg_declare(ptr %10, !2411, !DIExpression(), !2412)
  store i32 %4, ptr %11, align 4
    #dbg_declare(ptr %11, !2413, !DIExpression(), !2414)
    #dbg_declare(ptr %12, !2415, !DIExpression(), !2416)
    #dbg_declare(ptr %13, !2417, !DIExpression(), !2418)
    #dbg_declare(ptr %14, !2419, !DIExpression(), !2420)
  %16 = load i32, ptr %9, align 4, !dbg !2421
  %17 = sext i32 %16 to i64, !dbg !2422
  %18 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %17, !dbg !2422
  store ptr %18, ptr %14, align 8, !dbg !2420
    #dbg_declare(ptr %15, !2423, !DIExpression(), !2424)
  %19 = load ptr, ptr %14, align 8, !dbg !2425
  %20 = getelementptr inbounds nuw %struct.object, ptr %19, i32 0, i32 11, !dbg !2426
  %21 = getelementptr inbounds nuw %struct.fvi_query, ptr %12, i32 0, i32 0, !dbg !2427
  store ptr %20, ptr %21, align 8, !dbg !2428
  %22 = load ptr, ptr %14, align 8, !dbg !2429
  %23 = getelementptr inbounds nuw %struct.object, ptr %22, i32 0, i32 9, !dbg !2430
  %24 = load i16, ptr %23, align 2, !dbg !2430
  %25 = sext i16 %24 to i32, !dbg !2429
  %26 = getelementptr inbounds nuw %struct.fvi_query, ptr %12, i32 0, i32 2, !dbg !2431
  store i32 %25, ptr %26, align 8, !dbg !2432
  %27 = load ptr, ptr %8, align 8, !dbg !2433
  %28 = getelementptr inbounds nuw %struct.fvi_query, ptr %12, i32 0, i32 1, !dbg !2434
  store ptr %27, ptr %28, align 8, !dbg !2435
  %29 = getelementptr inbounds nuw %struct.fvi_query, ptr %12, i32 0, i32 3, !dbg !2436
  store i32 0, ptr %29, align 4, !dbg !2437
  %30 = load ptr, ptr %14, align 8, !dbg !2438
  %31 = ptrtoint ptr %30 to i64, !dbg !2439
  %32 = sub i64 %31, ptrtoint (ptr @Objects to i64), !dbg !2439
  %33 = sdiv exact i64 %32, 268, !dbg !2439
  %34 = trunc i64 %33 to i16, !dbg !2438
  %35 = getelementptr inbounds nuw %struct.fvi_query, ptr %12, i32 0, i32 4, !dbg !2440
  store i16 %34, ptr %35, align 8, !dbg !2441
  %36 = getelementptr inbounds nuw %struct.fvi_query, ptr %12, i32 0, i32 5, !dbg !2442
  store ptr null, ptr %36, align 8, !dbg !2443
  %37 = getelementptr inbounds nuw %struct.fvi_query, ptr %12, i32 0, i32 6, !dbg !2444
  store i32 3, ptr %37, align 8, !dbg !2445
  %38 = call noundef i32 @_Z24find_vector_intersectionP9fvi_queryP8fvi_info(ptr noundef %12, ptr noundef %13), !dbg !2446
  store i32 %38, ptr %15, align 4, !dbg !2447
  %39 = load i32, ptr %15, align 4, !dbg !2448
  %40 = icmp ne i32 %39, 0, !dbg !2450
  br i1 %40, label %45, label %41, !dbg !2451

41:                                               ; preds = %5
  %42 = getelementptr inbounds nuw %struct.fvi_info, ptr %13, i32 0, i32 2, !dbg !2452
  %43 = load i32, ptr %42, align 4, !dbg !2452
  %44 = icmp eq i32 %43, -1, !dbg !2453
  br i1 %44, label %45, label %47, !dbg !2451

45:                                               ; preds = %41, %5
  %46 = load i32, ptr %9, align 4, !dbg !2454
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 1, ptr noundef @.str.11, i32 noundef %46), !dbg !2454
  store i32 -1, ptr %6, align 4, !dbg !2456
  br label %56, !dbg !2456

47:                                               ; preds = %41
  %48 = load ptr, ptr %7, align 8, !dbg !2457
  %49 = getelementptr inbounds nuw %struct.fvi_info, ptr %13, i32 0, i32 1, !dbg !2458
  %50 = getelementptr inbounds nuw %struct.fvi_info, ptr %13, i32 0, i32 2, !dbg !2459
  %51 = load i32, ptr %50, align 4, !dbg !2459
  %52 = load i32, ptr %9, align 4, !dbg !2460
  %53 = load i32, ptr %10, align 4, !dbg !2461
  %54 = load i32, ptr %11, align 4, !dbg !2462
  %55 = call noundef i32 @_Z16Laser_create_newP10vms_vectorS0_iiii(ptr noundef %48, ptr noundef %49, i32 noundef %51, i32 noundef %52, i32 noundef %53, i32 noundef %54), !dbg !2463
  store i32 %55, ptr %6, align 4, !dbg !2464
  br label %56, !dbg !2464

56:                                               ; preds = %47, %45
  %57 = load i32, ptr %6, align 4, !dbg !2465
  ret i32 %57, !dbg !2465
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z27object_to_object_visibilityP6objectS0_i(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 !dbg !2466 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca %struct.fvi_query, align 8
  %9 = alloca %struct.fvi_info, align 4
  %10 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
    #dbg_declare(ptr %5, !2469, !DIExpression(), !2470)
  store ptr %1, ptr %6, align 8
    #dbg_declare(ptr %6, !2471, !DIExpression(), !2472)
  store i32 %2, ptr %7, align 4
    #dbg_declare(ptr %7, !2473, !DIExpression(), !2474)
    #dbg_declare(ptr %8, !2475, !DIExpression(), !2476)
    #dbg_declare(ptr %9, !2477, !DIExpression(), !2478)
    #dbg_declare(ptr %10, !2479, !DIExpression(), !2480)
  %11 = load ptr, ptr %5, align 8, !dbg !2481
  %12 = getelementptr inbounds nuw %struct.object, ptr %11, i32 0, i32 11, !dbg !2482
  %13 = getelementptr inbounds nuw %struct.fvi_query, ptr %8, i32 0, i32 0, !dbg !2483
  store ptr %12, ptr %13, align 8, !dbg !2484
  %14 = load ptr, ptr %5, align 8, !dbg !2485
  %15 = getelementptr inbounds nuw %struct.object, ptr %14, i32 0, i32 9, !dbg !2486
  %16 = load i16, ptr %15, align 2, !dbg !2486
  %17 = sext i16 %16 to i32, !dbg !2485
  %18 = getelementptr inbounds nuw %struct.fvi_query, ptr %8, i32 0, i32 2, !dbg !2487
  store i32 %17, ptr %18, align 8, !dbg !2488
  %19 = load ptr, ptr %6, align 8, !dbg !2489
  %20 = getelementptr inbounds nuw %struct.object, ptr %19, i32 0, i32 11, !dbg !2490
  %21 = getelementptr inbounds nuw %struct.fvi_query, ptr %8, i32 0, i32 1, !dbg !2491
  store ptr %20, ptr %21, align 8, !dbg !2492
  %22 = getelementptr inbounds nuw %struct.fvi_query, ptr %8, i32 0, i32 3, !dbg !2493
  store i32 16, ptr %22, align 4, !dbg !2494
  %23 = load ptr, ptr %5, align 8, !dbg !2495
  %24 = ptrtoint ptr %23 to i64, !dbg !2496
  %25 = sub i64 %24, ptrtoint (ptr @Objects to i64), !dbg !2496
  %26 = sdiv exact i64 %25, 268, !dbg !2496
  %27 = trunc i64 %26 to i16, !dbg !2495
  %28 = getelementptr inbounds nuw %struct.fvi_query, ptr %8, i32 0, i32 4, !dbg !2497
  store i16 %27, ptr %28, align 8, !dbg !2498
  %29 = getelementptr inbounds nuw %struct.fvi_query, ptr %8, i32 0, i32 5, !dbg !2499
  store ptr null, ptr %29, align 8, !dbg !2500
  %30 = load i32, ptr %7, align 4, !dbg !2501
  %31 = getelementptr inbounds nuw %struct.fvi_query, ptr %8, i32 0, i32 6, !dbg !2502
  store i32 %30, ptr %31, align 8, !dbg !2503
  %32 = call noundef i32 @_Z24find_vector_intersectionP9fvi_queryP8fvi_info(ptr noundef %8, ptr noundef %9), !dbg !2504
  store i32 %32, ptr %10, align 4, !dbg !2505
  %33 = load i32, ptr %10, align 4, !dbg !2506
  %34 = icmp eq i32 %33, 1, !dbg !2508
  br i1 %34, label %35, label %36, !dbg !2508

35:                                               ; preds = %3
  store i32 0, ptr %4, align 4, !dbg !2509
  br label %43, !dbg !2509

36:                                               ; preds = %3
  %37 = load i32, ptr %10, align 4, !dbg !2510
  %38 = icmp eq i32 %37, 0, !dbg !2512
  br i1 %38, label %39, label %40, !dbg !2512

39:                                               ; preds = %36
  store i32 1, ptr %4, align 4, !dbg !2513
  br label %43, !dbg !2513

40:                                               ; preds = %36
  call void @_Z4Int3v(), !dbg !2514
  br label %41

41:                                               ; preds = %40
  br label %42

42:                                               ; preds = %41
  store i32 0, ptr %4, align 4, !dbg !2515
  br label %43, !dbg !2515

43:                                               ; preds = %42, %39, %35
  %44 = load i32, ptr %4, align 4, !dbg !2516
  ret i32 %44, !dbg !2516
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z19object_is_trackableiP6objectPi(i32 noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !2517 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca %struct.vms_vector, align 4
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
    #dbg_declare(ptr %5, !2521, !DIExpression(), !2522)
  store ptr %1, ptr %6, align 8
    #dbg_declare(ptr %6, !2523, !DIExpression(), !2524)
  store ptr %2, ptr %7, align 8
    #dbg_declare(ptr %7, !2525, !DIExpression(), !2526)
    #dbg_declare(ptr %8, !2527, !DIExpression(), !2528)
    #dbg_declare(ptr %9, !2529, !DIExpression(), !2530)
  %11 = load i32, ptr %5, align 4, !dbg !2531
  %12 = icmp eq i32 %11, -1, !dbg !2533
  br i1 %12, label %13, label %14, !dbg !2533

13:                                               ; preds = %3
  store i32 0, ptr %4, align 4, !dbg !2534
  br label %110, !dbg !2534

14:                                               ; preds = %3
  %15 = load i32, ptr @Game_mode, align 4, !dbg !2535
  %16 = and i32 %15, 16, !dbg !2537
  %17 = icmp ne i32 %16, 0, !dbg !2535
  br i1 %17, label %18, label %19, !dbg !2535

18:                                               ; preds = %14
  store i32 0, ptr %4, align 4, !dbg !2538
  br label %110, !dbg !2538

19:                                               ; preds = %14
  %20 = load i32, ptr %5, align 4, !dbg !2539
  %21 = sext i32 %20 to i64, !dbg !2540
  %22 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %21, !dbg !2540
  store ptr %22, ptr %9, align 8, !dbg !2541
  %23 = load i32, ptr %5, align 4, !dbg !2542
  %24 = load i32, ptr @Player_num, align 4, !dbg !2544
  %25 = sext i32 %24 to i64, !dbg !2545
  %26 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %25, !dbg !2545
  %27 = getelementptr inbounds nuw %struct.player, ptr %26, i32 0, i32 4, !dbg !2546
  %28 = load i32, ptr %27, align 4, !dbg !2546
  %29 = icmp eq i32 %23, %28, !dbg !2547
  br i1 %29, label %30, label %39, !dbg !2548

30:                                               ; preds = %19
  %31 = load i32, ptr @Player_num, align 4, !dbg !2549
  %32 = sext i32 %31 to i64, !dbg !2550
  %33 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %32, !dbg !2550
  %34 = getelementptr inbounds nuw %struct.player, ptr %33, i32 0, i32 7, !dbg !2551
  %35 = load i32, ptr %34, align 4, !dbg !2551
  %36 = and i32 %35, 2048, !dbg !2552
  %37 = icmp ne i32 %36, 0, !dbg !2553
  br i1 %37, label %38, label %39, !dbg !2548

38:                                               ; preds = %30
  store i32 0, ptr %4, align 4, !dbg !2554
  br label %110, !dbg !2554

39:                                               ; preds = %30, %19
  %40 = load ptr, ptr %9, align 8, !dbg !2555
  %41 = getelementptr inbounds nuw %struct.object, ptr %40, i32 0, i32 1, !dbg !2557
  %42 = load i8, ptr %41, align 4, !dbg !2557
  %43 = zext i8 %42 to i32, !dbg !2555
  %44 = icmp eq i32 %43, 2, !dbg !2558
  br i1 %44, label %45, label %72, !dbg !2558

45:                                               ; preds = %39
  %46 = load ptr, ptr %9, align 8, !dbg !2559
  %47 = getelementptr inbounds nuw %struct.object, ptr %46, i32 0, i32 22, !dbg !2562
  %48 = getelementptr inbounds nuw %struct.ai_static, ptr %47, i32 0, i32 1, !dbg !2563
  %49 = getelementptr inbounds [11 x i8], ptr %48, i64 0, i64 6, !dbg !2559
  %50 = load i8, ptr %49, align 1, !dbg !2559
  %51 = icmp ne i8 %50, 0, !dbg !2559
  br i1 %51, label %52, label %53, !dbg !2559

52:                                               ; preds = %45
  store i32 0, ptr %4, align 4, !dbg !2564
  br label %110, !dbg !2564

53:                                               ; preds = %45
  %54 = load ptr, ptr %9, align 8, !dbg !2565
  %55 = getelementptr inbounds nuw %struct.object, ptr %54, i32 0, i32 2, !dbg !2567
  %56 = load i8, ptr %55, align 1, !dbg !2567
  %57 = zext i8 %56 to i64, !dbg !2568
  %58 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %57, !dbg !2568
  %59 = getelementptr inbounds nuw %struct.robot_info, ptr %58, i32 0, i32 37, !dbg !2569
  %60 = load i8, ptr %59, align 1, !dbg !2569
  %61 = icmp ne i8 %60, 0, !dbg !2568
  br i1 %61, label %62, label %71, !dbg !2568

62:                                               ; preds = %53
  %63 = load ptr, ptr %6, align 8, !dbg !2570
  %64 = getelementptr inbounds nuw %struct.object, ptr %63, i32 0, i32 22, !dbg !2572
  %65 = getelementptr inbounds nuw %struct.laser_info_s, ptr %64, i32 0, i32 0, !dbg !2573
  %66 = load i16, ptr %65, align 4, !dbg !2573
  %67 = sext i16 %66 to i32, !dbg !2570
  %68 = icmp eq i32 %67, 4, !dbg !2574
  br i1 %68, label %69, label %70, !dbg !2574

69:                                               ; preds = %62
  store i32 0, ptr %4, align 4, !dbg !2575
  br label %110, !dbg !2575

70:                                               ; preds = %62
  br label %71, !dbg !2576

71:                                               ; preds = %70, %53
  br label %72, !dbg !2577

72:                                               ; preds = %71, %39
  %73 = load ptr, ptr %9, align 8, !dbg !2578
  %74 = getelementptr inbounds nuw %struct.object, ptr %73, i32 0, i32 11, !dbg !2579
  %75 = load ptr, ptr %6, align 8, !dbg !2580
  %76 = getelementptr inbounds nuw %struct.object, ptr %75, i32 0, i32 11, !dbg !2581
  %77 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %8, ptr noundef %74, ptr noundef %76), !dbg !2582
  %78 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %8), !dbg !2583
  %79 = load ptr, ptr %6, align 8, !dbg !2584
  %80 = getelementptr inbounds nuw %struct.object, ptr %79, i32 0, i32 12, !dbg !2584
  %81 = getelementptr inbounds nuw %struct.vms_matrix, ptr %80, i32 0, i32 2, !dbg !2584
  %82 = call noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef %8, ptr noundef %81), !dbg !2584
  %83 = load ptr, ptr %7, align 8, !dbg !2585
  store i32 %82, ptr %83, align 4, !dbg !2586
  %84 = load ptr, ptr %7, align 8, !dbg !2587
  %85 = load i32, ptr %84, align 4, !dbg !2589
  %86 = load i32, ptr @Min_trackable_dot, align 4, !dbg !2590
  %87 = icmp slt i32 %85, %86, !dbg !2591
  br i1 %87, label %88, label %99, !dbg !2592

88:                                               ; preds = %72
  %89 = load ptr, ptr %7, align 8, !dbg !2593
  %90 = load i32, ptr %89, align 4, !dbg !2594
  %91 = icmp sgt i32 %90, 58982, !dbg !2595
  br i1 %91, label %92, label %99, !dbg !2592

92:                                               ; preds = %88
  %93 = call noundef i32 @_Z16vm_vec_normalizeP10vms_vector(ptr noundef %8), !dbg !2596
  %94 = load ptr, ptr %6, align 8, !dbg !2598
  %95 = getelementptr inbounds nuw %struct.object, ptr %94, i32 0, i32 12, !dbg !2598
  %96 = getelementptr inbounds nuw %struct.vms_matrix, ptr %95, i32 0, i32 2, !dbg !2598
  %97 = call noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef %8, ptr noundef %96), !dbg !2598
  %98 = load ptr, ptr %7, align 8, !dbg !2599
  store i32 %97, ptr %98, align 4, !dbg !2600
  br label %99, !dbg !2601

99:                                               ; preds = %92, %88, %72
  %100 = load ptr, ptr %7, align 8, !dbg !2602
  %101 = load i32, ptr %100, align 4, !dbg !2604
  %102 = load i32, ptr @Min_trackable_dot, align 4, !dbg !2605
  %103 = icmp sge i32 %101, %102, !dbg !2606
  br i1 %103, label %104, label %109, !dbg !2606

104:                                              ; preds = %99
    #dbg_declare(ptr %10, !2607, !DIExpression(), !2609)
  %105 = load ptr, ptr %6, align 8, !dbg !2610
  %106 = load ptr, ptr %9, align 8, !dbg !2611
  %107 = call noundef i32 @_Z27object_to_object_visibilityP6objectS0_i(ptr noundef %105, ptr noundef %106, i32 noundef 2), !dbg !2612
  store i32 %107, ptr %10, align 4, !dbg !2613
  %108 = load i32, ptr %10, align 4, !dbg !2614
  store i32 %108, ptr %4, align 4, !dbg !2615
  br label %110, !dbg !2615

109:                                              ; preds = %99
  store i32 0, ptr %4, align 4, !dbg !2616
  br label %110, !dbg !2616

110:                                              ; preds = %109, %104, %69, %52, %38, %18, %13
  %111 = load i32, ptr %4, align 4, !dbg !2618
  ret i32 %111, !dbg !2618
}

declare noundef i32 @_Z16vm_vec_normalizeP10vms_vector(ptr noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z32call_find_homing_object_completeP6objectP10vms_vector(ptr noundef %0, ptr noundef %1) #0 !dbg !2619 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !2622, !DIExpression(), !2623)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !2624, !DIExpression(), !2625)
  %7 = load i32, ptr @Game_mode, align 4, !dbg !2626
  %8 = and i32 %7, 38, !dbg !2628
  %9 = icmp ne i32 %8, 0, !dbg !2626
  br i1 %9, label %10, label %45, !dbg !2626

10:                                               ; preds = %2
  %11 = load ptr, ptr %4, align 8, !dbg !2629
  %12 = getelementptr inbounds nuw %struct.object, ptr %11, i32 0, i32 22, !dbg !2632
  %13 = getelementptr inbounds nuw %struct.laser_info_s, ptr %12, i32 0, i32 0, !dbg !2633
  %14 = load i16, ptr %13, align 4, !dbg !2633
  %15 = sext i16 %14 to i32, !dbg !2629
  %16 = icmp eq i32 %15, 4, !dbg !2634
  br i1 %16, label %17, label %29, !dbg !2634

17:                                               ; preds = %10
  %18 = load i32, ptr @Game_mode, align 4, !dbg !2635
  %19 = and i32 %18, 16, !dbg !2638
  %20 = icmp ne i32 %19, 0, !dbg !2635
  br i1 %20, label %21, label %25, !dbg !2635

21:                                               ; preds = %17
  %22 = load ptr, ptr %5, align 8, !dbg !2639
  %23 = load ptr, ptr %4, align 8, !dbg !2640
  %24 = call noundef i32 @_Z27find_homing_object_completeP10vms_vectorP6objectii(ptr noundef %22, ptr noundef %23, i32 noundef 2, i32 noundef -1), !dbg !2641
  store i32 %24, ptr %3, align 4, !dbg !2642
  br label %49, !dbg !2642

25:                                               ; preds = %17
  %26 = load ptr, ptr %5, align 8, !dbg !2643
  %27 = load ptr, ptr %4, align 8, !dbg !2644
  %28 = call noundef i32 @_Z27find_homing_object_completeP10vms_vectorP6objectii(ptr noundef %26, ptr noundef %27, i32 noundef 4, i32 noundef 2), !dbg !2645
  store i32 %28, ptr %3, align 4, !dbg !2646
  br label %49, !dbg !2646

29:                                               ; preds = %10
    #dbg_declare(ptr %6, !2647, !DIExpression(), !2649)
  store i32 -1, ptr %6, align 4, !dbg !2649
  %30 = load i32, ptr @Robots_kill_robots_cheat, align 4, !dbg !2650
  %31 = icmp ne i32 %30, 0, !dbg !2650
  br i1 %31, label %32, label %33, !dbg !2650

32:                                               ; preds = %29
  store i32 2, ptr %6, align 4, !dbg !2652
  br label %33, !dbg !2653

33:                                               ; preds = %32, %29
  %34 = load ptr, ptr %4, align 8, !dbg !2654
  %35 = getelementptr inbounds nuw %struct.object, ptr %34, i32 0, i32 22, !dbg !2654
  %36 = getelementptr inbounds nuw %struct.laser_info_s, ptr %35, i32 0, i32 0, !dbg !2654
  %37 = load i16, ptr %36, align 4, !dbg !2654
  %38 = sext i16 %37 to i32, !dbg !2654
  %39 = icmp eq i32 %38, 2, !dbg !2654
  %40 = zext i1 %39 to i32, !dbg !2654
  call void @_Z7_AssertiPKcS0_i(i32 noundef %40, ptr noundef @.str.12, ptr noundef @.str.3, i32 noundef 987), !dbg !2654
  %41 = load ptr, ptr %5, align 8, !dbg !2655
  %42 = load ptr, ptr %4, align 8, !dbg !2656
  %43 = load i32, ptr %6, align 4, !dbg !2657
  %44 = call noundef i32 @_Z27find_homing_object_completeP10vms_vectorP6objectii(ptr noundef %41, ptr noundef %42, i32 noundef 4, i32 noundef %43), !dbg !2658
  store i32 %44, ptr %3, align 4, !dbg !2659
  br label %49, !dbg !2659

45:                                               ; preds = %2
  %46 = load ptr, ptr %5, align 8, !dbg !2660
  %47 = load ptr, ptr %4, align 8, !dbg !2661
  %48 = call noundef i32 @_Z27find_homing_object_completeP10vms_vectorP6objectii(ptr noundef %46, ptr noundef %47, i32 noundef 2, i32 noundef -1), !dbg !2662
  store i32 %48, ptr %3, align 4, !dbg !2663
  br label %49, !dbg !2663

49:                                               ; preds = %45, %33, %25, %21
  %50 = load i32, ptr %3, align 4, !dbg !2664
  ret i32 %50, !dbg !2664
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z27find_homing_object_completeP10vms_vectorP6objectii(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 !dbg !2665 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca %struct.vms_vector, align 4
  %18 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
    #dbg_declare(ptr %5, !2668, !DIExpression(), !2669)
  store ptr %1, ptr %6, align 8
    #dbg_declare(ptr %6, !2670, !DIExpression(), !2671)
  store i32 %2, ptr %7, align 4
    #dbg_declare(ptr %7, !2672, !DIExpression(), !2673)
  store i32 %3, ptr %8, align 4
    #dbg_declare(ptr %8, !2674, !DIExpression(), !2675)
    #dbg_declare(ptr %9, !2676, !DIExpression(), !2677)
    #dbg_declare(ptr %10, !2678, !DIExpression(), !2679)
  store i32 -131072, ptr %10, align 4, !dbg !2679
    #dbg_declare(ptr %11, !2680, !DIExpression(), !2681)
  store i32 -1, ptr %11, align 4, !dbg !2681
    #dbg_declare(ptr %12, !2682, !DIExpression(), !2683)
    #dbg_declare(ptr %13, !2684, !DIExpression(), !2685)
  %19 = load ptr, ptr %6, align 8, !dbg !2686
  %20 = getelementptr inbounds nuw %struct.object, ptr %19, i32 0, i32 2, !dbg !2686
  %21 = load i8, ptr %20, align 1, !dbg !2686
  %22 = zext i8 %21 to i64, !dbg !2686
  %23 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %22, !dbg !2686
  %24 = getelementptr inbounds nuw %struct.weapon_info, ptr %23, i32 0, i32 16, !dbg !2686
  %25 = load i8, ptr %24, align 1, !dbg !2686
  %26 = icmp ne i8 %25, 0, !dbg !2686
  br i1 %26, label %33, label %27, !dbg !2686

27:                                               ; preds = %4
  %28 = load ptr, ptr %6, align 8, !dbg !2686
  %29 = getelementptr inbounds nuw %struct.object, ptr %28, i32 0, i32 2, !dbg !2686
  %30 = load i8, ptr %29, align 1, !dbg !2686
  %31 = zext i8 %30 to i32, !dbg !2686
  %32 = icmp eq i32 %31, 35, !dbg !2686
  br label %33, !dbg !2686

33:                                               ; preds = %27, %4
  %34 = phi i1 [ true, %4 ], [ %32, %27 ]
  %35 = zext i1 %34 to i32, !dbg !2686
  call void @_Z7_AssertiPKcS0_i(i32 noundef %35, ptr noundef @.str.13, ptr noundef @.str.3, i32 noundef 1315), !dbg !2686
  store i32 16384000, ptr %12, align 4, !dbg !2687
  store i32 57344, ptr %13, align 4, !dbg !2688
  %36 = load ptr, ptr %6, align 8, !dbg !2689
  %37 = getelementptr inbounds nuw %struct.object, ptr %36, i32 0, i32 2, !dbg !2691
  %38 = load i8, ptr %37, align 1, !dbg !2691
  %39 = zext i8 %38 to i32, !dbg !2689
  %40 = icmp eq i32 %39, 35, !dbg !2692
  br i1 %40, label %41, label %42, !dbg !2692

41:                                               ; preds = %33
  store i32 5242880, ptr %12, align 4, !dbg !2693
  store i32 61440, ptr %13, align 4, !dbg !2695
  br label %42, !dbg !2696

42:                                               ; preds = %41, %33
  store i32 0, ptr %9, align 4, !dbg !2697
  br label %43, !dbg !2699

43:                                               ; preds = %202, %42
  %44 = load i32, ptr %9, align 4, !dbg !2700
  %45 = load i32, ptr @Highest_object_index, align 4, !dbg !2702
  %46 = icmp sle i32 %44, %45, !dbg !2703
  br i1 %46, label %47, label %205, !dbg !2704

47:                                               ; preds = %43
    #dbg_declare(ptr %14, !2705, !DIExpression(), !2707)
  store i32 0, ptr %14, align 4, !dbg !2707
    #dbg_declare(ptr %15, !2708, !DIExpression(), !2709)
    #dbg_declare(ptr %16, !2710, !DIExpression(), !2711)
    #dbg_declare(ptr %17, !2712, !DIExpression(), !2713)
    #dbg_declare(ptr %18, !2714, !DIExpression(), !2715)
  %48 = load i32, ptr %9, align 4, !dbg !2716
  %49 = sext i32 %48 to i64, !dbg !2717
  %50 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %49, !dbg !2717
  store ptr %50, ptr %18, align 8, !dbg !2715
  %51 = load ptr, ptr %18, align 8, !dbg !2718
  %52 = getelementptr inbounds nuw %struct.object, ptr %51, i32 0, i32 1, !dbg !2720
  %53 = load i8, ptr %52, align 4, !dbg !2720
  %54 = zext i8 %53 to i32, !dbg !2718
  %55 = load i32, ptr %7, align 4, !dbg !2721
  %56 = icmp ne i32 %54, %55, !dbg !2722
  br i1 %56, label %57, label %97, !dbg !2723

57:                                               ; preds = %47
  %58 = load ptr, ptr %18, align 8, !dbg !2724
  %59 = getelementptr inbounds nuw %struct.object, ptr %58, i32 0, i32 1, !dbg !2725
  %60 = load i8, ptr %59, align 4, !dbg !2725
  %61 = zext i8 %60 to i32, !dbg !2724
  %62 = load i32, ptr %8, align 4, !dbg !2726
  %63 = icmp ne i32 %61, %62, !dbg !2727
  br i1 %63, label %64, label %97, !dbg !2723

64:                                               ; preds = %57
  %65 = load ptr, ptr %18, align 8, !dbg !2728
  %66 = getelementptr inbounds nuw %struct.object, ptr %65, i32 0, i32 1, !dbg !2730
  %67 = load i8, ptr %66, align 4, !dbg !2730
  %68 = zext i8 %67 to i32, !dbg !2728
  %69 = icmp eq i32 %68, 5, !dbg !2731
  br i1 %69, label %70, label %95, !dbg !2732

70:                                               ; preds = %64
  %71 = load ptr, ptr %18, align 8, !dbg !2733
  %72 = getelementptr inbounds nuw %struct.object, ptr %71, i32 0, i32 2, !dbg !2734
  %73 = load i8, ptr %72, align 1, !dbg !2734
  %74 = zext i8 %73 to i32, !dbg !2733
  %75 = icmp eq i32 %74, 16, !dbg !2735
  br i1 %75, label %82, label %76, !dbg !2736

76:                                               ; preds = %70
  %77 = load ptr, ptr %18, align 8, !dbg !2737
  %78 = getelementptr inbounds nuw %struct.object, ptr %77, i32 0, i32 2, !dbg !2738
  %79 = load i8, ptr %78, align 1, !dbg !2738
  %80 = zext i8 %79 to i32, !dbg !2737
  %81 = icmp eq i32 %80, 38, !dbg !2739
  br i1 %81, label %82, label %95, !dbg !2732

82:                                               ; preds = %76, %70
  %83 = load ptr, ptr %18, align 8, !dbg !2740
  %84 = getelementptr inbounds nuw %struct.object, ptr %83, i32 0, i32 22, !dbg !2743
  %85 = getelementptr inbounds nuw %struct.laser_info_s, ptr %84, i32 0, i32 2, !dbg !2744
  %86 = load i32, ptr %85, align 4, !dbg !2744
  %87 = load ptr, ptr %6, align 8, !dbg !2745
  %88 = getelementptr inbounds nuw %struct.object, ptr %87, i32 0, i32 22, !dbg !2746
  %89 = getelementptr inbounds nuw %struct.laser_info_s, ptr %88, i32 0, i32 2, !dbg !2747
  %90 = load i32, ptr %89, align 4, !dbg !2747
  %91 = icmp ne i32 %86, %90, !dbg !2748
  br i1 %91, label %92, label %93, !dbg !2748

92:                                               ; preds = %82
  store i32 1, ptr %14, align 4, !dbg !2749
  br label %94, !dbg !2750

93:                                               ; preds = %82
  br label %202, !dbg !2751

94:                                               ; preds = %92
  br label %96, !dbg !2752

95:                                               ; preds = %76, %64
  br label %202, !dbg !2753

96:                                               ; preds = %94
  br label %97, !dbg !2754

97:                                               ; preds = %96, %57, %47
  %98 = load i32, ptr %9, align 4, !dbg !2755
  %99 = load ptr, ptr %6, align 8, !dbg !2757
  %100 = getelementptr inbounds nuw %struct.object, ptr %99, i32 0, i32 22, !dbg !2758
  %101 = getelementptr inbounds nuw %struct.laser_info_s, ptr %100, i32 0, i32 1, !dbg !2759
  %102 = load i16, ptr %101, align 2, !dbg !2759
  %103 = sext i16 %102 to i32, !dbg !2757
  %104 = icmp eq i32 %98, %103, !dbg !2760
  br i1 %104, label %105, label %106, !dbg !2760

105:                                              ; preds = %97
  br label %202, !dbg !2761

106:                                              ; preds = %97
  %107 = load ptr, ptr %18, align 8, !dbg !2762
  %108 = getelementptr inbounds nuw %struct.object, ptr %107, i32 0, i32 1, !dbg !2764
  %109 = load i8, ptr %108, align 4, !dbg !2764
  %110 = zext i8 %109 to i32, !dbg !2762
  %111 = icmp eq i32 %110, 4, !dbg !2765
  br i1 %111, label %112, label %124, !dbg !2765

112:                                              ; preds = %106
  %113 = load ptr, ptr %18, align 8, !dbg !2766
  %114 = getelementptr inbounds nuw %struct.object, ptr %113, i32 0, i32 2, !dbg !2769
  %115 = load i8, ptr %114, align 1, !dbg !2769
  %116 = zext i8 %115 to i64, !dbg !2770
  %117 = getelementptr inbounds nuw [12 x %struct.player], ptr @Players, i64 0, i64 %116, !dbg !2770
  %118 = getelementptr inbounds nuw %struct.player, ptr %117, i32 0, i32 7, !dbg !2771
  %119 = load i32, ptr %118, align 4, !dbg !2771
  %120 = and i32 %119, 2048, !dbg !2772
  %121 = icmp ne i32 %120, 0, !dbg !2770
  br i1 %121, label %122, label %123, !dbg !2770

122:                                              ; preds = %112
  br label %202, !dbg !2773

123:                                              ; preds = %112
  br label %124, !dbg !2774

124:                                              ; preds = %123, %106
  %125 = load ptr, ptr %18, align 8, !dbg !2775
  %126 = getelementptr inbounds nuw %struct.object, ptr %125, i32 0, i32 1, !dbg !2777
  %127 = load i8, ptr %126, align 4, !dbg !2777
  %128 = zext i8 %127 to i32, !dbg !2775
  %129 = icmp eq i32 %128, 2, !dbg !2778
  br i1 %129, label %130, label %157, !dbg !2778

130:                                              ; preds = %124
  %131 = load ptr, ptr %18, align 8, !dbg !2779
  %132 = getelementptr inbounds nuw %struct.object, ptr %131, i32 0, i32 22, !dbg !2782
  %133 = getelementptr inbounds nuw %struct.ai_static, ptr %132, i32 0, i32 1, !dbg !2783
  %134 = getelementptr inbounds [11 x i8], ptr %133, i64 0, i64 6, !dbg !2779
  %135 = load i8, ptr %134, align 1, !dbg !2779
  %136 = icmp ne i8 %135, 0, !dbg !2779
  br i1 %136, label %137, label %138, !dbg !2779

137:                                              ; preds = %130
  br label %202, !dbg !2784

138:                                              ; preds = %130
  %139 = load ptr, ptr %18, align 8, !dbg !2785
  %140 = getelementptr inbounds nuw %struct.object, ptr %139, i32 0, i32 2, !dbg !2787
  %141 = load i8, ptr %140, align 1, !dbg !2787
  %142 = zext i8 %141 to i64, !dbg !2788
  %143 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %142, !dbg !2788
  %144 = getelementptr inbounds nuw %struct.robot_info, ptr %143, i32 0, i32 37, !dbg !2789
  %145 = load i8, ptr %144, align 1, !dbg !2789
  %146 = icmp ne i8 %145, 0, !dbg !2788
  br i1 %146, label %147, label %156, !dbg !2788

147:                                              ; preds = %138
  %148 = load ptr, ptr %6, align 8, !dbg !2790
  %149 = getelementptr inbounds nuw %struct.object, ptr %148, i32 0, i32 22, !dbg !2792
  %150 = getelementptr inbounds nuw %struct.laser_info_s, ptr %149, i32 0, i32 0, !dbg !2793
  %151 = load i16, ptr %150, align 4, !dbg !2793
  %152 = sext i16 %151 to i32, !dbg !2790
  %153 = icmp eq i32 %152, 4, !dbg !2794
  br i1 %153, label %154, label %155, !dbg !2794

154:                                              ; preds = %147
  br label %202, !dbg !2795

155:                                              ; preds = %147
  br label %156, !dbg !2796

156:                                              ; preds = %155, %138
  br label %157, !dbg !2797

157:                                              ; preds = %156, %124
  %158 = load ptr, ptr %18, align 8, !dbg !2798
  %159 = getelementptr inbounds nuw %struct.object, ptr %158, i32 0, i32 11, !dbg !2799
  %160 = load ptr, ptr %5, align 8, !dbg !2800
  %161 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %17, ptr noundef %159, ptr noundef %160), !dbg !2801
  %162 = call noundef i32 @_Z16vm_vec_mag_quickP10vms_vector(ptr noundef %17), !dbg !2802
  store i32 %162, ptr %16, align 4, !dbg !2803
  %163 = load i32, ptr %16, align 4, !dbg !2804
  %164 = load i32, ptr %12, align 4, !dbg !2806
  %165 = icmp slt i32 %163, %164, !dbg !2807
  br i1 %165, label %166, label %201, !dbg !2807

166:                                              ; preds = %157
  %167 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %17), !dbg !2808
  %168 = load ptr, ptr %6, align 8, !dbg !2810
  %169 = getelementptr inbounds nuw %struct.object, ptr %168, i32 0, i32 12, !dbg !2810
  %170 = getelementptr inbounds nuw %struct.vms_matrix, ptr %169, i32 0, i32 2, !dbg !2810
  %171 = call noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef %17, ptr noundef %170), !dbg !2810
  store i32 %171, ptr %15, align 4, !dbg !2811
  %172 = load i32, ptr %14, align 4, !dbg !2812
  %173 = icmp ne i32 %172, 0, !dbg !2812
  br i1 %173, label %174, label %180, !dbg !2812

174:                                              ; preds = %166
  %175 = load i32, ptr %15, align 4, !dbg !2814
  %176 = shl i32 %175, 3, !dbg !2815
  %177 = load i32, ptr %15, align 4, !dbg !2816
  %178 = add nsw i32 %176, %177, !dbg !2817
  %179 = ashr i32 %178, 3, !dbg !2818
  store i32 %179, ptr %15, align 4, !dbg !2819
  br label %180, !dbg !2820

180:                                              ; preds = %174, %166
  %181 = load i32, ptr %15, align 4, !dbg !2821
  %182 = load i32, ptr %13, align 4, !dbg !2823
  %183 = icmp sgt i32 %181, %182, !dbg !2824
  br i1 %183, label %184, label %200, !dbg !2824

184:                                              ; preds = %180
  %185 = load i32, ptr %15, align 4, !dbg !2825
  %186 = load i32, ptr %10, align 4, !dbg !2828
  %187 = icmp sgt i32 %185, %186, !dbg !2829
  br i1 %187, label %188, label %199, !dbg !2829

188:                                              ; preds = %184
  %189 = load ptr, ptr %6, align 8, !dbg !2830
  %190 = load i32, ptr %9, align 4, !dbg !2833
  %191 = sext i32 %190 to i64, !dbg !2834
  %192 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %191, !dbg !2834
  %193 = call noundef i32 @_Z27object_to_object_visibilityP6objectS0_i(ptr noundef %189, ptr noundef %192, i32 noundef 2), !dbg !2835
  %194 = icmp ne i32 %193, 0, !dbg !2835
  br i1 %194, label %195, label %198, !dbg !2835

195:                                              ; preds = %188
  %196 = load i32, ptr %15, align 4, !dbg !2836
  store i32 %196, ptr %10, align 4, !dbg !2838
  %197 = load i32, ptr %9, align 4, !dbg !2839
  store i32 %197, ptr %11, align 4, !dbg !2840
  br label %198, !dbg !2841

198:                                              ; preds = %195, %188
  br label %199, !dbg !2842

199:                                              ; preds = %198, %184
  br label %200, !dbg !2843

200:                                              ; preds = %199, %180
  br label %201, !dbg !2844

201:                                              ; preds = %200, %157
  br label %202, !dbg !2845

202:                                              ; preds = %201, %154, %137, %122, %105, %95, %93
  %203 = load i32, ptr %9, align 4, !dbg !2846
  %204 = add nsw i32 %203, 1, !dbg !2846
  store i32 %204, ptr %9, align 4, !dbg !2846
  br label %43, !dbg !2847, !llvm.loop !2848

205:                                              ; preds = %43
  %206 = load i32, ptr %11, align 4, !dbg !2850
  ret i32 %206, !dbg !2851
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z16track_track_goaliP6objectPi(i32 noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !2852 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
    #dbg_declare(ptr %5, !2853, !DIExpression(), !2854)
  store ptr %1, ptr %6, align 8
    #dbg_declare(ptr %6, !2855, !DIExpression(), !2856)
  store ptr %2, ptr %7, align 8
    #dbg_declare(ptr %7, !2857, !DIExpression(), !2858)
  %12 = load i32, ptr %5, align 4, !dbg !2859
  %13 = load ptr, ptr %6, align 8, !dbg !2861
  %14 = load ptr, ptr %7, align 8, !dbg !2862
  %15 = call noundef i32 @_Z19object_is_trackableiP6objectPi(i32 noundef %12, ptr noundef %13, ptr noundef %14), !dbg !2863
  %16 = icmp ne i32 %15, 0, !dbg !2863
  br i1 %16, label %17, label %29, !dbg !2864

17:                                               ; preds = %3
  %18 = load ptr, ptr %6, align 8, !dbg !2865
  %19 = ptrtoint ptr %18 to i64, !dbg !2866
  %20 = sub i64 %19, ptrtoint (ptr @Objects to i64), !dbg !2866
  %21 = sdiv exact i64 %20, 268, !dbg !2866
  %22 = load i32, ptr @FrameCount, align 4, !dbg !2867
  %23 = sext i32 %22 to i64, !dbg !2867
  %24 = xor i64 %21, %23, !dbg !2868
  %25 = srem i64 %24, 8, !dbg !2869
  %26 = icmp ne i64 %25, 0, !dbg !2870
  br i1 %26, label %27, label %29, !dbg !2864

27:                                               ; preds = %17
  %28 = load i32, ptr %5, align 4, !dbg !2871
  store i32 %28, ptr %4, align 4, !dbg !2873
  br label %149, !dbg !2873

29:                                               ; preds = %17, %3
  %30 = load ptr, ptr %6, align 8, !dbg !2874
  %31 = ptrtoint ptr %30 to i64, !dbg !2876
  %32 = sub i64 %31, ptrtoint (ptr @Objects to i64), !dbg !2876
  %33 = sdiv exact i64 %32, 268, !dbg !2876
  %34 = load i32, ptr @FrameCount, align 4, !dbg !2877
  %35 = sext i32 %34 to i64, !dbg !2877
  %36 = xor i64 %33, %35, !dbg !2878
  %37 = srem i64 %36, 4, !dbg !2879
  %38 = icmp eq i64 %37, 0, !dbg !2880
  br i1 %38, label %39, label %147, !dbg !2880

39:                                               ; preds = %29
    #dbg_declare(ptr %8, !2881, !DIExpression(), !2883)
  store i32 -2, ptr %8, align 4, !dbg !2883
  %40 = load ptr, ptr %6, align 8, !dbg !2884
  %41 = getelementptr inbounds nuw %struct.object, ptr %40, i32 0, i32 22, !dbg !2886
  %42 = getelementptr inbounds nuw %struct.laser_info_s, ptr %41, i32 0, i32 1, !dbg !2887
  %43 = load i16, ptr %42, align 2, !dbg !2887
  %44 = sext i16 %43 to i64, !dbg !2888
  %45 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %44, !dbg !2888
  %46 = getelementptr inbounds nuw %struct.object, ptr %45, i32 0, i32 1, !dbg !2889
  %47 = load i8, ptr %46, align 4, !dbg !2889
  %48 = zext i8 %47 to i32, !dbg !2888
  %49 = icmp eq i32 %48, 4, !dbg !2890
  br i1 %49, label %50, label %112, !dbg !2890

50:                                               ; preds = %39
    #dbg_declare(ptr %9, !2891, !DIExpression(), !2893)
  %51 = load i32, ptr %5, align 4, !dbg !2894
  %52 = icmp eq i32 %51, -1, !dbg !2896
  br i1 %52, label %53, label %88, !dbg !2896

53:                                               ; preds = %50
  %54 = load i32, ptr @Game_mode, align 4, !dbg !2897
  %55 = and i32 %54, 38, !dbg !2900
  %56 = icmp ne i32 %55, 0, !dbg !2897
  br i1 %56, label %57, label %82, !dbg !2897

57:                                               ; preds = %53
  %58 = load i32, ptr @Game_mode, align 4, !dbg !2901
  %59 = and i32 %58, 16, !dbg !2904
  %60 = icmp ne i32 %59, 0, !dbg !2901
  br i1 %60, label %61, label %66, !dbg !2901

61:                                               ; preds = %57
  %62 = load ptr, ptr %6, align 8, !dbg !2905
  %63 = getelementptr inbounds nuw %struct.object, ptr %62, i32 0, i32 11, !dbg !2906
  %64 = load ptr, ptr %6, align 8, !dbg !2907
  %65 = call noundef i32 @_Z27find_homing_object_completeP10vms_vectorP6objectii(ptr noundef %63, ptr noundef %64, i32 noundef 2, i32 noundef -1), !dbg !2908
  store i32 %65, ptr %8, align 4, !dbg !2909
  br label %81, !dbg !2910

66:                                               ; preds = %57
  %67 = load i32, ptr @Game_mode, align 4, !dbg !2911
  %68 = and i32 %67, 8, !dbg !2913
  %69 = icmp ne i32 %68, 0, !dbg !2911
  br i1 %69, label %70, label %75, !dbg !2911

70:                                               ; preds = %66
  %71 = load ptr, ptr %6, align 8, !dbg !2914
  %72 = getelementptr inbounds nuw %struct.object, ptr %71, i32 0, i32 11, !dbg !2915
  %73 = load ptr, ptr %6, align 8, !dbg !2916
  %74 = call noundef i32 @_Z27find_homing_object_completeP10vms_vectorP6objectii(ptr noundef %72, ptr noundef %73, i32 noundef 4, i32 noundef 2), !dbg !2917
  store i32 %74, ptr %8, align 4, !dbg !2918
  br label %80, !dbg !2919

75:                                               ; preds = %66
  %76 = load ptr, ptr %6, align 8, !dbg !2920
  %77 = getelementptr inbounds nuw %struct.object, ptr %76, i32 0, i32 11, !dbg !2921
  %78 = load ptr, ptr %6, align 8, !dbg !2922
  %79 = call noundef i32 @_Z27find_homing_object_completeP10vms_vectorP6objectii(ptr noundef %77, ptr noundef %78, i32 noundef 4, i32 noundef -1), !dbg !2923
  store i32 %79, ptr %8, align 4, !dbg !2924
  br label %80

80:                                               ; preds = %75, %70
  br label %81

81:                                               ; preds = %80, %61
  br label %87, !dbg !2925

82:                                               ; preds = %53
  %83 = load ptr, ptr %6, align 8, !dbg !2926
  %84 = getelementptr inbounds nuw %struct.object, ptr %83, i32 0, i32 11, !dbg !2927
  %85 = load ptr, ptr %6, align 8, !dbg !2928
  %86 = call noundef i32 @_Z27find_homing_object_completeP10vms_vectorP6objectii(ptr noundef %84, ptr noundef %85, i32 noundef 4, i32 noundef 2), !dbg !2929
  store i32 %86, ptr %8, align 4, !dbg !2930
  br label %87

87:                                               ; preds = %82, %81
  br label %111, !dbg !2931

88:                                               ; preds = %50
  %89 = load ptr, ptr %6, align 8, !dbg !2932
  %90 = getelementptr inbounds nuw %struct.object, ptr %89, i32 0, i32 22, !dbg !2934
  %91 = getelementptr inbounds nuw %struct.laser_info_s, ptr %90, i32 0, i32 5, !dbg !2935
  %92 = load i16, ptr %91, align 2, !dbg !2935
  %93 = sext i16 %92 to i64, !dbg !2936
  %94 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %93, !dbg !2936
  %95 = getelementptr inbounds nuw %struct.object, ptr %94, i32 0, i32 1, !dbg !2937
  %96 = load i8, ptr %95, align 4, !dbg !2937
  %97 = zext i8 %96 to i32, !dbg !2936
  store i32 %97, ptr %9, align 4, !dbg !2938
  %98 = load i32, ptr %9, align 4, !dbg !2939
  %99 = icmp eq i32 %98, 4, !dbg !2941
  br i1 %99, label %103, label %100, !dbg !2942

100:                                              ; preds = %88
  %101 = load i32, ptr %9, align 4, !dbg !2943
  %102 = icmp eq i32 %101, 2, !dbg !2944
  br i1 %102, label %103, label %109, !dbg !2942

103:                                              ; preds = %100, %88
  %104 = load ptr, ptr %6, align 8, !dbg !2945
  %105 = getelementptr inbounds nuw %struct.object, ptr %104, i32 0, i32 11, !dbg !2946
  %106 = load ptr, ptr %6, align 8, !dbg !2947
  %107 = load i32, ptr %9, align 4, !dbg !2948
  %108 = call noundef i32 @_Z27find_homing_object_completeP10vms_vectorP6objectii(ptr noundef %105, ptr noundef %106, i32 noundef %107, i32 noundef -1), !dbg !2949
  store i32 %108, ptr %8, align 4, !dbg !2950
  br label %110, !dbg !2951

109:                                              ; preds = %100
  store i32 -1, ptr %8, align 4, !dbg !2952
  br label %110

110:                                              ; preds = %109, %103
  br label %111

111:                                              ; preds = %110, %87
  br label %142, !dbg !2953

112:                                              ; preds = %39
    #dbg_declare(ptr %10, !2954, !DIExpression(), !2956)
    #dbg_declare(ptr %11, !2957, !DIExpression(), !2958)
  store i32 -1, ptr %11, align 4, !dbg !2958
  %113 = load i32, ptr @Robots_kill_robots_cheat, align 4, !dbg !2959
  %114 = icmp ne i32 %113, 0, !dbg !2959
  br i1 %114, label %115, label %116, !dbg !2959

115:                                              ; preds = %112
  store i32 2, ptr %11, align 4, !dbg !2961
  br label %116, !dbg !2962

116:                                              ; preds = %115, %112
  %117 = load i32, ptr %5, align 4, !dbg !2963
  %118 = icmp eq i32 %117, -1, !dbg !2965
  br i1 %118, label %119, label %125, !dbg !2965

119:                                              ; preds = %116
  %120 = load ptr, ptr %6, align 8, !dbg !2966
  %121 = getelementptr inbounds nuw %struct.object, ptr %120, i32 0, i32 11, !dbg !2967
  %122 = load ptr, ptr %6, align 8, !dbg !2968
  %123 = load i32, ptr %11, align 4, !dbg !2969
  %124 = call noundef i32 @_Z27find_homing_object_completeP10vms_vectorP6objectii(ptr noundef %121, ptr noundef %122, i32 noundef 4, i32 noundef %123), !dbg !2970
  store i32 %124, ptr %8, align 4, !dbg !2971
  br label %141, !dbg !2972

125:                                              ; preds = %116
  %126 = load ptr, ptr %6, align 8, !dbg !2973
  %127 = getelementptr inbounds nuw %struct.object, ptr %126, i32 0, i32 22, !dbg !2975
  %128 = getelementptr inbounds nuw %struct.laser_info_s, ptr %127, i32 0, i32 5, !dbg !2976
  %129 = load i16, ptr %128, align 2, !dbg !2976
  %130 = sext i16 %129 to i64, !dbg !2977
  %131 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %130, !dbg !2977
  %132 = getelementptr inbounds nuw %struct.object, ptr %131, i32 0, i32 1, !dbg !2978
  %133 = load i8, ptr %132, align 4, !dbg !2978
  %134 = zext i8 %133 to i32, !dbg !2977
  store i32 %134, ptr %10, align 4, !dbg !2979
  %135 = load ptr, ptr %6, align 8, !dbg !2980
  %136 = getelementptr inbounds nuw %struct.object, ptr %135, i32 0, i32 11, !dbg !2981
  %137 = load ptr, ptr %6, align 8, !dbg !2982
  %138 = load i32, ptr %10, align 4, !dbg !2983
  %139 = load i32, ptr %11, align 4, !dbg !2984
  %140 = call noundef i32 @_Z27find_homing_object_completeP10vms_vectorP6objectii(ptr noundef %136, ptr noundef %137, i32 noundef %138, i32 noundef %139), !dbg !2985
  store i32 %140, ptr %8, align 4, !dbg !2986
  br label %141

141:                                              ; preds = %125, %119
  br label %142

142:                                              ; preds = %141, %111
  %143 = load i32, ptr %8, align 4, !dbg !2987
  %144 = icmp ne i32 %143, -2, !dbg !2987
  %145 = zext i1 %144 to i32, !dbg !2987
  call void @_Z7_AssertiPKcS0_i(i32 noundef %145, ptr noundef @.str.15, ptr noundef @.str.3, i32 noundef 1551), !dbg !2987
  %146 = load i32, ptr %8, align 4, !dbg !2988
  store i32 %146, ptr %4, align 4, !dbg !2989
  br label %149, !dbg !2989

147:                                              ; preds = %29
  br label %148

148:                                              ; preds = %147
  store i32 -1, ptr %4, align 4, !dbg !2990
  br label %149, !dbg !2990

149:                                              ; preds = %148, %142, %27
  %150 = load i32, ptr %4, align 4, !dbg !2991
  ret i32 %150, !dbg !2991
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z30Laser_player_fire_spread_delayP6objectiiiiiii(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5, i32 noundef %6, i32 noundef %7) #0 !dbg !2992 {
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca %struct.vms_vector, align 4
  %20 = alloca %struct.vms_vector, align 4
  %21 = alloca %struct.fvi_query, align 8
  %22 = alloca %struct.fvi_info, align 4
  %23 = alloca %struct.vms_vector, align 4
  %24 = alloca ptr, align 8
  %25 = alloca %struct.vms_matrix, align 4
  %26 = alloca i32, align 4
  store ptr %0, ptr %9, align 8
    #dbg_declare(ptr %9, !2995, !DIExpression(), !2996)
  store i32 %1, ptr %10, align 4
    #dbg_declare(ptr %10, !2997, !DIExpression(), !2998)
  store i32 %2, ptr %11, align 4
    #dbg_declare(ptr %11, !2999, !DIExpression(), !3000)
  store i32 %3, ptr %12, align 4
    #dbg_declare(ptr %12, !3001, !DIExpression(), !3002)
  store i32 %4, ptr %13, align 4
    #dbg_declare(ptr %13, !3003, !DIExpression(), !3004)
  store i32 %5, ptr %14, align 4
    #dbg_declare(ptr %14, !3005, !DIExpression(), !3006)
  store i32 %6, ptr %15, align 4
    #dbg_declare(ptr %15, !3007, !DIExpression(), !3008)
  store i32 %7, ptr %16, align 4
    #dbg_declare(ptr %16, !3009, !DIExpression(), !3010)
    #dbg_declare(ptr %17, !3011, !DIExpression(), !3012)
    #dbg_declare(ptr %18, !3013, !DIExpression(), !3014)
    #dbg_declare(ptr %19, !3015, !DIExpression(), !3016)
    #dbg_declare(ptr %20, !3017, !DIExpression(), !3018)
    #dbg_declare(ptr %21, !3019, !DIExpression(), !3020)
    #dbg_declare(ptr %22, !3021, !DIExpression(), !3022)
    #dbg_declare(ptr %23, !3023, !DIExpression(), !3024)
    #dbg_declare(ptr %24, !3025, !DIExpression(), !3026)
    #dbg_declare(ptr %25, !3027, !DIExpression(), !3028)
    #dbg_declare(ptr %26, !3029, !DIExpression(), !3030)
  %27 = load ptr, ptr %9, align 8, !dbg !3031
  call void @_Z22create_awareness_eventP6objecti(ptr noundef %27, i32 noundef 2), !dbg !3032
  %28 = load ptr, ptr @Player_ship, align 8, !dbg !3033
  %29 = getelementptr inbounds nuw %struct.player_ship, ptr %28, i32 0, i32 9, !dbg !3034
  %30 = load i32, ptr %11, align 4, !dbg !3035
  %31 = sext i32 %30 to i64, !dbg !3033
  %32 = getelementptr inbounds [8 x %struct.vms_vector], ptr %29, i64 0, i64 %31, !dbg !3033
  store ptr %32, ptr %24, align 8, !dbg !3036
  %33 = load ptr, ptr %9, align 8, !dbg !3037
  %34 = getelementptr inbounds nuw %struct.object, ptr %33, i32 0, i32 12, !dbg !3038
  %35 = call noundef ptr @_Z24vm_copy_transpose_matrixP10vms_matrixS0_(ptr noundef %25, ptr noundef %34), !dbg !3039
  %36 = load ptr, ptr %24, align 8, !dbg !3040
  %37 = call noundef ptr @_Z13vm_vec_rotateP10vms_vectorS0_P10vms_matrix(ptr noundef %23, ptr noundef %36, ptr noundef %25), !dbg !3041
  %38 = load ptr, ptr %9, align 8, !dbg !3042
  %39 = getelementptr inbounds nuw %struct.object, ptr %38, i32 0, i32 11, !dbg !3043
  %40 = call noundef ptr @_Z10vm_vec_addP10vms_vectorS0_S0_(ptr noundef %19, ptr noundef %39, ptr noundef %23), !dbg !3044
  %41 = load i32, ptr %14, align 4, !dbg !3045
  %42 = icmp ne i32 %41, 0, !dbg !3045
  br i1 %42, label %43, label %59, !dbg !3045

43:                                               ; preds = %8
  %44 = load ptr, ptr %9, align 8, !dbg !3047
  %45 = getelementptr inbounds nuw %struct.object, ptr %44, i32 0, i32 12, !dbg !3048
  %46 = getelementptr inbounds nuw %struct.vms_matrix, ptr %45, i32 0, i32 2, !dbg !3049
  %47 = load i32, ptr %14, align 4, !dbg !3050
  %48 = load i32, ptr %10, align 4, !dbg !3051
  %49 = sext i32 %48 to i64, !dbg !3052
  %50 = getelementptr inbounds [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %49, !dbg !3052
  %51 = getelementptr inbounds nuw %struct.weapon_info, ptr %50, i32 0, i32 30, !dbg !3053
  %52 = load i32, ptr @Difficulty_level, align 4, !dbg !3054
  %53 = sext i32 %52 to i64, !dbg !3052
  %54 = getelementptr inbounds [5 x i32], ptr %51, i64 0, i64 %53, !dbg !3052
  %55 = load i32, ptr %54, align 4, !dbg !3052
  %56 = call noundef i32 @_Z6fixmulii(i32 noundef %47, i32 noundef %55), !dbg !3055
  %57 = sub nsw i32 0, %56, !dbg !3056
  %58 = call noundef ptr @_Z17vm_vec_scale_add2P10vms_vectorS0_i(ptr noundef %19, ptr noundef %46, i32 noundef %57), !dbg !3057
  br label %59, !dbg !3057

59:                                               ; preds = %43, %8
  %60 = load ptr, ptr %9, align 8, !dbg !3058
  %61 = getelementptr inbounds nuw %struct.object, ptr %60, i32 0, i32 11, !dbg !3059
  %62 = getelementptr inbounds nuw %struct.fvi_query, ptr %21, i32 0, i32 0, !dbg !3060
  store ptr %61, ptr %62, align 8, !dbg !3061
  %63 = load ptr, ptr %9, align 8, !dbg !3062
  %64 = getelementptr inbounds nuw %struct.object, ptr %63, i32 0, i32 9, !dbg !3063
  %65 = load i16, ptr %64, align 2, !dbg !3063
  %66 = sext i16 %65 to i32, !dbg !3062
  %67 = getelementptr inbounds nuw %struct.fvi_query, ptr %21, i32 0, i32 2, !dbg !3064
  store i32 %66, ptr %67, align 8, !dbg !3065
  %68 = getelementptr inbounds nuw %struct.fvi_query, ptr %21, i32 0, i32 1, !dbg !3066
  store ptr %19, ptr %68, align 8, !dbg !3067
  %69 = getelementptr inbounds nuw %struct.fvi_query, ptr %21, i32 0, i32 3, !dbg !3068
  store i32 16, ptr %69, align 4, !dbg !3069
  %70 = load ptr, ptr %9, align 8, !dbg !3070
  %71 = ptrtoint ptr %70 to i64, !dbg !3071
  %72 = sub i64 %71, ptrtoint (ptr @Objects to i64), !dbg !3071
  %73 = sdiv exact i64 %72, 268, !dbg !3071
  %74 = trunc i64 %73 to i16, !dbg !3070
  %75 = getelementptr inbounds nuw %struct.fvi_query, ptr %21, i32 0, i32 4, !dbg !3072
  store i16 %74, ptr %75, align 8, !dbg !3073
  %76 = getelementptr inbounds nuw %struct.fvi_query, ptr %21, i32 0, i32 5, !dbg !3074
  store ptr null, ptr %76, align 8, !dbg !3075
  %77 = getelementptr inbounds nuw %struct.fvi_query, ptr %21, i32 0, i32 6, !dbg !3076
  store i32 17, ptr %77, align 8, !dbg !3077
  %78 = call noundef i32 @_Z24find_vector_intersectionP9fvi_queryP8fvi_info(ptr noundef %21, ptr noundef %22), !dbg !3078
  store i32 %78, ptr %18, align 4, !dbg !3079
  %79 = getelementptr inbounds nuw %struct.fvi_info, ptr %22, i32 0, i32 2, !dbg !3080
  %80 = load i32, ptr %79, align 4, !dbg !3080
  store i32 %80, ptr %17, align 4, !dbg !3081
  %81 = load i32, ptr %17, align 4, !dbg !3082
  %82 = icmp eq i32 %81, -1, !dbg !3084
  br i1 %82, label %83, label %84, !dbg !3084

83:                                               ; preds = %59
  br label %267, !dbg !3085

84:                                               ; preds = %59
  %85 = load ptr, ptr %9, align 8, !dbg !3086
  %86 = getelementptr inbounds nuw %struct.object, ptr %85, i32 0, i32 11, !dbg !3088
  %87 = call noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef %19, ptr noundef %86), !dbg !3089
  %88 = icmp sgt i32 %87, 327680, !dbg !3090
  br i1 %88, label %89, label %90, !dbg !3090

89:                                               ; preds = %84
  br label %267, !dbg !3091

90:                                               ; preds = %84
  %91 = load i32, ptr %18, align 4, !dbg !3092
  %92 = icmp eq i32 %91, 1, !dbg !3094
  br i1 %92, label %93, label %99, !dbg !3094

93:                                               ; preds = %90
  %94 = load i32, ptr %14, align 4, !dbg !3095
  %95 = icmp ne i32 %94, 0, !dbg !3095
  br i1 %95, label %96, label %97, !dbg !3095

96:                                               ; preds = %93
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.16), !dbg !3098
  br label %98, !dbg !3098

97:                                               ; preds = %93
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.17), !dbg !3099
  br label %98

98:                                               ; preds = %97, %96
  br label %267, !dbg !3100

99:                                               ; preds = %90
  %100 = load i32, ptr %18, align 4, !dbg !3101
  %101 = icmp eq i32 %100, 2, !dbg !3103
  br i1 %101, label %102, label %103, !dbg !3103

102:                                              ; preds = %99
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.18), !dbg !3104
  br label %103, !dbg !3106

103:                                              ; preds = %102, %99
  %104 = load ptr, ptr %9, align 8, !dbg !3107
  %105 = getelementptr inbounds nuw %struct.object, ptr %104, i32 0, i32 12, !dbg !3108
  %106 = getelementptr inbounds nuw %struct.vms_matrix, ptr %105, i32 0, i32 2, !dbg !3109
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %20, ptr align 4 %106, i64 12, i1 false), !dbg !3110
  %107 = load i32, ptr %12, align 4, !dbg !3111
  %108 = icmp ne i32 %107, 0, !dbg !3113
  br i1 %108, label %112, label %109, !dbg !3114

109:                                              ; preds = %103
  %110 = load i32, ptr %13, align 4, !dbg !3115
  %111 = icmp ne i32 %110, 0, !dbg !3116
  br i1 %111, label %112, label %123, !dbg !3114

112:                                              ; preds = %109, %103
  %113 = load ptr, ptr %9, align 8, !dbg !3117
  %114 = getelementptr inbounds nuw %struct.object, ptr %113, i32 0, i32 12, !dbg !3119
  %115 = getelementptr inbounds nuw %struct.vms_matrix, ptr %114, i32 0, i32 0, !dbg !3120
  %116 = load i32, ptr %12, align 4, !dbg !3121
  %117 = call noundef ptr @_Z17vm_vec_scale_add2P10vms_vectorS0_i(ptr noundef %20, ptr noundef %115, i32 noundef %116), !dbg !3122
  %118 = load ptr, ptr %9, align 8, !dbg !3123
  %119 = getelementptr inbounds nuw %struct.object, ptr %118, i32 0, i32 12, !dbg !3124
  %120 = getelementptr inbounds nuw %struct.vms_matrix, ptr %119, i32 0, i32 1, !dbg !3125
  %121 = load i32, ptr %13, align 4, !dbg !3126
  %122 = call noundef ptr @_Z17vm_vec_scale_add2P10vms_vectorS0_i(ptr noundef %20, ptr noundef %120, i32 noundef %121), !dbg !3127
  br label %123, !dbg !3128

123:                                              ; preds = %112, %109
  %124 = load i32, ptr %17, align 4, !dbg !3129
  %125 = load ptr, ptr %9, align 8, !dbg !3130
  %126 = ptrtoint ptr %125 to i64, !dbg !3131
  %127 = sub i64 %126, ptrtoint (ptr @Objects to i64), !dbg !3131
  %128 = sdiv exact i64 %127, 268, !dbg !3131
  %129 = trunc i64 %128 to i32, !dbg !3130
  %130 = load i32, ptr %10, align 4, !dbg !3132
  %131 = load i32, ptr %15, align 4, !dbg !3133
  %132 = call noundef i32 @_Z16Laser_create_newP10vms_vectorS0_iiii(ptr noundef %20, ptr noundef %19, i32 noundef %124, i32 noundef %129, i32 noundef %130, i32 noundef %131), !dbg !3134
  store i32 %132, ptr %26, align 4, !dbg !3135
  %133 = load i32, ptr %10, align 4, !dbg !3136
  %134 = icmp eq i32 %133, 35, !dbg !3138
  br i1 %134, label %135, label %136, !dbg !3138

135:                                              ; preds = %123
  br label %267, !dbg !3139

136:                                              ; preds = %123
  %137 = load i32, ptr %26, align 4, !dbg !3140
  %138 = icmp eq i32 %137, -1, !dbg !3142
  br i1 %138, label %139, label %140, !dbg !3142

139:                                              ; preds = %136
  br label %267, !dbg !3143

140:                                              ; preds = %136
  %141 = load i32, ptr %10, align 4, !dbg !3144
  %142 = icmp eq i32 %141, 37, !dbg !3146
  br i1 %142, label %143, label %162, !dbg !3147

143:                                              ; preds = %140
  %144 = load i8, ptr @Multi_is_guided, align 1, !dbg !3148
  %145 = icmp ne i8 %144, 0, !dbg !3148
  br i1 %145, label %146, label %162, !dbg !3147

146:                                              ; preds = %143
  %147 = load ptr, ptr %9, align 8, !dbg !3149
  %148 = getelementptr inbounds nuw %struct.object, ptr %147, i32 0, i32 2, !dbg !3149
  %149 = load i8, ptr %148, align 1, !dbg !3149
  %150 = zext i8 %149 to i64, !dbg !3149
  %151 = getelementptr inbounds nuw [12 x %struct.player], ptr @Players, i64 0, i64 %150, !dbg !3149
  %152 = getelementptr inbounds nuw %struct.player, ptr %151, i32 0, i32 0, !dbg !3149
  %153 = getelementptr inbounds [9 x i8], ptr %152, i64 0, i64 0, !dbg !3149
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.19, ptr noundef %153), !dbg !3149
  %154 = load i32, ptr %26, align 4, !dbg !3151
  %155 = sext i32 %154 to i64, !dbg !3152
  %156 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %155, !dbg !3152
  %157 = load ptr, ptr %9, align 8, !dbg !3153
  %158 = getelementptr inbounds nuw %struct.object, ptr %157, i32 0, i32 2, !dbg !3154
  %159 = load i8, ptr %158, align 1, !dbg !3154
  %160 = zext i8 %159 to i64, !dbg !3155
  %161 = getelementptr inbounds nuw [8 x ptr], ptr @Guided_missile, i64 0, i64 %160, !dbg !3155
  store ptr %156, ptr %161, align 8, !dbg !3156
  br label %162, !dbg !3157

162:                                              ; preds = %146, %143, %140
  store i8 0, ptr @Multi_is_guided, align 1, !dbg !3158
  %163 = load i32, ptr %10, align 4, !dbg !3159
  %164 = icmp eq i32 %163, 8, !dbg !3161
  br i1 %164, label %183, label %165, !dbg !3162

165:                                              ; preds = %162
  %166 = load i32, ptr %10, align 4, !dbg !3163
  %167 = icmp eq i32 %166, 15, !dbg !3164
  br i1 %167, label %183, label %168, !dbg !3165

168:                                              ; preds = %165
  %169 = load i32, ptr %10, align 4, !dbg !3166
  %170 = icmp eq i32 %169, 17, !dbg !3167
  br i1 %170, label %183, label %171, !dbg !3168

171:                                              ; preds = %168
  %172 = load i32, ptr %10, align 4, !dbg !3169
  %173 = icmp eq i32 %172, 18, !dbg !3170
  br i1 %173, label %183, label %174, !dbg !3171

174:                                              ; preds = %171
  %175 = load i32, ptr %10, align 4, !dbg !3172
  %176 = icmp eq i32 %175, 36, !dbg !3173
  br i1 %176, label %183, label %177, !dbg !3174

177:                                              ; preds = %174
  %178 = load i32, ptr %10, align 4, !dbg !3175
  %179 = icmp eq i32 %178, 39, !dbg !3176
  br i1 %179, label %183, label %180, !dbg !3177

180:                                              ; preds = %177
  %181 = load i32, ptr %10, align 4, !dbg !3178
  %182 = icmp eq i32 %181, 40, !dbg !3179
  br i1 %182, label %183, label %198, !dbg !3177

183:                                              ; preds = %180, %177, %174, %171, %168, %165, %162
  %184 = load ptr, ptr @Missile_viewer, align 8, !dbg !3180
  %185 = icmp eq ptr %184, null, !dbg !3182
  br i1 %185, label %186, label %197, !dbg !3183

186:                                              ; preds = %183
  %187 = load ptr, ptr %9, align 8, !dbg !3184
  %188 = getelementptr inbounds nuw %struct.object, ptr %187, i32 0, i32 2, !dbg !3185
  %189 = load i8, ptr %188, align 1, !dbg !3185
  %190 = zext i8 %189 to i32, !dbg !3184
  %191 = load i32, ptr @Player_num, align 4, !dbg !3186
  %192 = icmp eq i32 %190, %191, !dbg !3187
  br i1 %192, label %193, label %197, !dbg !3183

193:                                              ; preds = %186
  %194 = load i32, ptr %26, align 4, !dbg !3188
  %195 = sext i32 %194 to i64, !dbg !3189
  %196 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %195, !dbg !3189
  store ptr %196, ptr @Missile_viewer, align 8, !dbg !3190
  br label %197, !dbg !3191

197:                                              ; preds = %193, %186, %183
  br label %198, !dbg !3186

198:                                              ; preds = %197, %180
  %199 = load i32, ptr %15, align 4, !dbg !3192
  %200 = icmp ne i32 %199, 0, !dbg !3192
  br i1 %200, label %210, label %201, !dbg !3194

201:                                              ; preds = %198
  %202 = load i32, ptr %26, align 4, !dbg !3195
  %203 = sext i32 %202 to i64, !dbg !3196
  %204 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %203, !dbg !3196
  %205 = getelementptr inbounds nuw %struct.object, ptr %204, i32 0, i32 8, !dbg !3197
  %206 = load i8, ptr %205, align 1, !dbg !3198
  %207 = zext i8 %206 to i32, !dbg !3198
  %208 = or i32 %207, 8, !dbg !3198
  %209 = trunc i32 %208 to i8, !dbg !3198
  store i8 %209, ptr %205, align 1, !dbg !3198
  br label %210, !dbg !3196

210:                                              ; preds = %201, %198
  %211 = load i32, ptr %16, align 4, !dbg !3199
  %212 = icmp ne i32 %211, 0, !dbg !3199
  br i1 %212, label %213, label %222, !dbg !3199

213:                                              ; preds = %210
  %214 = load i32, ptr %26, align 4, !dbg !3201
  %215 = sext i32 %214 to i64, !dbg !3202
  %216 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %215, !dbg !3202
  %217 = getelementptr inbounds nuw %struct.object, ptr %216, i32 0, i32 8, !dbg !3203
  %218 = load i8, ptr %217, align 1, !dbg !3204
  %219 = zext i8 %218 to i32, !dbg !3204
  %220 = or i32 %219, 32, !dbg !3204
  %221 = trunc i32 %220 to i8, !dbg !3204
  store i8 %221, ptr %217, align 1, !dbg !3204
  br label %222, !dbg !3202

222:                                              ; preds = %213, %210
  %223 = load ptr, ptr %9, align 8, !dbg !3205
  %224 = load ptr, ptr @ConsoleObject, align 8, !dbg !3207
  %225 = icmp eq ptr %223, %224, !dbg !3208
  br i1 %225, label %226, label %244, !dbg !3209

226:                                              ; preds = %222
  %227 = load i32, ptr %26, align 4, !dbg !3210
  %228 = sext i32 %227 to i64, !dbg !3211
  %229 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %228, !dbg !3211
  %230 = getelementptr inbounds nuw %struct.object, ptr %229, i32 0, i32 2, !dbg !3212
  %231 = load i8, ptr %230, align 1, !dbg !3212
  %232 = zext i8 %231 to i32, !dbg !3211
  %233 = icmp ne i32 %232, 16, !dbg !3213
  br i1 %233, label %234, label %244, !dbg !3214

234:                                              ; preds = %226
  %235 = load i32, ptr %26, align 4, !dbg !3215
  %236 = sext i32 %235 to i64, !dbg !3216
  %237 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %236, !dbg !3216
  %238 = getelementptr inbounds nuw %struct.object, ptr %237, i32 0, i32 2, !dbg !3217
  %239 = load i8, ptr %238, align 1, !dbg !3217
  %240 = zext i8 %239 to i32, !dbg !3216
  %241 = icmp ne i32 %240, 38, !dbg !3218
  br i1 %241, label %242, label %244, !dbg !3209

242:                                              ; preds = %234
  %243 = load i32, ptr %26, align 4, !dbg !3219
  store i32 %243, ptr @Player_fired_laser_this_frame, align 4, !dbg !3220
  br label %244, !dbg !3221

244:                                              ; preds = %242, %234, %226, %222
  %245 = load i32, ptr %10, align 4, !dbg !3222
  %246 = sext i32 %245 to i64, !dbg !3224
  %247 = getelementptr inbounds [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %246, !dbg !3224
  %248 = getelementptr inbounds nuw %struct.weapon_info, ptr %247, i32 0, i32 16, !dbg !3225
  %249 = load i8, ptr %248, align 1, !dbg !3225
  %250 = icmp ne i8 %249, 0, !dbg !3224
  br i1 %250, label %251, label %267, !dbg !3224

251:                                              ; preds = %244
  %252 = load ptr, ptr %9, align 8, !dbg !3226
  %253 = load ptr, ptr @ConsoleObject, align 8, !dbg !3229
  %254 = icmp eq ptr %252, %253, !dbg !3230
  br i1 %254, label %255, label %266, !dbg !3230

255:                                              ; preds = %251
  %256 = load i32, ptr %26, align 4, !dbg !3231
  %257 = sext i32 %256 to i64, !dbg !3233
  %258 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %257, !dbg !3233
  %259 = call noundef i32 @_Z18find_homing_objectP10vms_vectorP6object(ptr noundef %19, ptr noundef %258), !dbg !3234
  %260 = trunc i32 %259 to i16, !dbg !3234
  %261 = load i32, ptr %26, align 4, !dbg !3235
  %262 = sext i32 %261 to i64, !dbg !3236
  %263 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %262, !dbg !3236
  %264 = getelementptr inbounds nuw %struct.object, ptr %263, i32 0, i32 22, !dbg !3237
  %265 = getelementptr inbounds nuw %struct.laser_info_s, ptr %264, i32 0, i32 5, !dbg !3238
  store i16 %260, ptr %265, align 2, !dbg !3239
  br label %266, !dbg !3240

266:                                              ; preds = %255, %251
  br label %267, !dbg !3241

267:                                              ; preds = %83, %89, %98, %135, %139, %266, %244
  ret void, !dbg !3242
}

declare void @_Z22create_awareness_eventP6objecti(ptr noundef, i32 noundef) #1

declare noundef ptr @_Z24vm_copy_transpose_matrixP10vms_matrixS0_(ptr noundef, ptr noundef) #1

declare noundef ptr @_Z13vm_vec_rotateP10vms_vectorS0_P10vms_matrix(ptr noundef, ptr noundef, ptr noundef) #1

declare noundef ptr @_Z10vm_vec_addP10vms_vectorS0_S0_(ptr noundef, ptr noundef, ptr noundef) #1

declare noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef, ptr noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z24Laser_player_fire_spreadP6objectiiiiii(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5, i32 noundef %6) #0 !dbg !3243 {
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store ptr %0, ptr %8, align 8
    #dbg_declare(ptr %8, !3246, !DIExpression(), !3247)
  store i32 %1, ptr %9, align 4
    #dbg_declare(ptr %9, !3248, !DIExpression(), !3249)
  store i32 %2, ptr %10, align 4
    #dbg_declare(ptr %10, !3250, !DIExpression(), !3251)
  store i32 %3, ptr %11, align 4
    #dbg_declare(ptr %11, !3252, !DIExpression(), !3253)
  store i32 %4, ptr %12, align 4
    #dbg_declare(ptr %12, !3254, !DIExpression(), !3255)
  store i32 %5, ptr %13, align 4
    #dbg_declare(ptr %13, !3256, !DIExpression(), !3257)
  store i32 %6, ptr %14, align 4
    #dbg_declare(ptr %14, !3258, !DIExpression(), !3259)
  %15 = load ptr, ptr %8, align 8, !dbg !3260
  %16 = load i32, ptr %9, align 4, !dbg !3261
  %17 = load i32, ptr %10, align 4, !dbg !3262
  %18 = load i32, ptr %11, align 4, !dbg !3263
  %19 = load i32, ptr %12, align 4, !dbg !3264
  %20 = load i32, ptr %13, align 4, !dbg !3265
  %21 = load i32, ptr %14, align 4, !dbg !3266
  call void @_Z30Laser_player_fire_spread_delayP6objectiiiiiii(ptr noundef %15, i32 noundef %16, i32 noundef %17, i32 noundef %18, i32 noundef %19, i32 noundef 0, i32 noundef %20, i32 noundef %21), !dbg !3267
  ret void, !dbg !3268
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z17Laser_player_fireP6objectiiii(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4) #0 !dbg !3269 {
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
    #dbg_declare(ptr %6, !3272, !DIExpression(), !3273)
  store i32 %1, ptr %7, align 4
    #dbg_declare(ptr %7, !3274, !DIExpression(), !3275)
  store i32 %2, ptr %8, align 4
    #dbg_declare(ptr %8, !3276, !DIExpression(), !3277)
  store i32 %3, ptr %9, align 4
    #dbg_declare(ptr %9, !3278, !DIExpression(), !3279)
  store i32 %4, ptr %10, align 4
    #dbg_declare(ptr %10, !3280, !DIExpression(), !3281)
  %11 = load ptr, ptr %6, align 8, !dbg !3282
  %12 = load i32, ptr %7, align 4, !dbg !3283
  %13 = load i32, ptr %8, align 4, !dbg !3284
  %14 = load i32, ptr %9, align 4, !dbg !3285
  %15 = load i32, ptr %10, align 4, !dbg !3286
  call void @_Z24Laser_player_fire_spreadP6objectiiiiii(ptr noundef %11, i32 noundef %12, i32 noundef %13, i32 noundef 0, i32 noundef 0, i32 noundef %14, i32 noundef %15), !dbg !3287
  ret void, !dbg !3288
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z12Flare_createP6object(ptr noundef %0) #0 !dbg !3289 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !3290, !DIExpression(), !3291)
    #dbg_declare(ptr %3, !3292, !DIExpression(), !3293)
  %4 = load i32, ptr getelementptr inbounds nuw (%struct.weapon_info, ptr getelementptr inbounds ([0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 9), i32 0, i32 22), align 4, !dbg !3294
  store i32 %4, ptr %3, align 4, !dbg !3295
  %5 = load i32, ptr @Difficulty_level, align 4, !dbg !3296
  %6 = icmp slt i32 %5, 2, !dbg !3298
  br i1 %6, label %7, label %14, !dbg !3298

7:                                                ; preds = %1
  %8 = load i32, ptr %3, align 4, !dbg !3299
  %9 = load i32, ptr @Difficulty_level, align 4, !dbg !3300
  %10 = add nsw i32 %9, 2, !dbg !3301
  %11 = call noundef i32 @_Z3i2fi(i32 noundef %10), !dbg !3302
  %12 = sdiv i32 %11, 4, !dbg !3303
  %13 = call noundef i32 @_Z6fixmulii(i32 noundef %8, i32 noundef %12), !dbg !3304
  store i32 %13, ptr %3, align 4, !dbg !3305
  br label %14, !dbg !3306

14:                                               ; preds = %7, %1
  %15 = load i32, ptr %3, align 4, !dbg !3307
  %16 = load i32, ptr @Player_num, align 4, !dbg !3308
  %17 = sext i32 %16 to i64, !dbg !3309
  %18 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %17, !dbg !3309
  %19 = getelementptr inbounds nuw %struct.player, ptr %18, i32 0, i32 8, !dbg !3310
  %20 = load i32, ptr %19, align 4, !dbg !3311
  %21 = sub nsw i32 %20, %15, !dbg !3311
  store i32 %21, ptr %19, align 4, !dbg !3311
  %22 = load i32, ptr @Player_num, align 4, !dbg !3312
  %23 = sext i32 %22 to i64, !dbg !3314
  %24 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %23, !dbg !3314
  %25 = getelementptr inbounds nuw %struct.player, ptr %24, i32 0, i32 8, !dbg !3315
  %26 = load i32, ptr %25, align 4, !dbg !3315
  %27 = icmp sle i32 %26, 0, !dbg !3316
  br i1 %27, label %28, label %33, !dbg !3316

28:                                               ; preds = %14
  %29 = load i32, ptr @Player_num, align 4, !dbg !3317
  %30 = sext i32 %29 to i64, !dbg !3319
  %31 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %30, !dbg !3319
  %32 = getelementptr inbounds nuw %struct.player, ptr %31, i32 0, i32 8, !dbg !3320
  store i32 0, ptr %32, align 4, !dbg !3321
  br label %33, !dbg !3322

33:                                               ; preds = %28, %14
  %34 = load ptr, ptr %2, align 8, !dbg !3323
  call void @_Z17Laser_player_fireP6objectiiii(ptr noundef %34, i32 noundef 9, i32 noundef 6, i32 noundef 1, i32 noundef 0), !dbg !3324
  ret void, !dbg !3325
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z36homing_missile_turn_towards_velocityP6objectP10vms_vector(ptr noundef %0, ptr noundef %1) #0 !dbg !3326 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %struct.vms_vector, align 4
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !3329, !DIExpression(), !3330)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !3331, !DIExpression(), !3332)
    #dbg_declare(ptr %5, !3333, !DIExpression(), !3334)
  %6 = load ptr, ptr %4, align 8, !dbg !3335
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %5, ptr align 4 %6, i64 12, i1 false), !dbg !3336
  %7 = load i32, ptr @FrameTime, align 4, !dbg !3337
  %8 = mul nsw i32 %7, 16, !dbg !3338
  %9 = call noundef ptr @_Z12vm_vec_scaleP10vms_vectori(ptr noundef %5, i32 noundef %8), !dbg !3339
  %10 = load ptr, ptr %3, align 8, !dbg !3340
  %11 = getelementptr inbounds nuw %struct.object, ptr %10, i32 0, i32 12, !dbg !3341
  %12 = getelementptr inbounds nuw %struct.vms_matrix, ptr %11, i32 0, i32 2, !dbg !3342
  %13 = call noundef ptr @_Z11vm_vec_add2P10vms_vectorS0_(ptr noundef %5, ptr noundef %12), !dbg !3343
  %14 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %5), !dbg !3344
  %15 = load ptr, ptr %3, align 8, !dbg !3345
  %16 = getelementptr inbounds nuw %struct.object, ptr %15, i32 0, i32 12, !dbg !3346
  %17 = call noundef ptr @_Z18vm_vector_2_matrixP10vms_matrixP10vms_vectorS2_S2_(ptr noundef %16, ptr noundef %5, ptr noundef null, ptr noundef null), !dbg !3347
  ret void, !dbg !3348
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z24Laser_do_weapon_sequenceP6object(ptr noundef %0) #0 !dbg !3349 {
  %2 = alloca ptr, align 8
  %3 = alloca %struct.vms_vector, align 4
  %4 = alloca %struct.vms_vector, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !3350, !DIExpression(), !3351)
  %15 = load ptr, ptr %2, align 8, !dbg !3352
  %16 = getelementptr inbounds nuw %struct.object, ptr %15, i32 0, i32 5, !dbg !3352
  %17 = load i8, ptr %16, align 2, !dbg !3352
  %18 = zext i8 %17 to i32, !dbg !3352
  %19 = icmp eq i32 %18, 9, !dbg !3352
  %20 = zext i1 %19 to i32, !dbg !3352
  call void @_Z7_AssertiPKcS0_i(i32 noundef %20, ptr noundef @.str.20, ptr noundef @.str.3, i32 noundef 1782), !dbg !3352
  %21 = load ptr, ptr %2, align 8, !dbg !3353
  %22 = getelementptr inbounds nuw %struct.object, ptr %21, i32 0, i32 20, !dbg !3355
  %23 = load i32, ptr %22, align 4, !dbg !3355
  %24 = icmp eq i32 %23, 1073741822, !dbg !3356
  br i1 %24, label %25, label %38, !dbg !3356

25:                                               ; preds = %1
  %26 = load i32, ptr @Game_mode, align 4, !dbg !3357
  %27 = and i32 %26, 38, !dbg !3360
  %28 = icmp ne i32 %27, 0, !dbg !3357
  br i1 %28, label %29, label %32, !dbg !3357

29:                                               ; preds = %25
  %30 = load ptr, ptr %2, align 8, !dbg !3361
  %31 = getelementptr inbounds nuw %struct.object, ptr %30, i32 0, i32 20, !dbg !3362
  store i32 10922, ptr %31, align 4, !dbg !3363
  br label %35, !dbg !3361

32:                                               ; preds = %25
  %33 = load ptr, ptr %2, align 8, !dbg !3364
  %34 = getelementptr inbounds nuw %struct.object, ptr %33, i32 0, i32 20, !dbg !3365
  store i32 0, ptr %34, align 4, !dbg !3366
  br label %35

35:                                               ; preds = %32, %29
  %36 = load ptr, ptr %2, align 8, !dbg !3367
  %37 = getelementptr inbounds nuw %struct.object, ptr %36, i32 0, i32 7, !dbg !3368
  store i8 0, ptr %37, align 4, !dbg !3369
  br label %38, !dbg !3370

38:                                               ; preds = %35, %1
  %39 = load ptr, ptr %2, align 8, !dbg !3371
  %40 = getelementptr inbounds nuw %struct.object, ptr %39, i32 0, i32 20, !dbg !3373
  %41 = load i32, ptr %40, align 4, !dbg !3373
  %42 = icmp slt i32 %41, 0, !dbg !3374
  br i1 %42, label %43, label %64, !dbg !3374

43:                                               ; preds = %38
  %44 = load ptr, ptr %2, align 8, !dbg !3375
  %45 = getelementptr inbounds nuw %struct.object, ptr %44, i32 0, i32 8, !dbg !3377
  %46 = load i8, ptr %45, align 1, !dbg !3378
  %47 = zext i8 %46 to i32, !dbg !3378
  %48 = or i32 %47, 2, !dbg !3378
  %49 = trunc i32 %48 to i8, !dbg !3378
  store i8 %49, ptr %45, align 1, !dbg !3378
  %50 = load ptr, ptr %2, align 8, !dbg !3379
  %51 = getelementptr inbounds nuw %struct.object, ptr %50, i32 0, i32 2, !dbg !3381
  %52 = load i8, ptr %51, align 1, !dbg !3381
  %53 = zext i8 %52 to i64, !dbg !3382
  %54 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %53, !dbg !3382
  %55 = getelementptr inbounds nuw %struct.weapon_info, ptr %54, i32 0, i32 37, !dbg !3383
  %56 = load i32, ptr %55, align 4, !dbg !3383
  %57 = icmp ne i32 %56, 0, !dbg !3382
  br i1 %57, label %58, label %63, !dbg !3382

58:                                               ; preds = %43
  %59 = load ptr, ptr %2, align 8, !dbg !3384
  %60 = load ptr, ptr %2, align 8, !dbg !3385
  %61 = getelementptr inbounds nuw %struct.object, ptr %60, i32 0, i32 11, !dbg !3386
  %62 = call noundef ptr @_Z21explode_badass_weaponP6objectP10vms_vector(ptr noundef %59, ptr noundef %61), !dbg !3387
  br label %63, !dbg !3387

63:                                               ; preds = %58, %43
  br label %455, !dbg !3388

64:                                               ; preds = %38
  %65 = load i32, ptr @FrameCount, align 4, !dbg !3389
  %66 = load ptr, ptr %2, align 8, !dbg !3391
  %67 = getelementptr inbounds nuw %struct.object, ptr %66, i32 0, i32 0, !dbg !3392
  %68 = load i32, ptr %67, align 4, !dbg !3392
  %69 = xor i32 %65, %68, !dbg !3393
  %70 = and i32 %69, 3, !dbg !3394
  %71 = icmp ne i32 %70, 0, !dbg !3395
  br i1 %71, label %102, label %72, !dbg !3396

72:                                               ; preds = %64
  %73 = load ptr, ptr %2, align 8, !dbg !3397
  %74 = getelementptr inbounds nuw %struct.object, ptr %73, i32 0, i32 2, !dbg !3398
  %75 = load i8, ptr %74, align 1, !dbg !3398
  %76 = zext i8 %75 to i32, !dbg !3397
  %77 = icmp ne i32 %76, 9, !dbg !3399
  br i1 %77, label %78, label %102, !dbg !3400

78:                                               ; preds = %72
  %79 = load ptr, ptr %2, align 8, !dbg !3401
  %80 = getelementptr inbounds nuw %struct.object, ptr %79, i32 0, i32 2, !dbg !3402
  %81 = load i8, ptr %80, align 1, !dbg !3402
  %82 = zext i8 %81 to i64, !dbg !3403
  %83 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %82, !dbg !3403
  %84 = getelementptr inbounds nuw %struct.weapon_info, ptr %83, i32 0, i32 30, !dbg !3404
  %85 = load i32, ptr @Difficulty_level, align 4, !dbg !3405
  %86 = sext i32 %85 to i64, !dbg !3403
  %87 = getelementptr inbounds [5 x i32], ptr %84, i64 0, i64 %86, !dbg !3403
  %88 = load i32, ptr %87, align 4, !dbg !3403
  %89 = icmp sgt i32 %88, 0, !dbg !3406
  br i1 %89, label %90, label %102, !dbg !3407

90:                                               ; preds = %78
  %91 = load ptr, ptr %2, align 8, !dbg !3408
  %92 = getelementptr inbounds nuw %struct.object, ptr %91, i32 0, i32 21, !dbg !3409
  %93 = getelementptr inbounds nuw %struct.physics_info, ptr %92, i32 0, i32 0, !dbg !3410
  %94 = call noundef i32 @_Z16vm_vec_mag_quickP10vms_vector(ptr noundef %93), !dbg !3411
  %95 = icmp slt i32 %94, 131072, !dbg !3412
  br i1 %95, label %96, label %102, !dbg !3407

96:                                               ; preds = %90
  %97 = load ptr, ptr %2, align 8, !dbg !3413
  %98 = ptrtoint ptr %97 to i64, !dbg !3415
  %99 = sub i64 %98, ptrtoint (ptr @Objects to i64), !dbg !3415
  %100 = sdiv exact i64 %99, 268, !dbg !3415
  %101 = trunc i64 %100 to i32, !dbg !3413
  call void @_Z10obj_deletei(i32 noundef %101), !dbg !3416
  br label %455, !dbg !3417

102:                                              ; preds = %90, %78, %72, %64
  %103 = load ptr, ptr %2, align 8, !dbg !3418
  %104 = getelementptr inbounds nuw %struct.object, ptr %103, i32 0, i32 2, !dbg !3420
  %105 = load i8, ptr %104, align 1, !dbg !3420
  %106 = zext i8 %105 to i32, !dbg !3418
  %107 = icmp eq i32 %106, 14, !dbg !3421
  br i1 %107, label %108, label %127, !dbg !3421

108:                                              ; preds = %102
  %109 = load ptr, ptr %2, align 8, !dbg !3422
  %110 = getelementptr inbounds nuw %struct.object, ptr %109, i32 0, i32 21, !dbg !3424
  %111 = getelementptr inbounds nuw %struct.physics_info, ptr %110, i32 0, i32 0, !dbg !3425
  %112 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %111), !dbg !3426
  %113 = load ptr, ptr %2, align 8, !dbg !3427
  %114 = getelementptr inbounds nuw %struct.object, ptr %113, i32 0, i32 21, !dbg !3428
  %115 = getelementptr inbounds nuw %struct.physics_info, ptr %114, i32 0, i32 0, !dbg !3429
  %116 = load ptr, ptr %2, align 8, !dbg !3430
  %117 = getelementptr inbounds nuw %struct.object, ptr %116, i32 0, i32 2, !dbg !3431
  %118 = load i8, ptr %117, align 1, !dbg !3431
  %119 = zext i8 %118 to i64, !dbg !3432
  %120 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %119, !dbg !3432
  %121 = getelementptr inbounds nuw %struct.weapon_info, ptr %120, i32 0, i32 30, !dbg !3433
  %122 = load i32, ptr @Difficulty_level, align 4, !dbg !3434
  %123 = sext i32 %122 to i64, !dbg !3432
  %124 = getelementptr inbounds [5 x i32], ptr %121, i64 0, i64 %123, !dbg !3432
  %125 = load i32, ptr %124, align 4, !dbg !3432
  %126 = call noundef ptr @_Z12vm_vec_scaleP10vms_vectori(ptr noundef %115, i32 noundef %125), !dbg !3435
  br label %127, !dbg !3436

127:                                              ; preds = %108, %102
  %128 = load ptr, ptr %2, align 8, !dbg !3437
  %129 = getelementptr inbounds nuw %struct.object, ptr %128, i32 0, i32 2, !dbg !3439
  %130 = load i8, ptr %129, align 1, !dbg !3439
  %131 = zext i8 %130 to i64, !dbg !3440
  %132 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %131, !dbg !3440
  %133 = getelementptr inbounds nuw %struct.weapon_info, ptr %132, i32 0, i32 16, !dbg !3441
  %134 = load i8, ptr %133, align 1, !dbg !3441
  %135 = icmp ne i8 %134, 0, !dbg !3440
  br i1 %135, label %136, label %357, !dbg !3442

136:                                              ; preds = %127
  %137 = load ptr, ptr %2, align 8, !dbg !3443
  %138 = getelementptr inbounds nuw %struct.object, ptr %137, i32 0, i32 2, !dbg !3444
  %139 = load i8, ptr %138, align 1, !dbg !3444
  %140 = zext i8 %139 to i32, !dbg !3443
  %141 = icmp eq i32 %140, 37, !dbg !3445
  br i1 %141, label %142, label %174, !dbg !3446

142:                                              ; preds = %136
  %143 = load ptr, ptr %2, align 8, !dbg !3447
  %144 = load ptr, ptr %2, align 8, !dbg !3448
  %145 = getelementptr inbounds nuw %struct.object, ptr %144, i32 0, i32 22, !dbg !3449
  %146 = getelementptr inbounds nuw %struct.laser_info_s, ptr %145, i32 0, i32 1, !dbg !3450
  %147 = load i16, ptr %146, align 2, !dbg !3450
  %148 = sext i16 %147 to i64, !dbg !3451
  %149 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %148, !dbg !3451
  %150 = getelementptr inbounds nuw %struct.object, ptr %149, i32 0, i32 2, !dbg !3452
  %151 = load i8, ptr %150, align 1, !dbg !3452
  %152 = zext i8 %151 to i64, !dbg !3453
  %153 = getelementptr inbounds nuw [8 x ptr], ptr @Guided_missile, i64 0, i64 %152, !dbg !3453
  %154 = load ptr, ptr %153, align 8, !dbg !3453
  %155 = icmp eq ptr %143, %154, !dbg !3454
  br i1 %155, label %156, label %174, !dbg !3455

156:                                              ; preds = %142
  %157 = load ptr, ptr %2, align 8, !dbg !3456
  %158 = getelementptr inbounds nuw %struct.object, ptr %157, i32 0, i32 0, !dbg !3457
  %159 = load i32, ptr %158, align 4, !dbg !3457
  %160 = load ptr, ptr %2, align 8, !dbg !3458
  %161 = getelementptr inbounds nuw %struct.object, ptr %160, i32 0, i32 22, !dbg !3459
  %162 = getelementptr inbounds nuw %struct.laser_info_s, ptr %161, i32 0, i32 1, !dbg !3460
  %163 = load i16, ptr %162, align 2, !dbg !3460
  %164 = sext i16 %163 to i64, !dbg !3461
  %165 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %164, !dbg !3461
  %166 = getelementptr inbounds nuw %struct.object, ptr %165, i32 0, i32 2, !dbg !3462
  %167 = load i8, ptr %166, align 1, !dbg !3462
  %168 = zext i8 %167 to i64, !dbg !3463
  %169 = getelementptr inbounds nuw [8 x ptr], ptr @Guided_missile, i64 0, i64 %168, !dbg !3463
  %170 = load ptr, ptr %169, align 8, !dbg !3463
  %171 = getelementptr inbounds nuw %struct.object, ptr %170, i32 0, i32 0, !dbg !3464
  %172 = load i32, ptr %171, align 4, !dbg !3464
  %173 = icmp eq i32 %159, %172, !dbg !3465
  br i1 %173, label %357, label %174, !dbg !3442

174:                                              ; preds = %156, %142, %136
    #dbg_declare(ptr %3, !3466, !DIExpression(), !3468)
    #dbg_declare(ptr %4, !3469, !DIExpression(), !3470)
    #dbg_declare(ptr %5, !3471, !DIExpression(), !3472)
  store i32 65536, ptr %5, align 4, !dbg !3472
    #dbg_declare(ptr %6, !3473, !DIExpression(), !3474)
    #dbg_declare(ptr %7, !3475, !DIExpression(), !3476)
  %175 = load ptr, ptr %2, align 8, !dbg !3477
  %176 = getelementptr inbounds nuw %struct.object, ptr %175, i32 0, i32 22, !dbg !3479
  %177 = getelementptr inbounds nuw %struct.laser_info_s, ptr %176, i32 0, i32 3, !dbg !3480
  %178 = load i32, ptr %177, align 4, !dbg !3480
  %179 = add nsw i32 %178, 8192, !dbg !3481
  %180 = load i32, ptr @GameTime, align 4, !dbg !3482
  %181 = icmp slt i32 %179, %180, !dbg !3483
  br i1 %181, label %182, label %356, !dbg !3483

182:                                              ; preds = %174
    #dbg_declare(ptr %8, !3484, !DIExpression(), !3486)
  %183 = load ptr, ptr %2, align 8, !dbg !3487
  %184 = getelementptr inbounds nuw %struct.object, ptr %183, i32 0, i32 22, !dbg !3488
  %185 = getelementptr inbounds nuw %struct.laser_info_s, ptr %184, i32 0, i32 5, !dbg !3489
  %186 = load i16, ptr %185, align 2, !dbg !3489
  %187 = sext i16 %186 to i32, !dbg !3487
  store i32 %187, ptr %8, align 4, !dbg !3486
  %188 = load ptr, ptr %2, align 8, !dbg !3490
  %189 = getelementptr inbounds nuw %struct.object, ptr %188, i32 0, i32 2, !dbg !3492
  %190 = load i8, ptr %189, align 1, !dbg !3492
  %191 = zext i8 %190 to i32, !dbg !3490
  %192 = icmp eq i32 %191, 49, !dbg !3493
  br i1 %192, label %217, label %193, !dbg !3494

193:                                              ; preds = %182
  %194 = load ptr, ptr %2, align 8, !dbg !3495
  %195 = getelementptr inbounds nuw %struct.object, ptr %194, i32 0, i32 2, !dbg !3496
  %196 = load i8, ptr %195, align 1, !dbg !3496
  %197 = zext i8 %196 to i32, !dbg !3495
  %198 = icmp eq i32 %197, 29, !dbg !3497
  br i1 %198, label %217, label %199, !dbg !3498

199:                                              ; preds = %193
  %200 = load ptr, ptr %2, align 8, !dbg !3499
  %201 = getelementptr inbounds nuw %struct.object, ptr %200, i32 0, i32 2, !dbg !3500
  %202 = load i8, ptr %201, align 1, !dbg !3500
  %203 = zext i8 %202 to i32, !dbg !3499
  %204 = icmp eq i32 %203, 47, !dbg !3501
  br i1 %204, label %217, label %205, !dbg !3502

205:                                              ; preds = %199
  %206 = load ptr, ptr %2, align 8, !dbg !3503
  %207 = getelementptr inbounds nuw %struct.object, ptr %206, i32 0, i32 2, !dbg !3504
  %208 = load i8, ptr %207, align 1, !dbg !3504
  %209 = zext i8 %208 to i32, !dbg !3503
  %210 = icmp eq i32 %209, 19, !dbg !3505
  br i1 %210, label %217, label %211, !dbg !3506

211:                                              ; preds = %205
  %212 = load ptr, ptr %2, align 8, !dbg !3507
  %213 = getelementptr inbounds nuw %struct.object, ptr %212, i32 0, i32 2, !dbg !3508
  %214 = load i8, ptr %213, align 1, !dbg !3508
  %215 = zext i8 %214 to i32, !dbg !3507
  %216 = icmp eq i32 %215, 54, !dbg !3509
  br i1 %216, label %217, label %225, !dbg !3506

217:                                              ; preds = %211, %205, %199, %193, %182
  %218 = load ptr, ptr %2, align 8, !dbg !3510
  %219 = getelementptr inbounds nuw %struct.object, ptr %218, i32 0, i32 21, !dbg !3512
  %220 = getelementptr inbounds nuw %struct.physics_info, ptr %219, i32 0, i32 8, !dbg !3513
  %221 = load i16, ptr %220, align 2, !dbg !3514
  %222 = zext i16 %221 to i32, !dbg !3514
  %223 = and i32 %222, -5, !dbg !3514
  %224 = trunc i32 %223 to i16, !dbg !3514
  store i16 %224, ptr %220, align 2, !dbg !3514
  br label %225, !dbg !3515

225:                                              ; preds = %217, %211
  %226 = load i32, ptr %8, align 4, !dbg !3516
  %227 = load ptr, ptr %2, align 8, !dbg !3517
  %228 = call noundef i32 @_Z16track_track_goaliP6objectPi(i32 noundef %226, ptr noundef %227, ptr noundef %5), !dbg !3518
  store i32 %228, ptr %8, align 4, !dbg !3519
  %229 = load i32, ptr %8, align 4, !dbg !3520
  %230 = load i32, ptr @Player_num, align 4, !dbg !3522
  %231 = sext i32 %230 to i64, !dbg !3523
  %232 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %231, !dbg !3523
  %233 = getelementptr inbounds nuw %struct.player, ptr %232, i32 0, i32 4, !dbg !3524
  %234 = load i32, ptr %233, align 4, !dbg !3524
  %235 = icmp eq i32 %229, %234, !dbg !3525
  br i1 %235, label %236, label %265, !dbg !3525

236:                                              ; preds = %225
    #dbg_declare(ptr %9, !3526, !DIExpression(), !3528)
  %237 = load ptr, ptr %2, align 8, !dbg !3529
  %238 = getelementptr inbounds nuw %struct.object, ptr %237, i32 0, i32 11, !dbg !3530
  %239 = load i32, ptr %8, align 4, !dbg !3531
  %240 = sext i32 %239 to i64, !dbg !3532
  %241 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %240, !dbg !3532
  %242 = getelementptr inbounds nuw %struct.object, ptr %241, i32 0, i32 11, !dbg !3533
  %243 = call noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef %238, ptr noundef %242), !dbg !3534
  store i32 %243, ptr %9, align 4, !dbg !3535
  %244 = load i32, ptr %9, align 4, !dbg !3536
  %245 = load i32, ptr @Player_num, align 4, !dbg !3538
  %246 = sext i32 %245 to i64, !dbg !3539
  %247 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %246, !dbg !3539
  %248 = getelementptr inbounds nuw %struct.player, ptr %247, i32 0, i32 37, !dbg !3540
  %249 = load i32, ptr %248, align 4, !dbg !3540
  %250 = icmp slt i32 %244, %249, !dbg !3541
  br i1 %250, label %258, label %251, !dbg !3542

251:                                              ; preds = %236
  %252 = load i32, ptr @Player_num, align 4, !dbg !3543
  %253 = sext i32 %252 to i64, !dbg !3544
  %254 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %253, !dbg !3544
  %255 = getelementptr inbounds nuw %struct.player, ptr %254, i32 0, i32 37, !dbg !3545
  %256 = load i32, ptr %255, align 4, !dbg !3545
  %257 = icmp slt i32 %256, 0, !dbg !3546
  br i1 %257, label %258, label %264, !dbg !3542

258:                                              ; preds = %251, %236
  %259 = load i32, ptr %9, align 4, !dbg !3547
  %260 = load i32, ptr @Player_num, align 4, !dbg !3548
  %261 = sext i32 %260 to i64, !dbg !3549
  %262 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %261, !dbg !3549
  %263 = getelementptr inbounds nuw %struct.player, ptr %262, i32 0, i32 37, !dbg !3550
  store i32 %259, ptr %263, align 4, !dbg !3551
  br label %264, !dbg !3549

264:                                              ; preds = %258, %251
  br label %265, !dbg !3552

265:                                              ; preds = %264, %225
  %266 = load i32, ptr %8, align 4, !dbg !3553
  %267 = icmp ne i32 %266, -1, !dbg !3555
  br i1 %267, label %268, label %355, !dbg !3555

268:                                              ; preds = %265
  %269 = load i32, ptr %8, align 4, !dbg !3556
  %270 = sext i32 %269 to i64, !dbg !3558
  %271 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %270, !dbg !3558
  %272 = getelementptr inbounds nuw %struct.object, ptr %271, i32 0, i32 11, !dbg !3559
  %273 = load ptr, ptr %2, align 8, !dbg !3560
  %274 = getelementptr inbounds nuw %struct.object, ptr %273, i32 0, i32 11, !dbg !3561
  %275 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %3, ptr noundef %272, ptr noundef %274), !dbg !3562
  %276 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %3), !dbg !3563
  %277 = load ptr, ptr %2, align 8, !dbg !3564
  %278 = getelementptr inbounds nuw %struct.object, ptr %277, i32 0, i32 21, !dbg !3565
  %279 = getelementptr inbounds nuw %struct.physics_info, ptr %278, i32 0, i32 0, !dbg !3566
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %4, ptr align 4 %279, i64 12, i1 false), !dbg !3567
  %280 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %4), !dbg !3568
  store i32 %280, ptr %6, align 4, !dbg !3569
  %281 = load ptr, ptr %2, align 8, !dbg !3570
  %282 = getelementptr inbounds nuw %struct.object, ptr %281, i32 0, i32 2, !dbg !3571
  %283 = load i8, ptr %282, align 1, !dbg !3571
  %284 = zext i8 %283 to i64, !dbg !3572
  %285 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %284, !dbg !3572
  %286 = getelementptr inbounds nuw %struct.weapon_info, ptr %285, i32 0, i32 30, !dbg !3573
  %287 = load i32, ptr @Difficulty_level, align 4, !dbg !3574
  %288 = sext i32 %287 to i64, !dbg !3572
  %289 = getelementptr inbounds [5 x i32], ptr %286, i64 0, i64 %288, !dbg !3572
  %290 = load i32, ptr %289, align 4, !dbg !3572
  store i32 %290, ptr %7, align 4, !dbg !3575
  %291 = load i32, ptr %6, align 4, !dbg !3576
  %292 = add nsw i32 %291, 65536, !dbg !3578
  %293 = load i32, ptr %7, align 4, !dbg !3579
  %294 = icmp slt i32 %292, %293, !dbg !3580
  br i1 %294, label %295, label %308, !dbg !3580

295:                                              ; preds = %268
  %296 = load i32, ptr %7, align 4, !dbg !3581
  %297 = load i32, ptr @FrameTime, align 4, !dbg !3583
  %298 = sdiv i32 %297, 2, !dbg !3584
  %299 = call noundef i32 @_Z6fixmulii(i32 noundef %296, i32 noundef %298), !dbg !3585
  %300 = load i32, ptr %6, align 4, !dbg !3586
  %301 = add nsw i32 %300, %299, !dbg !3586
  store i32 %301, ptr %6, align 4, !dbg !3586
  %302 = load i32, ptr %6, align 4, !dbg !3587
  %303 = load i32, ptr %7, align 4, !dbg !3589
  %304 = icmp sgt i32 %302, %303, !dbg !3590
  br i1 %304, label %305, label %307, !dbg !3590

305:                                              ; preds = %295
  %306 = load i32, ptr %7, align 4, !dbg !3591
  store i32 %306, ptr %6, align 4, !dbg !3592
  br label %307, !dbg !3593

307:                                              ; preds = %305, %295
  br label %308, !dbg !3594

308:                                              ; preds = %307, %268
  %309 = call noundef ptr @_Z11vm_vec_add2P10vms_vectorS0_(ptr noundef %4, ptr noundef %3), !dbg !3595
  %310 = load ptr, ptr %2, align 8, !dbg !3596
  %311 = getelementptr inbounds nuw %struct.object, ptr %310, i32 0, i32 2, !dbg !3598
  %312 = load i8, ptr %311, align 1, !dbg !3598
  %313 = zext i8 %312 to i64, !dbg !3599
  %314 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %313, !dbg !3599
  %315 = getelementptr inbounds nuw %struct.weapon_info, ptr %314, i32 0, i32 0, !dbg !3600
  %316 = load i8, ptr %315, align 4, !dbg !3600
  %317 = sext i8 %316 to i32, !dbg !3599
  %318 = icmp ne i32 %317, 2, !dbg !3601
  br i1 %318, label %319, label %321, !dbg !3601

319:                                              ; preds = %308
  %320 = call noundef ptr @_Z11vm_vec_add2P10vms_vectorS0_(ptr noundef %4, ptr noundef %3), !dbg !3602
  br label %321, !dbg !3602

321:                                              ; preds = %319, %308
  %322 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %4), !dbg !3603
  %323 = load ptr, ptr %2, align 8, !dbg !3604
  %324 = getelementptr inbounds nuw %struct.object, ptr %323, i32 0, i32 21, !dbg !3605
  %325 = getelementptr inbounds nuw %struct.physics_info, ptr %324, i32 0, i32 0, !dbg !3606
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %325, ptr align 4 %4, i64 12, i1 false), !dbg !3607
  %326 = load ptr, ptr %2, align 8, !dbg !3608
  %327 = getelementptr inbounds nuw %struct.object, ptr %326, i32 0, i32 21, !dbg !3609
  %328 = getelementptr inbounds nuw %struct.physics_info, ptr %327, i32 0, i32 0, !dbg !3610
  %329 = load i32, ptr %6, align 4, !dbg !3611
  %330 = call noundef ptr @_Z12vm_vec_scaleP10vms_vectori(ptr noundef %328, i32 noundef %329), !dbg !3612
    #dbg_declare(ptr %10, !3613, !DIExpression(), !3615)
    #dbg_declare(ptr %11, !3616, !DIExpression(), !3617)
  %331 = load i32, ptr %5, align 4, !dbg !3618
  %332 = sub nsw i32 65536, %331, !dbg !3619
  %333 = call i32 @llvm.abs.i32(i32 %332, i1 true), !dbg !3620
  store i32 %333, ptr %11, align 4, !dbg !3621
  %334 = load i32, ptr %11, align 4, !dbg !3622
  %335 = mul nsw i32 %334, 32, !dbg !3623
  %336 = load i32, ptr @FrameTime, align 4, !dbg !3624
  %337 = call noundef i32 @_Z6fixmulii(i32 noundef %335, i32 noundef %336), !dbg !3625
  store i32 %337, ptr %10, align 4, !dbg !3626
  %338 = load i32, ptr %10, align 4, !dbg !3627
  %339 = load ptr, ptr %2, align 8, !dbg !3628
  %340 = getelementptr inbounds nuw %struct.object, ptr %339, i32 0, i32 20, !dbg !3629
  %341 = load i32, ptr %340, align 4, !dbg !3630
  %342 = sub nsw i32 %341, %338, !dbg !3630
  store i32 %342, ptr %340, align 4, !dbg !3630
  %343 = load ptr, ptr %2, align 8, !dbg !3631
  %344 = getelementptr inbounds nuw %struct.object, ptr %343, i32 0, i32 2, !dbg !3633
  %345 = load i8, ptr %344, align 1, !dbg !3633
  %346 = zext i8 %345 to i64, !dbg !3634
  %347 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %346, !dbg !3634
  %348 = getelementptr inbounds nuw %struct.weapon_info, ptr %347, i32 0, i32 0, !dbg !3635
  %349 = load i8, ptr %348, align 4, !dbg !3635
  %350 = sext i8 %349 to i32, !dbg !3634
  %351 = icmp eq i32 %350, 2, !dbg !3636
  br i1 %351, label %352, label %354, !dbg !3636

352:                                              ; preds = %321
  %353 = load ptr, ptr %2, align 8, !dbg !3637
  call void @_Z36homing_missile_turn_towards_velocityP6objectP10vms_vector(ptr noundef %353, ptr noundef %4), !dbg !3638
  br label %354, !dbg !3638

354:                                              ; preds = %352, %321
  br label %355, !dbg !3639

355:                                              ; preds = %354, %265
  br label %356, !dbg !3640

356:                                              ; preds = %355, %174
  br label %357, !dbg !3641

357:                                              ; preds = %356, %156, %127
    #dbg_declare(ptr %12, !3642, !DIExpression(), !3643)
  %358 = load i32, ptr @CurrentLogicVersion, align 4, !dbg !3644
  %359 = icmp sge i32 %358, 1, !dbg !3646
  br i1 %359, label %360, label %409, !dbg !3646

360:                                              ; preds = %357
  %361 = load ptr, ptr %2, align 8, !dbg !3647
  %362 = getelementptr inbounds nuw %struct.object, ptr %361, i32 0, i32 21, !dbg !3649
  %363 = getelementptr inbounds nuw %struct.physics_info, ptr %362, i32 0, i32 0, !dbg !3650
  %364 = call noundef i32 @_Z16vm_vec_mag_quickP10vms_vector(ptr noundef %363), !dbg !3651
  store i32 %364, ptr %12, align 4, !dbg !3652
  %365 = load i32, ptr %12, align 4, !dbg !3653
  %366 = load ptr, ptr %2, align 8, !dbg !3655
  %367 = getelementptr inbounds nuw %struct.object, ptr %366, i32 0, i32 2, !dbg !3656
  %368 = load i8, ptr %367, align 1, !dbg !3656
  %369 = zext i8 %368 to i64, !dbg !3657
  %370 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %369, !dbg !3657
  %371 = getelementptr inbounds nuw %struct.weapon_info, ptr %370, i32 0, i32 30, !dbg !3658
  %372 = load i32, ptr @Difficulty_level, align 4, !dbg !3659
  %373 = sext i32 %372 to i64, !dbg !3657
  %374 = getelementptr inbounds [5 x i32], ptr %371, i64 0, i64 %373, !dbg !3657
  %375 = load i32, ptr %374, align 4, !dbg !3657
  %376 = icmp sgt i32 %365, %375, !dbg !3660
  br i1 %376, label %377, label %408, !dbg !3660

377:                                              ; preds = %360
  %378 = load ptr, ptr %2, align 8, !dbg !3661
  %379 = getelementptr inbounds nuw %struct.object, ptr %378, i32 0, i32 2, !dbg !3664
  %380 = load i8, ptr %379, align 1, !dbg !3664
  %381 = zext i8 %380 to i64, !dbg !3665
  %382 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %381, !dbg !3665
  %383 = getelementptr inbounds nuw %struct.weapon_info, ptr %382, i32 0, i32 30, !dbg !3666
  %384 = load i32, ptr @Difficulty_level, align 4, !dbg !3667
  %385 = sext i32 %384 to i64, !dbg !3665
  %386 = getelementptr inbounds [5 x i32], ptr %383, i64 0, i64 %385, !dbg !3665
  %387 = load i32, ptr %386, align 4, !dbg !3665
  %388 = icmp ne i32 %387, 0, !dbg !3665
  br i1 %388, label %389, label %407, !dbg !3665

389:                                              ; preds = %377
    #dbg_declare(ptr %13, !3668, !DIExpression(), !3670)
  %390 = load ptr, ptr %2, align 8, !dbg !3671
  %391 = getelementptr inbounds nuw %struct.object, ptr %390, i32 0, i32 2, !dbg !3672
  %392 = load i8, ptr %391, align 1, !dbg !3672
  %393 = zext i8 %392 to i64, !dbg !3673
  %394 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %393, !dbg !3673
  %395 = getelementptr inbounds nuw %struct.weapon_info, ptr %394, i32 0, i32 30, !dbg !3674
  %396 = load i32, ptr @Difficulty_level, align 4, !dbg !3675
  %397 = sext i32 %396 to i64, !dbg !3673
  %398 = getelementptr inbounds [5 x i32], ptr %395, i64 0, i64 %397, !dbg !3673
  %399 = load i32, ptr %398, align 4, !dbg !3673
  %400 = load i32, ptr %12, align 4, !dbg !3676
  %401 = call noundef i32 @_Z6fixdivii(i32 noundef %399, i32 noundef %400), !dbg !3677
  store i32 %401, ptr %13, align 4, !dbg !3678
  %402 = load ptr, ptr %2, align 8, !dbg !3679
  %403 = getelementptr inbounds nuw %struct.object, ptr %402, i32 0, i32 21, !dbg !3680
  %404 = getelementptr inbounds nuw %struct.physics_info, ptr %403, i32 0, i32 0, !dbg !3681
  %405 = load i32, ptr %13, align 4, !dbg !3682
  %406 = call noundef ptr @_Z12vm_vec_scaleP10vms_vectori(ptr noundef %404, i32 noundef %405), !dbg !3683
  br label %407, !dbg !3684

407:                                              ; preds = %389, %377
  br label %408, !dbg !3685

408:                                              ; preds = %407, %360
  br label %455, !dbg !3686

409:                                              ; preds = %357
  %410 = load ptr, ptr %2, align 8, !dbg !3687
  %411 = getelementptr inbounds nuw %struct.object, ptr %410, i32 0, i32 2, !dbg !3689
  %412 = load i8, ptr %411, align 1, !dbg !3689
  %413 = zext i8 %412 to i64, !dbg !3690
  %414 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %413, !dbg !3690
  %415 = getelementptr inbounds nuw %struct.weapon_info, ptr %414, i32 0, i32 33, !dbg !3691
  %416 = load i32, ptr %415, align 4, !dbg !3691
  %417 = icmp ne i32 %416, 0, !dbg !3690
  br i1 %417, label %418, label %454, !dbg !3690

418:                                              ; preds = %409
  %419 = load ptr, ptr %2, align 8, !dbg !3692
  %420 = getelementptr inbounds nuw %struct.object, ptr %419, i32 0, i32 21, !dbg !3694
  %421 = getelementptr inbounds nuw %struct.physics_info, ptr %420, i32 0, i32 0, !dbg !3695
  %422 = call noundef i32 @_Z16vm_vec_mag_quickP10vms_vector(ptr noundef %421), !dbg !3696
  store i32 %422, ptr %12, align 4, !dbg !3697
  %423 = load i32, ptr %12, align 4, !dbg !3698
  %424 = load ptr, ptr %2, align 8, !dbg !3700
  %425 = getelementptr inbounds nuw %struct.object, ptr %424, i32 0, i32 2, !dbg !3701
  %426 = load i8, ptr %425, align 1, !dbg !3701
  %427 = zext i8 %426 to i64, !dbg !3702
  %428 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %427, !dbg !3702
  %429 = getelementptr inbounds nuw %struct.weapon_info, ptr %428, i32 0, i32 30, !dbg !3703
  %430 = load i32, ptr @Difficulty_level, align 4, !dbg !3704
  %431 = sext i32 %430 to i64, !dbg !3702
  %432 = getelementptr inbounds [5 x i32], ptr %429, i64 0, i64 %431, !dbg !3702
  %433 = load i32, ptr %432, align 4, !dbg !3702
  %434 = icmp sgt i32 %423, %433, !dbg !3705
  br i1 %434, label %435, label %453, !dbg !3705

435:                                              ; preds = %418
    #dbg_declare(ptr %14, !3706, !DIExpression(), !3708)
  %436 = load ptr, ptr %2, align 8, !dbg !3709
  %437 = getelementptr inbounds nuw %struct.object, ptr %436, i32 0, i32 2, !dbg !3710
  %438 = load i8, ptr %437, align 1, !dbg !3710
  %439 = zext i8 %438 to i64, !dbg !3711
  %440 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %439, !dbg !3711
  %441 = getelementptr inbounds nuw %struct.weapon_info, ptr %440, i32 0, i32 30, !dbg !3712
  %442 = load i32, ptr @Difficulty_level, align 4, !dbg !3713
  %443 = sext i32 %442 to i64, !dbg !3711
  %444 = getelementptr inbounds [5 x i32], ptr %441, i64 0, i64 %443, !dbg !3711
  %445 = load i32, ptr %444, align 4, !dbg !3711
  %446 = load i32, ptr %12, align 4, !dbg !3714
  %447 = call noundef i32 @_Z6fixdivii(i32 noundef %445, i32 noundef %446), !dbg !3715
  store i32 %447, ptr %14, align 4, !dbg !3716
  %448 = load ptr, ptr %2, align 8, !dbg !3717
  %449 = getelementptr inbounds nuw %struct.object, ptr %448, i32 0, i32 21, !dbg !3718
  %450 = getelementptr inbounds nuw %struct.physics_info, ptr %449, i32 0, i32 0, !dbg !3719
  %451 = load i32, ptr %14, align 4, !dbg !3720
  %452 = call noundef ptr @_Z12vm_vec_scaleP10vms_vectori(ptr noundef %450, i32 noundef %451), !dbg !3721
  br label %453, !dbg !3722

453:                                              ; preds = %435, %418
  br label %454, !dbg !3723

454:                                              ; preds = %453, %409
  br label %455

455:                                              ; preds = %63, %96, %454, %408
  ret void, !dbg !3724
}

declare noundef ptr @_Z21explode_badass_weaponP6objectP10vms_vector(ptr noundef, ptr noundef) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.abs.i32(i32, i1 immarg) #4

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z22do_laser_firing_playerv() #0 !dbg !317 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
    #dbg_declare(ptr %2, !3725, !DIExpression(), !3778)
  %12 = load i32, ptr @Player_num, align 4, !dbg !3779
  %13 = sext i32 %12 to i64, !dbg !3780
  %14 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %13, !dbg !3780
  store ptr %14, ptr %2, align 8, !dbg !3778
    #dbg_declare(ptr %3, !3781, !DIExpression(), !3782)
    #dbg_declare(ptr %4, !3783, !DIExpression(), !3784)
    #dbg_declare(ptr %5, !3785, !DIExpression(), !3786)
    #dbg_declare(ptr %6, !3787, !DIExpression(), !3788)
    #dbg_declare(ptr %7, !3789, !DIExpression(), !3790)
  store i32 0, ptr %7, align 4, !dbg !3790
    #dbg_declare(ptr %8, !3791, !DIExpression(), !3792)
  store i32 1, ptr %8, align 4, !dbg !3792
    #dbg_declare(ptr %9, !3793, !DIExpression(), !3794)
  %15 = load i32, ptr @Player_is_dead, align 4, !dbg !3795
  %16 = icmp ne i32 %15, 0, !dbg !3795
  br i1 %16, label %17, label %18, !dbg !3795

17:                                               ; preds = %0
  store i32 0, ptr %1, align 4, !dbg !3797
  br label %261, !dbg !3797

18:                                               ; preds = %0
  %19 = load i8, ptr @Primary_weapon, align 1, !dbg !3798
  %20 = sext i8 %19 to i64, !dbg !3799
  %21 = getelementptr inbounds [10 x i8], ptr @Primary_weapon_to_weapon_info, i64 0, i64 %20, !dbg !3799
  %22 = load i8, ptr %21, align 1, !dbg !3799
  %23 = zext i8 %22 to i32, !dbg !3799
  store i32 %23, ptr %6, align 4, !dbg !3800
  %24 = load i32, ptr %6, align 4, !dbg !3801
  %25 = sext i32 %24 to i64, !dbg !3802
  %26 = getelementptr inbounds [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %25, !dbg !3802
  %27 = getelementptr inbounds nuw %struct.weapon_info, ptr %26, i32 0, i32 22, !dbg !3803
  %28 = load i32, ptr %27, align 4, !dbg !3803
  store i32 %28, ptr %3, align 4, !dbg !3804
  %29 = load i8, ptr @Primary_weapon, align 1, !dbg !3805
  %30 = sext i8 %29 to i32, !dbg !3805
  %31 = icmp eq i32 %30, 9, !dbg !3807
  br i1 %31, label %32, label %33, !dbg !3807

32:                                               ; preds = %18
  store i32 0, ptr %3, align 4, !dbg !3808
  br label %33, !dbg !3809

33:                                               ; preds = %32, %18
  %34 = load i32, ptr @Difficulty_level, align 4, !dbg !3810
  %35 = icmp slt i32 %34, 2, !dbg !3812
  br i1 %35, label %36, label %43, !dbg !3812

36:                                               ; preds = %33
  %37 = load i32, ptr %3, align 4, !dbg !3813
  %38 = load i32, ptr @Difficulty_level, align 4, !dbg !3814
  %39 = add nsw i32 %38, 2, !dbg !3815
  %40 = call noundef i32 @_Z3i2fi(i32 noundef %39), !dbg !3816
  %41 = sdiv i32 %40, 4, !dbg !3817
  %42 = call noundef i32 @_Z6fixmulii(i32 noundef %37, i32 noundef %41), !dbg !3818
  store i32 %42, ptr %3, align 4, !dbg !3819
  br label %43, !dbg !3820

43:                                               ; preds = %36, %33
  %44 = load i32, ptr %6, align 4, !dbg !3821
  %45 = icmp eq i32 %44, 7, !dbg !3823
  br i1 %45, label %46, label %57, !dbg !3824

46:                                               ; preds = %43
  %47 = load i32, ptr @CurrentLogicVersion, align 4, !dbg !3825
  %48 = icmp sge i32 %47, 1, !dbg !3826
  br i1 %48, label %49, label %57, !dbg !3824

49:                                               ; preds = %46
  %50 = load i32, ptr @Game_mode, align 4, !dbg !3827
  %51 = and i32 %50, 38, !dbg !3829
  %52 = icmp ne i32 %51, 0, !dbg !3827
  br i1 %52, label %53, label %56, !dbg !3827

53:                                               ; preds = %49
  %54 = load i32, ptr %3, align 4, !dbg !3830
  %55 = mul nsw i32 %54, 2, !dbg !3830
  store i32 %55, ptr %3, align 4, !dbg !3830
  br label %56, !dbg !3831

56:                                               ; preds = %53, %49
  br label %57, !dbg !3832

57:                                               ; preds = %56, %46, %43
  %58 = load i32, ptr %6, align 4, !dbg !3833
  %59 = sext i32 %58 to i64, !dbg !3834
  %60 = getelementptr inbounds [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %59, !dbg !3834
  %61 = getelementptr inbounds nuw %struct.weapon_info, ptr %60, i32 0, i32 10, !dbg !3835
  %62 = load i8, ptr %61, align 2, !dbg !3835
  %63 = sext i8 %62 to i32, !dbg !3834
  store i32 %63, ptr %4, align 4, !dbg !3836
  %64 = load i32, ptr @FrameTime, align 4, !dbg !3837
  %65 = mul nsw i32 2, %64, !dbg !3838
  store i32 %65, ptr %9, align 4, !dbg !3839
  %66 = load i32, ptr %9, align 4, !dbg !3840
  %67 = icmp sgt i32 %66, 65536, !dbg !3842
  br i1 %67, label %68, label %69, !dbg !3842

68:                                               ; preds = %57
  store i32 65536, ptr %9, align 4, !dbg !3843
  br label %69, !dbg !3844

69:                                               ; preds = %68, %57
  %70 = load i32, ptr @Last_laser_fired_time, align 4, !dbg !3845
  %71 = load i32, ptr @FrameTime, align 4, !dbg !3847
  %72 = mul nsw i32 2, %71, !dbg !3848
  %73 = add nsw i32 %70, %72, !dbg !3849
  %74 = load i32, ptr @GameTime, align 4, !dbg !3850
  %75 = icmp slt i32 %73, %74, !dbg !3851
  br i1 %75, label %80, label %76, !dbg !3852

76:                                               ; preds = %69
  %77 = load i32, ptr @GameTime, align 4, !dbg !3853
  %78 = load i32, ptr @Last_laser_fired_time, align 4, !dbg !3854
  %79 = icmp slt i32 %77, %78, !dbg !3855
  br i1 %79, label %80, label %82, !dbg !3852

80:                                               ; preds = %76, %69
  %81 = load i32, ptr @GameTime, align 4, !dbg !3856
  store i32 %81, ptr @Next_laser_fire_time, align 4, !dbg !3857
  br label %82, !dbg !3858

82:                                               ; preds = %80, %76
  %83 = load i32, ptr @GameTime, align 4, !dbg !3859
  store i32 %83, ptr @Last_laser_fired_time, align 4, !dbg !3860
  %84 = load i8, ptr @Primary_weapon, align 1, !dbg !3861
  %85 = sext i8 %84 to i32, !dbg !3861
  %86 = icmp eq i32 %85, 6, !dbg !3862
  br i1 %86, label %87, label %92, !dbg !3863

87:                                               ; preds = %82
  %88 = load ptr, ptr %2, align 8, !dbg !3864
  %89 = getelementptr inbounds nuw %struct.player, ptr %88, i32 0, i32 17, !dbg !3865
  %90 = getelementptr inbounds [10 x i16], ptr %89, i64 0, i64 1, !dbg !3864
  %91 = load i16, ptr %90, align 2, !dbg !3864
  br label %99, !dbg !3863

92:                                               ; preds = %82
  %93 = load ptr, ptr %2, align 8, !dbg !3866
  %94 = getelementptr inbounds nuw %struct.player, ptr %93, i32 0, i32 17, !dbg !3867
  %95 = load i8, ptr @Primary_weapon, align 1, !dbg !3868
  %96 = sext i8 %95 to i64, !dbg !3866
  %97 = getelementptr inbounds [10 x i16], ptr %94, i64 0, i64 %96, !dbg !3866
  %98 = load i16, ptr %97, align 2, !dbg !3866
  br label %99, !dbg !3863

99:                                               ; preds = %92, %87
  %100 = phi i16 [ %91, %87 ], [ %98, %92 ], !dbg !3863
  %101 = zext i16 %100 to i32, !dbg !3863
  store i32 %101, ptr %5, align 4, !dbg !3869
  %102 = load ptr, ptr %2, align 8, !dbg !3870
  %103 = getelementptr inbounds nuw %struct.player, ptr %102, i32 0, i32 8, !dbg !3872
  %104 = load i32, ptr %103, align 4, !dbg !3872
  %105 = load i32, ptr %3, align 4, !dbg !3873
  %106 = icmp sge i32 %104, %105, !dbg !3874
  br i1 %106, label %107, label %111, !dbg !3875

107:                                              ; preds = %99
  %108 = load i32, ptr %5, align 4, !dbg !3876
  %109 = load i32, ptr %4, align 4, !dbg !3877
  %110 = icmp sge i32 %108, %109, !dbg !3878
  br i1 %110, label %112, label %111, !dbg !3879

111:                                              ; preds = %107, %99
  call void @_Z18auto_select_weaponi(i32 noundef 0), !dbg !3880
  br label %112, !dbg !3880

112:                                              ; preds = %111, %107
  %113 = load i32, ptr @Zbonkers, align 4, !dbg !3881
  %114 = icmp ne i32 %113, 0, !dbg !3881
  br i1 %114, label %115, label %116, !dbg !3881

115:                                              ; preds = %112
  store i32 0, ptr @Zbonkers, align 4, !dbg !3883
  store i32 0, ptr @GameTime, align 4, !dbg !3885
  br label %116, !dbg !3886

116:                                              ; preds = %115, %112
  br label %117, !dbg !3887

117:                                              ; preds = %257, %116
  %118 = load i32, ptr @Next_laser_fire_time, align 4, !dbg !3888
  %119 = load i32, ptr @GameTime, align 4, !dbg !3889
  %120 = icmp sle i32 %118, %119, !dbg !3890
  br i1 %120, label %121, label %258, !dbg !3887

121:                                              ; preds = %117
  %122 = load ptr, ptr %2, align 8, !dbg !3891
  %123 = getelementptr inbounds nuw %struct.player, ptr %122, i32 0, i32 8, !dbg !3894
  %124 = load i32, ptr %123, align 4, !dbg !3894
  %125 = load i32, ptr %3, align 4, !dbg !3895
  %126 = icmp sge i32 %124, %125, !dbg !3896
  br i1 %126, label %127, label %255, !dbg !3897

127:                                              ; preds = %121
  %128 = load i32, ptr %5, align 4, !dbg !3898
  %129 = load i32, ptr %4, align 4, !dbg !3899
  %130 = icmp sge i32 %128, %129, !dbg !3900
  br i1 %130, label %131, label %255, !dbg !3897

131:                                              ; preds = %127
    #dbg_declare(ptr %10, !3901, !DIExpression(), !3903)
    #dbg_declare(ptr %11, !3904, !DIExpression(), !3905)
  %132 = load i32, ptr @Laser_rapid_fire, align 4, !dbg !3906
  %133 = icmp ne i32 %132, 12245589, !dbg !3908
  br i1 %133, label %134, label %142, !dbg !3908

134:                                              ; preds = %131
  %135 = load i32, ptr %6, align 4, !dbg !3909
  %136 = sext i32 %135 to i64, !dbg !3910
  %137 = getelementptr inbounds [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %136, !dbg !3910
  %138 = getelementptr inbounds nuw %struct.weapon_info, ptr %137, i32 0, i32 23, !dbg !3911
  %139 = load i32, ptr %138, align 4, !dbg !3911
  %140 = load i32, ptr @Next_laser_fire_time, align 4, !dbg !3912
  %141 = add nsw i32 %140, %139, !dbg !3912
  store i32 %141, ptr @Next_laser_fire_time, align 4, !dbg !3912
  br label %145, !dbg !3913

142:                                              ; preds = %131
  %143 = load i32, ptr @Next_laser_fire_time, align 4, !dbg !3914
  %144 = add nsw i32 %143, 2621, !dbg !3914
  store i32 %144, ptr @Next_laser_fire_time, align 4, !dbg !3914
  br label %145

145:                                              ; preds = %142, %134
  %146 = load i32, ptr @Player_num, align 4, !dbg !3915
  %147 = sext i32 %146 to i64, !dbg !3916
  %148 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %147, !dbg !3916
  %149 = getelementptr inbounds nuw %struct.player, ptr %148, i32 0, i32 12, !dbg !3917
  %150 = load i8, ptr %149, align 2, !dbg !3917
  %151 = zext i8 %150 to i32, !dbg !3916
  store i32 %151, ptr %10, align 4, !dbg !3918
  store i32 0, ptr %11, align 4, !dbg !3919
  %152 = load i8, ptr @Primary_weapon, align 1, !dbg !3920
  %153 = sext i8 %152 to i32, !dbg !3920
  %154 = icmp eq i32 %153, 2, !dbg !3922
  br i1 %154, label %155, label %166, !dbg !3922

155:                                              ; preds = %145
  %156 = load i32, ptr @_ZZ22do_laser_firing_playervE17Spreadfire_toggle, align 4, !dbg !3923
  %157 = icmp ne i32 %156, 0, !dbg !3923
  br i1 %157, label %158, label %161, !dbg !3923

158:                                              ; preds = %155
  %159 = load i32, ptr %11, align 4, !dbg !3926
  %160 = or i32 %159, 2, !dbg !3926
  store i32 %160, ptr %11, align 4, !dbg !3926
  br label %161, !dbg !3927

161:                                              ; preds = %158, %155
  %162 = load i32, ptr @_ZZ22do_laser_firing_playervE17Spreadfire_toggle, align 4, !dbg !3928
  %163 = icmp ne i32 %162, 0, !dbg !3928
  %164 = xor i1 %163, true, !dbg !3929
  %165 = zext i1 %164 to i32, !dbg !3929
  store i32 %165, ptr @_ZZ22do_laser_firing_playervE17Spreadfire_toggle, align 4, !dbg !3930
  br label %166, !dbg !3931

166:                                              ; preds = %161, %145
  %167 = load i8, ptr @Primary_weapon, align 1, !dbg !3932
  %168 = sext i8 %167 to i32, !dbg !3932
  %169 = icmp eq i32 %168, 7, !dbg !3934
  br i1 %169, label %170, label %178, !dbg !3934

170:                                              ; preds = %166
  %171 = load i32, ptr @_ZZ22do_laser_firing_playervE17Helix_orientation, align 4, !dbg !3935
  %172 = add nsw i32 %171, 1, !dbg !3935
  store i32 %172, ptr @_ZZ22do_laser_firing_playervE17Helix_orientation, align 4, !dbg !3935
  %173 = load i32, ptr @_ZZ22do_laser_firing_playervE17Helix_orientation, align 4, !dbg !3937
  %174 = and i32 %173, 7, !dbg !3938
  %175 = shl i32 %174, 2, !dbg !3939
  %176 = load i32, ptr %11, align 4, !dbg !3940
  %177 = or i32 %176, %175, !dbg !3940
  store i32 %177, ptr %11, align 4, !dbg !3940
  br label %178, !dbg !3941

178:                                              ; preds = %170, %166
  %179 = load i32, ptr @Player_num, align 4, !dbg !3942
  %180 = sext i32 %179 to i64, !dbg !3944
  %181 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %180, !dbg !3944
  %182 = getelementptr inbounds nuw %struct.player, ptr %181, i32 0, i32 7, !dbg !3945
  %183 = load i32, ptr %182, align 4, !dbg !3945
  %184 = and i32 %183, 1024, !dbg !3946
  %185 = icmp ne i32 %184, 0, !dbg !3944
  br i1 %185, label %186, label %189, !dbg !3944

186:                                              ; preds = %178
  %187 = load i32, ptr %11, align 4, !dbg !3947
  %188 = or i32 %187, 1, !dbg !3947
  store i32 %188, ptr %11, align 4, !dbg !3947
  br label %189, !dbg !3948

189:                                              ; preds = %186, %178
  %190 = load i32, ptr @Player_num, align 4, !dbg !3949
  %191 = sext i32 %190 to i64, !dbg !3950
  %192 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %191, !dbg !3950
  %193 = getelementptr inbounds nuw %struct.player, ptr %192, i32 0, i32 4, !dbg !3951
  %194 = load i32, ptr %193, align 4, !dbg !3951
  %195 = load i8, ptr @Primary_weapon, align 1, !dbg !3952
  %196 = sext i8 %195 to i32, !dbg !3952
  %197 = load i32, ptr %10, align 4, !dbg !3953
  %198 = load i32, ptr %11, align 4, !dbg !3954
  %199 = load i32, ptr %8, align 4, !dbg !3955
  %200 = call noundef i32 @_Z15do_laser_firingiiiii(i32 noundef %194, i32 noundef %196, i32 noundef %197, i32 noundef %198, i32 noundef %199), !dbg !3956
  %201 = load i32, ptr %7, align 4, !dbg !3957
  %202 = add nsw i32 %201, %200, !dbg !3957
  store i32 %202, ptr %7, align 4, !dbg !3957
  %203 = load i32, ptr %3, align 4, !dbg !3958
  %204 = load i32, ptr %7, align 4, !dbg !3959
  %205 = mul nsw i32 %203, %204, !dbg !3960
  %206 = load i32, ptr %6, align 4, !dbg !3961
  %207 = sext i32 %206 to i64, !dbg !3962
  %208 = getelementptr inbounds [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %207, !dbg !3962
  %209 = getelementptr inbounds nuw %struct.weapon_info, ptr %208, i32 0, i32 8, !dbg !3963
  %210 = load i8, ptr %209, align 1, !dbg !3963
  %211 = sext i8 %210 to i32, !dbg !3962
  %212 = sdiv i32 %205, %211, !dbg !3964
  %213 = load ptr, ptr %2, align 8, !dbg !3965
  %214 = getelementptr inbounds nuw %struct.player, ptr %213, i32 0, i32 8, !dbg !3966
  %215 = load i32, ptr %214, align 4, !dbg !3967
  %216 = sub nsw i32 %215, %212, !dbg !3967
  store i32 %216, ptr %214, align 4, !dbg !3967
  %217 = load ptr, ptr %2, align 8, !dbg !3968
  %218 = getelementptr inbounds nuw %struct.player, ptr %217, i32 0, i32 8, !dbg !3970
  %219 = load i32, ptr %218, align 4, !dbg !3970
  %220 = icmp slt i32 %219, 0, !dbg !3971
  br i1 %220, label %221, label %224, !dbg !3971

221:                                              ; preds = %189
  %222 = load ptr, ptr %2, align 8, !dbg !3972
  %223 = getelementptr inbounds nuw %struct.player, ptr %222, i32 0, i32 8, !dbg !3973
  store i32 0, ptr %223, align 4, !dbg !3974
  br label %224, !dbg !3972

224:                                              ; preds = %221, %189
  %225 = load i8, ptr @Primary_weapon, align 1, !dbg !3975
  %226 = sext i8 %225 to i32, !dbg !3975
  %227 = icmp eq i32 %226, 1, !dbg !3977
  br i1 %227, label %232, label %228, !dbg !3978

228:                                              ; preds = %224
  %229 = load i8, ptr @Primary_weapon, align 1, !dbg !3979
  %230 = sext i8 %229 to i32, !dbg !3979
  %231 = icmp eq i32 %230, 6, !dbg !3980
  br i1 %231, label %232, label %254, !dbg !3978

232:                                              ; preds = %228, %224
  %233 = load i32, ptr %4, align 4, !dbg !3981
  %234 = load ptr, ptr %2, align 8, !dbg !3984
  %235 = getelementptr inbounds nuw %struct.player, ptr %234, i32 0, i32 17, !dbg !3985
  %236 = getelementptr inbounds [10 x i16], ptr %235, i64 0, i64 1, !dbg !3984
  %237 = load i16, ptr %236, align 2, !dbg !3984
  %238 = zext i16 %237 to i32, !dbg !3984
  %239 = icmp sgt i32 %233, %238, !dbg !3986
  br i1 %239, label %240, label %244, !dbg !3986

240:                                              ; preds = %232
  %241 = load ptr, ptr %2, align 8, !dbg !3987
  %242 = getelementptr inbounds nuw %struct.player, ptr %241, i32 0, i32 17, !dbg !3988
  %243 = getelementptr inbounds [10 x i16], ptr %242, i64 0, i64 1, !dbg !3987
  store i16 0, ptr %243, align 2, !dbg !3989
  br label %253, !dbg !3987

244:                                              ; preds = %232
  %245 = load i32, ptr %4, align 4, !dbg !3990
  %246 = load ptr, ptr %2, align 8, !dbg !3991
  %247 = getelementptr inbounds nuw %struct.player, ptr %246, i32 0, i32 17, !dbg !3992
  %248 = getelementptr inbounds [10 x i16], ptr %247, i64 0, i64 1, !dbg !3991
  %249 = load i16, ptr %248, align 2, !dbg !3993
  %250 = zext i16 %249 to i32, !dbg !3993
  %251 = sub nsw i32 %250, %245, !dbg !3993
  %252 = trunc i32 %251 to i16, !dbg !3993
  store i16 %252, ptr %248, align 2, !dbg !3993
  br label %253

253:                                              ; preds = %244, %240
  br label %254, !dbg !3994

254:                                              ; preds = %253, %228
  call void @_Z18auto_select_weaponi(i32 noundef 0), !dbg !3995
  br label %257, !dbg !3996

255:                                              ; preds = %127, %121
  call void @_Z18auto_select_weaponi(i32 noundef 0), !dbg !3997
  %256 = load i32, ptr @GameTime, align 4, !dbg !3999
  store i32 %256, ptr @Next_laser_fire_time, align 4, !dbg !4000
  br label %259, !dbg !4001

257:                                              ; preds = %254
  br label %117, !dbg !3887, !llvm.loop !4002

258:                                              ; preds = %117
  br label %259, !dbg !4004

259:                                              ; preds = %258, %255
  store i32 0, ptr @Global_laser_firing_count, align 4, !dbg !4004
  %260 = load i32, ptr %7, align 4, !dbg !4005
  store i32 %260, ptr %1, align 4, !dbg !4006
  br label %261, !dbg !4006

261:                                              ; preds = %259, %17
  %262 = load i32, ptr %1, align 4, !dbg !4007
  ret i32 %262, !dbg !4007
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z15do_laser_firingiiiii(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4) #0 !dbg !4008 {
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca %struct.vms_vector, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  store i32 %0, ptr %6, align 4
    #dbg_declare(ptr %6, !4011, !DIExpression(), !4012)
  store i32 %1, ptr %7, align 4
    #dbg_declare(ptr %7, !4013, !DIExpression(), !4014)
  store i32 %2, ptr %8, align 4
    #dbg_declare(ptr %8, !4015, !DIExpression(), !4016)
  store i32 %3, ptr %9, align 4
    #dbg_declare(ptr %9, !4017, !DIExpression(), !4018)
  store i32 %4, ptr %10, align 4
    #dbg_declare(ptr %10, !4019, !DIExpression(), !4020)
    #dbg_declare(ptr %11, !4021, !DIExpression(), !4022)
  %20 = load i32, ptr %6, align 4, !dbg !4023
  %21 = sext i32 %20 to i64, !dbg !4024
  %22 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %21, !dbg !4024
  store ptr %22, ptr %11, align 8, !dbg !4022
  %23 = load i32, ptr %7, align 4, !dbg !4025
  switch i32 %23, label %288 [
    i32 0, label %24
    i32 1, label %53
    i32 2, label %84
    i32 3, label %97
    i32 4, label %110
    i32 5, label %164
    i32 6, label %178
    i32 7, label %215
    i32 8, label %252
    i32 9, label %265
  ], !dbg !4026

24:                                               ; preds = %5
    #dbg_declare(ptr %12, !4027, !DIExpression(), !4030)
  %25 = call noundef i32 @_Z6P_Randv(), !dbg !4031
  %26 = srem i32 %25, 8, !dbg !4032
  %27 = mul nsw i32 131072, %26, !dbg !4033
  %28 = sdiv i32 %27, 8, !dbg !4034
  store i32 %28, ptr @Laser_offset, align 4, !dbg !4035
  %29 = load i32, ptr %8, align 4, !dbg !4036
  %30 = icmp sle i32 %29, 3, !dbg !4038
  br i1 %30, label %31, label %34, !dbg !4038

31:                                               ; preds = %24
  %32 = load i32, ptr %8, align 4, !dbg !4039
  %33 = add nsw i32 0, %32, !dbg !4040
  store i32 %33, ptr %12, align 4, !dbg !4041
  br label %39, !dbg !4042

34:                                               ; preds = %24
  %35 = load i32, ptr %8, align 4, !dbg !4043
  %36 = sub nsw i32 %35, 3, !dbg !4044
  %37 = sub nsw i32 %36, 1, !dbg !4045
  %38 = add nsw i32 30, %37, !dbg !4046
  store i32 %38, ptr %12, align 4, !dbg !4047
  br label %39

39:                                               ; preds = %34, %31
  %40 = load ptr, ptr %11, align 8, !dbg !4048
  %41 = load i32, ptr %12, align 4, !dbg !4049
  call void @_Z17Laser_player_fireP6objectiiii(ptr noundef %40, i32 noundef %41, i32 noundef 0, i32 noundef 1, i32 noundef 0), !dbg !4050
  %42 = load ptr, ptr %11, align 8, !dbg !4051
  %43 = load i32, ptr %12, align 4, !dbg !4052
  call void @_Z17Laser_player_fireP6objectiiii(ptr noundef %42, i32 noundef %43, i32 noundef 1, i32 noundef 0, i32 noundef 0), !dbg !4053
  %44 = load i32, ptr %9, align 4, !dbg !4054
  %45 = and i32 %44, 1, !dbg !4056
  %46 = icmp ne i32 %45, 0, !dbg !4054
  br i1 %46, label %47, label %52, !dbg !4054

47:                                               ; preds = %39
  %48 = load ptr, ptr %11, align 8, !dbg !4057
  %49 = load i32, ptr %12, align 4, !dbg !4059
  call void @_Z17Laser_player_fireP6objectiiii(ptr noundef %48, i32 noundef %49, i32 noundef 2, i32 noundef 0, i32 noundef 0), !dbg !4060
  %50 = load ptr, ptr %11, align 8, !dbg !4061
  %51 = load i32, ptr %12, align 4, !dbg !4062
  call void @_Z17Laser_player_fireP6objectiiii(ptr noundef %50, i32 noundef %51, i32 noundef 3, i32 noundef 0, i32 noundef 0), !dbg !4063
  br label %52, !dbg !4064

52:                                               ; preds = %47, %39
  br label %289, !dbg !4065

53:                                               ; preds = %5
    #dbg_declare(ptr %13, !4066, !DIExpression(), !4068)
  store i32 1, ptr %13, align 4, !dbg !4068
  %54 = load ptr, ptr %11, align 8, !dbg !4069
  %55 = call noundef i32 @_Z6P_Randv(), !dbg !4070
  %56 = sdiv i32 %55, 8, !dbg !4071
  %57 = sub nsw i32 %56, 2047, !dbg !4072
  %58 = call noundef i32 @_Z6P_Randv(), !dbg !4073
  %59 = sdiv i32 %58, 8, !dbg !4074
  %60 = sub nsw i32 %59, 2047, !dbg !4075
  %61 = load i32, ptr %13, align 4, !dbg !4076
  call void @_Z24Laser_player_fire_spreadP6objectiiiiii(ptr noundef %54, i32 noundef 11, i32 noundef 6, i32 noundef %57, i32 noundef %60, i32 noundef %61, i32 noundef 0), !dbg !4077
  %62 = load i32, ptr %10, align 4, !dbg !4078
  %63 = icmp sgt i32 %62, 1, !dbg !4080
  br i1 %63, label %64, label %83, !dbg !4080

64:                                               ; preds = %53
  %65 = load ptr, ptr %11, align 8, !dbg !4081
  %66 = call noundef i32 @_Z6P_Randv(), !dbg !4083
  %67 = sdiv i32 %66, 8, !dbg !4084
  %68 = sub nsw i32 %67, 2047, !dbg !4085
  %69 = call noundef i32 @_Z6P_Randv(), !dbg !4086
  %70 = sdiv i32 %69, 8, !dbg !4087
  %71 = sub nsw i32 %70, 2047, !dbg !4088
  call void @_Z24Laser_player_fire_spreadP6objectiiiiii(ptr noundef %65, i32 noundef 11, i32 noundef 6, i32 noundef %68, i32 noundef %71, i32 noundef 0, i32 noundef 0), !dbg !4089
  %72 = load i32, ptr %10, align 4, !dbg !4090
  %73 = icmp sgt i32 %72, 2, !dbg !4092
  br i1 %73, label %74, label %82, !dbg !4092

74:                                               ; preds = %64
  %75 = load ptr, ptr %11, align 8, !dbg !4093
  %76 = call noundef i32 @_Z6P_Randv(), !dbg !4095
  %77 = sdiv i32 %76, 8, !dbg !4096
  %78 = sub nsw i32 %77, 2047, !dbg !4097
  %79 = call noundef i32 @_Z6P_Randv(), !dbg !4098
  %80 = sdiv i32 %79, 8, !dbg !4099
  %81 = sub nsw i32 %80, 2047, !dbg !4100
  call void @_Z24Laser_player_fire_spreadP6objectiiiiii(ptr noundef %75, i32 noundef 11, i32 noundef 6, i32 noundef %78, i32 noundef %81, i32 noundef 0, i32 noundef 0), !dbg !4101
  br label %82, !dbg !4102

82:                                               ; preds = %74, %64
  br label %83, !dbg !4103

83:                                               ; preds = %82, %53
  br label %289, !dbg !4104

84:                                               ; preds = %5
  %85 = load i32, ptr %9, align 4, !dbg !4105
  %86 = and i32 %85, 2, !dbg !4107
  %87 = icmp ne i32 %86, 0, !dbg !4105
  br i1 %87, label %88, label %92, !dbg !4105

88:                                               ; preds = %84
  %89 = load ptr, ptr %11, align 8, !dbg !4108
  call void @_Z24Laser_player_fire_spreadP6objectiiiiii(ptr noundef %89, i32 noundef 12, i32 noundef 6, i32 noundef 4096, i32 noundef 0, i32 noundef 0, i32 noundef 0), !dbg !4110
  %90 = load ptr, ptr %11, align 8, !dbg !4111
  call void @_Z24Laser_player_fire_spreadP6objectiiiiii(ptr noundef %90, i32 noundef 12, i32 noundef 6, i32 noundef -4096, i32 noundef 0, i32 noundef 0, i32 noundef 0), !dbg !4112
  %91 = load ptr, ptr %11, align 8, !dbg !4113
  call void @_Z24Laser_player_fire_spreadP6objectiiiiii(ptr noundef %91, i32 noundef 12, i32 noundef 6, i32 noundef 0, i32 noundef 0, i32 noundef 1, i32 noundef 0), !dbg !4114
  br label %96, !dbg !4115

92:                                               ; preds = %84
  %93 = load ptr, ptr %11, align 8, !dbg !4116
  call void @_Z24Laser_player_fire_spreadP6objectiiiiii(ptr noundef %93, i32 noundef 12, i32 noundef 6, i32 noundef 0, i32 noundef 4096, i32 noundef 0, i32 noundef 0), !dbg !4118
  %94 = load ptr, ptr %11, align 8, !dbg !4119
  call void @_Z24Laser_player_fire_spreadP6objectiiiiii(ptr noundef %94, i32 noundef 12, i32 noundef 6, i32 noundef 0, i32 noundef -4096, i32 noundef 0, i32 noundef 0), !dbg !4120
  %95 = load ptr, ptr %11, align 8, !dbg !4121
  call void @_Z24Laser_player_fire_spreadP6objectiiiiii(ptr noundef %95, i32 noundef 12, i32 noundef 6, i32 noundef 0, i32 noundef 0, i32 noundef 1, i32 noundef 0), !dbg !4122
  br label %96

96:                                               ; preds = %92, %88
  br label %289, !dbg !4123

97:                                               ; preds = %5
  %98 = load ptr, ptr %11, align 8, !dbg !4124
  call void @_Z17Laser_player_fireP6objectiiii(ptr noundef %98, i32 noundef 13, i32 noundef 0, i32 noundef 1, i32 noundef 0), !dbg !4125
  %99 = load ptr, ptr %11, align 8, !dbg !4126
  call void @_Z17Laser_player_fireP6objectiiii(ptr noundef %99, i32 noundef 13, i32 noundef 1, i32 noundef 0, i32 noundef 0), !dbg !4127
  %100 = load i32, ptr %10, align 4, !dbg !4128
  %101 = icmp sgt i32 %100, 1, !dbg !4130
  br i1 %101, label %102, label %109, !dbg !4130

102:                                              ; preds = %97
  %103 = load ptr, ptr %11, align 8, !dbg !4131
  %104 = load i32, ptr @FrameTime, align 4, !dbg !4133
  %105 = sdiv i32 %104, 2, !dbg !4134
  call void @_Z30Laser_player_fire_spread_delayP6objectiiiiiii(ptr noundef %103, i32 noundef 13, i32 noundef 0, i32 noundef 0, i32 noundef 0, i32 noundef %105, i32 noundef 1, i32 noundef 0), !dbg !4135
  %106 = load ptr, ptr %11, align 8, !dbg !4136
  %107 = load i32, ptr @FrameTime, align 4, !dbg !4137
  %108 = sdiv i32 %107, 2, !dbg !4138
  call void @_Z30Laser_player_fire_spread_delayP6objectiiiiiii(ptr noundef %106, i32 noundef 13, i32 noundef 1, i32 noundef 0, i32 noundef 0, i32 noundef %108, i32 noundef 0, i32 noundef 0), !dbg !4139
  br label %109, !dbg !4140

109:                                              ; preds = %102, %97
  br label %289, !dbg !4141

110:                                              ; preds = %5
    #dbg_declare(ptr %14, !4142, !DIExpression(), !4144)
  %111 = load ptr, ptr %11, align 8, !dbg !4145
  call void @_Z17Laser_player_fireP6objectiiii(ptr noundef %111, i32 noundef 14, i32 noundef 0, i32 noundef 1, i32 noundef 0), !dbg !4146
  %112 = load ptr, ptr %11, align 8, !dbg !4147
  call void @_Z17Laser_player_fireP6objectiiii(ptr noundef %112, i32 noundef 14, i32 noundef 1, i32 noundef 1, i32 noundef 0), !dbg !4148
  %113 = load i32, ptr @Fusion_charge, align 4, !dbg !4149
  %114 = ashr i32 %113, 12, !dbg !4150
  %115 = trunc i32 %114 to i8, !dbg !4151
  %116 = sext i8 %115 to i32, !dbg !4152
  store i32 %116, ptr %9, align 4, !dbg !4153
  store i32 0, ptr @Fusion_charge, align 4, !dbg !4154
  %117 = load ptr, ptr %11, align 8, !dbg !4155
  %118 = getelementptr inbounds nuw %struct.object, ptr %117, i32 0, i32 12, !dbg !4156
  %119 = getelementptr inbounds nuw %struct.vms_matrix, ptr %118, i32 0, i32 2, !dbg !4157
  %120 = getelementptr inbounds nuw %struct.vms_vector, ptr %119, i32 0, i32 0, !dbg !4158
  %121 = load i32, ptr %120, align 4, !dbg !4158
  %122 = shl i32 %121, 7, !dbg !4159
  %123 = sub nsw i32 0, %122, !dbg !4160
  %124 = getelementptr inbounds nuw %struct.vms_vector, ptr %14, i32 0, i32 0, !dbg !4161
  store i32 %123, ptr %124, align 4, !dbg !4162
  %125 = load ptr, ptr %11, align 8, !dbg !4163
  %126 = getelementptr inbounds nuw %struct.object, ptr %125, i32 0, i32 12, !dbg !4164
  %127 = getelementptr inbounds nuw %struct.vms_matrix, ptr %126, i32 0, i32 2, !dbg !4165
  %128 = getelementptr inbounds nuw %struct.vms_vector, ptr %127, i32 0, i32 1, !dbg !4166
  %129 = load i32, ptr %128, align 4, !dbg !4166
  %130 = shl i32 %129, 7, !dbg !4167
  %131 = sub nsw i32 0, %130, !dbg !4168
  %132 = getelementptr inbounds nuw %struct.vms_vector, ptr %14, i32 0, i32 1, !dbg !4169
  store i32 %131, ptr %132, align 4, !dbg !4170
  %133 = load ptr, ptr %11, align 8, !dbg !4171
  %134 = getelementptr inbounds nuw %struct.object, ptr %133, i32 0, i32 12, !dbg !4172
  %135 = getelementptr inbounds nuw %struct.vms_matrix, ptr %134, i32 0, i32 2, !dbg !4173
  %136 = getelementptr inbounds nuw %struct.vms_vector, ptr %135, i32 0, i32 2, !dbg !4174
  %137 = load i32, ptr %136, align 4, !dbg !4174
  %138 = shl i32 %137, 7, !dbg !4175
  %139 = sub nsw i32 0, %138, !dbg !4176
  %140 = getelementptr inbounds nuw %struct.vms_vector, ptr %14, i32 0, i32 2, !dbg !4177
  store i32 %139, ptr %140, align 4, !dbg !4178
  %141 = load ptr, ptr %11, align 8, !dbg !4179
  call void @_Z16phys_apply_forceP6objectP10vms_vector(ptr noundef %141, ptr noundef %14), !dbg !4180
  %142 = getelementptr inbounds nuw %struct.vms_vector, ptr %14, i32 0, i32 0, !dbg !4181
  %143 = load i32, ptr %142, align 4, !dbg !4181
  %144 = ashr i32 %143, 4, !dbg !4182
  %145 = call noundef i32 @_Z6P_Randv(), !dbg !4183
  %146 = add nsw i32 %144, %145, !dbg !4184
  %147 = sub nsw i32 %146, 16384, !dbg !4185
  %148 = getelementptr inbounds nuw %struct.vms_vector, ptr %14, i32 0, i32 0, !dbg !4186
  store i32 %147, ptr %148, align 4, !dbg !4187
  %149 = getelementptr inbounds nuw %struct.vms_vector, ptr %14, i32 0, i32 1, !dbg !4188
  %150 = load i32, ptr %149, align 4, !dbg !4188
  %151 = ashr i32 %150, 4, !dbg !4189
  %152 = call noundef i32 @_Z6P_Randv(), !dbg !4190
  %153 = add nsw i32 %151, %152, !dbg !4191
  %154 = sub nsw i32 %153, 16384, !dbg !4192
  %155 = getelementptr inbounds nuw %struct.vms_vector, ptr %14, i32 0, i32 1, !dbg !4193
  store i32 %154, ptr %155, align 4, !dbg !4194
  %156 = getelementptr inbounds nuw %struct.vms_vector, ptr %14, i32 0, i32 2, !dbg !4195
  %157 = load i32, ptr %156, align 4, !dbg !4195
  %158 = ashr i32 %157, 4, !dbg !4196
  %159 = call noundef i32 @_Z6P_Randv(), !dbg !4197
  %160 = add nsw i32 %158, %159, !dbg !4198
  %161 = sub nsw i32 %160, 16384, !dbg !4199
  %162 = getelementptr inbounds nuw %struct.vms_vector, ptr %14, i32 0, i32 2, !dbg !4200
  store i32 %161, ptr %162, align 4, !dbg !4201
  %163 = load ptr, ptr %11, align 8, !dbg !4202
  call void @_Z14phys_apply_rotP6objectP10vms_vector(ptr noundef %163, ptr noundef %14), !dbg !4203
  br label %289, !dbg !4204

164:                                              ; preds = %5
    #dbg_declare(ptr %15, !4205, !DIExpression(), !4207)
  store i32 3, ptr %15, align 4, !dbg !4207
  %165 = load ptr, ptr %11, align 8, !dbg !4208
  %166 = load i32, ptr %15, align 4, !dbg !4209
  call void @_Z17Laser_player_fireP6objectiiii(ptr noundef %165, i32 noundef %166, i32 noundef 0, i32 noundef 1, i32 noundef 0), !dbg !4210
  %167 = load ptr, ptr %11, align 8, !dbg !4211
  %168 = load i32, ptr %15, align 4, !dbg !4212
  call void @_Z17Laser_player_fireP6objectiiii(ptr noundef %167, i32 noundef %168, i32 noundef 1, i32 noundef 0, i32 noundef 0), !dbg !4213
  %169 = load i32, ptr %9, align 4, !dbg !4214
  %170 = and i32 %169, 1, !dbg !4216
  %171 = icmp ne i32 %170, 0, !dbg !4214
  br i1 %171, label %172, label %177, !dbg !4214

172:                                              ; preds = %164
  %173 = load ptr, ptr %11, align 8, !dbg !4217
  %174 = load i32, ptr %15, align 4, !dbg !4219
  call void @_Z17Laser_player_fireP6objectiiii(ptr noundef %173, i32 noundef %174, i32 noundef 2, i32 noundef 0, i32 noundef 0), !dbg !4220
  %175 = load ptr, ptr %11, align 8, !dbg !4221
  %176 = load i32, ptr %15, align 4, !dbg !4222
  call void @_Z17Laser_player_fireP6objectiiii(ptr noundef %175, i32 noundef %176, i32 noundef 3, i32 noundef 0, i32 noundef 0), !dbg !4223
  br label %177, !dbg !4224

177:                                              ; preds = %172, %164
  br label %289, !dbg !4225

178:                                              ; preds = %5
    #dbg_declare(ptr %16, !4226, !DIExpression(), !4228)
  store i32 1, ptr %16, align 4, !dbg !4228
  %179 = load ptr, ptr %11, align 8, !dbg !4229
  %180 = call noundef i32 @_Z6P_Randv(), !dbg !4230
  %181 = sdiv i32 %180, 8, !dbg !4231
  %182 = sub nsw i32 %181, 2047, !dbg !4232
  %183 = sdiv i32 %182, 5, !dbg !4233
  %184 = call noundef i32 @_Z6P_Randv(), !dbg !4234
  %185 = sdiv i32 %184, 8, !dbg !4235
  %186 = sub nsw i32 %185, 2047, !dbg !4236
  %187 = sdiv i32 %186, 5, !dbg !4237
  %188 = load i32, ptr %16, align 4, !dbg !4238
  call void @_Z24Laser_player_fire_spreadP6objectiiiiii(ptr noundef %179, i32 noundef 32, i32 noundef 6, i32 noundef %183, i32 noundef %187, i32 noundef %188, i32 noundef 0), !dbg !4239
  %189 = load i32, ptr %10, align 4, !dbg !4240
  %190 = icmp sgt i32 %189, 1, !dbg !4242
  br i1 %190, label %191, label %214, !dbg !4242

191:                                              ; preds = %178
  %192 = load ptr, ptr %11, align 8, !dbg !4243
  %193 = call noundef i32 @_Z6P_Randv(), !dbg !4245
  %194 = sdiv i32 %193, 8, !dbg !4246
  %195 = sub nsw i32 %194, 2047, !dbg !4247
  %196 = sdiv i32 %195, 5, !dbg !4248
  %197 = call noundef i32 @_Z6P_Randv(), !dbg !4249
  %198 = sdiv i32 %197, 8, !dbg !4250
  %199 = sub nsw i32 %198, 2047, !dbg !4251
  %200 = sdiv i32 %199, 5, !dbg !4252
  call void @_Z24Laser_player_fire_spreadP6objectiiiiii(ptr noundef %192, i32 noundef 32, i32 noundef 6, i32 noundef %196, i32 noundef %200, i32 noundef 0, i32 noundef 0), !dbg !4253
  %201 = load i32, ptr %10, align 4, !dbg !4254
  %202 = icmp sgt i32 %201, 2, !dbg !4256
  br i1 %202, label %203, label %213, !dbg !4256

203:                                              ; preds = %191
  %204 = load ptr, ptr %11, align 8, !dbg !4257
  %205 = call noundef i32 @_Z6P_Randv(), !dbg !4259
  %206 = sdiv i32 %205, 8, !dbg !4260
  %207 = sub nsw i32 %206, 2047, !dbg !4261
  %208 = sdiv i32 %207, 5, !dbg !4262
  %209 = call noundef i32 @_Z6P_Randv(), !dbg !4263
  %210 = sdiv i32 %209, 8, !dbg !4264
  %211 = sub nsw i32 %210, 2047, !dbg !4265
  %212 = sdiv i32 %211, 5, !dbg !4266
  call void @_Z24Laser_player_fire_spreadP6objectiiiiii(ptr noundef %204, i32 noundef 32, i32 noundef 6, i32 noundef %208, i32 noundef %212, i32 noundef 0, i32 noundef 0), !dbg !4267
  br label %213, !dbg !4268

213:                                              ; preds = %203, %191
  br label %214, !dbg !4269

214:                                              ; preds = %213, %178
  br label %289, !dbg !4270

215:                                              ; preds = %5
    #dbg_declare(ptr %17, !4271, !DIExpression(), !4273)
    #dbg_declare(ptr %18, !4274, !DIExpression(), !4275)
    #dbg_declare(ptr %19, !4276, !DIExpression(), !4277)
  %216 = load i32, ptr %9, align 4, !dbg !4278
  %217 = ashr i32 %216, 2, !dbg !4279
  %218 = and i32 %217, 7, !dbg !4280
  store i32 %218, ptr %17, align 4, !dbg !4281
  %219 = load i32, ptr %17, align 4, !dbg !4282
  switch i32 %219, label %228 [
    i32 0, label %220
    i32 1, label %221
    i32 2, label %222
    i32 3, label %223
    i32 4, label %224
    i32 5, label %225
    i32 6, label %226
    i32 7, label %227
  ], !dbg !4283

220:                                              ; preds = %215
  store i32 4096, ptr %18, align 4, !dbg !4284
  store i32 0, ptr %19, align 4, !dbg !4286
  br label %230, !dbg !4287

221:                                              ; preds = %215
  store i32 3855, ptr %18, align 4, !dbg !4288
  store i32 1560, ptr %19, align 4, !dbg !4289
  br label %230, !dbg !4290

222:                                              ; preds = %215
  store i32 2978, ptr %18, align 4, !dbg !4291
  store i32 2978, ptr %19, align 4, !dbg !4292
  br label %230, !dbg !4293

223:                                              ; preds = %215
  store i32 1560, ptr %18, align 4, !dbg !4294
  store i32 3855, ptr %19, align 4, !dbg !4295
  br label %230, !dbg !4296

224:                                              ; preds = %215
  store i32 0, ptr %18, align 4, !dbg !4297
  store i32 4096, ptr %19, align 4, !dbg !4298
  br label %230, !dbg !4299

225:                                              ; preds = %215
  store i32 -1560, ptr %18, align 4, !dbg !4300
  store i32 3855, ptr %19, align 4, !dbg !4301
  br label %230, !dbg !4302

226:                                              ; preds = %215
  store i32 -2978, ptr %18, align 4, !dbg !4303
  store i32 2978, ptr %19, align 4, !dbg !4304
  br label %230, !dbg !4305

227:                                              ; preds = %215
  store i32 -3855, ptr %18, align 4, !dbg !4306
  store i32 1560, ptr %19, align 4, !dbg !4307
  br label %230, !dbg !4308

228:                                              ; preds = %215
  %229 = load i32, ptr %17, align 4, !dbg !4309
  call void (ptr, ...) @_Z5ErrorPKcz(ptr noundef @.str.23, i32 noundef %229), !dbg !4310
  br label %230, !dbg !4311

230:                                              ; preds = %228, %227, %226, %225, %224, %223, %222, %221, %220
  %231 = load ptr, ptr %11, align 8, !dbg !4312
  call void @_Z24Laser_player_fire_spreadP6objectiiiiii(ptr noundef %231, i32 noundef 33, i32 noundef 6, i32 noundef 0, i32 noundef 0, i32 noundef 1, i32 noundef 0), !dbg !4313
  %232 = load ptr, ptr %11, align 8, !dbg !4314
  %233 = load i32, ptr %18, align 4, !dbg !4315
  %234 = load i32, ptr %19, align 4, !dbg !4316
  call void @_Z24Laser_player_fire_spreadP6objectiiiiii(ptr noundef %232, i32 noundef 33, i32 noundef 6, i32 noundef %233, i32 noundef %234, i32 noundef 0, i32 noundef 0), !dbg !4317
  %235 = load ptr, ptr %11, align 8, !dbg !4318
  %236 = load i32, ptr %18, align 4, !dbg !4319
  %237 = sub nsw i32 0, %236, !dbg !4320
  %238 = load i32, ptr %19, align 4, !dbg !4321
  %239 = sub nsw i32 0, %238, !dbg !4322
  call void @_Z24Laser_player_fire_spreadP6objectiiiiii(ptr noundef %235, i32 noundef 33, i32 noundef 6, i32 noundef %237, i32 noundef %239, i32 noundef 0, i32 noundef 0), !dbg !4323
  %240 = load ptr, ptr %11, align 8, !dbg !4324
  %241 = load i32, ptr %18, align 4, !dbg !4325
  %242 = mul nsw i32 %241, 2, !dbg !4326
  %243 = load i32, ptr %19, align 4, !dbg !4327
  %244 = mul nsw i32 %243, 2, !dbg !4328
  call void @_Z24Laser_player_fire_spreadP6objectiiiiii(ptr noundef %240, i32 noundef 33, i32 noundef 6, i32 noundef %242, i32 noundef %244, i32 noundef 0, i32 noundef 0), !dbg !4329
  %245 = load ptr, ptr %11, align 8, !dbg !4330
  %246 = load i32, ptr %18, align 4, !dbg !4331
  %247 = sub nsw i32 0, %246, !dbg !4332
  %248 = mul nsw i32 %247, 2, !dbg !4333
  %249 = load i32, ptr %19, align 4, !dbg !4334
  %250 = sub nsw i32 0, %249, !dbg !4335
  %251 = mul nsw i32 %250, 2, !dbg !4336
  call void @_Z24Laser_player_fire_spreadP6objectiiiiii(ptr noundef %245, i32 noundef 33, i32 noundef 6, i32 noundef %248, i32 noundef %251, i32 noundef 0, i32 noundef 0), !dbg !4337
  br label %289, !dbg !4338

252:                                              ; preds = %5
  %253 = load ptr, ptr %11, align 8, !dbg !4339
  call void @_Z17Laser_player_fireP6objectiiii(ptr noundef %253, i32 noundef 34, i32 noundef 0, i32 noundef 1, i32 noundef 0), !dbg !4340
  %254 = load ptr, ptr %11, align 8, !dbg !4341
  call void @_Z17Laser_player_fireP6objectiiii(ptr noundef %254, i32 noundef 34, i32 noundef 1, i32 noundef 0, i32 noundef 0), !dbg !4342
  %255 = load i32, ptr %10, align 4, !dbg !4343
  %256 = icmp sgt i32 %255, 1, !dbg !4345
  br i1 %256, label %257, label %264, !dbg !4345

257:                                              ; preds = %252
  %258 = load ptr, ptr %11, align 8, !dbg !4346
  %259 = load i32, ptr @FrameTime, align 4, !dbg !4348
  %260 = sdiv i32 %259, 2, !dbg !4349
  call void @_Z30Laser_player_fire_spread_delayP6objectiiiiiii(ptr noundef %258, i32 noundef 34, i32 noundef 0, i32 noundef 0, i32 noundef 0, i32 noundef %260, i32 noundef 1, i32 noundef 0), !dbg !4350
  %261 = load ptr, ptr %11, align 8, !dbg !4351
  %262 = load i32, ptr @FrameTime, align 4, !dbg !4352
  %263 = sdiv i32 %262, 2, !dbg !4353
  call void @_Z30Laser_player_fire_spread_delayP6objectiiiiiii(ptr noundef %261, i32 noundef 34, i32 noundef 1, i32 noundef 0, i32 noundef 0, i32 noundef %263, i32 noundef 0, i32 noundef 0), !dbg !4354
  br label %264, !dbg !4355

264:                                              ; preds = %257, %252
  br label %289, !dbg !4356

265:                                              ; preds = %5
  %266 = load i32, ptr @CurrentLogicVersion, align 4, !dbg !4357
  %267 = icmp sge i32 %266, 1, !dbg !4359
  br i1 %267, label %268, label %270, !dbg !4359

268:                                              ; preds = %265
  %269 = load ptr, ptr %11, align 8, !dbg !4360
  call void @_Z17Laser_player_fireP6objectiiii(ptr noundef %269, i32 noundef 35, i32 noundef 1, i32 noundef 1, i32 noundef 0), !dbg !4361
  br label %287, !dbg !4361

270:                                              ; preds = %265
  %271 = load ptr, ptr %11, align 8, !dbg !4362
  %272 = getelementptr inbounds nuw %struct.object, ptr %271, i32 0, i32 12, !dbg !4364
  %273 = getelementptr inbounds nuw %struct.vms_matrix, ptr %272, i32 0, i32 2, !dbg !4365
  %274 = load ptr, ptr %11, align 8, !dbg !4366
  %275 = getelementptr inbounds nuw %struct.object, ptr %274, i32 0, i32 11, !dbg !4367
  %276 = load ptr, ptr %11, align 8, !dbg !4368
  %277 = getelementptr inbounds nuw %struct.object, ptr %276, i32 0, i32 9, !dbg !4369
  %278 = load i16, ptr %277, align 2, !dbg !4369
  %279 = sext i16 %278 to i32, !dbg !4368
  %280 = load ptr, ptr %11, align 8, !dbg !4370
  %281 = ptrtoint ptr %280 to i64, !dbg !4371
  %282 = sub i64 %281, ptrtoint (ptr @Objects to i64), !dbg !4371
  %283 = sdiv exact i64 %282, 268, !dbg !4371
  %284 = trunc i64 %283 to i32, !dbg !4370
  %285 = call noundef i32 @_Z22create_lightning_blobsP10vms_vectorS0_ii(ptr noundef %273, ptr noundef %275, i32 noundef %279, i32 noundef %284), !dbg !4372
  %286 = load i32, ptr @GameTime, align 4, !dbg !4373
  store i32 %286, ptr @Lightning_last_time, align 4, !dbg !4374
  store i32 %286, ptr @Lightning_start_time, align 4, !dbg !4375
  br label %287

287:                                              ; preds = %270, %268
  br label %289, !dbg !4376

288:                                              ; preds = %5
  call void @_Z4Int3v(), !dbg !4377
  store i8 0, ptr @Primary_weapon, align 1, !dbg !4378
  br label %289, !dbg !4379

289:                                              ; preds = %288, %287, %264, %230, %214, %177, %110, %109, %96, %83, %52
  %290 = load i32, ptr %10, align 4, !dbg !4380
  ret i32 %290, !dbg !4381
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z22create_lightning_blobsP10vms_vectorS0_ii(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 !dbg !4382 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca %struct.fvi_query, align 8
  %12 = alloca %struct.fvi_info, align 4
  %13 = alloca %struct.vms_vector, align 4
  %14 = alloca %struct.vms_vector, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca %struct.vms_vector, align 4
  %18 = alloca i32, align 4
  %19 = alloca %struct.vms_vector, align 4
  %20 = alloca %struct.vms_vector, align 4
  %21 = alloca i32, align 4
  %22 = alloca ptr, align 8
  %23 = alloca %struct.vms_matrix, align 4
  %24 = alloca %struct.vms_vector, align 4
  %25 = alloca i32, align 4
  %26 = alloca ptr, align 8
  store ptr %0, ptr %6, align 8
    #dbg_declare(ptr %6, !4385, !DIExpression(), !4386)
  store ptr %1, ptr %7, align 8
    #dbg_declare(ptr %7, !4387, !DIExpression(), !4388)
  store i32 %2, ptr %8, align 4
    #dbg_declare(ptr %8, !4389, !DIExpression(), !4390)
  store i32 %3, ptr %9, align 4
    #dbg_declare(ptr %9, !4391, !DIExpression(), !4392)
    #dbg_declare(ptr %10, !4393, !DIExpression(), !4394)
    #dbg_declare(ptr %11, !4395, !DIExpression(), !4396)
    #dbg_declare(ptr %12, !4397, !DIExpression(), !4398)
    #dbg_declare(ptr %13, !4399, !DIExpression(), !4400)
    #dbg_declare(ptr %14, !4401, !DIExpression(), !4402)
    #dbg_declare(ptr %15, !4403, !DIExpression(), !4404)
    #dbg_declare(ptr %16, !4405, !DIExpression(), !4406)
    #dbg_declare(ptr %17, !4407, !DIExpression(), !4408)
    #dbg_declare(ptr %18, !4409, !DIExpression(), !4410)
    #dbg_declare(ptr %19, !4411, !DIExpression(), !4412)
    #dbg_declare(ptr %20, !4413, !DIExpression(), !4414)
    #dbg_declare(ptr %21, !4415, !DIExpression(), !4416)
    #dbg_declare(ptr %22, !4417, !DIExpression(), !4418)
    #dbg_declare(ptr %23, !4419, !DIExpression(), !4420)
    #dbg_declare(ptr %24, !4421, !DIExpression(), !4422)
  %27 = load i32, ptr @Player_num, align 4, !dbg !4423
  %28 = sext i32 %27 to i64, !dbg !4425
  %29 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %28, !dbg !4425
  %30 = getelementptr inbounds nuw %struct.player, ptr %29, i32 0, i32 8, !dbg !4426
  %31 = load i32, ptr %30, align 4, !dbg !4426
  %32 = icmp sgt i32 %31, 65536, !dbg !4427
  br i1 %32, label %33, label %40, !dbg !4427

33:                                               ; preds = %4
  %34 = load i32, ptr @Player_num, align 4, !dbg !4428
  %35 = sext i32 %34 to i64, !dbg !4429
  %36 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %35, !dbg !4429
  %37 = getelementptr inbounds nuw %struct.player, ptr %36, i32 0, i32 8, !dbg !4430
  %38 = load i32, ptr %37, align 4, !dbg !4431
  %39 = sub nsw i32 %38, 65536, !dbg !4431
  store i32 %39, ptr %37, align 4, !dbg !4431
  br label %40, !dbg !4429

40:                                               ; preds = %33, %4
  %41 = load i32, ptr @Player_num, align 4, !dbg !4432
  %42 = sext i32 %41 to i64, !dbg !4434
  %43 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %42, !dbg !4434
  %44 = getelementptr inbounds nuw %struct.player, ptr %43, i32 0, i32 8, !dbg !4435
  %45 = load i32, ptr %44, align 4, !dbg !4435
  %46 = icmp sle i32 %45, 65536, !dbg !4436
  br i1 %46, label %47, label %52, !dbg !4436

47:                                               ; preds = %40
  %48 = load i32, ptr @Player_num, align 4, !dbg !4437
  %49 = sext i32 %48 to i64, !dbg !4439
  %50 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %49, !dbg !4439
  %51 = getelementptr inbounds nuw %struct.player, ptr %50, i32 0, i32 8, !dbg !4440
  store i32 0, ptr %51, align 4, !dbg !4441
  call void @_Z18auto_select_weaponi(i32 noundef 0), !dbg !4442
  store i32 -1, ptr %5, align 4, !dbg !4443
  br label %151, !dbg !4443

52:                                               ; preds = %40
  %53 = load ptr, ptr %6, align 8, !dbg !4444
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %14, ptr align 4 %53, i64 12, i1 false), !dbg !4445
  %54 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %14), !dbg !4446
  %55 = load ptr, ptr %7, align 8, !dbg !4447
  %56 = call noundef ptr @_Z16vm_vec_scale_addP10vms_vectorS0_S0_i(ptr noundef %13, ptr noundef %55, ptr noundef %14, i32 noundef 19660800), !dbg !4448
  %57 = load ptr, ptr %7, align 8, !dbg !4449
  %58 = getelementptr inbounds nuw %struct.fvi_query, ptr %11, i32 0, i32 0, !dbg !4450
  store ptr %57, ptr %58, align 8, !dbg !4451
  %59 = load i32, ptr %8, align 4, !dbg !4452
  %60 = getelementptr inbounds nuw %struct.fvi_query, ptr %11, i32 0, i32 2, !dbg !4453
  store i32 %59, ptr %60, align 8, !dbg !4454
  %61 = getelementptr inbounds nuw %struct.fvi_query, ptr %11, i32 0, i32 1, !dbg !4455
  store ptr %13, ptr %61, align 8, !dbg !4456
  %62 = getelementptr inbounds nuw %struct.fvi_query, ptr %11, i32 0, i32 3, !dbg !4457
  store i32 0, ptr %62, align 4, !dbg !4458
  %63 = load i32, ptr %9, align 4, !dbg !4459
  %64 = trunc i32 %63 to i16, !dbg !4459
  %65 = getelementptr inbounds nuw %struct.fvi_query, ptr %11, i32 0, i32 4, !dbg !4460
  store i16 %64, ptr %65, align 8, !dbg !4461
  %66 = getelementptr inbounds nuw %struct.fvi_query, ptr %11, i32 0, i32 5, !dbg !4462
  store ptr null, ptr %66, align 8, !dbg !4463
  %67 = getelementptr inbounds nuw %struct.fvi_query, ptr %11, i32 0, i32 6, !dbg !4464
  store i32 3, ptr %67, align 8, !dbg !4465
  %68 = call noundef i32 @_Z24find_vector_intersectionP9fvi_queryP8fvi_info(ptr noundef %11, ptr noundef %12), !dbg !4466
  store i32 %68, ptr %15, align 4, !dbg !4467
  %69 = getelementptr inbounds nuw %struct.fvi_info, ptr %12, i32 0, i32 2, !dbg !4468
  %70 = load i32, ptr %69, align 4, !dbg !4468
  %71 = icmp eq i32 %70, -1, !dbg !4470
  br i1 %71, label %72, label %73, !dbg !4470

72:                                               ; preds = %52
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 1, ptr noundef @.str.21), !dbg !4471
  store i32 -1, ptr %5, align 4, !dbg !4473
  br label %151, !dbg !4473

73:                                               ; preds = %52
  %74 = getelementptr inbounds nuw %struct.fvi_info, ptr %12, i32 0, i32 1, !dbg !4474
  %75 = load ptr, ptr %7, align 8, !dbg !4475
  %76 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %17, ptr noundef %74, ptr noundef %75), !dbg !4476
  %77 = call noundef i32 @_Z10vm_vec_magP10vms_vector(ptr noundef %76), !dbg !4477
  store i32 %77, ptr %18, align 4, !dbg !4478
  %78 = load i32, ptr %18, align 4, !dbg !4479
  %79 = sdiv i32 %78, 1228800, !dbg !4480
  store i32 %79, ptr %16, align 4, !dbg !4481
  %80 = load i32, ptr %16, align 4, !dbg !4482
  %81 = icmp sgt i32 %80, 16, !dbg !4484
  br i1 %81, label %82, label %83, !dbg !4484

82:                                               ; preds = %73
  store i32 16, ptr %16, align 4, !dbg !4485
  br label %83, !dbg !4486

83:                                               ; preds = %82, %73
  %84 = load i32, ptr %16, align 4, !dbg !4487
  %85 = icmp slt i32 %84, 4, !dbg !4489
  br i1 %85, label %86, label %87, !dbg !4489

86:                                               ; preds = %83
  store i32 4, ptr %16, align 4, !dbg !4490
  br label %87, !dbg !4491

87:                                               ; preds = %86, %83
  %88 = load ptr, ptr @Player_ship, align 8, !dbg !4492
  %89 = getelementptr inbounds nuw %struct.player_ship, ptr %88, i32 0, i32 9, !dbg !4493
  %90 = load i32, ptr @Lightning_gun_num, align 4, !dbg !4494
  %91 = sext i32 %90 to i64, !dbg !4492
  %92 = getelementptr inbounds [8 x %struct.vms_vector], ptr %89, i64 0, i64 %91, !dbg !4492
  store ptr %92, ptr %22, align 8, !dbg !4495
  %93 = load i32, ptr %9, align 4, !dbg !4496
  %94 = sext i32 %93 to i64, !dbg !4497
  %95 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %94, !dbg !4497
  %96 = getelementptr inbounds nuw %struct.object, ptr %95, i32 0, i32 12, !dbg !4498
  %97 = call noundef ptr @_Z24vm_copy_transpose_matrixP10vms_matrixS0_(ptr noundef %23, ptr noundef %96), !dbg !4499
  %98 = load ptr, ptr %22, align 8, !dbg !4500
  %99 = call noundef ptr @_Z13vm_vec_rotateP10vms_vectorS0_P10vms_matrix(ptr noundef %24, ptr noundef %98, ptr noundef %23), !dbg !4501
  %100 = load i32, ptr %9, align 4, !dbg !4502
  %101 = sext i32 %100 to i64, !dbg !4503
  %102 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %101, !dbg !4503
  %103 = getelementptr inbounds nuw %struct.object, ptr %102, i32 0, i32 11, !dbg !4504
  %104 = call noundef ptr @_Z10vm_vec_addP10vms_vectorS0_S0_(ptr noundef %19, ptr noundef %103, ptr noundef %24), !dbg !4505
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %20, ptr align 4 %14, i64 12, i1 false), !dbg !4506
  %105 = load i32, ptr %18, align 4, !dbg !4507
  %106 = load i32, ptr %16, align 4, !dbg !4508
  %107 = sdiv i32 %105, %106, !dbg !4509
  %108 = call noundef ptr @_Z12vm_vec_scaleP10vms_vectori(ptr noundef %20, i32 noundef %107), !dbg !4510
  store i32 0, ptr %10, align 4, !dbg !4511
  br label %109, !dbg !4513

109:                                              ; preds = %146, %87
  %110 = load i32, ptr %10, align 4, !dbg !4514
  %111 = load i32, ptr %16, align 4, !dbg !4516
  %112 = icmp slt i32 %110, %111, !dbg !4517
  br i1 %112, label %113, label %149, !dbg !4518

113:                                              ; preds = %109
    #dbg_declare(ptr %25, !4519, !DIExpression(), !4521)
    #dbg_declare(ptr %26, !4522, !DIExpression(), !4523)
  %114 = call noundef ptr @_Z11vm_vec_add2P10vms_vectorS0_(ptr noundef %19, ptr noundef %20), !dbg !4524
  %115 = load i32, ptr %8, align 4, !dbg !4525
  %116 = call noundef i32 @_Z14find_point_segP10vms_vectori(ptr noundef %19, i32 noundef %115), !dbg !4526
  store i32 %116, ptr %25, align 4, !dbg !4527
  %117 = load i32, ptr %25, align 4, !dbg !4528
  %118 = icmp eq i32 %117, -1, !dbg !4530
  br i1 %118, label %119, label %120, !dbg !4530

119:                                              ; preds = %113
  br label %146, !dbg !4531

120:                                              ; preds = %113
  %121 = load ptr, ptr %6, align 8, !dbg !4532
  %122 = load i32, ptr %25, align 4, !dbg !4533
  %123 = load i32, ptr %9, align 4, !dbg !4534
  %124 = call noundef i32 @_Z16Laser_create_newP10vms_vectorS0_iiii(ptr noundef %121, ptr noundef %19, i32 noundef %122, i32 noundef %123, i32 noundef 13, i32 noundef 0), !dbg !4535
  store i32 %124, ptr %21, align 4, !dbg !4536
  %125 = load i32, ptr %21, align 4, !dbg !4537
  %126 = icmp slt i32 %125, 0, !dbg !4539
  br i1 %126, label %127, label %128, !dbg !4539

127:                                              ; preds = %120
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 1, ptr noundef @.str.22), !dbg !4540
  call void @_Z4Int3v(), !dbg !4542
  store i32 -1, ptr %5, align 4, !dbg !4543
  br label %151, !dbg !4543

128:                                              ; preds = %120
  %129 = load i32, ptr %21, align 4, !dbg !4544
  %130 = sext i32 %129 to i64, !dbg !4545
  %131 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %130, !dbg !4545
  store ptr %131, ptr %26, align 8, !dbg !4546
  %132 = load ptr, ptr %26, align 8, !dbg !4547
  %133 = getelementptr inbounds nuw %struct.object, ptr %132, i32 0, i32 2, !dbg !4548
  %134 = load i8, ptr %133, align 1, !dbg !4548
  %135 = zext i8 %134 to i64, !dbg !4549
  %136 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %135, !dbg !4549
  %137 = getelementptr inbounds nuw %struct.weapon_info, ptr %136, i32 0, i32 6, !dbg !4550
  %138 = load i16, ptr %137, align 4, !dbg !4550
  %139 = sext i16 %138 to i32, !dbg !4549
  call void @_Z16digi_play_sampleii(i32 noundef %139, i32 noundef 65536), !dbg !4551
  %140 = load ptr, ptr %26, align 8, !dbg !4552
  %141 = getelementptr inbounds nuw %struct.object, ptr %140, i32 0, i32 21, !dbg !4553
  %142 = getelementptr inbounds nuw %struct.physics_info, ptr %141, i32 0, i32 0, !dbg !4554
  %143 = call noundef ptr @_Z12vm_vec_scaleP10vms_vectori(ptr noundef %142, i32 noundef 32768), !dbg !4555
  %144 = load ptr, ptr %26, align 8, !dbg !4556
  %145 = getelementptr inbounds nuw %struct.object, ptr %144, i32 0, i32 20, !dbg !4557
  store i32 12288, ptr %145, align 4, !dbg !4558
  br label %146, !dbg !4559

146:                                              ; preds = %128, %119
  %147 = load i32, ptr %10, align 4, !dbg !4560
  %148 = add nsw i32 %147, 1, !dbg !4560
  store i32 %148, ptr %10, align 4, !dbg !4560
  br label %109, !dbg !4561, !llvm.loop !4562

149:                                              ; preds = %109
  %150 = load i32, ptr %21, align 4, !dbg !4564
  store i32 %150, ptr %5, align 4, !dbg !4565
  br label %151, !dbg !4565

151:                                              ; preds = %149, %127, %72, %47
  %152 = load i32, ptr %5, align 4, !dbg !4566
  ret i32 %152, !dbg !4566
}

declare noundef i32 @_Z10vm_vec_magP10vms_vector(ptr noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z15lightning_framev() #0 !dbg !4567 {
  %1 = load i32, ptr @GameTime, align 4, !dbg !4568
  %2 = load i32, ptr @Lightning_start_time, align 4, !dbg !4570
  %3 = sub nsw i32 %1, %2, !dbg !4571
  %4 = icmp slt i32 %3, 16384, !dbg !4572
  br i1 %4, label %5, label %33, !dbg !4573

5:                                                ; preds = %0
  %6 = load i32, ptr @GameTime, align 4, !dbg !4574
  %7 = load i32, ptr @Lightning_start_time, align 4, !dbg !4575
  %8 = sub nsw i32 %6, %7, !dbg !4576
  %9 = icmp sgt i32 %8, 0, !dbg !4577
  br i1 %9, label %10, label %33, !dbg !4573

10:                                               ; preds = %5
  %11 = load i32, ptr @GameTime, align 4, !dbg !4578
  %12 = load i32, ptr @Lightning_last_time, align 4, !dbg !4581
  %13 = sub nsw i32 %11, %12, !dbg !4582
  %14 = icmp sgt i32 %13, 8192, !dbg !4583
  br i1 %14, label %15, label %32, !dbg !4583

15:                                               ; preds = %10
  %16 = load ptr, ptr @ConsoleObject, align 8, !dbg !4584
  %17 = getelementptr inbounds nuw %struct.object, ptr %16, i32 0, i32 12, !dbg !4586
  %18 = getelementptr inbounds nuw %struct.vms_matrix, ptr %17, i32 0, i32 2, !dbg !4587
  %19 = load ptr, ptr @ConsoleObject, align 8, !dbg !4588
  %20 = getelementptr inbounds nuw %struct.object, ptr %19, i32 0, i32 11, !dbg !4589
  %21 = load ptr, ptr @ConsoleObject, align 8, !dbg !4590
  %22 = getelementptr inbounds nuw %struct.object, ptr %21, i32 0, i32 9, !dbg !4591
  %23 = load i16, ptr %22, align 2, !dbg !4591
  %24 = sext i16 %23 to i32, !dbg !4590
  %25 = load ptr, ptr @ConsoleObject, align 8, !dbg !4592
  %26 = ptrtoint ptr %25 to i64, !dbg !4593
  %27 = sub i64 %26, ptrtoint (ptr @Objects to i64), !dbg !4593
  %28 = sdiv exact i64 %27, 268, !dbg !4593
  %29 = trunc i64 %28 to i32, !dbg !4592
  %30 = call noundef i32 @_Z22create_lightning_blobsP10vms_vectorS0_ii(ptr noundef %18, ptr noundef %20, i32 noundef %24, i32 noundef %29), !dbg !4594
  %31 = load i32, ptr @GameTime, align 4, !dbg !4595
  store i32 %31, ptr @Lightning_last_time, align 4, !dbg !4596
  br label %32, !dbg !4597

32:                                               ; preds = %15, %10
  br label %33, !dbg !4598

33:                                               ; preds = %32, %5, %0
  ret void, !dbg !4599
}

declare void @_Z16phys_apply_forceP6objectP10vms_vector(ptr noundef, ptr noundef) #1

declare void @_Z14phys_apply_rotP6objectP10vms_vector(ptr noundef, ptr noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z21create_homing_missileP6objectiii(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 !dbg !4600 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca %struct.vms_vector, align 4
  %12 = alloca %struct.vms_vector, align 4
  store ptr %0, ptr %6, align 8
    #dbg_declare(ptr %6, !4603, !DIExpression(), !4604)
  store i32 %1, ptr %7, align 4
    #dbg_declare(ptr %7, !4605, !DIExpression(), !4606)
  store i32 %2, ptr %8, align 4
    #dbg_declare(ptr %8, !4607, !DIExpression(), !4608)
  store i32 %3, ptr %9, align 4
    #dbg_declare(ptr %9, !4609, !DIExpression(), !4610)
    #dbg_declare(ptr %10, !4611, !DIExpression(), !4612)
    #dbg_declare(ptr %11, !4613, !DIExpression(), !4614)
    #dbg_declare(ptr %12, !4615, !DIExpression(), !4616)
  %13 = load i32, ptr %7, align 4, !dbg !4617
  %14 = icmp eq i32 %13, -1, !dbg !4619
  br i1 %14, label %15, label %16, !dbg !4619

15:                                               ; preds = %4
  call void @_Z18make_random_vectorP10vms_vector(ptr noundef %11), !dbg !4620
  br label %26, !dbg !4622

16:                                               ; preds = %4
  %17 = load i32, ptr %7, align 4, !dbg !4623
  %18 = sext i32 %17 to i64, !dbg !4625
  %19 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %18, !dbg !4625
  %20 = getelementptr inbounds nuw %struct.object, ptr %19, i32 0, i32 11, !dbg !4626
  %21 = load ptr, ptr %6, align 8, !dbg !4627
  %22 = getelementptr inbounds nuw %struct.object, ptr %21, i32 0, i32 11, !dbg !4628
  %23 = call noundef i32 @_Z27vm_vec_normalized_dir_quickP10vms_vectorS0_S0_(ptr noundef %11, ptr noundef %20, ptr noundef %22), !dbg !4629
  call void @_Z18make_random_vectorP10vms_vector(ptr noundef %12), !dbg !4630
  %24 = call noundef ptr @_Z17vm_vec_scale_add2P10vms_vectorS0_i(ptr noundef %11, ptr noundef %12, i32 noundef 16384), !dbg !4631
  %25 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %11), !dbg !4632
  br label %26

26:                                               ; preds = %16, %15
  %27 = load ptr, ptr %6, align 8, !dbg !4633
  %28 = getelementptr inbounds nuw %struct.object, ptr %27, i32 0, i32 11, !dbg !4634
  %29 = load ptr, ptr %6, align 8, !dbg !4635
  %30 = getelementptr inbounds nuw %struct.object, ptr %29, i32 0, i32 9, !dbg !4636
  %31 = load i16, ptr %30, align 2, !dbg !4636
  %32 = sext i16 %31 to i32, !dbg !4635
  %33 = load ptr, ptr %6, align 8, !dbg !4637
  %34 = ptrtoint ptr %33 to i64, !dbg !4638
  %35 = sub i64 %34, ptrtoint (ptr @Objects to i64), !dbg !4638
  %36 = sdiv exact i64 %35, 268, !dbg !4638
  %37 = trunc i64 %36 to i32, !dbg !4637
  %38 = load i32, ptr %8, align 4, !dbg !4639
  %39 = load i32, ptr %9, align 4, !dbg !4640
  %40 = call noundef i32 @_Z16Laser_create_newP10vms_vectorS0_iiii(ptr noundef %11, ptr noundef %28, i32 noundef %32, i32 noundef %37, i32 noundef %38, i32 noundef %39), !dbg !4641
  store i32 %40, ptr %10, align 4, !dbg !4642
  %41 = load i32, ptr %10, align 4, !dbg !4643
  %42 = icmp eq i32 %41, -1, !dbg !4645
  br i1 %42, label %43, label %44, !dbg !4645

43:                                               ; preds = %26
  store i32 -1, ptr %5, align 4, !dbg !4646
  br label %53, !dbg !4646

44:                                               ; preds = %26
  %45 = load i32, ptr %7, align 4, !dbg !4647
  %46 = trunc i32 %45 to i16, !dbg !4647
  %47 = load i32, ptr %10, align 4, !dbg !4648
  %48 = sext i32 %47 to i64, !dbg !4649
  %49 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %48, !dbg !4649
  %50 = getelementptr inbounds nuw %struct.object, ptr %49, i32 0, i32 22, !dbg !4650
  %51 = getelementptr inbounds nuw %struct.laser_info_s, ptr %50, i32 0, i32 5, !dbg !4651
  store i16 %46, ptr %51, align 2, !dbg !4652
  %52 = load i32, ptr %10, align 4, !dbg !4653
  store i32 %52, ptr %5, align 4, !dbg !4654
  br label %53, !dbg !4654

53:                                               ; preds = %44, %43
  %54 = load i32, ptr %5, align 4, !dbg !4655
  ret i32 %54, !dbg !4655
}

declare noundef i32 @_Z27vm_vec_normalized_dir_quickP10vms_vectorS0_S0_(ptr noundef, ptr noundef, ptr noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z21create_smart_childrenP6objecti(ptr noundef %0, i32 noundef %1) #0 !dbg !4656 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca [30 x i32], align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !4659, !DIExpression(), !4660)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !4661, !DIExpression(), !4662)
    #dbg_declare(ptr %5, !4663, !DIExpression(), !4664)
    #dbg_declare(ptr %6, !4665, !DIExpression(), !4666)
  store i32 0, ptr %6, align 4, !dbg !4666
    #dbg_declare(ptr %7, !4667, !DIExpression(), !4668)
    #dbg_declare(ptr %8, !4669, !DIExpression(), !4670)
    #dbg_declare(ptr %9, !4671, !DIExpression(), !4673)
    #dbg_declare(ptr %10, !4674, !DIExpression(), !4675)
  %17 = load ptr, ptr %3, align 8, !dbg !4676
  %18 = getelementptr inbounds nuw %struct.object, ptr %17, i32 0, i32 1, !dbg !4678
  %19 = load i8, ptr %18, align 4, !dbg !4678
  %20 = zext i8 %19 to i32, !dbg !4676
  %21 = icmp eq i32 %20, 5, !dbg !4679
  br i1 %21, label %22, label %33, !dbg !4679

22:                                               ; preds = %2
  %23 = load ptr, ptr %3, align 8, !dbg !4680
  %24 = getelementptr inbounds nuw %struct.object, ptr %23, i32 0, i32 22, !dbg !4682
  %25 = getelementptr inbounds nuw %struct.laser_info_s, ptr %24, i32 0, i32 0, !dbg !4683
  %26 = load i16, ptr %25, align 4, !dbg !4683
  %27 = sext i16 %26 to i32, !dbg !4680
  store i32 %27, ptr %7, align 4, !dbg !4684
  %28 = load ptr, ptr %3, align 8, !dbg !4685
  %29 = getelementptr inbounds nuw %struct.object, ptr %28, i32 0, i32 22, !dbg !4686
  %30 = getelementptr inbounds nuw %struct.laser_info_s, ptr %29, i32 0, i32 1, !dbg !4687
  %31 = load i16, ptr %30, align 2, !dbg !4687
  %32 = sext i16 %31 to i32, !dbg !4685
  store i32 %32, ptr %8, align 4, !dbg !4688
  br label %65, !dbg !4689

33:                                               ; preds = %2
  %34 = load ptr, ptr %3, align 8, !dbg !4690
  %35 = getelementptr inbounds nuw %struct.object, ptr %34, i32 0, i32 1, !dbg !4692
  %36 = load i8, ptr %35, align 4, !dbg !4692
  %37 = zext i8 %36 to i32, !dbg !4690
  %38 = icmp eq i32 %37, 2, !dbg !4693
  br i1 %38, label %39, label %63, !dbg !4693

39:                                               ; preds = %33
  %40 = load i32, ptr @CurrentLogicVersion, align 4, !dbg !4694
  %41 = icmp eq i32 %40, 0, !dbg !4697
  br i1 %41, label %42, label %56, !dbg !4697

42:                                               ; preds = %39
  %43 = load ptr, ptr %3, align 8, !dbg !4698
  %44 = getelementptr inbounds nuw %struct.object, ptr %43, i32 0, i32 22, !dbg !4700
  %45 = getelementptr inbounds nuw %struct.ai_static, ptr %44, i32 0, i32 0, !dbg !4701
  %46 = load i8, ptr %45, align 4, !dbg !4701
  %47 = zext i8 %46 to i32, !dbg !4698
  %48 = load ptr, ptr %3, align 8, !dbg !4702
  %49 = getelementptr inbounds nuw %struct.object, ptr %48, i32 0, i32 22, !dbg !4703
  %50 = getelementptr inbounds nuw %struct.ai_static, ptr %49, i32 0, i32 1, !dbg !4704
  %51 = getelementptr inbounds [11 x i8], ptr %50, i64 0, i64 0, !dbg !4702
  %52 = load i8, ptr %51, align 1, !dbg !4702
  %53 = sext i8 %52 to i32, !dbg !4702
  %54 = shl i32 %53, 8, !dbg !4705
  %55 = or i32 %47, %54, !dbg !4706
  store i32 %55, ptr %7, align 4, !dbg !4707
  store i32 349, ptr %8, align 4, !dbg !4708
  br label %62, !dbg !4709

56:                                               ; preds = %39
  store i32 2, ptr %7, align 4, !dbg !4710
  %57 = load ptr, ptr %3, align 8, !dbg !4712
  %58 = ptrtoint ptr %57 to i64, !dbg !4713
  %59 = sub i64 %58, ptrtoint (ptr @Objects to i64), !dbg !4713
  %60 = sdiv exact i64 %59, 268, !dbg !4713
  %61 = trunc i64 %60 to i32, !dbg !4712
  store i32 %61, ptr %8, align 4, !dbg !4714
  br label %62

62:                                               ; preds = %56, %42
  br label %64, !dbg !4715

63:                                               ; preds = %33
  call void @_Z4Int3v(), !dbg !4716
  br label %64

64:                                               ; preds = %63, %62
  br label %65

65:                                               ; preds = %64, %22
  %66 = load i32, ptr @CurrentLogicVersion, align 4, !dbg !4717
  %67 = icmp sge i32 %66, 1, !dbg !4719
  br i1 %67, label %68, label %80, !dbg !4720

68:                                               ; preds = %65
  %69 = load ptr, ptr %3, align 8, !dbg !4721
  %70 = getelementptr inbounds nuw %struct.object, ptr %69, i32 0, i32 2, !dbg !4722
  %71 = load i8, ptr %70, align 1, !dbg !4722
  %72 = zext i8 %71 to i32, !dbg !4721
  %73 = icmp eq i32 %72, 40, !dbg !4723
  br i1 %73, label %74, label %80, !dbg !4720

74:                                               ; preds = %68
  %75 = load ptr, ptr %3, align 8, !dbg !4724
  %76 = load i32, ptr @Difficulty_level, align 4, !dbg !4725
  %77 = sext i32 %76 to i64, !dbg !4726
  %78 = getelementptr inbounds [5 x i32], ptr getelementptr inbounds nuw (%struct.weapon_info, ptr getelementptr inbounds ([0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 40), i32 0, i32 29), i64 0, i64 %77, !dbg !4726
  %79 = load i32, ptr %78, align 4, !dbg !4726
  call void @_Z18blast_nearby_glassP6objecti(ptr noundef %75, i32 noundef %79), !dbg !4727
  br label %80, !dbg !4727

80:                                               ; preds = %74, %68, %65
  %81 = load i32, ptr @CurrentDataVersion, align 4, !dbg !4728
  %82 = icmp ne i32 %81, 0, !dbg !4730
  br i1 %82, label %83, label %124, !dbg !4731

83:                                               ; preds = %80
  %84 = load ptr, ptr %3, align 8, !dbg !4732
  %85 = getelementptr inbounds nuw %struct.object, ptr %84, i32 0, i32 1, !dbg !4733
  %86 = load i8, ptr %85, align 4, !dbg !4733
  %87 = zext i8 %86 to i32, !dbg !4732
  %88 = icmp eq i32 %87, 5, !dbg !4734
  br i1 %88, label %89, label %124, !dbg !4735

89:                                               ; preds = %83
  %90 = load ptr, ptr %3, align 8, !dbg !4736
  %91 = getelementptr inbounds nuw %struct.object, ptr %90, i32 0, i32 2, !dbg !4737
  %92 = load i8, ptr %91, align 1, !dbg !4737
  %93 = zext i8 %92 to i32, !dbg !4736
  %94 = icmp eq i32 %93, 17, !dbg !4738
  br i1 %94, label %113, label %95, !dbg !4739

95:                                               ; preds = %89
  %96 = load ptr, ptr %3, align 8, !dbg !4740
  %97 = getelementptr inbounds nuw %struct.object, ptr %96, i32 0, i32 2, !dbg !4741
  %98 = load i8, ptr %97, align 1, !dbg !4741
  %99 = zext i8 %98 to i32, !dbg !4740
  %100 = icmp eq i32 %99, 38, !dbg !4742
  br i1 %100, label %113, label %101, !dbg !4743

101:                                              ; preds = %95
  %102 = load ptr, ptr %3, align 8, !dbg !4744
  %103 = getelementptr inbounds nuw %struct.object, ptr %102, i32 0, i32 2, !dbg !4745
  %104 = load i8, ptr %103, align 1, !dbg !4745
  %105 = zext i8 %104 to i32, !dbg !4744
  %106 = icmp eq i32 %105, 53, !dbg !4746
  br i1 %106, label %113, label %107, !dbg !4747

107:                                              ; preds = %101
  %108 = load ptr, ptr %3, align 8, !dbg !4748
  %109 = getelementptr inbounds nuw %struct.object, ptr %108, i32 0, i32 2, !dbg !4749
  %110 = load i8, ptr %109, align 1, !dbg !4749
  %111 = zext i8 %110 to i32, !dbg !4748
  %112 = icmp eq i32 %111, 40, !dbg !4750
  br i1 %112, label %113, label %124, !dbg !4731

113:                                              ; preds = %107, %101, %95, %89
  %114 = load ptr, ptr %3, align 8, !dbg !4751
  %115 = getelementptr inbounds nuw %struct.object, ptr %114, i32 0, i32 2, !dbg !4751
  %116 = load i8, ptr %115, align 1, !dbg !4751
  %117 = zext i8 %116 to i64, !dbg !4751
  %118 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %117, !dbg !4751
  %119 = getelementptr inbounds nuw %struct.weapon_info, ptr %118, i32 0, i32 21, !dbg !4751
  %120 = load i8, ptr %119, align 2, !dbg !4751
  %121 = sext i8 %120 to i32, !dbg !4751
  %122 = icmp ne i32 %121, -1, !dbg !4751
  %123 = zext i1 %122 to i32, !dbg !4751
  call void @_Z7_AssertiPKcS0_i(i32 noundef %123, ptr noundef @.str.24, ptr noundef @.str.3, i32 noundef 2551), !dbg !4751
  br label %124, !dbg !4753

124:                                              ; preds = %113, %107, %83, %80
  %125 = load ptr, ptr %3, align 8, !dbg !4754
  %126 = getelementptr inbounds nuw %struct.object, ptr %125, i32 0, i32 1, !dbg !4756
  %127 = load i8, ptr %126, align 4, !dbg !4756
  %128 = zext i8 %127 to i32, !dbg !4754
  %129 = icmp eq i32 %128, 5, !dbg !4757
  br i1 %129, label %130, label %158, !dbg !4758

130:                                              ; preds = %124
  %131 = load i32, ptr @CurrentLogicVersion, align 4, !dbg !4759
  %132 = icmp sge i32 %131, 1, !dbg !4760
  br i1 %132, label %133, label %143, !dbg !4761

133:                                              ; preds = %130
  %134 = load ptr, ptr %3, align 8, !dbg !4762
  %135 = getelementptr inbounds nuw %struct.object, ptr %134, i32 0, i32 2, !dbg !4763
  %136 = load i8, ptr %135, align 1, !dbg !4763
  %137 = zext i8 %136 to i64, !dbg !4764
  %138 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %137, !dbg !4764
  %139 = getelementptr inbounds nuw %struct.weapon_info, ptr %138, i32 0, i32 21, !dbg !4765
  %140 = load i8, ptr %139, align 2, !dbg !4765
  %141 = sext i8 %140 to i32, !dbg !4764
  %142 = icmp ne i32 %141, -1, !dbg !4766
  br i1 %142, label %164, label %143, !dbg !4767

143:                                              ; preds = %133, %130
  %144 = load i32, ptr @CurrentLogicVersion, align 4, !dbg !4768
  %145 = icmp eq i32 %144, 0, !dbg !4769
  br i1 %145, label %146, label %158, !dbg !4770

146:                                              ; preds = %143
  %147 = load ptr, ptr %3, align 8, !dbg !4771
  %148 = getelementptr inbounds nuw %struct.object, ptr %147, i32 0, i32 2, !dbg !4772
  %149 = load i8, ptr %148, align 1, !dbg !4772
  %150 = zext i8 %149 to i32, !dbg !4771
  %151 = icmp eq i32 %150, 17, !dbg !4773
  br i1 %151, label %164, label %152, !dbg !4774

152:                                              ; preds = %146
  %153 = load ptr, ptr %3, align 8, !dbg !4775
  %154 = getelementptr inbounds nuw %struct.object, ptr %153, i32 0, i32 2, !dbg !4776
  %155 = load i8, ptr %154, align 1, !dbg !4776
  %156 = zext i8 %155 to i32, !dbg !4775
  %157 = icmp eq i32 %156, 38, !dbg !4777
  br i1 %157, label %164, label %158, !dbg !4778

158:                                              ; preds = %152, %143, %124
  %159 = load ptr, ptr %3, align 8, !dbg !4779
  %160 = getelementptr inbounds nuw %struct.object, ptr %159, i32 0, i32 1, !dbg !4780
  %161 = load i8, ptr %160, align 4, !dbg !4780
  %162 = zext i8 %161 to i32, !dbg !4779
  %163 = icmp eq i32 %162, 2, !dbg !4781
  br i1 %163, label %164, label %356, !dbg !4778

164:                                              ; preds = %158, %152, %146, %133
    #dbg_declare(ptr %11, !4782, !DIExpression(), !4784)
    #dbg_declare(ptr %12, !4785, !DIExpression(), !4786)
  %165 = load i32, ptr @Game_mode, align 4, !dbg !4787
  %166 = and i32 %165, 38, !dbg !4789
  %167 = icmp ne i32 %166, 0, !dbg !4787
  br i1 %167, label %168, label %169, !dbg !4787

168:                                              ; preds = %164
  call void @_Z7P_SRandi(i32 noundef 8321), !dbg !4790
  br label %169, !dbg !4790

169:                                              ; preds = %168, %164
  store i32 0, ptr %12, align 4, !dbg !4791
  br label %170, !dbg !4793

170:                                              ; preds = %282, %169
  %171 = load i32, ptr %12, align 4, !dbg !4794
  %172 = load i32, ptr @Highest_object_index, align 4, !dbg !4796
  %173 = icmp sle i32 %171, %172, !dbg !4797
  br i1 %173, label %174, label %285, !dbg !4798

174:                                              ; preds = %170
    #dbg_declare(ptr %13, !4799, !DIExpression(), !4801)
  %175 = load i32, ptr %12, align 4, !dbg !4802
  %176 = sext i32 %175 to i64, !dbg !4803
  %177 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %176, !dbg !4803
  store ptr %177, ptr %13, align 8, !dbg !4801
  %178 = load ptr, ptr %13, align 8, !dbg !4804
  %179 = getelementptr inbounds nuw %struct.object, ptr %178, i32 0, i32 1, !dbg !4806
  %180 = load i8, ptr %179, align 4, !dbg !4806
  %181 = zext i8 %180 to i32, !dbg !4804
  %182 = icmp eq i32 %181, 2, !dbg !4807
  br i1 %182, label %183, label %190, !dbg !4808

183:                                              ; preds = %174
  %184 = load ptr, ptr %13, align 8, !dbg !4809
  %185 = getelementptr inbounds nuw %struct.object, ptr %184, i32 0, i32 22, !dbg !4810
  %186 = getelementptr inbounds nuw %struct.ai_static, ptr %185, i32 0, i32 1, !dbg !4811
  %187 = getelementptr inbounds [11 x i8], ptr %186, i64 0, i64 6, !dbg !4809
  %188 = load i8, ptr %187, align 1, !dbg !4809
  %189 = icmp ne i8 %188, 0, !dbg !4809
  br i1 %189, label %190, label %196, !dbg !4812

190:                                              ; preds = %183, %174
  %191 = load ptr, ptr %13, align 8, !dbg !4813
  %192 = getelementptr inbounds nuw %struct.object, ptr %191, i32 0, i32 1, !dbg !4814
  %193 = load i8, ptr %192, align 4, !dbg !4814
  %194 = zext i8 %193 to i32, !dbg !4813
  %195 = icmp eq i32 %194, 4, !dbg !4815
  br i1 %195, label %196, label %281, !dbg !4816

196:                                              ; preds = %190, %183
  %197 = load i32, ptr %12, align 4, !dbg !4817
  %198 = load i32, ptr %8, align 4, !dbg !4818
  %199 = icmp ne i32 %197, %198, !dbg !4819
  br i1 %199, label %200, label %281, !dbg !4816

200:                                              ; preds = %196
    #dbg_declare(ptr %14, !4820, !DIExpression(), !4822)
  %201 = load ptr, ptr %13, align 8, !dbg !4823
  %202 = getelementptr inbounds nuw %struct.object, ptr %201, i32 0, i32 1, !dbg !4825
  %203 = load i8, ptr %202, align 4, !dbg !4825
  %204 = zext i8 %203 to i32, !dbg !4823
  %205 = icmp eq i32 %204, 4, !dbg !4826
  br i1 %205, label %206, label %226, !dbg !4826

206:                                              ; preds = %200
  %207 = load i32, ptr %7, align 4, !dbg !4827
  %208 = icmp eq i32 %207, 4, !dbg !4830
  br i1 %208, label %209, label %214, !dbg !4831

209:                                              ; preds = %206
  %210 = load i32, ptr @Game_mode, align 4, !dbg !4832
  %211 = and i32 %210, 16, !dbg !4833
  %212 = icmp ne i32 %211, 0, !dbg !4834
  br i1 %212, label %213, label %214, !dbg !4831

213:                                              ; preds = %209
  br label %282, !dbg !4835

214:                                              ; preds = %209, %206
  %215 = load ptr, ptr %13, align 8, !dbg !4836
  %216 = getelementptr inbounds nuw %struct.object, ptr %215, i32 0, i32 2, !dbg !4838
  %217 = load i8, ptr %216, align 1, !dbg !4838
  %218 = zext i8 %217 to i64, !dbg !4839
  %219 = getelementptr inbounds nuw [12 x %struct.player], ptr @Players, i64 0, i64 %218, !dbg !4839
  %220 = getelementptr inbounds nuw %struct.player, ptr %219, i32 0, i32 7, !dbg !4840
  %221 = load i32, ptr %220, align 4, !dbg !4840
  %222 = and i32 %221, 2048, !dbg !4841
  %223 = icmp ne i32 %222, 0, !dbg !4839
  br i1 %223, label %224, label %225, !dbg !4839

224:                                              ; preds = %214
  br label %282, !dbg !4842

225:                                              ; preds = %214
  br label %226, !dbg !4843

226:                                              ; preds = %225, %200
  %227 = load ptr, ptr %13, align 8, !dbg !4844
  %228 = getelementptr inbounds nuw %struct.object, ptr %227, i32 0, i32 1, !dbg !4846
  %229 = load i8, ptr %228, align 4, !dbg !4846
  %230 = zext i8 %229 to i32, !dbg !4844
  %231 = icmp eq i32 %230, 2, !dbg !4847
  br i1 %231, label %232, label %254, !dbg !4847

232:                                              ; preds = %226
  %233 = load i32, ptr %7, align 4, !dbg !4848
  %234 = icmp eq i32 %233, 2, !dbg !4851
  br i1 %234, label %235, label %236, !dbg !4851

235:                                              ; preds = %232
  br label %282, !dbg !4852

236:                                              ; preds = %232
  %237 = load i32, ptr %7, align 4, !dbg !4853
  %238 = icmp eq i32 %237, 4, !dbg !4855
  br i1 %238, label %239, label %253, !dbg !4856

239:                                              ; preds = %236
  %240 = load i32, ptr @CurrentLogicVersion, align 4, !dbg !4857
  %241 = icmp sge i32 %240, 1, !dbg !4858
  br i1 %241, label %242, label %253, !dbg !4856

242:                                              ; preds = %239
  %243 = load ptr, ptr %13, align 8, !dbg !4859
  %244 = getelementptr inbounds nuw %struct.object, ptr %243, i32 0, i32 2, !dbg !4861
  %245 = load i8, ptr %244, align 1, !dbg !4861
  %246 = zext i8 %245 to i64, !dbg !4862
  %247 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %246, !dbg !4862
  %248 = getelementptr inbounds nuw %struct.robot_info, ptr %247, i32 0, i32 37, !dbg !4863
  %249 = load i8, ptr %248, align 1, !dbg !4863
  %250 = icmp ne i8 %249, 0, !dbg !4862
  br i1 %250, label %251, label %252, !dbg !4862

251:                                              ; preds = %242
  br label %282, !dbg !4864

252:                                              ; preds = %242
  br label %253, !dbg !4863

253:                                              ; preds = %252, %239, %236
  br label %254, !dbg !4865

254:                                              ; preds = %253, %226
  %255 = load ptr, ptr %3, align 8, !dbg !4866
  %256 = getelementptr inbounds nuw %struct.object, ptr %255, i32 0, i32 11, !dbg !4867
  %257 = load ptr, ptr %13, align 8, !dbg !4868
  %258 = getelementptr inbounds nuw %struct.object, ptr %257, i32 0, i32 11, !dbg !4869
  %259 = call noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef %256, ptr noundef %258), !dbg !4870
  store i32 %259, ptr %14, align 4, !dbg !4871
  %260 = load i32, ptr %14, align 4, !dbg !4872
  %261 = icmp slt i32 %260, 9830400, !dbg !4874
  br i1 %261, label %262, label %280, !dbg !4874

262:                                              ; preds = %254
    #dbg_declare(ptr %15, !4875, !DIExpression(), !4877)
  %263 = load ptr, ptr %3, align 8, !dbg !4878
  %264 = load ptr, ptr %13, align 8, !dbg !4879
  %265 = call noundef i32 @_Z27object_to_object_visibilityP6objectS0_i(ptr noundef %263, ptr noundef %264, i32 noundef 2), !dbg !4880
  store i32 %265, ptr %15, align 4, !dbg !4881
  %266 = load i32, ptr %15, align 4, !dbg !4882
  %267 = icmp ne i32 %266, 0, !dbg !4882
  br i1 %267, label %268, label %279, !dbg !4882

268:                                              ; preds = %262
  %269 = load i32, ptr %12, align 4, !dbg !4884
  %270 = load i32, ptr %6, align 4, !dbg !4886
  %271 = sext i32 %270 to i64, !dbg !4887
  %272 = getelementptr inbounds [30 x i32], ptr %9, i64 0, i64 %271, !dbg !4887
  store i32 %269, ptr %272, align 4, !dbg !4888
  %273 = load i32, ptr %6, align 4, !dbg !4889
  %274 = add nsw i32 %273, 1, !dbg !4889
  store i32 %274, ptr %6, align 4, !dbg !4889
  %275 = load i32, ptr %6, align 4, !dbg !4890
  %276 = icmp sge i32 %275, 30, !dbg !4892
  br i1 %276, label %277, label %278, !dbg !4892

277:                                              ; preds = %268
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.25), !dbg !4893
  store i32 30, ptr %6, align 4, !dbg !4895
  br label %286, !dbg !4896

278:                                              ; preds = %268
  br label %279, !dbg !4897

279:                                              ; preds = %278, %262
  br label %280, !dbg !4898

280:                                              ; preds = %279, %254
  br label %281, !dbg !4899

281:                                              ; preds = %280, %196, %190
  br label %282, !dbg !4900

282:                                              ; preds = %281, %251, %235, %224, %213
  %283 = load i32, ptr %12, align 4, !dbg !4901
  %284 = add nsw i32 %283, 1, !dbg !4901
  store i32 %284, ptr %12, align 4, !dbg !4901
  br label %170, !dbg !4902, !llvm.loop !4903

285:                                              ; preds = %170
  br label %286, !dbg !4905

286:                                              ; preds = %285, %277
  %287 = load i32, ptr @CurrentLogicVersion, align 4, !dbg !4905
  %288 = icmp sge i32 %287, 1, !dbg !4907
  br i1 %288, label %289, label %315, !dbg !4907

289:                                              ; preds = %286
  %290 = load ptr, ptr %3, align 8, !dbg !4908
  %291 = getelementptr inbounds nuw %struct.object, ptr %290, i32 0, i32 1, !dbg !4911
  %292 = load i8, ptr %291, align 4, !dbg !4911
  %293 = zext i8 %292 to i32, !dbg !4908
  %294 = icmp eq i32 %293, 5, !dbg !4912
  br i1 %294, label %295, label %307, !dbg !4912

295:                                              ; preds = %289
  %296 = load ptr, ptr %3, align 8, !dbg !4913
  %297 = getelementptr inbounds nuw %struct.object, ptr %296, i32 0, i32 2, !dbg !4915
  %298 = load i8, ptr %297, align 1, !dbg !4915
  %299 = zext i8 %298 to i64, !dbg !4916
  %300 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %299, !dbg !4916
  %301 = getelementptr inbounds nuw %struct.weapon_info, ptr %300, i32 0, i32 21, !dbg !4917
  %302 = load i8, ptr %301, align 2, !dbg !4917
  %303 = sext i8 %302 to i32, !dbg !4916
  store i32 %303, ptr %10, align 4, !dbg !4918
  %304 = load i32, ptr %10, align 4, !dbg !4919
  %305 = icmp ne i32 %304, -1, !dbg !4919
  %306 = zext i1 %305 to i32, !dbg !4919
  call void @_Z7_AssertiPKcS0_i(i32 noundef %306, ptr noundef @.str.26, ptr noundef @.str.3, i32 noundef 2626), !dbg !4919
  br label %314, !dbg !4920

307:                                              ; preds = %289
  %308 = load ptr, ptr %3, align 8, !dbg !4921
  %309 = getelementptr inbounds nuw %struct.object, ptr %308, i32 0, i32 1, !dbg !4921
  %310 = load i8, ptr %309, align 4, !dbg !4921
  %311 = zext i8 %310 to i32, !dbg !4921
  %312 = icmp eq i32 %311, 2, !dbg !4921
  %313 = zext i1 %312 to i32, !dbg !4921
  call void @_Z7_AssertiPKcS0_i(i32 noundef %313, ptr noundef @.str.27, ptr noundef @.str.3, i32 noundef 2630), !dbg !4921
  store i32 29, ptr %10, align 4, !dbg !4923
  br label %314

314:                                              ; preds = %307, %295
  br label %328, !dbg !4924

315:                                              ; preds = %286
  %316 = load ptr, ptr %3, align 8, !dbg !4925
  %317 = getelementptr inbounds nuw %struct.object, ptr %316, i32 0, i32 2, !dbg !4927
  %318 = load i8, ptr %317, align 1, !dbg !4927
  %319 = zext i8 %318 to i32, !dbg !4925
  switch i32 %319, label %321 [
    i32 38, label %320
  ], !dbg !4928

320:                                              ; preds = %315
  store i32 47, ptr %10, align 4, !dbg !4929
  br label %327, !dbg !4931

321:                                              ; preds = %315
  %322 = load i32, ptr %7, align 4, !dbg !4932
  %323 = icmp eq i32 %322, 4, !dbg !4934
  br i1 %323, label %324, label %325, !dbg !4934

324:                                              ; preds = %321
  store i32 19, ptr %10, align 4, !dbg !4935
  br label %326, !dbg !4936

325:                                              ; preds = %321
  store i32 29, ptr %10, align 4, !dbg !4937
  br label %326

326:                                              ; preds = %325, %324
  br label %327, !dbg !4938

327:                                              ; preds = %326, %320
  br label %328

328:                                              ; preds = %327, %314
  store i32 1, ptr %5, align 4, !dbg !4939
  store i32 0, ptr %11, align 4, !dbg !4940
  br label %329, !dbg !4942

329:                                              ; preds = %352, %328
  %330 = load i32, ptr %11, align 4, !dbg !4943
  %331 = load i32, ptr %4, align 4, !dbg !4945
  %332 = icmp slt i32 %330, %331, !dbg !4946
  br i1 %332, label %333, label %355, !dbg !4947

333:                                              ; preds = %329
    #dbg_declare(ptr %16, !4948, !DIExpression(), !4950)
  %334 = load i32, ptr %6, align 4, !dbg !4951
  %335 = icmp eq i32 %334, 0, !dbg !4952
  br i1 %335, label %336, label %337, !dbg !4953

336:                                              ; preds = %333
  br label %345, !dbg !4953

337:                                              ; preds = %333
  %338 = call noundef i32 @_Z6P_Randv(), !dbg !4954
  %339 = load i32, ptr %6, align 4, !dbg !4955
  %340 = mul nsw i32 %338, %339, !dbg !4956
  %341 = ashr i32 %340, 15, !dbg !4957
  %342 = sext i32 %341 to i64, !dbg !4958
  %343 = getelementptr inbounds [30 x i32], ptr %9, i64 0, i64 %342, !dbg !4958
  %344 = load i32, ptr %343, align 4, !dbg !4958
  br label %345, !dbg !4953

345:                                              ; preds = %337, %336
  %346 = phi i32 [ -1, %336 ], [ %344, %337 ], !dbg !4953
  store i32 %346, ptr %16, align 4, !dbg !4959
  %347 = load ptr, ptr %3, align 8, !dbg !4960
  %348 = load i32, ptr %16, align 4, !dbg !4961
  %349 = load i32, ptr %10, align 4, !dbg !4962
  %350 = load i32, ptr %5, align 4, !dbg !4963
  %351 = call noundef i32 @_Z21create_homing_missileP6objectiii(ptr noundef %347, i32 noundef %348, i32 noundef %349, i32 noundef %350), !dbg !4964
  store i32 0, ptr %5, align 4, !dbg !4965
  br label %352, !dbg !4966

352:                                              ; preds = %345
  %353 = load i32, ptr %11, align 4, !dbg !4967
  %354 = add nsw i32 %353, 1, !dbg !4967
  store i32 %354, ptr %11, align 4, !dbg !4967
  br label %329, !dbg !4968, !llvm.loop !4969

355:                                              ; preds = %329
  br label %356, !dbg !4971

356:                                              ; preds = %355, %158
  ret void, !dbg !4972
}

declare void @_Z18blast_nearby_glassP6objecti(ptr noundef, i32 noundef) #1

declare void @_Z7P_SRandi(i32 noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z22release_guided_missilei(i32 noundef %0) #0 !dbg !4973 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !4976, !DIExpression(), !4977)
  %3 = load i32, ptr %2, align 4, !dbg !4978
  %4 = load i32, ptr @Player_num, align 4, !dbg !4980
  %5 = icmp eq i32 %3, %4, !dbg !4981
  br i1 %5, label %6, label %22, !dbg !4981

6:                                                ; preds = %1
  %7 = load i32, ptr %2, align 4, !dbg !4982
  %8 = sext i32 %7 to i64, !dbg !4985
  %9 = getelementptr inbounds [8 x ptr], ptr @Guided_missile, i64 0, i64 %8, !dbg !4985
  %10 = load ptr, ptr %9, align 8, !dbg !4985
  %11 = icmp eq ptr %10, null, !dbg !4986
  br i1 %11, label %12, label %13, !dbg !4986

12:                                               ; preds = %6
  br label %26, !dbg !4987

13:                                               ; preds = %6
  %14 = load i32, ptr %2, align 4, !dbg !4988
  %15 = sext i32 %14 to i64, !dbg !4989
  %16 = getelementptr inbounds [8 x ptr], ptr @Guided_missile, i64 0, i64 %15, !dbg !4989
  %17 = load ptr, ptr %16, align 8, !dbg !4989
  store ptr %17, ptr @Missile_viewer, align 8, !dbg !4990
  %18 = load i32, ptr @Newdemo_state, align 4, !dbg !4991
  %19 = icmp eq i32 %18, 1, !dbg !4993
  br i1 %19, label %20, label %21, !dbg !4993

20:                                               ; preds = %13
  call void @_Z25newdemo_record_guided_endv(), !dbg !4994
  br label %21, !dbg !4994

21:                                               ; preds = %20, %13
  br label %22, !dbg !4995

22:                                               ; preds = %21, %1
  %23 = load i32, ptr %2, align 4, !dbg !4996
  %24 = sext i32 %23 to i64, !dbg !4997
  %25 = getelementptr inbounds [8 x ptr], ptr @Guided_missile, i64 0, i64 %24, !dbg !4997
  store ptr null, ptr %25, align 8, !dbg !4998
  br label %26, !dbg !4999

26:                                               ; preds = %22, %12
  ret void, !dbg !4999
}

declare void @_Z25newdemo_record_guided_endv() #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z17do_missile_firingi(i32 noundef %0) #0 !dbg !5000 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca %struct.vms_vector, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !5001, !DIExpression(), !5002)
    #dbg_declare(ptr %3, !5003, !DIExpression(), !5004)
  store i32 0, ptr %3, align 4, !dbg !5004
  %7 = load i8, ptr @Secondary_weapon, align 1, !dbg !5005
  %8 = sext i8 %7 to i32, !dbg !5005
  %9 = icmp slt i32 %8, 10, !dbg !5005
  %10 = zext i1 %9 to i32, !dbg !5005
  call void @_Z7_AssertiPKcS0_i(i32 noundef %10, ptr noundef @.str.28, ptr noundef @.str.3, i32 noundef 2726), !dbg !5005
  %11 = load i32, ptr @Player_num, align 4, !dbg !5006
  %12 = sext i32 %11 to i64, !dbg !5008
  %13 = getelementptr inbounds [8 x ptr], ptr @Guided_missile, i64 0, i64 %12, !dbg !5008
  %14 = load ptr, ptr %13, align 8, !dbg !5008
  %15 = icmp ne ptr %14, null, !dbg !5008
  br i1 %15, label %16, label %40, !dbg !5009

16:                                               ; preds = %1
  %17 = load i32, ptr @Player_num, align 4, !dbg !5010
  %18 = sext i32 %17 to i64, !dbg !5011
  %19 = getelementptr inbounds [8 x ptr], ptr @Guided_missile, i64 0, i64 %18, !dbg !5011
  %20 = load ptr, ptr %19, align 8, !dbg !5011
  %21 = getelementptr inbounds nuw %struct.object, ptr %20, i32 0, i32 0, !dbg !5012
  %22 = load i32, ptr %21, align 4, !dbg !5012
  %23 = load i32, ptr @Player_num, align 4, !dbg !5013
  %24 = sext i32 %23 to i64, !dbg !5014
  %25 = getelementptr inbounds [8 x i32], ptr @Guided_missile_sig, i64 0, i64 %24, !dbg !5014
  %26 = load i32, ptr %25, align 4, !dbg !5014
  %27 = icmp eq i32 %22, %26, !dbg !5015
  br i1 %27, label %28, label %40, !dbg !5009

28:                                               ; preds = %16
  %29 = load i32, ptr @Player_num, align 4, !dbg !5016
  call void @_Z22release_guided_missilei(i32 noundef %29), !dbg !5018
  %30 = load i32, ptr @GameTime, align 4, !dbg !5019
  %31 = load i8, ptr @Secondary_weapon, align 1, !dbg !5020
  %32 = sext i8 %31 to i64, !dbg !5021
  %33 = getelementptr inbounds [10 x i8], ptr @Secondary_weapon_to_weapon_info, i64 0, i64 %32, !dbg !5021
  %34 = load i8, ptr %33, align 1, !dbg !5021
  %35 = zext i8 %34 to i64, !dbg !5022
  %36 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %35, !dbg !5022
  %37 = getelementptr inbounds nuw %struct.weapon_info, ptr %36, i32 0, i32 23, !dbg !5023
  %38 = load i32, ptr %37, align 4, !dbg !5023
  %39 = add nsw i32 %30, %38, !dbg !5024
  store i32 %39, ptr @Next_missile_fire_time, align 4, !dbg !5025
  br label %182, !dbg !5026

40:                                               ; preds = %16, %1
  %41 = load i32, ptr @Player_is_dead, align 4, !dbg !5027
  %42 = icmp ne i32 %41, 0, !dbg !5027
  br i1 %42, label %182, label %43, !dbg !5029

43:                                               ; preds = %40
  %44 = load i32, ptr @Player_num, align 4, !dbg !5030
  %45 = sext i32 %44 to i64, !dbg !5031
  %46 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %45, !dbg !5031
  %47 = getelementptr inbounds nuw %struct.player, ptr %46, i32 0, i32 18, !dbg !5032
  %48 = load i8, ptr @Secondary_weapon, align 1, !dbg !5033
  %49 = sext i8 %48 to i64, !dbg !5031
  %50 = getelementptr inbounds [10 x i16], ptr %47, i64 0, i64 %49, !dbg !5031
  %51 = load i16, ptr %50, align 2, !dbg !5031
  %52 = zext i16 %51 to i32, !dbg !5031
  %53 = icmp sgt i32 %52, 0, !dbg !5034
  br i1 %53, label %54, label %182, !dbg !5029

54:                                               ; preds = %43
    #dbg_declare(ptr %4, !5035, !DIExpression(), !5037)
    #dbg_declare(ptr %5, !5038, !DIExpression(), !5039)
  %55 = load i32, ptr @Player_num, align 4, !dbg !5040
  %56 = sext i32 %55 to i64, !dbg !5041
  %57 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %56, !dbg !5041
  %58 = getelementptr inbounds nuw %struct.player, ptr %57, i32 0, i32 18, !dbg !5042
  %59 = load i8, ptr @Secondary_weapon, align 1, !dbg !5043
  %60 = sext i8 %59 to i64, !dbg !5041
  %61 = getelementptr inbounds [10 x i16], ptr %58, i64 0, i64 %60, !dbg !5041
  %62 = load i16, ptr %61, align 2, !dbg !5044
  %63 = add i16 %62, -1, !dbg !5044
  store i16 %63, ptr %61, align 2, !dbg !5044
  %64 = load i8, ptr @Secondary_weapon, align 1, !dbg !5045
  %65 = sext i8 %64 to i64, !dbg !5046
  %66 = getelementptr inbounds [10 x i8], ptr @Secondary_weapon_to_weapon_info, i64 0, i64 %65, !dbg !5046
  %67 = load i8, ptr %66, align 1, !dbg !5046
  %68 = zext i8 %67 to i32, !dbg !5046
  store i32 %68, ptr %4, align 4, !dbg !5047
  %69 = load i32, ptr @Laser_rapid_fire, align 4, !dbg !5048
  %70 = icmp ne i32 %69, 12245589, !dbg !5050
  br i1 %70, label %71, label %79, !dbg !5050

71:                                               ; preds = %54
  %72 = load i32, ptr @GameTime, align 4, !dbg !5051
  %73 = load i32, ptr %4, align 4, !dbg !5052
  %74 = sext i32 %73 to i64, !dbg !5053
  %75 = getelementptr inbounds [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %74, !dbg !5053
  %76 = getelementptr inbounds nuw %struct.weapon_info, ptr %75, i32 0, i32 23, !dbg !5054
  %77 = load i32, ptr %76, align 4, !dbg !5054
  %78 = add nsw i32 %72, %77, !dbg !5055
  store i32 %78, ptr @Next_missile_fire_time, align 4, !dbg !5056
  br label %82, !dbg !5057

79:                                               ; preds = %54
  %80 = load i32, ptr @GameTime, align 4, !dbg !5058
  %81 = add nsw i32 %80, 2621, !dbg !5059
  store i32 %81, ptr @Next_missile_fire_time, align 4, !dbg !5060
  br label %82

82:                                               ; preds = %79, %71
  %83 = load i8, ptr @Secondary_weapon, align 1, !dbg !5061
  %84 = sext i8 %83 to i64, !dbg !5062
  %85 = getelementptr inbounds [10 x i8], ptr @Secondary_weapon_to_gun_num, i64 0, i64 %84, !dbg !5062
  %86 = load i8, ptr %85, align 1, !dbg !5062
  %87 = zext i8 %86 to i32, !dbg !5062
  store i32 %87, ptr %5, align 4, !dbg !5063
  %88 = load i32, ptr %5, align 4, !dbg !5064
  %89 = icmp eq i32 %88, 4, !dbg !5066
  br i1 %89, label %90, label %97, !dbg !5066

90:                                               ; preds = %82
  %91 = load i32, ptr @Missile_gun, align 4, !dbg !5067
  %92 = and i32 %91, 1, !dbg !5069
  store i32 %92, ptr %3, align 4, !dbg !5070
  %93 = load i32, ptr %5, align 4, !dbg !5071
  %94 = add nsw i32 %93, %92, !dbg !5071
  store i32 %94, ptr %5, align 4, !dbg !5071
  %95 = load i32, ptr @Missile_gun, align 4, !dbg !5072
  %96 = add nsw i32 %95, 1, !dbg !5072
  store i32 %96, ptr @Missile_gun, align 4, !dbg !5072
  br label %97, !dbg !5073

97:                                               ; preds = %90, %82
  %98 = load ptr, ptr @ConsoleObject, align 8, !dbg !5074
  %99 = load i32, ptr %4, align 4, !dbg !5075
  %100 = load i32, ptr %5, align 4, !dbg !5076
  call void @_Z17Laser_player_fireP6objectiiii(ptr noundef %98, i32 noundef %99, i32 noundef %100, i32 noundef 1, i32 noundef 0), !dbg !5077
  %101 = load i8, ptr @Secondary_weapon, align 1, !dbg !5078
  %102 = sext i8 %101 to i32, !dbg !5078
  %103 = icmp eq i32 %102, 2, !dbg !5080
  br i1 %103, label %104, label %110, !dbg !5080

104:                                              ; preds = %97
  %105 = load i32, ptr @Proximity_dropped, align 4, !dbg !5081
  %106 = add nsw i32 %105, 1, !dbg !5081
  store i32 %106, ptr @Proximity_dropped, align 4, !dbg !5081
  %107 = icmp eq i32 %106, 4, !dbg !5084
  br i1 %107, label %108, label %109, !dbg !5084

108:                                              ; preds = %104
  store i32 0, ptr @Proximity_dropped, align 4, !dbg !5085
  br label %109, !dbg !5087

109:                                              ; preds = %108, %104
  br label %121, !dbg !5088

110:                                              ; preds = %97
  %111 = load i8, ptr @Secondary_weapon, align 1, !dbg !5089
  %112 = sext i8 %111 to i32, !dbg !5089
  %113 = icmp eq i32 %112, 7, !dbg !5091
  br i1 %113, label %114, label %120, !dbg !5091

114:                                              ; preds = %110
  %115 = load i32, ptr @Smartmines_dropped, align 4, !dbg !5092
  %116 = add nsw i32 %115, 1, !dbg !5092
  store i32 %116, ptr @Smartmines_dropped, align 4, !dbg !5092
  %117 = icmp eq i32 %116, 4, !dbg !5095
  br i1 %117, label %118, label %119, !dbg !5095

118:                                              ; preds = %114
  store i32 0, ptr @Smartmines_dropped, align 4, !dbg !5096
  br label %119, !dbg !5098

119:                                              ; preds = %118, %114
  br label %120, !dbg !5099

120:                                              ; preds = %119, %110
  br label %121

121:                                              ; preds = %120, %109
  %122 = load i8, ptr @Secondary_weapon, align 1, !dbg !5100
  %123 = sext i8 %122 to i32, !dbg !5100
  %124 = icmp eq i32 %123, 4, !dbg !5102
  br i1 %124, label %129, label %125, !dbg !5103

125:                                              ; preds = %121
  %126 = load i8, ptr @Secondary_weapon, align 1, !dbg !5104
  %127 = sext i8 %126 to i32, !dbg !5104
  %128 = icmp eq i32 %127, 9, !dbg !5105
  br i1 %128, label %129, label %177, !dbg !5103

129:                                              ; preds = %125, %121
    #dbg_declare(ptr %6, !5106, !DIExpression(), !5108)
  %130 = load ptr, ptr @ConsoleObject, align 8, !dbg !5109
  %131 = getelementptr inbounds nuw %struct.object, ptr %130, i32 0, i32 12, !dbg !5110
  %132 = getelementptr inbounds nuw %struct.vms_matrix, ptr %131, i32 0, i32 2, !dbg !5111
  %133 = getelementptr inbounds nuw %struct.vms_vector, ptr %132, i32 0, i32 0, !dbg !5112
  %134 = load i32, ptr %133, align 4, !dbg !5112
  %135 = shl i32 %134, 7, !dbg !5113
  %136 = sub nsw i32 0, %135, !dbg !5114
  %137 = getelementptr inbounds nuw %struct.vms_vector, ptr %6, i32 0, i32 0, !dbg !5115
  store i32 %136, ptr %137, align 4, !dbg !5116
  %138 = load ptr, ptr @ConsoleObject, align 8, !dbg !5117
  %139 = getelementptr inbounds nuw %struct.object, ptr %138, i32 0, i32 12, !dbg !5118
  %140 = getelementptr inbounds nuw %struct.vms_matrix, ptr %139, i32 0, i32 2, !dbg !5119
  %141 = getelementptr inbounds nuw %struct.vms_vector, ptr %140, i32 0, i32 1, !dbg !5120
  %142 = load i32, ptr %141, align 4, !dbg !5120
  %143 = shl i32 %142, 7, !dbg !5121
  %144 = sub nsw i32 0, %143, !dbg !5122
  %145 = getelementptr inbounds nuw %struct.vms_vector, ptr %6, i32 0, i32 1, !dbg !5123
  store i32 %144, ptr %145, align 4, !dbg !5124
  %146 = load ptr, ptr @ConsoleObject, align 8, !dbg !5125
  %147 = getelementptr inbounds nuw %struct.object, ptr %146, i32 0, i32 12, !dbg !5126
  %148 = getelementptr inbounds nuw %struct.vms_matrix, ptr %147, i32 0, i32 2, !dbg !5127
  %149 = getelementptr inbounds nuw %struct.vms_vector, ptr %148, i32 0, i32 2, !dbg !5128
  %150 = load i32, ptr %149, align 4, !dbg !5128
  %151 = shl i32 %150, 7, !dbg !5129
  %152 = sub nsw i32 0, %151, !dbg !5130
  %153 = getelementptr inbounds nuw %struct.vms_vector, ptr %6, i32 0, i32 2, !dbg !5131
  store i32 %152, ptr %153, align 4, !dbg !5132
  %154 = load ptr, ptr @ConsoleObject, align 8, !dbg !5133
  call void @_Z16phys_apply_forceP6objectP10vms_vector(ptr noundef %154, ptr noundef %6), !dbg !5134
  %155 = getelementptr inbounds nuw %struct.vms_vector, ptr %6, i32 0, i32 0, !dbg !5135
  %156 = load i32, ptr %155, align 4, !dbg !5135
  %157 = ashr i32 %156, 4, !dbg !5136
  %158 = call noundef i32 @_Z6P_Randv(), !dbg !5137
  %159 = add nsw i32 %157, %158, !dbg !5138
  %160 = sub nsw i32 %159, 16384, !dbg !5139
  %161 = getelementptr inbounds nuw %struct.vms_vector, ptr %6, i32 0, i32 0, !dbg !5140
  store i32 %160, ptr %161, align 4, !dbg !5141
  %162 = getelementptr inbounds nuw %struct.vms_vector, ptr %6, i32 0, i32 1, !dbg !5142
  %163 = load i32, ptr %162, align 4, !dbg !5142
  %164 = ashr i32 %163, 4, !dbg !5143
  %165 = call noundef i32 @_Z6P_Randv(), !dbg !5144
  %166 = add nsw i32 %164, %165, !dbg !5145
  %167 = sub nsw i32 %166, 16384, !dbg !5146
  %168 = getelementptr inbounds nuw %struct.vms_vector, ptr %6, i32 0, i32 1, !dbg !5147
  store i32 %167, ptr %168, align 4, !dbg !5148
  %169 = getelementptr inbounds nuw %struct.vms_vector, ptr %6, i32 0, i32 2, !dbg !5149
  %170 = load i32, ptr %169, align 4, !dbg !5149
  %171 = ashr i32 %170, 4, !dbg !5150
  %172 = call noundef i32 @_Z6P_Randv(), !dbg !5151
  %173 = add nsw i32 %171, %172, !dbg !5152
  %174 = sub nsw i32 %173, 16384, !dbg !5153
  %175 = getelementptr inbounds nuw %struct.vms_vector, ptr %6, i32 0, i32 2, !dbg !5154
  store i32 %174, ptr %175, align 4, !dbg !5155
  %176 = load ptr, ptr @ConsoleObject, align 8, !dbg !5156
  call void @_Z14phys_apply_rotP6objectP10vms_vector(ptr noundef %176, ptr noundef %6), !dbg !5157
  br label %177, !dbg !5158

177:                                              ; preds = %129, %125
  %178 = load i32, ptr %2, align 4, !dbg !5159
  %179 = icmp ne i32 %178, 0, !dbg !5159
  br i1 %179, label %180, label %181, !dbg !5159

180:                                              ; preds = %177
  call void @_Z18auto_select_weaponi(i32 noundef 1), !dbg !5161
  br label %181, !dbg !5161

181:                                              ; preds = %180, %177
  br label %182, !dbg !5162

182:                                              ; preds = %28, %181, %43, %40
  ret void, !dbg !5163
}

attributes #0 = { mustprogress noinline ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #4 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!441, !442, !443, !444, !445, !446, !447}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!448}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "Laser_rapid_fire", scope: !2, file: !31, line: 60, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !3, producer: "Homebrew clang version 20.1.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !17, globals: !28, imports: !372, splitDebugInlining: false, nameTableKind: Apple, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk", sdk: "MacOSX15.sdk")
!3 = !DIFile(filename: "/Users/richard/code/ChocolateDescent/main_d2/laser.cpp", directory: "/Users/richard/code/ChocolateDescent/build-c-ref", checksumkind: CSK_MD5, checksum: "79ca20e1e3201a472f56b0dfcac8aaa8")
!4 = !{!5, !13}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "LogicVer", file: !6, line: 56, baseType: !7, size: 32, flags: DIFlagEnumClass, elements: !8, identifier: "_ZTS8LogicVer")
!6 = !DIFile(filename: "main_d2/inferno.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "f9bd7760bcc54609c0547a3a7ca7ee90")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{!9, !10, !11, !12}
!9 = !DIEnumerator(name: "SHAREWARE", value: 0)
!10 = !DIEnumerator(name: "FULL_1_0", value: 1)
!11 = !DIEnumerator(name: "FULL_1_1", value: 2)
!12 = !DIEnumerator(name: "FULL_1_2", value: 3)
!13 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "DataVer", file: !6, line: 72, baseType: !7, size: 32, flags: DIFlagEnumClass, elements: !14, identifier: "_ZTS7DataVer")
!14 = !{!15, !16}
!15 = !DIEnumerator(name: "DEMO", value: 0)
!16 = !DIEnumerator(name: "FULL", value: 1)
!17 = !{!18, !21, !25}
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !19, line: 30, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int8_t.h", directory: "", checksumkind: CSK_MD5, checksum: "5052dfe782b50fed2355b8f61a9e4fa9")
!20 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "fix", file: !22, line: 20, baseType: !23)
!22 = !DIFile(filename: "./fix/fix.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "c5006a11bf8b4cb7d963898499eda13a")
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !24, line: 30, baseType: !7)
!24 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int32_t.h", directory: "", checksumkind: CSK_MD5, checksum: "d23e8406e80ee79983f28509c741fa17")
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !26, line: 30, baseType: !27)
!26 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int64_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e6d85c1a9e23dbf7518ce3b162aac800")
!27 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!28 = !{!0, !29, !181, !184, !187, !193, !195, !200, !205, !210, !215, !220, !222, !224, !229, !234, !239, !244, !249, !254, !256, !266, !268, !273, !278, !283, !286, !291, !296, !301, !306, !311, !313, !315, !321, !323, !325, !327, !329, !331, !336, !338, !343, !348, !353, !358, !360, !362, !364, !369}
!29 = !DIGlobalVariableExpression(var: !30, expr: !DIExpression())
!30 = distinct !DIGlobalVariable(name: "Guided_missile", scope: !2, file: !31, line: 62, type: !32, isLocal: false, isDefinition: true)
!31 = !DIFile(filename: "main_d2/laser.cpp", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "79ca20e1e3201a472f56b0dfcac8aaa8")
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 512, elements: !179)
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "object", file: !35, line: 259, baseType: !36)
!35 = !DIFile(filename: "main_d2/object.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "1f2325d356aae4b692933d2aae4f3afd")
!36 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "object", file: !35, line: 210, size: 2144, flags: DIFlagTypePassByValue, elements: !37, identifier: "_ZTS6object")
!37 = !{!38, !39, !43, !44, !46, !47, !48, !49, !50, !51, !52, !53, !61, !68, !69, !70, !71, !72, !73, !74, !75, !76, !97, !151}
!38 = !DIDerivedType(tag: DW_TAG_member, name: "signature", scope: !36, file: !35, line: 212, baseType: !7, size: 32)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !36, file: !35, line: 213, baseType: !40, size: 8, offset: 32)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !41, line: 31, baseType: !42)
!41 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint8_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8b64ccf8c67b8c006b07b8daf1b49be5")
!42 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !36, file: !35, line: 214, baseType: !40, size: 8, offset: 40)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !36, file: !35, line: 215, baseType: !45, size: 16, offset: 48)
!45 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "prev", scope: !36, file: !35, line: 215, baseType: !45, size: 16, offset: 64)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "control_type", scope: !36, file: !35, line: 216, baseType: !40, size: 8, offset: 80)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "movement_type", scope: !36, file: !35, line: 217, baseType: !40, size: 8, offset: 88)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "render_type", scope: !36, file: !35, line: 218, baseType: !40, size: 8, offset: 96)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !36, file: !35, line: 219, baseType: !40, size: 8, offset: 104)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "segnum", scope: !36, file: !35, line: 220, baseType: !45, size: 16, offset: 112)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "attached_obj", scope: !36, file: !35, line: 221, baseType: !45, size: 16, offset: 128)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !36, file: !35, line: 222, baseType: !54, size: 96, offset: 160)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_vector", file: !55, line: 22, baseType: !56)
!55 = !DIFile(filename: "./vecmat/vecmat.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "dfa84e3325c1ea4f5f74699fff5ef2bf")
!56 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_vector", file: !55, line: 19, size: 96, flags: DIFlagTypePassByValue, elements: !57, identifier: "_ZTS10vms_vector")
!57 = !{!58, !59, !60}
!58 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !56, file: !55, line: 21, baseType: !21, size: 32)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !56, file: !55, line: 21, baseType: !21, size: 32, offset: 32)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !56, file: !55, line: 21, baseType: !21, size: 32, offset: 64)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "orient", scope: !36, file: !35, line: 223, baseType: !62, size: 288, offset: 256)
!62 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_matrix", file: !55, line: 47, baseType: !63)
!63 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_matrix", file: !55, line: 44, size: 288, flags: DIFlagTypePassByValue, elements: !64, identifier: "_ZTS10vms_matrix")
!64 = !{!65, !66, !67}
!65 = !DIDerivedType(tag: DW_TAG_member, name: "rvec", scope: !63, file: !55, line: 46, baseType: !54, size: 96)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "uvec", scope: !63, file: !55, line: 46, baseType: !54, size: 96, offset: 96)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "fvec", scope: !63, file: !55, line: 46, baseType: !54, size: 96, offset: 192)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !36, file: !35, line: 224, baseType: !21, size: 32, offset: 544)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "shields", scope: !36, file: !35, line: 225, baseType: !21, size: 32, offset: 576)
!70 = !DIDerivedType(tag: DW_TAG_member, name: "last_pos", scope: !36, file: !35, line: 226, baseType: !54, size: 96, offset: 608)
!71 = !DIDerivedType(tag: DW_TAG_member, name: "contains_type", scope: !36, file: !35, line: 227, baseType: !18, size: 8, offset: 704)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "contains_id", scope: !36, file: !35, line: 228, baseType: !18, size: 8, offset: 712)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "contains_count", scope: !36, file: !35, line: 229, baseType: !18, size: 8, offset: 720)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "matcen_creator", scope: !36, file: !35, line: 230, baseType: !18, size: 8, offset: 728)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "lifeleft", scope: !36, file: !35, line: 231, baseType: !21, size: 32, offset: 736)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "mtype", scope: !36, file: !35, line: 240, baseType: !77, size: 512, offset: 768)
!77 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !36, file: !35, line: 236, size: 512, flags: DIFlagTypePassByValue, elements: !78, identifier: "_ZTSN6objectUt_E")
!78 = !{!79, !96}
!79 = !DIDerivedType(tag: DW_TAG_member, name: "phys_info", scope: !77, file: !35, line: 238, baseType: !80, size: 512)
!80 = !DIDerivedType(tag: DW_TAG_typedef, name: "physics_info", file: !35, line: 153, baseType: !81)
!81 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "physics_info", file: !35, line: 142, size: 512, flags: DIFlagTypePassByValue, elements: !82, identifier: "_ZTS12physics_info")
!82 = !{!83, !84, !85, !86, !87, !88, !89, !90, !92}
!83 = !DIDerivedType(tag: DW_TAG_member, name: "velocity", scope: !81, file: !35, line: 144, baseType: !54, size: 96)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "thrust", scope: !81, file: !35, line: 145, baseType: !54, size: 96, offset: 96)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "mass", scope: !81, file: !35, line: 146, baseType: !21, size: 32, offset: 192)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "drag", scope: !81, file: !35, line: 147, baseType: !21, size: 32, offset: 224)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "brakes", scope: !81, file: !35, line: 148, baseType: !21, size: 32, offset: 256)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "rotvel", scope: !81, file: !35, line: 149, baseType: !54, size: 96, offset: 288)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "rotthrust", scope: !81, file: !35, line: 150, baseType: !54, size: 96, offset: 384)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "turnroll", scope: !81, file: !35, line: 151, baseType: !91, size: 16, offset: 480)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "fixang", file: !22, line: 21, baseType: !45)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !81, file: !35, line: 152, baseType: !93, size: 16, offset: 496)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !94, line: 31, baseType: !95)
!94 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint16_t.h", directory: "", checksumkind: CSK_MD5, checksum: "f0aa926da906b10566dd3171bf347ab7")
!95 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "spin_rate", scope: !77, file: !35, line: 239, baseType: !54, size: 96)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "ctype", scope: !36, file: !35, line: 250, baseType: !98, size: 256, offset: 1280)
!98 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !36, file: !35, line: 243, size: 256, flags: DIFlagTypePassByValue, elements: !99, identifier: "_ZTSN6objectUt0_E")
!99 = !{!100, !111, !121, !139, !144}
!100 = !DIDerivedType(tag: DW_TAG_member, name: "laser_info", scope: !98, file: !35, line: 245, baseType: !101, size: 160)
!101 = !DIDerivedType(tag: DW_TAG_typedef, name: "laser_info_t", file: !35, line: 166, baseType: !102)
!102 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "laser_info_s", file: !35, line: 157, size: 160, flags: DIFlagTypePassByValue, elements: !103, identifier: "_ZTS12laser_info_s")
!103 = !{!104, !105, !106, !107, !108, !109, !110}
!104 = !DIDerivedType(tag: DW_TAG_member, name: "parent_type", scope: !102, file: !35, line: 159, baseType: !45, size: 16)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "parent_num", scope: !102, file: !35, line: 160, baseType: !45, size: 16, offset: 16)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "parent_signature", scope: !102, file: !35, line: 161, baseType: !7, size: 32, offset: 32)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "creation_time", scope: !102, file: !35, line: 162, baseType: !21, size: 32, offset: 64)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "last_hitobj", scope: !102, file: !35, line: 163, baseType: !45, size: 16, offset: 96)
!109 = !DIDerivedType(tag: DW_TAG_member, name: "track_goal", scope: !102, file: !35, line: 164, baseType: !45, size: 16, offset: 112)
!110 = !DIDerivedType(tag: DW_TAG_member, name: "multiplier", scope: !102, file: !35, line: 165, baseType: !21, size: 32, offset: 128)
!111 = !DIDerivedType(tag: DW_TAG_member, name: "expl_info", scope: !98, file: !35, line: 246, baseType: !112, size: 128)
!112 = !DIDerivedType(tag: DW_TAG_typedef, name: "explosion_info", file: !35, line: 176, baseType: !113)
!113 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "explosion_info", file: !35, line: 168, size: 128, flags: DIFlagTypePassByValue, elements: !114, identifier: "_ZTS14explosion_info")
!114 = !{!115, !116, !117, !118, !119, !120}
!115 = !DIDerivedType(tag: DW_TAG_member, name: "spawn_time", scope: !113, file: !35, line: 170, baseType: !21, size: 32)
!116 = !DIDerivedType(tag: DW_TAG_member, name: "delete_time", scope: !113, file: !35, line: 171, baseType: !21, size: 32, offset: 32)
!117 = !DIDerivedType(tag: DW_TAG_member, name: "delete_objnum", scope: !113, file: !35, line: 172, baseType: !45, size: 16, offset: 64)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "attach_parent", scope: !113, file: !35, line: 173, baseType: !45, size: 16, offset: 80)
!119 = !DIDerivedType(tag: DW_TAG_member, name: "prev_attach", scope: !113, file: !35, line: 174, baseType: !45, size: 16, offset: 96)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "next_attach", scope: !113, file: !35, line: 175, baseType: !45, size: 16, offset: 112)
!121 = !DIDerivedType(tag: DW_TAG_member, name: "ai_info", scope: !98, file: !35, line: 247, baseType: !122, size: 256)
!122 = !DIDerivedType(tag: DW_TAG_typedef, name: "ai_static", file: !123, line: 144, baseType: !124)
!123 = !DIFile(filename: "main_d2/aistruct.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "d122430e792a0ddc0f9eaa08ad217628")
!124 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ai_static", file: !123, line: 127, size: 256, flags: DIFlagTypePassByValue, elements: !125, identifier: "_ZTS9ai_static")
!125 = !{!126, !127, !131, !132, !133, !134, !135, !136, !137, !138}
!126 = !DIDerivedType(tag: DW_TAG_member, name: "behavior", scope: !124, file: !123, line: 128, baseType: !40, size: 8)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !124, file: !123, line: 129, baseType: !128, size: 88, offset: 8)
!128 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 88, elements: !129)
!129 = !{!130}
!130 = !DISubrange(count: 11)
!131 = !DIDerivedType(tag: DW_TAG_member, name: "hide_segment", scope: !124, file: !123, line: 130, baseType: !45, size: 16, offset: 96)
!132 = !DIDerivedType(tag: DW_TAG_member, name: "hide_index", scope: !124, file: !123, line: 131, baseType: !45, size: 16, offset: 112)
!133 = !DIDerivedType(tag: DW_TAG_member, name: "path_length", scope: !124, file: !123, line: 132, baseType: !45, size: 16, offset: 128)
!134 = !DIDerivedType(tag: DW_TAG_member, name: "cur_path_index", scope: !124, file: !123, line: 133, baseType: !18, size: 8, offset: 144)
!135 = !DIDerivedType(tag: DW_TAG_member, name: "dying_sound_playing", scope: !124, file: !123, line: 134, baseType: !18, size: 8, offset: 152)
!136 = !DIDerivedType(tag: DW_TAG_member, name: "danger_laser_num", scope: !124, file: !123, line: 139, baseType: !45, size: 16, offset: 160)
!137 = !DIDerivedType(tag: DW_TAG_member, name: "danger_laser_signature", scope: !124, file: !123, line: 140, baseType: !7, size: 32, offset: 192)
!138 = !DIDerivedType(tag: DW_TAG_member, name: "dying_start_time", scope: !124, file: !123, line: 141, baseType: !21, size: 32, offset: 224)
!139 = !DIDerivedType(tag: DW_TAG_member, name: "light_info", scope: !98, file: !35, line: 248, baseType: !140, size: 32)
!140 = !DIDerivedType(tag: DW_TAG_typedef, name: "light_info_t", file: !35, line: 181, baseType: !141)
!141 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "light_info_s", file: !35, line: 178, size: 32, flags: DIFlagTypePassByValue, elements: !142, identifier: "_ZTS12light_info_s")
!142 = !{!143}
!143 = !DIDerivedType(tag: DW_TAG_member, name: "intensity", scope: !141, file: !35, line: 180, baseType: !21, size: 32)
!144 = !DIDerivedType(tag: DW_TAG_member, name: "powerup_info", scope: !98, file: !35, line: 249, baseType: !145, size: 96)
!145 = !DIDerivedType(tag: DW_TAG_typedef, name: "powerup_info_t", file: !35, line: 190, baseType: !146)
!146 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "powerup_info_s", file: !35, line: 185, size: 96, flags: DIFlagTypePassByValue, elements: !147, identifier: "_ZTS14powerup_info_s")
!147 = !{!148, !149, !150}
!148 = !DIDerivedType(tag: DW_TAG_member, name: "count", scope: !146, file: !35, line: 187, baseType: !7, size: 32)
!149 = !DIDerivedType(tag: DW_TAG_member, name: "creation_time", scope: !146, file: !35, line: 188, baseType: !21, size: 32, offset: 32)
!150 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !146, file: !35, line: 189, baseType: !7, size: 32, offset: 64)
!151 = !DIDerivedType(tag: DW_TAG_member, name: "rtype", scope: !36, file: !35, line: 257, baseType: !152, size: 608, offset: 1536)
!152 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !36, file: !35, line: 253, size: 608, flags: DIFlagTypePassByValue, elements: !153, identifier: "_ZTSN6objectUt1_E")
!153 = !{!154, !172}
!154 = !DIDerivedType(tag: DW_TAG_member, name: "pobj_info", scope: !152, file: !35, line: 255, baseType: !155, size: 608)
!155 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyobj_info", file: !35, line: 208, baseType: !156)
!156 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "polyobj_info", file: !35, line: 201, size: 608, flags: DIFlagTypePassByValue, elements: !157, identifier: "_ZTS12polyobj_info")
!157 = !{!158, !159, !169, !170, !171}
!158 = !DIDerivedType(tag: DW_TAG_member, name: "model_num", scope: !156, file: !35, line: 203, baseType: !7, size: 32)
!159 = !DIDerivedType(tag: DW_TAG_member, name: "anim_angles", scope: !156, file: !35, line: 204, baseType: !160, size: 480, offset: 32)
!160 = !DICompositeType(tag: DW_TAG_array_type, baseType: !161, size: 480, elements: !167)
!161 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_angvec", file: !55, line: 40, baseType: !162)
!162 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_angvec", file: !55, line: 37, size: 48, flags: DIFlagTypePassByValue, elements: !163, identifier: "_ZTS10vms_angvec")
!163 = !{!164, !165, !166}
!164 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !162, file: !55, line: 39, baseType: !91, size: 16)
!165 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !162, file: !55, line: 39, baseType: !91, size: 16, offset: 16)
!166 = !DIDerivedType(tag: DW_TAG_member, name: "h", scope: !162, file: !55, line: 39, baseType: !91, size: 16, offset: 32)
!167 = !{!168}
!168 = !DISubrange(count: 10)
!169 = !DIDerivedType(tag: DW_TAG_member, name: "subobj_flags", scope: !156, file: !35, line: 205, baseType: !7, size: 32, offset: 512)
!170 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_override", scope: !156, file: !35, line: 206, baseType: !7, size: 32, offset: 544)
!171 = !DIDerivedType(tag: DW_TAG_member, name: "alt_textures", scope: !156, file: !35, line: 207, baseType: !7, size: 32, offset: 576)
!172 = !DIDerivedType(tag: DW_TAG_member, name: "vclip_info", scope: !152, file: !35, line: 256, baseType: !173, size: 96)
!173 = !DIDerivedType(tag: DW_TAG_typedef, name: "vclip_info_t", file: !35, line: 197, baseType: !174)
!174 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vclip_info_s", file: !35, line: 192, size: 96, flags: DIFlagTypePassByValue, elements: !175, identifier: "_ZTS12vclip_info_s")
!175 = !{!176, !177, !178}
!176 = !DIDerivedType(tag: DW_TAG_member, name: "vclip_num", scope: !174, file: !35, line: 194, baseType: !7, size: 32)
!177 = !DIDerivedType(tag: DW_TAG_member, name: "frametime", scope: !174, file: !35, line: 195, baseType: !21, size: 32, offset: 32)
!178 = !DIDerivedType(tag: DW_TAG_member, name: "framenum", scope: !174, file: !35, line: 196, baseType: !18, size: 8, offset: 64)
!179 = !{!180}
!180 = !DISubrange(count: 8)
!181 = !DIGlobalVariableExpression(var: !182, expr: !DIExpression())
!182 = distinct !DIGlobalVariable(name: "Guided_missile_sig", scope: !2, file: !31, line: 63, type: !183, isLocal: false, isDefinition: true)
!183 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 256, elements: !179)
!184 = !DIGlobalVariableExpression(var: !185, expr: !DIExpression())
!185 = distinct !DIGlobalVariable(name: "Multi_is_guided", scope: !2, file: !31, line: 70, type: !186, isLocal: false, isDefinition: true)
!186 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!187 = !DIGlobalVariableExpression(var: !188, expr: !DIExpression())
!188 = distinct !DIGlobalVariable(scope: null, file: !31, line: 97, type: !189, isLocal: true, isDefinition: true)
!189 = !DICompositeType(tag: DW_TAG_array_type, baseType: !190, size: 352, elements: !191)
!190 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !186)
!191 = !{!192}
!192 = !DISubrange(count: 44)
!193 = !DIGlobalVariableExpression(var: !194, expr: !DIExpression())
!194 = distinct !DIGlobalVariable(name: "Laser_offset", scope: !2, file: !31, line: 174, type: !7, isLocal: false, isDefinition: true)
!195 = !DIGlobalVariableExpression(var: !196, expr: !DIExpression())
!196 = distinct !DIGlobalVariable(scope: null, file: !31, line: 260, type: !197, isLocal: true, isDefinition: true)
!197 = !DICompositeType(tag: DW_TAG_array_type, baseType: !190, size: 384, elements: !198)
!198 = !{!199}
!199 = !DISubrange(count: 48)
!200 = !DIGlobalVariableExpression(var: !201, expr: !DIExpression())
!201 = distinct !DIGlobalVariable(scope: null, file: !31, line: 263, type: !202, isLocal: true, isDefinition: true)
!202 = !DICompositeType(tag: DW_TAG_array_type, baseType: !190, size: 152, elements: !203)
!203 = !{!204}
!204 = !DISubrange(count: 19)
!205 = !DIGlobalVariableExpression(var: !206, expr: !DIExpression())
!206 = distinct !DIGlobalVariable(scope: null, file: !31, line: 263, type: !207, isLocal: true, isDefinition: true)
!207 = !DICompositeType(tag: DW_TAG_array_type, baseType: !190, size: 440, elements: !208)
!208 = !{!209}
!209 = !DISubrange(count: 55)
!210 = !DIGlobalVariableExpression(var: !211, expr: !DIExpression())
!211 = distinct !DIGlobalVariable(scope: null, file: !31, line: 264, type: !212, isLocal: true, isDefinition: true)
!212 = !DICompositeType(tag: DW_TAG_array_type, baseType: !190, size: 96, elements: !213)
!213 = !{!214}
!214 = !DISubrange(count: 12)
!215 = !DIGlobalVariableExpression(var: !216, expr: !DIExpression())
!216 = distinct !DIGlobalVariable(scope: null, file: !31, line: 335, type: !217, isLocal: true, isDefinition: true)
!217 = !DICompositeType(tag: DW_TAG_array_type, baseType: !190, size: 288, elements: !218)
!218 = !{!219}
!219 = !DISubrange(count: 36)
!220 = !DIGlobalVariableExpression(var: !221, expr: !DIExpression())
!221 = distinct !DIGlobalVariable(name: "Omega_charge", scope: !2, file: !31, line: 472, type: !21, isLocal: false, isDefinition: true)
!222 = !DIGlobalVariableExpression(var: !223, expr: !DIExpression())
!223 = distinct !DIGlobalVariable(name: "Last_omega_fire_frame", scope: !2, file: !31, line: 476, type: !7, isLocal: false, isDefinition: true)
!224 = !DIGlobalVariableExpression(var: !225, expr: !DIExpression())
!225 = distinct !DIGlobalVariable(scope: null, file: !31, line: 590, type: !226, isLocal: true, isDefinition: true)
!226 = !DICompositeType(tag: DW_TAG_array_type, baseType: !190, size: 528, elements: !227)
!227 = !{!228}
!228 = !DISubrange(count: 66)
!229 = !DIGlobalVariableExpression(var: !230, expr: !DIExpression())
!230 = distinct !DIGlobalVariable(scope: null, file: !31, line: 603, type: !231, isLocal: true, isDefinition: true)
!231 = !DICompositeType(tag: DW_TAG_array_type, baseType: !190, size: 184, elements: !232)
!232 = !{!233}
!233 = !DISubrange(count: 23)
!234 = !DIGlobalVariableExpression(var: !235, expr: !DIExpression())
!235 = distinct !DIGlobalVariable(scope: null, file: !31, line: 624, type: !236, isLocal: true, isDefinition: true)
!236 = !DICompositeType(tag: DW_TAG_array_type, baseType: !190, size: 232, elements: !237)
!237 = !{!238}
!238 = !DISubrange(count: 29)
!239 = !DIGlobalVariableExpression(var: !240, expr: !DIExpression())
!240 = distinct !DIGlobalVariable(scope: null, file: !31, line: 637, type: !241, isLocal: true, isDefinition: true)
!241 = !DICompositeType(tag: DW_TAG_array_type, baseType: !190, size: 304, elements: !242)
!242 = !{!243}
!243 = !DISubrange(count: 38)
!244 = !DIGlobalVariableExpression(var: !245, expr: !DIExpression())
!245 = distinct !DIGlobalVariable(scope: null, file: !31, line: 786, type: !246, isLocal: true, isDefinition: true)
!246 = !DICompositeType(tag: DW_TAG_array_type, baseType: !190, size: 576, elements: !247)
!247 = !{!248}
!248 = !DISubrange(count: 72)
!249 = !DIGlobalVariableExpression(var: !250, expr: !DIExpression())
!250 = distinct !DIGlobalVariable(scope: null, file: !31, line: 862, type: !251, isLocal: true, isDefinition: true)
!251 = !DICompositeType(tag: DW_TAG_array_type, baseType: !190, size: 552, elements: !252)
!252 = !{!253}
!253 = !DISubrange(count: 69)
!254 = !DIGlobalVariableExpression(var: !255, expr: !DIExpression())
!255 = distinct !DIGlobalVariable(name: "Muzzle_queue_index", scope: !2, file: !31, line: 869, type: !7, isLocal: false, isDefinition: true)
!256 = !DIGlobalVariableExpression(var: !257, expr: !DIExpression())
!257 = distinct !DIGlobalVariable(name: "Muzzle_data", scope: !2, file: !31, line: 871, type: !258, isLocal: false, isDefinition: true)
!258 = !DICompositeType(tag: DW_TAG_array_type, baseType: !259, size: 1280, elements: !179)
!259 = !DIDerivedType(tag: DW_TAG_typedef, name: "muzzle_info", file: !260, line: 131, baseType: !261)
!260 = !DIFile(filename: "main_d2/laser.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "0c055cf033461cb61338b5d113c9306f")
!261 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "muzzle_info", file: !260, line: 126, size: 160, flags: DIFlagTypePassByValue, elements: !262, identifier: "_ZTS11muzzle_info")
!262 = !{!263, !264, !265}
!263 = !DIDerivedType(tag: DW_TAG_member, name: "create_time", scope: !261, file: !260, line: 128, baseType: !21, size: 32)
!264 = !DIDerivedType(tag: DW_TAG_member, name: "segnum", scope: !261, file: !260, line: 129, baseType: !45, size: 16, offset: 32)
!265 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !261, file: !260, line: 130, baseType: !54, size: 96, offset: 64)
!266 = !DIGlobalVariableExpression(var: !267, expr: !DIExpression())
!267 = distinct !DIGlobalVariable(name: "Min_trackable_dot", scope: !2, file: !31, line: 903, type: !21, isLocal: false, isDefinition: true)
!268 = !DIGlobalVariableExpression(var: !269, expr: !DIExpression())
!269 = distinct !DIGlobalVariable(scope: null, file: !31, line: 987, type: !270, isLocal: true, isDefinition: true)
!270 = !DICompositeType(tag: DW_TAG_array_type, baseType: !190, size: 408, elements: !271)
!271 = !{!272}
!272 = !DISubrange(count: 51)
!273 = !DIGlobalVariableExpression(var: !274, expr: !DIExpression())
!274 = distinct !DIGlobalVariable(scope: null, file: !31, line: 1127, type: !275, isLocal: true, isDefinition: true)
!275 = !DICompositeType(tag: DW_TAG_array_type, baseType: !190, size: 544, elements: !276)
!276 = !{!277}
!277 = !DISubrange(count: 68)
!278 = !DIGlobalVariableExpression(var: !279, expr: !DIExpression())
!279 = distinct !DIGlobalVariable(scope: null, file: !31, line: 1164, type: !280, isLocal: true, isDefinition: true)
!280 = !DICompositeType(tag: DW_TAG_array_type, baseType: !190, size: 640, elements: !281)
!281 = !{!282}
!282 = !DISubrange(count: 80)
!283 = !DIGlobalVariableExpression(var: !284, expr: !DIExpression())
!284 = distinct !DIGlobalVariable(scope: null, file: !31, line: 1551, type: !285, isLocal: true, isDefinition: true)
!285 = !DICompositeType(tag: DW_TAG_array_type, baseType: !190, size: 88, elements: !129)
!286 = !DIGlobalVariableExpression(var: !287, expr: !DIExpression())
!287 = distinct !DIGlobalVariable(scope: null, file: !31, line: 1613, type: !288, isLocal: true, isDefinition: true)
!288 = !DICompositeType(tag: DW_TAG_array_type, baseType: !190, size: 336, elements: !289)
!289 = !{!290}
!290 = !DISubrange(count: 42)
!291 = !DIGlobalVariableExpression(var: !292, expr: !DIExpression())
!292 = distinct !DIGlobalVariable(scope: null, file: !31, line: 1615, type: !293, isLocal: true, isDefinition: true)
!293 = !DICompositeType(tag: DW_TAG_array_type, baseType: !190, size: 272, elements: !294)
!294 = !{!295}
!295 = !DISubrange(count: 34)
!296 = !DIGlobalVariableExpression(var: !297, expr: !DIExpression())
!297 = distinct !DIGlobalVariable(scope: null, file: !31, line: 1623, type: !298, isLocal: true, isDefinition: true)
!298 = !DICompositeType(tag: DW_TAG_array_type, baseType: !190, size: 280, elements: !299)
!299 = !{!300}
!300 = !DISubrange(count: 35)
!301 = !DIGlobalVariableExpression(var: !302, expr: !DIExpression())
!302 = distinct !DIGlobalVariable(scope: null, file: !31, line: 1649, type: !303, isLocal: true, isDefinition: true)
!303 = !DICompositeType(tag: DW_TAG_array_type, baseType: !190, size: 240, elements: !304)
!304 = !{!305}
!305 = !DISubrange(count: 30)
!306 = !DIGlobalVariableExpression(var: !307, expr: !DIExpression())
!307 = distinct !DIGlobalVariable(scope: null, file: !31, line: 1782, type: !308, isLocal: true, isDefinition: true)
!308 = !DICompositeType(tag: DW_TAG_array_type, baseType: !190, size: 248, elements: !309)
!309 = !{!310}
!310 = !DISubrange(count: 31)
!311 = !DIGlobalVariableExpression(var: !312, expr: !DIExpression())
!312 = distinct !DIGlobalVariable(name: "Last_laser_fired_time", scope: !2, file: !31, line: 1993, type: !21, isLocal: false, isDefinition: true)
!313 = !DIGlobalVariableExpression(var: !314, expr: !DIExpression())
!314 = distinct !DIGlobalVariable(name: "Zbonkers", scope: !2, file: !31, line: 1997, type: !7, isLocal: false, isDefinition: true)
!315 = !DIGlobalVariableExpression(var: !316, expr: !DIExpression())
!316 = distinct !DIGlobalVariable(name: "Spreadfire_toggle", scope: !317, file: !31, line: 2011, type: !7, isLocal: true, isDefinition: true)
!317 = distinct !DISubprogram(name: "do_laser_firing_player", linkageName: "_Z22do_laser_firing_playerv", scope: !31, file: !31, line: 2002, type: !318, scopeLine: 2003, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !320)
!318 = !DISubroutineType(types: !319)
!319 = !{!7}
!320 = !{}
!321 = !DIGlobalVariableExpression(var: !322, expr: !DIExpression())
!322 = distinct !DIGlobalVariable(name: "Helix_orientation", scope: !317, file: !31, line: 2012, type: !7, isLocal: true, isDefinition: true)
!323 = !DIGlobalVariableExpression(var: !324, expr: !DIExpression())
!324 = distinct !DIGlobalVariable(name: "Lightning_gun_num", scope: !2, file: !31, line: 2124, type: !7, isLocal: false, isDefinition: true)
!325 = !DIGlobalVariableExpression(var: !326, expr: !DIExpression())
!326 = distinct !DIGlobalVariable(name: "Lightning_start_time", scope: !2, file: !31, line: 2126, type: !21, isLocal: false, isDefinition: true)
!327 = !DIGlobalVariableExpression(var: !328, expr: !DIExpression())
!328 = distinct !DIGlobalVariable(name: "Lightning_last_time", scope: !2, file: !31, line: 2126, type: !21, isLocal: false, isDefinition: true)
!329 = !DIGlobalVariableExpression(var: !330, expr: !DIExpression())
!330 = distinct !DIGlobalVariable(scope: null, file: !31, line: 2171, type: !189, isLocal: true, isDefinition: true)
!331 = !DIGlobalVariableExpression(var: !332, expr: !DIExpression())
!332 = distinct !DIGlobalVariable(scope: null, file: !31, line: 2205, type: !333, isLocal: true, isDefinition: true)
!333 = !DICompositeType(tag: DW_TAG_array_type, baseType: !190, size: 376, elements: !334)
!334 = !{!335}
!335 = !DISubrange(count: 47)
!336 = !DIGlobalVariableExpression(var: !337, expr: !DIExpression())
!337 = distinct !DIGlobalVariable(scope: null, file: !31, line: 2389, type: !217, isLocal: true, isDefinition: true)
!338 = !DIGlobalVariableExpression(var: !339, expr: !DIExpression())
!339 = distinct !DIGlobalVariable(scope: null, file: !31, line: 2551, type: !340, isLocal: true, isDefinition: true)
!340 = !DICompositeType(tag: DW_TAG_array_type, baseType: !190, size: 296, elements: !341)
!341 = !{!342}
!342 = !DISubrange(count: 37)
!343 = !DIGlobalVariableExpression(var: !344, expr: !DIExpression())
!344 = distinct !DIGlobalVariable(scope: null, file: !31, line: 2611, type: !345, isLocal: true, isDefinition: true)
!345 = !DICompositeType(tag: DW_TAG_array_type, baseType: !190, size: 560, elements: !346)
!346 = !{!347}
!347 = !DISubrange(count: 70)
!348 = !DIGlobalVariableExpression(var: !349, expr: !DIExpression())
!349 = distinct !DIGlobalVariable(scope: null, file: !31, line: 2626, type: !350, isLocal: true, isDefinition: true)
!350 = !DICompositeType(tag: DW_TAG_array_type, baseType: !190, size: 112, elements: !351)
!351 = !{!352}
!352 = !DISubrange(count: 14)
!353 = !DIGlobalVariableExpression(var: !354, expr: !DIExpression())
!354 = distinct !DIGlobalVariable(scope: null, file: !31, line: 2630, type: !355, isLocal: true, isDefinition: true)
!355 = !DICompositeType(tag: DW_TAG_array_type, baseType: !190, size: 192, elements: !356)
!356 = !{!357}
!357 = !DISubrange(count: 24)
!358 = !DIGlobalVariableExpression(var: !359, expr: !DIExpression())
!359 = distinct !DIGlobalVariable(name: "Missile_gun", scope: !2, file: !31, line: 2694, type: !7, isLocal: false, isDefinition: true)
!360 = !DIGlobalVariableExpression(var: !361, expr: !DIExpression())
!361 = distinct !DIGlobalVariable(name: "Proximity_dropped", scope: !2, file: !31, line: 2716, type: !7, isLocal: false, isDefinition: true)
!362 = !DIGlobalVariableExpression(var: !363, expr: !DIExpression())
!363 = distinct !DIGlobalVariable(name: "Smartmines_dropped", scope: !2, file: !31, line: 2716, type: !7, isLocal: false, isDefinition: true)
!364 = !DIGlobalVariableExpression(var: !365, expr: !DIExpression())
!365 = distinct !DIGlobalVariable(scope: null, file: !31, line: 2726, type: !366, isLocal: true, isDefinition: true)
!366 = !DICompositeType(tag: DW_TAG_array_type, baseType: !190, size: 328, elements: !367)
!367 = !{!368}
!368 = !DISubrange(count: 41)
!369 = !DIGlobalVariableExpression(var: !370, expr: !DIExpression(DW_OP_constu, 16, DW_OP_stack_value))
!370 = distinct !DIGlobalVariable(name: "FRACBITS", scope: !2, file: !22, line: 18, type: !371, isLocal: true, isDefinition: true)
!371 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!372 = !{!373, !377, !380, !381, !382, !383, !384, !388, !392, !395, !397, !399, !401, !403, !405, !407, !409, !411, !413, !415, !417, !419, !421, !423, !425, !431, !435, !438}
!373 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !374, entity: !18, file: !376, line: 158)
!374 = !DINamespace(name: "__1", scope: !375, exportSymbols: true)
!375 = !DINamespace(name: "std", scope: null)
!376 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdint", directory: "")
!377 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !374, entity: !378, file: !376, line: 159)
!378 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !379, line: 30, baseType: !45)
!379 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int16_t.h", directory: "", checksumkind: CSK_MD5, checksum: "47ed3c3ac6f65bfec021ca2b7be18e7e")
!380 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !374, entity: !23, file: !376, line: 160)
!381 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !374, entity: !25, file: !376, line: 161)
!382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !374, entity: !40, file: !376, line: 163)
!383 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !374, entity: !93, file: !376, line: 164)
!384 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !374, entity: !385, file: !376, line: 165)
!385 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !386, line: 31, baseType: !387)
!386 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint32_t.h", directory: "", checksumkind: CSK_MD5, checksum: "0254eb80c6b9719ac45c3c1cf872109b")
!387 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!388 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !374, entity: !389, file: !376, line: 166)
!389 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !390, line: 31, baseType: !391)
!390 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint64_t.h", directory: "", checksumkind: CSK_MD5, checksum: "77fc5e91653260959605f129691cf9b1")
!391 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!392 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !374, entity: !393, file: !376, line: 168)
!393 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !394, line: 29, baseType: !18)
!394 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "042ceedaf4137a8aaa272d0b27434016")
!395 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !374, entity: !396, file: !376, line: 169)
!396 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !394, line: 30, baseType: !378)
!397 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !374, entity: !398, file: !376, line: 170)
!398 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !394, line: 31, baseType: !23)
!399 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !374, entity: !400, file: !376, line: 171)
!400 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !394, line: 32, baseType: !25)
!401 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !374, entity: !402, file: !376, line: 173)
!402 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !394, line: 33, baseType: !40)
!403 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !374, entity: !404, file: !376, line: 174)
!404 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !394, line: 34, baseType: !93)
!405 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !374, entity: !406, file: !376, line: 175)
!406 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !394, line: 35, baseType: !385)
!407 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !374, entity: !408, file: !376, line: 176)
!408 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !394, line: 36, baseType: !389)
!409 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !374, entity: !410, file: !376, line: 178)
!410 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !394, line: 40, baseType: !18)
!411 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !374, entity: !412, file: !376, line: 179)
!412 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !394, line: 41, baseType: !378)
!413 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !374, entity: !414, file: !376, line: 180)
!414 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !394, line: 42, baseType: !23)
!415 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !374, entity: !416, file: !376, line: 181)
!416 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !394, line: 43, baseType: !25)
!417 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !374, entity: !418, file: !376, line: 183)
!418 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !394, line: 44, baseType: !40)
!419 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !374, entity: !420, file: !376, line: 184)
!420 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !394, line: 45, baseType: !93)
!421 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !374, entity: !422, file: !376, line: 185)
!422 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !394, line: 46, baseType: !385)
!423 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !374, entity: !424, file: !376, line: 186)
!424 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !394, line: 47, baseType: !389)
!425 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !374, entity: !426, file: !376, line: 188)
!426 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !427, line: 32, baseType: !428)
!427 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_intptr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e478ba47270923b1cca6659f19f02db1")
!428 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_intptr_t", file: !429, line: 40, baseType: !430)
!429 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/arm/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "b270144f57ae258d0ce80b8f87be068c")
!430 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!431 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !374, entity: !432, file: !376, line: 189)
!432 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !433, line: 34, baseType: !434)
!433 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_uintptr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e70ae655dd1b9d4ae0b1dcc073f5b7e4")
!434 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!435 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !374, entity: !436, file: !376, line: 191)
!436 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !437, line: 32, baseType: !430)
!437 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_intmax_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e37b9240f30f486478152ef3989b1545")
!438 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !374, entity: !439, file: !376, line: 192)
!439 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !440, line: 32, baseType: !434)
!440 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uintmax_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8217a3fbb207d8e87ca5318c313e81c2")
!441 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 4]}
!442 = !{i32 7, !"Dwarf Version", i32 5}
!443 = !{i32 2, !"Debug Info Version", i32 3}
!444 = !{i32 1, !"wchar_size", i32 4}
!445 = !{i32 8, !"PIC Level", i32 2}
!446 = !{i32 7, !"uwtable", i32 1}
!447 = !{i32 7, !"frame-pointer", i32 1}
!448 = !{!"Homebrew clang version 20.1.8"}
!449 = distinct !DISubprogram(name: "Laser_render", linkageName: "_Z12Laser_renderP6object", scope: !31, file: !31, line: 81, type: !450, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !320)
!450 = !DISubroutineType(types: !451)
!451 = !{null, !33}
!452 = !DILocalVariable(name: "obj", arg: 1, scope: !449, file: !31, line: 81, type: !33)
!453 = !DILocation(line: 81, column: 27, scope: !449)
!454 = !DILocation(line: 83, column: 22, scope: !449)
!455 = !DILocation(line: 83, column: 27, scope: !449)
!456 = !DILocation(line: 83, column: 10, scope: !449)
!457 = !DILocation(line: 83, column: 31, scope: !449)
!458 = !DILocation(line: 83, column: 2, scope: !449)
!459 = !DILocation(line: 86, column: 3, scope: !460)
!460 = distinct !DILexicalBlock(scope: !449, file: !31, line: 84, column: 2)
!461 = !DILocation(line: 88, column: 3, scope: !460)
!462 = !DILocation(line: 90, column: 20, scope: !460)
!463 = !DILocation(line: 90, column: 37, scope: !460)
!464 = !DILocation(line: 90, column: 42, scope: !460)
!465 = !DILocation(line: 90, column: 25, scope: !460)
!466 = !DILocation(line: 90, column: 46, scope: !460)
!467 = !DILocation(line: 90, column: 3, scope: !460)
!468 = !DILocation(line: 91, column: 3, scope: !460)
!469 = !DILocation(line: 93, column: 3, scope: !460)
!470 = !DILocation(line: 95, column: 3, scope: !460)
!471 = !DILocation(line: 97, column: 3, scope: !460)
!472 = !DILocation(line: 98, column: 2, scope: !460)
!473 = !DILocation(line: 100, column: 1, scope: !449)
!474 = distinct !DISubprogram(name: "laser_are_related", linkageName: "_Z17laser_are_relatedii", scope: !31, file: !31, line: 106, type: !475, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !320)
!475 = !DISubroutineType(types: !476)
!476 = !{!7, !7, !7}
!477 = !DILocalVariable(name: "o1", arg: 1, scope: !474, file: !31, line: 106, type: !7)
!478 = !DILocation(line: 106, column: 28, scope: !474)
!479 = !DILocalVariable(name: "o2", arg: 2, scope: !474, file: !31, line: 106, type: !7)
!480 = !DILocation(line: 106, column: 36, scope: !474)
!481 = !DILocation(line: 124, column: 8, scope: !482)
!482 = distinct !DILexicalBlock(scope: !474, file: !31, line: 124, column: 7)
!483 = !DILocation(line: 124, column: 10, scope: !482)
!484 = !DILocation(line: 124, column: 14, scope: !482)
!485 = !DILocation(line: 124, column: 18, scope: !482)
!486 = !DILocation(line: 124, column: 20, scope: !482)
!487 = !DILocation(line: 125, column: 3, scope: !482)
!488 = !DILocation(line: 128, column: 15, scope: !489)
!489 = distinct !DILexicalBlock(scope: !474, file: !31, line: 128, column: 7)
!490 = !DILocation(line: 128, column: 7, scope: !489)
!491 = !DILocation(line: 128, column: 19, scope: !489)
!492 = !DILocation(line: 128, column: 24, scope: !489)
!493 = !DILocation(line: 129, column: 17, scope: !494)
!494 = distinct !DILexicalBlock(scope: !489, file: !31, line: 129, column: 8)
!495 = !DILocation(line: 129, column: 9, scope: !494)
!496 = !DILocation(line: 129, column: 21, scope: !494)
!497 = !DILocation(line: 129, column: 38, scope: !494)
!498 = !DILocation(line: 129, column: 50, scope: !494)
!499 = !DILocation(line: 129, column: 48, scope: !494)
!500 = !DILocation(line: 129, column: 54, scope: !494)
!501 = !DILocation(line: 129, column: 66, scope: !494)
!502 = !DILocation(line: 129, column: 58, scope: !494)
!503 = !DILocation(line: 129, column: 70, scope: !494)
!504 = !DILocation(line: 129, column: 87, scope: !494)
!505 = !DILocation(line: 129, column: 113, scope: !494)
!506 = !DILocation(line: 129, column: 105, scope: !494)
!507 = !DILocation(line: 129, column: 117, scope: !494)
!508 = !DILocation(line: 129, column: 103, scope: !494)
!509 = !DILocation(line: 130, column: 17, scope: !510)
!510 = distinct !DILexicalBlock(scope: !494, file: !31, line: 130, column: 8)
!511 = !DILocation(line: 130, column: 9, scope: !510)
!512 = !DILocation(line: 130, column: 21, scope: !510)
!513 = !DILocation(line: 130, column: 24, scope: !510)
!514 = !DILocation(line: 130, column: 38, scope: !510)
!515 = !DILocation(line: 130, column: 42, scope: !510)
!516 = !DILocation(line: 130, column: 61, scope: !510)
!517 = !DILocation(line: 130, column: 53, scope: !510)
!518 = !DILocation(line: 130, column: 65, scope: !510)
!519 = !DILocation(line: 130, column: 82, scope: !510)
!520 = !DILocation(line: 130, column: 96, scope: !510)
!521 = !DILocation(line: 130, column: 51, scope: !510)
!522 = !DILocation(line: 130, column: 107, scope: !510)
!523 = !DILocation(line: 131, column: 16, scope: !510)
!524 = !DILocation(line: 131, column: 8, scope: !510)
!525 = !DILocation(line: 131, column: 20, scope: !510)
!526 = !DILocation(line: 131, column: 23, scope: !510)
!527 = !DILocation(line: 131, column: 40, scope: !510)
!528 = !DILocation(line: 131, column: 44, scope: !510)
!529 = !DILocation(line: 131, column: 63, scope: !510)
!530 = !DILocation(line: 131, column: 55, scope: !510)
!531 = !DILocation(line: 131, column: 67, scope: !510)
!532 = !DILocation(line: 131, column: 84, scope: !510)
!533 = !DILocation(line: 131, column: 98, scope: !510)
!534 = !DILocation(line: 131, column: 53, scope: !510)
!535 = !DILocation(line: 131, column: 109, scope: !510)
!536 = !DILocation(line: 132, column: 16, scope: !510)
!537 = !DILocation(line: 132, column: 8, scope: !510)
!538 = !DILocation(line: 132, column: 20, scope: !510)
!539 = !DILocation(line: 132, column: 23, scope: !510)
!540 = !DILocation(line: 132, column: 40, scope: !510)
!541 = !DILocation(line: 132, column: 52, scope: !510)
!542 = !DILocation(line: 132, column: 44, scope: !510)
!543 = !DILocation(line: 132, column: 56, scope: !510)
!544 = !DILocation(line: 132, column: 59, scope: !510)
!545 = !DILocation(line: 132, column: 77, scope: !510)
!546 = !DILocation(line: 132, column: 81, scope: !510)
!547 = !DILocation(line: 132, column: 100, scope: !510)
!548 = !DILocation(line: 132, column: 92, scope: !510)
!549 = !DILocation(line: 132, column: 104, scope: !510)
!550 = !DILocation(line: 132, column: 121, scope: !510)
!551 = !DILocation(line: 132, column: 135, scope: !510)
!552 = !DILocation(line: 132, column: 90, scope: !510)
!553 = !DILocation(line: 134, column: 5, scope: !554)
!554 = distinct !DILexicalBlock(scope: !510, file: !31, line: 133, column: 4)
!555 = !DILocation(line: 136, column: 5, scope: !510)
!556 = !DILocation(line: 129, column: 126, scope: !494)
!557 = !DILocation(line: 139, column: 15, scope: !558)
!558 = distinct !DILexicalBlock(scope: !474, file: !31, line: 139, column: 7)
!559 = !DILocation(line: 139, column: 7, scope: !558)
!560 = !DILocation(line: 139, column: 19, scope: !558)
!561 = !DILocation(line: 139, column: 24, scope: !558)
!562 = !DILocation(line: 140, column: 17, scope: !563)
!563 = distinct !DILexicalBlock(scope: !558, file: !31, line: 140, column: 8)
!564 = !DILocation(line: 140, column: 9, scope: !563)
!565 = !DILocation(line: 140, column: 21, scope: !563)
!566 = !DILocation(line: 140, column: 38, scope: !563)
!567 = !DILocation(line: 140, column: 50, scope: !563)
!568 = !DILocation(line: 140, column: 48, scope: !563)
!569 = !DILocation(line: 140, column: 54, scope: !563)
!570 = !DILocation(line: 140, column: 66, scope: !563)
!571 = !DILocation(line: 140, column: 58, scope: !563)
!572 = !DILocation(line: 140, column: 70, scope: !563)
!573 = !DILocation(line: 140, column: 87, scope: !563)
!574 = !DILocation(line: 140, column: 113, scope: !563)
!575 = !DILocation(line: 140, column: 105, scope: !563)
!576 = !DILocation(line: 140, column: 117, scope: !563)
!577 = !DILocation(line: 140, column: 103, scope: !563)
!578 = !DILocation(line: 141, column: 17, scope: !579)
!579 = distinct !DILexicalBlock(scope: !563, file: !31, line: 141, column: 8)
!580 = !DILocation(line: 141, column: 9, scope: !579)
!581 = !DILocation(line: 141, column: 21, scope: !579)
!582 = !DILocation(line: 141, column: 24, scope: !579)
!583 = !DILocation(line: 141, column: 38, scope: !579)
!584 = !DILocation(line: 141, column: 42, scope: !579)
!585 = !DILocation(line: 141, column: 61, scope: !579)
!586 = !DILocation(line: 141, column: 53, scope: !579)
!587 = !DILocation(line: 141, column: 65, scope: !579)
!588 = !DILocation(line: 141, column: 82, scope: !579)
!589 = !DILocation(line: 141, column: 96, scope: !579)
!590 = !DILocation(line: 141, column: 51, scope: !579)
!591 = !DILocation(line: 141, column: 107, scope: !579)
!592 = !DILocation(line: 142, column: 16, scope: !579)
!593 = !DILocation(line: 142, column: 8, scope: !579)
!594 = !DILocation(line: 142, column: 20, scope: !579)
!595 = !DILocation(line: 142, column: 23, scope: !579)
!596 = !DILocation(line: 142, column: 40, scope: !579)
!597 = !DILocation(line: 142, column: 44, scope: !579)
!598 = !DILocation(line: 142, column: 63, scope: !579)
!599 = !DILocation(line: 142, column: 55, scope: !579)
!600 = !DILocation(line: 142, column: 67, scope: !579)
!601 = !DILocation(line: 142, column: 84, scope: !579)
!602 = !DILocation(line: 142, column: 98, scope: !579)
!603 = !DILocation(line: 142, column: 53, scope: !579)
!604 = !DILocation(line: 142, column: 109, scope: !579)
!605 = !DILocation(line: 143, column: 16, scope: !579)
!606 = !DILocation(line: 143, column: 8, scope: !579)
!607 = !DILocation(line: 143, column: 20, scope: !579)
!608 = !DILocation(line: 143, column: 23, scope: !579)
!609 = !DILocation(line: 143, column: 40, scope: !579)
!610 = !DILocation(line: 143, column: 52, scope: !579)
!611 = !DILocation(line: 143, column: 44, scope: !579)
!612 = !DILocation(line: 143, column: 56, scope: !579)
!613 = !DILocation(line: 143, column: 59, scope: !579)
!614 = !DILocation(line: 143, column: 77, scope: !579)
!615 = !DILocation(line: 143, column: 81, scope: !579)
!616 = !DILocation(line: 143, column: 100, scope: !579)
!617 = !DILocation(line: 143, column: 92, scope: !579)
!618 = !DILocation(line: 143, column: 104, scope: !579)
!619 = !DILocation(line: 143, column: 121, scope: !579)
!620 = !DILocation(line: 143, column: 135, scope: !579)
!621 = !DILocation(line: 143, column: 90, scope: !579)
!622 = !DILocation(line: 145, column: 5, scope: !623)
!623 = distinct !DILexicalBlock(scope: !579, file: !31, line: 144, column: 4)
!624 = !DILocation(line: 147, column: 5, scope: !579)
!625 = !DILocation(line: 140, column: 126, scope: !563)
!626 = !DILocation(line: 150, column: 15, scope: !627)
!627 = distinct !DILexicalBlock(scope: !474, file: !31, line: 150, column: 7)
!628 = !DILocation(line: 150, column: 7, scope: !627)
!629 = !DILocation(line: 150, column: 19, scope: !627)
!630 = !DILocation(line: 150, column: 24, scope: !627)
!631 = !DILocation(line: 150, column: 38, scope: !627)
!632 = !DILocation(line: 150, column: 49, scope: !627)
!633 = !DILocation(line: 150, column: 41, scope: !627)
!634 = !DILocation(line: 150, column: 53, scope: !627)
!635 = !DILocation(line: 150, column: 58, scope: !627)
!636 = !DILocation(line: 151, column: 3, scope: !627)
!637 = !DILocation(line: 153, column: 15, scope: !638)
!638 = distinct !DILexicalBlock(scope: !474, file: !31, line: 153, column: 7)
!639 = !DILocation(line: 153, column: 7, scope: !638)
!640 = !DILocation(line: 153, column: 19, scope: !638)
!641 = !DILocation(line: 153, column: 36, scope: !638)
!642 = !DILocation(line: 153, column: 62, scope: !638)
!643 = !DILocation(line: 153, column: 54, scope: !638)
!644 = !DILocation(line: 153, column: 66, scope: !638)
!645 = !DILocation(line: 153, column: 83, scope: !638)
!646 = !DILocation(line: 153, column: 52, scope: !638)
!647 = !DILocation(line: 154, column: 15, scope: !648)
!648 = distinct !DILexicalBlock(scope: !638, file: !31, line: 154, column: 7)
!649 = !DILocation(line: 154, column: 7, scope: !648)
!650 = !DILocation(line: 154, column: 19, scope: !648)
!651 = !DILocation(line: 154, column: 22, scope: !648)
!652 = !DILocation(line: 154, column: 39, scope: !648)
!653 = !DILocation(line: 154, column: 50, scope: !648)
!654 = !DILocation(line: 154, column: 42, scope: !648)
!655 = !DILocation(line: 154, column: 54, scope: !648)
!656 = !DILocation(line: 154, column: 57, scope: !648)
!657 = !DILocation(line: 154, column: 73, scope: !648)
!658 = !DILocation(line: 154, column: 84, scope: !648)
!659 = !DILocation(line: 154, column: 76, scope: !648)
!660 = !DILocation(line: 154, column: 88, scope: !648)
!661 = !DILocation(line: 154, column: 91, scope: !648)
!662 = !DILocation(line: 154, column: 107, scope: !648)
!663 = !DILocation(line: 154, column: 118, scope: !648)
!664 = !DILocation(line: 154, column: 110, scope: !648)
!665 = !DILocation(line: 154, column: 122, scope: !648)
!666 = !DILocation(line: 154, column: 125, scope: !648)
!667 = !DILocation(line: 156, column: 9, scope: !668)
!668 = distinct !DILexicalBlock(scope: !669, file: !31, line: 156, column: 8)
!669 = distinct !DILexicalBlock(scope: !648, file: !31, line: 155, column: 3)
!670 = !DILocation(line: 156, column: 29, scope: !668)
!671 = !DILocation(line: 156, column: 21, scope: !668)
!672 = !DILocation(line: 156, column: 33, scope: !668)
!673 = !DILocation(line: 156, column: 50, scope: !668)
!674 = !DILocation(line: 156, column: 64, scope: !668)
!675 = !DILocation(line: 156, column: 18, scope: !668)
!676 = !DILocation(line: 156, column: 75, scope: !668)
!677 = !DILocation(line: 156, column: 79, scope: !668)
!678 = !DILocation(line: 156, column: 99, scope: !668)
!679 = !DILocation(line: 156, column: 91, scope: !668)
!680 = !DILocation(line: 156, column: 103, scope: !668)
!681 = !DILocation(line: 156, column: 120, scope: !668)
!682 = !DILocation(line: 156, column: 134, scope: !668)
!683 = !DILocation(line: 156, column: 88, scope: !668)
!684 = !DILocation(line: 157, column: 5, scope: !668)
!685 = !DILocation(line: 159, column: 5, scope: !668)
!686 = !DILocation(line: 161, column: 4, scope: !648)
!687 = !DILocation(line: 163, column: 14, scope: !688)
!688 = distinct !DILexicalBlock(scope: !474, file: !31, line: 163, column: 6)
!689 = !DILocation(line: 163, column: 6, scope: !688)
!690 = !DILocation(line: 163, column: 18, scope: !688)
!691 = !DILocation(line: 163, column: 21, scope: !688)
!692 = !DILocation(line: 163, column: 43, scope: !688)
!693 = !DILocation(line: 163, column: 54, scope: !688)
!694 = !DILocation(line: 163, column: 46, scope: !688)
!695 = !DILocation(line: 163, column: 58, scope: !688)
!696 = !DILocation(line: 163, column: 61, scope: !688)
!697 = !DILocation(line: 163, column: 83, scope: !688)
!698 = !DILocation(line: 164, column: 12, scope: !688)
!699 = !DILocation(line: 164, column: 4, scope: !688)
!700 = !DILocation(line: 164, column: 16, scope: !688)
!701 = !DILocation(line: 164, column: 19, scope: !688)
!702 = !DILocation(line: 164, column: 35, scope: !688)
!703 = !DILocation(line: 164, column: 46, scope: !688)
!704 = !DILocation(line: 164, column: 38, scope: !688)
!705 = !DILocation(line: 164, column: 50, scope: !688)
!706 = !DILocation(line: 164, column: 53, scope: !688)
!707 = !DILocation(line: 164, column: 69, scope: !688)
!708 = !DILocation(line: 165, column: 12, scope: !688)
!709 = !DILocation(line: 165, column: 4, scope: !688)
!710 = !DILocation(line: 165, column: 16, scope: !688)
!711 = !DILocation(line: 165, column: 19, scope: !688)
!712 = !DILocation(line: 165, column: 35, scope: !688)
!713 = !DILocation(line: 165, column: 46, scope: !688)
!714 = !DILocation(line: 165, column: 38, scope: !688)
!715 = !DILocation(line: 165, column: 50, scope: !688)
!716 = !DILocation(line: 165, column: 53, scope: !688)
!717 = !DILocation(line: 165, column: 69, scope: !688)
!718 = !DILocation(line: 166, column: 12, scope: !688)
!719 = !DILocation(line: 166, column: 4, scope: !688)
!720 = !DILocation(line: 166, column: 16, scope: !688)
!721 = !DILocation(line: 166, column: 19, scope: !688)
!722 = !DILocation(line: 166, column: 31, scope: !688)
!723 = !DILocation(line: 166, column: 42, scope: !688)
!724 = !DILocation(line: 166, column: 34, scope: !688)
!725 = !DILocation(line: 166, column: 46, scope: !688)
!726 = !DILocation(line: 166, column: 49, scope: !688)
!727 = !DILocation(line: 167, column: 3, scope: !688)
!728 = !DILocation(line: 169, column: 2, scope: !474)
!729 = !DILocation(line: 171, column: 1, scope: !474)
!730 = distinct !DISubprogram(name: "do_muzzle_stuff", linkageName: "_Z15do_muzzle_stuffiP10vms_vector", scope: !31, file: !31, line: 176, type: !731, scopeLine: 177, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !320)
!731 = !DISubroutineType(types: !732)
!732 = !{null, !7, !733}
!733 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!734 = !DILocalVariable(name: "segnum", arg: 1, scope: !730, file: !31, line: 176, type: !7)
!735 = !DILocation(line: 176, column: 26, scope: !730)
!736 = !DILocalVariable(name: "pos", arg: 2, scope: !730, file: !31, line: 176, type: !733)
!737 = !DILocation(line: 176, column: 46, scope: !730)
!738 = !DILocation(line: 178, column: 48, scope: !730)
!739 = !DILocation(line: 178, column: 14, scope: !730)
!740 = !DILocation(line: 178, column: 2, scope: !730)
!741 = !DILocation(line: 178, column: 34, scope: !730)
!742 = !DILocation(line: 178, column: 46, scope: !730)
!743 = !DILocation(line: 179, column: 43, scope: !730)
!744 = !DILocation(line: 179, column: 14, scope: !730)
!745 = !DILocation(line: 179, column: 2, scope: !730)
!746 = !DILocation(line: 179, column: 34, scope: !730)
!747 = !DILocation(line: 179, column: 41, scope: !730)
!748 = !DILocation(line: 180, column: 41, scope: !730)
!749 = !DILocation(line: 180, column: 14, scope: !730)
!750 = !DILocation(line: 180, column: 2, scope: !730)
!751 = !DILocation(line: 180, column: 34, scope: !730)
!752 = !DILocation(line: 180, column: 38, scope: !730)
!753 = !DILocation(line: 181, column: 20, scope: !730)
!754 = !DILocation(line: 182, column: 6, scope: !755)
!755 = distinct !DILexicalBlock(scope: !730, file: !31, line: 182, column: 6)
!756 = !DILocation(line: 182, column: 25, scope: !755)
!757 = !DILocation(line: 183, column: 22, scope: !755)
!758 = !DILocation(line: 183, column: 3, scope: !755)
!759 = !DILocation(line: 184, column: 1, scope: !730)
!760 = distinct !DISubprogram(name: "create_weapon_object", linkageName: "_Z20create_weapon_objectiiP10vms_vector", scope: !31, file: !31, line: 187, type: !761, scopeLine: 188, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !320)
!761 = !DISubroutineType(types: !762)
!762 = !{!7, !7, !7, !733}
!763 = !DILocalVariable(name: "weapon_type", arg: 1, scope: !760, file: !31, line: 187, type: !7)
!764 = !DILocation(line: 187, column: 30, scope: !760)
!765 = !DILocalVariable(name: "segnum", arg: 2, scope: !760, file: !31, line: 187, type: !7)
!766 = !DILocation(line: 187, column: 46, scope: !760)
!767 = !DILocalVariable(name: "position", arg: 3, scope: !760, file: !31, line: 187, type: !733)
!768 = !DILocation(line: 187, column: 65, scope: !760)
!769 = !DILocalVariable(name: "rtype", scope: !760, file: !31, line: 233, type: !7)
!770 = !DILocation(line: 233, column: 6, scope: !760)
!771 = !DILocalVariable(name: "laser_radius", scope: !760, file: !31, line: 234, type: !21)
!772 = !DILocation(line: 234, column: 6, scope: !760)
!773 = !DILocalVariable(name: "objnum", scope: !760, file: !31, line: 235, type: !7)
!774 = !DILocation(line: 235, column: 6, scope: !760)
!775 = !DILocalVariable(name: "obj", scope: !760, file: !31, line: 236, type: !33)
!776 = !DILocation(line: 236, column: 10, scope: !760)
!777 = !DILocation(line: 238, column: 22, scope: !760)
!778 = !DILocation(line: 238, column: 10, scope: !760)
!779 = !DILocation(line: 238, column: 35, scope: !760)
!780 = !DILocation(line: 238, column: 2, scope: !760)
!781 = !DILocation(line: 241, column: 10, scope: !782)
!782 = distinct !DILexicalBlock(scope: !760, file: !31, line: 239, column: 2)
!783 = !DILocation(line: 242, column: 31, scope: !782)
!784 = !DILocation(line: 242, column: 19, scope: !782)
!785 = !DILocation(line: 242, column: 44, scope: !782)
!786 = !DILocation(line: 242, column: 17, scope: !782)
!787 = !DILocation(line: 243, column: 4, scope: !782)
!788 = !DILocation(line: 245, column: 17, scope: !782)
!789 = !DILocation(line: 246, column: 10, scope: !782)
!790 = !DILocation(line: 247, column: 4, scope: !782)
!791 = !DILocation(line: 249, column: 4, scope: !782)
!792 = !DILocation(line: 250, column: 4, scope: !782)
!793 = !DILocation(line: 252, column: 10, scope: !782)
!794 = !DILocation(line: 253, column: 17, scope: !782)
!795 = !DILocation(line: 254, column: 4, scope: !782)
!796 = !DILocation(line: 256, column: 10, scope: !782)
!797 = !DILocation(line: 257, column: 31, scope: !782)
!798 = !DILocation(line: 257, column: 19, scope: !782)
!799 = !DILocation(line: 257, column: 44, scope: !782)
!800 = !DILocation(line: 257, column: 17, scope: !782)
!801 = !DILocation(line: 258, column: 4, scope: !782)
!802 = !DILocation(line: 260, column: 4, scope: !782)
!803 = !DILocation(line: 261, column: 2, scope: !782)
!804 = !DILocation(line: 263, column: 2, scope: !760)
!805 = !DILocation(line: 264, column: 2, scope: !760)
!806 = !DILocation(line: 266, column: 35, scope: !760)
!807 = !DILocation(line: 266, column: 48, scope: !760)
!808 = !DILocation(line: 266, column: 56, scope: !760)
!809 = !DILocation(line: 266, column: 72, scope: !760)
!810 = !DILocation(line: 266, column: 109, scope: !760)
!811 = !DILocation(line: 266, column: 11, scope: !760)
!812 = !DILocation(line: 266, column: 9, scope: !760)
!813 = !DILocation(line: 268, column: 17, scope: !760)
!814 = !DILocation(line: 268, column: 9, scope: !760)
!815 = !DILocation(line: 268, column: 6, scope: !760)
!816 = !DILocation(line: 270, column: 18, scope: !817)
!817 = distinct !DILexicalBlock(scope: !760, file: !31, line: 270, column: 6)
!818 = !DILocation(line: 270, column: 6, scope: !817)
!819 = !DILocation(line: 270, column: 31, scope: !817)
!820 = !DILocation(line: 270, column: 43, scope: !817)
!821 = !DILocation(line: 272, column: 48, scope: !822)
!822 = distinct !DILexicalBlock(scope: !817, file: !31, line: 271, column: 2)
!823 = !DILocation(line: 272, column: 53, scope: !822)
!824 = !DILocation(line: 272, column: 36, scope: !822)
!825 = !DILocation(line: 272, column: 57, scope: !822)
!826 = !DILocation(line: 272, column: 3, scope: !822)
!827 = !DILocation(line: 272, column: 8, scope: !822)
!828 = !DILocation(line: 272, column: 24, scope: !822)
!829 = !DILocation(line: 272, column: 34, scope: !822)
!830 = !DILocation(line: 273, column: 37, scope: !822)
!831 = !DILocation(line: 273, column: 42, scope: !822)
!832 = !DILocation(line: 273, column: 58, scope: !822)
!833 = !DILocation(line: 273, column: 22, scope: !822)
!834 = !DILocation(line: 273, column: 69, scope: !822)
!835 = !DILocation(line: 273, column: 85, scope: !822)
!836 = !DILocation(line: 273, column: 90, scope: !822)
!837 = !DILocation(line: 273, column: 73, scope: !822)
!838 = !DILocation(line: 273, column: 94, scope: !822)
!839 = !DILocation(line: 273, column: 15, scope: !822)
!840 = !DILocation(line: 273, column: 3, scope: !822)
!841 = !DILocation(line: 273, column: 8, scope: !822)
!842 = !DILocation(line: 273, column: 13, scope: !822)
!843 = !DILocation(line: 274, column: 2, scope: !822)
!844 = !DILocation(line: 276, column: 42, scope: !760)
!845 = !DILocation(line: 276, column: 30, scope: !760)
!846 = !DILocation(line: 276, column: 55, scope: !760)
!847 = !DILocation(line: 276, column: 2, scope: !760)
!848 = !DILocation(line: 276, column: 7, scope: !760)
!849 = !DILocation(line: 276, column: 23, scope: !760)
!850 = !DILocation(line: 276, column: 28, scope: !760)
!851 = !DILocation(line: 277, column: 42, scope: !760)
!852 = !DILocation(line: 277, column: 30, scope: !760)
!853 = !DILocation(line: 277, column: 55, scope: !760)
!854 = !DILocation(line: 277, column: 2, scope: !760)
!855 = !DILocation(line: 277, column: 7, scope: !760)
!856 = !DILocation(line: 277, column: 23, scope: !760)
!857 = !DILocation(line: 277, column: 28, scope: !760)
!858 = !DILocation(line: 278, column: 2, scope: !760)
!859 = !DILocation(line: 280, column: 18, scope: !860)
!860 = distinct !DILexicalBlock(scope: !760, file: !31, line: 280, column: 6)
!861 = !DILocation(line: 280, column: 6, scope: !860)
!862 = !DILocation(line: 280, column: 31, scope: !860)
!863 = !DILocation(line: 280, column: 37, scope: !860)
!864 = !DILocation(line: 281, column: 3, scope: !860)
!865 = !DILocation(line: 281, column: 8, scope: !860)
!866 = !DILocation(line: 281, column: 24, scope: !860)
!867 = !DILocation(line: 281, column: 30, scope: !860)
!868 = !DILocation(line: 283, column: 18, scope: !869)
!869 = distinct !DILexicalBlock(scope: !760, file: !31, line: 283, column: 6)
!870 = !DILocation(line: 283, column: 6, scope: !869)
!871 = !DILocation(line: 283, column: 31, scope: !869)
!872 = !DILocation(line: 283, column: 37, scope: !869)
!873 = !DILocation(line: 283, column: 41, scope: !869)
!874 = !DILocation(line: 283, column: 44, scope: !869)
!875 = !DILocation(line: 284, column: 3, scope: !869)
!876 = !DILocation(line: 284, column: 8, scope: !869)
!877 = !DILocation(line: 284, column: 24, scope: !869)
!878 = !DILocation(line: 284, column: 30, scope: !869)
!879 = !DILocation(line: 286, column: 9, scope: !760)
!880 = !DILocation(line: 286, column: 2, scope: !760)
!881 = distinct !DISubprogram(name: "fixdiv", linkageName: "_Z6fixdivii", scope: !22, file: !22, line: 89, type: !882, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !320)
!882 = !DISubroutineType(types: !883)
!883 = !{!21, !21, !21}
!884 = !DILocalVariable(name: "a", arg: 1, scope: !881, file: !22, line: 89, type: !21)
!885 = !DILocation(line: 89, column: 26, scope: !881)
!886 = !DILocalVariable(name: "b", arg: 2, scope: !881, file: !22, line: 89, type: !21)
!887 = !DILocation(line: 89, column: 33, scope: !881)
!888 = !DILocation(line: 92, column: 6, scope: !889)
!889 = distinct !DILexicalBlock(scope: !881, file: !22, line: 92, column: 6)
!890 = !DILocation(line: 92, column: 8, scope: !889)
!891 = !DILocation(line: 92, column: 14, scope: !889)
!892 = !DILocation(line: 94, column: 25, scope: !881)
!893 = !DILocation(line: 94, column: 27, scope: !881)
!894 = !DILocation(line: 94, column: 36, scope: !881)
!895 = !DILocation(line: 94, column: 34, scope: !881)
!896 = !DILocation(line: 94, column: 14, scope: !881)
!897 = !DILocation(line: 94, column: 2, scope: !881)
!898 = !DILocation(line: 95, column: 1, scope: !881)
!899 = distinct !DISubprogram(name: "delete_old_omega_blobs", linkageName: "_Z22delete_old_omega_blobsP6object", scope: !31, file: !31, line: 319, type: !450, scopeLine: 320, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !320)
!900 = !DILocalVariable(name: "parent_objp", arg: 1, scope: !899, file: !31, line: 319, type: !33)
!901 = !DILocation(line: 319, column: 37, scope: !899)
!902 = !DILocalVariable(name: "i", scope: !899, file: !31, line: 321, type: !7)
!903 = !DILocation(line: 321, column: 6, scope: !899)
!904 = !DILocalVariable(name: "parent_num", scope: !899, file: !31, line: 322, type: !7)
!905 = !DILocation(line: 322, column: 6, scope: !899)
!906 = !DILocalVariable(name: "count", scope: !899, file: !31, line: 323, type: !7)
!907 = !DILocation(line: 323, column: 6, scope: !899)
!908 = !DILocation(line: 325, column: 15, scope: !899)
!909 = !DILocation(line: 325, column: 28, scope: !899)
!910 = !DILocation(line: 325, column: 45, scope: !899)
!911 = !DILocation(line: 325, column: 13, scope: !899)
!912 = !DILocation(line: 327, column: 8, scope: !913)
!913 = distinct !DILexicalBlock(scope: !899, file: !31, line: 327, column: 2)
!914 = !DILocation(line: 327, column: 7, scope: !913)
!915 = !DILocation(line: 327, column: 12, scope: !916)
!916 = distinct !DILexicalBlock(scope: !913, file: !31, line: 327, column: 2)
!917 = !DILocation(line: 327, column: 15, scope: !916)
!918 = !DILocation(line: 327, column: 13, scope: !916)
!919 = !DILocation(line: 327, column: 2, scope: !913)
!920 = !DILocation(line: 328, column: 15, scope: !921)
!921 = distinct !DILexicalBlock(scope: !916, file: !31, line: 328, column: 7)
!922 = !DILocation(line: 328, column: 7, scope: !921)
!923 = !DILocation(line: 328, column: 18, scope: !921)
!924 = !DILocation(line: 328, column: 23, scope: !921)
!925 = !DILocation(line: 329, column: 16, scope: !926)
!926 = distinct !DILexicalBlock(scope: !921, file: !31, line: 329, column: 8)
!927 = !DILocation(line: 329, column: 8, scope: !926)
!928 = !DILocation(line: 329, column: 19, scope: !926)
!929 = !DILocation(line: 329, column: 22, scope: !926)
!930 = !DILocation(line: 330, column: 17, scope: !931)
!931 = distinct !DILexicalBlock(scope: !926, file: !31, line: 330, column: 9)
!932 = !DILocation(line: 330, column: 9, scope: !931)
!933 = !DILocation(line: 330, column: 20, scope: !931)
!934 = !DILocation(line: 330, column: 37, scope: !931)
!935 = !DILocation(line: 330, column: 51, scope: !931)
!936 = !DILocation(line: 330, column: 48, scope: !931)
!937 = !DILocation(line: 331, column: 17, scope: !938)
!938 = distinct !DILexicalBlock(scope: !931, file: !31, line: 330, column: 63)
!939 = !DILocation(line: 331, column: 6, scope: !938)
!940 = !DILocation(line: 332, column: 11, scope: !938)
!941 = !DILocation(line: 333, column: 5, scope: !938)
!942 = !DILocation(line: 329, column: 25, scope: !926)
!943 = !DILocation(line: 328, column: 26, scope: !921)
!944 = !DILocation(line: 327, column: 38, scope: !916)
!945 = !DILocation(line: 327, column: 2, scope: !916)
!946 = distinct !{!946, !919, !947, !948}
!947 = !DILocation(line: 333, column: 5, scope: !913)
!948 = !{!"llvm.loop.mustprogress"}
!949 = !DILocation(line: 335, column: 2, scope: !899)
!950 = !DILocation(line: 336, column: 1, scope: !899)
!951 = distinct !DISubprogram(name: "create_omega_blobs", linkageName: "_Z18create_omega_blobsiP10vms_vectorS0_P6object", scope: !31, file: !31, line: 339, type: !952, scopeLine: 340, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !320)
!952 = !DISubroutineType(types: !953)
!953 = !{null, !7, !733, !733, !33}
!954 = !DILocalVariable(name: "firing_segnum", arg: 1, scope: !951, file: !31, line: 339, type: !7)
!955 = !DILocation(line: 339, column: 29, scope: !951)
!956 = !DILocalVariable(name: "firing_pos", arg: 2, scope: !951, file: !31, line: 339, type: !733)
!957 = !DILocation(line: 339, column: 56, scope: !951)
!958 = !DILocalVariable(name: "goal_pos", arg: 3, scope: !951, file: !31, line: 339, type: !733)
!959 = !DILocation(line: 339, column: 80, scope: !951)
!960 = !DILocalVariable(name: "parent_objp", arg: 4, scope: !951, file: !31, line: 339, type: !33)
!961 = !DILocation(line: 339, column: 98, scope: !951)
!962 = !DILocalVariable(name: "i", scope: !951, file: !31, line: 341, type: !7)
!963 = !DILocation(line: 341, column: 8, scope: !951)
!964 = !DILocalVariable(name: "last_segnum", scope: !951, file: !31, line: 341, type: !7)
!965 = !DILocation(line: 341, column: 11, scope: !951)
!966 = !DILocalVariable(name: "last_created_objnum", scope: !951, file: !31, line: 341, type: !7)
!967 = !DILocation(line: 341, column: 24, scope: !951)
!968 = !DILocalVariable(name: "vec_to_goal", scope: !951, file: !31, line: 342, type: !54)
!969 = !DILocation(line: 342, column: 13, scope: !951)
!970 = !DILocalVariable(name: "dist_to_goal", scope: !951, file: !31, line: 343, type: !21)
!971 = !DILocation(line: 343, column: 8, scope: !951)
!972 = !DILocalVariable(name: "num_omega_blobs", scope: !951, file: !31, line: 344, type: !7)
!973 = !DILocation(line: 344, column: 8, scope: !951)
!974 = !DILocalVariable(name: "omega_blob_dist", scope: !951, file: !31, line: 345, type: !21)
!975 = !DILocation(line: 345, column: 8, scope: !951)
!976 = !DILocalVariable(name: "omega_delta_vector", scope: !951, file: !31, line: 346, type: !54)
!977 = !DILocation(line: 346, column: 13, scope: !951)
!978 = !DILocalVariable(name: "blob_pos", scope: !951, file: !31, line: 347, type: !54)
!979 = !DILocation(line: 347, column: 13, scope: !951)
!980 = !DILocalVariable(name: "perturb_vec", scope: !951, file: !31, line: 347, type: !54)
!981 = !DILocation(line: 347, column: 23, scope: !951)
!982 = !DILocalVariable(name: "perturb_array", scope: !951, file: !31, line: 348, type: !983)
!983 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 512, elements: !984)
!984 = !{!985}
!985 = !DISubrange(count: 16)
!986 = !DILocation(line: 348, column: 8, scope: !951)
!987 = !DILocation(line: 350, column: 6, scope: !988)
!988 = distinct !DILexicalBlock(scope: !951, file: !31, line: 350, column: 6)
!989 = !DILocation(line: 350, column: 16, scope: !988)
!990 = !DILocation(line: 351, column: 26, scope: !988)
!991 = !DILocation(line: 351, column: 3, scope: !988)
!992 = !DILocation(line: 353, column: 27, scope: !951)
!993 = !DILocation(line: 353, column: 37, scope: !951)
!994 = !DILocation(line: 353, column: 2, scope: !951)
!995 = !DILocation(line: 355, column: 17, scope: !951)
!996 = !DILocation(line: 355, column: 15, scope: !951)
!997 = !DILocation(line: 357, column: 6, scope: !998)
!998 = distinct !DILexicalBlock(scope: !951, file: !31, line: 357, column: 6)
!999 = !DILocation(line: 357, column: 19, scope: !998)
!1000 = !DILocation(line: 359, column: 19, scope: !1001)
!1001 = distinct !DILexicalBlock(scope: !998, file: !31, line: 358, column: 2)
!1002 = !DILocation(line: 360, column: 21, scope: !1001)
!1003 = !DILocation(line: 360, column: 34, scope: !1001)
!1004 = !DILocation(line: 360, column: 33, scope: !1001)
!1005 = !DILocation(line: 360, column: 19, scope: !1001)
!1006 = !DILocation(line: 361, column: 7, scope: !1007)
!1007 = distinct !DILexicalBlock(scope: !1001, file: !31, line: 361, column: 7)
!1008 = !DILocation(line: 361, column: 23, scope: !1007)
!1009 = !DILocation(line: 362, column: 20, scope: !1007)
!1010 = !DILocation(line: 362, column: 4, scope: !1007)
!1011 = !DILocation(line: 363, column: 2, scope: !1001)
!1012 = !DILocation(line: 365, column: 19, scope: !1013)
!1013 = distinct !DILexicalBlock(scope: !998, file: !31, line: 364, column: 2)
!1014 = !DILocation(line: 366, column: 21, scope: !1013)
!1015 = !DILocation(line: 366, column: 36, scope: !1013)
!1016 = !DILocation(line: 366, column: 34, scope: !1013)
!1017 = !DILocation(line: 366, column: 19, scope: !1013)
!1018 = !DILocation(line: 367, column: 7, scope: !1019)
!1019 = distinct !DILexicalBlock(scope: !1013, file: !31, line: 367, column: 7)
!1020 = !DILocation(line: 367, column: 23, scope: !1019)
!1021 = !DILocation(line: 369, column: 20, scope: !1022)
!1022 = distinct !DILexicalBlock(scope: !1019, file: !31, line: 368, column: 3)
!1023 = !DILocation(line: 370, column: 22, scope: !1022)
!1024 = !DILocation(line: 370, column: 37, scope: !1022)
!1025 = !DILocation(line: 370, column: 35, scope: !1022)
!1026 = !DILocation(line: 370, column: 20, scope: !1022)
!1027 = !DILocation(line: 371, column: 3, scope: !1022)
!1028 = !DILocation(line: 371, column: 14, scope: !1029)
!1029 = distinct !DILexicalBlock(scope: !1019, file: !31, line: 371, column: 14)
!1030 = !DILocation(line: 371, column: 30, scope: !1029)
!1031 = !DILocation(line: 373, column: 20, scope: !1032)
!1032 = distinct !DILexicalBlock(scope: !1029, file: !31, line: 372, column: 3)
!1033 = !DILocation(line: 374, column: 22, scope: !1032)
!1034 = !DILocation(line: 374, column: 37, scope: !1032)
!1035 = !DILocation(line: 374, column: 35, scope: !1032)
!1036 = !DILocation(line: 374, column: 20, scope: !1032)
!1037 = !DILocation(line: 375, column: 3, scope: !1032)
!1038 = !DILocation(line: 378, column: 21, scope: !951)
!1039 = !DILocation(line: 379, column: 36, scope: !951)
!1040 = !DILocation(line: 379, column: 2, scope: !951)
!1041 = !DILocation(line: 382, column: 14, scope: !951)
!1042 = !DILocation(line: 382, column: 11, scope: !951)
!1043 = !DILocation(line: 383, column: 16, scope: !951)
!1044 = !DILocation(line: 383, column: 14, scope: !951)
!1045 = !DILocation(line: 386, column: 6, scope: !1046)
!1046 = distinct !DILexicalBlock(scope: !951, file: !31, line: 386, column: 6)
!1047 = !DILocation(line: 386, column: 19, scope: !1046)
!1048 = !DILocation(line: 388, column: 9, scope: !1049)
!1049 = distinct !DILexicalBlock(scope: !1050, file: !31, line: 388, column: 3)
!1050 = distinct !DILexicalBlock(scope: !1046, file: !31, line: 387, column: 2)
!1051 = !DILocation(line: 388, column: 8, scope: !1049)
!1052 = !DILocation(line: 388, column: 13, scope: !1053)
!1053 = distinct !DILexicalBlock(scope: !1049, file: !31, line: 388, column: 3)
!1054 = !DILocation(line: 388, column: 15, scope: !1053)
!1055 = !DILocation(line: 388, column: 14, scope: !1053)
!1056 = !DILocation(line: 388, column: 3, scope: !1049)
!1057 = !DILocation(line: 389, column: 18, scope: !1053)
!1058 = !DILocation(line: 389, column: 4, scope: !1053)
!1059 = !DILocation(line: 389, column: 21, scope: !1053)
!1060 = !DILocation(line: 388, column: 33, scope: !1053)
!1061 = !DILocation(line: 388, column: 3, scope: !1053)
!1062 = distinct !{!1062, !1056, !1063, !948}
!1063 = !DILocation(line: 389, column: 23, scope: !1049)
!1064 = !DILocation(line: 390, column: 2, scope: !1050)
!1065 = !DILocation(line: 393, column: 3, scope: !1066)
!1066 = distinct !DILexicalBlock(scope: !1046, file: !31, line: 392, column: 2)
!1067 = !DILocation(line: 394, column: 9, scope: !1068)
!1068 = distinct !DILexicalBlock(scope: !1066, file: !31, line: 394, column: 3)
!1069 = !DILocation(line: 394, column: 8, scope: !1068)
!1070 = !DILocation(line: 394, column: 13, scope: !1071)
!1071 = distinct !DILexicalBlock(scope: !1068, file: !31, line: 394, column: 3)
!1072 = !DILocation(line: 394, column: 15, scope: !1071)
!1073 = !DILocation(line: 394, column: 30, scope: !1071)
!1074 = !DILocation(line: 394, column: 14, scope: !1071)
!1075 = !DILocation(line: 394, column: 3, scope: !1068)
!1076 = !DILocation(line: 396, column: 28, scope: !1077)
!1077 = distinct !DILexicalBlock(scope: !1071, file: !31, line: 395, column: 3)
!1078 = !DILocation(line: 396, column: 27, scope: !1077)
!1079 = !DILocation(line: 396, column: 30, scope: !1077)
!1080 = !DILocation(line: 396, column: 18, scope: !1077)
!1081 = !DILocation(line: 396, column: 4, scope: !1077)
!1082 = !DILocation(line: 396, column: 21, scope: !1077)
!1083 = !DILocation(line: 397, column: 46, scope: !1077)
!1084 = !DILocation(line: 397, column: 45, scope: !1077)
!1085 = !DILocation(line: 397, column: 18, scope: !1077)
!1086 = !DILocation(line: 397, column: 33, scope: !1077)
!1087 = !DILocation(line: 397, column: 36, scope: !1077)
!1088 = !DILocation(line: 397, column: 35, scope: !1077)
!1089 = !DILocation(line: 397, column: 4, scope: !1077)
!1090 = !DILocation(line: 397, column: 39, scope: !1077)
!1091 = !DILocation(line: 398, column: 3, scope: !1077)
!1092 = !DILocation(line: 394, column: 35, scope: !1071)
!1093 = !DILocation(line: 394, column: 3, scope: !1071)
!1094 = distinct !{!1094, !1075, !1095, !948}
!1095 = !DILocation(line: 398, column: 3, scope: !1068)
!1096 = !DILocation(line: 402, column: 2, scope: !951)
!1097 = !DILocation(line: 403, column: 35, scope: !951)
!1098 = !DILocation(line: 403, column: 48, scope: !951)
!1099 = !DILocation(line: 403, column: 55, scope: !951)
!1100 = !DILocation(line: 403, column: 2, scope: !951)
!1101 = !DILocation(line: 405, column: 27, scope: !951)
!1102 = !DILocation(line: 407, column: 8, scope: !1103)
!1103 = distinct !DILexicalBlock(scope: !951, file: !31, line: 407, column: 2)
!1104 = !DILocation(line: 407, column: 7, scope: !1103)
!1105 = !DILocation(line: 407, column: 12, scope: !1106)
!1106 = distinct !DILexicalBlock(scope: !1103, file: !31, line: 407, column: 2)
!1107 = !DILocation(line: 407, column: 14, scope: !1106)
!1108 = !DILocation(line: 407, column: 13, scope: !1106)
!1109 = !DILocation(line: 407, column: 2, scope: !1103)
!1110 = !DILocalVariable(name: "temp_pos", scope: !1111, file: !31, line: 409, type: !54)
!1111 = distinct !DILexicalBlock(scope: !1106, file: !31, line: 408, column: 2)
!1112 = !DILocation(line: 409, column: 14, scope: !1111)
!1113 = !DILocalVariable(name: "blob_objnum", scope: !1111, file: !31, line: 410, type: !7)
!1114 = !DILocation(line: 410, column: 9, scope: !1111)
!1115 = !DILocalVariable(name: "segnum", scope: !1111, file: !31, line: 410, type: !7)
!1116 = !DILocation(line: 410, column: 22, scope: !1111)
!1117 = !DILocation(line: 413, column: 7, scope: !1118)
!1118 = distinct !DILexicalBlock(scope: !1111, file: !31, line: 413, column: 7)
!1119 = !DILocation(line: 413, column: 12, scope: !1118)
!1120 = !DILocation(line: 413, column: 27, scope: !1118)
!1121 = !DILocation(line: 413, column: 9, scope: !1118)
!1122 = !DILocation(line: 414, column: 4, scope: !1118)
!1123 = !DILocation(line: 417, column: 8, scope: !1124)
!1124 = distinct !DILexicalBlock(scope: !1111, file: !31, line: 417, column: 7)
!1125 = !DILocation(line: 417, column: 10, scope: !1124)
!1126 = !DILocation(line: 417, column: 15, scope: !1124)
!1127 = !DILocalVariable(name: "temp_vec", scope: !1128, file: !31, line: 419, type: !54)
!1128 = distinct !DILexicalBlock(scope: !1124, file: !31, line: 418, column: 3)
!1129 = !DILocation(line: 419, column: 15, scope: !1128)
!1130 = !DILocation(line: 421, column: 4, scope: !1128)
!1131 = !DILocation(line: 422, column: 4, scope: !1128)
!1132 = !DILocation(line: 423, column: 3, scope: !1128)
!1133 = !DILocation(line: 425, column: 70, scope: !1111)
!1134 = !DILocation(line: 425, column: 56, scope: !1111)
!1135 = !DILocation(line: 425, column: 3, scope: !1111)
!1136 = !DILocation(line: 427, column: 38, scope: !1111)
!1137 = !DILocation(line: 427, column: 12, scope: !1111)
!1138 = !DILocation(line: 427, column: 10, scope: !1111)
!1139 = !DILocation(line: 428, column: 7, scope: !1140)
!1140 = distinct !DILexicalBlock(scope: !1111, file: !31, line: 428, column: 7)
!1141 = !DILocation(line: 428, column: 14, scope: !1140)
!1142 = !DILocalVariable(name: "objp", scope: !1143, file: !31, line: 430, type: !33)
!1143 = distinct !DILexicalBlock(scope: !1140, file: !31, line: 429, column: 3)
!1144 = !DILocation(line: 430, column: 13, scope: !1143)
!1145 = !DILocation(line: 432, column: 18, scope: !1143)
!1146 = !DILocation(line: 432, column: 16, scope: !1143)
!1147 = !DILocation(line: 433, column: 51, scope: !1143)
!1148 = !DILocation(line: 433, column: 18, scope: !1143)
!1149 = !DILocation(line: 433, column: 16, scope: !1143)
!1150 = !DILocation(line: 434, column: 8, scope: !1151)
!1151 = distinct !DILexicalBlock(scope: !1143, file: !31, line: 434, column: 8)
!1152 = !DILocation(line: 434, column: 20, scope: !1151)
!1153 = !DILocation(line: 435, column: 5, scope: !1151)
!1154 = !DILocation(line: 437, column: 26, scope: !1143)
!1155 = !DILocation(line: 437, column: 24, scope: !1143)
!1156 = !DILocation(line: 439, column: 20, scope: !1143)
!1157 = !DILocation(line: 439, column: 12, scope: !1143)
!1158 = !DILocation(line: 439, column: 9, scope: !1143)
!1159 = !DILocation(line: 441, column: 4, scope: !1143)
!1160 = !DILocation(line: 441, column: 10, scope: !1143)
!1161 = !DILocation(line: 441, column: 19, scope: !1143)
!1162 = !DILocation(line: 442, column: 4, scope: !1143)
!1163 = !DILocation(line: 442, column: 10, scope: !1143)
!1164 = !DILocation(line: 442, column: 26, scope: !1143)
!1165 = !DILocation(line: 442, column: 35, scope: !1143)
!1166 = !DILocation(line: 445, column: 18, scope: !1143)
!1167 = !DILocation(line: 445, column: 24, scope: !1143)
!1168 = !DILocation(line: 445, column: 40, scope: !1143)
!1169 = !DILocation(line: 445, column: 4, scope: !1143)
!1170 = !DILocation(line: 447, column: 29, scope: !1143)
!1171 = !DILocation(line: 447, column: 35, scope: !1143)
!1172 = !DILocation(line: 447, column: 17, scope: !1143)
!1173 = !DILocation(line: 447, column: 39, scope: !1143)
!1174 = !DILocation(line: 447, column: 4, scope: !1143)
!1175 = !DILocation(line: 447, column: 10, scope: !1143)
!1176 = !DILocation(line: 447, column: 15, scope: !1143)
!1177 = !DILocation(line: 449, column: 46, scope: !1143)
!1178 = !DILocation(line: 449, column: 45, scope: !1143)
!1179 = !DILocation(line: 449, column: 69, scope: !1143)
!1180 = !DILocation(line: 449, column: 75, scope: !1143)
!1181 = !DILocation(line: 449, column: 57, scope: !1143)
!1182 = !DILocation(line: 449, column: 79, scope: !1143)
!1183 = !DILocation(line: 449, column: 88, scope: !1143)
!1184 = !DILocation(line: 449, column: 20, scope: !1143)
!1185 = !DILocation(line: 449, column: 4, scope: !1143)
!1186 = !DILocation(line: 449, column: 10, scope: !1143)
!1187 = !DILocation(line: 449, column: 18, scope: !1143)
!1188 = !DILocation(line: 451, column: 43, scope: !1143)
!1189 = !DILocation(line: 451, column: 56, scope: !1143)
!1190 = !DILocation(line: 451, column: 4, scope: !1143)
!1191 = !DILocation(line: 451, column: 10, scope: !1143)
!1192 = !DILocation(line: 451, column: 27, scope: !1143)
!1193 = !DILocation(line: 451, column: 41, scope: !1143)
!1194 = !DILocation(line: 452, column: 46, scope: !1143)
!1195 = !DILocation(line: 452, column: 59, scope: !1143)
!1196 = !DILocation(line: 452, column: 4, scope: !1143)
!1197 = !DILocation(line: 452, column: 10, scope: !1143)
!1198 = !DILocation(line: 452, column: 27, scope: !1143)
!1199 = !DILocation(line: 452, column: 44, scope: !1143)
!1200 = !DILocation(line: 453, column: 42, scope: !1143)
!1201 = !DILocation(line: 453, column: 53, scope: !1143)
!1202 = !DILocation(line: 453, column: 4, scope: !1143)
!1203 = !DILocation(line: 453, column: 10, scope: !1143)
!1204 = !DILocation(line: 453, column: 27, scope: !1143)
!1205 = !DILocation(line: 453, column: 40, scope: !1143)
!1206 = !DILocation(line: 454, column: 4, scope: !1143)
!1207 = !DILocation(line: 454, column: 10, scope: !1143)
!1208 = !DILocation(line: 454, column: 24, scope: !1143)
!1209 = !DILocation(line: 456, column: 3, scope: !1143)
!1210 = !DILocation(line: 457, column: 3, scope: !1111)
!1211 = !DILocation(line: 458, column: 2, scope: !1111)
!1212 = !DILocation(line: 407, column: 32, scope: !1106)
!1213 = !DILocation(line: 407, column: 2, scope: !1106)
!1214 = distinct !{!1214, !1109, !1215, !948}
!1215 = !DILocation(line: 458, column: 2, scope: !1103)
!1216 = !DILocation(line: 461, column: 6, scope: !1217)
!1217 = distinct !DILexicalBlock(scope: !951, file: !31, line: 461, column: 6)
!1218 = !DILocation(line: 461, column: 26, scope: !1217)
!1219 = !DILocation(line: 463, column: 25, scope: !1220)
!1220 = distinct !DILexicalBlock(scope: !1217, file: !31, line: 462, column: 2)
!1221 = !DILocation(line: 463, column: 17, scope: !1220)
!1222 = !DILocation(line: 463, column: 46, scope: !1220)
!1223 = !DILocation(line: 463, column: 62, scope: !1220)
!1224 = !DILocation(line: 463, column: 100, scope: !1220)
!1225 = !DILocation(line: 463, column: 72, scope: !1220)
!1226 = !DILocation(line: 463, column: 117, scope: !1220)
!1227 = !DILocation(line: 463, column: 3, scope: !1220)
!1228 = !DILocation(line: 464, column: 11, scope: !1220)
!1229 = !DILocation(line: 464, column: 3, scope: !1220)
!1230 = !DILocation(line: 464, column: 32, scope: !1220)
!1231 = !DILocation(line: 464, column: 46, scope: !1220)
!1232 = !DILocation(line: 465, column: 2, scope: !1220)
!1233 = !DILocation(line: 467, column: 27, scope: !951)
!1234 = !DILocation(line: 468, column: 1, scope: !951)
!1235 = distinct !DISubprogram(name: "fixmul", linkageName: "_Z6fixmulii", scope: !22, file: !22, line: 83, type: !882, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !320)
!1236 = !DILocalVariable(name: "a", arg: 1, scope: !1235, file: !22, line: 83, type: !21)
!1237 = !DILocation(line: 83, column: 26, scope: !1235)
!1238 = !DILocalVariable(name: "b", arg: 2, scope: !1235, file: !22, line: 83, type: !21)
!1239 = !DILocation(line: 83, column: 33, scope: !1235)
!1240 = !DILocation(line: 85, column: 19, scope: !1235)
!1241 = !DILocation(line: 85, column: 32, scope: !1235)
!1242 = !DILocation(line: 85, column: 21, scope: !1235)
!1243 = !DILocation(line: 85, column: 35, scope: !1235)
!1244 = !DILocation(line: 85, column: 9, scope: !1235)
!1245 = !DILocation(line: 85, column: 2, scope: !1235)
!1246 = distinct !DISubprogram(name: "omega_charge_frame", linkageName: "_Z18omega_charge_framev", scope: !31, file: !31, line: 480, type: !1247, scopeLine: 481, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !320)
!1247 = !DISubroutineType(types: !1248)
!1248 = !{null}
!1249 = !DILocalVariable(name: "delta_charge", scope: !1246, file: !31, line: 482, type: !21)
!1250 = !DILocation(line: 482, column: 6, scope: !1246)
!1251 = !DILocalVariable(name: "old_omega_charge", scope: !1246, file: !31, line: 482, type: !21)
!1252 = !DILocation(line: 482, column: 20, scope: !1246)
!1253 = !DILocation(line: 484, column: 6, scope: !1254)
!1254 = distinct !DILexicalBlock(scope: !1246, file: !31, line: 484, column: 6)
!1255 = !DILocation(line: 484, column: 19, scope: !1254)
!1256 = !DILocation(line: 485, column: 3, scope: !1254)
!1257 = !DILocation(line: 487, column: 8, scope: !1258)
!1258 = distinct !DILexicalBlock(scope: !1246, file: !31, line: 487, column: 6)
!1259 = !DILocation(line: 487, column: 42, scope: !1258)
!1260 = !DILocation(line: 487, column: 7, scope: !1258)
!1261 = !DILocation(line: 487, column: 6, scope: !1258)
!1262 = !DILocation(line: 488, column: 3, scope: !1258)
!1263 = !DILocation(line: 490, column: 6, scope: !1264)
!1264 = distinct !DILexicalBlock(scope: !1246, file: !31, line: 490, column: 6)
!1265 = !DILocation(line: 491, column: 3, scope: !1264)
!1266 = !DILocation(line: 493, column: 7, scope: !1267)
!1267 = distinct !DILexicalBlock(scope: !1246, file: !31, line: 493, column: 6)
!1268 = !DILocation(line: 493, column: 22, scope: !1267)
!1269 = !DILocation(line: 493, column: 38, scope: !1267)
!1270 = !DILocation(line: 493, column: 42, scope: !1267)
!1271 = !DILocation(line: 493, column: 55, scope: !1267)
!1272 = !DILocation(line: 493, column: 61, scope: !1267)
!1273 = !DILocation(line: 493, column: 73, scope: !1267)
!1274 = !DILocation(line: 493, column: 65, scope: !1267)
!1275 = !DILocation(line: 493, column: 85, scope: !1267)
!1276 = !DILocation(line: 493, column: 92, scope: !1267)
!1277 = !DILocation(line: 494, column: 17, scope: !1278)
!1278 = distinct !DILexicalBlock(scope: !1267, file: !31, line: 493, column: 99)
!1279 = !DILocation(line: 495, column: 3, scope: !1278)
!1280 = !DILocation(line: 496, column: 2, scope: !1278)
!1281 = !DILocation(line: 499, column: 7, scope: !1282)
!1282 = distinct !DILexicalBlock(scope: !1246, file: !31, line: 499, column: 6)
!1283 = !DILocation(line: 499, column: 32, scope: !1282)
!1284 = !DILocation(line: 499, column: 29, scope: !1282)
!1285 = !DILocation(line: 499, column: 44, scope: !1282)
!1286 = !DILocation(line: 499, column: 48, scope: !1282)
!1287 = !DILocation(line: 499, column: 73, scope: !1282)
!1288 = !DILocation(line: 499, column: 83, scope: !1282)
!1289 = !DILocation(line: 499, column: 70, scope: !1282)
!1290 = !DILocation(line: 500, column: 3, scope: !1282)
!1291 = !DILocation(line: 502, column: 14, scope: !1292)
!1292 = distinct !DILexicalBlock(scope: !1246, file: !31, line: 502, column: 6)
!1293 = !DILocation(line: 502, column: 6, scope: !1292)
!1294 = !DILocation(line: 502, column: 26, scope: !1292)
!1295 = !DILocalVariable(name: "energy_used", scope: !1296, file: !31, line: 503, type: !21)
!1296 = distinct !DILexicalBlock(scope: !1292, file: !31, line: 502, column: 34)
!1297 = !DILocation(line: 503, column: 7, scope: !1296)
!1298 = !DILocation(line: 505, column: 22, scope: !1296)
!1299 = !DILocation(line: 505, column: 20, scope: !1296)
!1300 = !DILocation(line: 506, column: 19, scope: !1296)
!1301 = !DILocation(line: 506, column: 28, scope: !1296)
!1302 = !DILocation(line: 506, column: 16, scope: !1296)
!1303 = !DILocation(line: 507, column: 7, scope: !1304)
!1304 = distinct !DILexicalBlock(scope: !1296, file: !31, line: 507, column: 7)
!1305 = !DILocation(line: 507, column: 20, scope: !1304)
!1306 = !DILocation(line: 508, column: 17, scope: !1304)
!1307 = !DILocation(line: 508, column: 4, scope: !1304)
!1308 = !DILocation(line: 510, column: 18, scope: !1296)
!1309 = !DILocation(line: 510, column: 33, scope: !1296)
!1310 = !DILocation(line: 510, column: 31, scope: !1296)
!1311 = !DILocation(line: 510, column: 16, scope: !1296)
!1312 = !DILocation(line: 512, column: 37, scope: !1296)
!1313 = !DILocation(line: 512, column: 17, scope: !1296)
!1314 = !DILocation(line: 512, column: 15, scope: !1296)
!1315 = !DILocation(line: 513, column: 7, scope: !1316)
!1316 = distinct !DILexicalBlock(scope: !1296, file: !31, line: 513, column: 7)
!1317 = !DILocation(line: 513, column: 24, scope: !1316)
!1318 = !DILocation(line: 514, column: 25, scope: !1316)
!1319 = !DILocation(line: 514, column: 42, scope: !1316)
!1320 = !DILocation(line: 514, column: 58, scope: !1316)
!1321 = !DILocation(line: 514, column: 38, scope: !1316)
!1322 = !DILocation(line: 514, column: 61, scope: !1316)
!1323 = !DILocation(line: 514, column: 18, scope: !1316)
!1324 = !DILocation(line: 514, column: 16, scope: !1316)
!1325 = !DILocation(line: 514, column: 4, scope: !1316)
!1326 = !DILocation(line: 516, column: 33, scope: !1296)
!1327 = !DILocation(line: 516, column: 11, scope: !1296)
!1328 = !DILocation(line: 516, column: 3, scope: !1296)
!1329 = !DILocation(line: 516, column: 23, scope: !1296)
!1330 = !DILocation(line: 516, column: 30, scope: !1296)
!1331 = !DILocation(line: 517, column: 15, scope: !1332)
!1332 = distinct !DILexicalBlock(scope: !1296, file: !31, line: 517, column: 7)
!1333 = !DILocation(line: 517, column: 7, scope: !1332)
!1334 = !DILocation(line: 517, column: 27, scope: !1332)
!1335 = !DILocation(line: 517, column: 34, scope: !1332)
!1336 = !DILocation(line: 518, column: 12, scope: !1332)
!1337 = !DILocation(line: 518, column: 4, scope: !1332)
!1338 = !DILocation(line: 518, column: 24, scope: !1332)
!1339 = !DILocation(line: 518, column: 31, scope: !1332)
!1340 = !DILocation(line: 519, column: 2, scope: !1296)
!1341 = !DILocation(line: 520, column: 1, scope: !1246)
!1342 = distinct !DISubprogram(name: "i2f", linkageName: "_Z3i2fi", scope: !22, file: !22, line: 49, type: !1343, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !320)
!1343 = !DISubroutineType(types: !1344)
!1344 = !{!21, !7}
!1345 = !DILocalVariable(name: "i", arg: 1, scope: !1342, file: !22, line: 49, type: !7)
!1346 = !DILocation(line: 49, column: 23, scope: !1342)
!1347 = !DILocation(line: 51, column: 9, scope: !1342)
!1348 = !DILocation(line: 51, column: 11, scope: !1342)
!1349 = !DILocation(line: 51, column: 2, scope: !1342)
!1350 = distinct !DISubprogram(name: "do_omega_stuff", linkageName: "_Z14do_omega_stuffP6objectP10vms_vectorS0_", scope: !31, file: !31, line: 529, type: !1351, scopeLine: 530, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !320)
!1351 = !DISubroutineType(types: !1352)
!1352 = !{null, !33, !733, !33}
!1353 = !DILocalVariable(name: "parent_objp", arg: 1, scope: !1350, file: !31, line: 529, type: !33)
!1354 = !DILocation(line: 529, column: 29, scope: !1350)
!1355 = !DILocalVariable(name: "firing_pos", arg: 2, scope: !1350, file: !31, line: 529, type: !733)
!1356 = !DILocation(line: 529, column: 54, scope: !1350)
!1357 = !DILocalVariable(name: "weapon_objp", arg: 3, scope: !1350, file: !31, line: 529, type: !33)
!1358 = !DILocation(line: 529, column: 74, scope: !1350)
!1359 = !DILocalVariable(name: "lock_objnum", scope: !1350, file: !31, line: 531, type: !7)
!1360 = !DILocation(line: 531, column: 8, scope: !1350)
!1361 = !DILocalVariable(name: "firing_segnum", scope: !1350, file: !31, line: 531, type: !7)
!1362 = !DILocation(line: 531, column: 21, scope: !1350)
!1363 = !DILocalVariable(name: "goal_pos", scope: !1350, file: !31, line: 532, type: !54)
!1364 = !DILocation(line: 532, column: 13, scope: !1350)
!1365 = !DILocalVariable(name: "pnum", scope: !1350, file: !31, line: 533, type: !7)
!1366 = !DILocation(line: 533, column: 8, scope: !1350)
!1367 = !DILocation(line: 533, column: 15, scope: !1350)
!1368 = !DILocation(line: 533, column: 28, scope: !1350)
!1369 = !DILocation(line: 535, column: 6, scope: !1370)
!1370 = distinct !DILexicalBlock(scope: !1350, file: !31, line: 535, column: 6)
!1371 = !DILocation(line: 535, column: 14, scope: !1370)
!1372 = !DILocation(line: 535, column: 11, scope: !1370)
!1373 = !DILocation(line: 538, column: 10, scope: !1374)
!1374 = distinct !DILexicalBlock(scope: !1375, file: !31, line: 538, column: 7)
!1375 = distinct !DILexicalBlock(scope: !1370, file: !31, line: 536, column: 2)
!1376 = !DILocation(line: 538, column: 23, scope: !1374)
!1377 = !DILocation(line: 538, column: 44, scope: !1374)
!1378 = !DILocation(line: 538, column: 48, scope: !1374)
!1379 = !DILocation(line: 538, column: 61, scope: !1374)
!1380 = !DILocation(line: 538, column: 73, scope: !1374)
!1381 = !DILocation(line: 538, column: 65, scope: !1374)
!1382 = !DILocation(line: 538, column: 79, scope: !1374)
!1383 = !DILocation(line: 538, column: 7, scope: !1374)
!1384 = !DILocation(line: 540, column: 15, scope: !1385)
!1385 = distinct !DILexicalBlock(scope: !1374, file: !31, line: 539, column: 3)
!1386 = !DILocation(line: 540, column: 26, scope: !1385)
!1387 = !DILocation(line: 540, column: 4, scope: !1385)
!1388 = !DILocation(line: 541, column: 4, scope: !1385)
!1389 = !DILocation(line: 544, column: 19, scope: !1375)
!1390 = !DILocation(line: 544, column: 16, scope: !1375)
!1391 = !DILocation(line: 545, column: 7, scope: !1392)
!1392 = distinct !DILexicalBlock(scope: !1375, file: !31, line: 545, column: 7)
!1393 = !DILocation(line: 545, column: 20, scope: !1392)
!1394 = !DILocation(line: 546, column: 17, scope: !1392)
!1395 = !DILocation(line: 546, column: 4, scope: !1392)
!1396 = !DILocation(line: 549, column: 26, scope: !1375)
!1397 = !DILocation(line: 549, column: 34, scope: !1375)
!1398 = !DILocation(line: 549, column: 24, scope: !1375)
!1399 = !DILocation(line: 551, column: 27, scope: !1375)
!1400 = !DILocation(line: 551, column: 25, scope: !1375)
!1401 = !DILocation(line: 552, column: 2, scope: !1375)
!1402 = !DILocation(line: 554, column: 2, scope: !1350)
!1403 = !DILocation(line: 554, column: 15, scope: !1350)
!1404 = !DILocation(line: 554, column: 32, scope: !1350)
!1405 = !DILocation(line: 554, column: 44, scope: !1350)
!1406 = !DILocation(line: 555, column: 53, scope: !1350)
!1407 = !DILocation(line: 555, column: 45, scope: !1350)
!1408 = !DILocation(line: 555, column: 59, scope: !1350)
!1409 = !DILocation(line: 555, column: 2, scope: !1350)
!1410 = !DILocation(line: 555, column: 15, scope: !1350)
!1411 = !DILocation(line: 555, column: 32, scope: !1350)
!1412 = !DILocation(line: 555, column: 43, scope: !1350)
!1413 = !DILocation(line: 556, column: 67, scope: !1350)
!1414 = !DILocation(line: 556, column: 59, scope: !1350)
!1415 = !DILocation(line: 556, column: 73, scope: !1350)
!1416 = !DILocation(line: 556, column: 51, scope: !1350)
!1417 = !DILocation(line: 556, column: 81, scope: !1350)
!1418 = !DILocation(line: 556, column: 2, scope: !1350)
!1419 = !DILocation(line: 556, column: 15, scope: !1350)
!1420 = !DILocation(line: 556, column: 32, scope: !1350)
!1421 = !DILocation(line: 556, column: 49, scope: !1350)
!1422 = !DILocation(line: 558, column: 35, scope: !1350)
!1423 = !DILocation(line: 558, column: 47, scope: !1350)
!1424 = !DILocation(line: 558, column: 16, scope: !1350)
!1425 = !DILocation(line: 558, column: 14, scope: !1350)
!1426 = !DILocation(line: 560, column: 33, scope: !1350)
!1427 = !DILocation(line: 560, column: 45, scope: !1350)
!1428 = !DILocation(line: 560, column: 58, scope: !1350)
!1429 = !DILocation(line: 560, column: 18, scope: !1350)
!1430 = !DILocation(line: 560, column: 16, scope: !1350)
!1431 = !DILocation(line: 563, column: 7, scope: !1432)
!1432 = distinct !DILexicalBlock(scope: !1350, file: !31, line: 563, column: 7)
!1433 = !DILocation(line: 563, column: 22, scope: !1432)
!1434 = !DILocation(line: 563, column: 19, scope: !1432)
!1435 = !DILocation(line: 564, column: 33, scope: !1432)
!1436 = !DILocation(line: 564, column: 46, scope: !1432)
!1437 = !DILocation(line: 564, column: 21, scope: !1432)
!1438 = !DILocation(line: 564, column: 50, scope: !1432)
!1439 = !DILocation(line: 564, column: 3, scope: !1432)
!1440 = !DILocation(line: 566, column: 39, scope: !1432)
!1441 = !DILocation(line: 566, column: 52, scope: !1432)
!1442 = !DILocation(line: 566, column: 27, scope: !1432)
!1443 = !DILocation(line: 566, column: 56, scope: !1432)
!1444 = !DILocation(line: 566, column: 69, scope: !1432)
!1445 = !DILocation(line: 566, column: 82, scope: !1432)
!1446 = !DILocation(line: 566, column: 94, scope: !1432)
!1447 = !DILocation(line: 566, column: 107, scope: !1432)
!1448 = !DILocation(line: 566, column: 3, scope: !1432)
!1449 = !DILocation(line: 574, column: 13, scope: !1350)
!1450 = !DILocation(line: 574, column: 24, scope: !1350)
!1451 = !DILocation(line: 574, column: 2, scope: !1350)
!1452 = !DILocation(line: 577, column: 6, scope: !1453)
!1453 = distinct !DILexicalBlock(scope: !1350, file: !31, line: 577, column: 6)
!1454 = !DILocation(line: 577, column: 18, scope: !1453)
!1455 = !DILocalVariable(name: "fq", scope: !1456, file: !31, line: 579, type: !1457)
!1456 = distinct !DILexicalBlock(scope: !1453, file: !31, line: 578, column: 2)
!1457 = !DIDerivedType(tag: DW_TAG_typedef, name: "fvi_query", file: !1458, line: 58, baseType: !1459)
!1458 = !DIFile(filename: "main_d2/fvi.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "d2a92d1b0ff4ebfc1a57eff3c7d6fa46")
!1459 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fvi_query", file: !1458, line: 50, size: 384, flags: DIFlagTypePassByValue, elements: !1460, identifier: "_ZTS9fvi_query")
!1460 = !{!1461, !1462, !1463, !1464, !1465, !1466, !1468}
!1461 = !DIDerivedType(tag: DW_TAG_member, name: "p0", scope: !1459, file: !1458, line: 52, baseType: !733, size: 64)
!1462 = !DIDerivedType(tag: DW_TAG_member, name: "p1", scope: !1459, file: !1458, line: 52, baseType: !733, size: 64, offset: 64)
!1463 = !DIDerivedType(tag: DW_TAG_member, name: "startseg", scope: !1459, file: !1458, line: 53, baseType: !7, size: 32, offset: 128)
!1464 = !DIDerivedType(tag: DW_TAG_member, name: "rad", scope: !1459, file: !1458, line: 54, baseType: !21, size: 32, offset: 160)
!1465 = !DIDerivedType(tag: DW_TAG_member, name: "thisobjnum", scope: !1459, file: !1458, line: 55, baseType: !45, size: 16, offset: 192)
!1466 = !DIDerivedType(tag: DW_TAG_member, name: "ignore_obj_list", scope: !1459, file: !1458, line: 56, baseType: !1467, size: 64, offset: 256)
!1467 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!1468 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !1459, file: !1458, line: 57, baseType: !7, size: 32, offset: 320)
!1469 = !DILocation(line: 579, column: 13, scope: !1456)
!1470 = !DILocalVariable(name: "hit_data", scope: !1456, file: !31, line: 580, type: !1471)
!1471 = !DIDerivedType(tag: DW_TAG_typedef, name: "fvi_info", file: !1458, line: 40, baseType: !1472)
!1472 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fvi_info", file: !1458, line: 29, size: 3584, flags: DIFlagTypePassByValue, elements: !1473, identifier: "_ZTS8fvi_info")
!1473 = !{!1474, !1475, !1476, !1477, !1478, !1479, !1480, !1481, !1482}
!1474 = !DIDerivedType(tag: DW_TAG_member, name: "hit_type", scope: !1472, file: !1458, line: 31, baseType: !7, size: 32)
!1475 = !DIDerivedType(tag: DW_TAG_member, name: "hit_pnt", scope: !1472, file: !1458, line: 32, baseType: !54, size: 96, offset: 32)
!1476 = !DIDerivedType(tag: DW_TAG_member, name: "hit_seg", scope: !1472, file: !1458, line: 33, baseType: !7, size: 32, offset: 128)
!1477 = !DIDerivedType(tag: DW_TAG_member, name: "hit_side", scope: !1472, file: !1458, line: 34, baseType: !7, size: 32, offset: 160)
!1478 = !DIDerivedType(tag: DW_TAG_member, name: "hit_side_seg", scope: !1472, file: !1458, line: 35, baseType: !7, size: 32, offset: 192)
!1479 = !DIDerivedType(tag: DW_TAG_member, name: "hit_object", scope: !1472, file: !1458, line: 36, baseType: !7, size: 32, offset: 224)
!1480 = !DIDerivedType(tag: DW_TAG_member, name: "hit_wallnorm", scope: !1472, file: !1458, line: 37, baseType: !54, size: 96, offset: 256)
!1481 = !DIDerivedType(tag: DW_TAG_member, name: "n_segs", scope: !1472, file: !1458, line: 38, baseType: !7, size: 32, offset: 352)
!1482 = !DIDerivedType(tag: DW_TAG_member, name: "seglist", scope: !1472, file: !1458, line: 39, baseType: !1483, size: 3200, offset: 384)
!1483 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !1484)
!1484 = !{!1485}
!1485 = !DISubrange(count: 100)
!1486 = !DILocation(line: 580, column: 13, scope: !1456)
!1487 = !DILocalVariable(name: "fate", scope: !1456, file: !31, line: 581, type: !7)
!1488 = !DILocation(line: 581, column: 9, scope: !1456)
!1489 = !DILocalVariable(name: "perturb_vec", scope: !1456, file: !31, line: 582, type: !54)
!1490 = !DILocation(line: 582, column: 14, scope: !1456)
!1491 = !DILocalVariable(name: "perturbed_fvec", scope: !1456, file: !31, line: 582, type: !54)
!1492 = !DILocation(line: 582, column: 27, scope: !1456)
!1493 = !DILocation(line: 584, column: 3, scope: !1456)
!1494 = !DILocation(line: 585, column: 38, scope: !1456)
!1495 = !DILocation(line: 585, column: 51, scope: !1456)
!1496 = !DILocation(line: 585, column: 58, scope: !1456)
!1497 = !DILocation(line: 585, column: 3, scope: !1456)
!1498 = !DILocation(line: 587, column: 31, scope: !1456)
!1499 = !DILocation(line: 587, column: 3, scope: !1456)
!1500 = !DILocation(line: 588, column: 17, scope: !1456)
!1501 = !DILocation(line: 588, column: 6, scope: !1456)
!1502 = !DILocation(line: 588, column: 15, scope: !1456)
!1503 = !DILocation(line: 589, column: 10, scope: !1504)
!1504 = distinct !DILexicalBlock(scope: !1456, file: !31, line: 589, column: 7)
!1505 = !DILocation(line: 589, column: 19, scope: !1504)
!1506 = !DILocation(line: 590, column: 4, scope: !1507)
!1507 = distinct !DILexicalBlock(scope: !1504, file: !31, line: 589, column: 26)
!1508 = !DILocation(line: 591, column: 4, scope: !1507)
!1509 = !DILocation(line: 593, column: 16, scope: !1456)
!1510 = !DILocation(line: 593, column: 6, scope: !1456)
!1511 = !DILocation(line: 593, column: 14, scope: !1456)
!1512 = !DILocation(line: 594, column: 6, scope: !1456)
!1513 = !DILocation(line: 594, column: 14, scope: !1456)
!1514 = !DILocation(line: 595, column: 6, scope: !1456)
!1515 = !DILocation(line: 595, column: 14, scope: !1456)
!1516 = !DILocation(line: 596, column: 21, scope: !1456)
!1517 = !DILocation(line: 596, column: 32, scope: !1456)
!1518 = !DILocation(line: 596, column: 6, scope: !1456)
!1519 = !DILocation(line: 596, column: 19, scope: !1456)
!1520 = !DILocation(line: 597, column: 6, scope: !1456)
!1521 = !DILocation(line: 597, column: 22, scope: !1456)
!1522 = !DILocation(line: 598, column: 6, scope: !1456)
!1523 = !DILocation(line: 598, column: 16, scope: !1456)
!1524 = !DILocation(line: 600, column: 10, scope: !1456)
!1525 = !DILocation(line: 600, column: 8, scope: !1456)
!1526 = !DILocation(line: 601, column: 7, scope: !1527)
!1527 = distinct !DILexicalBlock(scope: !1456, file: !31, line: 601, column: 7)
!1528 = !DILocation(line: 601, column: 12, scope: !1527)
!1529 = !DILocation(line: 603, column: 4, scope: !1530)
!1530 = distinct !DILexicalBlock(scope: !1527, file: !31, line: 602, column: 3)
!1531 = !DILocation(line: 604, column: 24, scope: !1530)
!1532 = !DILocation(line: 604, column: 13, scope: !1530)
!1533 = !DILocation(line: 605, column: 3, scope: !1530)
!1534 = !DILocation(line: 606, column: 2, scope: !1456)
!1535 = !DILocation(line: 607, column: 22, scope: !1453)
!1536 = !DILocation(line: 607, column: 14, scope: !1453)
!1537 = !DILocation(line: 607, column: 35, scope: !1453)
!1538 = !DILocation(line: 607, column: 12, scope: !1453)
!1539 = !DILocation(line: 610, column: 21, scope: !1350)
!1540 = !DILocation(line: 610, column: 36, scope: !1350)
!1541 = !DILocation(line: 610, column: 59, scope: !1350)
!1542 = !DILocation(line: 610, column: 2, scope: !1350)
!1543 = !DILocation(line: 611, column: 1, scope: !1350)
!1544 = distinct !DISubprogram(name: "find_homing_object", linkageName: "_Z18find_homing_objectP10vms_vectorP6object", scope: !31, file: !31, line: 997, type: !1545, scopeLine: 998, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !320)
!1545 = !DISubroutineType(types: !1546)
!1546 = !{!7, !733, !33}
!1547 = !DILocalVariable(name: "curpos", arg: 1, scope: !1544, file: !31, line: 997, type: !733)
!1548 = !DILocation(line: 997, column: 36, scope: !1544)
!1549 = !DILocalVariable(name: "tracker", arg: 2, scope: !1544, file: !31, line: 997, type: !33)
!1550 = !DILocation(line: 997, column: 52, scope: !1544)
!1551 = !DILocalVariable(name: "i", scope: !1544, file: !31, line: 1122, type: !7)
!1552 = !DILocation(line: 1122, column: 6, scope: !1544)
!1553 = !DILocalVariable(name: "max_dot", scope: !1544, file: !31, line: 1123, type: !21)
!1554 = !DILocation(line: 1123, column: 6, scope: !1544)
!1555 = !DILocalVariable(name: "best_objnum", scope: !1544, file: !31, line: 1124, type: !7)
!1556 = !DILocation(line: 1124, column: 6, scope: !1544)
!1557 = !DILocation(line: 1127, column: 2, scope: !1544)
!1558 = !DILocation(line: 1131, column: 6, scope: !1559)
!1559 = distinct !DILexicalBlock(scope: !1544, file: !31, line: 1131, column: 6)
!1560 = !DILocation(line: 1131, column: 16, scope: !1559)
!1561 = !DILocation(line: 1132, column: 43, scope: !1559)
!1562 = !DILocation(line: 1132, column: 52, scope: !1559)
!1563 = !DILocation(line: 1132, column: 10, scope: !1559)
!1564 = !DILocation(line: 1132, column: 3, scope: !1559)
!1565 = !DILocalVariable(name: "cur_min_trackable_dot", scope: !1566, file: !31, line: 1135, type: !7)
!1566 = distinct !DILexicalBlock(scope: !1559, file: !31, line: 1134, column: 2)
!1567 = !DILocation(line: 1135, column: 7, scope: !1566)
!1568 = !DILocation(line: 1137, column: 25, scope: !1566)
!1569 = !DILocation(line: 1138, column: 8, scope: !1570)
!1570 = distinct !DILexicalBlock(scope: !1566, file: !31, line: 1138, column: 7)
!1571 = !DILocation(line: 1138, column: 17, scope: !1570)
!1572 = !DILocation(line: 1138, column: 22, scope: !1570)
!1573 = !DILocation(line: 1138, column: 37, scope: !1570)
!1574 = !DILocation(line: 1138, column: 41, scope: !1570)
!1575 = !DILocation(line: 1138, column: 50, scope: !1570)
!1576 = !DILocation(line: 1138, column: 53, scope: !1570)
!1577 = !DILocation(line: 1139, column: 26, scope: !1570)
!1578 = !DILocation(line: 1139, column: 4, scope: !1570)
!1579 = !DILocation(line: 1142, column: 7, scope: !1580)
!1580 = distinct !DILexicalBlock(scope: !1566, file: !31, line: 1142, column: 7)
!1581 = !DILocation(line: 1142, column: 16, scope: !1580)
!1582 = !DILocation(line: 1142, column: 33, scope: !1580)
!1583 = !DILocation(line: 1142, column: 55, scope: !1580)
!1584 = !DILocation(line: 1142, column: 47, scope: !1580)
!1585 = !DILocation(line: 1142, column: 67, scope: !1580)
!1586 = !DILocation(line: 1142, column: 44, scope: !1580)
!1587 = !DILocation(line: 1144, column: 18, scope: !1588)
!1588 = distinct !DILexicalBlock(scope: !1589, file: !31, line: 1144, column: 8)
!1589 = distinct !DILexicalBlock(scope: !1580, file: !31, line: 1143, column: 3)
!1590 = !DILocation(line: 1144, column: 10, scope: !1588)
!1591 = !DILocation(line: 1144, column: 30, scope: !1588)
!1592 = !DILocation(line: 1144, column: 36, scope: !1588)
!1593 = !DILocation(line: 1144, column: 9, scope: !1588)
!1594 = !DILocation(line: 1144, column: 8, scope: !1588)
!1595 = !DILocation(line: 1145, column: 19, scope: !1588)
!1596 = !DILocation(line: 1145, column: 33, scope: !1588)
!1597 = !DILocation(line: 1145, column: 17, scope: !1588)
!1598 = !DILocation(line: 1145, column: 5, scope: !1588)
!1599 = !DILocation(line: 1146, column: 3, scope: !1589)
!1600 = !DILocalVariable(name: "window_num", scope: !1601, file: !31, line: 1148, type: !7)
!1601 = distinct !DILexicalBlock(scope: !1580, file: !31, line: 1147, column: 3)
!1602 = !DILocation(line: 1148, column: 8, scope: !1601)
!1603 = !DILocalVariable(name: "dist", scope: !1601, file: !31, line: 1149, type: !21)
!1604 = !DILocation(line: 1149, column: 8, scope: !1601)
!1605 = !DILocalVariable(name: "max_trackable_dist", scope: !1601, file: !31, line: 1149, type: !21)
!1606 = !DILocation(line: 1149, column: 14, scope: !1601)
!1607 = !DILocation(line: 1152, column: 10, scope: !1608)
!1608 = distinct !DILexicalBlock(scope: !1601, file: !31, line: 1152, column: 4)
!1609 = !DILocation(line: 1152, column: 9, scope: !1608)
!1610 = !DILocation(line: 1152, column: 14, scope: !1611)
!1611 = distinct !DILexicalBlock(scope: !1608, file: !31, line: 1152, column: 4)
!1612 = !DILocation(line: 1152, column: 15, scope: !1611)
!1613 = !DILocation(line: 1152, column: 4, scope: !1608)
!1614 = !DILocation(line: 1153, column: 30, scope: !1615)
!1615 = distinct !DILexicalBlock(scope: !1611, file: !31, line: 1153, column: 9)
!1616 = !DILocation(line: 1153, column: 9, scope: !1615)
!1617 = !DILocation(line: 1153, column: 33, scope: !1615)
!1618 = !DILocation(line: 1153, column: 42, scope: !1615)
!1619 = !DILocation(line: 1153, column: 52, scope: !1615)
!1620 = !DILocation(line: 1153, column: 39, scope: !1615)
!1621 = !DILocation(line: 1154, column: 31, scope: !1622)
!1622 = distinct !DILexicalBlock(scope: !1615, file: !31, line: 1154, column: 10)
!1623 = !DILocation(line: 1154, column: 10, scope: !1622)
!1624 = !DILocation(line: 1154, column: 34, scope: !1622)
!1625 = !DILocation(line: 1154, column: 44, scope: !1622)
!1626 = !DILocation(line: 1154, column: 41, scope: !1622)
!1627 = !DILocation(line: 1155, column: 33, scope: !1628)
!1628 = distinct !DILexicalBlock(scope: !1622, file: !31, line: 1155, column: 11)
!1629 = !DILocation(line: 1155, column: 12, scope: !1628)
!1630 = !DILocation(line: 1155, column: 36, scope: !1628)
!1631 = !DILocation(line: 1155, column: 11, scope: !1628)
!1632 = !DILocation(line: 1157, column: 21, scope: !1633)
!1633 = distinct !DILexicalBlock(scope: !1628, file: !31, line: 1156, column: 7)
!1634 = !DILocation(line: 1157, column: 19, scope: !1633)
!1635 = !DILocation(line: 1158, column: 8, scope: !1633)
!1636 = !DILocation(line: 1153, column: 53, scope: !1615)
!1637 = !DILocation(line: 1152, column: 39, scope: !1611)
!1638 = !DILocation(line: 1152, column: 4, scope: !1611)
!1639 = distinct !{!1639, !1613, !1640, !948}
!1640 = !DILocation(line: 1159, column: 7, scope: !1608)
!1641 = !DILocation(line: 1162, column: 8, scope: !1642)
!1642 = distinct !DILexicalBlock(scope: !1601, file: !31, line: 1162, column: 8)
!1643 = !DILocation(line: 1162, column: 19, scope: !1642)
!1644 = !DILocation(line: 1164, column: 5, scope: !1645)
!1645 = distinct !DILexicalBlock(scope: !1642, file: !31, line: 1163, column: 4)
!1646 = !DILocation(line: 1165, column: 45, scope: !1645)
!1647 = !DILocation(line: 1165, column: 54, scope: !1645)
!1648 = !DILocation(line: 1165, column: 12, scope: !1645)
!1649 = !DILocation(line: 1165, column: 5, scope: !1645)
!1650 = !DILocation(line: 1168, column: 23, scope: !1601)
!1651 = !DILocation(line: 1169, column: 8, scope: !1652)
!1652 = distinct !DILexicalBlock(scope: !1601, file: !31, line: 1169, column: 8)
!1653 = !DILocation(line: 1169, column: 17, scope: !1652)
!1654 = !DILocation(line: 1169, column: 20, scope: !1652)
!1655 = !DILocation(line: 1170, column: 24, scope: !1652)
!1656 = !DILocation(line: 1170, column: 5, scope: !1652)
!1657 = !DILocation(line: 1173, column: 32, scope: !1658)
!1658 = distinct !DILexicalBlock(scope: !1601, file: !31, line: 1173, column: 4)
!1659 = !DILocation(line: 1173, column: 11, scope: !1658)
!1660 = !DILocation(line: 1173, column: 44, scope: !1658)
!1661 = !DILocation(line: 1173, column: 55, scope: !1658)
!1662 = !DILocation(line: 1173, column: 10, scope: !1658)
!1663 = !DILocation(line: 1173, column: 9, scope: !1658)
!1664 = !DILocation(line: 1173, column: 59, scope: !1665)
!1665 = distinct !DILexicalBlock(scope: !1658, file: !31, line: 1173, column: 4)
!1666 = !DILocation(line: 1173, column: 60, scope: !1665)
!1667 = !DILocation(line: 1173, column: 4, scope: !1658)
!1668 = !DILocalVariable(name: "dot", scope: !1669, file: !31, line: 1175, type: !21)
!1669 = distinct !DILexicalBlock(scope: !1665, file: !31, line: 1174, column: 4)
!1670 = !DILocation(line: 1175, column: 11, scope: !1669)
!1671 = !DILocalVariable(name: "vec_to_curobj", scope: !1669, file: !31, line: 1176, type: !54)
!1672 = !DILocation(line: 1176, column: 16, scope: !1669)
!1673 = !DILocalVariable(name: "objnum", scope: !1669, file: !31, line: 1177, type: !7)
!1674 = !DILocation(line: 1177, column: 11, scope: !1669)
!1675 = !DILocation(line: 1177, column: 41, scope: !1669)
!1676 = !DILocation(line: 1177, column: 20, scope: !1669)
!1677 = !DILocation(line: 1177, column: 53, scope: !1669)
!1678 = !DILocation(line: 1177, column: 70, scope: !1669)
!1679 = !DILocalVariable(name: "curobjp", scope: !1669, file: !31, line: 1178, type: !33)
!1680 = !DILocation(line: 1178, column: 14, scope: !1669)
!1681 = !DILocation(line: 1178, column: 33, scope: !1669)
!1682 = !DILocation(line: 1178, column: 25, scope: !1669)
!1683 = !DILocation(line: 1180, column: 9, scope: !1684)
!1684 = distinct !DILexicalBlock(scope: !1669, file: !31, line: 1180, column: 9)
!1685 = !DILocation(line: 1180, column: 27, scope: !1684)
!1686 = !DILocation(line: 1180, column: 19, scope: !1684)
!1687 = !DILocation(line: 1180, column: 39, scope: !1684)
!1688 = !DILocation(line: 1180, column: 16, scope: !1684)
!1689 = !DILocation(line: 1181, column: 6, scope: !1684)
!1690 = !DILocation(line: 1183, column: 9, scope: !1691)
!1691 = distinct !DILexicalBlock(scope: !1669, file: !31, line: 1183, column: 9)
!1692 = !DILocation(line: 1183, column: 18, scope: !1691)
!1693 = !DILocation(line: 1183, column: 23, scope: !1691)
!1694 = !DILocation(line: 1185, column: 10, scope: !1695)
!1695 = distinct !DILexicalBlock(scope: !1696, file: !31, line: 1185, column: 10)
!1696 = distinct !DILexicalBlock(scope: !1691, file: !31, line: 1184, column: 5)
!1697 = !DILocation(line: 1185, column: 19, scope: !1695)
!1698 = !DILocation(line: 1185, column: 33, scope: !1695)
!1699 = !DILocation(line: 1186, column: 7, scope: !1695)
!1700 = !DILocation(line: 1187, column: 21, scope: !1701)
!1701 = distinct !DILexicalBlock(scope: !1696, file: !31, line: 1187, column: 10)
!1702 = !DILocation(line: 1187, column: 30, scope: !1701)
!1703 = !DILocation(line: 1187, column: 10, scope: !1701)
!1704 = !DILocation(line: 1187, column: 34, scope: !1701)
!1705 = !DILocation(line: 1188, column: 11, scope: !1706)
!1706 = distinct !DILexicalBlock(scope: !1701, file: !31, line: 1188, column: 11)
!1707 = !DILocation(line: 1188, column: 20, scope: !1706)
!1708 = !DILocation(line: 1188, column: 37, scope: !1706)
!1709 = !DILocation(line: 1188, column: 49, scope: !1706)
!1710 = !DILocation(line: 1189, column: 8, scope: !1706)
!1711 = !DILocation(line: 1188, column: 52, scope: !1706)
!1712 = !DILocation(line: 1190, column: 5, scope: !1696)
!1713 = !DILocation(line: 1192, column: 33, scope: !1669)
!1714 = !DILocation(line: 1192, column: 42, scope: !1669)
!1715 = !DILocation(line: 1192, column: 47, scope: !1669)
!1716 = !DILocation(line: 1192, column: 5, scope: !1669)
!1717 = !DILocation(line: 1193, column: 12, scope: !1669)
!1718 = !DILocation(line: 1193, column: 10, scope: !1669)
!1719 = !DILocation(line: 1194, column: 9, scope: !1720)
!1720 = distinct !DILexicalBlock(scope: !1669, file: !31, line: 1194, column: 9)
!1721 = !DILocation(line: 1194, column: 16, scope: !1720)
!1722 = !DILocation(line: 1194, column: 14, scope: !1720)
!1723 = !DILocation(line: 1196, column: 12, scope: !1724)
!1724 = distinct !DILexicalBlock(scope: !1720, file: !31, line: 1195, column: 5)
!1725 = !DILocation(line: 1196, column: 10, scope: !1724)
!1726 = !DILocation(line: 1198, column: 10, scope: !1727)
!1727 = distinct !DILexicalBlock(scope: !1724, file: !31, line: 1198, column: 10)
!1728 = !DILocation(line: 1198, column: 16, scope: !1727)
!1729 = !DILocation(line: 1198, column: 14, scope: !1727)
!1730 = !DILocation(line: 1200, column: 11, scope: !1731)
!1731 = distinct !DILexicalBlock(scope: !1732, file: !31, line: 1200, column: 11)
!1732 = distinct !DILexicalBlock(scope: !1727, file: !31, line: 1199, column: 6)
!1733 = !DILocation(line: 1200, column: 17, scope: !1731)
!1734 = !DILocation(line: 1200, column: 15, scope: !1731)
!1735 = !DILocation(line: 1202, column: 40, scope: !1736)
!1736 = distinct !DILexicalBlock(scope: !1737, file: !31, line: 1202, column: 12)
!1737 = distinct !DILexicalBlock(scope: !1731, file: !31, line: 1201, column: 7)
!1738 = !DILocation(line: 1202, column: 58, scope: !1736)
!1739 = !DILocation(line: 1202, column: 50, scope: !1736)
!1740 = !DILocation(line: 1202, column: 12, scope: !1736)
!1741 = !DILocation(line: 1204, column: 19, scope: !1742)
!1742 = distinct !DILexicalBlock(scope: !1736, file: !31, line: 1203, column: 8)
!1743 = !DILocation(line: 1204, column: 17, scope: !1742)
!1744 = !DILocation(line: 1205, column: 23, scope: !1742)
!1745 = !DILocation(line: 1205, column: 21, scope: !1742)
!1746 = !DILocation(line: 1206, column: 8, scope: !1742)
!1747 = !DILocation(line: 1207, column: 7, scope: !1737)
!1748 = !DILocation(line: 1208, column: 6, scope: !1732)
!1749 = !DILocation(line: 1208, column: 17, scope: !1750)
!1750 = distinct !DILexicalBlock(scope: !1727, file: !31, line: 1208, column: 17)
!1751 = !DILocation(line: 1208, column: 38, scope: !1750)
!1752 = !DILocation(line: 1208, column: 36, scope: !1750)
!1753 = !DILocation(line: 1208, column: 60, scope: !1750)
!1754 = !DILocation(line: 1208, column: 28, scope: !1750)
!1755 = !DILocation(line: 1208, column: 21, scope: !1750)
!1756 = !DILocation(line: 1210, column: 7, scope: !1757)
!1757 = distinct !DILexicalBlock(scope: !1750, file: !31, line: 1209, column: 6)
!1758 = !DILocation(line: 1211, column: 13, scope: !1757)
!1759 = !DILocation(line: 1211, column: 11, scope: !1757)
!1760 = !DILocation(line: 1212, column: 11, scope: !1761)
!1761 = distinct !DILexicalBlock(scope: !1757, file: !31, line: 1212, column: 11)
!1762 = !DILocation(line: 1212, column: 17, scope: !1761)
!1763 = !DILocation(line: 1212, column: 15, scope: !1761)
!1764 = !DILocation(line: 1214, column: 12, scope: !1765)
!1765 = distinct !DILexicalBlock(scope: !1766, file: !31, line: 1214, column: 12)
!1766 = distinct !DILexicalBlock(scope: !1761, file: !31, line: 1213, column: 7)
!1767 = !DILocation(line: 1214, column: 18, scope: !1765)
!1768 = !DILocation(line: 1214, column: 16, scope: !1765)
!1769 = !DILocation(line: 1216, column: 41, scope: !1770)
!1770 = distinct !DILexicalBlock(scope: !1771, file: !31, line: 1216, column: 13)
!1771 = distinct !DILexicalBlock(scope: !1765, file: !31, line: 1215, column: 8)
!1772 = !DILocation(line: 1216, column: 59, scope: !1770)
!1773 = !DILocation(line: 1216, column: 51, scope: !1770)
!1774 = !DILocation(line: 1216, column: 13, scope: !1770)
!1775 = !DILocation(line: 1218, column: 20, scope: !1776)
!1776 = distinct !DILexicalBlock(scope: !1770, file: !31, line: 1217, column: 9)
!1777 = !DILocation(line: 1218, column: 18, scope: !1776)
!1778 = !DILocation(line: 1219, column: 24, scope: !1776)
!1779 = !DILocation(line: 1219, column: 22, scope: !1776)
!1780 = !DILocation(line: 1220, column: 9, scope: !1776)
!1781 = !DILocation(line: 1221, column: 8, scope: !1771)
!1782 = !DILocation(line: 1222, column: 7, scope: !1766)
!1783 = !DILocation(line: 1223, column: 6, scope: !1757)
!1784 = !DILocation(line: 1224, column: 5, scope: !1724)
!1785 = !DILocation(line: 1225, column: 4, scope: !1669)
!1786 = !DILocation(line: 1173, column: 66, scope: !1665)
!1787 = !DILocation(line: 1173, column: 4, scope: !1665)
!1788 = distinct !{!1788, !1667, !1789, !948}
!1789 = !DILocation(line: 1225, column: 4, scope: !1658)
!1790 = !DILocation(line: 1228, column: 9, scope: !1544)
!1791 = !DILocation(line: 1228, column: 2, scope: !1544)
!1792 = !DILocation(line: 1230, column: 1, scope: !1544)
!1793 = distinct !DISubprogram(name: "Laser_create_new", linkageName: "_Z16Laser_create_newP10vms_vectorS0_iiii", scope: !31, file: !31, line: 616, type: !1794, scopeLine: 617, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !320)
!1794 = !DISubroutineType(types: !1795)
!1795 = !{!7, !733, !733, !7, !7, !7, !7}
!1796 = !DILocalVariable(name: "direction", arg: 1, scope: !1793, file: !31, line: 616, type: !733)
!1797 = !DILocation(line: 616, column: 36, scope: !1793)
!1798 = !DILocalVariable(name: "position", arg: 2, scope: !1793, file: !31, line: 616, type: !733)
!1799 = !DILocation(line: 616, column: 60, scope: !1793)
!1800 = !DILocalVariable(name: "segnum", arg: 3, scope: !1793, file: !31, line: 616, type: !7)
!1801 = !DILocation(line: 616, column: 74, scope: !1793)
!1802 = !DILocalVariable(name: "parent", arg: 4, scope: !1793, file: !31, line: 616, type: !7)
!1803 = !DILocation(line: 616, column: 86, scope: !1793)
!1804 = !DILocalVariable(name: "weapon_type", arg: 5, scope: !1793, file: !31, line: 616, type: !7)
!1805 = !DILocation(line: 616, column: 98, scope: !1793)
!1806 = !DILocalVariable(name: "make_sound", arg: 6, scope: !1793, file: !31, line: 616, type: !7)
!1807 = !DILocation(line: 616, column: 115, scope: !1793)
!1808 = !DILocalVariable(name: "objnum", scope: !1793, file: !31, line: 618, type: !7)
!1809 = !DILocation(line: 618, column: 6, scope: !1793)
!1810 = !DILocalVariable(name: "obj", scope: !1793, file: !31, line: 619, type: !33)
!1811 = !DILocation(line: 619, column: 10, scope: !1793)
!1812 = !DILocalVariable(name: "parent_speed", scope: !1793, file: !31, line: 620, type: !21)
!1813 = !DILocation(line: 620, column: 6, scope: !1793)
!1814 = !DILocalVariable(name: "weapon_speed", scope: !1793, file: !31, line: 620, type: !21)
!1815 = !DILocation(line: 620, column: 20, scope: !1793)
!1816 = !DILocalVariable(name: "volume", scope: !1793, file: !31, line: 621, type: !21)
!1817 = !DILocation(line: 621, column: 6, scope: !1793)
!1818 = !DILocalVariable(name: "laser_length", scope: !1793, file: !31, line: 622, type: !21)
!1819 = !DILocation(line: 622, column: 6, scope: !1793)
!1820 = !DILocation(line: 624, column: 2, scope: !1793)
!1821 = !DILocation(line: 626, column: 8, scope: !1822)
!1822 = distinct !DILexicalBlock(scope: !1793, file: !31, line: 626, column: 7)
!1823 = !DILocation(line: 626, column: 19, scope: !1822)
!1824 = !DILocation(line: 626, column: 23, scope: !1822)
!1825 = !DILocation(line: 626, column: 27, scope: !1822)
!1826 = !DILocation(line: 626, column: 40, scope: !1822)
!1827 = !DILocation(line: 626, column: 38, scope: !1822)
!1828 = !DILocation(line: 627, column: 15, scope: !1822)
!1829 = !DILocation(line: 627, column: 3, scope: !1822)
!1830 = !DILocation(line: 630, column: 14, scope: !1831)
!1831 = distinct !DILexicalBlock(scope: !1793, file: !31, line: 630, column: 6)
!1832 = !DILocation(line: 630, column: 6, scope: !1831)
!1833 = !DILocation(line: 630, column: 22, scope: !1831)
!1834 = !DILocation(line: 630, column: 27, scope: !1831)
!1835 = !DILocation(line: 631, column: 19, scope: !1831)
!1836 = !DILocation(line: 631, column: 27, scope: !1831)
!1837 = !DILocation(line: 631, column: 3, scope: !1831)
!1838 = !DILocation(line: 633, column: 32, scope: !1793)
!1839 = !DILocation(line: 633, column: 44, scope: !1793)
!1840 = !DILocation(line: 633, column: 51, scope: !1793)
!1841 = !DILocation(line: 633, column: 11, scope: !1793)
!1842 = !DILocation(line: 633, column: 9, scope: !1793)
!1843 = !DILocation(line: 635, column: 7, scope: !1844)
!1844 = distinct !DILexicalBlock(scope: !1793, file: !31, line: 635, column: 7)
!1845 = !DILocation(line: 635, column: 14, scope: !1844)
!1846 = !DILocation(line: 637, column: 3, scope: !1847)
!1847 = distinct !DILexicalBlock(scope: !1844, file: !31, line: 636, column: 2)
!1848 = !DILocation(line: 638, column: 3, scope: !1847)
!1849 = !DILocation(line: 641, column: 17, scope: !1793)
!1850 = !DILocation(line: 641, column: 9, scope: !1793)
!1851 = !DILocation(line: 641, column: 6, scope: !1793)
!1852 = !DILocation(line: 645, column: 6, scope: !1853)
!1853 = distinct !DILexicalBlock(scope: !1793, file: !31, line: 645, column: 6)
!1854 = !DILocation(line: 645, column: 18, scope: !1853)
!1855 = !DILocation(line: 645, column: 30, scope: !1853)
!1856 = !DILocation(line: 645, column: 33, scope: !1853)
!1857 = !DILocation(line: 645, column: 53, scope: !1853)
!1858 = !DILocation(line: 648, column: 24, scope: !1859)
!1859 = distinct !DILexicalBlock(scope: !1853, file: !31, line: 646, column: 2)
!1860 = !DILocation(line: 648, column: 29, scope: !1859)
!1861 = !DILocation(line: 648, column: 37, scope: !1859)
!1862 = !DILocation(line: 648, column: 57, scope: !1859)
!1863 = !DILocation(line: 648, column: 49, scope: !1859)
!1864 = !DILocation(line: 648, column: 65, scope: !1859)
!1865 = !DILocation(line: 648, column: 72, scope: !1859)
!1866 = !DILocation(line: 648, column: 3, scope: !1859)
!1867 = !DILocation(line: 650, column: 18, scope: !1868)
!1868 = distinct !DILexicalBlock(scope: !1859, file: !31, line: 650, column: 7)
!1869 = !DILocation(line: 650, column: 10, scope: !1868)
!1870 = !DILocation(line: 650, column: 29, scope: !1868)
!1871 = !DILocation(line: 650, column: 26, scope: !1868)
!1872 = !DILocation(line: 650, column: 38, scope: !1868)
!1873 = !DILocation(line: 650, column: 50, scope: !1868)
!1874 = !DILocation(line: 650, column: 42, scope: !1868)
!1875 = !DILocation(line: 650, column: 58, scope: !1868)
!1876 = !DILocation(line: 650, column: 63, scope: !1868)
!1877 = !DILocation(line: 653, column: 20, scope: !1878)
!1878 = distinct !DILexicalBlock(scope: !1879, file: !31, line: 653, column: 8)
!1879 = distinct !DILexicalBlock(scope: !1868, file: !31, line: 651, column: 3)
!1880 = !DILocation(line: 653, column: 25, scope: !1878)
!1881 = !DILocation(line: 653, column: 8, scope: !1878)
!1882 = !DILocation(line: 653, column: 29, scope: !1878)
!1883 = !DILocation(line: 653, column: 41, scope: !1878)
!1884 = !DILocation(line: 654, column: 33, scope: !1878)
!1885 = !DILocation(line: 654, column: 38, scope: !1878)
!1886 = !DILocation(line: 654, column: 47, scope: !1878)
!1887 = !DILocation(line: 654, column: 52, scope: !1878)
!1888 = !DILocation(line: 654, column: 69, scope: !1878)
!1889 = !DILocation(line: 654, column: 74, scope: !1878)
!1890 = !DILocation(line: 654, column: 57, scope: !1878)
!1891 = !DILocation(line: 654, column: 78, scope: !1878)
!1892 = !DILocation(line: 654, column: 102, scope: !1878)
!1893 = !DILocation(line: 654, column: 107, scope: !1878)
!1894 = !DILocation(line: 654, column: 90, scope: !1878)
!1895 = !DILocation(line: 654, column: 111, scope: !1878)
!1896 = !DILocation(line: 654, column: 5, scope: !1878)
!1897 = !DILocation(line: 655, column: 3, scope: !1879)
!1898 = !DILocation(line: 657, column: 27, scope: !1859)
!1899 = !DILocation(line: 657, column: 19, scope: !1859)
!1900 = !DILocation(line: 657, column: 36, scope: !1859)
!1901 = !DILocation(line: 657, column: 46, scope: !1859)
!1902 = !DILocation(line: 657, column: 3, scope: !1859)
!1903 = !DILocation(line: 659, column: 10, scope: !1859)
!1904 = !DILocation(line: 659, column: 3, scope: !1859)
!1905 = !DILocation(line: 662, column: 14, scope: !1906)
!1906 = distinct !DILexicalBlock(scope: !1793, file: !31, line: 662, column: 6)
!1907 = !DILocation(line: 662, column: 6, scope: !1906)
!1908 = !DILocation(line: 662, column: 22, scope: !1906)
!1909 = !DILocation(line: 662, column: 27, scope: !1906)
!1910 = !DILocation(line: 664, column: 7, scope: !1911)
!1911 = distinct !DILexicalBlock(scope: !1912, file: !31, line: 664, column: 7)
!1912 = distinct !DILexicalBlock(scope: !1906, file: !31, line: 663, column: 2)
!1913 = !DILocation(line: 664, column: 19, scope: !1911)
!1914 = !DILocation(line: 666, column: 8, scope: !1915)
!1915 = distinct !DILexicalBlock(scope: !1916, file: !31, line: 666, column: 8)
!1916 = distinct !DILexicalBlock(scope: !1911, file: !31, line: 665, column: 3)
!1917 = !DILocation(line: 666, column: 22, scope: !1915)
!1918 = !DILocation(line: 667, column: 5, scope: !1915)
!1919 = !DILocation(line: 667, column: 10, scope: !1915)
!1920 = !DILocation(line: 667, column: 27, scope: !1915)
!1921 = !DILocation(line: 667, column: 38, scope: !1915)
!1922 = !DILocation(line: 668, column: 13, scope: !1923)
!1923 = distinct !DILexicalBlock(scope: !1915, file: !31, line: 668, column: 13)
!1924 = !DILocation(line: 668, column: 27, scope: !1923)
!1925 = !DILocation(line: 669, column: 47, scope: !1923)
!1926 = !DILocation(line: 669, column: 60, scope: !1923)
!1927 = !DILocation(line: 669, column: 45, scope: !1923)
!1928 = !DILocation(line: 669, column: 5, scope: !1923)
!1929 = !DILocation(line: 669, column: 10, scope: !1923)
!1930 = !DILocation(line: 669, column: 27, scope: !1923)
!1931 = !DILocation(line: 669, column: 38, scope: !1923)
!1932 = !DILocation(line: 671, column: 5, scope: !1923)
!1933 = !DILocation(line: 671, column: 10, scope: !1923)
!1934 = !DILocation(line: 671, column: 27, scope: !1923)
!1935 = !DILocation(line: 671, column: 38, scope: !1923)
!1936 = !DILocation(line: 673, column: 3, scope: !1916)
!1937 = !DILocation(line: 673, column: 15, scope: !1938)
!1938 = distinct !DILexicalBlock(scope: !1911, file: !31, line: 673, column: 14)
!1939 = !DILocation(line: 673, column: 27, scope: !1938)
!1940 = !DILocation(line: 673, column: 39, scope: !1938)
!1941 = !DILocation(line: 673, column: 42, scope: !1938)
!1942 = !DILocation(line: 673, column: 54, scope: !1938)
!1943 = !DILocation(line: 673, column: 80, scope: !1938)
!1944 = !DILocation(line: 673, column: 100, scope: !1938)
!1945 = !DILocation(line: 673, column: 92, scope: !1938)
!1946 = !DILocation(line: 673, column: 108, scope: !1938)
!1947 = !DILocation(line: 673, column: 84, scope: !1938)
!1948 = !DILocation(line: 673, column: 112, scope: !1938)
!1949 = !DILocation(line: 673, column: 118, scope: !1938)
!1950 = !DILocation(line: 673, column: 83, scope: !1938)
!1951 = !DILocation(line: 674, column: 4, scope: !1938)
!1952 = !DILocation(line: 674, column: 9, scope: !1938)
!1953 = !DILocation(line: 674, column: 26, scope: !1938)
!1954 = !DILocation(line: 674, column: 37, scope: !1938)
!1955 = !DILocation(line: 675, column: 12, scope: !1956)
!1956 = distinct !DILexicalBlock(scope: !1938, file: !31, line: 675, column: 12)
!1957 = !DILocation(line: 675, column: 24, scope: !1956)
!1958 = !DILocation(line: 677, column: 8, scope: !1959)
!1959 = distinct !DILexicalBlock(scope: !1960, file: !31, line: 677, column: 8)
!1960 = distinct !DILexicalBlock(scope: !1956, file: !31, line: 676, column: 3)
!1961 = !DILocation(line: 677, column: 24, scope: !1959)
!1962 = !DILocation(line: 677, column: 16, scope: !1959)
!1963 = !DILocation(line: 677, column: 36, scope: !1959)
!1964 = !DILocation(line: 677, column: 14, scope: !1959)
!1965 = !DILocation(line: 679, column: 33, scope: !1966)
!1966 = distinct !DILexicalBlock(scope: !1959, file: !31, line: 678, column: 4)
!1967 = !DILocation(line: 679, column: 20, scope: !1966)
!1968 = !DILocation(line: 679, column: 5, scope: !1966)
!1969 = !DILocation(line: 679, column: 31, scope: !1966)
!1970 = !DILocation(line: 680, column: 38, scope: !1966)
!1971 = !DILocation(line: 680, column: 43, scope: !1966)
!1972 = !DILocation(line: 680, column: 24, scope: !1966)
!1973 = !DILocation(line: 680, column: 5, scope: !1966)
!1974 = !DILocation(line: 680, column: 36, scope: !1966)
!1975 = !DILocation(line: 681, column: 9, scope: !1976)
!1976 = distinct !DILexicalBlock(scope: !1966, file: !31, line: 681, column: 9)
!1977 = !DILocation(line: 681, column: 22, scope: !1976)
!1978 = !DILocation(line: 682, column: 6, scope: !1976)
!1979 = !DILocation(line: 683, column: 4, scope: !1966)
!1980 = !DILocation(line: 684, column: 3, scope: !1960)
!1981 = !DILocation(line: 685, column: 2, scope: !1912)
!1982 = !DILocation(line: 689, column: 7, scope: !1983)
!1983 = distinct !DILexicalBlock(scope: !1793, file: !31, line: 689, column: 6)
!1984 = !DILocation(line: 689, column: 19, scope: !1983)
!1985 = !DILocation(line: 689, column: 46, scope: !1983)
!1986 = !DILocation(line: 689, column: 50, scope: !1983)
!1987 = !DILocation(line: 689, column: 62, scope: !1983)
!1988 = !DILocation(line: 689, column: 87, scope: !1983)
!1989 = !DILocation(line: 689, column: 91, scope: !1983)
!1990 = !DILocation(line: 689, column: 103, scope: !1983)
!1991 = !DILocation(line: 689, column: 129, scope: !1983)
!1992 = !DILocation(line: 689, column: 133, scope: !1983)
!1993 = !DILocation(line: 689, column: 145, scope: !1983)
!1994 = !DILocation(line: 689, column: 176, scope: !1983)
!1995 = !DILocation(line: 689, column: 180, scope: !1983)
!1996 = !DILocation(line: 689, column: 192, scope: !1983)
!1997 = !DILocation(line: 690, column: 3, scope: !1983)
!1998 = !DILocation(line: 690, column: 8, scope: !1983)
!1999 = !DILocation(line: 690, column: 24, scope: !1983)
!2000 = !DILocation(line: 690, column: 30, scope: !1983)
!2001 = !DILocation(line: 692, column: 18, scope: !2002)
!2002 = distinct !DILexicalBlock(scope: !1793, file: !31, line: 692, column: 6)
!2003 = !DILocation(line: 692, column: 6, scope: !2002)
!2004 = !DILocation(line: 692, column: 31, scope: !2002)
!2005 = !DILocation(line: 692, column: 43, scope: !2002)
!2006 = !DILocation(line: 693, column: 33, scope: !2002)
!2007 = !DILocation(line: 693, column: 38, scope: !2002)
!2008 = !DILocation(line: 693, column: 54, scope: !2002)
!2009 = !DILocation(line: 693, column: 18, scope: !2002)
!2010 = !DILocation(line: 693, column: 65, scope: !2002)
!2011 = !DILocation(line: 693, column: 69, scope: !2002)
!2012 = !DILocation(line: 693, column: 16, scope: !2002)
!2013 = !DILocation(line: 693, column: 3, scope: !2002)
!2014 = !DILocation(line: 695, column: 6, scope: !2015)
!2015 = distinct !DILexicalBlock(scope: !1793, file: !31, line: 695, column: 6)
!2016 = !DILocation(line: 695, column: 18, scope: !2015)
!2017 = !DILocation(line: 696, column: 3, scope: !2015)
!2018 = !DILocation(line: 696, column: 8, scope: !2015)
!2019 = !DILocation(line: 696, column: 24, scope: !2015)
!2020 = !DILocation(line: 696, column: 30, scope: !2015)
!2021 = !DILocation(line: 698, column: 29, scope: !1793)
!2022 = !DILocation(line: 698, column: 34, scope: !1793)
!2023 = !DILocation(line: 698, column: 17, scope: !1793)
!2024 = !DILocation(line: 698, column: 38, scope: !1793)
!2025 = !DILocation(line: 698, column: 47, scope: !1793)
!2026 = !DILocation(line: 698, column: 2, scope: !1793)
!2027 = !DILocation(line: 698, column: 7, scope: !1793)
!2028 = !DILocation(line: 698, column: 15, scope: !1793)
!2029 = !DILocation(line: 702, column: 36, scope: !1793)
!2030 = !DILocation(line: 702, column: 41, scope: !1793)
!2031 = !DILocation(line: 702, column: 24, scope: !1793)
!2032 = !DILocation(line: 702, column: 45, scope: !1793)
!2033 = !DILocation(line: 702, column: 2, scope: !1793)
!2034 = !DILocation(line: 702, column: 7, scope: !1793)
!2035 = !DILocation(line: 702, column: 22, scope: !1793)
!2036 = !DILocation(line: 703, column: 47, scope: !1793)
!2037 = !DILocation(line: 703, column: 39, scope: !1793)
!2038 = !DILocation(line: 703, column: 55, scope: !1793)
!2039 = !DILocation(line: 703, column: 2, scope: !1793)
!2040 = !DILocation(line: 703, column: 7, scope: !1793)
!2041 = !DILocation(line: 703, column: 24, scope: !1793)
!2042 = !DILocation(line: 703, column: 37, scope: !1793)
!2043 = !DILocation(line: 704, column: 51, scope: !1793)
!2044 = !DILocation(line: 704, column: 43, scope: !1793)
!2045 = !DILocation(line: 704, column: 59, scope: !1793)
!2046 = !DILocation(line: 704, column: 2, scope: !1793)
!2047 = !DILocation(line: 704, column: 7, scope: !1793)
!2048 = !DILocation(line: 704, column: 24, scope: !1793)
!2049 = !DILocation(line: 704, column: 41, scope: !1793)
!2050 = !DILocation(line: 705, column: 39, scope: !1793)
!2051 = !DILocation(line: 705, column: 2, scope: !1793)
!2052 = !DILocation(line: 705, column: 7, scope: !1793)
!2053 = !DILocation(line: 705, column: 24, scope: !1793)
!2054 = !DILocation(line: 705, column: 37, scope: !1793)
!2055 = !DILocation(line: 709, column: 14, scope: !2056)
!2056 = distinct !DILexicalBlock(scope: !1793, file: !31, line: 709, column: 6)
!2057 = !DILocation(line: 709, column: 6, scope: !2056)
!2058 = !DILocation(line: 709, column: 22, scope: !2056)
!2059 = !DILocation(line: 709, column: 27, scope: !2056)
!2060 = !DILocalVariable(name: "highest_parent", scope: !2061, file: !31, line: 711, type: !7)
!2061 = distinct !DILexicalBlock(scope: !2056, file: !31, line: 710, column: 2)
!2062 = !DILocation(line: 711, column: 7, scope: !2061)
!2063 = !DILocation(line: 711, column: 24, scope: !2061)
!2064 = !DILocalVariable(name: "count", scope: !2061, file: !31, line: 712, type: !7)
!2065 = !DILocation(line: 712, column: 7, scope: !2061)
!2066 = !DILocation(line: 714, column: 9, scope: !2061)
!2067 = !DILocation(line: 715, column: 3, scope: !2061)
!2068 = !DILocation(line: 715, column: 16, scope: !2061)
!2069 = !DILocation(line: 715, column: 19, scope: !2061)
!2070 = !DILocation(line: 715, column: 25, scope: !2061)
!2071 = !DILocation(line: 715, column: 37, scope: !2061)
!2072 = !DILocation(line: 715, column: 29, scope: !2061)
!2073 = !DILocation(line: 715, column: 53, scope: !2061)
!2074 = !DILocation(line: 715, column: 58, scope: !2061)
!2075 = !DILocation(line: 0, scope: !2061)
!2076 = !DILocalVariable(name: "next_parent", scope: !2077, file: !31, line: 717, type: !7)
!2077 = distinct !DILexicalBlock(scope: !2061, file: !31, line: 716, column: 3)
!2078 = !DILocation(line: 717, column: 8, scope: !2077)
!2079 = !DILocation(line: 719, column: 26, scope: !2077)
!2080 = !DILocation(line: 719, column: 18, scope: !2077)
!2081 = !DILocation(line: 719, column: 42, scope: !2077)
!2082 = !DILocation(line: 719, column: 59, scope: !2077)
!2083 = !DILocation(line: 719, column: 16, scope: !2077)
!2084 = !DILocation(line: 720, column: 16, scope: !2085)
!2085 = distinct !DILexicalBlock(scope: !2077, file: !31, line: 720, column: 8)
!2086 = !DILocation(line: 720, column: 8, scope: !2085)
!2087 = !DILocation(line: 720, column: 29, scope: !2085)
!2088 = !DILocation(line: 720, column: 50, scope: !2085)
!2089 = !DILocation(line: 720, column: 42, scope: !2085)
!2090 = !DILocation(line: 720, column: 66, scope: !2085)
!2091 = !DILocation(line: 720, column: 83, scope: !2085)
!2092 = !DILocation(line: 720, column: 39, scope: !2085)
!2093 = !DILocation(line: 721, column: 5, scope: !2085)
!2094 = !DILocation(line: 723, column: 8, scope: !2095)
!2095 = distinct !DILexicalBlock(scope: !2077, file: !31, line: 723, column: 8)
!2096 = !DILocation(line: 723, column: 23, scope: !2095)
!2097 = !DILocation(line: 723, column: 20, scope: !2095)
!2098 = !DILocation(line: 725, column: 5, scope: !2099)
!2099 = distinct !DILexicalBlock(scope: !2095, file: !31, line: 724, column: 4)
!2100 = !DILocation(line: 726, column: 5, scope: !2099)
!2101 = !DILocation(line: 729, column: 21, scope: !2077)
!2102 = !DILocation(line: 729, column: 19, scope: !2077)
!2103 = !DILocation(line: 731, column: 41, scope: !2077)
!2104 = !DILocation(line: 731, column: 4, scope: !2077)
!2105 = !DILocation(line: 731, column: 9, scope: !2077)
!2106 = !DILocation(line: 731, column: 26, scope: !2077)
!2107 = !DILocation(line: 731, column: 39, scope: !2077)
!2108 = !DILocation(line: 732, column: 49, scope: !2077)
!2109 = !DILocation(line: 732, column: 41, scope: !2077)
!2110 = !DILocation(line: 732, column: 65, scope: !2077)
!2111 = !DILocation(line: 732, column: 4, scope: !2077)
!2112 = !DILocation(line: 732, column: 9, scope: !2077)
!2113 = !DILocation(line: 732, column: 26, scope: !2077)
!2114 = !DILocation(line: 732, column: 39, scope: !2077)
!2115 = !DILocation(line: 733, column: 53, scope: !2077)
!2116 = !DILocation(line: 733, column: 45, scope: !2077)
!2117 = !DILocation(line: 733, column: 69, scope: !2077)
!2118 = !DILocation(line: 733, column: 4, scope: !2077)
!2119 = !DILocation(line: 733, column: 9, scope: !2077)
!2120 = !DILocation(line: 733, column: 26, scope: !2077)
!2121 = !DILocation(line: 733, column: 43, scope: !2077)
!2122 = distinct !{!2122, !2067, !2123, !948}
!2123 = !DILocation(line: 734, column: 3, scope: !2061)
!2124 = !DILocation(line: 735, column: 2, scope: !2061)
!2125 = !DILocation(line: 739, column: 7, scope: !2126)
!2126 = distinct !DILexicalBlock(scope: !1793, file: !31, line: 739, column: 6)
!2127 = !DILocation(line: 739, column: 12, scope: !2126)
!2128 = !DILocation(line: 739, column: 24, scope: !2126)
!2129 = !DILocation(line: 739, column: 39, scope: !2126)
!2130 = !DILocation(line: 739, column: 55, scope: !2126)
!2131 = !DILocation(line: 739, column: 60, scope: !2126)
!2132 = !DILocation(line: 739, column: 43, scope: !2126)
!2133 = !DILocation(line: 739, column: 64, scope: !2126)
!2134 = !DILocation(line: 739, column: 42, scope: !2126)
!2135 = !DILocation(line: 740, column: 24, scope: !2126)
!2136 = !DILocation(line: 740, column: 29, scope: !2126)
!2137 = !DILocation(line: 740, column: 36, scope: !2126)
!2138 = !DILocation(line: 740, column: 56, scope: !2126)
!2139 = !DILocation(line: 740, column: 48, scope: !2126)
!2140 = !DILocation(line: 740, column: 64, scope: !2126)
!2141 = !DILocation(line: 740, column: 71, scope: !2126)
!2142 = !DILocation(line: 740, column: 3, scope: !2126)
!2143 = !DILocation(line: 742, column: 17, scope: !2144)
!2144 = distinct !DILexicalBlock(scope: !1793, file: !31, line: 742, column: 6)
!2145 = !DILocation(line: 742, column: 9, scope: !2144)
!2146 = !DILocation(line: 742, column: 28, scope: !2144)
!2147 = !DILocation(line: 742, column: 25, scope: !2144)
!2148 = !DILocation(line: 742, column: 37, scope: !2144)
!2149 = !DILocation(line: 742, column: 49, scope: !2144)
!2150 = !DILocation(line: 742, column: 41, scope: !2144)
!2151 = !DILocation(line: 742, column: 57, scope: !2144)
!2152 = !DILocation(line: 742, column: 62, scope: !2144)
!2153 = !DILocation(line: 745, column: 19, scope: !2154)
!2154 = distinct !DILexicalBlock(scope: !2155, file: !31, line: 745, column: 7)
!2155 = distinct !DILexicalBlock(scope: !2144, file: !31, line: 743, column: 2)
!2156 = !DILocation(line: 745, column: 24, scope: !2154)
!2157 = !DILocation(line: 745, column: 7, scope: !2154)
!2158 = !DILocation(line: 745, column: 28, scope: !2154)
!2159 = !DILocation(line: 745, column: 40, scope: !2154)
!2160 = !DILocation(line: 746, column: 32, scope: !2154)
!2161 = !DILocation(line: 746, column: 37, scope: !2154)
!2162 = !DILocation(line: 746, column: 46, scope: !2154)
!2163 = !DILocation(line: 746, column: 51, scope: !2154)
!2164 = !DILocation(line: 746, column: 68, scope: !2154)
!2165 = !DILocation(line: 746, column: 73, scope: !2154)
!2166 = !DILocation(line: 746, column: 56, scope: !2154)
!2167 = !DILocation(line: 746, column: 77, scope: !2154)
!2168 = !DILocation(line: 746, column: 101, scope: !2154)
!2169 = !DILocation(line: 746, column: 106, scope: !2154)
!2170 = !DILocation(line: 746, column: 89, scope: !2154)
!2171 = !DILocation(line: 746, column: 110, scope: !2154)
!2172 = !DILocation(line: 746, column: 4, scope: !2154)
!2173 = !DILocation(line: 747, column: 2, scope: !2155)
!2174 = !DILocation(line: 749, column: 9, scope: !1793)
!2175 = !DILocation(line: 750, column: 18, scope: !2176)
!2176 = distinct !DILexicalBlock(scope: !1793, file: !31, line: 750, column: 6)
!2177 = !DILocation(line: 750, column: 23, scope: !2176)
!2178 = !DILocation(line: 750, column: 6, scope: !2176)
!2179 = !DILocation(line: 750, column: 27, scope: !2176)
!2180 = !DILocation(line: 750, column: 39, scope: !2176)
!2181 = !DILocation(line: 752, column: 7, scope: !2182)
!2182 = distinct !DILexicalBlock(scope: !2183, file: !31, line: 752, column: 7)
!2183 = distinct !DILexicalBlock(scope: !2176, file: !31, line: 751, column: 2)
!2184 = !DILocation(line: 754, column: 9, scope: !2185)
!2185 = distinct !DILexicalBlock(scope: !2186, file: !31, line: 754, column: 9)
!2186 = distinct !DILexicalBlock(scope: !2182, file: !31, line: 753, column: 3)
!2187 = !DILocation(line: 754, column: 20, scope: !2185)
!2188 = !DILocation(line: 754, column: 26, scope: !2185)
!2189 = !DILocation(line: 754, column: 16, scope: !2185)
!2190 = !DILocation(line: 756, column: 9, scope: !2191)
!2191 = distinct !DILexicalBlock(scope: !2192, file: !31, line: 756, column: 9)
!2192 = distinct !DILexicalBlock(scope: !2185, file: !31, line: 755, column: 4)
!2193 = !DILocation(line: 756, column: 21, scope: !2191)
!2194 = !DILocation(line: 757, column: 13, scope: !2191)
!2195 = !DILocation(line: 757, column: 6, scope: !2191)
!2196 = !DILocation(line: 758, column: 35, scope: !2192)
!2197 = !DILocation(line: 758, column: 40, scope: !2192)
!2198 = !DILocation(line: 758, column: 23, scope: !2192)
!2199 = !DILocation(line: 758, column: 44, scope: !2192)
!2200 = !DILocation(line: 758, column: 57, scope: !2192)
!2201 = !DILocation(line: 758, column: 5, scope: !2192)
!2202 = !DILocation(line: 759, column: 4, scope: !2192)
!2203 = !DILocation(line: 762, column: 41, scope: !2204)
!2204 = distinct !DILexicalBlock(scope: !2185, file: !31, line: 761, column: 4)
!2205 = !DILocation(line: 762, column: 46, scope: !2204)
!2206 = !DILocation(line: 762, column: 29, scope: !2204)
!2207 = !DILocation(line: 762, column: 50, scope: !2204)
!2208 = !DILocation(line: 762, column: 63, scope: !2204)
!2209 = !DILocation(line: 762, column: 68, scope: !2204)
!2210 = !DILocation(line: 762, column: 80, scope: !2204)
!2211 = !DILocation(line: 762, column: 85, scope: !2204)
!2212 = !DILocation(line: 762, column: 93, scope: !2204)
!2213 = !DILocation(line: 762, column: 5, scope: !2204)
!2214 = !DILocation(line: 764, column: 3, scope: !2186)
!2215 = !DILocation(line: 765, column: 2, scope: !2183)
!2216 = !DILocation(line: 771, column: 15, scope: !2217)
!2217 = distinct !DILexicalBlock(scope: !1793, file: !31, line: 771, column: 6)
!2218 = !DILocation(line: 771, column: 7, scope: !2217)
!2219 = !DILocation(line: 771, column: 23, scope: !2217)
!2220 = !DILocation(line: 771, column: 28, scope: !2217)
!2221 = !DILocation(line: 771, column: 43, scope: !2217)
!2222 = !DILocation(line: 771, column: 59, scope: !2217)
!2223 = !DILocation(line: 771, column: 47, scope: !2217)
!2224 = !DILocation(line: 771, column: 72, scope: !2217)
!2225 = !DILocation(line: 771, column: 84, scope: !2217)
!2226 = !DILocation(line: 771, column: 107, scope: !2217)
!2227 = !DILocation(line: 771, column: 111, scope: !2217)
!2228 = !DILocation(line: 771, column: 123, scope: !2217)
!2229 = !DILocalVariable(name: "end_pos", scope: !2230, file: !31, line: 773, type: !54)
!2230 = distinct !DILexicalBlock(scope: !2217, file: !31, line: 772, column: 2)
!2231 = !DILocation(line: 773, column: 14, scope: !2230)
!2232 = !DILocalVariable(name: "end_segnum", scope: !2230, file: !31, line: 774, type: !7)
!2233 = !DILocation(line: 774, column: 9, scope: !2230)
!2234 = !DILocation(line: 776, column: 33, scope: !2230)
!2235 = !DILocation(line: 776, column: 38, scope: !2230)
!2236 = !DILocation(line: 776, column: 43, scope: !2230)
!2237 = !DILocation(line: 776, column: 54, scope: !2230)
!2238 = !DILocation(line: 776, column: 68, scope: !2230)
!2239 = !DILocation(line: 776, column: 80, scope: !2230)
!2240 = !DILocation(line: 776, column: 66, scope: !2230)
!2241 = !DILocation(line: 776, column: 4, scope: !2230)
!2242 = !DILocation(line: 777, column: 41, scope: !2230)
!2243 = !DILocation(line: 777, column: 46, scope: !2230)
!2244 = !DILocation(line: 777, column: 16, scope: !2230)
!2245 = !DILocation(line: 777, column: 14, scope: !2230)
!2246 = !DILocation(line: 778, column: 7, scope: !2247)
!2247 = distinct !DILexicalBlock(scope: !2230, file: !31, line: 778, column: 7)
!2248 = !DILocation(line: 778, column: 21, scope: !2247)
!2249 = !DILocation(line: 778, column: 26, scope: !2247)
!2250 = !DILocation(line: 778, column: 18, scope: !2247)
!2251 = !DILocation(line: 781, column: 8, scope: !2252)
!2252 = distinct !DILexicalBlock(scope: !2253, file: !31, line: 781, column: 8)
!2253 = distinct !DILexicalBlock(scope: !2247, file: !31, line: 779, column: 3)
!2254 = !DILocation(line: 781, column: 19, scope: !2252)
!2255 = !DILocation(line: 783, column: 5, scope: !2256)
!2256 = distinct !DILexicalBlock(scope: !2252, file: !31, line: 782, column: 4)
!2257 = !DILocation(line: 783, column: 10, scope: !2256)
!2258 = !DILocation(line: 783, column: 14, scope: !2256)
!2259 = !DILocation(line: 784, column: 16, scope: !2256)
!2260 = !DILocation(line: 784, column: 19, scope: !2256)
!2261 = !DILocation(line: 784, column: 29, scope: !2256)
!2262 = !DILocation(line: 784, column: 5, scope: !2256)
!2263 = !DILocation(line: 785, column: 4, scope: !2256)
!2264 = !DILocation(line: 786, column: 5, scope: !2252)
!2265 = !DILocation(line: 787, column: 3, scope: !2253)
!2266 = !DILocation(line: 788, column: 4, scope: !2247)
!2267 = !DILocation(line: 788, column: 9, scope: !2247)
!2268 = !DILocation(line: 788, column: 13, scope: !2247)
!2269 = !DILocation(line: 789, column: 2, scope: !2230)
!2270 = !DILocation(line: 793, column: 7, scope: !2271)
!2271 = distinct !DILexicalBlock(scope: !1793, file: !31, line: 793, column: 6)
!2272 = !DILocation(line: 793, column: 19, scope: !2271)
!2273 = !DILocation(line: 793, column: 36, scope: !2271)
!2274 = !DILocation(line: 793, column: 40, scope: !2271)
!2275 = !DILocation(line: 793, column: 52, scope: !2271)
!2276 = !DILocation(line: 795, column: 44, scope: !2277)
!2277 = distinct !DILexicalBlock(scope: !2271, file: !31, line: 794, column: 2)
!2278 = !DILocation(line: 795, column: 36, scope: !2277)
!2279 = !DILocation(line: 795, column: 52, scope: !2277)
!2280 = !DILocation(line: 795, column: 68, scope: !2277)
!2281 = !DILocation(line: 795, column: 18, scope: !2277)
!2282 = !DILocation(line: 795, column: 16, scope: !2277)
!2283 = !DILocation(line: 796, column: 7, scope: !2284)
!2284 = distinct !DILexicalBlock(scope: !2277, file: !31, line: 796, column: 7)
!2285 = !DILocation(line: 796, column: 91, scope: !2284)
!2286 = !DILocation(line: 797, column: 20, scope: !2284)
!2287 = !DILocation(line: 797, column: 19, scope: !2284)
!2288 = !DILocation(line: 797, column: 17, scope: !2284)
!2289 = !DILocation(line: 797, column: 4, scope: !2284)
!2290 = !DILocation(line: 798, column: 2, scope: !2277)
!2291 = !DILocation(line: 799, column: 16, scope: !2271)
!2292 = !DILocation(line: 801, column: 29, scope: !1793)
!2293 = !DILocation(line: 801, column: 34, scope: !1793)
!2294 = !DILocation(line: 801, column: 17, scope: !1793)
!2295 = !DILocation(line: 801, column: 38, scope: !1793)
!2296 = !DILocation(line: 801, column: 44, scope: !1793)
!2297 = !DILocation(line: 801, column: 15, scope: !1793)
!2298 = !DILocation(line: 802, column: 18, scope: !2299)
!2299 = distinct !DILexicalBlock(scope: !1793, file: !31, line: 802, column: 6)
!2300 = !DILocation(line: 802, column: 23, scope: !2299)
!2301 = !DILocation(line: 802, column: 6, scope: !2299)
!2302 = !DILocation(line: 802, column: 27, scope: !2299)
!2303 = !DILocation(line: 802, column: 36, scope: !2299)
!2304 = !DILocalVariable(name: "randval", scope: !2305, file: !31, line: 804, type: !21)
!2305 = distinct !DILexicalBlock(scope: !2299, file: !31, line: 803, column: 2)
!2306 = !DILocation(line: 804, column: 7, scope: !2305)
!2307 = !DILocation(line: 807, column: 22, scope: !2305)
!2308 = !DILocation(line: 807, column: 45, scope: !2305)
!2309 = !DILocation(line: 807, column: 50, scope: !2305)
!2310 = !DILocation(line: 807, column: 33, scope: !2305)
!2311 = !DILocation(line: 807, column: 54, scope: !2305)
!2312 = !DILocation(line: 807, column: 31, scope: !2305)
!2313 = !DILocation(line: 807, column: 64, scope: !2305)
!2314 = !DILocation(line: 807, column: 18, scope: !2305)
!2315 = !DILocation(line: 807, column: 11, scope: !2305)
!2316 = !DILocation(line: 808, column: 25, scope: !2305)
!2317 = !DILocation(line: 808, column: 39, scope: !2305)
!2318 = !DILocation(line: 808, column: 18, scope: !2305)
!2319 = !DILocation(line: 808, column: 16, scope: !2305)
!2320 = !DILocation(line: 809, column: 2, scope: !2305)
!2321 = !DILocation(line: 812, column: 7, scope: !2322)
!2322 = distinct !DILexicalBlock(scope: !1793, file: !31, line: 812, column: 6)
!2323 = !DILocation(line: 812, column: 12, scope: !2322)
!2324 = !DILocation(line: 812, column: 15, scope: !2322)
!2325 = !DILocation(line: 812, column: 42, scope: !2322)
!2326 = !DILocation(line: 812, column: 46, scope: !2322)
!2327 = !DILocation(line: 812, column: 51, scope: !2322)
!2328 = !DILocation(line: 812, column: 54, scope: !2322)
!2329 = !DILocation(line: 812, column: 79, scope: !2322)
!2330 = !DILocation(line: 812, column: 83, scope: !2322)
!2331 = !DILocation(line: 812, column: 88, scope: !2322)
!2332 = !DILocation(line: 812, column: 91, scope: !2322)
!2333 = !DILocation(line: 812, column: 117, scope: !2322)
!2334 = !DILocation(line: 812, column: 121, scope: !2322)
!2335 = !DILocation(line: 812, column: 126, scope: !2322)
!2336 = !DILocation(line: 812, column: 129, scope: !2322)
!2337 = !DILocation(line: 812, column: 160, scope: !2322)
!2338 = !DILocation(line: 812, column: 164, scope: !2322)
!2339 = !DILocation(line: 812, column: 169, scope: !2322)
!2340 = !DILocation(line: 812, column: 172, scope: !2322)
!2341 = !DILocation(line: 813, column: 16, scope: !2322)
!2342 = !DILocation(line: 813, column: 3, scope: !2322)
!2343 = !DILocation(line: 815, column: 18, scope: !2344)
!2344 = distinct !DILexicalBlock(scope: !1793, file: !31, line: 815, column: 6)
!2345 = !DILocation(line: 815, column: 23, scope: !2344)
!2346 = !DILocation(line: 815, column: 6, scope: !2344)
!2347 = !DILocation(line: 815, column: 27, scope: !2344)
!2348 = !DILocation(line: 815, column: 34, scope: !2344)
!2349 = !DILocation(line: 816, column: 16, scope: !2344)
!2350 = !DILocation(line: 816, column: 3, scope: !2344)
!2351 = !DILocation(line: 818, column: 22, scope: !1793)
!2352 = !DILocation(line: 818, column: 27, scope: !1793)
!2353 = !DILocation(line: 818, column: 43, scope: !1793)
!2354 = !DILocation(line: 818, column: 53, scope: !1793)
!2355 = !DILocation(line: 818, column: 64, scope: !1793)
!2356 = !DILocation(line: 818, column: 79, scope: !1793)
!2357 = !DILocation(line: 818, column: 77, scope: !1793)
!2358 = !DILocation(line: 818, column: 2, scope: !1793)
!2359 = !DILocation(line: 821, column: 18, scope: !2360)
!2360 = distinct !DILexicalBlock(scope: !1793, file: !31, line: 821, column: 6)
!2361 = !DILocation(line: 821, column: 6, scope: !2360)
!2362 = !DILocation(line: 821, column: 31, scope: !2360)
!2363 = !DILocation(line: 821, column: 38, scope: !2360)
!2364 = !DILocation(line: 823, column: 33, scope: !2365)
!2365 = distinct !DILexicalBlock(scope: !2360, file: !31, line: 822, column: 2)
!2366 = !DILocation(line: 823, column: 38, scope: !2365)
!2367 = !DILocation(line: 823, column: 54, scope: !2365)
!2368 = !DILocation(line: 823, column: 3, scope: !2365)
!2369 = !DILocation(line: 823, column: 8, scope: !2365)
!2370 = !DILocation(line: 823, column: 24, scope: !2365)
!2371 = !DILocation(line: 823, column: 31, scope: !2365)
!2372 = !DILocation(line: 824, column: 17, scope: !2365)
!2373 = !DILocation(line: 824, column: 22, scope: !2365)
!2374 = !DILocation(line: 824, column: 38, scope: !2365)
!2375 = !DILocation(line: 824, column: 65, scope: !2365)
!2376 = !DILocation(line: 824, column: 70, scope: !2365)
!2377 = !DILocation(line: 824, column: 53, scope: !2365)
!2378 = !DILocation(line: 824, column: 74, scope: !2365)
!2379 = !DILocation(line: 824, column: 82, scope: !2365)
!2380 = !DILocation(line: 824, column: 95, scope: !2365)
!2381 = !DILocation(line: 824, column: 94, scope: !2365)
!2382 = !DILocation(line: 824, column: 46, scope: !2365)
!2383 = !DILocation(line: 824, column: 3, scope: !2365)
!2384 = !DILocation(line: 825, column: 2, scope: !2365)
!2385 = !DILocation(line: 827, column: 7, scope: !2386)
!2386 = distinct !DILexicalBlock(scope: !1793, file: !31, line: 827, column: 6)
!2387 = !DILocation(line: 827, column: 12, scope: !2386)
!2388 = !DILocation(line: 827, column: 17, scope: !2386)
!2389 = !DILocation(line: 827, column: 32, scope: !2386)
!2390 = !DILocation(line: 827, column: 36, scope: !2386)
!2391 = !DILocation(line: 827, column: 41, scope: !2386)
!2392 = !DILocation(line: 827, column: 44, scope: !2386)
!2393 = !DILocation(line: 828, column: 21, scope: !2386)
!2394 = !DILocation(line: 828, column: 29, scope: !2386)
!2395 = !DILocation(line: 828, column: 37, scope: !2386)
!2396 = !DILocation(line: 828, column: 3, scope: !2386)
!2397 = !DILocation(line: 828, column: 8, scope: !2386)
!2398 = !DILocation(line: 828, column: 17, scope: !2386)
!2399 = !DILocation(line: 832, column: 9, scope: !1793)
!2400 = !DILocation(line: 832, column: 2, scope: !1793)
!2401 = !DILocation(line: 833, column: 1, scope: !1793)
!2402 = distinct !DISubprogram(name: "Laser_create_new_easy", linkageName: "_Z21Laser_create_new_easyP10vms_vectorS0_iii", scope: !31, file: !31, line: 837, type: !2403, scopeLine: 838, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !320)
!2403 = !DISubroutineType(types: !2404)
!2404 = !{!7, !733, !733, !7, !7, !7}
!2405 = !DILocalVariable(name: "direction", arg: 1, scope: !2402, file: !31, line: 837, type: !733)
!2406 = !DILocation(line: 837, column: 41, scope: !2402)
!2407 = !DILocalVariable(name: "position", arg: 2, scope: !2402, file: !31, line: 837, type: !733)
!2408 = !DILocation(line: 837, column: 65, scope: !2402)
!2409 = !DILocalVariable(name: "parent", arg: 3, scope: !2402, file: !31, line: 837, type: !7)
!2410 = !DILocation(line: 837, column: 79, scope: !2402)
!2411 = !DILocalVariable(name: "weapon_type", arg: 4, scope: !2402, file: !31, line: 837, type: !7)
!2412 = !DILocation(line: 837, column: 91, scope: !2402)
!2413 = !DILocalVariable(name: "make_sound", arg: 5, scope: !2402, file: !31, line: 837, type: !7)
!2414 = !DILocation(line: 837, column: 108, scope: !2402)
!2415 = !DILocalVariable(name: "fq", scope: !2402, file: !31, line: 839, type: !1457)
!2416 = !DILocation(line: 839, column: 12, scope: !2402)
!2417 = !DILocalVariable(name: "hit_data", scope: !2402, file: !31, line: 840, type: !1471)
!2418 = !DILocation(line: 840, column: 12, scope: !2402)
!2419 = !DILocalVariable(name: "pobjp", scope: !2402, file: !31, line: 841, type: !33)
!2420 = !DILocation(line: 841, column: 11, scope: !2402)
!2421 = !DILocation(line: 841, column: 28, scope: !2402)
!2422 = !DILocation(line: 841, column: 20, scope: !2402)
!2423 = !DILocalVariable(name: "fate", scope: !2402, file: !31, line: 842, type: !7)
!2424 = !DILocation(line: 842, column: 8, scope: !2402)
!2425 = !DILocation(line: 851, column: 16, scope: !2402)
!2426 = !DILocation(line: 851, column: 23, scope: !2402)
!2427 = !DILocation(line: 851, column: 5, scope: !2402)
!2428 = !DILocation(line: 851, column: 13, scope: !2402)
!2429 = !DILocation(line: 852, column: 19, scope: !2402)
!2430 = !DILocation(line: 852, column: 26, scope: !2402)
!2431 = !DILocation(line: 852, column: 5, scope: !2402)
!2432 = !DILocation(line: 852, column: 17, scope: !2402)
!2433 = !DILocation(line: 853, column: 15, scope: !2402)
!2434 = !DILocation(line: 853, column: 5, scope: !2402)
!2435 = !DILocation(line: 853, column: 13, scope: !2402)
!2436 = !DILocation(line: 854, column: 5, scope: !2402)
!2437 = !DILocation(line: 854, column: 13, scope: !2402)
!2438 = !DILocation(line: 855, column: 20, scope: !2402)
!2439 = !DILocation(line: 855, column: 25, scope: !2402)
!2440 = !DILocation(line: 855, column: 5, scope: !2402)
!2441 = !DILocation(line: 855, column: 18, scope: !2402)
!2442 = !DILocation(line: 856, column: 5, scope: !2402)
!2443 = !DILocation(line: 856, column: 21, scope: !2402)
!2444 = !DILocation(line: 857, column: 5, scope: !2402)
!2445 = !DILocation(line: 857, column: 15, scope: !2402)
!2446 = !DILocation(line: 859, column: 9, scope: !2402)
!2447 = !DILocation(line: 859, column: 7, scope: !2402)
!2448 = !DILocation(line: 860, column: 6, scope: !2449)
!2449 = distinct !DILexicalBlock(scope: !2402, file: !31, line: 860, column: 6)
!2450 = !DILocation(line: 860, column: 11, scope: !2449)
!2451 = !DILocation(line: 860, column: 24, scope: !2449)
!2452 = !DILocation(line: 860, column: 36, scope: !2449)
!2453 = !DILocation(line: 860, column: 43, scope: !2449)
!2454 = !DILocation(line: 862, column: 3, scope: !2455)
!2455 = distinct !DILexicalBlock(scope: !2449, file: !31, line: 861, column: 2)
!2456 = !DILocation(line: 863, column: 3, scope: !2455)
!2457 = !DILocation(line: 866, column: 27, scope: !2402)
!2458 = !DILocation(line: 866, column: 48, scope: !2402)
!2459 = !DILocation(line: 866, column: 66, scope: !2402)
!2460 = !DILocation(line: 866, column: 75, scope: !2402)
!2461 = !DILocation(line: 866, column: 83, scope: !2402)
!2462 = !DILocation(line: 866, column: 96, scope: !2402)
!2463 = !DILocation(line: 866, column: 9, scope: !2402)
!2464 = !DILocation(line: 866, column: 2, scope: !2402)
!2465 = !DILocation(line: 867, column: 1, scope: !2402)
!2466 = distinct !DISubprogram(name: "object_to_object_visibility", linkageName: "_Z27object_to_object_visibilityP6objectS0_i", scope: !31, file: !31, line: 876, type: !2467, scopeLine: 877, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !320)
!2467 = !DISubroutineType(types: !2468)
!2468 = !{!7, !33, !33, !7}
!2469 = !DILocalVariable(name: "obj1", arg: 1, scope: !2466, file: !31, line: 876, type: !33)
!2470 = !DILocation(line: 876, column: 41, scope: !2466)
!2471 = !DILocalVariable(name: "obj2", arg: 2, scope: !2466, file: !31, line: 876, type: !33)
!2472 = !DILocation(line: 876, column: 55, scope: !2466)
!2473 = !DILocalVariable(name: "trans_type", arg: 3, scope: !2466, file: !31, line: 876, type: !7)
!2474 = !DILocation(line: 876, column: 65, scope: !2466)
!2475 = !DILocalVariable(name: "fq", scope: !2466, file: !31, line: 878, type: !1457)
!2476 = !DILocation(line: 878, column: 12, scope: !2466)
!2477 = !DILocalVariable(name: "hit_data", scope: !2466, file: !31, line: 879, type: !1471)
!2478 = !DILocation(line: 879, column: 12, scope: !2466)
!2479 = !DILocalVariable(name: "fate", scope: !2466, file: !31, line: 880, type: !7)
!2480 = !DILocation(line: 880, column: 8, scope: !2466)
!2481 = !DILocation(line: 882, column: 16, scope: !2466)
!2482 = !DILocation(line: 882, column: 22, scope: !2466)
!2483 = !DILocation(line: 882, column: 5, scope: !2466)
!2484 = !DILocation(line: 882, column: 13, scope: !2466)
!2485 = !DILocation(line: 883, column: 19, scope: !2466)
!2486 = !DILocation(line: 883, column: 25, scope: !2466)
!2487 = !DILocation(line: 883, column: 5, scope: !2466)
!2488 = !DILocation(line: 883, column: 17, scope: !2466)
!2489 = !DILocation(line: 884, column: 16, scope: !2466)
!2490 = !DILocation(line: 884, column: 22, scope: !2466)
!2491 = !DILocation(line: 884, column: 5, scope: !2466)
!2492 = !DILocation(line: 884, column: 13, scope: !2466)
!2493 = !DILocation(line: 885, column: 5, scope: !2466)
!2494 = !DILocation(line: 885, column: 13, scope: !2466)
!2495 = !DILocation(line: 886, column: 20, scope: !2466)
!2496 = !DILocation(line: 886, column: 24, scope: !2466)
!2497 = !DILocation(line: 886, column: 5, scope: !2466)
!2498 = !DILocation(line: 886, column: 18, scope: !2466)
!2499 = !DILocation(line: 887, column: 5, scope: !2466)
!2500 = !DILocation(line: 887, column: 21, scope: !2466)
!2501 = !DILocation(line: 888, column: 17, scope: !2466)
!2502 = !DILocation(line: 888, column: 5, scope: !2466)
!2503 = !DILocation(line: 888, column: 15, scope: !2466)
!2504 = !DILocation(line: 890, column: 9, scope: !2466)
!2505 = !DILocation(line: 890, column: 7, scope: !2466)
!2506 = !DILocation(line: 892, column: 6, scope: !2507)
!2507 = distinct !DILexicalBlock(scope: !2466, file: !31, line: 892, column: 6)
!2508 = !DILocation(line: 892, column: 11, scope: !2507)
!2509 = !DILocation(line: 893, column: 3, scope: !2507)
!2510 = !DILocation(line: 894, column: 11, scope: !2511)
!2511 = distinct !DILexicalBlock(scope: !2507, file: !31, line: 894, column: 11)
!2512 = !DILocation(line: 894, column: 16, scope: !2511)
!2513 = !DILocation(line: 895, column: 3, scope: !2511)
!2514 = !DILocation(line: 897, column: 3, scope: !2511)
!2515 = !DILocation(line: 900, column: 2, scope: !2466)
!2516 = !DILocation(line: 901, column: 1, scope: !2466)
!2517 = distinct !DISubprogram(name: "object_is_trackable", linkageName: "_Z19object_is_trackableiP6objectPi", scope: !31, file: !31, line: 909, type: !2518, scopeLine: 910, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !320)
!2518 = !DISubroutineType(types: !2519)
!2519 = !{!7, !7, !33, !2520}
!2520 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!2521 = !DILocalVariable(name: "track_goal", arg: 1, scope: !2517, file: !31, line: 909, type: !7)
!2522 = !DILocation(line: 909, column: 29, scope: !2517)
!2523 = !DILocalVariable(name: "tracker", arg: 2, scope: !2517, file: !31, line: 909, type: !33)
!2524 = !DILocation(line: 909, column: 49, scope: !2517)
!2525 = !DILocalVariable(name: "dot", arg: 3, scope: !2517, file: !31, line: 909, type: !2520)
!2526 = !DILocation(line: 909, column: 63, scope: !2517)
!2527 = !DILocalVariable(name: "vector_to_goal", scope: !2517, file: !31, line: 911, type: !54)
!2528 = !DILocation(line: 911, column: 13, scope: !2517)
!2529 = !DILocalVariable(name: "objp", scope: !2517, file: !31, line: 912, type: !33)
!2530 = !DILocation(line: 912, column: 11, scope: !2517)
!2531 = !DILocation(line: 914, column: 6, scope: !2532)
!2532 = distinct !DILexicalBlock(scope: !2517, file: !31, line: 914, column: 6)
!2533 = !DILocation(line: 914, column: 17, scope: !2532)
!2534 = !DILocation(line: 915, column: 3, scope: !2532)
!2535 = !DILocation(line: 917, column: 6, scope: !2536)
!2536 = distinct !DILexicalBlock(scope: !2517, file: !31, line: 917, column: 6)
!2537 = !DILocation(line: 917, column: 16, scope: !2536)
!2538 = !DILocation(line: 918, column: 3, scope: !2536)
!2539 = !DILocation(line: 920, column: 18, scope: !2517)
!2540 = !DILocation(line: 920, column: 10, scope: !2517)
!2541 = !DILocation(line: 920, column: 7, scope: !2517)
!2542 = !DILocation(line: 923, column: 7, scope: !2543)
!2543 = distinct !DILexicalBlock(scope: !2517, file: !31, line: 923, column: 6)
!2544 = !DILocation(line: 923, column: 29, scope: !2543)
!2545 = !DILocation(line: 923, column: 21, scope: !2543)
!2546 = !DILocation(line: 923, column: 41, scope: !2543)
!2547 = !DILocation(line: 923, column: 18, scope: !2543)
!2548 = !DILocation(line: 923, column: 49, scope: !2543)
!2549 = !DILocation(line: 923, column: 61, scope: !2543)
!2550 = !DILocation(line: 923, column: 53, scope: !2543)
!2551 = !DILocation(line: 923, column: 73, scope: !2543)
!2552 = !DILocation(line: 923, column: 79, scope: !2543)
!2553 = !DILocation(line: 923, column: 52, scope: !2543)
!2554 = !DILocation(line: 924, column: 3, scope: !2543)
!2555 = !DILocation(line: 927, column: 6, scope: !2556)
!2556 = distinct !DILexicalBlock(scope: !2517, file: !31, line: 927, column: 6)
!2557 = !DILocation(line: 927, column: 12, scope: !2556)
!2558 = !DILocation(line: 927, column: 17, scope: !2556)
!2559 = !DILocation(line: 929, column: 7, scope: !2560)
!2560 = distinct !DILexicalBlock(scope: !2561, file: !31, line: 929, column: 7)
!2561 = distinct !DILexicalBlock(scope: !2556, file: !31, line: 928, column: 2)
!2562 = !DILocation(line: 929, column: 13, scope: !2560)
!2563 = !DILocation(line: 929, column: 27, scope: !2560)
!2564 = !DILocation(line: 930, column: 4, scope: !2560)
!2565 = !DILocation(line: 932, column: 18, scope: !2566)
!2566 = distinct !DILexicalBlock(scope: !2561, file: !31, line: 932, column: 7)
!2567 = !DILocation(line: 932, column: 24, scope: !2566)
!2568 = !DILocation(line: 932, column: 7, scope: !2566)
!2569 = !DILocation(line: 932, column: 28, scope: !2566)
!2570 = !DILocation(line: 933, column: 8, scope: !2571)
!2571 = distinct !DILexicalBlock(scope: !2566, file: !31, line: 933, column: 8)
!2572 = !DILocation(line: 933, column: 17, scope: !2571)
!2573 = !DILocation(line: 933, column: 34, scope: !2571)
!2574 = !DILocation(line: 933, column: 46, scope: !2571)
!2575 = !DILocation(line: 934, column: 5, scope: !2571)
!2576 = !DILocation(line: 933, column: 49, scope: !2571)
!2577 = !DILocation(line: 935, column: 2, scope: !2561)
!2578 = !DILocation(line: 936, column: 31, scope: !2517)
!2579 = !DILocation(line: 936, column: 37, scope: !2517)
!2580 = !DILocation(line: 936, column: 43, scope: !2517)
!2581 = !DILocation(line: 936, column: 52, scope: !2517)
!2582 = !DILocation(line: 936, column: 2, scope: !2517)
!2583 = !DILocation(line: 937, column: 2, scope: !2517)
!2584 = !DILocation(line: 938, column: 9, scope: !2517)
!2585 = !DILocation(line: 938, column: 3, scope: !2517)
!2586 = !DILocation(line: 938, column: 7, scope: !2517)
!2587 = !DILocation(line: 940, column: 8, scope: !2588)
!2588 = distinct !DILexicalBlock(scope: !2517, file: !31, line: 940, column: 6)
!2589 = !DILocation(line: 940, column: 7, scope: !2588)
!2590 = !DILocation(line: 940, column: 14, scope: !2588)
!2591 = !DILocation(line: 940, column: 12, scope: !2588)
!2592 = !DILocation(line: 940, column: 33, scope: !2588)
!2593 = !DILocation(line: 940, column: 38, scope: !2588)
!2594 = !DILocation(line: 940, column: 37, scope: !2588)
!2595 = !DILocation(line: 940, column: 42, scope: !2588)
!2596 = !DILocation(line: 943, column: 3, scope: !2597)
!2597 = distinct !DILexicalBlock(scope: !2588, file: !31, line: 941, column: 2)
!2598 = !DILocation(line: 944, column: 10, scope: !2597)
!2599 = !DILocation(line: 944, column: 4, scope: !2597)
!2600 = !DILocation(line: 944, column: 8, scope: !2597)
!2601 = !DILocation(line: 945, column: 2, scope: !2597)
!2602 = !DILocation(line: 951, column: 7, scope: !2603)
!2603 = distinct !DILexicalBlock(scope: !2517, file: !31, line: 951, column: 6)
!2604 = !DILocation(line: 951, column: 6, scope: !2603)
!2605 = !DILocation(line: 951, column: 14, scope: !2603)
!2606 = !DILocation(line: 951, column: 11, scope: !2603)
!2607 = !DILocalVariable(name: "rval", scope: !2608, file: !31, line: 953, type: !7)
!2608 = distinct !DILexicalBlock(scope: !2603, file: !31, line: 952, column: 2)
!2609 = !DILocation(line: 953, column: 7, scope: !2608)
!2610 = !DILocation(line: 955, column: 39, scope: !2608)
!2611 = !DILocation(line: 955, column: 48, scope: !2608)
!2612 = !DILocation(line: 955, column: 11, scope: !2608)
!2613 = !DILocation(line: 955, column: 8, scope: !2608)
!2614 = !DILocation(line: 957, column: 10, scope: !2608)
!2615 = !DILocation(line: 957, column: 3, scope: !2608)
!2616 = !DILocation(line: 962, column: 3, scope: !2617)
!2617 = distinct !DILexicalBlock(scope: !2603, file: !31, line: 960, column: 2)
!2618 = !DILocation(line: 964, column: 1, scope: !2517)
!2619 = distinct !DISubprogram(name: "call_find_homing_object_complete", linkageName: "_Z32call_find_homing_object_completeP6objectP10vms_vector", scope: !31, file: !31, line: 969, type: !2620, scopeLine: 970, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !320)
!2620 = !DISubroutineType(types: !2621)
!2621 = !{!7, !33, !733}
!2622 = !DILocalVariable(name: "tracker", arg: 1, scope: !2619, file: !31, line: 969, type: !33)
!2623 = !DILocation(line: 969, column: 46, scope: !2619)
!2624 = !DILocalVariable(name: "curpos", arg: 2, scope: !2619, file: !31, line: 969, type: !733)
!2625 = !DILocation(line: 969, column: 67, scope: !2619)
!2626 = !DILocation(line: 971, column: 6, scope: !2627)
!2627 = distinct !DILexicalBlock(scope: !2619, file: !31, line: 971, column: 6)
!2628 = !DILocation(line: 971, column: 16, scope: !2627)
!2629 = !DILocation(line: 973, column: 7, scope: !2630)
!2630 = distinct !DILexicalBlock(scope: !2631, file: !31, line: 973, column: 7)
!2631 = distinct !DILexicalBlock(scope: !2627, file: !31, line: 972, column: 2)
!2632 = !DILocation(line: 973, column: 16, scope: !2630)
!2633 = !DILocation(line: 973, column: 33, scope: !2630)
!2634 = !DILocation(line: 973, column: 45, scope: !2630)
!2635 = !DILocation(line: 976, column: 8, scope: !2636)
!2636 = distinct !DILexicalBlock(scope: !2637, file: !31, line: 976, column: 8)
!2637 = distinct !DILexicalBlock(scope: !2630, file: !31, line: 974, column: 3)
!2638 = !DILocation(line: 976, column: 18, scope: !2636)
!2639 = !DILocation(line: 977, column: 41, scope: !2636)
!2640 = !DILocation(line: 977, column: 49, scope: !2636)
!2641 = !DILocation(line: 977, column: 12, scope: !2636)
!2642 = !DILocation(line: 977, column: 5, scope: !2636)
!2643 = !DILocation(line: 979, column: 41, scope: !2636)
!2644 = !DILocation(line: 979, column: 49, scope: !2636)
!2645 = !DILocation(line: 979, column: 12, scope: !2636)
!2646 = !DILocation(line: 979, column: 5, scope: !2636)
!2647 = !DILocalVariable(name: "goal2_type", scope: !2648, file: !31, line: 983, type: !7)
!2648 = distinct !DILexicalBlock(scope: !2630, file: !31, line: 982, column: 3)
!2649 = !DILocation(line: 983, column: 8, scope: !2648)
!2650 = !DILocation(line: 985, column: 8, scope: !2651)
!2651 = distinct !DILexicalBlock(scope: !2648, file: !31, line: 985, column: 8)
!2652 = !DILocation(line: 986, column: 16, scope: !2651)
!2653 = !DILocation(line: 986, column: 5, scope: !2651)
!2654 = !DILocation(line: 987, column: 4, scope: !2648)
!2655 = !DILocation(line: 988, column: 39, scope: !2648)
!2656 = !DILocation(line: 988, column: 47, scope: !2648)
!2657 = !DILocation(line: 988, column: 68, scope: !2648)
!2658 = !DILocation(line: 988, column: 11, scope: !2648)
!2659 = !DILocation(line: 988, column: 4, scope: !2648)
!2660 = !DILocation(line: 991, column: 39, scope: !2627)
!2661 = !DILocation(line: 991, column: 47, scope: !2627)
!2662 = !DILocation(line: 991, column: 10, scope: !2627)
!2663 = !DILocation(line: 991, column: 3, scope: !2627)
!2664 = !DILocation(line: 992, column: 1, scope: !2619)
!2665 = distinct !DISubprogram(name: "find_homing_object_complete", linkageName: "_Z27find_homing_object_completeP10vms_vectorP6objectii", scope: !31, file: !31, line: 1238, type: !2666, scopeLine: 1239, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !320)
!2666 = !DISubroutineType(types: !2667)
!2667 = !{!7, !733, !33, !7, !7}
!2668 = !DILocalVariable(name: "curpos", arg: 1, scope: !2665, file: !31, line: 1238, type: !733)
!2669 = !DILocation(line: 1238, column: 45, scope: !2665)
!2670 = !DILocalVariable(name: "tracker", arg: 2, scope: !2665, file: !31, line: 1238, type: !33)
!2671 = !DILocation(line: 1238, column: 61, scope: !2665)
!2672 = !DILocalVariable(name: "track_obj_type1", arg: 3, scope: !2665, file: !31, line: 1238, type: !7)
!2673 = !DILocation(line: 1238, column: 74, scope: !2665)
!2674 = !DILocalVariable(name: "track_obj_type2", arg: 4, scope: !2665, file: !31, line: 1238, type: !7)
!2675 = !DILocation(line: 1238, column: 95, scope: !2665)
!2676 = !DILocalVariable(name: "objnum", scope: !2665, file: !31, line: 1308, type: !7)
!2677 = !DILocation(line: 1308, column: 6, scope: !2665)
!2678 = !DILocalVariable(name: "max_dot", scope: !2665, file: !31, line: 1309, type: !21)
!2679 = !DILocation(line: 1309, column: 6, scope: !2665)
!2680 = !DILocalVariable(name: "best_objnum", scope: !2665, file: !31, line: 1310, type: !7)
!2681 = !DILocation(line: 1310, column: 6, scope: !2665)
!2682 = !DILocalVariable(name: "max_trackable_dist", scope: !2665, file: !31, line: 1311, type: !21)
!2683 = !DILocation(line: 1311, column: 6, scope: !2665)
!2684 = !DILocalVariable(name: "min_trackable_dot", scope: !2665, file: !31, line: 1312, type: !21)
!2685 = !DILocation(line: 1312, column: 6, scope: !2665)
!2686 = !DILocation(line: 1315, column: 2, scope: !2665)
!2687 = !DILocation(line: 1317, column: 21, scope: !2665)
!2688 = !DILocation(line: 1318, column: 20, scope: !2665)
!2689 = !DILocation(line: 1320, column: 6, scope: !2690)
!2690 = distinct !DILexicalBlock(scope: !2665, file: !31, line: 1320, column: 6)
!2691 = !DILocation(line: 1320, column: 15, scope: !2690)
!2692 = !DILocation(line: 1320, column: 18, scope: !2690)
!2693 = !DILocation(line: 1322, column: 22, scope: !2694)
!2694 = distinct !DILexicalBlock(scope: !2690, file: !31, line: 1321, column: 2)
!2695 = !DILocation(line: 1323, column: 21, scope: !2694)
!2696 = !DILocation(line: 1324, column: 2, scope: !2694)
!2697 = !DILocation(line: 1326, column: 13, scope: !2698)
!2698 = distinct !DILexicalBlock(scope: !2665, file: !31, line: 1326, column: 2)
!2699 = !DILocation(line: 1326, column: 7, scope: !2698)
!2700 = !DILocation(line: 1326, column: 17, scope: !2701)
!2701 = distinct !DILexicalBlock(scope: !2698, file: !31, line: 1326, column: 2)
!2702 = !DILocation(line: 1326, column: 25, scope: !2701)
!2703 = !DILocation(line: 1326, column: 23, scope: !2701)
!2704 = !DILocation(line: 1326, column: 2, scope: !2698)
!2705 = !DILocalVariable(name: "is_proximity", scope: !2706, file: !31, line: 1328, type: !7)
!2706 = distinct !DILexicalBlock(scope: !2701, file: !31, line: 1327, column: 2)
!2707 = !DILocation(line: 1328, column: 9, scope: !2706)
!2708 = !DILocalVariable(name: "dot", scope: !2706, file: !31, line: 1329, type: !21)
!2709 = !DILocation(line: 1329, column: 9, scope: !2706)
!2710 = !DILocalVariable(name: "dist", scope: !2706, file: !31, line: 1329, type: !21)
!2711 = !DILocation(line: 1329, column: 14, scope: !2706)
!2712 = !DILocalVariable(name: "vec_to_curobj", scope: !2706, file: !31, line: 1330, type: !54)
!2713 = !DILocation(line: 1330, column: 14, scope: !2706)
!2714 = !DILocalVariable(name: "curobjp", scope: !2706, file: !31, line: 1331, type: !33)
!2715 = !DILocation(line: 1331, column: 12, scope: !2706)
!2716 = !DILocation(line: 1331, column: 31, scope: !2706)
!2717 = !DILocation(line: 1331, column: 23, scope: !2706)
!2718 = !DILocation(line: 1333, column: 8, scope: !2719)
!2719 = distinct !DILexicalBlock(scope: !2706, file: !31, line: 1333, column: 7)
!2720 = !DILocation(line: 1333, column: 17, scope: !2719)
!2721 = !DILocation(line: 1333, column: 25, scope: !2719)
!2722 = !DILocation(line: 1333, column: 22, scope: !2719)
!2723 = !DILocation(line: 1333, column: 42, scope: !2719)
!2724 = !DILocation(line: 1333, column: 46, scope: !2719)
!2725 = !DILocation(line: 1333, column: 55, scope: !2719)
!2726 = !DILocation(line: 1333, column: 63, scope: !2719)
!2727 = !DILocation(line: 1333, column: 60, scope: !2719)
!2728 = !DILocation(line: 1334, column: 9, scope: !2729)
!2729 = distinct !DILexicalBlock(scope: !2719, file: !31, line: 1334, column: 8)
!2730 = !DILocation(line: 1334, column: 18, scope: !2729)
!2731 = !DILocation(line: 1334, column: 23, scope: !2729)
!2732 = !DILocation(line: 1334, column: 38, scope: !2729)
!2733 = !DILocation(line: 1334, column: 43, scope: !2729)
!2734 = !DILocation(line: 1334, column: 52, scope: !2729)
!2735 = !DILocation(line: 1334, column: 55, scope: !2729)
!2736 = !DILocation(line: 1334, column: 72, scope: !2729)
!2737 = !DILocation(line: 1334, column: 76, scope: !2729)
!2738 = !DILocation(line: 1334, column: 85, scope: !2729)
!2739 = !DILocation(line: 1334, column: 88, scope: !2729)
!2740 = !DILocation(line: 1336, column: 9, scope: !2741)
!2741 = distinct !DILexicalBlock(scope: !2742, file: !31, line: 1336, column: 9)
!2742 = distinct !DILexicalBlock(scope: !2729, file: !31, line: 1335, column: 4)
!2743 = !DILocation(line: 1336, column: 18, scope: !2741)
!2744 = !DILocation(line: 1336, column: 35, scope: !2741)
!2745 = !DILocation(line: 1336, column: 55, scope: !2741)
!2746 = !DILocation(line: 1336, column: 64, scope: !2741)
!2747 = !DILocation(line: 1336, column: 81, scope: !2741)
!2748 = !DILocation(line: 1336, column: 52, scope: !2741)
!2749 = !DILocation(line: 1337, column: 19, scope: !2741)
!2750 = !DILocation(line: 1337, column: 6, scope: !2741)
!2751 = !DILocation(line: 1339, column: 6, scope: !2741)
!2752 = !DILocation(line: 1340, column: 4, scope: !2742)
!2753 = !DILocation(line: 1341, column: 5, scope: !2729)
!2754 = !DILocation(line: 1334, column: 104, scope: !2729)
!2755 = !DILocation(line: 1343, column: 7, scope: !2756)
!2756 = distinct !DILexicalBlock(scope: !2706, file: !31, line: 1343, column: 7)
!2757 = !DILocation(line: 1343, column: 17, scope: !2756)
!2758 = !DILocation(line: 1343, column: 26, scope: !2756)
!2759 = !DILocation(line: 1343, column: 43, scope: !2756)
!2760 = !DILocation(line: 1343, column: 14, scope: !2756)
!2761 = !DILocation(line: 1344, column: 4, scope: !2756)
!2762 = !DILocation(line: 1347, column: 7, scope: !2763)
!2763 = distinct !DILexicalBlock(scope: !2706, file: !31, line: 1347, column: 7)
!2764 = !DILocation(line: 1347, column: 16, scope: !2763)
!2765 = !DILocation(line: 1347, column: 21, scope: !2763)
!2766 = !DILocation(line: 1349, column: 16, scope: !2767)
!2767 = distinct !DILexicalBlock(scope: !2768, file: !31, line: 1349, column: 8)
!2768 = distinct !DILexicalBlock(scope: !2763, file: !31, line: 1348, column: 3)
!2769 = !DILocation(line: 1349, column: 25, scope: !2767)
!2770 = !DILocation(line: 1349, column: 8, scope: !2767)
!2771 = !DILocation(line: 1349, column: 29, scope: !2767)
!2772 = !DILocation(line: 1349, column: 35, scope: !2767)
!2773 = !DILocation(line: 1350, column: 5, scope: !2767)
!2774 = !DILocation(line: 1356, column: 3, scope: !2768)
!2775 = !DILocation(line: 1359, column: 7, scope: !2776)
!2776 = distinct !DILexicalBlock(scope: !2706, file: !31, line: 1359, column: 7)
!2777 = !DILocation(line: 1359, column: 16, scope: !2776)
!2778 = !DILocation(line: 1359, column: 21, scope: !2776)
!2779 = !DILocation(line: 1361, column: 8, scope: !2780)
!2780 = distinct !DILexicalBlock(scope: !2781, file: !31, line: 1361, column: 8)
!2781 = distinct !DILexicalBlock(scope: !2776, file: !31, line: 1360, column: 3)
!2782 = !DILocation(line: 1361, column: 17, scope: !2780)
!2783 = !DILocation(line: 1361, column: 31, scope: !2780)
!2784 = !DILocation(line: 1362, column: 5, scope: !2780)
!2785 = !DILocation(line: 1365, column: 19, scope: !2786)
!2786 = distinct !DILexicalBlock(scope: !2781, file: !31, line: 1365, column: 8)
!2787 = !DILocation(line: 1365, column: 28, scope: !2786)
!2788 = !DILocation(line: 1365, column: 8, scope: !2786)
!2789 = !DILocation(line: 1365, column: 32, scope: !2786)
!2790 = !DILocation(line: 1366, column: 9, scope: !2791)
!2791 = distinct !DILexicalBlock(scope: !2786, file: !31, line: 1366, column: 9)
!2792 = !DILocation(line: 1366, column: 18, scope: !2791)
!2793 = !DILocation(line: 1366, column: 35, scope: !2791)
!2794 = !DILocation(line: 1366, column: 47, scope: !2791)
!2795 = !DILocation(line: 1367, column: 6, scope: !2791)
!2796 = !DILocation(line: 1366, column: 50, scope: !2791)
!2797 = !DILocation(line: 1368, column: 3, scope: !2781)
!2798 = !DILocation(line: 1370, column: 31, scope: !2706)
!2799 = !DILocation(line: 1370, column: 40, scope: !2706)
!2800 = !DILocation(line: 1370, column: 45, scope: !2706)
!2801 = !DILocation(line: 1370, column: 3, scope: !2706)
!2802 = !DILocation(line: 1371, column: 10, scope: !2706)
!2803 = !DILocation(line: 1371, column: 8, scope: !2706)
!2804 = !DILocation(line: 1373, column: 7, scope: !2805)
!2805 = distinct !DILexicalBlock(scope: !2706, file: !31, line: 1373, column: 7)
!2806 = !DILocation(line: 1373, column: 14, scope: !2805)
!2807 = !DILocation(line: 1373, column: 12, scope: !2805)
!2808 = !DILocation(line: 1375, column: 4, scope: !2809)
!2809 = distinct !DILexicalBlock(scope: !2805, file: !31, line: 1374, column: 3)
!2810 = !DILocation(line: 1376, column: 10, scope: !2809)
!2811 = !DILocation(line: 1376, column: 8, scope: !2809)
!2812 = !DILocation(line: 1377, column: 8, scope: !2813)
!2813 = distinct !DILexicalBlock(scope: !2809, file: !31, line: 1377, column: 8)
!2814 = !DILocation(line: 1378, column: 13, scope: !2813)
!2815 = !DILocation(line: 1378, column: 17, scope: !2813)
!2816 = !DILocation(line: 1378, column: 25, scope: !2813)
!2817 = !DILocation(line: 1378, column: 23, scope: !2813)
!2818 = !DILocation(line: 1378, column: 30, scope: !2813)
!2819 = !DILocation(line: 1378, column: 9, scope: !2813)
!2820 = !DILocation(line: 1378, column: 5, scope: !2813)
!2821 = !DILocation(line: 1384, column: 8, scope: !2822)
!2822 = distinct !DILexicalBlock(scope: !2809, file: !31, line: 1384, column: 8)
!2823 = !DILocation(line: 1384, column: 14, scope: !2822)
!2824 = !DILocation(line: 1384, column: 12, scope: !2822)
!2825 = !DILocation(line: 1387, column: 9, scope: !2826)
!2826 = distinct !DILexicalBlock(scope: !2827, file: !31, line: 1387, column: 9)
!2827 = distinct !DILexicalBlock(scope: !2822, file: !31, line: 1385, column: 4)
!2828 = !DILocation(line: 1387, column: 15, scope: !2826)
!2829 = !DILocation(line: 1387, column: 13, scope: !2826)
!2830 = !DILocation(line: 1389, column: 38, scope: !2831)
!2831 = distinct !DILexicalBlock(scope: !2832, file: !31, line: 1389, column: 10)
!2832 = distinct !DILexicalBlock(scope: !2826, file: !31, line: 1388, column: 5)
!2833 = !DILocation(line: 1389, column: 56, scope: !2831)
!2834 = !DILocation(line: 1389, column: 48, scope: !2831)
!2835 = !DILocation(line: 1389, column: 10, scope: !2831)
!2836 = !DILocation(line: 1390, column: 17, scope: !2837)
!2837 = distinct !DILexicalBlock(scope: !2831, file: !31, line: 1389, column: 80)
!2838 = !DILocation(line: 1390, column: 15, scope: !2837)
!2839 = !DILocation(line: 1391, column: 21, scope: !2837)
!2840 = !DILocation(line: 1391, column: 19, scope: !2837)
!2841 = !DILocation(line: 1392, column: 6, scope: !2837)
!2842 = !DILocation(line: 1393, column: 5, scope: !2832)
!2843 = !DILocation(line: 1394, column: 4, scope: !2827)
!2844 = !DILocation(line: 1395, column: 3, scope: !2809)
!2845 = !DILocation(line: 1396, column: 2, scope: !2706)
!2846 = !DILocation(line: 1326, column: 53, scope: !2701)
!2847 = !DILocation(line: 1326, column: 2, scope: !2701)
!2848 = distinct !{!2848, !2704, !2849, !948}
!2849 = !DILocation(line: 1396, column: 2, scope: !2698)
!2850 = !DILocation(line: 1399, column: 9, scope: !2665)
!2851 = !DILocation(line: 1399, column: 2, scope: !2665)
!2852 = distinct !DISubprogram(name: "track_track_goal", linkageName: "_Z16track_track_goaliP6objectPi", scope: !31, file: !31, line: 1407, type: !2518, scopeLine: 1408, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !320)
!2853 = !DILocalVariable(name: "track_goal", arg: 1, scope: !2852, file: !31, line: 1407, type: !7)
!2854 = !DILocation(line: 1407, column: 26, scope: !2852)
!2855 = !DILocalVariable(name: "tracker", arg: 2, scope: !2852, file: !31, line: 1407, type: !33)
!2856 = !DILocation(line: 1407, column: 46, scope: !2852)
!2857 = !DILocalVariable(name: "dot", arg: 3, scope: !2852, file: !31, line: 1407, type: !2520)
!2858 = !DILocation(line: 1407, column: 60, scope: !2852)
!2859 = !DILocation(line: 1498, column: 26, scope: !2860)
!2860 = distinct !DILexicalBlock(scope: !2852, file: !31, line: 1498, column: 6)
!2861 = !DILocation(line: 1498, column: 38, scope: !2860)
!2862 = !DILocation(line: 1498, column: 47, scope: !2860)
!2863 = !DILocation(line: 1498, column: 6, scope: !2860)
!2864 = !DILocation(line: 1498, column: 52, scope: !2860)
!2865 = !DILocation(line: 1498, column: 59, scope: !2860)
!2866 = !DILocation(line: 1498, column: 66, scope: !2860)
!2867 = !DILocation(line: 1498, column: 78, scope: !2860)
!2868 = !DILocation(line: 1498, column: 76, scope: !2860)
!2869 = !DILocation(line: 1498, column: 90, scope: !2860)
!2870 = !DILocation(line: 1498, column: 95, scope: !2860)
!2871 = !DILocation(line: 1501, column: 10, scope: !2872)
!2872 = distinct !DILexicalBlock(scope: !2860, file: !31, line: 1499, column: 2)
!2873 = !DILocation(line: 1501, column: 3, scope: !2872)
!2874 = !DILocation(line: 1503, column: 14, scope: !2875)
!2875 = distinct !DILexicalBlock(scope: !2860, file: !31, line: 1503, column: 11)
!2876 = !DILocation(line: 1503, column: 21, scope: !2875)
!2877 = !DILocation(line: 1503, column: 33, scope: !2875)
!2878 = !DILocation(line: 1503, column: 31, scope: !2875)
!2879 = !DILocation(line: 1503, column: 45, scope: !2875)
!2880 = !DILocation(line: 1503, column: 50, scope: !2875)
!2881 = !DILocalVariable(name: "rval", scope: !2882, file: !31, line: 1505, type: !7)
!2882 = distinct !DILexicalBlock(scope: !2875, file: !31, line: 1504, column: 2)
!2883 = !DILocation(line: 1505, column: 7, scope: !2882)
!2884 = !DILocation(line: 1508, column: 15, scope: !2885)
!2885 = distinct !DILexicalBlock(scope: !2882, file: !31, line: 1508, column: 7)
!2886 = !DILocation(line: 1508, column: 24, scope: !2885)
!2887 = !DILocation(line: 1508, column: 41, scope: !2885)
!2888 = !DILocation(line: 1508, column: 7, scope: !2885)
!2889 = !DILocation(line: 1508, column: 53, scope: !2885)
!2890 = !DILocation(line: 1508, column: 58, scope: !2885)
!2891 = !DILocalVariable(name: "goal_type", scope: !2892, file: !31, line: 1510, type: !7)
!2892 = distinct !DILexicalBlock(scope: !2885, file: !31, line: 1509, column: 3)
!2893 = !DILocation(line: 1510, column: 8, scope: !2892)
!2894 = !DILocation(line: 1512, column: 8, scope: !2895)
!2895 = distinct !DILexicalBlock(scope: !2892, file: !31, line: 1512, column: 8)
!2896 = !DILocation(line: 1512, column: 19, scope: !2895)
!2897 = !DILocation(line: 1514, column: 9, scope: !2898)
!2898 = distinct !DILexicalBlock(scope: !2899, file: !31, line: 1514, column: 9)
!2899 = distinct !DILexicalBlock(scope: !2895, file: !31, line: 1513, column: 4)
!2900 = !DILocation(line: 1514, column: 19, scope: !2898)
!2901 = !DILocation(line: 1516, column: 10, scope: !2902)
!2902 = distinct !DILexicalBlock(scope: !2903, file: !31, line: 1516, column: 10)
!2903 = distinct !DILexicalBlock(scope: !2898, file: !31, line: 1515, column: 5)
!2904 = !DILocation(line: 1516, column: 20, scope: !2902)
!2905 = !DILocation(line: 1517, column: 44, scope: !2902)
!2906 = !DILocation(line: 1517, column: 53, scope: !2902)
!2907 = !DILocation(line: 1517, column: 58, scope: !2902)
!2908 = !DILocation(line: 1517, column: 14, scope: !2902)
!2909 = !DILocation(line: 1517, column: 12, scope: !2902)
!2910 = !DILocation(line: 1517, column: 7, scope: !2902)
!2911 = !DILocation(line: 1518, column: 15, scope: !2912)
!2912 = distinct !DILexicalBlock(scope: !2902, file: !31, line: 1518, column: 15)
!2913 = !DILocation(line: 1518, column: 25, scope: !2912)
!2914 = !DILocation(line: 1519, column: 44, scope: !2912)
!2915 = !DILocation(line: 1519, column: 53, scope: !2912)
!2916 = !DILocation(line: 1519, column: 58, scope: !2912)
!2917 = !DILocation(line: 1519, column: 14, scope: !2912)
!2918 = !DILocation(line: 1519, column: 12, scope: !2912)
!2919 = !DILocation(line: 1519, column: 7, scope: !2912)
!2920 = !DILocation(line: 1521, column: 44, scope: !2912)
!2921 = !DILocation(line: 1521, column: 53, scope: !2912)
!2922 = !DILocation(line: 1521, column: 58, scope: !2912)
!2923 = !DILocation(line: 1521, column: 14, scope: !2912)
!2924 = !DILocation(line: 1521, column: 12, scope: !2912)
!2925 = !DILocation(line: 1522, column: 5, scope: !2903)
!2926 = !DILocation(line: 1524, column: 42, scope: !2898)
!2927 = !DILocation(line: 1524, column: 51, scope: !2898)
!2928 = !DILocation(line: 1524, column: 56, scope: !2898)
!2929 = !DILocation(line: 1524, column: 13, scope: !2898)
!2930 = !DILocation(line: 1524, column: 11, scope: !2898)
!2931 = !DILocation(line: 1525, column: 4, scope: !2899)
!2932 = !DILocation(line: 1528, column: 25, scope: !2933)
!2933 = distinct !DILexicalBlock(scope: !2895, file: !31, line: 1527, column: 4)
!2934 = !DILocation(line: 1528, column: 34, scope: !2933)
!2935 = !DILocation(line: 1528, column: 51, scope: !2933)
!2936 = !DILocation(line: 1528, column: 17, scope: !2933)
!2937 = !DILocation(line: 1528, column: 63, scope: !2933)
!2938 = !DILocation(line: 1528, column: 15, scope: !2933)
!2939 = !DILocation(line: 1529, column: 10, scope: !2940)
!2940 = distinct !DILexicalBlock(scope: !2933, file: !31, line: 1529, column: 9)
!2941 = !DILocation(line: 1529, column: 20, scope: !2940)
!2942 = !DILocation(line: 1529, column: 35, scope: !2940)
!2943 = !DILocation(line: 1529, column: 39, scope: !2940)
!2944 = !DILocation(line: 1529, column: 49, scope: !2940)
!2945 = !DILocation(line: 1530, column: 42, scope: !2940)
!2946 = !DILocation(line: 1530, column: 51, scope: !2940)
!2947 = !DILocation(line: 1530, column: 56, scope: !2940)
!2948 = !DILocation(line: 1530, column: 65, scope: !2940)
!2949 = !DILocation(line: 1530, column: 13, scope: !2940)
!2950 = !DILocation(line: 1530, column: 11, scope: !2940)
!2951 = !DILocation(line: 1530, column: 6, scope: !2940)
!2952 = !DILocation(line: 1532, column: 11, scope: !2940)
!2953 = !DILocation(line: 1534, column: 3, scope: !2892)
!2954 = !DILocalVariable(name: "goal_type", scope: !2955, file: !31, line: 1537, type: !7)
!2955 = distinct !DILexicalBlock(scope: !2885, file: !31, line: 1536, column: 3)
!2956 = !DILocation(line: 1537, column: 8, scope: !2955)
!2957 = !DILocalVariable(name: "goal2_type", scope: !2955, file: !31, line: 1537, type: !7)
!2958 = !DILocation(line: 1537, column: 19, scope: !2955)
!2959 = !DILocation(line: 1539, column: 8, scope: !2960)
!2960 = distinct !DILexicalBlock(scope: !2955, file: !31, line: 1539, column: 8)
!2961 = !DILocation(line: 1540, column: 16, scope: !2960)
!2962 = !DILocation(line: 1540, column: 5, scope: !2960)
!2963 = !DILocation(line: 1542, column: 8, scope: !2964)
!2964 = distinct !DILexicalBlock(scope: !2955, file: !31, line: 1542, column: 8)
!2965 = !DILocation(line: 1542, column: 19, scope: !2964)
!2966 = !DILocation(line: 1543, column: 41, scope: !2964)
!2967 = !DILocation(line: 1543, column: 50, scope: !2964)
!2968 = !DILocation(line: 1543, column: 55, scope: !2964)
!2969 = !DILocation(line: 1543, column: 76, scope: !2964)
!2970 = !DILocation(line: 1543, column: 12, scope: !2964)
!2971 = !DILocation(line: 1543, column: 10, scope: !2964)
!2972 = !DILocation(line: 1543, column: 5, scope: !2964)
!2973 = !DILocation(line: 1546, column: 25, scope: !2974)
!2974 = distinct !DILexicalBlock(scope: !2964, file: !31, line: 1545, column: 4)
!2975 = !DILocation(line: 1546, column: 34, scope: !2974)
!2976 = !DILocation(line: 1546, column: 51, scope: !2974)
!2977 = !DILocation(line: 1546, column: 17, scope: !2974)
!2978 = !DILocation(line: 1546, column: 63, scope: !2974)
!2979 = !DILocation(line: 1546, column: 15, scope: !2974)
!2980 = !DILocation(line: 1547, column: 41, scope: !2974)
!2981 = !DILocation(line: 1547, column: 50, scope: !2974)
!2982 = !DILocation(line: 1547, column: 55, scope: !2974)
!2983 = !DILocation(line: 1547, column: 64, scope: !2974)
!2984 = !DILocation(line: 1547, column: 75, scope: !2974)
!2985 = !DILocation(line: 1547, column: 12, scope: !2974)
!2986 = !DILocation(line: 1547, column: 10, scope: !2974)
!2987 = !DILocation(line: 1551, column: 3, scope: !2882)
!2988 = !DILocation(line: 1552, column: 10, scope: !2882)
!2989 = !DILocation(line: 1552, column: 3, scope: !2882)
!2990 = !DILocation(line: 1558, column: 2, scope: !2852)
!2991 = !DILocation(line: 1560, column: 1, scope: !2852)
!2992 = distinct !DISubprogram(name: "Laser_player_fire_spread_delay", linkageName: "_Z30Laser_player_fire_spread_delayP6objectiiiiiii", scope: !31, file: !31, line: 1564, type: !2993, scopeLine: 1565, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !320)
!2993 = !DISubroutineType(types: !2994)
!2994 = !{null, !33, !7, !7, !21, !21, !21, !7, !7}
!2995 = !DILocalVariable(name: "obj", arg: 1, scope: !2992, file: !31, line: 1564, type: !33)
!2996 = !DILocation(line: 1564, column: 45, scope: !2992)
!2997 = !DILocalVariable(name: "laser_type", arg: 2, scope: !2992, file: !31, line: 1564, type: !7)
!2998 = !DILocation(line: 1564, column: 54, scope: !2992)
!2999 = !DILocalVariable(name: "gun_num", arg: 3, scope: !2992, file: !31, line: 1564, type: !7)
!3000 = !DILocation(line: 1564, column: 70, scope: !2992)
!3001 = !DILocalVariable(name: "spreadr", arg: 4, scope: !2992, file: !31, line: 1564, type: !21)
!3002 = !DILocation(line: 1564, column: 83, scope: !2992)
!3003 = !DILocalVariable(name: "spreadu", arg: 5, scope: !2992, file: !31, line: 1564, type: !21)
!3004 = !DILocation(line: 1564, column: 96, scope: !2992)
!3005 = !DILocalVariable(name: "delay_time", arg: 6, scope: !2992, file: !31, line: 1564, type: !21)
!3006 = !DILocation(line: 1564, column: 109, scope: !2992)
!3007 = !DILocalVariable(name: "make_sound", arg: 7, scope: !2992, file: !31, line: 1564, type: !7)
!3008 = !DILocation(line: 1564, column: 125, scope: !2992)
!3009 = !DILocalVariable(name: "harmless", arg: 8, scope: !2992, file: !31, line: 1564, type: !7)
!3010 = !DILocation(line: 1564, column: 141, scope: !2992)
!3011 = !DILocalVariable(name: "LaserSeg", scope: !2992, file: !31, line: 1566, type: !7)
!3012 = !DILocation(line: 1566, column: 8, scope: !2992)
!3013 = !DILocalVariable(name: "Fate", scope: !2992, file: !31, line: 1566, type: !7)
!3014 = !DILocation(line: 1566, column: 18, scope: !2992)
!3015 = !DILocalVariable(name: "LaserPos", scope: !2992, file: !31, line: 1567, type: !54)
!3016 = !DILocation(line: 1567, column: 13, scope: !2992)
!3017 = !DILocalVariable(name: "LaserDir", scope: !2992, file: !31, line: 1567, type: !54)
!3018 = !DILocation(line: 1567, column: 23, scope: !2992)
!3019 = !DILocalVariable(name: "fq", scope: !2992, file: !31, line: 1568, type: !1457)
!3020 = !DILocation(line: 1568, column: 12, scope: !2992)
!3021 = !DILocalVariable(name: "hit_data", scope: !2992, file: !31, line: 1569, type: !1471)
!3022 = !DILocation(line: 1569, column: 12, scope: !2992)
!3023 = !DILocalVariable(name: "gun_point", scope: !2992, file: !31, line: 1570, type: !54)
!3024 = !DILocation(line: 1570, column: 13, scope: !2992)
!3025 = !DILocalVariable(name: "pnt", scope: !2992, file: !31, line: 1570, type: !733)
!3026 = !DILocation(line: 1570, column: 25, scope: !2992)
!3027 = !DILocalVariable(name: "m", scope: !2992, file: !31, line: 1571, type: !62)
!3028 = !DILocation(line: 1571, column: 13, scope: !2992)
!3029 = !DILocalVariable(name: "objnum", scope: !2992, file: !31, line: 1572, type: !7)
!3030 = !DILocation(line: 1572, column: 8, scope: !2992)
!3031 = !DILocation(line: 1574, column: 25, scope: !2992)
!3032 = !DILocation(line: 1574, column: 2, scope: !2992)
!3033 = !DILocation(line: 1577, column: 9, scope: !2992)
!3034 = !DILocation(line: 1577, column: 22, scope: !2992)
!3035 = !DILocation(line: 1577, column: 33, scope: !2992)
!3036 = !DILocation(line: 1577, column: 6, scope: !2992)
!3037 = !DILocation(line: 1579, column: 31, scope: !2992)
!3038 = !DILocation(line: 1579, column: 36, scope: !2992)
!3039 = !DILocation(line: 1579, column: 2, scope: !2992)
!3040 = !DILocation(line: 1580, column: 27, scope: !2992)
!3041 = !DILocation(line: 1580, column: 2, scope: !2992)
!3042 = !DILocation(line: 1582, column: 24, scope: !2992)
!3043 = !DILocation(line: 1582, column: 29, scope: !2992)
!3044 = !DILocation(line: 1582, column: 2, scope: !2992)
!3045 = !DILocation(line: 1585, column: 6, scope: !3046)
!3046 = distinct !DILexicalBlock(scope: !2992, file: !31, line: 1585, column: 6)
!3047 = !DILocation(line: 1586, column: 33, scope: !3046)
!3048 = !DILocation(line: 1586, column: 38, scope: !3046)
!3049 = !DILocation(line: 1586, column: 45, scope: !3046)
!3050 = !DILocation(line: 1586, column: 59, scope: !3046)
!3051 = !DILocation(line: 1586, column: 83, scope: !3046)
!3052 = !DILocation(line: 1586, column: 71, scope: !3046)
!3053 = !DILocation(line: 1586, column: 95, scope: !3046)
!3054 = !DILocation(line: 1586, column: 101, scope: !3046)
!3055 = !DILocation(line: 1586, column: 52, scope: !3046)
!3056 = !DILocation(line: 1586, column: 51, scope: !3046)
!3057 = !DILocation(line: 1586, column: 3, scope: !3046)
!3058 = !DILocation(line: 1591, column: 16, scope: !2992)
!3059 = !DILocation(line: 1591, column: 21, scope: !2992)
!3060 = !DILocation(line: 1591, column: 5, scope: !2992)
!3061 = !DILocation(line: 1591, column: 13, scope: !2992)
!3062 = !DILocation(line: 1592, column: 19, scope: !2992)
!3063 = !DILocation(line: 1592, column: 24, scope: !2992)
!3064 = !DILocation(line: 1592, column: 5, scope: !2992)
!3065 = !DILocation(line: 1592, column: 17, scope: !2992)
!3066 = !DILocation(line: 1593, column: 5, scope: !2992)
!3067 = !DILocation(line: 1593, column: 13, scope: !2992)
!3068 = !DILocation(line: 1594, column: 5, scope: !2992)
!3069 = !DILocation(line: 1594, column: 13, scope: !2992)
!3070 = !DILocation(line: 1595, column: 20, scope: !2992)
!3071 = !DILocation(line: 1595, column: 23, scope: !2992)
!3072 = !DILocation(line: 1595, column: 5, scope: !2992)
!3073 = !DILocation(line: 1595, column: 18, scope: !2992)
!3074 = !DILocation(line: 1596, column: 5, scope: !2992)
!3075 = !DILocation(line: 1596, column: 21, scope: !2992)
!3076 = !DILocation(line: 1597, column: 5, scope: !2992)
!3077 = !DILocation(line: 1597, column: 15, scope: !2992)
!3078 = !DILocation(line: 1599, column: 9, scope: !2992)
!3079 = !DILocation(line: 1599, column: 7, scope: !2992)
!3080 = !DILocation(line: 1601, column: 22, scope: !2992)
!3081 = !DILocation(line: 1601, column: 11, scope: !2992)
!3082 = !DILocation(line: 1603, column: 6, scope: !3083)
!3083 = distinct !DILexicalBlock(scope: !2992, file: !31, line: 1603, column: 6)
!3084 = !DILocation(line: 1603, column: 15, scope: !3083)
!3085 = !DILocation(line: 1604, column: 3, scope: !3083)
!3086 = !DILocation(line: 1607, column: 37, scope: !3087)
!3087 = distinct !DILexicalBlock(scope: !2992, file: !31, line: 1607, column: 7)
!3088 = !DILocation(line: 1607, column: 42, scope: !3087)
!3089 = !DILocation(line: 1607, column: 7, scope: !3087)
!3090 = !DILocation(line: 1607, column: 47, scope: !3087)
!3091 = !DILocation(line: 1608, column: 3, scope: !3087)
!3092 = !DILocation(line: 1610, column: 6, scope: !3093)
!3093 = distinct !DILexicalBlock(scope: !2992, file: !31, line: 1610, column: 6)
!3094 = !DILocation(line: 1610, column: 10, scope: !3093)
!3095 = !DILocation(line: 1612, column: 7, scope: !3096)
!3096 = distinct !DILexicalBlock(scope: !3097, file: !31, line: 1612, column: 7)
!3097 = distinct !DILexicalBlock(scope: !3093, file: !31, line: 1611, column: 2)
!3098 = !DILocation(line: 1613, column: 4, scope: !3096)
!3099 = !DILocation(line: 1615, column: 4, scope: !3096)
!3100 = !DILocation(line: 1616, column: 3, scope: !3097)
!3101 = !DILocation(line: 1619, column: 6, scope: !3102)
!3102 = distinct !DILexicalBlock(scope: !2992, file: !31, line: 1619, column: 6)
!3103 = !DILocation(line: 1619, column: 10, scope: !3102)
!3104 = !DILocation(line: 1623, column: 3, scope: !3105)
!3105 = distinct !DILexicalBlock(scope: !3102, file: !31, line: 1620, column: 2)
!3106 = !DILocation(line: 1628, column: 2, scope: !3105)
!3107 = !DILocation(line: 1631, column: 13, scope: !2992)
!3108 = !DILocation(line: 1631, column: 18, scope: !2992)
!3109 = !DILocation(line: 1631, column: 25, scope: !2992)
!3110 = !DILocation(line: 1631, column: 11, scope: !2992)
!3111 = !DILocation(line: 1632, column: 7, scope: !3112)
!3112 = distinct !DILexicalBlock(scope: !2992, file: !31, line: 1632, column: 6)
!3113 = !DILocation(line: 1632, column: 15, scope: !3112)
!3114 = !DILocation(line: 1632, column: 21, scope: !3112)
!3115 = !DILocation(line: 1632, column: 25, scope: !3112)
!3116 = !DILocation(line: 1632, column: 33, scope: !3112)
!3117 = !DILocation(line: 1634, column: 33, scope: !3118)
!3118 = distinct !DILexicalBlock(scope: !3112, file: !31, line: 1633, column: 2)
!3119 = !DILocation(line: 1634, column: 38, scope: !3118)
!3120 = !DILocation(line: 1634, column: 45, scope: !3118)
!3121 = !DILocation(line: 1634, column: 51, scope: !3118)
!3122 = !DILocation(line: 1634, column: 3, scope: !3118)
!3123 = !DILocation(line: 1635, column: 33, scope: !3118)
!3124 = !DILocation(line: 1635, column: 38, scope: !3118)
!3125 = !DILocation(line: 1635, column: 45, scope: !3118)
!3126 = !DILocation(line: 1635, column: 51, scope: !3118)
!3127 = !DILocation(line: 1635, column: 3, scope: !3118)
!3128 = !DILocation(line: 1636, column: 2, scope: !3118)
!3129 = !DILocation(line: 1638, column: 51, scope: !2992)
!3130 = !DILocation(line: 1638, column: 61, scope: !2992)
!3131 = !DILocation(line: 1638, column: 64, scope: !2992)
!3132 = !DILocation(line: 1638, column: 74, scope: !2992)
!3133 = !DILocation(line: 1638, column: 86, scope: !2992)
!3134 = !DILocation(line: 1638, column: 11, scope: !2992)
!3135 = !DILocation(line: 1638, column: 9, scope: !2992)
!3136 = !DILocation(line: 1641, column: 6, scope: !3137)
!3137 = distinct !DILexicalBlock(scope: !2992, file: !31, line: 1641, column: 6)
!3138 = !DILocation(line: 1641, column: 17, scope: !3137)
!3139 = !DILocation(line: 1642, column: 3, scope: !3137)
!3140 = !DILocation(line: 1644, column: 6, scope: !3141)
!3141 = distinct !DILexicalBlock(scope: !2992, file: !31, line: 1644, column: 6)
!3142 = !DILocation(line: 1644, column: 13, scope: !3141)
!3143 = !DILocation(line: 1645, column: 3, scope: !3141)
!3144 = !DILocation(line: 1647, column: 6, scope: !3145)
!3145 = distinct !DILexicalBlock(scope: !2992, file: !31, line: 1647, column: 6)
!3146 = !DILocation(line: 1647, column: 16, scope: !3145)
!3147 = !DILocation(line: 1647, column: 32, scope: !3145)
!3148 = !DILocation(line: 1647, column: 35, scope: !3145)
!3149 = !DILocation(line: 1649, column: 3, scope: !3150)
!3150 = distinct !DILexicalBlock(scope: !3145, file: !31, line: 1648, column: 2)
!3151 = !DILocation(line: 1650, column: 36, scope: !3150)
!3152 = !DILocation(line: 1650, column: 28, scope: !3150)
!3153 = !DILocation(line: 1650, column: 18, scope: !3150)
!3154 = !DILocation(line: 1650, column: 23, scope: !3150)
!3155 = !DILocation(line: 1650, column: 3, scope: !3150)
!3156 = !DILocation(line: 1650, column: 26, scope: !3150)
!3157 = !DILocation(line: 1651, column: 2, scope: !3150)
!3158 = !DILocation(line: 1653, column: 17, scope: !2992)
!3159 = !DILocation(line: 1655, column: 6, scope: !3160)
!3160 = distinct !DILexicalBlock(scope: !2992, file: !31, line: 1655, column: 6)
!3161 = !DILocation(line: 1655, column: 17, scope: !3160)
!3162 = !DILocation(line: 1655, column: 34, scope: !3160)
!3163 = !DILocation(line: 1656, column: 5, scope: !3160)
!3164 = !DILocation(line: 1656, column: 16, scope: !3160)
!3165 = !DILocation(line: 1656, column: 29, scope: !3160)
!3166 = !DILocation(line: 1657, column: 5, scope: !3160)
!3167 = !DILocation(line: 1657, column: 16, scope: !3160)
!3168 = !DILocation(line: 1657, column: 28, scope: !3160)
!3169 = !DILocation(line: 1658, column: 5, scope: !3160)
!3170 = !DILocation(line: 1658, column: 16, scope: !3160)
!3171 = !DILocation(line: 1658, column: 27, scope: !3160)
!3172 = !DILocation(line: 1659, column: 5, scope: !3160)
!3173 = !DILocation(line: 1659, column: 16, scope: !3160)
!3174 = !DILocation(line: 1659, column: 28, scope: !3160)
!3175 = !DILocation(line: 1662, column: 5, scope: !3160)
!3176 = !DILocation(line: 1662, column: 16, scope: !3160)
!3177 = !DILocation(line: 1662, column: 30, scope: !3160)
!3178 = !DILocation(line: 1663, column: 5, scope: !3160)
!3179 = !DILocation(line: 1663, column: 16, scope: !3160)
!3180 = !DILocation(line: 1664, column: 7, scope: !3181)
!3181 = distinct !DILexicalBlock(scope: !3160, file: !31, line: 1664, column: 7)
!3182 = !DILocation(line: 1664, column: 22, scope: !3181)
!3183 = !DILocation(line: 1664, column: 30, scope: !3181)
!3184 = !DILocation(line: 1664, column: 33, scope: !3181)
!3185 = !DILocation(line: 1664, column: 38, scope: !3181)
!3186 = !DILocation(line: 1664, column: 42, scope: !3181)
!3187 = !DILocation(line: 1664, column: 40, scope: !3181)
!3188 = !DILocation(line: 1665, column: 30, scope: !3181)
!3189 = !DILocation(line: 1665, column: 22, scope: !3181)
!3190 = !DILocation(line: 1665, column: 19, scope: !3181)
!3191 = !DILocation(line: 1665, column: 4, scope: !3181)
!3192 = !DILocation(line: 1668, column: 7, scope: !3193)
!3193 = distinct !DILexicalBlock(scope: !2992, file: !31, line: 1668, column: 6)
!3194 = !DILocation(line: 1668, column: 6, scope: !3193)
!3195 = !DILocation(line: 1669, column: 11, scope: !3193)
!3196 = !DILocation(line: 1669, column: 3, scope: !3193)
!3197 = !DILocation(line: 1669, column: 19, scope: !3193)
!3198 = !DILocation(line: 1669, column: 25, scope: !3193)
!3199 = !DILocation(line: 1672, column: 6, scope: !3200)
!3200 = distinct !DILexicalBlock(scope: !2992, file: !31, line: 1672, column: 6)
!3201 = !DILocation(line: 1673, column: 11, scope: !3200)
!3202 = !DILocation(line: 1673, column: 3, scope: !3200)
!3203 = !DILocation(line: 1673, column: 19, scope: !3200)
!3204 = !DILocation(line: 1673, column: 25, scope: !3200)
!3205 = !DILocation(line: 1677, column: 7, scope: !3206)
!3206 = distinct !DILexicalBlock(scope: !2992, file: !31, line: 1677, column: 6)
!3207 = !DILocation(line: 1677, column: 14, scope: !3206)
!3208 = !DILocation(line: 1677, column: 11, scope: !3206)
!3209 = !DILocation(line: 1677, column: 29, scope: !3206)
!3210 = !DILocation(line: 1677, column: 42, scope: !3206)
!3211 = !DILocation(line: 1677, column: 34, scope: !3206)
!3212 = !DILocation(line: 1677, column: 50, scope: !3206)
!3213 = !DILocation(line: 1677, column: 53, scope: !3206)
!3214 = !DILocation(line: 1677, column: 70, scope: !3206)
!3215 = !DILocation(line: 1677, column: 82, scope: !3206)
!3216 = !DILocation(line: 1677, column: 74, scope: !3206)
!3217 = !DILocation(line: 1677, column: 90, scope: !3206)
!3218 = !DILocation(line: 1677, column: 93, scope: !3206)
!3219 = !DILocation(line: 1678, column: 35, scope: !3206)
!3220 = !DILocation(line: 1678, column: 33, scope: !3206)
!3221 = !DILocation(line: 1678, column: 3, scope: !3206)
!3222 = !DILocation(line: 1680, column: 18, scope: !3223)
!3223 = distinct !DILexicalBlock(scope: !2992, file: !31, line: 1680, column: 6)
!3224 = !DILocation(line: 1680, column: 6, scope: !3223)
!3225 = !DILocation(line: 1680, column: 30, scope: !3223)
!3226 = !DILocation(line: 1682, column: 7, scope: !3227)
!3227 = distinct !DILexicalBlock(scope: !3228, file: !31, line: 1682, column: 7)
!3228 = distinct !DILexicalBlock(scope: !3223, file: !31, line: 1681, column: 2)
!3229 = !DILocation(line: 1682, column: 14, scope: !3227)
!3230 = !DILocation(line: 1682, column: 11, scope: !3227)
!3231 = !DILocation(line: 1684, column: 89, scope: !3232)
!3232 = distinct !DILexicalBlock(scope: !3227, file: !31, line: 1683, column: 3)
!3233 = !DILocation(line: 1684, column: 81, scope: !3232)
!3234 = !DILocation(line: 1684, column: 50, scope: !3232)
!3235 = !DILocation(line: 1684, column: 12, scope: !3232)
!3236 = !DILocation(line: 1684, column: 4, scope: !3232)
!3237 = !DILocation(line: 1684, column: 20, scope: !3232)
!3238 = !DILocation(line: 1684, column: 37, scope: !3232)
!3239 = !DILocation(line: 1684, column: 48, scope: !3232)
!3240 = !DILocation(line: 1688, column: 3, scope: !3232)
!3241 = !DILocation(line: 1697, column: 2, scope: !3228)
!3242 = !DILocation(line: 1698, column: 1, scope: !2992)
!3243 = distinct !DISubprogram(name: "Laser_player_fire_spread", linkageName: "_Z24Laser_player_fire_spreadP6objectiiiiii", scope: !31, file: !31, line: 1701, type: !3244, scopeLine: 1702, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !320)
!3244 = !DISubroutineType(types: !3245)
!3245 = !{null, !33, !7, !7, !21, !21, !7, !7}
!3246 = !DILocalVariable(name: "obj", arg: 1, scope: !3243, file: !31, line: 1701, type: !33)
!3247 = !DILocation(line: 1701, column: 39, scope: !3243)
!3248 = !DILocalVariable(name: "laser_type", arg: 2, scope: !3243, file: !31, line: 1701, type: !7)
!3249 = !DILocation(line: 1701, column: 48, scope: !3243)
!3250 = !DILocalVariable(name: "gun_num", arg: 3, scope: !3243, file: !31, line: 1701, type: !7)
!3251 = !DILocation(line: 1701, column: 64, scope: !3243)
!3252 = !DILocalVariable(name: "spreadr", arg: 4, scope: !3243, file: !31, line: 1701, type: !21)
!3253 = !DILocation(line: 1701, column: 77, scope: !3243)
!3254 = !DILocalVariable(name: "spreadu", arg: 5, scope: !3243, file: !31, line: 1701, type: !21)
!3255 = !DILocation(line: 1701, column: 90, scope: !3243)
!3256 = !DILocalVariable(name: "make_sound", arg: 6, scope: !3243, file: !31, line: 1701, type: !7)
!3257 = !DILocation(line: 1701, column: 103, scope: !3243)
!3258 = !DILocalVariable(name: "harmless", arg: 7, scope: !3243, file: !31, line: 1701, type: !7)
!3259 = !DILocation(line: 1701, column: 119, scope: !3243)
!3260 = !DILocation(line: 1703, column: 33, scope: !3243)
!3261 = !DILocation(line: 1703, column: 38, scope: !3243)
!3262 = !DILocation(line: 1703, column: 50, scope: !3243)
!3263 = !DILocation(line: 1703, column: 59, scope: !3243)
!3264 = !DILocation(line: 1703, column: 68, scope: !3243)
!3265 = !DILocation(line: 1703, column: 80, scope: !3243)
!3266 = !DILocation(line: 1703, column: 92, scope: !3243)
!3267 = !DILocation(line: 1703, column: 2, scope: !3243)
!3268 = !DILocation(line: 1704, column: 1, scope: !3243)
!3269 = distinct !DISubprogram(name: "Laser_player_fire", linkageName: "_Z17Laser_player_fireP6objectiiii", scope: !31, file: !31, line: 1708, type: !3270, scopeLine: 1709, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !320)
!3270 = !DISubroutineType(types: !3271)
!3271 = !{null, !33, !7, !7, !7, !7}
!3272 = !DILocalVariable(name: "obj", arg: 1, scope: !3269, file: !31, line: 1708, type: !33)
!3273 = !DILocation(line: 1708, column: 32, scope: !3269)
!3274 = !DILocalVariable(name: "laser_type", arg: 2, scope: !3269, file: !31, line: 1708, type: !7)
!3275 = !DILocation(line: 1708, column: 41, scope: !3269)
!3276 = !DILocalVariable(name: "gun_num", arg: 3, scope: !3269, file: !31, line: 1708, type: !7)
!3277 = !DILocation(line: 1708, column: 57, scope: !3269)
!3278 = !DILocalVariable(name: "make_sound", arg: 4, scope: !3269, file: !31, line: 1708, type: !7)
!3279 = !DILocation(line: 1708, column: 70, scope: !3269)
!3280 = !DILocalVariable(name: "harmless", arg: 5, scope: !3269, file: !31, line: 1708, type: !7)
!3281 = !DILocation(line: 1708, column: 86, scope: !3269)
!3282 = !DILocation(line: 1710, column: 27, scope: !3269)
!3283 = !DILocation(line: 1710, column: 32, scope: !3269)
!3284 = !DILocation(line: 1710, column: 44, scope: !3269)
!3285 = !DILocation(line: 1710, column: 59, scope: !3269)
!3286 = !DILocation(line: 1710, column: 71, scope: !3269)
!3287 = !DILocation(line: 1710, column: 2, scope: !3269)
!3288 = !DILocation(line: 1711, column: 1, scope: !3269)
!3289 = distinct !DISubprogram(name: "Flare_create", linkageName: "_Z12Flare_createP6object", scope: !31, file: !31, line: 1714, type: !450, scopeLine: 1715, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !320)
!3290 = !DILocalVariable(name: "obj", arg: 1, scope: !3289, file: !31, line: 1714, type: !33)
!3291 = !DILocation(line: 1714, column: 27, scope: !3289)
!3292 = !DILocalVariable(name: "energy_usage", scope: !3289, file: !31, line: 1716, type: !21)
!3293 = !DILocation(line: 1716, column: 6, scope: !3289)
!3294 = !DILocation(line: 1718, column: 39, scope: !3289)
!3295 = !DILocation(line: 1718, column: 15, scope: !3289)
!3296 = !DILocation(line: 1720, column: 6, scope: !3297)
!3297 = distinct !DILexicalBlock(scope: !3289, file: !31, line: 1720, column: 6)
!3298 = !DILocation(line: 1720, column: 23, scope: !3297)
!3299 = !DILocation(line: 1721, column: 25, scope: !3297)
!3300 = !DILocation(line: 1721, column: 43, scope: !3297)
!3301 = !DILocation(line: 1721, column: 59, scope: !3297)
!3302 = !DILocation(line: 1721, column: 39, scope: !3297)
!3303 = !DILocation(line: 1721, column: 62, scope: !3297)
!3304 = !DILocation(line: 1721, column: 18, scope: !3297)
!3305 = !DILocation(line: 1721, column: 16, scope: !3297)
!3306 = !DILocation(line: 1721, column: 3, scope: !3297)
!3307 = !DILocation(line: 1725, column: 33, scope: !3289)
!3308 = !DILocation(line: 1725, column: 11, scope: !3289)
!3309 = !DILocation(line: 1725, column: 3, scope: !3289)
!3310 = !DILocation(line: 1725, column: 23, scope: !3289)
!3311 = !DILocation(line: 1725, column: 30, scope: !3289)
!3312 = !DILocation(line: 1727, column: 15, scope: !3313)
!3313 = distinct !DILexicalBlock(scope: !3289, file: !31, line: 1727, column: 7)
!3314 = !DILocation(line: 1727, column: 7, scope: !3313)
!3315 = !DILocation(line: 1727, column: 27, scope: !3313)
!3316 = !DILocation(line: 1727, column: 34, scope: !3313)
!3317 = !DILocation(line: 1729, column: 12, scope: !3318)
!3318 = distinct !DILexicalBlock(scope: !3313, file: !31, line: 1728, column: 3)
!3319 = !DILocation(line: 1729, column: 4, scope: !3318)
!3320 = !DILocation(line: 1729, column: 24, scope: !3318)
!3321 = !DILocation(line: 1729, column: 31, scope: !3318)
!3322 = !DILocation(line: 1731, column: 3, scope: !3318)
!3323 = !DILocation(line: 1733, column: 22, scope: !3289)
!3324 = !DILocation(line: 1733, column: 3, scope: !3289)
!3325 = !DILocation(line: 1745, column: 1, scope: !3289)
!3326 = distinct !DISubprogram(name: "homing_missile_turn_towards_velocity", linkageName: "_Z36homing_missile_turn_towards_velocityP6objectP10vms_vector", scope: !31, file: !31, line: 1751, type: !3327, scopeLine: 1752, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !320)
!3327 = !DISubroutineType(types: !3328)
!3328 = !{null, !33, !733}
!3329 = !DILocalVariable(name: "objp", arg: 1, scope: !3326, file: !31, line: 1751, type: !33)
!3330 = !DILocation(line: 1751, column: 51, scope: !3326)
!3331 = !DILocalVariable(name: "norm_vel", arg: 2, scope: !3326, file: !31, line: 1751, type: !733)
!3332 = !DILocation(line: 1751, column: 69, scope: !3326)
!3333 = !DILocalVariable(name: "new_fvec", scope: !3326, file: !31, line: 1763, type: !54)
!3334 = !DILocation(line: 1763, column: 13, scope: !3326)
!3335 = !DILocation(line: 1765, column: 14, scope: !3326)
!3336 = !DILocation(line: 1765, column: 11, scope: !3326)
!3337 = !DILocation(line: 1767, column: 26, scope: !3326)
!3338 = !DILocation(line: 1767, column: 35, scope: !3326)
!3339 = !DILocation(line: 1767, column: 2, scope: !3326)
!3340 = !DILocation(line: 1768, column: 26, scope: !3326)
!3341 = !DILocation(line: 1768, column: 32, scope: !3326)
!3342 = !DILocation(line: 1768, column: 39, scope: !3326)
!3343 = !DILocation(line: 1768, column: 2, scope: !3326)
!3344 = !DILocation(line: 1769, column: 2, scope: !3326)
!3345 = !DILocation(line: 1774, column: 22, scope: !3326)
!3346 = !DILocation(line: 1774, column: 28, scope: !3326)
!3347 = !DILocation(line: 1774, column: 2, scope: !3326)
!3348 = !DILocation(line: 1776, column: 1, scope: !3326)
!3349 = distinct !DISubprogram(name: "Laser_do_weapon_sequence", linkageName: "_Z24Laser_do_weapon_sequenceP6object", scope: !31, file: !31, line: 1780, type: !450, scopeLine: 1781, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !320)
!3350 = !DILocalVariable(name: "obj", arg: 1, scope: !3349, file: !31, line: 1780, type: !33)
!3351 = !DILocation(line: 1780, column: 39, scope: !3349)
!3352 = !DILocation(line: 1782, column: 2, scope: !3349)
!3353 = !DILocation(line: 1786, column: 6, scope: !3354)
!3354 = distinct !DILexicalBlock(scope: !3349, file: !31, line: 1786, column: 6)
!3355 = !DILocation(line: 1786, column: 11, scope: !3354)
!3356 = !DILocation(line: 1786, column: 20, scope: !3354)
!3357 = !DILocation(line: 1788, column: 7, scope: !3358)
!3358 = distinct !DILexicalBlock(scope: !3359, file: !31, line: 1788, column: 7)
!3359 = distinct !DILexicalBlock(scope: !3354, file: !31, line: 1787, column: 2)
!3360 = !DILocation(line: 1788, column: 17, scope: !3358)
!3361 = !DILocation(line: 1789, column: 4, scope: !3358)
!3362 = !DILocation(line: 1789, column: 9, scope: !3358)
!3363 = !DILocation(line: 1789, column: 18, scope: !3358)
!3364 = !DILocation(line: 1791, column: 4, scope: !3358)
!3365 = !DILocation(line: 1791, column: 9, scope: !3358)
!3366 = !DILocation(line: 1791, column: 18, scope: !3358)
!3367 = !DILocation(line: 1792, column: 3, scope: !3359)
!3368 = !DILocation(line: 1792, column: 8, scope: !3359)
!3369 = !DILocation(line: 1792, column: 20, scope: !3359)
!3370 = !DILocation(line: 1793, column: 2, scope: !3359)
!3371 = !DILocation(line: 1795, column: 6, scope: !3372)
!3372 = distinct !DILexicalBlock(scope: !3349, file: !31, line: 1795, column: 6)
!3373 = !DILocation(line: 1795, column: 11, scope: !3372)
!3374 = !DILocation(line: 1795, column: 20, scope: !3372)
!3375 = !DILocation(line: 1797, column: 3, scope: !3376)
!3376 = distinct !DILexicalBlock(scope: !3372, file: !31, line: 1796, column: 2)
!3377 = !DILocation(line: 1797, column: 8, scope: !3376)
!3378 = !DILocation(line: 1797, column: 14, scope: !3376)
!3379 = !DILocation(line: 1798, column: 20, scope: !3380)
!3380 = distinct !DILexicalBlock(scope: !3376, file: !31, line: 1798, column: 8)
!3381 = !DILocation(line: 1798, column: 25, scope: !3380)
!3382 = !DILocation(line: 1798, column: 8, scope: !3380)
!3383 = !DILocation(line: 1798, column: 29, scope: !3380)
!3384 = !DILocation(line: 1799, column: 26, scope: !3380)
!3385 = !DILocation(line: 1799, column: 31, scope: !3380)
!3386 = !DILocation(line: 1799, column: 36, scope: !3380)
!3387 = !DILocation(line: 1799, column: 4, scope: !3380)
!3388 = !DILocation(line: 1800, column: 3, scope: !3376)
!3389 = !DILocation(line: 1804, column: 10, scope: !3390)
!3390 = distinct !DILexicalBlock(scope: !3349, file: !31, line: 1804, column: 7)
!3391 = !DILocation(line: 1804, column: 23, scope: !3390)
!3392 = !DILocation(line: 1804, column: 28, scope: !3390)
!3393 = !DILocation(line: 1804, column: 21, scope: !3390)
!3394 = !DILocation(line: 1804, column: 39, scope: !3390)
!3395 = !DILocation(line: 1804, column: 8, scope: !3390)
!3396 = !DILocation(line: 1804, column: 44, scope: !3390)
!3397 = !DILocation(line: 1805, column: 5, scope: !3390)
!3398 = !DILocation(line: 1805, column: 10, scope: !3390)
!3399 = !DILocation(line: 1805, column: 13, scope: !3390)
!3400 = !DILocation(line: 1805, column: 26, scope: !3390)
!3401 = !DILocation(line: 1806, column: 17, scope: !3390)
!3402 = !DILocation(line: 1806, column: 22, scope: !3390)
!3403 = !DILocation(line: 1806, column: 5, scope: !3390)
!3404 = !DILocation(line: 1806, column: 26, scope: !3390)
!3405 = !DILocation(line: 1806, column: 32, scope: !3390)
!3406 = !DILocation(line: 1806, column: 50, scope: !3390)
!3407 = !DILocation(line: 1806, column: 55, scope: !3390)
!3408 = !DILocation(line: 1807, column: 23, scope: !3390)
!3409 = !DILocation(line: 1807, column: 28, scope: !3390)
!3410 = !DILocation(line: 1807, column: 44, scope: !3390)
!3411 = !DILocation(line: 1807, column: 5, scope: !3390)
!3412 = !DILocation(line: 1807, column: 54, scope: !3390)
!3413 = !DILocation(line: 1808, column: 14, scope: !3414)
!3414 = distinct !DILexicalBlock(scope: !3390, file: !31, line: 1807, column: 63)
!3415 = !DILocation(line: 1808, column: 17, scope: !3414)
!3416 = !DILocation(line: 1808, column: 3, scope: !3414)
!3417 = !DILocation(line: 1809, column: 3, scope: !3414)
!3418 = !DILocation(line: 1812, column: 7, scope: !3419)
!3419 = distinct !DILexicalBlock(scope: !3349, file: !31, line: 1812, column: 7)
!3420 = !DILocation(line: 1812, column: 12, scope: !3419)
!3421 = !DILocation(line: 1812, column: 15, scope: !3419)
!3422 = !DILocation(line: 1814, column: 27, scope: !3423)
!3423 = distinct !DILexicalBlock(scope: !3419, file: !31, line: 1813, column: 2)
!3424 = !DILocation(line: 1814, column: 32, scope: !3423)
!3425 = !DILocation(line: 1814, column: 48, scope: !3423)
!3426 = !DILocation(line: 1814, column: 3, scope: !3423)
!3427 = !DILocation(line: 1815, column: 17, scope: !3423)
!3428 = !DILocation(line: 1815, column: 22, scope: !3423)
!3429 = !DILocation(line: 1815, column: 38, scope: !3423)
!3430 = !DILocation(line: 1815, column: 60, scope: !3423)
!3431 = !DILocation(line: 1815, column: 65, scope: !3423)
!3432 = !DILocation(line: 1815, column: 48, scope: !3423)
!3433 = !DILocation(line: 1815, column: 69, scope: !3423)
!3434 = !DILocation(line: 1815, column: 75, scope: !3423)
!3435 = !DILocation(line: 1815, column: 3, scope: !3423)
!3436 = !DILocation(line: 1816, column: 2, scope: !3423)
!3437 = !DILocation(line: 1850, column: 18, scope: !3438)
!3438 = distinct !DILexicalBlock(scope: !3349, file: !31, line: 1850, column: 6)
!3439 = !DILocation(line: 1850, column: 23, scope: !3438)
!3440 = !DILocation(line: 1850, column: 6, scope: !3438)
!3441 = !DILocation(line: 1850, column: 27, scope: !3438)
!3442 = !DILocation(line: 1850, column: 39, scope: !3438)
!3443 = !DILocation(line: 1850, column: 44, scope: !3438)
!3444 = !DILocation(line: 1850, column: 49, scope: !3438)
!3445 = !DILocation(line: 1850, column: 51, scope: !3438)
!3446 = !DILocation(line: 1850, column: 67, scope: !3438)
!3447 = !DILocation(line: 1850, column: 70, scope: !3438)
!3448 = !DILocation(line: 1850, column: 98, scope: !3438)
!3449 = !DILocation(line: 1850, column: 103, scope: !3438)
!3450 = !DILocation(line: 1850, column: 120, scope: !3438)
!3451 = !DILocation(line: 1850, column: 90, scope: !3438)
!3452 = !DILocation(line: 1850, column: 132, scope: !3438)
!3453 = !DILocation(line: 1850, column: 75, scope: !3438)
!3454 = !DILocation(line: 1850, column: 73, scope: !3438)
!3455 = !DILocation(line: 1850, column: 136, scope: !3438)
!3456 = !DILocation(line: 1850, column: 139, scope: !3438)
!3457 = !DILocation(line: 1850, column: 144, scope: !3438)
!3458 = !DILocation(line: 1850, column: 178, scope: !3438)
!3459 = !DILocation(line: 1850, column: 183, scope: !3438)
!3460 = !DILocation(line: 1850, column: 200, scope: !3438)
!3461 = !DILocation(line: 1850, column: 170, scope: !3438)
!3462 = !DILocation(line: 1850, column: 212, scope: !3438)
!3463 = !DILocation(line: 1850, column: 155, scope: !3438)
!3464 = !DILocation(line: 1850, column: 217, scope: !3438)
!3465 = !DILocation(line: 1850, column: 153, scope: !3438)
!3466 = !DILocalVariable(name: "vector_to_object", scope: !3467, file: !31, line: 1852, type: !54)
!3467 = distinct !DILexicalBlock(scope: !3438, file: !31, line: 1851, column: 2)
!3468 = !DILocation(line: 1852, column: 15, scope: !3467)
!3469 = !DILocalVariable(name: "temp_vec", scope: !3467, file: !31, line: 1852, type: !54)
!3470 = !DILocation(line: 1852, column: 33, scope: !3467)
!3471 = !DILocalVariable(name: "dot", scope: !3467, file: !31, line: 1853, type: !21)
!3472 = !DILocation(line: 1853, column: 10, scope: !3467)
!3473 = !DILocalVariable(name: "speed", scope: !3467, file: !31, line: 1854, type: !21)
!3474 = !DILocation(line: 1854, column: 10, scope: !3467)
!3475 = !DILocalVariable(name: "max_speed", scope: !3467, file: !31, line: 1854, type: !21)
!3476 = !DILocation(line: 1854, column: 17, scope: !3467)
!3477 = !DILocation(line: 1857, column: 7, scope: !3478)
!3478 = distinct !DILexicalBlock(scope: !3467, file: !31, line: 1857, column: 7)
!3479 = !DILocation(line: 1857, column: 12, scope: !3478)
!3480 = !DILocation(line: 1857, column: 29, scope: !3478)
!3481 = !DILocation(line: 1857, column: 43, scope: !3478)
!3482 = !DILocation(line: 1857, column: 76, scope: !3478)
!3483 = !DILocation(line: 1857, column: 74, scope: !3478)
!3484 = !DILocalVariable(name: "track_goal", scope: !3485, file: !31, line: 1859, type: !7)
!3485 = distinct !DILexicalBlock(scope: !3478, file: !31, line: 1858, column: 3)
!3486 = !DILocation(line: 1859, column: 8, scope: !3485)
!3487 = !DILocation(line: 1859, column: 21, scope: !3485)
!3488 = !DILocation(line: 1859, column: 26, scope: !3485)
!3489 = !DILocation(line: 1859, column: 43, scope: !3485)
!3490 = !DILocation(line: 1864, column: 9, scope: !3491)
!3491 = distinct !DILexicalBlock(scope: !3485, file: !31, line: 1864, column: 8)
!3492 = !DILocation(line: 1864, column: 14, scope: !3491)
!3493 = !DILocation(line: 1864, column: 17, scope: !3491)
!3494 = !DILocation(line: 1864, column: 48, scope: !3491)
!3495 = !DILocation(line: 1864, column: 52, scope: !3491)
!3496 = !DILocation(line: 1864, column: 57, scope: !3491)
!3497 = !DILocation(line: 1864, column: 60, scope: !3491)
!3498 = !DILocation(line: 1864, column: 86, scope: !3491)
!3499 = !DILocation(line: 1864, column: 90, scope: !3491)
!3500 = !DILocation(line: 1864, column: 95, scope: !3491)
!3501 = !DILocation(line: 1864, column: 98, scope: !3491)
!3502 = !DILocation(line: 1864, column: 123, scope: !3491)
!3503 = !DILocation(line: 1864, column: 127, scope: !3491)
!3504 = !DILocation(line: 1864, column: 132, scope: !3491)
!3505 = !DILocation(line: 1864, column: 135, scope: !3491)
!3506 = !DILocation(line: 1864, column: 162, scope: !3491)
!3507 = !DILocation(line: 1864, column: 166, scope: !3491)
!3508 = !DILocation(line: 1864, column: 171, scope: !3491)
!3509 = !DILocation(line: 1864, column: 174, scope: !3491)
!3510 = !DILocation(line: 1867, column: 5, scope: !3511)
!3511 = distinct !DILexicalBlock(scope: !3491, file: !31, line: 1865, column: 4)
!3512 = !DILocation(line: 1867, column: 10, scope: !3511)
!3513 = !DILocation(line: 1867, column: 26, scope: !3511)
!3514 = !DILocation(line: 1867, column: 32, scope: !3511)
!3515 = !DILocation(line: 1868, column: 4, scope: !3511)
!3516 = !DILocation(line: 1871, column: 34, scope: !3485)
!3517 = !DILocation(line: 1871, column: 46, scope: !3485)
!3518 = !DILocation(line: 1871, column: 17, scope: !3485)
!3519 = !DILocation(line: 1871, column: 15, scope: !3485)
!3520 = !DILocation(line: 1875, column: 8, scope: !3521)
!3521 = distinct !DILexicalBlock(scope: !3485, file: !31, line: 1875, column: 8)
!3522 = !DILocation(line: 1875, column: 30, scope: !3521)
!3523 = !DILocation(line: 1875, column: 22, scope: !3521)
!3524 = !DILocation(line: 1875, column: 42, scope: !3521)
!3525 = !DILocation(line: 1875, column: 19, scope: !3521)
!3526 = !DILocalVariable(name: "dist_to_player", scope: !3527, file: !31, line: 1877, type: !21)
!3527 = distinct !DILexicalBlock(scope: !3521, file: !31, line: 1876, column: 4)
!3528 = !DILocation(line: 1877, column: 9, scope: !3527)
!3529 = !DILocation(line: 1879, column: 41, scope: !3527)
!3530 = !DILocation(line: 1879, column: 46, scope: !3527)
!3531 = !DILocation(line: 1879, column: 60, scope: !3527)
!3532 = !DILocation(line: 1879, column: 52, scope: !3527)
!3533 = !DILocation(line: 1879, column: 72, scope: !3527)
!3534 = !DILocation(line: 1879, column: 22, scope: !3527)
!3535 = !DILocation(line: 1879, column: 20, scope: !3527)
!3536 = !DILocation(line: 1880, column: 10, scope: !3537)
!3537 = distinct !DILexicalBlock(scope: !3527, file: !31, line: 1880, column: 9)
!3538 = !DILocation(line: 1880, column: 35, scope: !3537)
!3539 = !DILocation(line: 1880, column: 27, scope: !3537)
!3540 = !DILocation(line: 1880, column: 47, scope: !3537)
!3541 = !DILocation(line: 1880, column: 25, scope: !3537)
!3542 = !DILocation(line: 1880, column: 67, scope: !3537)
!3543 = !DILocation(line: 1880, column: 79, scope: !3537)
!3544 = !DILocation(line: 1880, column: 71, scope: !3537)
!3545 = !DILocation(line: 1880, column: 91, scope: !3537)
!3546 = !DILocation(line: 1880, column: 110, scope: !3537)
!3547 = !DILocation(line: 1881, column: 47, scope: !3537)
!3548 = !DILocation(line: 1881, column: 14, scope: !3537)
!3549 = !DILocation(line: 1881, column: 6, scope: !3537)
!3550 = !DILocation(line: 1881, column: 26, scope: !3537)
!3551 = !DILocation(line: 1881, column: 45, scope: !3537)
!3552 = !DILocation(line: 1883, column: 4, scope: !3527)
!3553 = !DILocation(line: 1885, column: 8, scope: !3554)
!3554 = distinct !DILexicalBlock(scope: !3485, file: !31, line: 1885, column: 8)
!3555 = !DILocation(line: 1885, column: 19, scope: !3554)
!3556 = !DILocation(line: 1921, column: 44, scope: !3557)
!3557 = distinct !DILexicalBlock(scope: !3554, file: !31, line: 1886, column: 4)
!3558 = !DILocation(line: 1921, column: 36, scope: !3557)
!3559 = !DILocation(line: 1921, column: 56, scope: !3557)
!3560 = !DILocation(line: 1921, column: 62, scope: !3557)
!3561 = !DILocation(line: 1921, column: 67, scope: !3557)
!3562 = !DILocation(line: 1921, column: 5, scope: !3557)
!3563 = !DILocation(line: 1923, column: 5, scope: !3557)
!3564 = !DILocation(line: 1924, column: 16, scope: !3557)
!3565 = !DILocation(line: 1924, column: 21, scope: !3557)
!3566 = !DILocation(line: 1924, column: 37, scope: !3557)
!3567 = !DILocation(line: 1924, column: 14, scope: !3557)
!3568 = !DILocation(line: 1925, column: 13, scope: !3557)
!3569 = !DILocation(line: 1925, column: 11, scope: !3557)
!3570 = !DILocation(line: 1926, column: 29, scope: !3557)
!3571 = !DILocation(line: 1926, column: 34, scope: !3557)
!3572 = !DILocation(line: 1926, column: 17, scope: !3557)
!3573 = !DILocation(line: 1926, column: 38, scope: !3557)
!3574 = !DILocation(line: 1926, column: 44, scope: !3557)
!3575 = !DILocation(line: 1926, column: 15, scope: !3557)
!3576 = !DILocation(line: 1927, column: 9, scope: !3577)
!3577 = distinct !DILexicalBlock(scope: !3557, file: !31, line: 1927, column: 9)
!3578 = !DILocation(line: 1927, column: 14, scope: !3577)
!3579 = !DILocation(line: 1927, column: 22, scope: !3577)
!3580 = !DILocation(line: 1927, column: 20, scope: !3577)
!3581 = !DILocation(line: 1929, column: 22, scope: !3582)
!3582 = distinct !DILexicalBlock(scope: !3577, file: !31, line: 1928, column: 5)
!3583 = !DILocation(line: 1929, column: 33, scope: !3582)
!3584 = !DILocation(line: 1929, column: 42, scope: !3582)
!3585 = !DILocation(line: 1929, column: 15, scope: !3582)
!3586 = !DILocation(line: 1929, column: 12, scope: !3582)
!3587 = !DILocation(line: 1930, column: 10, scope: !3588)
!3588 = distinct !DILexicalBlock(scope: !3582, file: !31, line: 1930, column: 10)
!3589 = !DILocation(line: 1930, column: 18, scope: !3588)
!3590 = !DILocation(line: 1930, column: 16, scope: !3588)
!3591 = !DILocation(line: 1931, column: 15, scope: !3588)
!3592 = !DILocation(line: 1931, column: 13, scope: !3588)
!3593 = !DILocation(line: 1931, column: 7, scope: !3588)
!3594 = !DILocation(line: 1932, column: 5, scope: !3582)
!3595 = !DILocation(line: 1935, column: 5, scope: !3557)
!3596 = !DILocation(line: 1937, column: 21, scope: !3597)
!3597 = distinct !DILexicalBlock(scope: !3557, file: !31, line: 1937, column: 9)
!3598 = !DILocation(line: 1937, column: 26, scope: !3597)
!3599 = !DILocation(line: 1937, column: 9, scope: !3597)
!3600 = !DILocation(line: 1937, column: 30, scope: !3597)
!3601 = !DILocation(line: 1937, column: 42, scope: !3597)
!3602 = !DILocation(line: 1938, column: 6, scope: !3597)
!3603 = !DILocation(line: 1939, column: 5, scope: !3557)
!3604 = !DILocation(line: 1940, column: 5, scope: !3557)
!3605 = !DILocation(line: 1940, column: 10, scope: !3557)
!3606 = !DILocation(line: 1940, column: 26, scope: !3557)
!3607 = !DILocation(line: 1940, column: 35, scope: !3557)
!3608 = !DILocation(line: 1941, column: 19, scope: !3557)
!3609 = !DILocation(line: 1941, column: 24, scope: !3557)
!3610 = !DILocation(line: 1941, column: 40, scope: !3557)
!3611 = !DILocation(line: 1941, column: 50, scope: !3557)
!3612 = !DILocation(line: 1941, column: 5, scope: !3557)
!3613 = !DILocalVariable(name: "lifelost", scope: !3614, file: !31, line: 1946, type: !21)
!3614 = distinct !DILexicalBlock(scope: !3557, file: !31, line: 1945, column: 5)
!3615 = !DILocation(line: 1946, column: 10, scope: !3614)
!3616 = !DILocalVariable(name: "absdot", scope: !3614, file: !31, line: 1946, type: !21)
!3617 = !DILocation(line: 1946, column: 20, scope: !3614)
!3618 = !DILocation(line: 1948, column: 26, scope: !3614)
!3619 = !DILocation(line: 1948, column: 24, scope: !3614)
!3620 = !DILocation(line: 1948, column: 15, scope: !3614)
!3621 = !DILocation(line: 1948, column: 13, scope: !3614)
!3622 = !DILocation(line: 1950, column: 24, scope: !3614)
!3623 = !DILocation(line: 1950, column: 30, scope: !3614)
!3624 = !DILocation(line: 1950, column: 35, scope: !3614)
!3625 = !DILocation(line: 1950, column: 17, scope: !3614)
!3626 = !DILocation(line: 1950, column: 15, scope: !3614)
!3627 = !DILocation(line: 1951, column: 23, scope: !3614)
!3628 = !DILocation(line: 1951, column: 6, scope: !3614)
!3629 = !DILocation(line: 1951, column: 11, scope: !3614)
!3630 = !DILocation(line: 1951, column: 20, scope: !3614)
!3631 = !DILocation(line: 1955, column: 21, scope: !3632)
!3632 = distinct !DILexicalBlock(scope: !3557, file: !31, line: 1955, column: 9)
!3633 = !DILocation(line: 1955, column: 26, scope: !3632)
!3634 = !DILocation(line: 1955, column: 9, scope: !3632)
!3635 = !DILocation(line: 1955, column: 30, scope: !3632)
!3636 = !DILocation(line: 1955, column: 42, scope: !3632)
!3637 = !DILocation(line: 1956, column: 43, scope: !3632)
!3638 = !DILocation(line: 1956, column: 6, scope: !3632)
!3639 = !DILocation(line: 1958, column: 4, scope: !3557)
!3640 = !DILocation(line: 1959, column: 3, scope: !3485)
!3641 = !DILocation(line: 1962, column: 2, scope: !3467)
!3642 = !DILocalVariable(name: "weapon_speed", scope: !3349, file: !31, line: 1964, type: !21)
!3643 = !DILocation(line: 1964, column: 6, scope: !3349)
!3644 = !DILocation(line: 1966, column: 6, scope: !3645)
!3645 = distinct !DILexicalBlock(scope: !3349, file: !31, line: 1966, column: 6)
!3646 = !DILocation(line: 1966, column: 26, scope: !3645)
!3647 = !DILocation(line: 1968, column: 36, scope: !3648)
!3648 = distinct !DILexicalBlock(scope: !3645, file: !31, line: 1967, column: 2)
!3649 = !DILocation(line: 1968, column: 41, scope: !3648)
!3650 = !DILocation(line: 1968, column: 57, scope: !3648)
!3651 = !DILocation(line: 1968, column: 18, scope: !3648)
!3652 = !DILocation(line: 1968, column: 16, scope: !3648)
!3653 = !DILocation(line: 1969, column: 7, scope: !3654)
!3654 = distinct !DILexicalBlock(scope: !3648, file: !31, line: 1969, column: 7)
!3655 = !DILocation(line: 1969, column: 34, scope: !3654)
!3656 = !DILocation(line: 1969, column: 39, scope: !3654)
!3657 = !DILocation(line: 1969, column: 22, scope: !3654)
!3658 = !DILocation(line: 1969, column: 43, scope: !3654)
!3659 = !DILocation(line: 1969, column: 49, scope: !3654)
!3660 = !DILocation(line: 1969, column: 20, scope: !3654)
!3661 = !DILocation(line: 1972, column: 20, scope: !3662)
!3662 = distinct !DILexicalBlock(scope: !3663, file: !31, line: 1972, column: 8)
!3663 = distinct !DILexicalBlock(scope: !3654, file: !31, line: 1970, column: 3)
!3664 = !DILocation(line: 1972, column: 25, scope: !3662)
!3665 = !DILocation(line: 1972, column: 8, scope: !3662)
!3666 = !DILocation(line: 1972, column: 29, scope: !3662)
!3667 = !DILocation(line: 1972, column: 35, scope: !3662)
!3668 = !DILocalVariable(name: "scale_factor", scope: !3669, file: !31, line: 1974, type: !21)
!3669 = distinct !DILexicalBlock(scope: !3662, file: !31, line: 1973, column: 4)
!3670 = !DILocation(line: 1974, column: 9, scope: !3669)
!3671 = !DILocation(line: 1976, column: 39, scope: !3669)
!3672 = !DILocation(line: 1976, column: 44, scope: !3669)
!3673 = !DILocation(line: 1976, column: 27, scope: !3669)
!3674 = !DILocation(line: 1976, column: 48, scope: !3669)
!3675 = !DILocation(line: 1976, column: 54, scope: !3669)
!3676 = !DILocation(line: 1976, column: 73, scope: !3669)
!3677 = !DILocation(line: 1976, column: 20, scope: !3669)
!3678 = !DILocation(line: 1976, column: 18, scope: !3669)
!3679 = !DILocation(line: 1977, column: 19, scope: !3669)
!3680 = !DILocation(line: 1977, column: 24, scope: !3669)
!3681 = !DILocation(line: 1977, column: 40, scope: !3669)
!3682 = !DILocation(line: 1977, column: 50, scope: !3669)
!3683 = !DILocation(line: 1977, column: 5, scope: !3669)
!3684 = !DILocation(line: 1978, column: 4, scope: !3669)
!3685 = !DILocation(line: 1979, column: 3, scope: !3663)
!3686 = !DILocation(line: 1980, column: 2, scope: !3648)
!3687 = !DILocation(line: 1981, column: 23, scope: !3688)
!3688 = distinct !DILexicalBlock(scope: !3645, file: !31, line: 1981, column: 11)
!3689 = !DILocation(line: 1981, column: 28, scope: !3688)
!3690 = !DILocation(line: 1981, column: 11, scope: !3688)
!3691 = !DILocation(line: 1981, column: 32, scope: !3688)
!3692 = !DILocation(line: 1983, column: 36, scope: !3693)
!3693 = distinct !DILexicalBlock(scope: !3688, file: !31, line: 1982, column: 2)
!3694 = !DILocation(line: 1983, column: 41, scope: !3693)
!3695 = !DILocation(line: 1983, column: 57, scope: !3693)
!3696 = !DILocation(line: 1983, column: 18, scope: !3693)
!3697 = !DILocation(line: 1983, column: 16, scope: !3693)
!3698 = !DILocation(line: 1984, column: 7, scope: !3699)
!3699 = distinct !DILexicalBlock(scope: !3693, file: !31, line: 1984, column: 7)
!3700 = !DILocation(line: 1984, column: 34, scope: !3699)
!3701 = !DILocation(line: 1984, column: 39, scope: !3699)
!3702 = !DILocation(line: 1984, column: 22, scope: !3699)
!3703 = !DILocation(line: 1984, column: 43, scope: !3699)
!3704 = !DILocation(line: 1984, column: 49, scope: !3699)
!3705 = !DILocation(line: 1984, column: 20, scope: !3699)
!3706 = !DILocalVariable(name: "scale_factor", scope: !3707, file: !31, line: 1985, type: !21)
!3707 = distinct !DILexicalBlock(scope: !3699, file: !31, line: 1984, column: 68)
!3708 = !DILocation(line: 1985, column: 8, scope: !3707)
!3709 = !DILocation(line: 1987, column: 38, scope: !3707)
!3710 = !DILocation(line: 1987, column: 43, scope: !3707)
!3711 = !DILocation(line: 1987, column: 26, scope: !3707)
!3712 = !DILocation(line: 1987, column: 47, scope: !3707)
!3713 = !DILocation(line: 1987, column: 53, scope: !3707)
!3714 = !DILocation(line: 1987, column: 72, scope: !3707)
!3715 = !DILocation(line: 1987, column: 19, scope: !3707)
!3716 = !DILocation(line: 1987, column: 17, scope: !3707)
!3717 = !DILocation(line: 1988, column: 18, scope: !3707)
!3718 = !DILocation(line: 1988, column: 23, scope: !3707)
!3719 = !DILocation(line: 1988, column: 39, scope: !3707)
!3720 = !DILocation(line: 1988, column: 49, scope: !3707)
!3721 = !DILocation(line: 1988, column: 4, scope: !3707)
!3722 = !DILocation(line: 1989, column: 3, scope: !3707)
!3723 = !DILocation(line: 1990, column: 2, scope: !3693)
!3724 = !DILocation(line: 1991, column: 1, scope: !3349)
!3725 = !DILocalVariable(name: "plp", scope: !317, file: !31, line: 2004, type: !3726)
!3726 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3727, size: 64)
!3727 = !DIDerivedType(tag: DW_TAG_typedef, name: "player", file: !3728, line: 118, baseType: !3729)
!3728 = !DIFile(filename: "main_d2/player.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "8ffee99de4d393c8ae4578dcf4efebc6")
!3729 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "player", file: !3728, line: 65, size: 1184, flags: DIFlagTypePassByValue, elements: !3730, identifier: "_ZTS6player")
!3730 = !{!3731, !3735, !3739, !3740, !3741, !3742, !3743, !3744, !3745, !3746, !3747, !3748, !3749, !3750, !3751, !3752, !3753, !3754, !3756, !3757, !3758, !3759, !3760, !3761, !3762, !3763, !3764, !3765, !3766, !3767, !3768, !3769, !3770, !3771, !3772, !3773, !3774, !3775, !3776, !3777}
!3731 = !DIDerivedType(tag: DW_TAG_member, name: "callsign", scope: !3729, file: !3728, line: 67, baseType: !3732, size: 72)
!3732 = !DICompositeType(tag: DW_TAG_array_type, baseType: !186, size: 72, elements: !3733)
!3733 = !{!3734}
!3734 = !DISubrange(count: 9)
!3735 = !DIDerivedType(tag: DW_TAG_member, name: "net_address", scope: !3729, file: !3728, line: 68, baseType: !3736, size: 32, offset: 72)
!3736 = !DICompositeType(tag: DW_TAG_array_type, baseType: !40, size: 32, elements: !3737)
!3737 = !{!3738}
!3738 = !DISubrange(count: 4)
!3739 = !DIDerivedType(tag: DW_TAG_member, name: "net_port", scope: !3729, file: !3728, line: 69, baseType: !93, size: 16, offset: 112)
!3740 = !DIDerivedType(tag: DW_TAG_member, name: "connected", scope: !3729, file: !3728, line: 70, baseType: !18, size: 8, offset: 128)
!3741 = !DIDerivedType(tag: DW_TAG_member, name: "objnum", scope: !3729, file: !3728, line: 71, baseType: !7, size: 32, offset: 160)
!3742 = !DIDerivedType(tag: DW_TAG_member, name: "n_packets_got", scope: !3729, file: !3728, line: 72, baseType: !7, size: 32, offset: 192)
!3743 = !DIDerivedType(tag: DW_TAG_member, name: "n_packets_sent", scope: !3729, file: !3728, line: 73, baseType: !7, size: 32, offset: 224)
!3744 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !3729, file: !3728, line: 78, baseType: !385, size: 32, offset: 256)
!3745 = !DIDerivedType(tag: DW_TAG_member, name: "energy", scope: !3729, file: !3728, line: 79, baseType: !21, size: 32, offset: 288)
!3746 = !DIDerivedType(tag: DW_TAG_member, name: "shields", scope: !3729, file: !3728, line: 80, baseType: !21, size: 32, offset: 320)
!3747 = !DIDerivedType(tag: DW_TAG_member, name: "lives", scope: !3729, file: !3728, line: 81, baseType: !40, size: 8, offset: 352)
!3748 = !DIDerivedType(tag: DW_TAG_member, name: "level", scope: !3729, file: !3728, line: 82, baseType: !18, size: 8, offset: 360)
!3749 = !DIDerivedType(tag: DW_TAG_member, name: "laser_level", scope: !3729, file: !3728, line: 83, baseType: !40, size: 8, offset: 368)
!3750 = !DIDerivedType(tag: DW_TAG_member, name: "starting_level", scope: !3729, file: !3728, line: 84, baseType: !18, size: 8, offset: 376)
!3751 = !DIDerivedType(tag: DW_TAG_member, name: "killer_objnum", scope: !3729, file: !3728, line: 85, baseType: !45, size: 16, offset: 384)
!3752 = !DIDerivedType(tag: DW_TAG_member, name: "primary_weapon_flags", scope: !3729, file: !3728, line: 86, baseType: !93, size: 16, offset: 400)
!3753 = !DIDerivedType(tag: DW_TAG_member, name: "secondary_weapon_flags", scope: !3729, file: !3728, line: 87, baseType: !93, size: 16, offset: 416)
!3754 = !DIDerivedType(tag: DW_TAG_member, name: "primary_ammo", scope: !3729, file: !3728, line: 88, baseType: !3755, size: 160, offset: 432)
!3755 = !DICompositeType(tag: DW_TAG_array_type, baseType: !93, size: 160, elements: !167)
!3756 = !DIDerivedType(tag: DW_TAG_member, name: "secondary_ammo", scope: !3729, file: !3728, line: 89, baseType: !3755, size: 160, offset: 592)
!3757 = !DIDerivedType(tag: DW_TAG_member, name: "pad", scope: !3729, file: !3728, line: 91, baseType: !93, size: 16, offset: 752)
!3758 = !DIDerivedType(tag: DW_TAG_member, name: "last_score", scope: !3729, file: !3728, line: 96, baseType: !7, size: 32, offset: 768)
!3759 = !DIDerivedType(tag: DW_TAG_member, name: "score", scope: !3729, file: !3728, line: 97, baseType: !7, size: 32, offset: 800)
!3760 = !DIDerivedType(tag: DW_TAG_member, name: "time_level", scope: !3729, file: !3728, line: 98, baseType: !21, size: 32, offset: 832)
!3761 = !DIDerivedType(tag: DW_TAG_member, name: "time_total", scope: !3729, file: !3728, line: 99, baseType: !21, size: 32, offset: 864)
!3762 = !DIDerivedType(tag: DW_TAG_member, name: "cloak_time", scope: !3729, file: !3728, line: 101, baseType: !21, size: 32, offset: 896)
!3763 = !DIDerivedType(tag: DW_TAG_member, name: "invulnerable_time", scope: !3729, file: !3728, line: 102, baseType: !21, size: 32, offset: 928)
!3764 = !DIDerivedType(tag: DW_TAG_member, name: "KillGoalCount", scope: !3729, file: !3728, line: 104, baseType: !45, size: 16, offset: 960)
!3765 = !DIDerivedType(tag: DW_TAG_member, name: "net_killed_total", scope: !3729, file: !3728, line: 105, baseType: !45, size: 16, offset: 976)
!3766 = !DIDerivedType(tag: DW_TAG_member, name: "net_kills_total", scope: !3729, file: !3728, line: 106, baseType: !45, size: 16, offset: 992)
!3767 = !DIDerivedType(tag: DW_TAG_member, name: "num_kills_level", scope: !3729, file: !3728, line: 107, baseType: !45, size: 16, offset: 1008)
!3768 = !DIDerivedType(tag: DW_TAG_member, name: "num_kills_total", scope: !3729, file: !3728, line: 108, baseType: !45, size: 16, offset: 1024)
!3769 = !DIDerivedType(tag: DW_TAG_member, name: "num_robots_level", scope: !3729, file: !3728, line: 109, baseType: !45, size: 16, offset: 1040)
!3770 = !DIDerivedType(tag: DW_TAG_member, name: "num_robots_total", scope: !3729, file: !3728, line: 110, baseType: !45, size: 16, offset: 1056)
!3771 = !DIDerivedType(tag: DW_TAG_member, name: "hostages_rescued_total", scope: !3729, file: !3728, line: 111, baseType: !93, size: 16, offset: 1072)
!3772 = !DIDerivedType(tag: DW_TAG_member, name: "hostages_total", scope: !3729, file: !3728, line: 112, baseType: !93, size: 16, offset: 1088)
!3773 = !DIDerivedType(tag: DW_TAG_member, name: "hostages_on_board", scope: !3729, file: !3728, line: 113, baseType: !40, size: 8, offset: 1104)
!3774 = !DIDerivedType(tag: DW_TAG_member, name: "hostages_level", scope: !3729, file: !3728, line: 114, baseType: !40, size: 8, offset: 1112)
!3775 = !DIDerivedType(tag: DW_TAG_member, name: "homing_object_dist", scope: !3729, file: !3728, line: 115, baseType: !21, size: 32, offset: 1120)
!3776 = !DIDerivedType(tag: DW_TAG_member, name: "hours_level", scope: !3729, file: !3728, line: 116, baseType: !18, size: 8, offset: 1152)
!3777 = !DIDerivedType(tag: DW_TAG_member, name: "hours_total", scope: !3729, file: !3728, line: 117, baseType: !18, size: 8, offset: 1160)
!3778 = !DILocation(line: 2004, column: 10, scope: !317)
!3779 = !DILocation(line: 2004, column: 25, scope: !317)
!3780 = !DILocation(line: 2004, column: 17, scope: !317)
!3781 = !DILocalVariable(name: "energy_used", scope: !317, file: !31, line: 2005, type: !21)
!3782 = !DILocation(line: 2005, column: 7, scope: !317)
!3783 = !DILocalVariable(name: "ammo_used", scope: !317, file: !31, line: 2006, type: !7)
!3784 = !DILocation(line: 2006, column: 7, scope: !317)
!3785 = !DILocalVariable(name: "primary_ammo", scope: !317, file: !31, line: 2006, type: !7)
!3786 = !DILocation(line: 2006, column: 17, scope: !317)
!3787 = !DILocalVariable(name: "weapon_index", scope: !317, file: !31, line: 2007, type: !7)
!3788 = !DILocation(line: 2007, column: 7, scope: !317)
!3789 = !DILocalVariable(name: "rval", scope: !317, file: !31, line: 2008, type: !7)
!3790 = !DILocation(line: 2008, column: 7, scope: !317)
!3791 = !DILocalVariable(name: "nfires", scope: !317, file: !31, line: 2009, type: !7)
!3792 = !DILocation(line: 2009, column: 8, scope: !317)
!3793 = !DILocalVariable(name: "addval", scope: !317, file: !31, line: 2010, type: !21)
!3794 = !DILocation(line: 2010, column: 7, scope: !317)
!3795 = !DILocation(line: 2014, column: 6, scope: !3796)
!3796 = distinct !DILexicalBlock(scope: !317, file: !31, line: 2014, column: 6)
!3797 = !DILocation(line: 2015, column: 3, scope: !3796)
!3798 = !DILocation(line: 2017, column: 47, scope: !317)
!3799 = !DILocation(line: 2017, column: 17, scope: !317)
!3800 = !DILocation(line: 2017, column: 15, scope: !317)
!3801 = !DILocation(line: 2018, column: 28, scope: !317)
!3802 = !DILocation(line: 2018, column: 16, scope: !317)
!3803 = !DILocation(line: 2018, column: 42, scope: !317)
!3804 = !DILocation(line: 2018, column: 14, scope: !317)
!3805 = !DILocation(line: 2019, column: 6, scope: !3806)
!3806 = distinct !DILexicalBlock(scope: !317, file: !31, line: 2019, column: 6)
!3807 = !DILocation(line: 2019, column: 21, scope: !3806)
!3808 = !DILocation(line: 2020, column: 15, scope: !3806)
!3809 = !DILocation(line: 2020, column: 3, scope: !3806)
!3810 = !DILocation(line: 2022, column: 6, scope: !3811)
!3811 = distinct !DILexicalBlock(scope: !317, file: !31, line: 2022, column: 6)
!3812 = !DILocation(line: 2022, column: 23, scope: !3811)
!3813 = !DILocation(line: 2023, column: 24, scope: !3811)
!3814 = !DILocation(line: 2023, column: 41, scope: !3811)
!3815 = !DILocation(line: 2023, column: 57, scope: !3811)
!3816 = !DILocation(line: 2023, column: 37, scope: !3811)
!3817 = !DILocation(line: 2023, column: 60, scope: !3811)
!3818 = !DILocation(line: 2023, column: 17, scope: !3811)
!3819 = !DILocation(line: 2023, column: 15, scope: !3811)
!3820 = !DILocation(line: 2023, column: 3, scope: !3811)
!3821 = !DILocation(line: 2026, column: 6, scope: !3822)
!3822 = distinct !DILexicalBlock(scope: !317, file: !31, line: 2026, column: 6)
!3823 = !DILocation(line: 2026, column: 19, scope: !3822)
!3824 = !DILocation(line: 2026, column: 34, scope: !3822)
!3825 = !DILocation(line: 2026, column: 37, scope: !3822)
!3826 = !DILocation(line: 2026, column: 57, scope: !3822)
!3827 = !DILocation(line: 2027, column: 7, scope: !3828)
!3828 = distinct !DILexicalBlock(scope: !3822, file: !31, line: 2027, column: 7)
!3829 = !DILocation(line: 2027, column: 17, scope: !3828)
!3830 = !DILocation(line: 2028, column: 16, scope: !3828)
!3831 = !DILocation(line: 2028, column: 4, scope: !3828)
!3832 = !DILocation(line: 2027, column: 19, scope: !3828)
!3833 = !DILocation(line: 2030, column: 26, scope: !317)
!3834 = !DILocation(line: 2030, column: 14, scope: !317)
!3835 = !DILocation(line: 2030, column: 40, scope: !317)
!3836 = !DILocation(line: 2030, column: 12, scope: !317)
!3837 = !DILocation(line: 2032, column: 13, scope: !317)
!3838 = !DILocation(line: 2032, column: 12, scope: !317)
!3839 = !DILocation(line: 2032, column: 9, scope: !317)
!3840 = !DILocation(line: 2033, column: 6, scope: !3841)
!3841 = distinct !DILexicalBlock(scope: !317, file: !31, line: 2033, column: 6)
!3842 = !DILocation(line: 2033, column: 13, scope: !3841)
!3843 = !DILocation(line: 2034, column: 10, scope: !3841)
!3844 = !DILocation(line: 2034, column: 3, scope: !3841)
!3845 = !DILocation(line: 2036, column: 7, scope: !3846)
!3846 = distinct !DILexicalBlock(scope: !317, file: !31, line: 2036, column: 6)
!3847 = !DILocation(line: 2036, column: 33, scope: !3846)
!3848 = !DILocation(line: 2036, column: 32, scope: !3846)
!3849 = !DILocation(line: 2036, column: 29, scope: !3846)
!3850 = !DILocation(line: 2036, column: 45, scope: !3846)
!3851 = !DILocation(line: 2036, column: 43, scope: !3846)
!3852 = !DILocation(line: 2036, column: 55, scope: !3846)
!3853 = !DILocation(line: 2036, column: 59, scope: !3846)
!3854 = !DILocation(line: 2036, column: 70, scope: !3846)
!3855 = !DILocation(line: 2036, column: 68, scope: !3846)
!3856 = !DILocation(line: 2037, column: 26, scope: !3846)
!3857 = !DILocation(line: 2037, column: 24, scope: !3846)
!3858 = !DILocation(line: 2037, column: 3, scope: !3846)
!3859 = !DILocation(line: 2039, column: 26, scope: !317)
!3860 = !DILocation(line: 2039, column: 24, scope: !317)
!3861 = !DILocation(line: 2041, column: 18, scope: !317)
!3862 = !DILocation(line: 2041, column: 33, scope: !317)
!3863 = !DILocation(line: 2041, column: 17, scope: !317)
!3864 = !DILocation(line: 2041, column: 50, scope: !317)
!3865 = !DILocation(line: 2041, column: 55, scope: !317)
!3866 = !DILocation(line: 2041, column: 84, scope: !317)
!3867 = !DILocation(line: 2041, column: 89, scope: !317)
!3868 = !DILocation(line: 2041, column: 102, scope: !317)
!3869 = !DILocation(line: 2041, column: 15, scope: !317)
!3870 = !DILocation(line: 2043, column: 9, scope: !3871)
!3871 = distinct !DILexicalBlock(scope: !317, file: !31, line: 2043, column: 6)
!3872 = !DILocation(line: 2043, column: 14, scope: !3871)
!3873 = !DILocation(line: 2043, column: 24, scope: !3871)
!3874 = !DILocation(line: 2043, column: 21, scope: !3871)
!3875 = !DILocation(line: 2043, column: 37, scope: !3871)
!3876 = !DILocation(line: 2043, column: 41, scope: !3871)
!3877 = !DILocation(line: 2043, column: 57, scope: !3871)
!3878 = !DILocation(line: 2043, column: 54, scope: !3871)
!3879 = !DILocation(line: 2043, column: 6, scope: !3871)
!3880 = !DILocation(line: 2044, column: 3, scope: !3871)
!3881 = !DILocation(line: 2046, column: 5, scope: !3882)
!3882 = distinct !DILexicalBlock(scope: !317, file: !31, line: 2046, column: 5)
!3883 = !DILocation(line: 2048, column: 11, scope: !3884)
!3884 = distinct !DILexicalBlock(scope: !3882, file: !31, line: 2047, column: 1)
!3885 = !DILocation(line: 2049, column: 11, scope: !3884)
!3886 = !DILocation(line: 2050, column: 1, scope: !3884)
!3887 = !DILocation(line: 2052, column: 2, scope: !317)
!3888 = !DILocation(line: 2052, column: 9, scope: !317)
!3889 = !DILocation(line: 2052, column: 33, scope: !317)
!3890 = !DILocation(line: 2052, column: 30, scope: !317)
!3891 = !DILocation(line: 2054, column: 8, scope: !3892)
!3892 = distinct !DILexicalBlock(scope: !3893, file: !31, line: 2054, column: 7)
!3893 = distinct !DILexicalBlock(scope: !317, file: !31, line: 2053, column: 2)
!3894 = !DILocation(line: 2054, column: 13, scope: !3892)
!3895 = !DILocation(line: 2054, column: 23, scope: !3892)
!3896 = !DILocation(line: 2054, column: 20, scope: !3892)
!3897 = !DILocation(line: 2054, column: 36, scope: !3892)
!3898 = !DILocation(line: 2054, column: 40, scope: !3892)
!3899 = !DILocation(line: 2054, column: 56, scope: !3892)
!3900 = !DILocation(line: 2054, column: 53, scope: !3892)
!3901 = !DILocalVariable(name: "laser_level", scope: !3902, file: !31, line: 2056, type: !7)
!3902 = distinct !DILexicalBlock(scope: !3892, file: !31, line: 2055, column: 3)
!3903 = !DILocation(line: 2056, column: 8, scope: !3902)
!3904 = !DILocalVariable(name: "flags", scope: !3902, file: !31, line: 2056, type: !7)
!3905 = !DILocation(line: 2056, column: 21, scope: !3902)
!3906 = !DILocation(line: 2059, column: 8, scope: !3907)
!3907 = distinct !DILexicalBlock(scope: !3902, file: !31, line: 2059, column: 8)
!3908 = !DILocation(line: 2059, column: 24, scope: !3907)
!3909 = !DILocation(line: 2060, column: 41, scope: !3907)
!3910 = !DILocation(line: 2060, column: 29, scope: !3907)
!3911 = !DILocation(line: 2060, column: 55, scope: !3907)
!3912 = !DILocation(line: 2060, column: 26, scope: !3907)
!3913 = !DILocation(line: 2060, column: 5, scope: !3907)
!3914 = !DILocation(line: 2062, column: 26, scope: !3907)
!3915 = !DILocation(line: 2064, column: 26, scope: !3902)
!3916 = !DILocation(line: 2064, column: 18, scope: !3902)
!3917 = !DILocation(line: 2064, column: 38, scope: !3902)
!3918 = !DILocation(line: 2064, column: 16, scope: !3902)
!3919 = !DILocation(line: 2066, column: 10, scope: !3902)
!3920 = !DILocation(line: 2068, column: 8, scope: !3921)
!3921 = distinct !DILexicalBlock(scope: !3902, file: !31, line: 2068, column: 8)
!3922 = !DILocation(line: 2068, column: 23, scope: !3921)
!3923 = !DILocation(line: 2070, column: 9, scope: !3924)
!3924 = distinct !DILexicalBlock(scope: !3925, file: !31, line: 2070, column: 9)
!3925 = distinct !DILexicalBlock(scope: !3921, file: !31, line: 2069, column: 4)
!3926 = !DILocation(line: 2071, column: 12, scope: !3924)
!3927 = !DILocation(line: 2071, column: 6, scope: !3924)
!3928 = !DILocation(line: 2072, column: 26, scope: !3925)
!3929 = !DILocation(line: 2072, column: 25, scope: !3925)
!3930 = !DILocation(line: 2072, column: 23, scope: !3925)
!3931 = !DILocation(line: 2073, column: 4, scope: !3925)
!3932 = !DILocation(line: 2075, column: 8, scope: !3933)
!3933 = distinct !DILexicalBlock(scope: !3902, file: !31, line: 2075, column: 8)
!3934 = !DILocation(line: 2075, column: 23, scope: !3933)
!3935 = !DILocation(line: 2077, column: 22, scope: !3936)
!3936 = distinct !DILexicalBlock(scope: !3933, file: !31, line: 2076, column: 4)
!3937 = !DILocation(line: 2078, column: 16, scope: !3936)
!3938 = !DILocation(line: 2078, column: 34, scope: !3936)
!3939 = !DILocation(line: 2078, column: 54, scope: !3936)
!3940 = !DILocation(line: 2078, column: 11, scope: !3936)
!3941 = !DILocation(line: 2079, column: 4, scope: !3936)
!3942 = !DILocation(line: 2081, column: 16, scope: !3943)
!3943 = distinct !DILexicalBlock(scope: !3902, file: !31, line: 2081, column: 8)
!3944 = !DILocation(line: 2081, column: 8, scope: !3943)
!3945 = !DILocation(line: 2081, column: 28, scope: !3943)
!3946 = !DILocation(line: 2081, column: 34, scope: !3943)
!3947 = !DILocation(line: 2082, column: 11, scope: !3943)
!3948 = !DILocation(line: 2082, column: 5, scope: !3943)
!3949 = !DILocation(line: 2084, column: 36, scope: !3902)
!3950 = !DILocation(line: 2084, column: 28, scope: !3902)
!3951 = !DILocation(line: 2084, column: 48, scope: !3902)
!3952 = !DILocation(line: 2084, column: 56, scope: !3902)
!3953 = !DILocation(line: 2084, column: 72, scope: !3902)
!3954 = !DILocation(line: 2084, column: 85, scope: !3902)
!3955 = !DILocation(line: 2084, column: 92, scope: !3902)
!3956 = !DILocation(line: 2084, column: 12, scope: !3902)
!3957 = !DILocation(line: 2084, column: 9, scope: !3902)
!3958 = !DILocation(line: 2086, column: 20, scope: !3902)
!3959 = !DILocation(line: 2086, column: 34, scope: !3902)
!3960 = !DILocation(line: 2086, column: 32, scope: !3902)
!3961 = !DILocation(line: 2086, column: 54, scope: !3902)
!3962 = !DILocation(line: 2086, column: 42, scope: !3902)
!3963 = !DILocation(line: 2086, column: 68, scope: !3902)
!3964 = !DILocation(line: 2086, column: 40, scope: !3902)
!3965 = !DILocation(line: 2086, column: 4, scope: !3902)
!3966 = !DILocation(line: 2086, column: 9, scope: !3902)
!3967 = !DILocation(line: 2086, column: 16, scope: !3902)
!3968 = !DILocation(line: 2087, column: 8, scope: !3969)
!3969 = distinct !DILexicalBlock(scope: !3902, file: !31, line: 2087, column: 8)
!3970 = !DILocation(line: 2087, column: 13, scope: !3969)
!3971 = !DILocation(line: 2087, column: 20, scope: !3969)
!3972 = !DILocation(line: 2088, column: 5, scope: !3969)
!3973 = !DILocation(line: 2088, column: 10, scope: !3969)
!3974 = !DILocation(line: 2088, column: 17, scope: !3969)
!3975 = !DILocation(line: 2090, column: 9, scope: !3976)
!3976 = distinct !DILexicalBlock(scope: !3902, file: !31, line: 2090, column: 8)
!3977 = !DILocation(line: 2090, column: 24, scope: !3976)
!3978 = !DILocation(line: 2090, column: 41, scope: !3976)
!3979 = !DILocation(line: 2090, column: 45, scope: !3976)
!3980 = !DILocation(line: 2090, column: 60, scope: !3976)
!3981 = !DILocation(line: 2092, column: 9, scope: !3982)
!3982 = distinct !DILexicalBlock(scope: !3983, file: !31, line: 2092, column: 9)
!3983 = distinct !DILexicalBlock(scope: !3976, file: !31, line: 2091, column: 4)
!3984 = !DILocation(line: 2092, column: 21, scope: !3982)
!3985 = !DILocation(line: 2092, column: 26, scope: !3982)
!3986 = !DILocation(line: 2092, column: 19, scope: !3982)
!3987 = !DILocation(line: 2093, column: 6, scope: !3982)
!3988 = !DILocation(line: 2093, column: 11, scope: !3982)
!3989 = !DILocation(line: 2093, column: 38, scope: !3982)
!3990 = !DILocation(line: 2095, column: 41, scope: !3982)
!3991 = !DILocation(line: 2095, column: 6, scope: !3982)
!3992 = !DILocation(line: 2095, column: 11, scope: !3982)
!3993 = !DILocation(line: 2095, column: 38, scope: !3982)
!3994 = !DILocation(line: 2096, column: 4, scope: !3983)
!3995 = !DILocation(line: 2098, column: 4, scope: !3902)
!3996 = !DILocation(line: 2100, column: 3, scope: !3902)
!3997 = !DILocation(line: 2103, column: 4, scope: !3998)
!3998 = distinct !DILexicalBlock(scope: !3892, file: !31, line: 2102, column: 3)
!3999 = !DILocation(line: 2104, column: 27, scope: !3998)
!4000 = !DILocation(line: 2104, column: 25, scope: !3998)
!4001 = !DILocation(line: 2105, column: 4, scope: !3998)
!4002 = distinct !{!4002, !3887, !4003, !948}
!4003 = !DILocation(line: 2107, column: 2, scope: !317)
!4004 = !DILocation(line: 2110, column: 28, scope: !317)
!4005 = !DILocation(line: 2112, column: 9, scope: !317)
!4006 = !DILocation(line: 2112, column: 2, scope: !317)
!4007 = !DILocation(line: 2113, column: 1, scope: !317)
!4008 = distinct !DISubprogram(name: "do_laser_firing", linkageName: "_Z15do_laser_firingiiiii", scope: !31, file: !31, line: 2246, type: !4009, scopeLine: 2247, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !320)
!4009 = !DISubroutineType(types: !4010)
!4010 = !{!7, !7, !7, !7, !7, !7}
!4011 = !DILocalVariable(name: "objnum", arg: 1, scope: !4008, file: !31, line: 2246, type: !7)
!4012 = !DILocation(line: 2246, column: 25, scope: !4008)
!4013 = !DILocalVariable(name: "weapon_num", arg: 2, scope: !4008, file: !31, line: 2246, type: !7)
!4014 = !DILocation(line: 2246, column: 37, scope: !4008)
!4015 = !DILocalVariable(name: "level", arg: 3, scope: !4008, file: !31, line: 2246, type: !7)
!4016 = !DILocation(line: 2246, column: 53, scope: !4008)
!4017 = !DILocalVariable(name: "flags", arg: 4, scope: !4008, file: !31, line: 2246, type: !7)
!4018 = !DILocation(line: 2246, column: 64, scope: !4008)
!4019 = !DILocalVariable(name: "nfires", arg: 5, scope: !4008, file: !31, line: 2246, type: !7)
!4020 = !DILocation(line: 2246, column: 75, scope: !4008)
!4021 = !DILocalVariable(name: "objp", scope: !4008, file: !31, line: 2248, type: !33)
!4022 = !DILocation(line: 2248, column: 10, scope: !4008)
!4023 = !DILocation(line: 2248, column: 26, scope: !4008)
!4024 = !DILocation(line: 2248, column: 18, scope: !4008)
!4025 = !DILocation(line: 2250, column: 10, scope: !4008)
!4026 = !DILocation(line: 2250, column: 2, scope: !4008)
!4027 = !DILocalVariable(name: "weapon_num", scope: !4028, file: !31, line: 2254, type: !7)
!4028 = distinct !DILexicalBlock(scope: !4029, file: !31, line: 2253, column: 3)
!4029 = distinct !DILexicalBlock(scope: !4008, file: !31, line: 2251, column: 2)
!4030 = !DILocation(line: 2254, column: 8, scope: !4028)
!4031 = !DILocation(line: 2256, column: 30, scope: !4028)
!4032 = !DILocation(line: 2256, column: 38, scope: !4028)
!4033 = !DILocation(line: 2256, column: 28, scope: !4028)
!4034 = !DILocation(line: 2256, column: 42, scope: !4028)
!4035 = !DILocation(line: 2256, column: 17, scope: !4028)
!4036 = !DILocation(line: 2258, column: 8, scope: !4037)
!4037 = distinct !DILexicalBlock(scope: !4028, file: !31, line: 2258, column: 8)
!4038 = !DILocation(line: 2258, column: 14, scope: !4037)
!4039 = !DILocation(line: 2259, column: 29, scope: !4037)
!4040 = !DILocation(line: 2259, column: 27, scope: !4037)
!4041 = !DILocation(line: 2259, column: 16, scope: !4037)
!4042 = !DILocation(line: 2259, column: 5, scope: !4037)
!4043 = !DILocation(line: 2261, column: 36, scope: !4037)
!4044 = !DILocation(line: 2261, column: 41, scope: !4037)
!4045 = !DILocation(line: 2261, column: 57, scope: !4037)
!4046 = !DILocation(line: 2261, column: 33, scope: !4037)
!4047 = !DILocation(line: 2261, column: 16, scope: !4037)
!4048 = !DILocation(line: 2263, column: 23, scope: !4028)
!4049 = !DILocation(line: 2263, column: 29, scope: !4028)
!4050 = !DILocation(line: 2263, column: 4, scope: !4028)
!4051 = !DILocation(line: 2264, column: 23, scope: !4028)
!4052 = !DILocation(line: 2264, column: 29, scope: !4028)
!4053 = !DILocation(line: 2264, column: 4, scope: !4028)
!4054 = !DILocation(line: 2266, column: 8, scope: !4055)
!4055 = distinct !DILexicalBlock(scope: !4028, file: !31, line: 2266, column: 8)
!4056 = !DILocation(line: 2266, column: 14, scope: !4055)
!4057 = !DILocation(line: 2269, column: 24, scope: !4058)
!4058 = distinct !DILexicalBlock(scope: !4055, file: !31, line: 2267, column: 4)
!4059 = !DILocation(line: 2269, column: 30, scope: !4058)
!4060 = !DILocation(line: 2269, column: 5, scope: !4058)
!4061 = !DILocation(line: 2270, column: 24, scope: !4058)
!4062 = !DILocation(line: 2270, column: 30, scope: !4058)
!4063 = !DILocation(line: 2270, column: 5, scope: !4058)
!4064 = !DILocation(line: 2271, column: 4, scope: !4058)
!4065 = !DILocation(line: 2272, column: 4, scope: !4028)
!4066 = !DILocalVariable(name: "make_sound", scope: !4067, file: !31, line: 2277, type: !7)
!4067 = distinct !DILexicalBlock(scope: !4029, file: !31, line: 2275, column: 3)
!4068 = !DILocation(line: 2277, column: 8, scope: !4067)
!4069 = !DILocation(line: 2280, column: 30, scope: !4067)
!4070 = !DILocation(line: 2280, column: 50, scope: !4067)
!4071 = !DILocation(line: 2280, column: 58, scope: !4067)
!4072 = !DILocation(line: 2280, column: 61, scope: !4067)
!4073 = !DILocation(line: 2280, column: 73, scope: !4067)
!4074 = !DILocation(line: 2280, column: 81, scope: !4067)
!4075 = !DILocation(line: 2280, column: 84, scope: !4067)
!4076 = !DILocation(line: 2280, column: 96, scope: !4067)
!4077 = !DILocation(line: 2280, column: 4, scope: !4067)
!4078 = !DILocation(line: 2281, column: 8, scope: !4079)
!4079 = distinct !DILexicalBlock(scope: !4067, file: !31, line: 2281, column: 8)
!4080 = !DILocation(line: 2281, column: 15, scope: !4079)
!4081 = !DILocation(line: 2283, column: 31, scope: !4082)
!4082 = distinct !DILexicalBlock(scope: !4079, file: !31, line: 2282, column: 4)
!4083 = !DILocation(line: 2283, column: 51, scope: !4082)
!4084 = !DILocation(line: 2283, column: 59, scope: !4082)
!4085 = !DILocation(line: 2283, column: 62, scope: !4082)
!4086 = !DILocation(line: 2283, column: 74, scope: !4082)
!4087 = !DILocation(line: 2283, column: 82, scope: !4082)
!4088 = !DILocation(line: 2283, column: 85, scope: !4082)
!4089 = !DILocation(line: 2283, column: 5, scope: !4082)
!4090 = !DILocation(line: 2284, column: 9, scope: !4091)
!4091 = distinct !DILexicalBlock(scope: !4082, file: !31, line: 2284, column: 9)
!4092 = !DILocation(line: 2284, column: 16, scope: !4091)
!4093 = !DILocation(line: 2286, column: 32, scope: !4094)
!4094 = distinct !DILexicalBlock(scope: !4091, file: !31, line: 2285, column: 5)
!4095 = !DILocation(line: 2286, column: 52, scope: !4094)
!4096 = !DILocation(line: 2286, column: 60, scope: !4094)
!4097 = !DILocation(line: 2286, column: 63, scope: !4094)
!4098 = !DILocation(line: 2286, column: 75, scope: !4094)
!4099 = !DILocation(line: 2286, column: 83, scope: !4094)
!4100 = !DILocation(line: 2286, column: 86, scope: !4094)
!4101 = !DILocation(line: 2286, column: 6, scope: !4094)
!4102 = !DILocation(line: 2287, column: 5, scope: !4094)
!4103 = !DILocation(line: 2288, column: 4, scope: !4082)
!4104 = !DILocation(line: 2289, column: 4, scope: !4067)
!4105 = !DILocation(line: 2292, column: 8, scope: !4106)
!4106 = distinct !DILexicalBlock(scope: !4029, file: !31, line: 2292, column: 8)
!4107 = !DILocation(line: 2292, column: 14, scope: !4106)
!4108 = !DILocation(line: 2294, column: 31, scope: !4109)
!4109 = distinct !DILexicalBlock(scope: !4106, file: !31, line: 2293, column: 4)
!4110 = !DILocation(line: 2294, column: 5, scope: !4109)
!4111 = !DILocation(line: 2295, column: 31, scope: !4109)
!4112 = !DILocation(line: 2295, column: 5, scope: !4109)
!4113 = !DILocation(line: 2296, column: 31, scope: !4109)
!4114 = !DILocation(line: 2296, column: 5, scope: !4109)
!4115 = !DILocation(line: 2297, column: 4, scope: !4109)
!4116 = !DILocation(line: 2300, column: 31, scope: !4117)
!4117 = distinct !DILexicalBlock(scope: !4106, file: !31, line: 2299, column: 4)
!4118 = !DILocation(line: 2300, column: 5, scope: !4117)
!4119 = !DILocation(line: 2301, column: 31, scope: !4117)
!4120 = !DILocation(line: 2301, column: 5, scope: !4117)
!4121 = !DILocation(line: 2302, column: 31, scope: !4117)
!4122 = !DILocation(line: 2302, column: 5, scope: !4117)
!4123 = !DILocation(line: 2304, column: 4, scope: !4029)
!4124 = !DILocation(line: 2307, column: 23, scope: !4029)
!4125 = !DILocation(line: 2307, column: 4, scope: !4029)
!4126 = !DILocation(line: 2308, column: 23, scope: !4029)
!4127 = !DILocation(line: 2308, column: 4, scope: !4029)
!4128 = !DILocation(line: 2309, column: 8, scope: !4129)
!4129 = distinct !DILexicalBlock(scope: !4029, file: !31, line: 2309, column: 8)
!4130 = !DILocation(line: 2309, column: 15, scope: !4129)
!4131 = !DILocation(line: 2311, column: 37, scope: !4132)
!4132 = distinct !DILexicalBlock(scope: !4129, file: !31, line: 2310, column: 4)
!4133 = !DILocation(line: 2311, column: 63, scope: !4132)
!4134 = !DILocation(line: 2311, column: 72, scope: !4132)
!4135 = !DILocation(line: 2311, column: 5, scope: !4132)
!4136 = !DILocation(line: 2312, column: 37, scope: !4132)
!4137 = !DILocation(line: 2312, column: 63, scope: !4132)
!4138 = !DILocation(line: 2312, column: 72, scope: !4132)
!4139 = !DILocation(line: 2312, column: 5, scope: !4132)
!4140 = !DILocation(line: 2313, column: 4, scope: !4132)
!4141 = !DILocation(line: 2314, column: 4, scope: !4029)
!4142 = !DILocalVariable(name: "force_vec", scope: !4143, file: !31, line: 2318, type: !54)
!4143 = distinct !DILexicalBlock(scope: !4029, file: !31, line: 2317, column: 3)
!4144 = !DILocation(line: 2318, column: 15, scope: !4143)
!4145 = !DILocation(line: 2322, column: 23, scope: !4143)
!4146 = !DILocation(line: 2322, column: 4, scope: !4143)
!4147 = !DILocation(line: 2323, column: 23, scope: !4143)
!4148 = !DILocation(line: 2323, column: 4, scope: !4143)
!4149 = !DILocation(line: 2325, column: 21, scope: !4143)
!4150 = !DILocation(line: 2325, column: 35, scope: !4143)
!4151 = !DILocation(line: 2325, column: 20, scope: !4143)
!4152 = !DILocation(line: 2325, column: 12, scope: !4143)
!4153 = !DILocation(line: 2325, column: 10, scope: !4143)
!4154 = !DILocation(line: 2327, column: 18, scope: !4143)
!4155 = !DILocation(line: 2329, column: 20, scope: !4143)
!4156 = !DILocation(line: 2329, column: 26, scope: !4143)
!4157 = !DILocation(line: 2329, column: 33, scope: !4143)
!4158 = !DILocation(line: 2329, column: 38, scope: !4143)
!4159 = !DILocation(line: 2329, column: 40, scope: !4143)
!4160 = !DILocation(line: 2329, column: 18, scope: !4143)
!4161 = !DILocation(line: 2329, column: 14, scope: !4143)
!4162 = !DILocation(line: 2329, column: 16, scope: !4143)
!4163 = !DILocation(line: 2330, column: 20, scope: !4143)
!4164 = !DILocation(line: 2330, column: 26, scope: !4143)
!4165 = !DILocation(line: 2330, column: 33, scope: !4143)
!4166 = !DILocation(line: 2330, column: 38, scope: !4143)
!4167 = !DILocation(line: 2330, column: 40, scope: !4143)
!4168 = !DILocation(line: 2330, column: 18, scope: !4143)
!4169 = !DILocation(line: 2330, column: 14, scope: !4143)
!4170 = !DILocation(line: 2330, column: 16, scope: !4143)
!4171 = !DILocation(line: 2331, column: 20, scope: !4143)
!4172 = !DILocation(line: 2331, column: 26, scope: !4143)
!4173 = !DILocation(line: 2331, column: 33, scope: !4143)
!4174 = !DILocation(line: 2331, column: 38, scope: !4143)
!4175 = !DILocation(line: 2331, column: 40, scope: !4143)
!4176 = !DILocation(line: 2331, column: 18, scope: !4143)
!4177 = !DILocation(line: 2331, column: 14, scope: !4143)
!4178 = !DILocation(line: 2331, column: 16, scope: !4143)
!4179 = !DILocation(line: 2332, column: 21, scope: !4143)
!4180 = !DILocation(line: 2332, column: 4, scope: !4143)
!4181 = !DILocation(line: 2334, column: 29, scope: !4143)
!4182 = !DILocation(line: 2334, column: 31, scope: !4143)
!4183 = !DILocation(line: 2334, column: 39, scope: !4143)
!4184 = !DILocation(line: 2334, column: 37, scope: !4143)
!4185 = !DILocation(line: 2334, column: 48, scope: !4143)
!4186 = !DILocation(line: 2334, column: 14, scope: !4143)
!4187 = !DILocation(line: 2334, column: 16, scope: !4143)
!4188 = !DILocation(line: 2335, column: 29, scope: !4143)
!4189 = !DILocation(line: 2335, column: 31, scope: !4143)
!4190 = !DILocation(line: 2335, column: 39, scope: !4143)
!4191 = !DILocation(line: 2335, column: 37, scope: !4143)
!4192 = !DILocation(line: 2335, column: 48, scope: !4143)
!4193 = !DILocation(line: 2335, column: 14, scope: !4143)
!4194 = !DILocation(line: 2335, column: 16, scope: !4143)
!4195 = !DILocation(line: 2336, column: 29, scope: !4143)
!4196 = !DILocation(line: 2336, column: 31, scope: !4143)
!4197 = !DILocation(line: 2336, column: 39, scope: !4143)
!4198 = !DILocation(line: 2336, column: 37, scope: !4143)
!4199 = !DILocation(line: 2336, column: 48, scope: !4143)
!4200 = !DILocation(line: 2336, column: 14, scope: !4143)
!4201 = !DILocation(line: 2336, column: 16, scope: !4143)
!4202 = !DILocation(line: 2337, column: 19, scope: !4143)
!4203 = !DILocation(line: 2337, column: 4, scope: !4143)
!4204 = !DILocation(line: 2340, column: 4, scope: !4029)
!4205 = !DILocalVariable(name: "super_level", scope: !4206, file: !31, line: 2343, type: !7)
!4206 = distinct !DILexicalBlock(scope: !4029, file: !31, line: 2342, column: 3)
!4207 = !DILocation(line: 2343, column: 8, scope: !4206)
!4208 = !DILocation(line: 2344, column: 23, scope: !4206)
!4209 = !DILocation(line: 2344, column: 29, scope: !4206)
!4210 = !DILocation(line: 2344, column: 4, scope: !4206)
!4211 = !DILocation(line: 2345, column: 23, scope: !4206)
!4212 = !DILocation(line: 2345, column: 29, scope: !4206)
!4213 = !DILocation(line: 2345, column: 4, scope: !4206)
!4214 = !DILocation(line: 2347, column: 8, scope: !4215)
!4215 = distinct !DILexicalBlock(scope: !4206, file: !31, line: 2347, column: 8)
!4216 = !DILocation(line: 2347, column: 14, scope: !4215)
!4217 = !DILocation(line: 2350, column: 24, scope: !4218)
!4218 = distinct !DILexicalBlock(scope: !4215, file: !31, line: 2348, column: 4)
!4219 = !DILocation(line: 2350, column: 30, scope: !4218)
!4220 = !DILocation(line: 2350, column: 5, scope: !4218)
!4221 = !DILocation(line: 2351, column: 24, scope: !4218)
!4222 = !DILocation(line: 2351, column: 30, scope: !4218)
!4223 = !DILocation(line: 2351, column: 5, scope: !4218)
!4224 = !DILocation(line: 2352, column: 4, scope: !4218)
!4225 = !DILocation(line: 2353, column: 4, scope: !4206)
!4226 = !DILocalVariable(name: "make_sound", scope: !4227, file: !31, line: 2358, type: !7)
!4227 = distinct !DILexicalBlock(scope: !4029, file: !31, line: 2356, column: 3)
!4228 = !DILocation(line: 2358, column: 8, scope: !4227)
!4229 = !DILocation(line: 2362, column: 30, scope: !4227)
!4230 = !DILocation(line: 2362, column: 50, scope: !4227)
!4231 = !DILocation(line: 2362, column: 58, scope: !4227)
!4232 = !DILocation(line: 2362, column: 61, scope: !4227)
!4233 = !DILocation(line: 2362, column: 72, scope: !4227)
!4234 = !DILocation(line: 2362, column: 77, scope: !4227)
!4235 = !DILocation(line: 2362, column: 85, scope: !4227)
!4236 = !DILocation(line: 2362, column: 88, scope: !4227)
!4237 = !DILocation(line: 2362, column: 99, scope: !4227)
!4238 = !DILocation(line: 2362, column: 103, scope: !4227)
!4239 = !DILocation(line: 2362, column: 4, scope: !4227)
!4240 = !DILocation(line: 2363, column: 8, scope: !4241)
!4241 = distinct !DILexicalBlock(scope: !4227, file: !31, line: 2363, column: 8)
!4242 = !DILocation(line: 2363, column: 15, scope: !4241)
!4243 = !DILocation(line: 2365, column: 31, scope: !4244)
!4244 = distinct !DILexicalBlock(scope: !4241, file: !31, line: 2364, column: 4)
!4245 = !DILocation(line: 2365, column: 51, scope: !4244)
!4246 = !DILocation(line: 2365, column: 59, scope: !4244)
!4247 = !DILocation(line: 2365, column: 62, scope: !4244)
!4248 = !DILocation(line: 2365, column: 73, scope: !4244)
!4249 = !DILocation(line: 2365, column: 78, scope: !4244)
!4250 = !DILocation(line: 2365, column: 86, scope: !4244)
!4251 = !DILocation(line: 2365, column: 89, scope: !4244)
!4252 = !DILocation(line: 2365, column: 100, scope: !4244)
!4253 = !DILocation(line: 2365, column: 5, scope: !4244)
!4254 = !DILocation(line: 2366, column: 9, scope: !4255)
!4255 = distinct !DILexicalBlock(scope: !4244, file: !31, line: 2366, column: 9)
!4256 = !DILocation(line: 2366, column: 16, scope: !4255)
!4257 = !DILocation(line: 2368, column: 32, scope: !4258)
!4258 = distinct !DILexicalBlock(scope: !4255, file: !31, line: 2367, column: 5)
!4259 = !DILocation(line: 2368, column: 52, scope: !4258)
!4260 = !DILocation(line: 2368, column: 60, scope: !4258)
!4261 = !DILocation(line: 2368, column: 63, scope: !4258)
!4262 = !DILocation(line: 2368, column: 74, scope: !4258)
!4263 = !DILocation(line: 2368, column: 79, scope: !4258)
!4264 = !DILocation(line: 2368, column: 87, scope: !4258)
!4265 = !DILocation(line: 2368, column: 90, scope: !4258)
!4266 = !DILocation(line: 2368, column: 101, scope: !4258)
!4267 = !DILocation(line: 2368, column: 6, scope: !4258)
!4268 = !DILocation(line: 2369, column: 5, scope: !4258)
!4269 = !DILocation(line: 2370, column: 4, scope: !4244)
!4270 = !DILocation(line: 2371, column: 4, scope: !4227)
!4271 = !DILocalVariable(name: "helix_orient", scope: !4272, file: !31, line: 2375, type: !7)
!4272 = distinct !DILexicalBlock(scope: !4029, file: !31, line: 2374, column: 3)
!4273 = !DILocation(line: 2375, column: 8, scope: !4272)
!4274 = !DILocalVariable(name: "spreadr", scope: !4272, file: !31, line: 2376, type: !21)
!4275 = !DILocation(line: 2376, column: 8, scope: !4272)
!4276 = !DILocalVariable(name: "spreadu", scope: !4272, file: !31, line: 2376, type: !21)
!4277 = !DILocation(line: 2376, column: 16, scope: !4272)
!4278 = !DILocation(line: 2377, column: 20, scope: !4272)
!4279 = !DILocation(line: 2377, column: 26, scope: !4272)
!4280 = !DILocation(line: 2377, column: 48, scope: !4272)
!4281 = !DILocation(line: 2377, column: 17, scope: !4272)
!4282 = !DILocation(line: 2378, column: 11, scope: !4272)
!4283 = !DILocation(line: 2378, column: 4, scope: !4272)
!4284 = !DILocation(line: 2380, column: 21, scope: !4285)
!4285 = distinct !DILexicalBlock(scope: !4272, file: !31, line: 2379, column: 4)
!4286 = !DILocation(line: 2380, column: 41, scope: !4285)
!4287 = !DILocation(line: 2380, column: 52, scope: !4285)
!4288 = !DILocation(line: 2381, column: 21, scope: !4285)
!4289 = !DILocation(line: 2381, column: 41, scope: !4285)
!4290 = !DILocation(line: 2381, column: 52, scope: !4285)
!4291 = !DILocation(line: 2382, column: 21, scope: !4285)
!4292 = !DILocation(line: 2382, column: 41, scope: !4285)
!4293 = !DILocation(line: 2382, column: 52, scope: !4285)
!4294 = !DILocation(line: 2383, column: 21, scope: !4285)
!4295 = !DILocation(line: 2383, column: 41, scope: !4285)
!4296 = !DILocation(line: 2383, column: 52, scope: !4285)
!4297 = !DILocation(line: 2384, column: 21, scope: !4285)
!4298 = !DILocation(line: 2384, column: 41, scope: !4285)
!4299 = !DILocation(line: 2384, column: 52, scope: !4285)
!4300 = !DILocation(line: 2385, column: 21, scope: !4285)
!4301 = !DILocation(line: 2385, column: 41, scope: !4285)
!4302 = !DILocation(line: 2385, column: 52, scope: !4285)
!4303 = !DILocation(line: 2386, column: 21, scope: !4285)
!4304 = !DILocation(line: 2386, column: 41, scope: !4285)
!4305 = !DILocation(line: 2386, column: 52, scope: !4285)
!4306 = !DILocation(line: 2387, column: 21, scope: !4285)
!4307 = !DILocation(line: 2387, column: 41, scope: !4285)
!4308 = !DILocation(line: 2387, column: 52, scope: !4285)
!4309 = !DILocation(line: 2389, column: 51, scope: !4285)
!4310 = !DILocation(line: 2389, column: 6, scope: !4285)
!4311 = !DILocation(line: 2390, column: 4, scope: !4285)
!4312 = !DILocation(line: 2392, column: 30, scope: !4272)
!4313 = !DILocation(line: 2392, column: 4, scope: !4272)
!4314 = !DILocation(line: 2393, column: 30, scope: !4272)
!4315 = !DILocation(line: 2393, column: 50, scope: !4272)
!4316 = !DILocation(line: 2393, column: 60, scope: !4272)
!4317 = !DILocation(line: 2393, column: 4, scope: !4272)
!4318 = !DILocation(line: 2394, column: 30, scope: !4272)
!4319 = !DILocation(line: 2394, column: 50, scope: !4272)
!4320 = !DILocation(line: 2394, column: 49, scope: !4272)
!4321 = !DILocation(line: 2394, column: 60, scope: !4272)
!4322 = !DILocation(line: 2394, column: 59, scope: !4272)
!4323 = !DILocation(line: 2394, column: 4, scope: !4272)
!4324 = !DILocation(line: 2395, column: 30, scope: !4272)
!4325 = !DILocation(line: 2395, column: 50, scope: !4272)
!4326 = !DILocation(line: 2395, column: 57, scope: !4272)
!4327 = !DILocation(line: 2395, column: 62, scope: !4272)
!4328 = !DILocation(line: 2395, column: 69, scope: !4272)
!4329 = !DILocation(line: 2395, column: 4, scope: !4272)
!4330 = !DILocation(line: 2396, column: 30, scope: !4272)
!4331 = !DILocation(line: 2396, column: 50, scope: !4272)
!4332 = !DILocation(line: 2396, column: 49, scope: !4272)
!4333 = !DILocation(line: 2396, column: 57, scope: !4272)
!4334 = !DILocation(line: 2396, column: 62, scope: !4272)
!4335 = !DILocation(line: 2396, column: 61, scope: !4272)
!4336 = !DILocation(line: 2396, column: 69, scope: !4272)
!4337 = !DILocation(line: 2396, column: 4, scope: !4272)
!4338 = !DILocation(line: 2397, column: 4, scope: !4272)
!4339 = !DILocation(line: 2401, column: 23, scope: !4029)
!4340 = !DILocation(line: 2401, column: 4, scope: !4029)
!4341 = !DILocation(line: 2402, column: 23, scope: !4029)
!4342 = !DILocation(line: 2402, column: 4, scope: !4029)
!4343 = !DILocation(line: 2403, column: 8, scope: !4344)
!4344 = distinct !DILexicalBlock(scope: !4029, file: !31, line: 2403, column: 8)
!4345 = !DILocation(line: 2403, column: 15, scope: !4344)
!4346 = !DILocation(line: 2405, column: 37, scope: !4347)
!4347 = distinct !DILexicalBlock(scope: !4344, file: !31, line: 2404, column: 4)
!4348 = !DILocation(line: 2405, column: 64, scope: !4347)
!4349 = !DILocation(line: 2405, column: 73, scope: !4347)
!4350 = !DILocation(line: 2405, column: 5, scope: !4347)
!4351 = !DILocation(line: 2406, column: 37, scope: !4347)
!4352 = !DILocation(line: 2406, column: 64, scope: !4347)
!4353 = !DILocation(line: 2406, column: 73, scope: !4347)
!4354 = !DILocation(line: 2406, column: 5, scope: !4347)
!4355 = !DILocation(line: 2407, column: 4, scope: !4347)
!4356 = !DILocation(line: 2408, column: 4, scope: !4029)
!4357 = !DILocation(line: 2411, column: 8, scope: !4358)
!4358 = distinct !DILexicalBlock(scope: !4029, file: !31, line: 2411, column: 8)
!4359 = !DILocation(line: 2411, column: 28, scope: !4358)
!4360 = !DILocation(line: 2412, column: 24, scope: !4358)
!4361 = !DILocation(line: 2412, column: 5, scope: !4358)
!4362 = !DILocation(line: 2415, column: 29, scope: !4363)
!4363 = distinct !DILexicalBlock(scope: !4358, file: !31, line: 2414, column: 4)
!4364 = !DILocation(line: 2415, column: 35, scope: !4363)
!4365 = !DILocation(line: 2415, column: 42, scope: !4363)
!4366 = !DILocation(line: 2415, column: 49, scope: !4363)
!4367 = !DILocation(line: 2415, column: 55, scope: !4363)
!4368 = !DILocation(line: 2415, column: 60, scope: !4363)
!4369 = !DILocation(line: 2415, column: 66, scope: !4363)
!4370 = !DILocation(line: 2415, column: 74, scope: !4363)
!4371 = !DILocation(line: 2415, column: 79, scope: !4363)
!4372 = !DILocation(line: 2415, column: 5, scope: !4363)
!4373 = !DILocation(line: 2416, column: 50, scope: !4363)
!4374 = !DILocation(line: 2416, column: 48, scope: !4363)
!4375 = !DILocation(line: 2416, column: 26, scope: !4363)
!4376 = !DILocation(line: 2418, column: 4, scope: !4029)
!4377 = !DILocation(line: 2421, column: 4, scope: !4029)
!4378 = !DILocation(line: 2422, column: 19, scope: !4029)
!4379 = !DILocation(line: 2423, column: 2, scope: !4029)
!4380 = !DILocation(line: 2438, column: 9, scope: !4008)
!4381 = !DILocation(line: 2438, column: 2, scope: !4008)
!4382 = distinct !DISubprogram(name: "create_lightning_blobs", linkageName: "_Z22create_lightning_blobsP10vms_vectorS0_ii", scope: !31, file: !31, line: 2130, type: !4383, scopeLine: 2131, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !320)
!4383 = !DISubroutineType(types: !4384)
!4384 = !{!7, !733, !733, !7, !7}
!4385 = !DILocalVariable(name: "direction", arg: 1, scope: !4382, file: !31, line: 2130, type: !733)
!4386 = !DILocation(line: 2130, column: 40, scope: !4382)
!4387 = !DILocalVariable(name: "start_pos", arg: 2, scope: !4382, file: !31, line: 2130, type: !733)
!4388 = !DILocation(line: 2130, column: 63, scope: !4382)
!4389 = !DILocalVariable(name: "start_segnum", arg: 3, scope: !4382, file: !31, line: 2130, type: !7)
!4390 = !DILocation(line: 2130, column: 78, scope: !4382)
!4391 = !DILocalVariable(name: "parent", arg: 4, scope: !4382, file: !31, line: 2130, type: !7)
!4392 = !DILocation(line: 2130, column: 96, scope: !4382)
!4393 = !DILocalVariable(name: "i", scope: !4382, file: !31, line: 2132, type: !7)
!4394 = !DILocation(line: 2132, column: 8, scope: !4382)
!4395 = !DILocalVariable(name: "fq", scope: !4382, file: !31, line: 2133, type: !1457)
!4396 = !DILocation(line: 2133, column: 12, scope: !4382)
!4397 = !DILocalVariable(name: "hit_data", scope: !4382, file: !31, line: 2134, type: !1471)
!4398 = !DILocation(line: 2134, column: 12, scope: !4382)
!4399 = !DILocalVariable(name: "end_pos", scope: !4382, file: !31, line: 2135, type: !54)
!4400 = !DILocation(line: 2135, column: 13, scope: !4382)
!4401 = !DILocalVariable(name: "norm_dir", scope: !4382, file: !31, line: 2136, type: !54)
!4402 = !DILocation(line: 2136, column: 13, scope: !4382)
!4403 = !DILocalVariable(name: "fate", scope: !4382, file: !31, line: 2137, type: !7)
!4404 = !DILocation(line: 2137, column: 8, scope: !4382)
!4405 = !DILocalVariable(name: "num_blobs", scope: !4382, file: !31, line: 2138, type: !7)
!4406 = !DILocation(line: 2138, column: 8, scope: !4382)
!4407 = !DILocalVariable(name: "tvec", scope: !4382, file: !31, line: 2139, type: !54)
!4408 = !DILocation(line: 2139, column: 13, scope: !4382)
!4409 = !DILocalVariable(name: "dist_to_hit_point", scope: !4382, file: !31, line: 2140, type: !21)
!4410 = !DILocation(line: 2140, column: 8, scope: !4382)
!4411 = !DILocalVariable(name: "point_pos", scope: !4382, file: !31, line: 2141, type: !54)
!4412 = !DILocation(line: 2141, column: 13, scope: !4382)
!4413 = !DILocalVariable(name: "delta_pos", scope: !4382, file: !31, line: 2141, type: !54)
!4414 = !DILocation(line: 2141, column: 24, scope: !4382)
!4415 = !DILocalVariable(name: "objnum", scope: !4382, file: !31, line: 2142, type: !7)
!4416 = !DILocation(line: 2142, column: 8, scope: !4382)
!4417 = !DILocalVariable(name: "gun_pos", scope: !4382, file: !31, line: 2143, type: !733)
!4418 = !DILocation(line: 2143, column: 14, scope: !4382)
!4419 = !DILocalVariable(name: "m", scope: !4382, file: !31, line: 2144, type: !62)
!4420 = !DILocation(line: 2144, column: 13, scope: !4382)
!4421 = !DILocalVariable(name: "gun_pos2", scope: !4382, file: !31, line: 2145, type: !54)
!4422 = !DILocation(line: 2145, column: 13, scope: !4382)
!4423 = !DILocation(line: 2147, column: 14, scope: !4424)
!4424 = distinct !DILexicalBlock(scope: !4382, file: !31, line: 2147, column: 6)
!4425 = !DILocation(line: 2147, column: 6, scope: !4424)
!4426 = !DILocation(line: 2147, column: 26, scope: !4424)
!4427 = !DILocation(line: 2147, column: 33, scope: !4424)
!4428 = !DILocation(line: 2148, column: 11, scope: !4424)
!4429 = !DILocation(line: 2148, column: 3, scope: !4424)
!4430 = !DILocation(line: 2148, column: 23, scope: !4424)
!4431 = !DILocation(line: 2148, column: 30, scope: !4424)
!4432 = !DILocation(line: 2150, column: 14, scope: !4433)
!4433 = distinct !DILexicalBlock(scope: !4382, file: !31, line: 2150, column: 6)
!4434 = !DILocation(line: 2150, column: 6, scope: !4433)
!4435 = !DILocation(line: 2150, column: 26, scope: !4433)
!4436 = !DILocation(line: 2150, column: 33, scope: !4433)
!4437 = !DILocation(line: 2151, column: 11, scope: !4438)
!4438 = distinct !DILexicalBlock(scope: !4433, file: !31, line: 2150, column: 42)
!4439 = !DILocation(line: 2151, column: 3, scope: !4438)
!4440 = !DILocation(line: 2151, column: 23, scope: !4438)
!4441 = !DILocation(line: 2151, column: 30, scope: !4438)
!4442 = !DILocation(line: 2152, column: 3, scope: !4438)
!4443 = !DILocation(line: 2153, column: 3, scope: !4438)
!4444 = !DILocation(line: 2156, column: 14, scope: !4382)
!4445 = !DILocation(line: 2156, column: 11, scope: !4382)
!4446 = !DILocation(line: 2158, column: 2, scope: !4382)
!4447 = !DILocation(line: 2159, column: 29, scope: !4382)
!4448 = !DILocation(line: 2159, column: 2, scope: !4382)
!4449 = !DILocation(line: 2161, column: 10, scope: !4382)
!4450 = !DILocation(line: 2161, column: 5, scope: !4382)
!4451 = !DILocation(line: 2161, column: 8, scope: !4382)
!4452 = !DILocation(line: 2162, column: 16, scope: !4382)
!4453 = !DILocation(line: 2162, column: 5, scope: !4382)
!4454 = !DILocation(line: 2162, column: 14, scope: !4382)
!4455 = !DILocation(line: 2163, column: 5, scope: !4382)
!4456 = !DILocation(line: 2163, column: 8, scope: !4382)
!4457 = !DILocation(line: 2164, column: 5, scope: !4382)
!4458 = !DILocation(line: 2164, column: 9, scope: !4382)
!4459 = !DILocation(line: 2165, column: 18, scope: !4382)
!4460 = !DILocation(line: 2165, column: 5, scope: !4382)
!4461 = !DILocation(line: 2165, column: 16, scope: !4382)
!4462 = !DILocation(line: 2166, column: 5, scope: !4382)
!4463 = !DILocation(line: 2166, column: 21, scope: !4382)
!4464 = !DILocation(line: 2167, column: 5, scope: !4382)
!4465 = !DILocation(line: 2167, column: 11, scope: !4382)
!4466 = !DILocation(line: 2169, column: 9, scope: !4382)
!4467 = !DILocation(line: 2169, column: 7, scope: !4382)
!4468 = !DILocation(line: 2170, column: 15, scope: !4469)
!4469 = distinct !DILexicalBlock(scope: !4382, file: !31, line: 2170, column: 6)
!4470 = !DILocation(line: 2170, column: 23, scope: !4469)
!4471 = !DILocation(line: 2171, column: 3, scope: !4472)
!4472 = distinct !DILexicalBlock(scope: !4469, file: !31, line: 2170, column: 30)
!4473 = !DILocation(line: 2172, column: 3, scope: !4472)
!4474 = !DILocation(line: 2175, column: 61, scope: !4382)
!4475 = !DILocation(line: 2175, column: 70, scope: !4382)
!4476 = !DILocation(line: 2175, column: 33, scope: !4382)
!4477 = !DILocation(line: 2175, column: 22, scope: !4382)
!4478 = !DILocation(line: 2175, column: 20, scope: !4382)
!4479 = !DILocation(line: 2176, column: 14, scope: !4382)
!4480 = !DILocation(line: 2176, column: 32, scope: !4382)
!4481 = !DILocation(line: 2176, column: 12, scope: !4382)
!4482 = !DILocation(line: 2178, column: 6, scope: !4483)
!4483 = distinct !DILexicalBlock(scope: !4382, file: !31, line: 2178, column: 6)
!4484 = !DILocation(line: 2178, column: 16, scope: !4483)
!4485 = !DILocation(line: 2179, column: 13, scope: !4483)
!4486 = !DILocation(line: 2179, column: 3, scope: !4483)
!4487 = !DILocation(line: 2181, column: 6, scope: !4488)
!4488 = distinct !DILexicalBlock(scope: !4382, file: !31, line: 2181, column: 6)
!4489 = !DILocation(line: 2181, column: 16, scope: !4488)
!4490 = !DILocation(line: 2182, column: 13, scope: !4488)
!4491 = !DILocation(line: 2182, column: 3, scope: !4488)
!4492 = !DILocation(line: 2185, column: 13, scope: !4382)
!4493 = !DILocation(line: 2185, column: 26, scope: !4382)
!4494 = !DILocation(line: 2185, column: 37, scope: !4382)
!4495 = !DILocation(line: 2185, column: 10, scope: !4382)
!4496 = !DILocation(line: 2186, column: 40, scope: !4382)
!4497 = !DILocation(line: 2186, column: 32, scope: !4382)
!4498 = !DILocation(line: 2186, column: 48, scope: !4382)
!4499 = !DILocation(line: 2186, column: 2, scope: !4382)
!4500 = !DILocation(line: 2187, column: 27, scope: !4382)
!4501 = !DILocation(line: 2187, column: 2, scope: !4382)
!4502 = !DILocation(line: 2188, column: 34, scope: !4382)
!4503 = !DILocation(line: 2188, column: 26, scope: !4382)
!4504 = !DILocation(line: 2188, column: 42, scope: !4382)
!4505 = !DILocation(line: 2188, column: 2, scope: !4382)
!4506 = !DILocation(line: 2190, column: 12, scope: !4382)
!4507 = !DILocation(line: 2191, column: 27, scope: !4382)
!4508 = !DILocation(line: 2191, column: 47, scope: !4382)
!4509 = !DILocation(line: 2191, column: 45, scope: !4382)
!4510 = !DILocation(line: 2191, column: 2, scope: !4382)
!4511 = !DILocation(line: 2193, column: 9, scope: !4512)
!4512 = distinct !DILexicalBlock(scope: !4382, file: !31, line: 2193, column: 2)
!4513 = !DILocation(line: 2193, column: 7, scope: !4512)
!4514 = !DILocation(line: 2193, column: 14, scope: !4515)
!4515 = distinct !DILexicalBlock(scope: !4512, file: !31, line: 2193, column: 2)
!4516 = !DILocation(line: 2193, column: 18, scope: !4515)
!4517 = !DILocation(line: 2193, column: 16, scope: !4515)
!4518 = !DILocation(line: 2193, column: 2, scope: !4512)
!4519 = !DILocalVariable(name: "point_seg", scope: !4520, file: !31, line: 2194, type: !7)
!4520 = distinct !DILexicalBlock(scope: !4515, file: !31, line: 2193, column: 34)
!4521 = !DILocation(line: 2194, column: 9, scope: !4520)
!4522 = !DILocalVariable(name: "obj", scope: !4520, file: !31, line: 2195, type: !33)
!4523 = !DILocation(line: 2195, column: 11, scope: !4520)
!4524 = !DILocation(line: 2197, column: 3, scope: !4520)
!4525 = !DILocation(line: 2198, column: 42, scope: !4520)
!4526 = !DILocation(line: 2198, column: 15, scope: !4520)
!4527 = !DILocation(line: 2198, column: 13, scope: !4520)
!4528 = !DILocation(line: 2199, column: 7, scope: !4529)
!4529 = distinct !DILexicalBlock(scope: !4520, file: !31, line: 2199, column: 7)
!4530 = !DILocation(line: 2199, column: 17, scope: !4529)
!4531 = !DILocation(line: 2200, column: 4, scope: !4529)
!4532 = !DILocation(line: 2202, column: 29, scope: !4520)
!4533 = !DILocation(line: 2202, column: 52, scope: !4520)
!4534 = !DILocation(line: 2202, column: 63, scope: !4520)
!4535 = !DILocation(line: 2202, column: 12, scope: !4520)
!4536 = !DILocation(line: 2202, column: 10, scope: !4520)
!4537 = !DILocation(line: 2204, column: 7, scope: !4538)
!4538 = distinct !DILexicalBlock(scope: !4520, file: !31, line: 2204, column: 7)
!4539 = !DILocation(line: 2204, column: 14, scope: !4538)
!4540 = !DILocation(line: 2205, column: 4, scope: !4541)
!4541 = distinct !DILexicalBlock(scope: !4538, file: !31, line: 2204, column: 19)
!4542 = !DILocation(line: 2206, column: 4, scope: !4541)
!4543 = !DILocation(line: 2207, column: 4, scope: !4541)
!4544 = !DILocation(line: 2210, column: 18, scope: !4520)
!4545 = !DILocation(line: 2210, column: 10, scope: !4520)
!4546 = !DILocation(line: 2210, column: 7, scope: !4520)
!4547 = !DILocation(line: 2212, column: 32, scope: !4520)
!4548 = !DILocation(line: 2212, column: 37, scope: !4520)
!4549 = !DILocation(line: 2212, column: 20, scope: !4520)
!4550 = !DILocation(line: 2212, column: 41, scope: !4520)
!4551 = !DILocation(line: 2212, column: 3, scope: !4520)
!4552 = !DILocation(line: 2214, column: 17, scope: !4520)
!4553 = !DILocation(line: 2214, column: 22, scope: !4520)
!4554 = !DILocation(line: 2214, column: 38, scope: !4520)
!4555 = !DILocation(line: 2214, column: 3, scope: !4520)
!4556 = !DILocation(line: 2216, column: 3, scope: !4520)
!4557 = !DILocation(line: 2216, column: 8, scope: !4520)
!4558 = !DILocation(line: 2216, column: 17, scope: !4520)
!4559 = !DILocation(line: 2218, column: 2, scope: !4520)
!4560 = !DILocation(line: 2193, column: 30, scope: !4515)
!4561 = !DILocation(line: 2193, column: 2, scope: !4515)
!4562 = distinct !{!4562, !4518, !4563, !948}
!4563 = !DILocation(line: 2218, column: 2, scope: !4512)
!4564 = !DILocation(line: 2220, column: 9, scope: !4382)
!4565 = !DILocation(line: 2220, column: 2, scope: !4382)
!4566 = !DILocation(line: 2222, column: 1, scope: !4382)
!4567 = distinct !DISubprogram(name: "lightning_frame", linkageName: "_Z15lightning_framev", scope: !31, file: !31, line: 2229, type: !1247, scopeLine: 2230, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2)
!4568 = !DILocation(line: 2231, column: 7, scope: !4569)
!4569 = distinct !DILexicalBlock(scope: !4567, file: !31, line: 2231, column: 6)
!4570 = !DILocation(line: 2231, column: 18, scope: !4569)
!4571 = !DILocation(line: 2231, column: 16, scope: !4569)
!4572 = !DILocation(line: 2231, column: 39, scope: !4569)
!4573 = !DILocation(line: 2231, column: 57, scope: !4569)
!4574 = !DILocation(line: 2231, column: 61, scope: !4569)
!4575 = !DILocation(line: 2231, column: 72, scope: !4569)
!4576 = !DILocation(line: 2231, column: 70, scope: !4569)
!4577 = !DILocation(line: 2231, column: 93, scope: !4569)
!4578 = !DILocation(line: 2232, column: 7, scope: !4579)
!4579 = distinct !DILexicalBlock(scope: !4580, file: !31, line: 2232, column: 7)
!4580 = distinct !DILexicalBlock(scope: !4569, file: !31, line: 2231, column: 99)
!4581 = !DILocation(line: 2232, column: 18, scope: !4579)
!4582 = !DILocation(line: 2232, column: 16, scope: !4579)
!4583 = !DILocation(line: 2232, column: 38, scope: !4579)
!4584 = !DILocation(line: 2233, column: 28, scope: !4585)
!4585 = distinct !DILexicalBlock(scope: !4579, file: !31, line: 2232, column: 57)
!4586 = !DILocation(line: 2233, column: 43, scope: !4585)
!4587 = !DILocation(line: 2233, column: 50, scope: !4585)
!4588 = !DILocation(line: 2233, column: 57, scope: !4585)
!4589 = !DILocation(line: 2233, column: 72, scope: !4585)
!4590 = !DILocation(line: 2233, column: 77, scope: !4585)
!4591 = !DILocation(line: 2233, column: 92, scope: !4585)
!4592 = !DILocation(line: 2233, column: 100, scope: !4585)
!4593 = !DILocation(line: 2233, column: 114, scope: !4585)
!4594 = !DILocation(line: 2233, column: 4, scope: !4585)
!4595 = !DILocation(line: 2234, column: 26, scope: !4585)
!4596 = !DILocation(line: 2234, column: 24, scope: !4585)
!4597 = !DILocation(line: 2235, column: 3, scope: !4585)
!4598 = !DILocation(line: 2236, column: 2, scope: !4580)
!4599 = !DILocation(line: 2237, column: 1, scope: !4567)
!4600 = distinct !DISubprogram(name: "create_homing_missile", linkageName: "_Z21create_homing_missileP6objectiii", scope: !31, file: !31, line: 2446, type: !4601, scopeLine: 2447, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !320)
!4601 = !DISubroutineType(types: !4602)
!4602 = !{!7, !33, !7, !7, !7}
!4603 = !DILocalVariable(name: "objp", arg: 1, scope: !4600, file: !31, line: 2446, type: !33)
!4604 = !DILocation(line: 2446, column: 35, scope: !4600)
!4605 = !DILocalVariable(name: "goal_obj", arg: 2, scope: !4600, file: !31, line: 2446, type: !7)
!4606 = !DILocation(line: 2446, column: 45, scope: !4600)
!4607 = !DILocalVariable(name: "objtype", arg: 3, scope: !4600, file: !31, line: 2446, type: !7)
!4608 = !DILocation(line: 2446, column: 59, scope: !4600)
!4609 = !DILocalVariable(name: "make_sound", arg: 4, scope: !4600, file: !31, line: 2446, type: !7)
!4610 = !DILocation(line: 2446, column: 72, scope: !4600)
!4611 = !DILocalVariable(name: "objnum", scope: !4600, file: !31, line: 2482, type: !7)
!4612 = !DILocation(line: 2482, column: 8, scope: !4600)
!4613 = !DILocalVariable(name: "vector_to_goal", scope: !4600, file: !31, line: 2483, type: !54)
!4614 = !DILocation(line: 2483, column: 13, scope: !4600)
!4615 = !DILocalVariable(name: "random_vector", scope: !4600, file: !31, line: 2484, type: !54)
!4616 = !DILocation(line: 2484, column: 13, scope: !4600)
!4617 = !DILocation(line: 2487, column: 6, scope: !4618)
!4618 = distinct !DILexicalBlock(scope: !4600, file: !31, line: 2487, column: 6)
!4619 = !DILocation(line: 2487, column: 15, scope: !4618)
!4620 = !DILocation(line: 2488, column: 3, scope: !4621)
!4621 = distinct !DILexicalBlock(scope: !4618, file: !31, line: 2487, column: 22)
!4622 = !DILocation(line: 2489, column: 2, scope: !4621)
!4623 = !DILocation(line: 2490, column: 57, scope: !4624)
!4624 = distinct !DILexicalBlock(scope: !4618, file: !31, line: 2489, column: 9)
!4625 = !DILocation(line: 2490, column: 49, scope: !4624)
!4626 = !DILocation(line: 2490, column: 67, scope: !4624)
!4627 = !DILocation(line: 2490, column: 73, scope: !4624)
!4628 = !DILocation(line: 2490, column: 79, scope: !4624)
!4629 = !DILocation(line: 2490, column: 3, scope: !4624)
!4630 = !DILocation(line: 2491, column: 3, scope: !4624)
!4631 = !DILocation(line: 2492, column: 3, scope: !4624)
!4632 = !DILocation(line: 2493, column: 3, scope: !4624)
!4633 = !DILocation(line: 2497, column: 46, scope: !4600)
!4634 = !DILocation(line: 2497, column: 52, scope: !4600)
!4635 = !DILocation(line: 2497, column: 57, scope: !4600)
!4636 = !DILocation(line: 2497, column: 63, scope: !4600)
!4637 = !DILocation(line: 2497, column: 71, scope: !4600)
!4638 = !DILocation(line: 2497, column: 75, scope: !4600)
!4639 = !DILocation(line: 2497, column: 85, scope: !4600)
!4640 = !DILocation(line: 2497, column: 94, scope: !4600)
!4641 = !DILocation(line: 2497, column: 11, scope: !4600)
!4642 = !DILocation(line: 2497, column: 9, scope: !4600)
!4643 = !DILocation(line: 2498, column: 6, scope: !4644)
!4644 = distinct !DILexicalBlock(scope: !4600, file: !31, line: 2498, column: 6)
!4645 = !DILocation(line: 2498, column: 13, scope: !4644)
!4646 = !DILocation(line: 2499, column: 3, scope: !4644)
!4647 = !DILocation(line: 2507, column: 48, scope: !4600)
!4648 = !DILocation(line: 2507, column: 10, scope: !4600)
!4649 = !DILocation(line: 2507, column: 2, scope: !4600)
!4650 = !DILocation(line: 2507, column: 18, scope: !4600)
!4651 = !DILocation(line: 2507, column: 35, scope: !4600)
!4652 = !DILocation(line: 2507, column: 46, scope: !4600)
!4653 = !DILocation(line: 2509, column: 9, scope: !4600)
!4654 = !DILocation(line: 2509, column: 2, scope: !4600)
!4655 = !DILocation(line: 2511, column: 1, scope: !4600)
!4656 = distinct !DISubprogram(name: "create_smart_children", linkageName: "_Z21create_smart_childrenP6objecti", scope: !31, file: !31, line: 2517, type: !4657, scopeLine: 2518, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !320)
!4657 = !DISubroutineType(types: !4658)
!4658 = !{null, !33, !7}
!4659 = !DILocalVariable(name: "objp", arg: 1, scope: !4656, file: !31, line: 2517, type: !33)
!4660 = !DILocation(line: 2517, column: 36, scope: !4656)
!4661 = !DILocalVariable(name: "num_smart_children", arg: 2, scope: !4656, file: !31, line: 2517, type: !7)
!4662 = !DILocation(line: 2517, column: 46, scope: !4656)
!4663 = !DILocalVariable(name: "make_sound", scope: !4656, file: !31, line: 2519, type: !7)
!4664 = !DILocation(line: 2519, column: 7, scope: !4656)
!4665 = !DILocalVariable(name: "numobjs", scope: !4656, file: !31, line: 2520, type: !7)
!4666 = !DILocation(line: 2520, column: 7, scope: !4656)
!4667 = !DILocalVariable(name: "parent_type", scope: !4656, file: !31, line: 2521, type: !7)
!4668 = !DILocation(line: 2521, column: 7, scope: !4656)
!4669 = !DILocalVariable(name: "parent_num", scope: !4656, file: !31, line: 2521, type: !7)
!4670 = !DILocation(line: 2521, column: 20, scope: !4656)
!4671 = !DILocalVariable(name: "objlist", scope: !4656, file: !31, line: 2522, type: !4672)
!4672 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 960, elements: !304)
!4673 = !DILocation(line: 2522, column: 7, scope: !4656)
!4674 = !DILocalVariable(name: "blob_id", scope: !4656, file: !31, line: 2523, type: !7)
!4675 = !DILocation(line: 2523, column: 7, scope: !4656)
!4676 = !DILocation(line: 2525, column: 6, scope: !4677)
!4677 = distinct !DILexicalBlock(scope: !4656, file: !31, line: 2525, column: 6)
!4678 = !DILocation(line: 2525, column: 12, scope: !4677)
!4679 = !DILocation(line: 2525, column: 17, scope: !4677)
!4680 = !DILocation(line: 2527, column: 17, scope: !4681)
!4681 = distinct !DILexicalBlock(scope: !4677, file: !31, line: 2526, column: 2)
!4682 = !DILocation(line: 2527, column: 23, scope: !4681)
!4683 = !DILocation(line: 2527, column: 40, scope: !4681)
!4684 = !DILocation(line: 2527, column: 15, scope: !4681)
!4685 = !DILocation(line: 2528, column: 16, scope: !4681)
!4686 = !DILocation(line: 2528, column: 22, scope: !4681)
!4687 = !DILocation(line: 2528, column: 39, scope: !4681)
!4688 = !DILocation(line: 2528, column: 14, scope: !4681)
!4689 = !DILocation(line: 2529, column: 2, scope: !4681)
!4690 = !DILocation(line: 2530, column: 11, scope: !4691)
!4691 = distinct !DILexicalBlock(scope: !4677, file: !31, line: 2530, column: 11)
!4692 = !DILocation(line: 2530, column: 17, scope: !4691)
!4693 = !DILocation(line: 2530, column: 22, scope: !4691)
!4694 = !DILocation(line: 2532, column: 7, scope: !4695)
!4695 = distinct !DILexicalBlock(scope: !4696, file: !31, line: 2532, column: 7)
!4696 = distinct !DILexicalBlock(scope: !4691, file: !31, line: 2531, column: 2)
!4697 = !DILocation(line: 2532, column: 27, scope: !4695)
!4698 = !DILocation(line: 2534, column: 18, scope: !4699)
!4699 = distinct !DILexicalBlock(scope: !4695, file: !31, line: 2533, column: 3)
!4700 = !DILocation(line: 2534, column: 24, scope: !4699)
!4701 = !DILocation(line: 2534, column: 38, scope: !4699)
!4702 = !DILocation(line: 2534, column: 50, scope: !4699)
!4703 = !DILocation(line: 2534, column: 56, scope: !4699)
!4704 = !DILocation(line: 2534, column: 70, scope: !4699)
!4705 = !DILocation(line: 2534, column: 79, scope: !4699)
!4706 = !DILocation(line: 2534, column: 47, scope: !4699)
!4707 = !DILocation(line: 2534, column: 16, scope: !4699)
!4708 = !DILocation(line: 2535, column: 15, scope: !4699)
!4709 = !DILocation(line: 2536, column: 3, scope: !4699)
!4710 = !DILocation(line: 2539, column: 16, scope: !4711)
!4711 = distinct !DILexicalBlock(scope: !4695, file: !31, line: 2538, column: 3)
!4712 = !DILocation(line: 2540, column: 17, scope: !4711)
!4713 = !DILocation(line: 2540, column: 22, scope: !4711)
!4714 = !DILocation(line: 2540, column: 15, scope: !4711)
!4715 = !DILocation(line: 2542, column: 2, scope: !4696)
!4716 = !DILocation(line: 2543, column: 3, scope: !4691)
!4717 = !DILocation(line: 2545, column: 6, scope: !4718)
!4718 = distinct !DILexicalBlock(scope: !4656, file: !31, line: 2545, column: 6)
!4719 = !DILocation(line: 2545, column: 26, scope: !4718)
!4720 = !DILocation(line: 2545, column: 48, scope: !4718)
!4721 = !DILocation(line: 2545, column: 51, scope: !4718)
!4722 = !DILocation(line: 2545, column: 57, scope: !4718)
!4723 = !DILocation(line: 2545, column: 60, scope: !4718)
!4724 = !DILocation(line: 2546, column: 22, scope: !4718)
!4725 = !DILocation(line: 2546, column: 65, scope: !4718)
!4726 = !DILocation(line: 2546, column: 28, scope: !4718)
!4727 = !DILocation(line: 2546, column: 3, scope: !4718)
!4728 = !DILocation(line: 2549, column: 6, scope: !4729)
!4729 = distinct !DILexicalBlock(scope: !4656, file: !31, line: 2549, column: 6)
!4730 = !DILocation(line: 2549, column: 25, scope: !4729)
!4731 = !DILocation(line: 2549, column: 42, scope: !4729)
!4732 = !DILocation(line: 2549, column: 47, scope: !4729)
!4733 = !DILocation(line: 2549, column: 53, scope: !4729)
!4734 = !DILocation(line: 2549, column: 58, scope: !4729)
!4735 = !DILocation(line: 2549, column: 73, scope: !4729)
!4736 = !DILocation(line: 2549, column: 78, scope: !4729)
!4737 = !DILocation(line: 2549, column: 84, scope: !4729)
!4738 = !DILocation(line: 2549, column: 87, scope: !4729)
!4739 = !DILocation(line: 2549, column: 100, scope: !4729)
!4740 = !DILocation(line: 2549, column: 104, scope: !4729)
!4741 = !DILocation(line: 2549, column: 110, scope: !4729)
!4742 = !DILocation(line: 2549, column: 113, scope: !4729)
!4743 = !DILocation(line: 2549, column: 130, scope: !4729)
!4744 = !DILocation(line: 2549, column: 134, scope: !4729)
!4745 = !DILocation(line: 2549, column: 140, scope: !4729)
!4746 = !DILocation(line: 2549, column: 143, scope: !4729)
!4747 = !DILocation(line: 2549, column: 166, scope: !4729)
!4748 = !DILocation(line: 2549, column: 170, scope: !4729)
!4749 = !DILocation(line: 2549, column: 176, scope: !4729)
!4750 = !DILocation(line: 2549, column: 179, scope: !4729)
!4751 = !DILocation(line: 2551, column: 3, scope: !4752)
!4752 = distinct !DILexicalBlock(scope: !4729, file: !31, line: 2550, column: 2)
!4753 = !DILocation(line: 2552, column: 2, scope: !4752)
!4754 = !DILocation(line: 2555, column: 8, scope: !4755)
!4755 = distinct !DILexicalBlock(scope: !4656, file: !31, line: 2555, column: 6)
!4756 = !DILocation(line: 2555, column: 14, scope: !4755)
!4757 = !DILocation(line: 2555, column: 19, scope: !4755)
!4758 = !DILocation(line: 2556, column: 3, scope: !4755)
!4759 = !DILocation(line: 2556, column: 8, scope: !4755)
!4760 = !DILocation(line: 2556, column: 28, scope: !4755)
!4761 = !DILocation(line: 2556, column: 50, scope: !4755)
!4762 = !DILocation(line: 2556, column: 65, scope: !4755)
!4763 = !DILocation(line: 2556, column: 71, scope: !4755)
!4764 = !DILocation(line: 2556, column: 53, scope: !4755)
!4765 = !DILocation(line: 2556, column: 75, scope: !4755)
!4766 = !DILocation(line: 2556, column: 84, scope: !4755)
!4767 = !DILocation(line: 2557, column: 4, scope: !4755)
!4768 = !DILocation(line: 2557, column: 8, scope: !4755)
!4769 = !DILocation(line: 2557, column: 28, scope: !4755)
!4770 = !DILocation(line: 2557, column: 51, scope: !4755)
!4771 = !DILocation(line: 2557, column: 55, scope: !4755)
!4772 = !DILocation(line: 2557, column: 61, scope: !4755)
!4773 = !DILocation(line: 2557, column: 64, scope: !4755)
!4774 = !DILocation(line: 2557, column: 76, scope: !4755)
!4775 = !DILocation(line: 2557, column: 79, scope: !4755)
!4776 = !DILocation(line: 2557, column: 85, scope: !4755)
!4777 = !DILocation(line: 2557, column: 88, scope: !4755)
!4778 = !DILocation(line: 2558, column: 3, scope: !4755)
!4779 = !DILocation(line: 2558, column: 7, scope: !4755)
!4780 = !DILocation(line: 2558, column: 13, scope: !4755)
!4781 = !DILocation(line: 2558, column: 18, scope: !4755)
!4782 = !DILocalVariable(name: "i", scope: !4783, file: !31, line: 2560, type: !7)
!4783 = distinct !DILexicalBlock(scope: !4755, file: !31, line: 2559, column: 2)
!4784 = !DILocation(line: 2560, column: 7, scope: !4783)
!4785 = !DILocalVariable(name: "objnum", scope: !4783, file: !31, line: 2560, type: !7)
!4786 = !DILocation(line: 2560, column: 10, scope: !4783)
!4787 = !DILocation(line: 2562, column: 7, scope: !4788)
!4788 = distinct !DILexicalBlock(scope: !4783, file: !31, line: 2562, column: 7)
!4789 = !DILocation(line: 2562, column: 17, scope: !4788)
!4790 = !DILocation(line: 2563, column: 4, scope: !4788)
!4791 = !DILocation(line: 2565, column: 14, scope: !4792)
!4792 = distinct !DILexicalBlock(scope: !4783, file: !31, line: 2565, column: 3)
!4793 = !DILocation(line: 2565, column: 8, scope: !4792)
!4794 = !DILocation(line: 2565, column: 18, scope: !4795)
!4795 = distinct !DILexicalBlock(scope: !4792, file: !31, line: 2565, column: 3)
!4796 = !DILocation(line: 2565, column: 26, scope: !4795)
!4797 = !DILocation(line: 2565, column: 24, scope: !4795)
!4798 = !DILocation(line: 2565, column: 3, scope: !4792)
!4799 = !DILocalVariable(name: "curobjp", scope: !4800, file: !31, line: 2567, type: !33)
!4800 = distinct !DILexicalBlock(scope: !4795, file: !31, line: 2566, column: 3)
!4801 = !DILocation(line: 2567, column: 12, scope: !4800)
!4802 = !DILocation(line: 2567, column: 31, scope: !4800)
!4803 = !DILocation(line: 2567, column: 23, scope: !4800)
!4804 = !DILocation(line: 2569, column: 11, scope: !4805)
!4805 = distinct !DILexicalBlock(scope: !4800, file: !31, line: 2569, column: 8)
!4806 = !DILocation(line: 2569, column: 20, scope: !4805)
!4807 = !DILocation(line: 2569, column: 25, scope: !4805)
!4808 = !DILocation(line: 2569, column: 39, scope: !4805)
!4809 = !DILocation(line: 2569, column: 44, scope: !4805)
!4810 = !DILocation(line: 2569, column: 53, scope: !4805)
!4811 = !DILocation(line: 2569, column: 67, scope: !4805)
!4812 = !DILocation(line: 2569, column: 77, scope: !4805)
!4813 = !DILocation(line: 2569, column: 81, scope: !4805)
!4814 = !DILocation(line: 2569, column: 90, scope: !4805)
!4815 = !DILocation(line: 2569, column: 95, scope: !4805)
!4816 = !DILocation(line: 2569, column: 111, scope: !4805)
!4817 = !DILocation(line: 2569, column: 115, scope: !4805)
!4818 = !DILocation(line: 2569, column: 125, scope: !4805)
!4819 = !DILocation(line: 2569, column: 122, scope: !4805)
!4820 = !DILocalVariable(name: "dist", scope: !4821, file: !31, line: 2571, type: !21)
!4821 = distinct !DILexicalBlock(scope: !4805, file: !31, line: 2570, column: 4)
!4822 = !DILocation(line: 2571, column: 9, scope: !4821)
!4823 = !DILocation(line: 2573, column: 9, scope: !4824)
!4824 = distinct !DILexicalBlock(scope: !4821, file: !31, line: 2573, column: 9)
!4825 = !DILocation(line: 2573, column: 18, scope: !4824)
!4826 = !DILocation(line: 2573, column: 23, scope: !4824)
!4827 = !DILocation(line: 2575, column: 11, scope: !4828)
!4828 = distinct !DILexicalBlock(scope: !4829, file: !31, line: 2575, column: 10)
!4829 = distinct !DILexicalBlock(scope: !4824, file: !31, line: 2574, column: 5)
!4830 = !DILocation(line: 2575, column: 23, scope: !4828)
!4831 = !DILocation(line: 2575, column: 38, scope: !4828)
!4832 = !DILocation(line: 2575, column: 42, scope: !4828)
!4833 = !DILocation(line: 2575, column: 52, scope: !4828)
!4834 = !DILocation(line: 2575, column: 41, scope: !4828)
!4835 = !DILocation(line: 2576, column: 7, scope: !4828)
!4836 = !DILocation(line: 2582, column: 18, scope: !4837)
!4837 = distinct !DILexicalBlock(scope: !4829, file: !31, line: 2582, column: 10)
!4838 = !DILocation(line: 2582, column: 27, scope: !4837)
!4839 = !DILocation(line: 2582, column: 10, scope: !4837)
!4840 = !DILocation(line: 2582, column: 31, scope: !4837)
!4841 = !DILocation(line: 2582, column: 37, scope: !4837)
!4842 = !DILocation(line: 2583, column: 7, scope: !4837)
!4843 = !DILocation(line: 2584, column: 5, scope: !4829)
!4844 = !DILocation(line: 2587, column: 9, scope: !4845)
!4845 = distinct !DILexicalBlock(scope: !4821, file: !31, line: 2587, column: 9)
!4846 = !DILocation(line: 2587, column: 18, scope: !4845)
!4847 = !DILocation(line: 2587, column: 23, scope: !4845)
!4848 = !DILocation(line: 2589, column: 10, scope: !4849)
!4849 = distinct !DILexicalBlock(scope: !4850, file: !31, line: 2589, column: 10)
!4850 = distinct !DILexicalBlock(scope: !4845, file: !31, line: 2588, column: 5)
!4851 = !DILocation(line: 2589, column: 22, scope: !4849)
!4852 = !DILocation(line: 2590, column: 7, scope: !4849)
!4853 = !DILocation(line: 2593, column: 10, scope: !4854)
!4854 = distinct !DILexicalBlock(scope: !4850, file: !31, line: 2593, column: 10)
!4855 = !DILocation(line: 2593, column: 22, scope: !4854)
!4856 = !DILocation(line: 2593, column: 36, scope: !4854)
!4857 = !DILocation(line: 2593, column: 39, scope: !4854)
!4858 = !DILocation(line: 2593, column: 59, scope: !4854)
!4859 = !DILocation(line: 2594, column: 22, scope: !4860)
!4860 = distinct !DILexicalBlock(scope: !4854, file: !31, line: 2594, column: 11)
!4861 = !DILocation(line: 2594, column: 31, scope: !4860)
!4862 = !DILocation(line: 2594, column: 11, scope: !4860)
!4863 = !DILocation(line: 2594, column: 35, scope: !4860)
!4864 = !DILocation(line: 2595, column: 8, scope: !4860)
!4865 = !DILocation(line: 2596, column: 5, scope: !4850)
!4866 = !DILocation(line: 2598, column: 31, scope: !4821)
!4867 = !DILocation(line: 2598, column: 37, scope: !4821)
!4868 = !DILocation(line: 2598, column: 43, scope: !4821)
!4869 = !DILocation(line: 2598, column: 52, scope: !4821)
!4870 = !DILocation(line: 2598, column: 12, scope: !4821)
!4871 = !DILocation(line: 2598, column: 10, scope: !4821)
!4872 = !DILocation(line: 2599, column: 9, scope: !4873)
!4873 = distinct !DILexicalBlock(scope: !4821, file: !31, line: 2599, column: 9)
!4874 = !DILocation(line: 2599, column: 14, scope: !4873)
!4875 = !DILocalVariable(name: "oovis", scope: !4876, file: !31, line: 2601, type: !7)
!4876 = distinct !DILexicalBlock(scope: !4873, file: !31, line: 2600, column: 5)
!4877 = !DILocation(line: 2601, column: 10, scope: !4876)
!4878 = !DILocation(line: 2603, column: 42, scope: !4876)
!4879 = !DILocation(line: 2603, column: 48, scope: !4876)
!4880 = !DILocation(line: 2603, column: 14, scope: !4876)
!4881 = !DILocation(line: 2603, column: 12, scope: !4876)
!4882 = !DILocation(line: 2605, column: 10, scope: !4883)
!4883 = distinct !DILexicalBlock(scope: !4876, file: !31, line: 2605, column: 10)
!4884 = !DILocation(line: 2607, column: 26, scope: !4885)
!4885 = distinct !DILexicalBlock(scope: !4883, file: !31, line: 2606, column: 6)
!4886 = !DILocation(line: 2607, column: 15, scope: !4885)
!4887 = !DILocation(line: 2607, column: 7, scope: !4885)
!4888 = !DILocation(line: 2607, column: 24, scope: !4885)
!4889 = !DILocation(line: 2608, column: 14, scope: !4885)
!4890 = !DILocation(line: 2609, column: 11, scope: !4891)
!4891 = distinct !DILexicalBlock(scope: !4885, file: !31, line: 2609, column: 11)
!4892 = !DILocation(line: 2609, column: 19, scope: !4891)
!4893 = !DILocation(line: 2611, column: 8, scope: !4894)
!4894 = distinct !DILexicalBlock(scope: !4891, file: !31, line: 2610, column: 7)
!4895 = !DILocation(line: 2612, column: 16, scope: !4894)
!4896 = !DILocation(line: 2613, column: 8, scope: !4894)
!4897 = !DILocation(line: 2615, column: 6, scope: !4885)
!4898 = !DILocation(line: 2616, column: 5, scope: !4876)
!4899 = !DILocation(line: 2617, column: 4, scope: !4821)
!4900 = !DILocation(line: 2618, column: 3, scope: !4800)
!4901 = !DILocation(line: 2565, column: 54, scope: !4795)
!4902 = !DILocation(line: 2565, column: 3, scope: !4795)
!4903 = distinct !{!4903, !4798, !4904, !948}
!4904 = !DILocation(line: 2618, column: 3, scope: !4792)
!4905 = !DILocation(line: 2621, column: 7, scope: !4906)
!4906 = distinct !DILexicalBlock(scope: !4783, file: !31, line: 2621, column: 7)
!4907 = !DILocation(line: 2621, column: 27, scope: !4906)
!4908 = !DILocation(line: 2623, column: 8, scope: !4909)
!4909 = distinct !DILexicalBlock(scope: !4910, file: !31, line: 2623, column: 8)
!4910 = distinct !DILexicalBlock(scope: !4906, file: !31, line: 2622, column: 3)
!4911 = !DILocation(line: 2623, column: 14, scope: !4909)
!4912 = !DILocation(line: 2623, column: 19, scope: !4909)
!4913 = !DILocation(line: 2625, column: 27, scope: !4914)
!4914 = distinct !DILexicalBlock(scope: !4909, file: !31, line: 2624, column: 4)
!4915 = !DILocation(line: 2625, column: 33, scope: !4914)
!4916 = !DILocation(line: 2625, column: 15, scope: !4914)
!4917 = !DILocation(line: 2625, column: 37, scope: !4914)
!4918 = !DILocation(line: 2625, column: 13, scope: !4914)
!4919 = !DILocation(line: 2626, column: 5, scope: !4914)
!4920 = !DILocation(line: 2627, column: 4, scope: !4914)
!4921 = !DILocation(line: 2630, column: 5, scope: !4922)
!4922 = distinct !DILexicalBlock(scope: !4909, file: !31, line: 2629, column: 4)
!4923 = !DILocation(line: 2631, column: 13, scope: !4922)
!4924 = !DILocation(line: 2633, column: 3, scope: !4910)
!4925 = !DILocation(line: 2636, column: 12, scope: !4926)
!4926 = distinct !DILexicalBlock(scope: !4906, file: !31, line: 2635, column: 3)
!4927 = !DILocation(line: 2636, column: 18, scope: !4926)
!4928 = !DILocation(line: 2636, column: 4, scope: !4926)
!4929 = !DILocation(line: 2639, column: 13, scope: !4930)
!4930 = distinct !DILexicalBlock(scope: !4926, file: !31, line: 2637, column: 4)
!4931 = !DILocation(line: 2640, column: 5, scope: !4930)
!4932 = !DILocation(line: 2642, column: 9, scope: !4933)
!4933 = distinct !DILexicalBlock(scope: !4930, file: !31, line: 2642, column: 9)
!4934 = !DILocation(line: 2642, column: 21, scope: !4933)
!4935 = !DILocation(line: 2643, column: 14, scope: !4933)
!4936 = !DILocation(line: 2643, column: 6, scope: !4933)
!4937 = !DILocation(line: 2645, column: 14, scope: !4933)
!4938 = !DILocation(line: 2646, column: 5, scope: !4930)
!4939 = !DILocation(line: 2683, column: 14, scope: !4783)
!4940 = !DILocation(line: 2684, column: 9, scope: !4941)
!4941 = distinct !DILexicalBlock(scope: !4783, file: !31, line: 2684, column: 3)
!4942 = !DILocation(line: 2684, column: 8, scope: !4941)
!4943 = !DILocation(line: 2684, column: 13, scope: !4944)
!4944 = distinct !DILexicalBlock(scope: !4941, file: !31, line: 2684, column: 3)
!4945 = !DILocation(line: 2684, column: 15, scope: !4944)
!4946 = !DILocation(line: 2684, column: 14, scope: !4944)
!4947 = !DILocation(line: 2684, column: 3, scope: !4941)
!4948 = !DILocalVariable(name: "objnum", scope: !4949, file: !31, line: 2686, type: !7)
!4949 = distinct !DILexicalBlock(scope: !4944, file: !31, line: 2685, column: 3)
!4950 = !DILocation(line: 2686, column: 8, scope: !4949)
!4951 = !DILocation(line: 2687, column: 14, scope: !4949)
!4952 = !DILocation(line: 2687, column: 21, scope: !4949)
!4953 = !DILocation(line: 2687, column: 13, scope: !4949)
!4954 = !DILocation(line: 2687, column: 38, scope: !4949)
!4955 = !DILocation(line: 2687, column: 49, scope: !4949)
!4956 = !DILocation(line: 2687, column: 47, scope: !4949)
!4957 = !DILocation(line: 2687, column: 58, scope: !4949)
!4958 = !DILocation(line: 2687, column: 29, scope: !4949)
!4959 = !DILocation(line: 2687, column: 11, scope: !4949)
!4960 = !DILocation(line: 2688, column: 26, scope: !4949)
!4961 = !DILocation(line: 2688, column: 32, scope: !4949)
!4962 = !DILocation(line: 2688, column: 40, scope: !4949)
!4963 = !DILocation(line: 2688, column: 49, scope: !4949)
!4964 = !DILocation(line: 2688, column: 4, scope: !4949)
!4965 = !DILocation(line: 2689, column: 15, scope: !4949)
!4966 = !DILocation(line: 2690, column: 3, scope: !4949)
!4967 = !DILocation(line: 2684, column: 36, scope: !4944)
!4968 = !DILocation(line: 2684, column: 3, scope: !4944)
!4969 = distinct !{!4969, !4947, !4970, !948}
!4970 = !DILocation(line: 2690, column: 3, scope: !4941)
!4971 = !DILocation(line: 2691, column: 2, scope: !4783)
!4972 = !DILocation(line: 2692, column: 1, scope: !4656)
!4973 = distinct !DISubprogram(name: "release_guided_missile", linkageName: "_Z22release_guided_missilei", scope: !31, file: !31, line: 2697, type: !4974, scopeLine: 2698, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !320)
!4974 = !DISubroutineType(types: !4975)
!4975 = !{null, !7}
!4976 = !DILocalVariable(name: "player_num", arg: 1, scope: !4973, file: !31, line: 2697, type: !7)
!4977 = !DILocation(line: 2697, column: 33, scope: !4973)
!4978 = !DILocation(line: 2699, column: 6, scope: !4979)
!4979 = distinct !DILexicalBlock(scope: !4973, file: !31, line: 2699, column: 6)
!4980 = !DILocation(line: 2699, column: 20, scope: !4979)
!4981 = !DILocation(line: 2699, column: 17, scope: !4979)
!4982 = !DILocation(line: 2701, column: 23, scope: !4983)
!4983 = distinct !DILexicalBlock(scope: !4984, file: !31, line: 2701, column: 8)
!4984 = distinct !DILexicalBlock(scope: !4979, file: !31, line: 2700, column: 3)
!4985 = !DILocation(line: 2701, column: 8, scope: !4983)
!4986 = !DILocation(line: 2701, column: 34, scope: !4983)
!4987 = !DILocation(line: 2702, column: 4, scope: !4983)
!4988 = !DILocation(line: 2704, column: 35, scope: !4984)
!4989 = !DILocation(line: 2704, column: 20, scope: !4984)
!4990 = !DILocation(line: 2704, column: 18, scope: !4984)
!4991 = !DILocation(line: 2709, column: 7, scope: !4992)
!4992 = distinct !DILexicalBlock(scope: !4984, file: !31, line: 2709, column: 7)
!4993 = !DILocation(line: 2709, column: 20, scope: !4992)
!4994 = !DILocation(line: 2710, column: 4, scope: !4992)
!4995 = !DILocation(line: 2711, column: 3, scope: !4984)
!4996 = !DILocation(line: 2713, column: 17, scope: !4973)
!4997 = !DILocation(line: 2713, column: 2, scope: !4973)
!4998 = !DILocation(line: 2713, column: 29, scope: !4973)
!4999 = !DILocation(line: 2714, column: 1, scope: !4973)
!5000 = distinct !DISubprogram(name: "do_missile_firing", linkageName: "_Z17do_missile_firingi", scope: !31, file: !31, line: 2722, type: !4974, scopeLine: 2723, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !320)
!5001 = !DILocalVariable(name: "do_autoselect", arg: 1, scope: !5000, file: !31, line: 2722, type: !7)
!5002 = !DILocation(line: 2722, column: 28, scope: !5000)
!5003 = !DILocalVariable(name: "gun_flag", scope: !5000, file: !31, line: 2724, type: !7)
!5004 = !DILocation(line: 2724, column: 6, scope: !5000)
!5005 = !DILocation(line: 2726, column: 2, scope: !5000)
!5006 = !DILocation(line: 2728, column: 21, scope: !5007)
!5007 = distinct !DILexicalBlock(scope: !5000, file: !31, line: 2728, column: 6)
!5008 = !DILocation(line: 2728, column: 6, scope: !5007)
!5009 = !DILocation(line: 2728, column: 33, scope: !5007)
!5010 = !DILocation(line: 2728, column: 51, scope: !5007)
!5011 = !DILocation(line: 2728, column: 36, scope: !5007)
!5012 = !DILocation(line: 2728, column: 64, scope: !5007)
!5013 = !DILocation(line: 2728, column: 94, scope: !5007)
!5014 = !DILocation(line: 2728, column: 75, scope: !5007)
!5015 = !DILocation(line: 2728, column: 73, scope: !5007)
!5016 = !DILocation(line: 2730, column: 26, scope: !5017)
!5017 = distinct !DILexicalBlock(scope: !5007, file: !31, line: 2729, column: 2)
!5018 = !DILocation(line: 2730, column: 3, scope: !5017)
!5019 = !DILocation(line: 2731, column: 28, scope: !5017)
!5020 = !DILocation(line: 2731, column: 83, scope: !5017)
!5021 = !DILocation(line: 2731, column: 51, scope: !5017)
!5022 = !DILocation(line: 2731, column: 39, scope: !5017)
!5023 = !DILocation(line: 2731, column: 102, scope: !5017)
!5024 = !DILocation(line: 2731, column: 37, scope: !5017)
!5025 = !DILocation(line: 2731, column: 26, scope: !5017)
!5026 = !DILocation(line: 2732, column: 3, scope: !5017)
!5027 = !DILocation(line: 2735, column: 7, scope: !5028)
!5028 = distinct !DILexicalBlock(scope: !5000, file: !31, line: 2735, column: 6)
!5029 = !DILocation(line: 2735, column: 22, scope: !5028)
!5030 = !DILocation(line: 2735, column: 34, scope: !5028)
!5031 = !DILocation(line: 2735, column: 26, scope: !5028)
!5032 = !DILocation(line: 2735, column: 46, scope: !5028)
!5033 = !DILocation(line: 2735, column: 61, scope: !5028)
!5034 = !DILocation(line: 2735, column: 79, scope: !5028)
!5035 = !DILocalVariable(name: "weapon_id", scope: !5036, file: !31, line: 2737, type: !7)
!5036 = distinct !DILexicalBlock(scope: !5028, file: !31, line: 2736, column: 2)
!5037 = !DILocation(line: 2737, column: 7, scope: !5036)
!5038 = !DILocalVariable(name: "weapon_gun", scope: !5036, file: !31, line: 2737, type: !7)
!5039 = !DILocation(line: 2737, column: 17, scope: !5036)
!5040 = !DILocation(line: 2739, column: 11, scope: !5036)
!5041 = !DILocation(line: 2739, column: 3, scope: !5036)
!5042 = !DILocation(line: 2739, column: 23, scope: !5036)
!5043 = !DILocation(line: 2739, column: 38, scope: !5036)
!5044 = !DILocation(line: 2739, column: 55, scope: !5036)
!5045 = !DILocation(line: 2740, column: 47, scope: !5036)
!5046 = !DILocation(line: 2740, column: 15, scope: !5036)
!5047 = !DILocation(line: 2740, column: 13, scope: !5036)
!5048 = !DILocation(line: 2742, column: 7, scope: !5049)
!5049 = distinct !DILexicalBlock(scope: !5036, file: !31, line: 2742, column: 7)
!5050 = !DILocation(line: 2742, column: 23, scope: !5049)
!5051 = !DILocation(line: 2743, column: 29, scope: !5049)
!5052 = !DILocation(line: 2743, column: 52, scope: !5049)
!5053 = !DILocation(line: 2743, column: 40, scope: !5049)
!5054 = !DILocation(line: 2743, column: 63, scope: !5049)
!5055 = !DILocation(line: 2743, column: 38, scope: !5049)
!5056 = !DILocation(line: 2743, column: 27, scope: !5049)
!5057 = !DILocation(line: 2743, column: 4, scope: !5049)
!5058 = !DILocation(line: 2745, column: 29, scope: !5049)
!5059 = !DILocation(line: 2745, column: 38, scope: !5049)
!5060 = !DILocation(line: 2745, column: 27, scope: !5049)
!5061 = !DILocation(line: 2747, column: 44, scope: !5036)
!5062 = !DILocation(line: 2747, column: 16, scope: !5036)
!5063 = !DILocation(line: 2747, column: 14, scope: !5036)
!5064 = !DILocation(line: 2749, column: 7, scope: !5065)
!5065 = distinct !DILexicalBlock(scope: !5036, file: !31, line: 2749, column: 7)
!5066 = !DILocation(line: 2749, column: 17, scope: !5065)
!5067 = !DILocation(line: 2751, column: 31, scope: !5068)
!5068 = distinct !DILexicalBlock(scope: !5065, file: !31, line: 2750, column: 3)
!5069 = !DILocation(line: 2751, column: 43, scope: !5068)
!5070 = !DILocation(line: 2751, column: 28, scope: !5068)
!5071 = !DILocation(line: 2751, column: 15, scope: !5068)
!5072 = !DILocation(line: 2752, column: 15, scope: !5068)
!5073 = !DILocation(line: 2753, column: 3, scope: !5068)
!5074 = !DILocation(line: 2755, column: 22, scope: !5036)
!5075 = !DILocation(line: 2755, column: 37, scope: !5036)
!5076 = !DILocation(line: 2755, column: 48, scope: !5036)
!5077 = !DILocation(line: 2755, column: 3, scope: !5036)
!5078 = !DILocation(line: 2757, column: 7, scope: !5079)
!5079 = distinct !DILexicalBlock(scope: !5036, file: !31, line: 2757, column: 7)
!5080 = !DILocation(line: 2757, column: 24, scope: !5079)
!5081 = !DILocation(line: 2759, column: 8, scope: !5082)
!5082 = distinct !DILexicalBlock(scope: !5083, file: !31, line: 2759, column: 8)
!5083 = distinct !DILexicalBlock(scope: !5079, file: !31, line: 2758, column: 3)
!5084 = !DILocation(line: 2759, column: 28, scope: !5082)
!5085 = !DILocation(line: 2761, column: 23, scope: !5086)
!5086 = distinct !DILexicalBlock(scope: !5082, file: !31, line: 2760, column: 4)
!5087 = !DILocation(line: 2765, column: 4, scope: !5086)
!5088 = !DILocation(line: 2766, column: 3, scope: !5083)
!5089 = !DILocation(line: 2767, column: 12, scope: !5090)
!5090 = distinct !DILexicalBlock(scope: !5079, file: !31, line: 2767, column: 12)
!5091 = !DILocation(line: 2767, column: 29, scope: !5090)
!5092 = !DILocation(line: 2769, column: 8, scope: !5093)
!5093 = distinct !DILexicalBlock(scope: !5094, file: !31, line: 2769, column: 8)
!5094 = distinct !DILexicalBlock(scope: !5090, file: !31, line: 2768, column: 3)
!5095 = !DILocation(line: 2769, column: 29, scope: !5093)
!5096 = !DILocation(line: 2771, column: 24, scope: !5097)
!5097 = distinct !DILexicalBlock(scope: !5093, file: !31, line: 2770, column: 4)
!5098 = !DILocation(line: 2775, column: 4, scope: !5097)
!5099 = !DILocation(line: 2776, column: 3, scope: !5094)
!5100 = !DILocation(line: 2782, column: 7, scope: !5101)
!5101 = distinct !DILexicalBlock(scope: !5036, file: !31, line: 2782, column: 7)
!5102 = !DILocation(line: 2782, column: 24, scope: !5101)
!5103 = !DILocation(line: 2782, column: 38, scope: !5101)
!5104 = !DILocation(line: 2782, column: 41, scope: !5101)
!5105 = !DILocation(line: 2782, column: 58, scope: !5101)
!5106 = !DILocalVariable(name: "force_vec", scope: !5107, file: !31, line: 2784, type: !54)
!5107 = distinct !DILexicalBlock(scope: !5101, file: !31, line: 2783, column: 3)
!5108 = !DILocation(line: 2784, column: 15, scope: !5107)
!5109 = !DILocation(line: 2786, column: 20, scope: !5107)
!5110 = !DILocation(line: 2786, column: 35, scope: !5107)
!5111 = !DILocation(line: 2786, column: 42, scope: !5107)
!5112 = !DILocation(line: 2786, column: 47, scope: !5107)
!5113 = !DILocation(line: 2786, column: 49, scope: !5107)
!5114 = !DILocation(line: 2786, column: 18, scope: !5107)
!5115 = !DILocation(line: 2786, column: 14, scope: !5107)
!5116 = !DILocation(line: 2786, column: 16, scope: !5107)
!5117 = !DILocation(line: 2787, column: 20, scope: !5107)
!5118 = !DILocation(line: 2787, column: 35, scope: !5107)
!5119 = !DILocation(line: 2787, column: 42, scope: !5107)
!5120 = !DILocation(line: 2787, column: 47, scope: !5107)
!5121 = !DILocation(line: 2787, column: 49, scope: !5107)
!5122 = !DILocation(line: 2787, column: 18, scope: !5107)
!5123 = !DILocation(line: 2787, column: 14, scope: !5107)
!5124 = !DILocation(line: 2787, column: 16, scope: !5107)
!5125 = !DILocation(line: 2788, column: 20, scope: !5107)
!5126 = !DILocation(line: 2788, column: 35, scope: !5107)
!5127 = !DILocation(line: 2788, column: 42, scope: !5107)
!5128 = !DILocation(line: 2788, column: 47, scope: !5107)
!5129 = !DILocation(line: 2788, column: 49, scope: !5107)
!5130 = !DILocation(line: 2788, column: 18, scope: !5107)
!5131 = !DILocation(line: 2788, column: 14, scope: !5107)
!5132 = !DILocation(line: 2788, column: 16, scope: !5107)
!5133 = !DILocation(line: 2789, column: 21, scope: !5107)
!5134 = !DILocation(line: 2789, column: 4, scope: !5107)
!5135 = !DILocation(line: 2791, column: 29, scope: !5107)
!5136 = !DILocation(line: 2791, column: 31, scope: !5107)
!5137 = !DILocation(line: 2791, column: 39, scope: !5107)
!5138 = !DILocation(line: 2791, column: 37, scope: !5107)
!5139 = !DILocation(line: 2791, column: 48, scope: !5107)
!5140 = !DILocation(line: 2791, column: 14, scope: !5107)
!5141 = !DILocation(line: 2791, column: 16, scope: !5107)
!5142 = !DILocation(line: 2792, column: 29, scope: !5107)
!5143 = !DILocation(line: 2792, column: 31, scope: !5107)
!5144 = !DILocation(line: 2792, column: 39, scope: !5107)
!5145 = !DILocation(line: 2792, column: 37, scope: !5107)
!5146 = !DILocation(line: 2792, column: 48, scope: !5107)
!5147 = !DILocation(line: 2792, column: 14, scope: !5107)
!5148 = !DILocation(line: 2792, column: 16, scope: !5107)
!5149 = !DILocation(line: 2793, column: 29, scope: !5107)
!5150 = !DILocation(line: 2793, column: 31, scope: !5107)
!5151 = !DILocation(line: 2793, column: 39, scope: !5107)
!5152 = !DILocation(line: 2793, column: 37, scope: !5107)
!5153 = !DILocation(line: 2793, column: 48, scope: !5107)
!5154 = !DILocation(line: 2793, column: 14, scope: !5107)
!5155 = !DILocation(line: 2793, column: 16, scope: !5107)
!5156 = !DILocation(line: 2794, column: 19, scope: !5107)
!5157 = !DILocation(line: 2794, column: 4, scope: !5107)
!5158 = !DILocation(line: 2795, column: 3, scope: !5107)
!5159 = !DILocation(line: 2805, column: 7, scope: !5160)
!5160 = distinct !DILexicalBlock(scope: !5036, file: !31, line: 2805, column: 7)
!5161 = !DILocation(line: 2806, column: 4, scope: !5160)
!5162 = !DILocation(line: 2807, column: 2, scope: !5036)
!5163 = !DILocation(line: 2808, column: 1, scope: !5000)
