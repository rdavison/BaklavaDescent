; ModuleID = '/Users/richard/code/ChocolateDescent/main_d2/aipath.cpp'
source_filename = "/Users/richard/code/ChocolateDescent/main_d2/aipath.cpp"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

%struct.segment = type { [6 x %struct.side], [6 x i16], [8 x i16], i32 }
%struct.side = type { i8, i8, i16, i16, i16, [4 x %struct.uvl], [2 x %struct.vms_vector] }
%struct.uvl = type { i32, i32, i32 }
%struct.vms_vector = type { i32, i32, i32 }
%struct.object = type { i32, i8, i8, i16, i16, i8, i8, i8, i8, i16, i16, %struct.vms_vector, %struct.vms_matrix, i32, i32, %struct.vms_vector, i8, i8, i8, i8, i32, %union.anon, %union.anon.0, %union.anon.1 }
%struct.vms_matrix = type { %struct.vms_vector, %struct.vms_vector, %struct.vms_vector }
%union.anon = type { %struct.physics_info }
%struct.physics_info = type { %struct.vms_vector, %struct.vms_vector, i32, i32, i32, %struct.vms_vector, %struct.vms_vector, i16, i16 }
%union.anon.0 = type { %struct.ai_static }
%struct.ai_static = type { i8, [11 x i8], i16, i16, i16, i8, i8, i16, i32, i32 }
%union.anon.1 = type { %struct.polyobj_info }
%struct.polyobj_info = type { i32, [10 x %struct.vms_angvec], i32, i32, i32 }
%struct.vms_angvec = type { i16, i16, i16 }
%struct.point_seg = type { i32, %struct.vms_vector }
%struct.robot_info = type { i32, [8 x %struct.vms_vector], [8 x i8], i16, i16, i16, i16, i8, i8, i8, i8, i8, i8, i8, i8, i16, i8, i8, i32, i32, i32, i32, [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i8], [5 x i8], i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, [3 x i8], i8, i8, i8, i8, [9 x [5 x %struct.jointlist]], i32 }
%struct.jointlist = type { i16, i16 }
%struct.ai_local = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [10 x %struct.vms_angvec], [10 x %struct.vms_angvec], [10 x i8], [10 x i8] }
%struct.fvi_query = type { ptr, ptr, i32, i32, i16, ptr, i32 }
%struct.fvi_info = type { i32, %struct.vms_vector, i32, i32, i32, i32, %struct.vms_vector, i32, [100 x i32] }
%struct.seg_seg = type { i16, i16 }
%struct.obj_path = type { i16, i16 }

@.str = private unnamed_addr constant [40 x i8] c"(j >= 0) && (j < MAX_SIDES_PER_SEGMENT)\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [56 x i8] c"/Users/richard/code/ChocolateDescent/main_d2/aipath.cpp\00", align 1, !dbg !8
@Segments = external global [0 x %struct.segment], align 4
@.str.2 = private unnamed_addr constant [19 x i8] c"connect_side != -1\00", align 1, !dbg !13
@.str.3 = private unnamed_addr constant [69 x i8] c"Warning: point not in ANY segment in aipath.c/insert_center_points.\0A\00", align 1, !dbg !18
@.str.4 = private unnamed_addr constant [18 x i8] c"*num_points < 200\00", align 1, !dbg !23
@.str.5 = private unnamed_addr constant [18 x i8] c"temp_segnum != -1\00", align 1, !dbg !28
@Vertices = external global [0 x %struct.vms_vector], align 4
@Objects = external global [0 x %struct.object], align 4
@ConsoleObject = external global ptr, align 8
@Highest_segment_index = external global i32, align 4
@.str.6 = private unnamed_addr constant [35 x i8] c"avoid_seg <= Highest_segment_index\00", align 1, !dbg !30
@.str.7 = private unnamed_addr constant [15 x i8] c"this_seg != -1\00", align 1, !dbg !35
@.str.8 = private unnamed_addr constant [55 x i8] c"(this_seg >= 0) && (this_seg <= Highest_segment_index)\00", align 1, !dbg !40
@.str.9 = private unnamed_addr constant [57 x i8] c"(start_seg >= 0) && (start_seg <= Highest_segment_index)\00", align 1, !dbg !45
@Point_segs = external global [2500 x %struct.point_seg], align 4
@.str.10 = private unnamed_addr constant [45 x i8] c"Resetting all paths because of safety_flag.\0A\00", align 1, !dbg !50
@Robot_info = external global [0 x %struct.robot_info], align 4
@Last_buddy_polish_path_frame = global i32 0, align 4, !dbg !55
@FrameCount = external global i32, align 4
@Ai_local_info = external global [350 x %struct.ai_local], align 4
@GameTime = external global i32, align 4
@Believed_player_seg = external global i32, align 4
@Point_segs_free_ptr = external global ptr, align 8
@__stderrp = external global ptr, align 8
@.str.11 = private unnamed_addr constant [32 x i8] c"CTP_ZERO28 pat_before=%d gt=%d\0A\00", align 1, !dbg !74
@.str.12 = private unnamed_addr constant [32 x i8] c"CTS_ZERO28 pat_before=%d gt=%d\0A\00", align 1, !dbg !79
@.str.13 = private unnamed_addr constant [33 x i8] c"CTST_ZERO28 pat_before=%d gt=%d\0A\00", align 1, !dbg !81
@.str.14 = private unnamed_addr constant [12 x i8] c"path_length\00", align 1, !dbg !86
@.str.15 = private unnamed_addr constant [19 x i8] c"objp->segnum != -1\00", align 1, !dbg !91
@Connected_segment_distance = external global i32, align 4
@.str.16 = private unnamed_addr constant [68 x i8] c"Warning: Object %i hopped across %i segments, a distance of %7.3f.\0A\00", align 1, !dbg !93
@.str.17 = private unnamed_addr constant [22 x i8] c"aip->path_length >= 2\00", align 1, !dbg !98
@.str.18 = private unnamed_addr constant [22 x i8] c"aip->path_length != 0\00", align 1, !dbg !103
@.str.19 = private unnamed_addr constant [67 x i8] c"Object #%i goal supposed to be in segment #%i, but in segment #%i\0A\00", align 1, !dbg !105
@Player_is_dead = external global i32, align 4
@Viewer = external global ptr, align 8
@Game_mode = external global i32, align 4
@Difficulty_level = external global i32, align 4
@FrameTime = external global i32, align 4
@Escort_special_goal = external global i32, align 4
@.str.20 = private unnamed_addr constant [86 x i8] c"C_APSOV50 IN vel=(%d,%d,%d) pos=(%d,%d,%d) fvec=(%d,%d,%d) goal=(%d,%d,%d) maxspd=%d\0A\00", align 1, !dbg !110
@.str.21 = private unnamed_addr constant [69 x i8] c"C_APSOV50 norms: nvg=(%d,%d,%d) ncv=(%d,%d,%d) nf=(%d,%d,%d) dot=%d\0A\00", align 1, !dbg !115
@.str.22 = private unnamed_addr constant [47 x i8] c"C_APSOV50 final: ncv=(%d,%d,%d) spd=%d dot=%d\0A\00", align 1, !dbg !117
@Last_frame_garbage_collected = global i32 0, align 4, !dbg !122
@.str.23 = private unnamed_addr constant [42 x i8] c"***** Start ai_path_garbage_collect *****\00", align 1, !dbg !124
@Highest_object_index = external global i32, align 4
@.str.24 = private unnamed_addr constant [43 x i8] c"***** Finish ai_path_garbage_collect *****\00", align 1, !dbg !129
@.str.25 = private unnamed_addr constant [68 x i8] c"Warning: Resetting all paths.  Point_segs buffer nearly exhausted.\0A\00", align 1, !dbg !134
@.str.26 = private unnamed_addr constant [58 x i8] c"Warning: Almost full garbage collection being performed: \00", align 1, !dbg !136
@.str.27 = private unnamed_addr constant [22 x i8] c"Free records = %i/%i\0A\00", align 1, !dbg !141
@.str.28 = private unnamed_addr constant [78 x i8] c"Note: Bashing hide segment of robot %i to current segment because he's lost.\0A\00", align 1, !dbg !143

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z19create_random_xlatePa(ptr noundef %0) #0 !dbg !238 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8, align 1
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !243, !DIExpression(), !244)
    #dbg_declare(ptr %3, !245, !DIExpression(), !246)
  store i32 0, ptr %3, align 4, !dbg !247
  br label %6, !dbg !249

6:                                                ; preds = %16, %1
  %7 = load i32, ptr %3, align 4, !dbg !250
  %8 = icmp slt i32 %7, 6, !dbg !252
  br i1 %8, label %9, label %19, !dbg !253

9:                                                ; preds = %6
  %10 = load i32, ptr %3, align 4, !dbg !254
  %11 = trunc i32 %10 to i8, !dbg !254
  %12 = load ptr, ptr %2, align 8, !dbg !255
  %13 = load i32, ptr %3, align 4, !dbg !256
  %14 = sext i32 %13 to i64, !dbg !255
  %15 = getelementptr inbounds i8, ptr %12, i64 %14, !dbg !255
  store i8 %11, ptr %15, align 1, !dbg !257
  br label %16, !dbg !255

16:                                               ; preds = %9
  %17 = load i32, ptr %3, align 4, !dbg !258
  %18 = add nsw i32 %17, 1, !dbg !258
  store i32 %18, ptr %3, align 4, !dbg !258
  br label %6, !dbg !259, !llvm.loop !260

19:                                               ; preds = %6
  store i32 0, ptr %3, align 4, !dbg !263
  br label %20, !dbg !265

20:                                               ; preds = %54, %19
  %21 = load i32, ptr %3, align 4, !dbg !266
  %22 = icmp slt i32 %21, 6, !dbg !268
  br i1 %22, label %23, label %57, !dbg !269

23:                                               ; preds = %20
    #dbg_declare(ptr %4, !270, !DIExpression(), !272)
  %24 = call noundef i32 @_Z6P_Randv(), !dbg !273
  %25 = mul nsw i32 %24, 6, !dbg !274
  %26 = sdiv i32 %25, 32768, !dbg !275
  store i32 %26, ptr %4, align 4, !dbg !272
    #dbg_declare(ptr %5, !276, !DIExpression(), !277)
  %27 = load i32, ptr %4, align 4, !dbg !278
  %28 = icmp sge i32 %27, 0, !dbg !278
  br i1 %28, label %29, label %32, !dbg !278

29:                                               ; preds = %23
  %30 = load i32, ptr %4, align 4, !dbg !278
  %31 = icmp slt i32 %30, 6, !dbg !278
  br label %32

32:                                               ; preds = %29, %23
  %33 = phi i1 [ false, %23 ], [ %31, %29 ], !dbg !279
  %34 = zext i1 %33 to i32, !dbg !278
  call void @_Z7_AssertiPKcS0_i(i32 noundef %34, ptr noundef @.str, ptr noundef @.str.1, i32 noundef 66), !dbg !278
  %35 = load ptr, ptr %2, align 8, !dbg !280
  %36 = load i32, ptr %4, align 4, !dbg !281
  %37 = sext i32 %36 to i64, !dbg !280
  %38 = getelementptr inbounds i8, ptr %35, i64 %37, !dbg !280
  %39 = load i8, ptr %38, align 1, !dbg !280
  store i8 %39, ptr %5, align 1, !dbg !282
  %40 = load ptr, ptr %2, align 8, !dbg !283
  %41 = load i32, ptr %3, align 4, !dbg !284
  %42 = sext i32 %41 to i64, !dbg !283
  %43 = getelementptr inbounds i8, ptr %40, i64 %42, !dbg !283
  %44 = load i8, ptr %43, align 1, !dbg !283
  %45 = load ptr, ptr %2, align 8, !dbg !285
  %46 = load i32, ptr %4, align 4, !dbg !286
  %47 = sext i32 %46 to i64, !dbg !285
  %48 = getelementptr inbounds i8, ptr %45, i64 %47, !dbg !285
  store i8 %44, ptr %48, align 1, !dbg !287
  %49 = load i8, ptr %5, align 1, !dbg !288
  %50 = load ptr, ptr %2, align 8, !dbg !289
  %51 = load i32, ptr %3, align 4, !dbg !290
  %52 = sext i32 %51 to i64, !dbg !289
  %53 = getelementptr inbounds i8, ptr %50, i64 %52, !dbg !289
  store i8 %49, ptr %53, align 1, !dbg !291
  br label %54, !dbg !292

54:                                               ; preds = %32
  %55 = load i32, ptr %3, align 4, !dbg !293
  %56 = add nsw i32 %55, 1, !dbg !293
  store i32 %56, ptr %3, align 4, !dbg !293
  br label %20, !dbg !294, !llvm.loop !295

57:                                               ; preds = %20
  ret void, !dbg !297
}

declare noundef i32 @_Z6P_Randv() #1

declare void @_Z7_AssertiPKcS0_i(i32 noundef, ptr noundef, ptr noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z20insert_center_pointsP9point_segPi(ptr noundef %0, ptr noundef %1) #0 !dbg !298 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca %struct.vms_vector, align 4
  %12 = alloca %struct.vms_vector, align 4
  %13 = alloca %struct.vms_vector, align 4
  %14 = alloca %struct.vms_vector, align 4
  %15 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !316, !DIExpression(), !317)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !318, !DIExpression(), !319)
    #dbg_declare(ptr %5, !320, !DIExpression(), !321)
    #dbg_declare(ptr %6, !322, !DIExpression(), !323)
    #dbg_declare(ptr %7, !324, !DIExpression(), !325)
    #dbg_declare(ptr %8, !326, !DIExpression(), !327)
  %16 = load ptr, ptr %4, align 8, !dbg !328
  %17 = load i32, ptr %16, align 4, !dbg !329
  store i32 %17, ptr %8, align 4, !dbg !327
  %18 = load ptr, ptr %4, align 8, !dbg !330
  %19 = load i32, ptr %18, align 4, !dbg !331
  %20 = sub nsw i32 %19, 1, !dbg !332
  store i32 %20, ptr %7, align 4, !dbg !333
  %21 = load i32, ptr %7, align 4, !dbg !334
  store i32 %21, ptr %5, align 4, !dbg !336
  br label %22, !dbg !337

22:                                               ; preds = %151, %2
  %23 = load i32, ptr %5, align 4, !dbg !338
  %24 = icmp sgt i32 %23, 0, !dbg !340
  br i1 %24, label %25, label %154, !dbg !341

25:                                               ; preds = %22
    #dbg_declare(ptr %9, !342, !DIExpression(), !344)
    #dbg_declare(ptr %10, !345, !DIExpression(), !346)
    #dbg_declare(ptr %11, !347, !DIExpression(), !348)
    #dbg_declare(ptr %12, !349, !DIExpression(), !350)
  %26 = load ptr, ptr %3, align 8, !dbg !351
  %27 = load i32, ptr %5, align 4, !dbg !352
  %28 = sext i32 %27 to i64, !dbg !351
  %29 = getelementptr inbounds %struct.point_seg, ptr %26, i64 %28, !dbg !351
  %30 = load ptr, ptr %3, align 8, !dbg !353
  %31 = load i32, ptr %5, align 4, !dbg !354
  %32 = mul nsw i32 2, %31, !dbg !355
  %33 = sext i32 %32 to i64, !dbg !353
  %34 = getelementptr inbounds %struct.point_seg, ptr %30, i64 %33, !dbg !353
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %34, ptr align 4 %29, i64 16, i1 false), !dbg !356
  %35 = load ptr, ptr %3, align 8, !dbg !357
  %36 = load i32, ptr %5, align 4, !dbg !358
  %37 = sext i32 %36 to i64, !dbg !357
  %38 = getelementptr inbounds %struct.point_seg, ptr %35, i64 %37, !dbg !357
  %39 = getelementptr inbounds nuw %struct.point_seg, ptr %38, i32 0, i32 0, !dbg !359
  %40 = load i32, ptr %39, align 4, !dbg !359
  %41 = sext i32 %40 to i64, !dbg !360
  %42 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %41, !dbg !360
  %43 = load ptr, ptr %3, align 8, !dbg !361
  %44 = load i32, ptr %5, align 4, !dbg !362
  %45 = sub nsw i32 %44, 1, !dbg !363
  %46 = sext i32 %45 to i64, !dbg !361
  %47 = getelementptr inbounds %struct.point_seg, ptr %43, i64 %46, !dbg !361
  %48 = getelementptr inbounds nuw %struct.point_seg, ptr %47, i32 0, i32 0, !dbg !364
  %49 = load i32, ptr %48, align 4, !dbg !364
  %50 = sext i32 %49 to i64, !dbg !365
  %51 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %50, !dbg !365
  %52 = call noundef i32 @_Z17find_connect_sideP7segmentS0_(ptr noundef %42, ptr noundef %51), !dbg !366
  store i32 %52, ptr %9, align 4, !dbg !367
  %53 = load i32, ptr %9, align 4, !dbg !368
  %54 = icmp ne i32 %53, -1, !dbg !368
  %55 = zext i1 %54 to i32, !dbg !368
  call void @_Z7_AssertiPKcS0_i(i32 noundef %55, ptr noundef @.str.2, ptr noundef @.str.1, i32 noundef 92), !dbg !368
  %56 = load i32, ptr %9, align 4, !dbg !369
  %57 = icmp eq i32 %56, -1, !dbg !371
  br i1 %57, label %58, label %59, !dbg !371

58:                                               ; preds = %25
  store i32 0, ptr %9, align 4, !dbg !372
  br label %59, !dbg !373

59:                                               ; preds = %58, %25
  %60 = load ptr, ptr %3, align 8, !dbg !374
  %61 = load i32, ptr %5, align 4, !dbg !375
  %62 = sub nsw i32 %61, 1, !dbg !376
  %63 = sext i32 %62 to i64, !dbg !374
  %64 = getelementptr inbounds %struct.point_seg, ptr %60, i64 %63, !dbg !374
  %65 = getelementptr inbounds nuw %struct.point_seg, ptr %64, i32 0, i32 0, !dbg !377
  %66 = load i32, ptr %65, align 4, !dbg !377
  %67 = sext i32 %66 to i64, !dbg !378
  %68 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %67, !dbg !378
  %69 = load i32, ptr %9, align 4, !dbg !379
  call void @_Z28compute_center_point_on_sideP10vms_vectorP7segmenti(ptr noundef %11, ptr noundef %68, i32 noundef %69), !dbg !380
  %70 = load ptr, ptr %3, align 8, !dbg !381
  %71 = load i32, ptr %5, align 4, !dbg !382
  %72 = sub nsw i32 %71, 1, !dbg !383
  %73 = sext i32 %72 to i64, !dbg !381
  %74 = getelementptr inbounds %struct.point_seg, ptr %70, i64 %73, !dbg !381
  %75 = getelementptr inbounds nuw %struct.point_seg, ptr %74, i32 0, i32 1, !dbg !384
  %76 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %12, ptr noundef %75, ptr noundef %11), !dbg !385
  %77 = getelementptr inbounds nuw %struct.vms_vector, ptr %12, i32 0, i32 0, !dbg !386
  %78 = load i32, ptr %77, align 4, !dbg !387
  %79 = sdiv i32 %78, 16, !dbg !387
  store i32 %79, ptr %77, align 4, !dbg !387
  %80 = getelementptr inbounds nuw %struct.vms_vector, ptr %12, i32 0, i32 1, !dbg !388
  %81 = load i32, ptr %80, align 4, !dbg !389
  %82 = sdiv i32 %81, 16, !dbg !389
  store i32 %82, ptr %80, align 4, !dbg !389
  %83 = getelementptr inbounds nuw %struct.vms_vector, ptr %12, i32 0, i32 2, !dbg !390
  %84 = load i32, ptr %83, align 4, !dbg !391
  %85 = sdiv i32 %84, 16, !dbg !391
  store i32 %85, ptr %83, align 4, !dbg !391
  %86 = load ptr, ptr %3, align 8, !dbg !392
  %87 = load i32, ptr %5, align 4, !dbg !393
  %88 = mul nsw i32 2, %87, !dbg !394
  %89 = sub nsw i32 %88, 1, !dbg !395
  %90 = sext i32 %89 to i64, !dbg !392
  %91 = getelementptr inbounds %struct.point_seg, ptr %86, i64 %90, !dbg !392
  %92 = getelementptr inbounds nuw %struct.point_seg, ptr %91, i32 0, i32 1, !dbg !396
  %93 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %92, ptr noundef %11, ptr noundef %12), !dbg !397
  %94 = load ptr, ptr %3, align 8, !dbg !398
  %95 = load i32, ptr %5, align 4, !dbg !399
  %96 = mul nsw i32 2, %95, !dbg !400
  %97 = sub nsw i32 %96, 1, !dbg !401
  %98 = sext i32 %97 to i64, !dbg !398
  %99 = getelementptr inbounds %struct.point_seg, ptr %94, i64 %98, !dbg !398
  %100 = getelementptr inbounds nuw %struct.point_seg, ptr %99, i32 0, i32 1, !dbg !402
  %101 = load ptr, ptr %3, align 8, !dbg !403
  %102 = load i32, ptr %5, align 4, !dbg !404
  %103 = mul nsw i32 2, %102, !dbg !405
  %104 = sext i32 %103 to i64, !dbg !403
  %105 = getelementptr inbounds %struct.point_seg, ptr %101, i64 %104, !dbg !403
  %106 = getelementptr inbounds nuw %struct.point_seg, ptr %105, i32 0, i32 0, !dbg !406
  %107 = load i32, ptr %106, align 4, !dbg !406
  %108 = call noundef i32 @_Z14find_point_segP10vms_vectori(ptr noundef %100, i32 noundef %107), !dbg !407
  store i32 %108, ptr %10, align 4, !dbg !408
  %109 = load i32, ptr %10, align 4, !dbg !409
  %110 = icmp eq i32 %109, -1, !dbg !411
  br i1 %110, label %111, label %134, !dbg !411

111:                                              ; preds = %59
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 1, ptr noundef @.str.3), !dbg !412
  %112 = load ptr, ptr %3, align 8, !dbg !414
  %113 = load i32, ptr %5, align 4, !dbg !415
  %114 = mul nsw i32 2, %113, !dbg !416
  %115 = sub nsw i32 %114, 1, !dbg !417
  %116 = sext i32 %115 to i64, !dbg !414
  %117 = getelementptr inbounds %struct.point_seg, ptr %112, i64 %116, !dbg !414
  %118 = getelementptr inbounds nuw %struct.point_seg, ptr %117, i32 0, i32 1, !dbg !418
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %118, ptr align 4 %11, i64 12, i1 false), !dbg !419
  %119 = load ptr, ptr %3, align 8, !dbg !420
  %120 = load i32, ptr %5, align 4, !dbg !421
  %121 = mul nsw i32 2, %120, !dbg !422
  %122 = sub nsw i32 %121, 1, !dbg !423
  %123 = sext i32 %122 to i64, !dbg !420
  %124 = getelementptr inbounds %struct.point_seg, ptr %119, i64 %123, !dbg !420
  %125 = getelementptr inbounds nuw %struct.point_seg, ptr %124, i32 0, i32 1, !dbg !424
  %126 = load ptr, ptr %3, align 8, !dbg !425
  %127 = load i32, ptr %5, align 4, !dbg !426
  %128 = mul nsw i32 2, %127, !dbg !427
  %129 = sext i32 %128 to i64, !dbg !425
  %130 = getelementptr inbounds %struct.point_seg, ptr %126, i64 %129, !dbg !425
  %131 = getelementptr inbounds nuw %struct.point_seg, ptr %130, i32 0, i32 0, !dbg !428
  %132 = load i32, ptr %131, align 4, !dbg !428
  %133 = call noundef i32 @_Z14find_point_segP10vms_vectori(ptr noundef %125, i32 noundef %132), !dbg !429
  br label %134, !dbg !430

134:                                              ; preds = %111, %59
  %135 = load ptr, ptr %3, align 8, !dbg !431
  %136 = load i32, ptr %5, align 4, !dbg !432
  %137 = mul nsw i32 2, %136, !dbg !433
  %138 = sext i32 %137 to i64, !dbg !431
  %139 = getelementptr inbounds %struct.point_seg, ptr %135, i64 %138, !dbg !431
  %140 = getelementptr inbounds nuw %struct.point_seg, ptr %139, i32 0, i32 0, !dbg !434
  %141 = load i32, ptr %140, align 4, !dbg !434
  %142 = load ptr, ptr %3, align 8, !dbg !435
  %143 = load i32, ptr %5, align 4, !dbg !436
  %144 = mul nsw i32 2, %143, !dbg !437
  %145 = sub nsw i32 %144, 1, !dbg !438
  %146 = sext i32 %145 to i64, !dbg !435
  %147 = getelementptr inbounds %struct.point_seg, ptr %142, i64 %146, !dbg !435
  %148 = getelementptr inbounds nuw %struct.point_seg, ptr %147, i32 0, i32 0, !dbg !439
  store i32 %141, ptr %148, align 4, !dbg !440
  %149 = load i32, ptr %8, align 4, !dbg !441
  %150 = add nsw i32 %149, 1, !dbg !441
  store i32 %150, ptr %8, align 4, !dbg !441
  br label %151, !dbg !442

151:                                              ; preds = %134
  %152 = load i32, ptr %5, align 4, !dbg !443
  %153 = add nsw i32 %152, -1, !dbg !443
  store i32 %153, ptr %5, align 4, !dbg !443
  br label %22, !dbg !444, !llvm.loop !445

154:                                              ; preds = %22
  store i32 1, ptr %5, align 4, !dbg !447
  br label %155, !dbg !449

155:                                              ; preds = %200, %154
  %156 = load i32, ptr %5, align 4, !dbg !450
  %157 = load i32, ptr %8, align 4, !dbg !452
  %158 = sub nsw i32 %157, 1, !dbg !453
  %159 = icmp slt i32 %156, %158, !dbg !454
  br i1 %159, label %160, label %203, !dbg !455

160:                                              ; preds = %155
    #dbg_declare(ptr %13, !456, !DIExpression(), !458)
    #dbg_declare(ptr %14, !459, !DIExpression(), !460)
    #dbg_declare(ptr %15, !461, !DIExpression(), !462)
  %161 = load ptr, ptr %3, align 8, !dbg !463
  %162 = load i32, ptr %5, align 4, !dbg !463
  %163 = sext i32 %162 to i64, !dbg !463
  %164 = getelementptr inbounds %struct.point_seg, ptr %161, i64 %163, !dbg !463
  %165 = getelementptr inbounds nuw %struct.point_seg, ptr %164, i32 0, i32 1, !dbg !463
  %166 = load ptr, ptr %3, align 8, !dbg !463
  %167 = load i32, ptr %5, align 4, !dbg !463
  %168 = sub nsw i32 %167, 1, !dbg !463
  %169 = sext i32 %168 to i64, !dbg !463
  %170 = getelementptr inbounds %struct.point_seg, ptr %166, i64 %169, !dbg !463
  %171 = getelementptr inbounds nuw %struct.point_seg, ptr %170, i32 0, i32 1, !dbg !463
  %172 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %13, ptr noundef %165, ptr noundef %171), !dbg !463
  %173 = load ptr, ptr %3, align 8, !dbg !463
  %174 = load i32, ptr %5, align 4, !dbg !463
  %175 = add nsw i32 %174, 1, !dbg !463
  %176 = sext i32 %175 to i64, !dbg !463
  %177 = getelementptr inbounds %struct.point_seg, ptr %173, i64 %176, !dbg !463
  %178 = getelementptr inbounds nuw %struct.point_seg, ptr %177, i32 0, i32 1, !dbg !463
  %179 = load ptr, ptr %3, align 8, !dbg !463
  %180 = load i32, ptr %5, align 4, !dbg !463
  %181 = sext i32 %180 to i64, !dbg !463
  %182 = getelementptr inbounds %struct.point_seg, ptr %179, i64 %181, !dbg !463
  %183 = getelementptr inbounds nuw %struct.point_seg, ptr %182, i32 0, i32 1, !dbg !463
  %184 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %14, ptr noundef %178, ptr noundef %183), !dbg !463
  %185 = call noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef %172, ptr noundef %184), !dbg !463
  store i32 %185, ptr %15, align 4, !dbg !464
  %186 = load i32, ptr %15, align 4, !dbg !465
  %187 = mul nsw i32 %186, 9, !dbg !467
  %188 = sdiv i32 %187, 8, !dbg !468
  %189 = call noundef i32 @_Z10vm_vec_magP10vms_vector(ptr noundef %13), !dbg !469
  %190 = call noundef i32 @_Z10vm_vec_magP10vms_vector(ptr noundef %14), !dbg !470
  %191 = call noundef i32 @_Z6fixmulii(i32 noundef %189, i32 noundef %190), !dbg !471
  %192 = icmp sgt i32 %188, %191, !dbg !472
  br i1 %192, label %193, label %199, !dbg !472

193:                                              ; preds = %160
  %194 = load ptr, ptr %3, align 8, !dbg !473
  %195 = load i32, ptr %5, align 4, !dbg !474
  %196 = sext i32 %195 to i64, !dbg !473
  %197 = getelementptr inbounds %struct.point_seg, ptr %194, i64 %196, !dbg !473
  %198 = getelementptr inbounds nuw %struct.point_seg, ptr %197, i32 0, i32 0, !dbg !475
  store i32 -1, ptr %198, align 4, !dbg !476
  br label %199, !dbg !473

199:                                              ; preds = %193, %160
  br label %200, !dbg !477

200:                                              ; preds = %199
  %201 = load i32, ptr %5, align 4, !dbg !478
  %202 = add nsw i32 %201, 2, !dbg !478
  store i32 %202, ptr %5, align 4, !dbg !478
  br label %155, !dbg !479, !llvm.loop !480

203:                                              ; preds = %155
  store i32 0, ptr %6, align 4, !dbg !482
  store i32 0, ptr %5, align 4, !dbg !483
  br label %204, !dbg !485

204:                                              ; preds = %227, %203
  %205 = load i32, ptr %5, align 4, !dbg !486
  %206 = load i32, ptr %8, align 4, !dbg !488
  %207 = icmp slt i32 %205, %206, !dbg !489
  br i1 %207, label %208, label %230, !dbg !490

208:                                              ; preds = %204
  %209 = load ptr, ptr %3, align 8, !dbg !491
  %210 = load i32, ptr %5, align 4, !dbg !493
  %211 = sext i32 %210 to i64, !dbg !491
  %212 = getelementptr inbounds %struct.point_seg, ptr %209, i64 %211, !dbg !491
  %213 = getelementptr inbounds nuw %struct.point_seg, ptr %212, i32 0, i32 0, !dbg !494
  %214 = load i32, ptr %213, align 4, !dbg !494
  %215 = icmp ne i32 %214, -1, !dbg !495
  br i1 %215, label %216, label %226, !dbg !495

216:                                              ; preds = %208
  %217 = load ptr, ptr %3, align 8, !dbg !496
  %218 = load i32, ptr %5, align 4, !dbg !497
  %219 = sext i32 %218 to i64, !dbg !496
  %220 = getelementptr inbounds %struct.point_seg, ptr %217, i64 %219, !dbg !496
  %221 = load ptr, ptr %3, align 8, !dbg !498
  %222 = load i32, ptr %6, align 4, !dbg !499
  %223 = add nsw i32 %222, 1, !dbg !499
  store i32 %223, ptr %6, align 4, !dbg !499
  %224 = sext i32 %222 to i64, !dbg !498
  %225 = getelementptr inbounds %struct.point_seg, ptr %221, i64 %224, !dbg !498
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %225, ptr align 4 %220, i64 16, i1 false), !dbg !500
  br label %226, !dbg !498

226:                                              ; preds = %216, %208
  br label %227, !dbg !501

227:                                              ; preds = %226
  %228 = load i32, ptr %5, align 4, !dbg !502
  %229 = add nsw i32 %228, 1, !dbg !502
  store i32 %229, ptr %5, align 4, !dbg !502
  br label %204, !dbg !503, !llvm.loop !504

230:                                              ; preds = %204
  %231 = load i32, ptr %6, align 4, !dbg !506
  %232 = load ptr, ptr %4, align 8, !dbg !507
  store i32 %231, ptr %232, align 4, !dbg !508
  ret void, !dbg !509
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

declare noundef i32 @_Z17find_connect_sideP7segmentS0_(ptr noundef, ptr noundef) #1

declare void @_Z28compute_center_point_on_sideP10vms_vectorP7segmenti(ptr noundef, ptr noundef, i32 noundef) #1

declare noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef, ptr noundef, ptr noundef) #1

declare noundef i32 @_Z14find_point_segP10vms_vectori(ptr noundef, i32 noundef) #1

declare void @_Z8_mprintfiPKcz(i32 noundef, ptr noundef, ...) #1

declare noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef, ptr noundef) #1

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z6fixmulii(i32 noundef %0, i32 noundef %1) #3 !dbg !510 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !513, !DIExpression(), !514)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !515, !DIExpression(), !516)
  %5 = load i32, ptr %3, align 4, !dbg !517
  %6 = sext i32 %5 to i64, !dbg !517
  %7 = load i32, ptr %4, align 4, !dbg !518
  %8 = sext i32 %7 to i64, !dbg !518
  %9 = mul nsw i64 %6, %8, !dbg !519
  %10 = ashr i64 %9, 16, !dbg !520
  %11 = trunc i64 %10 to i32, !dbg !521
  ret i32 %11, !dbg !522
}

declare noundef i32 @_Z10vm_vec_magP10vms_vector(ptr noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z20move_towards_outsideP9point_segPiP6objecti(ptr noundef %0, ptr noundef %1, ptr noundef %2, i32 noundef %3) #0 !dbg !523 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca [200 x %struct.point_seg], align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca %struct.vms_vector, align 4
  %15 = alloca %struct.vms_vector, align 4
  %16 = alloca %struct.vms_vector, align 4
  %17 = alloca %struct.vms_vector, align 4
  %18 = alloca %struct.vms_vector, align 4
  %19 = alloca %struct.vms_vector, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca %struct.fvi_query, align 8
  %23 = alloca %struct.fvi_info, align 4
  %24 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
    #dbg_declare(ptr %5, !657, !DIExpression(), !658)
  store ptr %1, ptr %6, align 8
    #dbg_declare(ptr %6, !659, !DIExpression(), !660)
  store ptr %2, ptr %7, align 8
    #dbg_declare(ptr %7, !661, !DIExpression(), !662)
  store i32 %3, ptr %8, align 4
    #dbg_declare(ptr %8, !663, !DIExpression(), !664)
    #dbg_declare(ptr %9, !665, !DIExpression(), !666)
    #dbg_declare(ptr %10, !667, !DIExpression(), !671)
  %25 = load ptr, ptr %6, align 8, !dbg !672
  %26 = load i32, ptr %25, align 4, !dbg !672
  %27 = icmp slt i32 %26, 200, !dbg !672
  %28 = zext i1 %27 to i32, !dbg !672
  call void @_Z7_AssertiPKcS0_i(i32 noundef %28, ptr noundef @.str.4, ptr noundef @.str.1, i32 noundef 148), !dbg !672
  store i32 1, ptr %9, align 4, !dbg !673
  br label %29, !dbg !675

29:                                               ; preds = %334, %4
  %30 = load i32, ptr %9, align 4, !dbg !676
  %31 = load ptr, ptr %6, align 8, !dbg !678
  %32 = load i32, ptr %31, align 4, !dbg !679
  %33 = sub nsw i32 %32, 1, !dbg !680
  %34 = icmp slt i32 %30, %33, !dbg !681
  br i1 %34, label %35, label %337, !dbg !682

35:                                               ; preds = %29
    #dbg_declare(ptr %11, !683, !DIExpression(), !685)
    #dbg_declare(ptr %12, !686, !DIExpression(), !687)
    #dbg_declare(ptr %13, !688, !DIExpression(), !689)
    #dbg_declare(ptr %14, !690, !DIExpression(), !691)
    #dbg_declare(ptr %15, !692, !DIExpression(), !693)
    #dbg_declare(ptr %16, !694, !DIExpression(), !695)
    #dbg_declare(ptr %17, !696, !DIExpression(), !697)
    #dbg_declare(ptr %18, !698, !DIExpression(), !699)
    #dbg_declare(ptr %19, !700, !DIExpression(), !701)
    #dbg_declare(ptr %20, !702, !DIExpression(), !703)
    #dbg_declare(ptr %21, !704, !DIExpression(), !705)
  %36 = load ptr, ptr %5, align 8, !dbg !706
  %37 = load i32, ptr %9, align 4, !dbg !707
  %38 = sext i32 %37 to i64, !dbg !706
  %39 = getelementptr inbounds %struct.point_seg, ptr %36, i64 %38, !dbg !706
  %40 = getelementptr inbounds nuw %struct.point_seg, ptr %39, i32 0, i32 1, !dbg !708
  %41 = load ptr, ptr %5, align 8, !dbg !709
  %42 = load i32, ptr %9, align 4, !dbg !710
  %43 = sext i32 %42 to i64, !dbg !709
  %44 = getelementptr inbounds %struct.point_seg, ptr %41, i64 %43, !dbg !709
  %45 = getelementptr inbounds nuw %struct.point_seg, ptr %44, i32 0, i32 0, !dbg !711
  %46 = load i32, ptr %45, align 4, !dbg !711
  %47 = call noundef i32 @_Z14find_point_segP10vms_vectori(ptr noundef %40, i32 noundef %46), !dbg !712
  store i32 %47, ptr %21, align 4, !dbg !713
  %48 = load i32, ptr %21, align 4, !dbg !714
  %49 = icmp ne i32 %48, -1, !dbg !714
  %50 = zext i1 %49 to i32, !dbg !714
  call void @_Z7_AssertiPKcS0_i(i32 noundef %50, ptr noundef @.str.5, ptr noundef @.str.1, i32 noundef 161), !dbg !714
  %51 = load i32, ptr %21, align 4, !dbg !715
  %52 = load ptr, ptr %5, align 8, !dbg !716
  %53 = load i32, ptr %9, align 4, !dbg !717
  %54 = sext i32 %53 to i64, !dbg !716
  %55 = getelementptr inbounds %struct.point_seg, ptr %52, i64 %54, !dbg !716
  %56 = getelementptr inbounds nuw %struct.point_seg, ptr %55, i32 0, i32 0, !dbg !718
  store i32 %51, ptr %56, align 4, !dbg !719
  %57 = load ptr, ptr %5, align 8, !dbg !720
  %58 = load i32, ptr %9, align 4, !dbg !721
  %59 = sext i32 %58 to i64, !dbg !720
  %60 = getelementptr inbounds %struct.point_seg, ptr %57, i64 %59, !dbg !720
  %61 = getelementptr inbounds nuw %struct.point_seg, ptr %60, i32 0, i32 0, !dbg !722
  %62 = load i32, ptr %61, align 4, !dbg !722
  store i32 %62, ptr %13, align 4, !dbg !723
  %63 = load ptr, ptr %5, align 8, !dbg !724
  %64 = load i32, ptr %9, align 4, !dbg !725
  %65 = sext i32 %64 to i64, !dbg !724
  %66 = getelementptr inbounds %struct.point_seg, ptr %63, i64 %65, !dbg !724
  %67 = getelementptr inbounds nuw %struct.point_seg, ptr %66, i32 0, i32 1, !dbg !726
  %68 = load ptr, ptr %5, align 8, !dbg !727
  %69 = load i32, ptr %9, align 4, !dbg !728
  %70 = sub nsw i32 %69, 1, !dbg !729
  %71 = sext i32 %70 to i64, !dbg !727
  %72 = getelementptr inbounds %struct.point_seg, ptr %68, i64 %71, !dbg !727
  %73 = getelementptr inbounds nuw %struct.point_seg, ptr %72, i32 0, i32 1, !dbg !730
  %74 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %14, ptr noundef %67, ptr noundef %73), !dbg !731
  %75 = load ptr, ptr %5, align 8, !dbg !732
  %76 = load i32, ptr %9, align 4, !dbg !733
  %77 = add nsw i32 %76, 1, !dbg !734
  %78 = sext i32 %77 to i64, !dbg !732
  %79 = getelementptr inbounds %struct.point_seg, ptr %75, i64 %78, !dbg !732
  %80 = getelementptr inbounds nuw %struct.point_seg, ptr %79, i32 0, i32 1, !dbg !735
  %81 = load ptr, ptr %5, align 8, !dbg !736
  %82 = load i32, ptr %9, align 4, !dbg !737
  %83 = sext i32 %82 to i64, !dbg !736
  %84 = getelementptr inbounds %struct.point_seg, ptr %81, i64 %83, !dbg !736
  %85 = getelementptr inbounds nuw %struct.point_seg, ptr %84, i32 0, i32 1, !dbg !738
  %86 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %15, ptr noundef %80, ptr noundef %85), !dbg !739
  %87 = load ptr, ptr %5, align 8, !dbg !740
  %88 = load i32, ptr %9, align 4, !dbg !741
  %89 = add nsw i32 %88, 1, !dbg !742
  %90 = sext i32 %89 to i64, !dbg !740
  %91 = getelementptr inbounds %struct.point_seg, ptr %87, i64 %90, !dbg !740
  %92 = getelementptr inbounds nuw %struct.point_seg, ptr %91, i32 0, i32 1, !dbg !743
  %93 = load ptr, ptr %5, align 8, !dbg !744
  %94 = load i32, ptr %9, align 4, !dbg !745
  %95 = sub nsw i32 %94, 1, !dbg !746
  %96 = sext i32 %95 to i64, !dbg !744
  %97 = getelementptr inbounds %struct.point_seg, ptr %93, i64 %96, !dbg !744
  %98 = getelementptr inbounds nuw %struct.point_seg, ptr %97, i32 0, i32 1, !dbg !747
  %99 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %16, ptr noundef %92, ptr noundef %98), !dbg !748
  %100 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %14), !dbg !749
  %101 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %15), !dbg !750
  %102 = call noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef %14, ptr noundef %15), !dbg !751
  %103 = call i32 @llvm.abs.i32(i32 %102, i1 true), !dbg !753
  %104 = icmp sgt i32 %103, 49152, !dbg !754
  br i1 %104, label %105, label %165, !dbg !754

105:                                              ; preds = %35
  %106 = getelementptr inbounds nuw %struct.vms_vector, ptr %14, i32 0, i32 2, !dbg !755
  %107 = load i32, ptr %106, align 4, !dbg !755
  %108 = call i32 @llvm.abs.i32(i32 %107, i1 true), !dbg !758
  %109 = icmp slt i32 %108, 32768, !dbg !759
  br i1 %109, label %110, label %137, !dbg !759

110:                                              ; preds = %105
  %111 = load i32, ptr %8, align 4, !dbg !760
  %112 = icmp ne i32 %111, 0, !dbg !760
  br i1 %112, label %113, label %132, !dbg !760

113:                                              ; preds = %110
  %114 = call noundef i32 @_Z6P_Randv(), !dbg !763
  %115 = sub nsw i32 %114, 16384, !dbg !765
  %116 = sdiv i32 %115, 2, !dbg !766
  %117 = getelementptr inbounds nuw %struct.vms_vector, ptr %18, i32 0, i32 0, !dbg !767
  store i32 %116, ptr %117, align 4, !dbg !768
  %118 = call noundef i32 @_Z6P_Randv(), !dbg !769
  %119 = sub nsw i32 %118, 16384, !dbg !770
  %120 = sdiv i32 %119, 2, !dbg !771
  %121 = getelementptr inbounds nuw %struct.vms_vector, ptr %18, i32 0, i32 1, !dbg !772
  store i32 %120, ptr %121, align 4, !dbg !773
  %122 = getelementptr inbounds nuw %struct.vms_vector, ptr %18, i32 0, i32 0, !dbg !774
  %123 = load i32, ptr %122, align 4, !dbg !774
  %124 = call i32 @llvm.abs.i32(i32 %123, i1 true), !dbg !775
  %125 = getelementptr inbounds nuw %struct.vms_vector, ptr %18, i32 0, i32 1, !dbg !776
  %126 = load i32, ptr %125, align 4, !dbg !776
  %127 = call i32 @llvm.abs.i32(i32 %126, i1 true), !dbg !777
  %128 = add nsw i32 %124, %127, !dbg !778
  %129 = add nsw i32 %128, 1, !dbg !779
  %130 = getelementptr inbounds nuw %struct.vms_vector, ptr %18, i32 0, i32 2, !dbg !780
  store i32 %129, ptr %130, align 4, !dbg !781
  %131 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %18), !dbg !782
  br label %136, !dbg !783

132:                                              ; preds = %110
  %133 = getelementptr inbounds nuw %struct.vms_vector, ptr %18, i32 0, i32 0, !dbg !784
  store i32 0, ptr %133, align 4, !dbg !786
  %134 = getelementptr inbounds nuw %struct.vms_vector, ptr %18, i32 0, i32 1, !dbg !787
  store i32 0, ptr %134, align 4, !dbg !788
  %135 = getelementptr inbounds nuw %struct.vms_vector, ptr %18, i32 0, i32 2, !dbg !789
  store i32 65536, ptr %135, align 4, !dbg !790
  br label %136

136:                                              ; preds = %132, %113
  br label %164, !dbg !791

137:                                              ; preds = %105
  %138 = load i32, ptr %8, align 4, !dbg !792
  %139 = icmp ne i32 %138, 0, !dbg !792
  br i1 %139, label %140, label %159, !dbg !792

140:                                              ; preds = %137
  %141 = call noundef i32 @_Z6P_Randv(), !dbg !795
  %142 = sub nsw i32 %141, 16384, !dbg !797
  %143 = sdiv i32 %142, 2, !dbg !798
  %144 = getelementptr inbounds nuw %struct.vms_vector, ptr %18, i32 0, i32 1, !dbg !799
  store i32 %143, ptr %144, align 4, !dbg !800
  %145 = call noundef i32 @_Z6P_Randv(), !dbg !801
  %146 = sub nsw i32 %145, 16384, !dbg !802
  %147 = sdiv i32 %146, 2, !dbg !803
  %148 = getelementptr inbounds nuw %struct.vms_vector, ptr %18, i32 0, i32 2, !dbg !804
  store i32 %147, ptr %148, align 4, !dbg !805
  %149 = getelementptr inbounds nuw %struct.vms_vector, ptr %18, i32 0, i32 1, !dbg !806
  %150 = load i32, ptr %149, align 4, !dbg !806
  %151 = call i32 @llvm.abs.i32(i32 %150, i1 true), !dbg !807
  %152 = getelementptr inbounds nuw %struct.vms_vector, ptr %18, i32 0, i32 2, !dbg !808
  %153 = load i32, ptr %152, align 4, !dbg !808
  %154 = call i32 @llvm.abs.i32(i32 %153, i1 true), !dbg !809
  %155 = add nsw i32 %151, %154, !dbg !810
  %156 = add nsw i32 %155, 1, !dbg !811
  %157 = getelementptr inbounds nuw %struct.vms_vector, ptr %18, i32 0, i32 0, !dbg !812
  store i32 %156, ptr %157, align 4, !dbg !813
  %158 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %18), !dbg !814
  br label %163, !dbg !815

159:                                              ; preds = %137
  %160 = getelementptr inbounds nuw %struct.vms_vector, ptr %18, i32 0, i32 0, !dbg !816
  store i32 65536, ptr %160, align 4, !dbg !818
  %161 = getelementptr inbounds nuw %struct.vms_vector, ptr %18, i32 0, i32 1, !dbg !819
  store i32 0, ptr %161, align 4, !dbg !820
  %162 = getelementptr inbounds nuw %struct.vms_vector, ptr %18, i32 0, i32 2, !dbg !821
  store i32 0, ptr %162, align 4, !dbg !822
  br label %163

163:                                              ; preds = %159, %140
  br label %164

164:                                              ; preds = %163, %136
  br label %169, !dbg !823

165:                                              ; preds = %35
  %166 = call noundef ptr @_Z16vm_vec_crossprodP10vms_vectorS0_S0_(ptr noundef %17, ptr noundef %14, ptr noundef %15), !dbg !824
  %167 = call noundef ptr @_Z16vm_vec_crossprodP10vms_vectorS0_S0_(ptr noundef %18, ptr noundef %16, ptr noundef %17), !dbg !826
  %168 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %18), !dbg !827
  br label %169

169:                                              ; preds = %165, %164
  %170 = call noundef i32 @_Z16vm_vec_mag_quickP10vms_vector(ptr noundef %18), !dbg !828
  %171 = icmp slt i32 %170, 32768, !dbg !830
  br i1 %171, label %172, label %173, !dbg !830

172:                                              ; preds = %169
  call void @_Z4Int3v(), !dbg !831
  br label %173, !dbg !831

173:                                              ; preds = %172, %169
  %174 = load i32, ptr %13, align 4, !dbg !832
  %175 = sext i32 %174 to i64, !dbg !833
  %176 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %175, !dbg !833
  %177 = getelementptr inbounds nuw %struct.segment, ptr %176, i32 0, i32 2, !dbg !834
  %178 = getelementptr inbounds [8 x i16], ptr %177, i64 0, i64 0, !dbg !833
  %179 = load i16, ptr %178, align 4, !dbg !833
  %180 = sext i16 %179 to i64, !dbg !835
  %181 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %180, !dbg !835
  %182 = load i32, ptr %13, align 4, !dbg !836
  %183 = sext i32 %182 to i64, !dbg !837
  %184 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %183, !dbg !837
  %185 = getelementptr inbounds nuw %struct.segment, ptr %184, i32 0, i32 2, !dbg !838
  %186 = getelementptr inbounds [8 x i16], ptr %185, i64 0, i64 6, !dbg !837
  %187 = load i16, ptr %186, align 4, !dbg !837
  %188 = sext i16 %187 to i64, !dbg !839
  %189 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %188, !dbg !839
  %190 = call noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef %181, ptr noundef %189), !dbg !840
  store i32 %190, ptr %12, align 4, !dbg !841
  %191 = load i32, ptr %12, align 4, !dbg !842
  %192 = icmp sgt i32 %191, 2621440, !dbg !844
  br i1 %192, label %193, label %194, !dbg !844

193:                                              ; preds = %173
  store i32 2621440, ptr %12, align 4, !dbg !845
  br label %194, !dbg !846

194:                                              ; preds = %193, %173
  %195 = load ptr, ptr %5, align 8, !dbg !847
  %196 = load i32, ptr %9, align 4, !dbg !848
  %197 = sext i32 %196 to i64, !dbg !847
  %198 = getelementptr inbounds %struct.point_seg, ptr %195, i64 %197, !dbg !847
  %199 = getelementptr inbounds nuw %struct.point_seg, ptr %198, i32 0, i32 1, !dbg !849
  %200 = load i32, ptr %12, align 4, !dbg !850
  %201 = sdiv i32 %200, 4, !dbg !851
  %202 = call noundef ptr @_Z16vm_vec_scale_addP10vms_vectorS0_S0_i(ptr noundef %19, ptr noundef %199, ptr noundef %18, i32 noundef %201), !dbg !852
  store i32 3, ptr %20, align 4, !dbg !853
  br label %203, !dbg !854

203:                                              ; preds = %286, %194
  %204 = load i32, ptr %20, align 4, !dbg !855
  %205 = icmp ne i32 %204, 0, !dbg !855
  br i1 %205, label %206, label %287, !dbg !854

206:                                              ; preds = %203
    #dbg_declare(ptr %22, !856, !DIExpression(), !870)
    #dbg_declare(ptr %23, !871, !DIExpression(), !887)
    #dbg_declare(ptr %24, !888, !DIExpression(), !889)
  %207 = load ptr, ptr %5, align 8, !dbg !890
  %208 = load i32, ptr %9, align 4, !dbg !891
  %209 = sext i32 %208 to i64, !dbg !890
  %210 = getelementptr inbounds %struct.point_seg, ptr %207, i64 %209, !dbg !890
  %211 = getelementptr inbounds nuw %struct.point_seg, ptr %210, i32 0, i32 1, !dbg !892
  %212 = getelementptr inbounds nuw %struct.fvi_query, ptr %22, i32 0, i32 0, !dbg !893
  store ptr %211, ptr %212, align 8, !dbg !894
  %213 = load ptr, ptr %5, align 8, !dbg !895
  %214 = load i32, ptr %9, align 4, !dbg !896
  %215 = sext i32 %214 to i64, !dbg !895
  %216 = getelementptr inbounds %struct.point_seg, ptr %213, i64 %215, !dbg !895
  %217 = getelementptr inbounds nuw %struct.point_seg, ptr %216, i32 0, i32 0, !dbg !897
  %218 = load i32, ptr %217, align 4, !dbg !897
  %219 = getelementptr inbounds nuw %struct.fvi_query, ptr %22, i32 0, i32 2, !dbg !898
  store i32 %218, ptr %219, align 8, !dbg !899
  %220 = getelementptr inbounds nuw %struct.fvi_query, ptr %22, i32 0, i32 1, !dbg !900
  store ptr %19, ptr %220, align 8, !dbg !901
  %221 = load ptr, ptr %7, align 8, !dbg !902
  %222 = getelementptr inbounds nuw %struct.object, ptr %221, i32 0, i32 13, !dbg !903
  %223 = load i32, ptr %222, align 4, !dbg !903
  %224 = getelementptr inbounds nuw %struct.fvi_query, ptr %22, i32 0, i32 3, !dbg !904
  store i32 %223, ptr %224, align 4, !dbg !905
  %225 = load ptr, ptr %7, align 8, !dbg !906
  %226 = ptrtoint ptr %225 to i64, !dbg !907
  %227 = sub i64 %226, ptrtoint (ptr @Objects to i64), !dbg !907
  %228 = sdiv exact i64 %227, 268, !dbg !907
  %229 = trunc i64 %228 to i16, !dbg !906
  %230 = getelementptr inbounds nuw %struct.fvi_query, ptr %22, i32 0, i32 4, !dbg !908
  store i16 %229, ptr %230, align 8, !dbg !909
  %231 = getelementptr inbounds nuw %struct.fvi_query, ptr %22, i32 0, i32 5, !dbg !910
  store ptr null, ptr %231, align 8, !dbg !911
  %232 = getelementptr inbounds nuw %struct.fvi_query, ptr %22, i32 0, i32 6, !dbg !912
  store i32 0, ptr %232, align 8, !dbg !913
  %233 = call noundef i32 @_Z24find_vector_intersectionP9fvi_queryP8fvi_info(ptr noundef %22, ptr noundef %23), !dbg !914
  store i32 %233, ptr %24, align 4, !dbg !915
  %234 = load i32, ptr %24, align 4, !dbg !916
  %235 = icmp eq i32 %234, 0, !dbg !918
  br i1 %235, label %236, label %237, !dbg !918

236:                                              ; preds = %206
  store i32 0, ptr %20, align 4, !dbg !919
  br label %286, !dbg !920

237:                                              ; preds = %206
  %238 = load i32, ptr %20, align 4, !dbg !921
  %239 = icmp eq i32 %238, 3, !dbg !924
  br i1 %239, label %240, label %244, !dbg !925

240:                                              ; preds = %237
  %241 = load i32, ptr %24, align 4, !dbg !926
  %242 = icmp eq i32 %241, 3, !dbg !927
  br i1 %242, label %243, label %244, !dbg !925

243:                                              ; preds = %240
  call void @_Z4Int3v(), !dbg !928
  br label %244, !dbg !928

244:                                              ; preds = %243, %240, %237
  %245 = getelementptr inbounds nuw %struct.fvi_query, ptr %22, i32 0, i32 0, !dbg !929
  %246 = load ptr, ptr %245, align 8, !dbg !929
  %247 = getelementptr inbounds nuw %struct.vms_vector, ptr %246, i32 0, i32 0, !dbg !930
  %248 = load i32, ptr %247, align 4, !dbg !930
  %249 = getelementptr inbounds nuw %struct.fvi_info, ptr %23, i32 0, i32 1, !dbg !931
  %250 = getelementptr inbounds nuw %struct.vms_vector, ptr %249, i32 0, i32 0, !dbg !932
  %251 = load i32, ptr %250, align 4, !dbg !932
  %252 = add nsw i32 %248, %251, !dbg !933
  %253 = sdiv i32 %252, 2, !dbg !934
  %254 = getelementptr inbounds nuw %struct.vms_vector, ptr %19, i32 0, i32 0, !dbg !935
  store i32 %253, ptr %254, align 4, !dbg !936
  %255 = getelementptr inbounds nuw %struct.fvi_query, ptr %22, i32 0, i32 0, !dbg !937
  %256 = load ptr, ptr %255, align 8, !dbg !937
  %257 = getelementptr inbounds nuw %struct.vms_vector, ptr %256, i32 0, i32 1, !dbg !938
  %258 = load i32, ptr %257, align 4, !dbg !938
  %259 = getelementptr inbounds nuw %struct.fvi_info, ptr %23, i32 0, i32 1, !dbg !939
  %260 = getelementptr inbounds nuw %struct.vms_vector, ptr %259, i32 0, i32 1, !dbg !940
  %261 = load i32, ptr %260, align 4, !dbg !940
  %262 = add nsw i32 %258, %261, !dbg !941
  %263 = sdiv i32 %262, 2, !dbg !942
  %264 = getelementptr inbounds nuw %struct.vms_vector, ptr %19, i32 0, i32 1, !dbg !943
  store i32 %263, ptr %264, align 4, !dbg !944
  %265 = getelementptr inbounds nuw %struct.fvi_query, ptr %22, i32 0, i32 0, !dbg !945
  %266 = load ptr, ptr %265, align 8, !dbg !945
  %267 = getelementptr inbounds nuw %struct.vms_vector, ptr %266, i32 0, i32 2, !dbg !946
  %268 = load i32, ptr %267, align 4, !dbg !946
  %269 = getelementptr inbounds nuw %struct.fvi_info, ptr %23, i32 0, i32 1, !dbg !947
  %270 = getelementptr inbounds nuw %struct.vms_vector, ptr %269, i32 0, i32 2, !dbg !948
  %271 = load i32, ptr %270, align 4, !dbg !948
  %272 = add nsw i32 %268, %271, !dbg !949
  %273 = sdiv i32 %272, 2, !dbg !950
  %274 = getelementptr inbounds nuw %struct.vms_vector, ptr %19, i32 0, i32 2, !dbg !951
  store i32 %273, ptr %274, align 4, !dbg !952
  %275 = load i32, ptr %20, align 4, !dbg !953
  %276 = add nsw i32 %275, -1, !dbg !953
  store i32 %276, ptr %20, align 4, !dbg !953
  %277 = load i32, ptr %20, align 4, !dbg !954
  %278 = icmp eq i32 %277, 0, !dbg !956
  br i1 %278, label %279, label %285, !dbg !956

279:                                              ; preds = %244
  %280 = load ptr, ptr %5, align 8, !dbg !957
  %281 = load i32, ptr %9, align 4, !dbg !959
  %282 = sext i32 %281 to i64, !dbg !957
  %283 = getelementptr inbounds %struct.point_seg, ptr %280, i64 %282, !dbg !957
  %284 = getelementptr inbounds nuw %struct.point_seg, ptr %283, i32 0, i32 1, !dbg !960
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %19, ptr align 4 %284, i64 12, i1 false), !dbg !961
  br label %285, !dbg !962

285:                                              ; preds = %279, %244
  br label %286

286:                                              ; preds = %285, %236
  br label %203, !dbg !854, !llvm.loop !963

287:                                              ; preds = %203
  %288 = load ptr, ptr %5, align 8, !dbg !965
  %289 = load i32, ptr %9, align 4, !dbg !966
  %290 = sext i32 %289 to i64, !dbg !965
  %291 = getelementptr inbounds %struct.point_seg, ptr %288, i64 %290, !dbg !965
  %292 = getelementptr inbounds nuw %struct.point_seg, ptr %291, i32 0, i32 0, !dbg !967
  %293 = load i32, ptr %292, align 4, !dbg !967
  %294 = call noundef i32 @_Z14find_point_segP10vms_vectori(ptr noundef %19, i32 noundef %293), !dbg !968
  store i32 %294, ptr %11, align 4, !dbg !969
  %295 = load i32, ptr %11, align 4, !dbg !970
  %296 = load ptr, ptr %5, align 8, !dbg !972
  %297 = load i32, ptr %9, align 4, !dbg !973
  %298 = sext i32 %297 to i64, !dbg !972
  %299 = getelementptr inbounds %struct.point_seg, ptr %296, i64 %298, !dbg !972
  %300 = getelementptr inbounds nuw %struct.point_seg, ptr %299, i32 0, i32 0, !dbg !974
  %301 = load i32, ptr %300, align 4, !dbg !974
  %302 = icmp eq i32 %295, %301, !dbg !975
  br i1 %302, label %303, label %313, !dbg !975

303:                                              ; preds = %287
  %304 = load i32, ptr %9, align 4, !dbg !976
  %305 = sext i32 %304 to i64, !dbg !978
  %306 = getelementptr inbounds [200 x %struct.point_seg], ptr %10, i64 0, i64 %305, !dbg !978
  %307 = getelementptr inbounds nuw %struct.point_seg, ptr %306, i32 0, i32 1, !dbg !979
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %307, ptr align 4 %19, i64 12, i1 false), !dbg !980
  %308 = load i32, ptr %11, align 4, !dbg !981
  %309 = load i32, ptr %9, align 4, !dbg !982
  %310 = sext i32 %309 to i64, !dbg !983
  %311 = getelementptr inbounds [200 x %struct.point_seg], ptr %10, i64 0, i64 %310, !dbg !983
  %312 = getelementptr inbounds nuw %struct.point_seg, ptr %311, i32 0, i32 0, !dbg !984
  store i32 %308, ptr %312, align 4, !dbg !985
  br label %333, !dbg !986

313:                                              ; preds = %287
  %314 = load ptr, ptr %5, align 8, !dbg !987
  %315 = load i32, ptr %9, align 4, !dbg !989
  %316 = sext i32 %315 to i64, !dbg !987
  %317 = getelementptr inbounds %struct.point_seg, ptr %314, i64 %316, !dbg !987
  %318 = getelementptr inbounds nuw %struct.point_seg, ptr %317, i32 0, i32 1, !dbg !990
  %319 = load i32, ptr %9, align 4, !dbg !991
  %320 = sext i32 %319 to i64, !dbg !992
  %321 = getelementptr inbounds [200 x %struct.point_seg], ptr %10, i64 0, i64 %320, !dbg !992
  %322 = getelementptr inbounds nuw %struct.point_seg, ptr %321, i32 0, i32 1, !dbg !993
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %322, ptr align 4 %318, i64 12, i1 false), !dbg !994
  %323 = load ptr, ptr %5, align 8, !dbg !995
  %324 = load i32, ptr %9, align 4, !dbg !996
  %325 = sext i32 %324 to i64, !dbg !995
  %326 = getelementptr inbounds %struct.point_seg, ptr %323, i64 %325, !dbg !995
  %327 = getelementptr inbounds nuw %struct.point_seg, ptr %326, i32 0, i32 0, !dbg !997
  %328 = load i32, ptr %327, align 4, !dbg !997
  %329 = load i32, ptr %9, align 4, !dbg !998
  %330 = sext i32 %329 to i64, !dbg !999
  %331 = getelementptr inbounds [200 x %struct.point_seg], ptr %10, i64 0, i64 %330, !dbg !999
  %332 = getelementptr inbounds nuw %struct.point_seg, ptr %331, i32 0, i32 0, !dbg !1000
  store i32 %328, ptr %332, align 4, !dbg !1001
  br label %333

333:                                              ; preds = %313, %303
  br label %334, !dbg !1002

334:                                              ; preds = %333
  %335 = load i32, ptr %9, align 4, !dbg !1003
  %336 = add nsw i32 %335, 1, !dbg !1003
  store i32 %336, ptr %9, align 4, !dbg !1003
  br label %29, !dbg !1004, !llvm.loop !1005

337:                                              ; preds = %29
  store i32 1, ptr %9, align 4, !dbg !1007
  br label %338, !dbg !1009

338:                                              ; preds = %352, %337
  %339 = load i32, ptr %9, align 4, !dbg !1010
  %340 = load ptr, ptr %6, align 8, !dbg !1012
  %341 = load i32, ptr %340, align 4, !dbg !1013
  %342 = sub nsw i32 %341, 1, !dbg !1014
  %343 = icmp slt i32 %339, %342, !dbg !1015
  br i1 %343, label %344, label %355, !dbg !1016

344:                                              ; preds = %338
  %345 = load i32, ptr %9, align 4, !dbg !1017
  %346 = sext i32 %345 to i64, !dbg !1018
  %347 = getelementptr inbounds [200 x %struct.point_seg], ptr %10, i64 0, i64 %346, !dbg !1018
  %348 = load ptr, ptr %5, align 8, !dbg !1019
  %349 = load i32, ptr %9, align 4, !dbg !1020
  %350 = sext i32 %349 to i64, !dbg !1019
  %351 = getelementptr inbounds %struct.point_seg, ptr %348, i64 %350, !dbg !1019
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %351, ptr align 4 %347, i64 16, i1 false), !dbg !1021
  br label %352, !dbg !1019

352:                                              ; preds = %344
  %353 = load i32, ptr %9, align 4, !dbg !1022
  %354 = add nsw i32 %353, 1, !dbg !1022
  store i32 %354, ptr %9, align 4, !dbg !1022
  br label %338, !dbg !1023, !llvm.loop !1024

355:                                              ; preds = %338
  ret void, !dbg !1026
}

declare noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.abs.i32(i32, i1 immarg) #4

declare noundef ptr @_Z16vm_vec_crossprodP10vms_vectorS0_S0_(ptr noundef, ptr noundef, ptr noundef) #1

declare noundef i32 @_Z16vm_vec_mag_quickP10vms_vector(ptr noundef) #1

declare void @_Z4Int3v() #1

declare noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef, ptr noundef) #1

declare noundef ptr @_Z16vm_vec_scale_addP10vms_vectorS0_S0_i(ptr noundef, ptr noundef, ptr noundef, i32 noundef) #1

declare noundef i32 @_Z24find_vector_intersectionP9fvi_queryP8fvi_info(ptr noundef, ptr noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z18create_path_pointsP6objectiiP9point_segPsiiii(ptr noundef %0, i32 noundef %1, i32 noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6, i32 noundef %7, i32 noundef %8) #0 !dbg !1027 {
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca [900 x i8], align 1
  %26 = alloca [900 x %struct.seg_seg], align 2
  %27 = alloca [900 x i16], align 2
  %28 = alloca i32, align 4
  %29 = alloca [6 x i8], align 1
  %30 = alloca ptr, align 8
  %31 = alloca i32, align 4
  %32 = alloca ptr, align 8
  %33 = alloca i32, align 4
  %34 = alloca i32, align 4
  %35 = alloca %struct.vms_vector, align 4
  %36 = alloca %struct.fvi_query, align 8
  %37 = alloca %struct.fvi_info, align 4
  %38 = alloca i32, align 4
  %39 = alloca i32, align 4
  %40 = alloca i32, align 4
  %41 = alloca i32, align 4
  %42 = alloca %struct.point_seg, align 4
  store ptr %0, ptr %11, align 8
    #dbg_declare(ptr %11, !1031, !DIExpression(), !1032)
  store i32 %1, ptr %12, align 4
    #dbg_declare(ptr %12, !1033, !DIExpression(), !1034)
  store i32 %2, ptr %13, align 4
    #dbg_declare(ptr %13, !1035, !DIExpression(), !1036)
  store ptr %3, ptr %14, align 8
    #dbg_declare(ptr %14, !1037, !DIExpression(), !1038)
  store ptr %4, ptr %15, align 8
    #dbg_declare(ptr %15, !1039, !DIExpression(), !1040)
  store i32 %5, ptr %16, align 4
    #dbg_declare(ptr %16, !1041, !DIExpression(), !1042)
  store i32 %6, ptr %17, align 4
    #dbg_declare(ptr %17, !1043, !DIExpression(), !1044)
  store i32 %7, ptr %18, align 4
    #dbg_declare(ptr %18, !1045, !DIExpression(), !1046)
  store i32 %8, ptr %19, align 4
    #dbg_declare(ptr %19, !1047, !DIExpression(), !1048)
    #dbg_declare(ptr %20, !1049, !DIExpression(), !1050)
    #dbg_declare(ptr %21, !1051, !DIExpression(), !1052)
    #dbg_declare(ptr %22, !1053, !DIExpression(), !1054)
  store i32 0, ptr %22, align 4, !dbg !1054
    #dbg_declare(ptr %23, !1055, !DIExpression(), !1056)
  store i32 0, ptr %23, align 4, !dbg !1056
    #dbg_declare(ptr %24, !1057, !DIExpression(), !1058)
    #dbg_declare(ptr %25, !1059, !DIExpression(), !1063)
    #dbg_declare(ptr %26, !1064, !DIExpression(), !1071)
    #dbg_declare(ptr %27, !1072, !DIExpression(), !1074)
    #dbg_declare(ptr %28, !1075, !DIExpression(), !1076)
    #dbg_declare(ptr %29, !1077, !DIExpression(), !1081)
    #dbg_declare(ptr %30, !1082, !DIExpression(), !1083)
  %43 = load ptr, ptr %14, align 8, !dbg !1084
  store ptr %43, ptr %30, align 8, !dbg !1083
    #dbg_declare(ptr %31, !1085, !DIExpression(), !1086)
  %44 = load ptr, ptr %11, align 8, !dbg !1087
  %45 = getelementptr inbounds nuw %struct.object, ptr %44, i32 0, i32 1, !dbg !1089
  %46 = load i8, ptr %45, align 4, !dbg !1089
  %47 = zext i8 %46 to i32, !dbg !1087
  %48 = icmp eq i32 %47, 2, !dbg !1090
  br i1 %48, label %49, label %61, !dbg !1091

49:                                               ; preds = %9
  %50 = load ptr, ptr %11, align 8, !dbg !1092
  %51 = getelementptr inbounds nuw %struct.object, ptr %50, i32 0, i32 22, !dbg !1093
  %52 = getelementptr inbounds nuw %struct.ai_static, ptr %51, i32 0, i32 0, !dbg !1094
  %53 = load i8, ptr %52, align 4, !dbg !1094
  %54 = zext i8 %53 to i32, !dbg !1092
  %55 = icmp eq i32 %54, 131, !dbg !1095
  br i1 %55, label %56, label %61, !dbg !1091

56:                                               ; preds = %49
  store i32 1, ptr %17, align 4, !dbg !1096
  %57 = load ptr, ptr @ConsoleObject, align 8, !dbg !1098
  %58 = getelementptr inbounds nuw %struct.object, ptr %57, i32 0, i32 9, !dbg !1099
  %59 = load i16, ptr %58, align 2, !dbg !1099
  %60 = sext i16 %59 to i32, !dbg !1098
  store i32 %60, ptr %19, align 4, !dbg !1100
  br label %61, !dbg !1101

61:                                               ; preds = %56, %49, %9
  %62 = load i32, ptr %16, align 4, !dbg !1102
  %63 = icmp eq i32 %62, -1, !dbg !1104
  br i1 %63, label %64, label %65, !dbg !1104

64:                                               ; preds = %61
  store i32 30, ptr %16, align 4, !dbg !1105
  br label %65, !dbg !1106

65:                                               ; preds = %64, %61
  store i32 0, ptr %31, align 4, !dbg !1107
  %66 = getelementptr inbounds [900 x i8], ptr %25, i64 0, i64 0, !dbg !1108
  %67 = load i32, ptr @Highest_segment_index, align 4, !dbg !1109
  %68 = add nsw i32 %67, 1, !dbg !1110
  %69 = sext i32 %68 to i64, !dbg !1111
  %70 = mul i64 1, %69, !dbg !1112
  call void @llvm.memset.p0.i64(ptr align 1 %66, i8 0, i64 %70, i1 false), !dbg !1108
  %71 = getelementptr inbounds [900 x i16], ptr %27, i64 0, i64 0, !dbg !1113
  %72 = load i32, ptr @Highest_segment_index, align 4, !dbg !1114
  %73 = add nsw i32 %72, 1, !dbg !1115
  %74 = sext i32 %73 to i64, !dbg !1116
  %75 = mul i64 2, %74, !dbg !1117
  call void @llvm.memset.p0.i64(ptr align 2 %71, i8 0, i64 %75, i1 false), !dbg !1113
  %76 = load i32, ptr %19, align 4, !dbg !1118
  %77 = icmp ne i32 %76, -1, !dbg !1120
  br i1 %77, label %78, label %99, !dbg !1120

78:                                               ; preds = %65
  %79 = load i32, ptr %19, align 4, !dbg !1121
  %80 = load i32, ptr @Highest_segment_index, align 4, !dbg !1121
  %81 = icmp sle i32 %79, %80, !dbg !1121
  %82 = zext i1 %81 to i32, !dbg !1121
  call void @_Z7_AssertiPKcS0_i(i32 noundef %82, ptr noundef @.str.6, ptr noundef @.str.1, i32 noundef 313), !dbg !1121
  %83 = load i32, ptr %12, align 4, !dbg !1123
  %84 = load i32, ptr %19, align 4, !dbg !1125
  %85 = icmp ne i32 %83, %84, !dbg !1126
  br i1 %85, label %86, label %97, !dbg !1127

86:                                               ; preds = %78
  %87 = load i32, ptr %13, align 4, !dbg !1128
  %88 = load i32, ptr %19, align 4, !dbg !1129
  %89 = icmp ne i32 %87, %88, !dbg !1130
  br i1 %89, label %90, label %97, !dbg !1127

90:                                               ; preds = %86
  %91 = load i32, ptr %19, align 4, !dbg !1131
  %92 = sext i32 %91 to i64, !dbg !1133
  %93 = getelementptr inbounds [900 x i8], ptr %25, i64 0, i64 %92, !dbg !1133
  store i8 1, ptr %93, align 1, !dbg !1134
  %94 = load i32, ptr %19, align 4, !dbg !1135
  %95 = sext i32 %94 to i64, !dbg !1136
  %96 = getelementptr inbounds [900 x i16], ptr %27, i64 0, i64 %95, !dbg !1136
  store i16 0, ptr %96, align 2, !dbg !1137
  br label %98, !dbg !1138

97:                                               ; preds = %86, %78
  br label %98

98:                                               ; preds = %97, %90
  br label %99, !dbg !1139

99:                                               ; preds = %98, %65
  %100 = load i32, ptr %17, align 4, !dbg !1140
  %101 = icmp ne i32 %100, 0, !dbg !1140
  br i1 %101, label %102, label %104, !dbg !1140

102:                                              ; preds = %99
  %103 = getelementptr inbounds [6 x i8], ptr %29, i64 0, i64 0, !dbg !1142
  call void @_Z19create_random_xlatePa(ptr noundef %103), !dbg !1143
  br label %104, !dbg !1143

104:                                              ; preds = %102, %99
  %105 = load i32, ptr %12, align 4, !dbg !1144
  store i32 %105, ptr %20, align 4, !dbg !1145
  %106 = load i32, ptr %20, align 4, !dbg !1146
  %107 = sext i32 %106 to i64, !dbg !1147
  %108 = getelementptr inbounds [900 x i8], ptr %25, i64 0, i64 %107, !dbg !1147
  store i8 1, ptr %108, align 1, !dbg !1148
  store i32 0, ptr %28, align 4, !dbg !1149
  br label %109, !dbg !1150

109:                                              ; preds = %352, %104
  %110 = load i32, ptr %20, align 4, !dbg !1151
  %111 = load i32, ptr %13, align 4, !dbg !1152
  %112 = icmp ne i32 %110, %111, !dbg !1153
  br i1 %112, label %113, label %353, !dbg !1150

113:                                              ; preds = %109
    #dbg_declare(ptr %32, !1154, !DIExpression(), !1192)
  %114 = load i32, ptr %20, align 4, !dbg !1193
  %115 = sext i32 %114 to i64, !dbg !1194
  %116 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %115, !dbg !1194
  store ptr %116, ptr %32, align 8, !dbg !1192
  %117 = load i32, ptr %17, align 4, !dbg !1195
  %118 = icmp ne i32 %117, 0, !dbg !1195
  br i1 %118, label %119, label %125, !dbg !1195

119:                                              ; preds = %113
  %120 = call noundef i32 @_Z6P_Randv(), !dbg !1197
  %121 = icmp slt i32 %120, 8192, !dbg !1199
  br i1 %121, label %122, label %124, !dbg !1199

122:                                              ; preds = %119
  %123 = getelementptr inbounds [6 x i8], ptr %29, i64 0, i64 0, !dbg !1200
  call void @_Z19create_random_xlatePa(ptr noundef %123), !dbg !1201
  br label %124, !dbg !1201

124:                                              ; preds = %122, %119
  br label %125, !dbg !1202

125:                                              ; preds = %124, %113
  store i32 0, ptr %21, align 4, !dbg !1203
  br label %126, !dbg !1205

126:                                              ; preds = %300, %125
  %127 = load i32, ptr %21, align 4, !dbg !1206
  %128 = icmp slt i32 %127, 6, !dbg !1208
  br i1 %128, label %129, label %303, !dbg !1209

129:                                              ; preds = %126
    #dbg_declare(ptr %33, !1210, !DIExpression(), !1212)
  %130 = load i32, ptr %21, align 4, !dbg !1213
  store i32 %130, ptr %33, align 4, !dbg !1212
  %131 = load i32, ptr %17, align 4, !dbg !1214
  %132 = icmp ne i32 %131, 0, !dbg !1214
  br i1 %132, label %133, label %139, !dbg !1214

133:                                              ; preds = %129
  %134 = load i32, ptr %21, align 4, !dbg !1216
  %135 = sext i32 %134 to i64, !dbg !1217
  %136 = getelementptr inbounds [6 x i8], ptr %29, i64 0, i64 %135, !dbg !1217
  %137 = load i8, ptr %136, align 1, !dbg !1217
  %138 = sext i8 %137 to i32, !dbg !1217
  store i32 %138, ptr %33, align 4, !dbg !1218
  br label %139, !dbg !1219

139:                                              ; preds = %133, %129
  %140 = load ptr, ptr %32, align 8, !dbg !1220
  %141 = getelementptr inbounds nuw %struct.segment, ptr %140, i32 0, i32 1, !dbg !1220
  %142 = load i32, ptr %33, align 4, !dbg !1220
  %143 = sext i32 %142 to i64, !dbg !1220
  %144 = getelementptr inbounds [6 x i16], ptr %141, i64 0, i64 %143, !dbg !1220
  %145 = load i16, ptr %144, align 2, !dbg !1220
  %146 = sext i16 %145 to i32, !dbg !1220
  %147 = icmp sgt i32 %146, -1, !dbg !1220
  br i1 %147, label %148, label %298, !dbg !1222

148:                                              ; preds = %139
  %149 = load ptr, ptr %32, align 8, !dbg !1223
  %150 = getelementptr inbounds nuw %struct.segment, ptr %149, i32 0, i32 1, !dbg !1223
  %151 = load i32, ptr %33, align 4, !dbg !1223
  %152 = sext i32 %151 to i64, !dbg !1223
  %153 = getelementptr inbounds [6 x i16], ptr %150, i64 0, i64 %152, !dbg !1223
  %154 = load i16, ptr %153, align 2, !dbg !1223
  %155 = sext i16 %154 to i32, !dbg !1223
  %156 = icmp eq i32 %155, -1, !dbg !1223
  br i1 %156, label %157, label %158, !dbg !1223

157:                                              ; preds = %148
  br label %187, !dbg !1223

158:                                              ; preds = %148
  %159 = load ptr, ptr %32, align 8, !dbg !1223
  %160 = getelementptr inbounds nuw %struct.segment, ptr %159, i32 0, i32 1, !dbg !1223
  %161 = load i32, ptr %33, align 4, !dbg !1223
  %162 = sext i32 %161 to i64, !dbg !1223
  %163 = getelementptr inbounds [6 x i16], ptr %160, i64 0, i64 %162, !dbg !1223
  %164 = load i16, ptr %163, align 2, !dbg !1223
  %165 = sext i16 %164 to i32, !dbg !1223
  %166 = icmp eq i32 %165, -2, !dbg !1223
  br i1 %166, label %167, label %168, !dbg !1223

167:                                              ; preds = %158
  br label %185, !dbg !1223

168:                                              ; preds = %158
  %169 = load ptr, ptr %32, align 8, !dbg !1223
  %170 = getelementptr inbounds nuw %struct.segment, ptr %169, i32 0, i32 0, !dbg !1223
  %171 = load i32, ptr %33, align 4, !dbg !1223
  %172 = sext i32 %171 to i64, !dbg !1223
  %173 = getelementptr inbounds [6 x %struct.side], ptr %170, i64 0, i64 %172, !dbg !1223
  %174 = getelementptr inbounds nuw %struct.side, ptr %173, i32 0, i32 2, !dbg !1223
  %175 = load i16, ptr %174, align 2, !dbg !1223
  %176 = sext i16 %175 to i32, !dbg !1223
  %177 = icmp eq i32 %176, -1, !dbg !1223
  br i1 %177, label %178, label %179, !dbg !1223

178:                                              ; preds = %168
  br label %183, !dbg !1223

179:                                              ; preds = %168
  %180 = load ptr, ptr %32, align 8, !dbg !1223
  %181 = load i32, ptr %33, align 4, !dbg !1223
  %182 = call noundef i32 @_Z15wall_is_doorwayP7segmenti(ptr noundef %180, i32 noundef %181), !dbg !1223
  br label %183, !dbg !1223

183:                                              ; preds = %179, %178
  %184 = phi i32 [ 5, %178 ], [ %182, %179 ], !dbg !1223
  br label %185, !dbg !1223

185:                                              ; preds = %183, %167
  %186 = phi i32 [ 8, %167 ], [ %184, %183 ], !dbg !1223
  br label %187, !dbg !1223

187:                                              ; preds = %185, %157
  %188 = phi i32 [ 2, %157 ], [ %186, %185 ], !dbg !1223
  %189 = and i32 %188, 1, !dbg !1224
  %190 = icmp ne i32 %189, 0, !dbg !1225
  br i1 %190, label %197, label %191, !dbg !1226

191:                                              ; preds = %187
  %192 = load ptr, ptr %11, align 8, !dbg !1227
  %193 = load ptr, ptr %32, align 8, !dbg !1228
  %194 = load i32, ptr %33, align 4, !dbg !1229
  %195 = call noundef i32 @_Z19ai_door_is_openableP6objectP7segmenti(ptr noundef %192, ptr noundef %193, i32 noundef %194), !dbg !1230
  %196 = icmp ne i32 %195, 0, !dbg !1231
  br i1 %196, label %197, label %298, !dbg !1222

197:                                              ; preds = %191, %187
    #dbg_declare(ptr %34, !1232, !DIExpression(), !1234)
  %198 = load ptr, ptr %32, align 8, !dbg !1235
  %199 = getelementptr inbounds nuw %struct.segment, ptr %198, i32 0, i32 1, !dbg !1236
  %200 = load i32, ptr %33, align 4, !dbg !1237
  %201 = sext i32 %200 to i64, !dbg !1235
  %202 = getelementptr inbounds [6 x i16], ptr %199, i64 0, i64 %201, !dbg !1235
  %203 = load i16, ptr %202, align 2, !dbg !1235
  %204 = sext i16 %203 to i32, !dbg !1235
  store i32 %204, ptr %34, align 4, !dbg !1234
  %205 = load i32, ptr %34, align 4, !dbg !1238
  %206 = icmp ne i32 %205, -1, !dbg !1238
  %207 = zext i1 %206 to i32, !dbg !1238
  call void @_Z7_AssertiPKcS0_i(i32 noundef %207, ptr noundef @.str.7, ptr noundef @.str.1, i32 noundef 349), !dbg !1238
  %208 = load i32, ptr %20, align 4, !dbg !1239
  %209 = load i32, ptr %19, align 4, !dbg !1241
  %210 = icmp eq i32 %208, %209, !dbg !1242
  br i1 %210, label %215, label %211, !dbg !1243

211:                                              ; preds = %197
  %212 = load i32, ptr %34, align 4, !dbg !1244
  %213 = load i32, ptr %19, align 4, !dbg !1245
  %214 = icmp eq i32 %212, %213, !dbg !1246
  br i1 %214, label %215, label %251, !dbg !1247

215:                                              ; preds = %211, %197
  %216 = load ptr, ptr @ConsoleObject, align 8, !dbg !1248
  %217 = getelementptr inbounds nuw %struct.object, ptr %216, i32 0, i32 9, !dbg !1249
  %218 = load i16, ptr %217, align 2, !dbg !1249
  %219 = sext i16 %218 to i32, !dbg !1248
  %220 = load i32, ptr %19, align 4, !dbg !1250
  %221 = icmp eq i32 %219, %220, !dbg !1251
  br i1 %221, label %222, label %251, !dbg !1247

222:                                              ; preds = %215
    #dbg_declare(ptr %35, !1252, !DIExpression(), !1254)
    #dbg_declare(ptr %36, !1255, !DIExpression(), !1256)
    #dbg_declare(ptr %37, !1257, !DIExpression(), !1258)
    #dbg_declare(ptr %38, !1259, !DIExpression(), !1260)
  %223 = load ptr, ptr %32, align 8, !dbg !1261
  %224 = load i32, ptr %33, align 4, !dbg !1262
  call void @_Z28compute_center_point_on_sideP10vms_vectorP7segmenti(ptr noundef %35, ptr noundef %223, i32 noundef %224), !dbg !1263
  %225 = load ptr, ptr %11, align 8, !dbg !1264
  %226 = getelementptr inbounds nuw %struct.object, ptr %225, i32 0, i32 11, !dbg !1265
  %227 = getelementptr inbounds nuw %struct.fvi_query, ptr %36, i32 0, i32 0, !dbg !1266
  store ptr %226, ptr %227, align 8, !dbg !1267
  %228 = load ptr, ptr %11, align 8, !dbg !1268
  %229 = getelementptr inbounds nuw %struct.object, ptr %228, i32 0, i32 9, !dbg !1269
  %230 = load i16, ptr %229, align 2, !dbg !1269
  %231 = sext i16 %230 to i32, !dbg !1268
  %232 = getelementptr inbounds nuw %struct.fvi_query, ptr %36, i32 0, i32 2, !dbg !1270
  store i32 %231, ptr %232, align 8, !dbg !1271
  %233 = getelementptr inbounds nuw %struct.fvi_query, ptr %36, i32 0, i32 1, !dbg !1272
  store ptr %35, ptr %233, align 8, !dbg !1273
  %234 = load ptr, ptr %11, align 8, !dbg !1274
  %235 = getelementptr inbounds nuw %struct.object, ptr %234, i32 0, i32 13, !dbg !1275
  %236 = load i32, ptr %235, align 4, !dbg !1275
  %237 = getelementptr inbounds nuw %struct.fvi_query, ptr %36, i32 0, i32 3, !dbg !1276
  store i32 %236, ptr %237, align 4, !dbg !1277
  %238 = load ptr, ptr %11, align 8, !dbg !1278
  %239 = ptrtoint ptr %238 to i64, !dbg !1279
  %240 = sub i64 %239, ptrtoint (ptr @Objects to i64), !dbg !1279
  %241 = sdiv exact i64 %240, 268, !dbg !1279
  %242 = trunc i64 %241 to i16, !dbg !1278
  %243 = getelementptr inbounds nuw %struct.fvi_query, ptr %36, i32 0, i32 4, !dbg !1280
  store i16 %242, ptr %243, align 8, !dbg !1281
  %244 = getelementptr inbounds nuw %struct.fvi_query, ptr %36, i32 0, i32 5, !dbg !1282
  store ptr null, ptr %244, align 8, !dbg !1283
  %245 = getelementptr inbounds nuw %struct.fvi_query, ptr %36, i32 0, i32 6, !dbg !1284
  store i32 0, ptr %245, align 8, !dbg !1285
  %246 = call noundef i32 @_Z24find_vector_intersectionP9fvi_queryP8fvi_info(ptr noundef %36, ptr noundef %37), !dbg !1286
  store i32 %246, ptr %38, align 4, !dbg !1287
  %247 = load i32, ptr %38, align 4, !dbg !1288
  %248 = icmp ne i32 %247, 0, !dbg !1290
  br i1 %248, label %249, label %250, !dbg !1290

249:                                              ; preds = %222
  br label %299, !dbg !1291

250:                                              ; preds = %222
  br label %251, !dbg !1293

251:                                              ; preds = %250, %215, %211
  %252 = load i32, ptr %34, align 4, !dbg !1294
  %253 = sext i32 %252 to i64, !dbg !1296
  %254 = getelementptr inbounds [900 x i8], ptr %25, i64 0, i64 %253, !dbg !1296
  %255 = load i8, ptr %254, align 1, !dbg !1296
  %256 = icmp ne i8 %255, 0, !dbg !1296
  br i1 %256, label %297, label %257, !dbg !1297

257:                                              ; preds = %251
  %258 = load i32, ptr %20, align 4, !dbg !1298
  %259 = trunc i32 %258 to i16, !dbg !1298
  %260 = load i32, ptr %22, align 4, !dbg !1300
  %261 = sext i32 %260 to i64, !dbg !1301
  %262 = getelementptr inbounds [900 x %struct.seg_seg], ptr %26, i64 0, i64 %261, !dbg !1301
  %263 = getelementptr inbounds nuw %struct.seg_seg, ptr %262, i32 0, i32 0, !dbg !1302
  store i16 %259, ptr %263, align 2, !dbg !1303
  %264 = load i32, ptr %34, align 4, !dbg !1304
  %265 = trunc i32 %264 to i16, !dbg !1304
  %266 = load i32, ptr %22, align 4, !dbg !1305
  %267 = sext i32 %266 to i64, !dbg !1306
  %268 = getelementptr inbounds [900 x %struct.seg_seg], ptr %26, i64 0, i64 %267, !dbg !1306
  %269 = getelementptr inbounds nuw %struct.seg_seg, ptr %268, i32 0, i32 1, !dbg !1307
  store i16 %265, ptr %269, align 2, !dbg !1308
  %270 = load i32, ptr %34, align 4, !dbg !1309
  %271 = sext i32 %270 to i64, !dbg !1310
  %272 = getelementptr inbounds [900 x i8], ptr %25, i64 0, i64 %271, !dbg !1310
  store i8 1, ptr %272, align 1, !dbg !1311
  %273 = load i32, ptr %28, align 4, !dbg !1312
  %274 = add nsw i32 %273, 1, !dbg !1313
  %275 = trunc i32 %274 to i16, !dbg !1312
  %276 = load i32, ptr %22, align 4, !dbg !1314
  %277 = add nsw i32 %276, 1, !dbg !1314
  store i32 %277, ptr %22, align 4, !dbg !1314
  %278 = sext i32 %276 to i64, !dbg !1315
  %279 = getelementptr inbounds [900 x i16], ptr %27, i64 0, i64 %278, !dbg !1315
  store i16 %275, ptr %279, align 2, !dbg !1316
  %280 = load i32, ptr %22, align 4, !dbg !1317
  %281 = sub nsw i32 %280, 1, !dbg !1319
  %282 = sext i32 %281 to i64, !dbg !1320
  %283 = getelementptr inbounds [900 x i16], ptr %27, i64 0, i64 %282, !dbg !1320
  %284 = load i16, ptr %283, align 2, !dbg !1320
  %285 = sext i16 %284 to i32, !dbg !1320
  %286 = load i32, ptr %16, align 4, !dbg !1321
  %287 = icmp eq i32 %285, %286, !dbg !1322
  br i1 %287, label %288, label %296, !dbg !1322

288:                                              ; preds = %257
  %289 = load i32, ptr %22, align 4, !dbg !1323
  %290 = sub nsw i32 %289, 1, !dbg !1325
  %291 = sext i32 %290 to i64, !dbg !1326
  %292 = getelementptr inbounds [900 x %struct.seg_seg], ptr %26, i64 0, i64 %291, !dbg !1326
  %293 = getelementptr inbounds nuw %struct.seg_seg, ptr %292, i32 0, i32 1, !dbg !1327
  %294 = load i16, ptr %293, align 2, !dbg !1327
  %295 = sext i16 %294 to i32, !dbg !1326
  store i32 %295, ptr %13, align 4, !dbg !1328
  br label %352, !dbg !1329

296:                                              ; preds = %257
  br label %297, !dbg !1330

297:                                              ; preds = %296, %251
  br label %298, !dbg !1331

298:                                              ; preds = %297, %191, %139
  br label %299, !dbg !1332

299:                                              ; preds = %298, %249
    #dbg_label(!1333, !1334)
  br label %300, !dbg !1335

300:                                              ; preds = %299
  %301 = load i32, ptr %21, align 4, !dbg !1336
  %302 = add nsw i32 %301, 1, !dbg !1336
  store i32 %302, ptr %21, align 4, !dbg !1336
  br label %126, !dbg !1337, !llvm.loop !1338

303:                                              ; preds = %126
  %304 = load i32, ptr %23, align 4, !dbg !1340
  %305 = load i32, ptr %22, align 4, !dbg !1342
  %306 = icmp sge i32 %304, %305, !dbg !1343
  br i1 %306, label %307, label %338, !dbg !1343

307:                                              ; preds = %303
  %308 = load i32, ptr %22, align 4, !dbg !1344
  %309 = icmp eq i32 %308, 0, !dbg !1347
  br i1 %309, label %310, label %329, !dbg !1347

310:                                              ; preds = %307
  %311 = getelementptr inbounds [900 x i8], ptr %25, i64 0, i64 896, !dbg !1348
  %312 = load i8, ptr %311, align 1, !dbg !1348
  %313 = sext i8 %312 to i32, !dbg !1348
  %314 = getelementptr inbounds [900 x i8], ptr %25, i64 0, i64 897, !dbg !1349
  %315 = load i8, ptr %314, align 1, !dbg !1349
  %316 = sext i8 %315 to i32, !dbg !1349
  %317 = shl i32 %316, 8, !dbg !1350
  %318 = or i32 %313, %317, !dbg !1351
  %319 = getelementptr inbounds [900 x i8], ptr %25, i64 0, i64 898, !dbg !1352
  %320 = load i8, ptr %319, align 1, !dbg !1352
  %321 = sext i8 %320 to i32, !dbg !1352
  %322 = shl i32 %321, 16, !dbg !1353
  %323 = or i32 %318, %322, !dbg !1354
  %324 = getelementptr inbounds [900 x i8], ptr %25, i64 0, i64 899, !dbg !1355
  %325 = load i8, ptr %324, align 1, !dbg !1355
  %326 = sext i8 %325 to i32, !dbg !1355
  %327 = shl i32 %326, 24, !dbg !1356
  %328 = or i32 %323, %327, !dbg !1357
  store i32 %328, ptr %13, align 4, !dbg !1358
  br label %337, !dbg !1359

329:                                              ; preds = %307
  %330 = load i32, ptr %22, align 4, !dbg !1360
  %331 = sub nsw i32 %330, 1, !dbg !1361
  %332 = sext i32 %331 to i64, !dbg !1362
  %333 = getelementptr inbounds [900 x %struct.seg_seg], ptr %26, i64 0, i64 %332, !dbg !1362
  %334 = getelementptr inbounds nuw %struct.seg_seg, ptr %333, i32 0, i32 1, !dbg !1363
  %335 = load i16, ptr %334, align 2, !dbg !1363
  %336 = sext i16 %335 to i32, !dbg !1362
  store i32 %336, ptr %13, align 4, !dbg !1364
  br label %337

337:                                              ; preds = %329, %310
  br label %354, !dbg !1365

338:                                              ; preds = %303
  %339 = load i32, ptr %23, align 4, !dbg !1366
  %340 = sext i32 %339 to i64, !dbg !1367
  %341 = getelementptr inbounds [900 x %struct.seg_seg], ptr %26, i64 0, i64 %340, !dbg !1367
  %342 = getelementptr inbounds nuw %struct.seg_seg, ptr %341, i32 0, i32 1, !dbg !1368
  %343 = load i16, ptr %342, align 2, !dbg !1368
  %344 = sext i16 %343 to i32, !dbg !1367
  store i32 %344, ptr %20, align 4, !dbg !1369
  %345 = load i32, ptr %23, align 4, !dbg !1370
  %346 = sext i32 %345 to i64, !dbg !1371
  %347 = getelementptr inbounds [900 x i16], ptr %27, i64 0, i64 %346, !dbg !1371
  %348 = load i16, ptr %347, align 2, !dbg !1371
  %349 = sext i16 %348 to i32, !dbg !1371
  store i32 %349, ptr %28, align 4, !dbg !1372
  %350 = load i32, ptr %23, align 4, !dbg !1373
  %351 = add nsw i32 %350, 1, !dbg !1373
  store i32 %351, ptr %23, align 4, !dbg !1373
  br label %352, !dbg !1374

352:                                              ; preds = %338, %288
    #dbg_label(!1375, !1376)
  br label %109, !dbg !1150, !llvm.loop !1377

353:                                              ; preds = %109
  br label %354, !dbg !1379

354:                                              ; preds = %353, %337
    #dbg_declare(ptr %39, !1380, !DIExpression(), !1381)
  %355 = load i32, ptr %22, align 4, !dbg !1379
  %356 = add nsw i32 %355, -1, !dbg !1379
  store i32 %356, ptr %22, align 4, !dbg !1379
  %357 = load i32, ptr %22, align 4, !dbg !1382
  %358 = icmp slt i32 %357, 0, !dbg !1384
  br i1 %358, label %359, label %378, !dbg !1384

359:                                              ; preds = %354
  %360 = getelementptr inbounds [900 x i8], ptr %25, i64 0, i64 896, !dbg !1385
  %361 = load i8, ptr %360, align 1, !dbg !1385
  %362 = sext i8 %361 to i32, !dbg !1385
  %363 = getelementptr inbounds [900 x i8], ptr %25, i64 0, i64 897, !dbg !1386
  %364 = load i8, ptr %363, align 1, !dbg !1386
  %365 = sext i8 %364 to i32, !dbg !1386
  %366 = shl i32 %365, 8, !dbg !1387
  %367 = or i32 %362, %366, !dbg !1388
  %368 = getelementptr inbounds [900 x i8], ptr %25, i64 0, i64 898, !dbg !1389
  %369 = load i8, ptr %368, align 1, !dbg !1389
  %370 = sext i8 %369 to i32, !dbg !1389
  %371 = shl i32 %370, 16, !dbg !1390
  %372 = or i32 %367, %371, !dbg !1391
  %373 = getelementptr inbounds [900 x i8], ptr %25, i64 0, i64 899, !dbg !1392
  %374 = load i8, ptr %373, align 1, !dbg !1392
  %375 = sext i8 %374 to i32, !dbg !1392
  %376 = shl i32 %375, 24, !dbg !1393
  %377 = or i32 %372, %376, !dbg !1394
  store i32 %377, ptr %39, align 4, !dbg !1395
  br label %385, !dbg !1396

378:                                              ; preds = %354
  %379 = load i32, ptr %22, align 4, !dbg !1397
  %380 = sext i32 %379 to i64, !dbg !1398
  %381 = getelementptr inbounds [900 x %struct.seg_seg], ptr %26, i64 0, i64 %380, !dbg !1398
  %382 = getelementptr inbounds nuw %struct.seg_seg, ptr %381, i32 0, i32 1, !dbg !1399
  %383 = load i16, ptr %382, align 2, !dbg !1399
  %384 = sext i16 %383 to i32, !dbg !1398
  store i32 %384, ptr %39, align 4, !dbg !1400
  br label %385

385:                                              ; preds = %378, %359
  br label %386, !dbg !1401

386:                                              ; preds = %397, %385
  %387 = load i32, ptr %39, align 4, !dbg !1402
  %388 = load i32, ptr %13, align 4, !dbg !1403
  %389 = icmp ne i32 %387, %388, !dbg !1404
  br i1 %389, label %390, label %406, !dbg !1401

390:                                              ; preds = %386
  %391 = load i32, ptr %22, align 4, !dbg !1405
  %392 = icmp slt i32 %391, 0, !dbg !1408
  br i1 %392, label %393, label %397, !dbg !1408

393:                                              ; preds = %390
  %394 = load i32, ptr %31, align 4, !dbg !1409
  %395 = trunc i32 %394 to i16, !dbg !1409
  %396 = load ptr, ptr %15, align 8, !dbg !1411
  store i16 %395, ptr %396, align 2, !dbg !1412
  store i32 -1, ptr %10, align 4, !dbg !1413
  br label %568, !dbg !1413

397:                                              ; preds = %390
  %398 = load i32, ptr %22, align 4, !dbg !1414
  %399 = add nsw i32 %398, -1, !dbg !1414
  store i32 %399, ptr %22, align 4, !dbg !1414
  %400 = load i32, ptr %22, align 4, !dbg !1415
  %401 = sext i32 %400 to i64, !dbg !1416
  %402 = getelementptr inbounds [900 x %struct.seg_seg], ptr %26, i64 0, i64 %401, !dbg !1416
  %403 = getelementptr inbounds nuw %struct.seg_seg, ptr %402, i32 0, i32 1, !dbg !1417
  %404 = load i16, ptr %403, align 2, !dbg !1417
  %405 = sext i16 %404 to i32, !dbg !1416
  store i32 %405, ptr %39, align 4, !dbg !1418
  br label %386, !dbg !1401, !llvm.loop !1419

406:                                              ; preds = %386
  br label %407, !dbg !1421

407:                                              ; preds = %466, %406
  %408 = load i32, ptr %22, align 4, !dbg !1422
  %409 = icmp sge i32 %408, 0, !dbg !1423
  br i1 %409, label %410, label %467, !dbg !1421

410:                                              ; preds = %407
    #dbg_declare(ptr %40, !1424, !DIExpression(), !1426)
    #dbg_declare(ptr %41, !1427, !DIExpression(), !1428)
  %411 = load i32, ptr %22, align 4, !dbg !1429
  %412 = sext i32 %411 to i64, !dbg !1430
  %413 = getelementptr inbounds [900 x %struct.seg_seg], ptr %26, i64 0, i64 %412, !dbg !1430
  %414 = getelementptr inbounds nuw %struct.seg_seg, ptr %413, i32 0, i32 1, !dbg !1431
  %415 = load i16, ptr %414, align 2, !dbg !1431
  %416 = sext i16 %415 to i32, !dbg !1430
  store i32 %416, ptr %41, align 4, !dbg !1432
  %417 = load i32, ptr %22, align 4, !dbg !1433
  %418 = sext i32 %417 to i64, !dbg !1434
  %419 = getelementptr inbounds [900 x %struct.seg_seg], ptr %26, i64 0, i64 %418, !dbg !1434
  %420 = getelementptr inbounds nuw %struct.seg_seg, ptr %419, i32 0, i32 0, !dbg !1435
  %421 = load i16, ptr %420, align 2, !dbg !1435
  %422 = sext i16 %421 to i32, !dbg !1434
  store i32 %422, ptr %40, align 4, !dbg !1436
  %423 = load i32, ptr %41, align 4, !dbg !1437
  %424 = icmp sge i32 %423, 0, !dbg !1437
  br i1 %424, label %425, label %429, !dbg !1437

425:                                              ; preds = %410
  %426 = load i32, ptr %41, align 4, !dbg !1437
  %427 = load i32, ptr @Highest_segment_index, align 4, !dbg !1437
  %428 = icmp sle i32 %426, %427, !dbg !1437
  br label %429

429:                                              ; preds = %425, %410
  %430 = phi i1 [ false, %410 ], [ %428, %425 ], !dbg !1438
  %431 = zext i1 %430 to i32, !dbg !1437
  call void @_Z7_AssertiPKcS0_i(i32 noundef %431, ptr noundef @.str.8, ptr noundef @.str.1, i32 noundef 450), !dbg !1437
  %432 = load i32, ptr %41, align 4, !dbg !1439
  %433 = load ptr, ptr %14, align 8, !dbg !1440
  %434 = getelementptr inbounds nuw %struct.point_seg, ptr %433, i32 0, i32 0, !dbg !1441
  store i32 %432, ptr %434, align 4, !dbg !1442
  %435 = load ptr, ptr %14, align 8, !dbg !1443
  %436 = getelementptr inbounds nuw %struct.point_seg, ptr %435, i32 0, i32 1, !dbg !1444
  %437 = load i32, ptr %41, align 4, !dbg !1445
  %438 = sext i32 %437 to i64, !dbg !1446
  %439 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %438, !dbg !1446
  call void @_Z22compute_segment_centerP10vms_vectorP7segment(ptr noundef %436, ptr noundef %439), !dbg !1447
  %440 = load ptr, ptr %14, align 8, !dbg !1448
  %441 = getelementptr inbounds nuw %struct.point_seg, ptr %440, i32 1, !dbg !1448
  store ptr %441, ptr %14, align 8, !dbg !1448
  %442 = load i32, ptr %31, align 4, !dbg !1449
  %443 = add nsw i32 %442, 1, !dbg !1449
  store i32 %443, ptr %31, align 4, !dbg !1449
  %444 = load i32, ptr %40, align 4, !dbg !1450
  %445 = load i32, ptr %12, align 4, !dbg !1452
  %446 = icmp eq i32 %444, %445, !dbg !1453
  br i1 %446, label %447, label %448, !dbg !1453

447:                                              ; preds = %429
  br label %468, !dbg !1454

448:                                              ; preds = %429
  br label %449, !dbg !1455

449:                                              ; preds = %456, %448
  %450 = load i32, ptr %22, align 4, !dbg !1456
  %451 = add nsw i32 %450, -1, !dbg !1456
  store i32 %451, ptr %22, align 4, !dbg !1456
  %452 = load i32, ptr %22, align 4, !dbg !1458
  %453 = icmp slt i32 %452, 0, !dbg !1460
  br i1 %453, label %454, label %455, !dbg !1460

454:                                              ; preds = %449
  br label %466, !dbg !1461

455:                                              ; preds = %449
  br label %456, !dbg !1462

456:                                              ; preds = %455
  %457 = load i32, ptr %22, align 4, !dbg !1463
  %458 = sext i32 %457 to i64, !dbg !1464
  %459 = getelementptr inbounds [900 x %struct.seg_seg], ptr %26, i64 0, i64 %458, !dbg !1464
  %460 = getelementptr inbounds nuw %struct.seg_seg, ptr %459, i32 0, i32 1, !dbg !1465
  %461 = load i16, ptr %460, align 2, !dbg !1465
  %462 = sext i16 %461 to i32, !dbg !1464
  %463 = load i32, ptr %40, align 4, !dbg !1466
  %464 = icmp ne i32 %462, %463, !dbg !1467
  br i1 %464, label %449, label %465, !dbg !1462, !llvm.loop !1468

465:                                              ; preds = %456
  br label %466, !dbg !1421

466:                                              ; preds = %465, %454
  br label %407, !dbg !1421, !llvm.loop !1470

467:                                              ; preds = %407
  br label %468, !dbg !1472

468:                                              ; preds = %467, %447
  %469 = load i32, ptr %12, align 4, !dbg !1472
  %470 = icmp sge i32 %469, 0, !dbg !1472
  br i1 %470, label %471, label %475, !dbg !1472

471:                                              ; preds = %468
  %472 = load i32, ptr %12, align 4, !dbg !1472
  %473 = load i32, ptr @Highest_segment_index, align 4, !dbg !1472
  %474 = icmp sle i32 %472, %473, !dbg !1472
  br label %475

475:                                              ; preds = %471, %468
  %476 = phi i1 [ false, %468 ], [ %474, %471 ], !dbg !1473
  %477 = zext i1 %476 to i32, !dbg !1472
  call void @_Z7_AssertiPKcS0_i(i32 noundef %477, ptr noundef @.str.9, ptr noundef @.str.1, i32 noundef 472), !dbg !1472
  %478 = load i32, ptr %12, align 4, !dbg !1474
  %479 = load ptr, ptr %14, align 8, !dbg !1475
  %480 = getelementptr inbounds nuw %struct.point_seg, ptr %479, i32 0, i32 0, !dbg !1476
  store i32 %478, ptr %480, align 4, !dbg !1477
  %481 = load ptr, ptr %14, align 8, !dbg !1478
  %482 = getelementptr inbounds nuw %struct.point_seg, ptr %481, i32 0, i32 1, !dbg !1479
  %483 = load i32, ptr %12, align 4, !dbg !1480
  %484 = sext i32 %483 to i64, !dbg !1481
  %485 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %484, !dbg !1481
  call void @_Z22compute_segment_centerP10vms_vectorP7segment(ptr noundef %482, ptr noundef %485), !dbg !1482
  %486 = load ptr, ptr %14, align 8, !dbg !1483
  %487 = getelementptr inbounds nuw %struct.point_seg, ptr %486, i32 1, !dbg !1483
  store ptr %487, ptr %14, align 8, !dbg !1483
  %488 = load i32, ptr %31, align 4, !dbg !1484
  %489 = add nsw i32 %488, 1, !dbg !1484
  store i32 %489, ptr %31, align 4, !dbg !1484
  store i32 0, ptr %24, align 4, !dbg !1485
  br label %490, !dbg !1487

490:                                              ; preds = %522, %475
  %491 = load i32, ptr %24, align 4, !dbg !1488
  %492 = load i32, ptr %31, align 4, !dbg !1490
  %493 = sdiv i32 %492, 2, !dbg !1491
  %494 = icmp slt i32 %491, %493, !dbg !1492
  br i1 %494, label %495, label %525, !dbg !1493

495:                                              ; preds = %490
    #dbg_declare(ptr %42, !1494, !DIExpression(), !1496)
  %496 = load ptr, ptr %30, align 8, !dbg !1497
  %497 = load i32, ptr %24, align 4, !dbg !1498
  %498 = sext i32 %497 to i64, !dbg !1499
  %499 = getelementptr inbounds %struct.point_seg, ptr %496, i64 %498, !dbg !1499
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %42, ptr align 4 %499, i64 16, i1 false), !dbg !1500
  %500 = load ptr, ptr %30, align 8, !dbg !1501
  %501 = load i32, ptr %31, align 4, !dbg !1502
  %502 = sext i32 %501 to i64, !dbg !1503
  %503 = getelementptr inbounds %struct.point_seg, ptr %500, i64 %502, !dbg !1503
  %504 = load i32, ptr %24, align 4, !dbg !1504
  %505 = sext i32 %504 to i64, !dbg !1505
  %506 = sub i64 0, %505, !dbg !1505
  %507 = getelementptr inbounds %struct.point_seg, ptr %503, i64 %506, !dbg !1505
  %508 = getelementptr inbounds %struct.point_seg, ptr %507, i64 -1, !dbg !1506
  %509 = load ptr, ptr %30, align 8, !dbg !1507
  %510 = load i32, ptr %24, align 4, !dbg !1508
  %511 = sext i32 %510 to i64, !dbg !1509
  %512 = getelementptr inbounds %struct.point_seg, ptr %509, i64 %511, !dbg !1509
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %512, ptr align 4 %508, i64 16, i1 false), !dbg !1510
  %513 = load ptr, ptr %30, align 8, !dbg !1511
  %514 = load i32, ptr %31, align 4, !dbg !1512
  %515 = sext i32 %514 to i64, !dbg !1513
  %516 = getelementptr inbounds %struct.point_seg, ptr %513, i64 %515, !dbg !1513
  %517 = load i32, ptr %24, align 4, !dbg !1514
  %518 = sext i32 %517 to i64, !dbg !1515
  %519 = sub i64 0, %518, !dbg !1515
  %520 = getelementptr inbounds %struct.point_seg, ptr %516, i64 %519, !dbg !1515
  %521 = getelementptr inbounds %struct.point_seg, ptr %520, i64 -1, !dbg !1516
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %521, ptr align 4 %42, i64 16, i1 false), !dbg !1517
  br label %522, !dbg !1518

522:                                              ; preds = %495
  %523 = load i32, ptr %24, align 4, !dbg !1519
  %524 = add nsw i32 %523, 1, !dbg !1519
  store i32 %524, ptr %24, align 4, !dbg !1519
  br label %490, !dbg !1520, !llvm.loop !1521

525:                                              ; preds = %490
  %526 = load i32, ptr %18, align 4, !dbg !1523
  %527 = icmp ne i32 %526, 0, !dbg !1523
  br i1 %527, label %528, label %545, !dbg !1523

528:                                              ; preds = %525
  %529 = load ptr, ptr %14, align 8, !dbg !1525
  %530 = ptrtoint ptr %529 to i64, !dbg !1528
  %531 = sub i64 %530, ptrtoint (ptr @Point_segs to i64), !dbg !1528
  %532 = sdiv exact i64 %531, 16, !dbg !1528
  %533 = load i32, ptr %31, align 4, !dbg !1529
  %534 = sext i32 %533 to i64, !dbg !1529
  %535 = add nsw i64 %532, %534, !dbg !1530
  %536 = add nsw i64 %535, 2, !dbg !1531
  %537 = icmp sgt i64 %536, 2500, !dbg !1532
  br i1 %537, label %538, label %542, !dbg !1532

538:                                              ; preds = %528
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.10), !dbg !1533
  call void @_Z18ai_reset_all_pathsv(), !dbg !1535
  %539 = load i32, ptr %31, align 4, !dbg !1536
  %540 = trunc i32 %539 to i16, !dbg !1536
  %541 = load ptr, ptr %15, align 8, !dbg !1537
  store i16 %540, ptr %541, align 2, !dbg !1538
  store i32 -1, ptr %10, align 4, !dbg !1539
  br label %568, !dbg !1539

542:                                              ; preds = %528
  %543 = load ptr, ptr %30, align 8, !dbg !1540
  call void @_Z20insert_center_pointsP9point_segPi(ptr noundef %543, ptr noundef %31), !dbg !1542
  br label %544

544:                                              ; preds = %542
  br label %545, !dbg !1543

545:                                              ; preds = %544, %525
  %546 = load ptr, ptr %11, align 8, !dbg !1544
  %547 = getelementptr inbounds nuw %struct.object, ptr %546, i32 0, i32 1, !dbg !1546
  %548 = load i8, ptr %547, align 4, !dbg !1546
  %549 = zext i8 %548 to i32, !dbg !1544
  %550 = icmp eq i32 %549, 2, !dbg !1547
  br i1 %550, label %551, label %564, !dbg !1547

551:                                              ; preds = %545
  %552 = load ptr, ptr %11, align 8, !dbg !1548
  %553 = getelementptr inbounds nuw %struct.object, ptr %552, i32 0, i32 2, !dbg !1550
  %554 = load i8, ptr %553, align 1, !dbg !1550
  %555 = zext i8 %554 to i64, !dbg !1551
  %556 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %555, !dbg !1551
  %557 = getelementptr inbounds nuw %struct.robot_info, ptr %556, i32 0, i32 37, !dbg !1552
  %558 = load i8, ptr %557, align 1, !dbg !1552
  %559 = icmp ne i8 %558, 0, !dbg !1551
  br i1 %559, label %560, label %563, !dbg !1551

560:                                              ; preds = %551
  %561 = load ptr, ptr %30, align 8, !dbg !1553
  %562 = load ptr, ptr %11, align 8, !dbg !1554
  call void @_Z20move_towards_outsideP9point_segPiP6objecti(ptr noundef %561, ptr noundef %31, ptr noundef %562, i32 noundef 0), !dbg !1555
  br label %563, !dbg !1555

563:                                              ; preds = %560, %551
  br label %564, !dbg !1552

564:                                              ; preds = %563, %545
  %565 = load i32, ptr %31, align 4, !dbg !1556
  %566 = trunc i32 %565 to i16, !dbg !1556
  %567 = load ptr, ptr %15, align 8, !dbg !1557
  store i16 %566, ptr %567, align 2, !dbg !1558
  store i32 0, ptr %10, align 4, !dbg !1559
  br label %568, !dbg !1559

568:                                              ; preds = %564, %538, %393
  %569 = load i32, ptr %10, align 4, !dbg !1560
  ret i32 %569, !dbg !1560
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #5

declare noundef i32 @_Z15wall_is_doorwayP7segmenti(ptr noundef, i32 noundef) #1

declare noundef i32 @_Z19ai_door_is_openableP6objectP7segmenti(ptr noundef, ptr noundef, i32 noundef) #1

declare void @_Z22compute_segment_centerP10vms_vectorP7segment(ptr noundef, ptr noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z18ai_reset_all_pathsv() #0 !dbg !1561 {
  %1 = alloca i32, align 4
    #dbg_declare(ptr %1, !1564, !DIExpression(), !1565)
  store i32 0, ptr %1, align 4, !dbg !1566
  br label %2, !dbg !1568

2:                                                ; preds = %26, %0
  %3 = load i32, ptr %1, align 4, !dbg !1569
  %4 = load i32, ptr @Highest_object_index, align 4, !dbg !1571
  %5 = icmp sle i32 %3, %4, !dbg !1572
  br i1 %5, label %6, label %29, !dbg !1573

6:                                                ; preds = %2
  %7 = load i32, ptr %1, align 4, !dbg !1574
  %8 = sext i32 %7 to i64, !dbg !1576
  %9 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %8, !dbg !1576
  %10 = getelementptr inbounds nuw %struct.object, ptr %9, i32 0, i32 5, !dbg !1577
  %11 = load i8, ptr %10, align 2, !dbg !1577
  %12 = zext i8 %11 to i32, !dbg !1576
  %13 = icmp eq i32 %12, 1, !dbg !1578
  br i1 %13, label %14, label %25, !dbg !1578

14:                                               ; preds = %6
  %15 = load i32, ptr %1, align 4, !dbg !1579
  %16 = sext i32 %15 to i64, !dbg !1581
  %17 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %16, !dbg !1581
  %18 = getelementptr inbounds nuw %struct.object, ptr %17, i32 0, i32 22, !dbg !1582
  %19 = getelementptr inbounds nuw %struct.ai_static, ptr %18, i32 0, i32 3, !dbg !1583
  store i16 -1, ptr %19, align 2, !dbg !1584
  %20 = load i32, ptr %1, align 4, !dbg !1585
  %21 = sext i32 %20 to i64, !dbg !1586
  %22 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %21, !dbg !1586
  %23 = getelementptr inbounds nuw %struct.object, ptr %22, i32 0, i32 22, !dbg !1587
  %24 = getelementptr inbounds nuw %struct.ai_static, ptr %23, i32 0, i32 4, !dbg !1588
  store i16 0, ptr %24, align 4, !dbg !1589
  br label %25, !dbg !1590

25:                                               ; preds = %14, %6
  br label %26, !dbg !1591

26:                                               ; preds = %25
  %27 = load i32, ptr %1, align 4, !dbg !1592
  %28 = add nsw i32 %27, 1, !dbg !1592
  store i32 %28, ptr %1, align 4, !dbg !1592
  br label %2, !dbg !1593, !llvm.loop !1594

29:                                               ; preds = %2
  call void @_Z23ai_path_garbage_collectv(), !dbg !1596
  ret void, !dbg !1597
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z11polish_pathP6objectP9point_segi(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 !dbg !1598 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca %struct.fvi_query, align 8
  %11 = alloca %struct.fvi_info, align 4
  %12 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
    #dbg_declare(ptr %5, !1601, !DIExpression(), !1602)
  store ptr %1, ptr %6, align 8
    #dbg_declare(ptr %6, !1603, !DIExpression(), !1604)
  store i32 %2, ptr %7, align 4
    #dbg_declare(ptr %7, !1605, !DIExpression(), !1606)
    #dbg_declare(ptr %8, !1607, !DIExpression(), !1608)
    #dbg_declare(ptr %9, !1609, !DIExpression(), !1610)
  store i32 0, ptr %9, align 4, !dbg !1610
  %13 = load i32, ptr %7, align 4, !dbg !1611
  %14 = icmp sle i32 %13, 4, !dbg !1613
  br i1 %14, label %15, label %17, !dbg !1613

15:                                               ; preds = %3
  %16 = load i32, ptr %7, align 4, !dbg !1614
  store i32 %16, ptr %4, align 4, !dbg !1615
  br label %106, !dbg !1615

17:                                               ; preds = %3
  %18 = load ptr, ptr %5, align 8, !dbg !1616
  %19 = getelementptr inbounds nuw %struct.object, ptr %18, i32 0, i32 2, !dbg !1618
  %20 = load i8, ptr %19, align 1, !dbg !1618
  %21 = zext i8 %20 to i64, !dbg !1619
  %22 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %21, !dbg !1619
  %23 = getelementptr inbounds nuw %struct.robot_info, ptr %22, i32 0, i32 37, !dbg !1620
  %24 = load i8, ptr %23, align 1, !dbg !1620
  %25 = icmp ne i8 %24, 0, !dbg !1619
  br i1 %25, label %26, label %35, !dbg !1619

26:                                               ; preds = %17
  %27 = load i32, ptr @FrameCount, align 4, !dbg !1621
  %28 = load i32, ptr @Last_buddy_polish_path_frame, align 4, !dbg !1623
  %29 = icmp eq i32 %27, %28, !dbg !1624
  br i1 %29, label %30, label %32, !dbg !1624

30:                                               ; preds = %26
  %31 = load i32, ptr %7, align 4, !dbg !1625
  store i32 %31, ptr %4, align 4, !dbg !1626
  br label %106, !dbg !1626

32:                                               ; preds = %26
  %33 = load i32, ptr @FrameCount, align 4, !dbg !1627
  store i32 %33, ptr @Last_buddy_polish_path_frame, align 4, !dbg !1628
  br label %34

34:                                               ; preds = %32
  br label %35, !dbg !1623

35:                                               ; preds = %34, %17
  store i32 0, ptr %8, align 4, !dbg !1629
  br label %36, !dbg !1631

36:                                               ; preds = %74, %35
  %37 = load i32, ptr %8, align 4, !dbg !1632
  %38 = icmp slt i32 %37, 2, !dbg !1634
  br i1 %38, label %39, label %77, !dbg !1635

39:                                               ; preds = %36
    #dbg_declare(ptr %10, !1636, !DIExpression(), !1638)
    #dbg_declare(ptr %11, !1639, !DIExpression(), !1640)
    #dbg_declare(ptr %12, !1641, !DIExpression(), !1642)
  %40 = load ptr, ptr %5, align 8, !dbg !1643
  %41 = getelementptr inbounds nuw %struct.object, ptr %40, i32 0, i32 11, !dbg !1644
  %42 = getelementptr inbounds nuw %struct.fvi_query, ptr %10, i32 0, i32 0, !dbg !1645
  store ptr %41, ptr %42, align 8, !dbg !1646
  %43 = load ptr, ptr %5, align 8, !dbg !1647
  %44 = getelementptr inbounds nuw %struct.object, ptr %43, i32 0, i32 9, !dbg !1648
  %45 = load i16, ptr %44, align 2, !dbg !1648
  %46 = sext i16 %45 to i32, !dbg !1647
  %47 = getelementptr inbounds nuw %struct.fvi_query, ptr %10, i32 0, i32 2, !dbg !1649
  store i32 %46, ptr %47, align 8, !dbg !1650
  %48 = load ptr, ptr %6, align 8, !dbg !1651
  %49 = load i32, ptr %8, align 4, !dbg !1652
  %50 = sext i32 %49 to i64, !dbg !1651
  %51 = getelementptr inbounds %struct.point_seg, ptr %48, i64 %50, !dbg !1651
  %52 = getelementptr inbounds nuw %struct.point_seg, ptr %51, i32 0, i32 1, !dbg !1653
  %53 = getelementptr inbounds nuw %struct.fvi_query, ptr %10, i32 0, i32 1, !dbg !1654
  store ptr %52, ptr %53, align 8, !dbg !1655
  %54 = load ptr, ptr %5, align 8, !dbg !1656
  %55 = getelementptr inbounds nuw %struct.object, ptr %54, i32 0, i32 13, !dbg !1657
  %56 = load i32, ptr %55, align 4, !dbg !1657
  %57 = getelementptr inbounds nuw %struct.fvi_query, ptr %10, i32 0, i32 3, !dbg !1658
  store i32 %56, ptr %57, align 4, !dbg !1659
  %58 = load ptr, ptr %5, align 8, !dbg !1660
  %59 = ptrtoint ptr %58 to i64, !dbg !1661
  %60 = sub i64 %59, ptrtoint (ptr @Objects to i64), !dbg !1661
  %61 = sdiv exact i64 %60, 268, !dbg !1661
  %62 = trunc i64 %61 to i16, !dbg !1660
  %63 = getelementptr inbounds nuw %struct.fvi_query, ptr %10, i32 0, i32 4, !dbg !1662
  store i16 %62, ptr %63, align 8, !dbg !1663
  %64 = getelementptr inbounds nuw %struct.fvi_query, ptr %10, i32 0, i32 5, !dbg !1664
  store ptr null, ptr %64, align 8, !dbg !1665
  %65 = getelementptr inbounds nuw %struct.fvi_query, ptr %10, i32 0, i32 6, !dbg !1666
  store i32 0, ptr %65, align 8, !dbg !1667
  %66 = call noundef i32 @_Z24find_vector_intersectionP9fvi_queryP8fvi_info(ptr noundef %10, ptr noundef %11), !dbg !1668
  store i32 %66, ptr %12, align 4, !dbg !1669
  %67 = load i32, ptr %12, align 4, !dbg !1670
  %68 = icmp eq i32 %67, 0, !dbg !1672
  br i1 %68, label %69, label %72, !dbg !1672

69:                                               ; preds = %39
  %70 = load i32, ptr %8, align 4, !dbg !1673
  %71 = add nsw i32 %70, 1, !dbg !1674
  store i32 %71, ptr %9, align 4, !dbg !1675
  br label %73, !dbg !1676

72:                                               ; preds = %39
  br label %78, !dbg !1677

73:                                               ; preds = %69
  br label %74, !dbg !1678

74:                                               ; preds = %73
  %75 = load i32, ptr %8, align 4, !dbg !1679
  %76 = add nsw i32 %75, 1, !dbg !1679
  store i32 %76, ptr %8, align 4, !dbg !1679
  br label %36, !dbg !1680, !llvm.loop !1681

77:                                               ; preds = %36
  br label %78, !dbg !1683

78:                                               ; preds = %77, %72
  %79 = load i32, ptr %9, align 4, !dbg !1683
  %80 = icmp ne i32 %79, 0, !dbg !1683
  br i1 %80, label %81, label %102, !dbg !1683

81:                                               ; preds = %78
  %82 = load i32, ptr %9, align 4, !dbg !1685
  store i32 %82, ptr %8, align 4, !dbg !1688
  br label %83, !dbg !1689

83:                                               ; preds = %98, %81
  %84 = load i32, ptr %8, align 4, !dbg !1690
  %85 = load i32, ptr %7, align 4, !dbg !1692
  %86 = icmp slt i32 %84, %85, !dbg !1693
  br i1 %86, label %87, label %101, !dbg !1694

87:                                               ; preds = %83
  %88 = load ptr, ptr %6, align 8, !dbg !1695
  %89 = load i32, ptr %8, align 4, !dbg !1696
  %90 = sext i32 %89 to i64, !dbg !1695
  %91 = getelementptr inbounds %struct.point_seg, ptr %88, i64 %90, !dbg !1695
  %92 = load ptr, ptr %6, align 8, !dbg !1697
  %93 = load i32, ptr %8, align 4, !dbg !1698
  %94 = load i32, ptr %9, align 4, !dbg !1699
  %95 = sub nsw i32 %93, %94, !dbg !1700
  %96 = sext i32 %95 to i64, !dbg !1697
  %97 = getelementptr inbounds %struct.point_seg, ptr %92, i64 %96, !dbg !1697
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %97, ptr align 4 %91, i64 16, i1 false), !dbg !1701
  br label %98, !dbg !1697

98:                                               ; preds = %87
  %99 = load i32, ptr %8, align 4, !dbg !1702
  %100 = add nsw i32 %99, 1, !dbg !1702
  store i32 %100, ptr %8, align 4, !dbg !1702
  br label %83, !dbg !1703, !llvm.loop !1704

101:                                              ; preds = %83
  br label %102, !dbg !1706

102:                                              ; preds = %101, %78
  %103 = load i32, ptr %7, align 4, !dbg !1707
  %104 = load i32, ptr %9, align 4, !dbg !1708
  %105 = sub nsw i32 %103, %104, !dbg !1709
  store i32 %105, ptr %4, align 4, !dbg !1710
  br label %106, !dbg !1710

106:                                              ; preds = %102, %30, %15
  %107 = load i32, ptr %4, align 4, !dbg !1711
  ret i32 %107, !dbg !1711
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define noundef i32 @_Z13validate_pathiP9point_segi(i32 noundef %0, ptr noundef %1, i32 noundef %2) #3 !dbg !1712 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
    #dbg_declare(ptr %4, !1715, !DIExpression(), !1716)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !1717, !DIExpression(), !1718)
  store i32 %2, ptr %6, align 4
    #dbg_declare(ptr %6, !1719, !DIExpression(), !1720)
  ret i32 1, !dbg !1721
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define void @_Z18validate_all_pathsv() #3 !dbg !1722 {
  ret void, !dbg !1723
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z21create_path_to_playerP6objectii(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 !dbg !1724 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !1727, !DIExpression(), !1728)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !1729, !DIExpression(), !1730)
  store i32 %2, ptr %6, align 4
    #dbg_declare(ptr %6, !1731, !DIExpression(), !1732)
    #dbg_declare(ptr %7, !1733, !DIExpression(), !1735)
  %11 = load ptr, ptr %4, align 8, !dbg !1736
  %12 = getelementptr inbounds nuw %struct.object, ptr %11, i32 0, i32 22, !dbg !1737
  store ptr %12, ptr %7, align 8, !dbg !1735
    #dbg_declare(ptr %8, !1738, !DIExpression(), !1763)
  %13 = load ptr, ptr %4, align 8, !dbg !1764
  %14 = ptrtoint ptr %13 to i64, !dbg !1765
  %15 = sub i64 %14, ptrtoint (ptr @Objects to i64), !dbg !1765
  %16 = sdiv exact i64 %15, 268, !dbg !1765
  %17 = getelementptr inbounds [350 x %struct.ai_local], ptr @Ai_local_info, i64 0, i64 %16, !dbg !1766
  store ptr %17, ptr %8, align 8, !dbg !1763
    #dbg_declare(ptr %9, !1767, !DIExpression(), !1768)
    #dbg_declare(ptr %10, !1769, !DIExpression(), !1770)
  %18 = load i32, ptr %5, align 4, !dbg !1771
  %19 = icmp eq i32 %18, -1, !dbg !1773
  br i1 %19, label %20, label %21, !dbg !1773

20:                                               ; preds = %3
  store i32 10, ptr %5, align 4, !dbg !1774
  br label %21, !dbg !1775

21:                                               ; preds = %20, %3
  %22 = load i32, ptr @GameTime, align 4, !dbg !1776
  %23 = load ptr, ptr %8, align 8, !dbg !1777
  %24 = getelementptr inbounds nuw %struct.ai_local, ptr %23, i32 0, i32 11, !dbg !1778
  store i32 %22, ptr %24, align 4, !dbg !1779
  %25 = load i32, ptr @Believed_player_seg, align 4, !dbg !1780
  %26 = load ptr, ptr %8, align 8, !dbg !1781
  %27 = getelementptr inbounds nuw %struct.ai_local, ptr %26, i32 0, i32 6, !dbg !1782
  store i32 %25, ptr %27, align 4, !dbg !1783
  %28 = load ptr, ptr %4, align 8, !dbg !1784
  %29 = getelementptr inbounds nuw %struct.object, ptr %28, i32 0, i32 9, !dbg !1785
  %30 = load i16, ptr %29, align 2, !dbg !1785
  %31 = sext i16 %30 to i32, !dbg !1784
  store i32 %31, ptr %9, align 4, !dbg !1786
  %32 = load ptr, ptr %8, align 8, !dbg !1787
  %33 = getelementptr inbounds nuw %struct.ai_local, ptr %32, i32 0, i32 6, !dbg !1788
  %34 = load i32, ptr %33, align 4, !dbg !1788
  store i32 %34, ptr %10, align 4, !dbg !1789
  %35 = load i32, ptr %10, align 4, !dbg !1790
  %36 = icmp eq i32 %35, -1, !dbg !1792
  br i1 %36, label %37, label %38, !dbg !1792

37:                                               ; preds = %21
  br label %108, !dbg !1793

38:                                               ; preds = %21
  %39 = load ptr, ptr %4, align 8, !dbg !1795
  %40 = load i32, ptr %9, align 4, !dbg !1797
  %41 = load i32, ptr %10, align 4, !dbg !1798
  %42 = load ptr, ptr @Point_segs_free_ptr, align 8, !dbg !1799
  %43 = load ptr, ptr %7, align 8, !dbg !1800
  %44 = getelementptr inbounds nuw %struct.ai_static, ptr %43, i32 0, i32 4, !dbg !1801
  %45 = load i32, ptr %5, align 4, !dbg !1802
  %46 = load i32, ptr %6, align 4, !dbg !1803
  %47 = call noundef i32 @_Z18create_path_pointsP6objectiiP9point_segPsiiii(ptr noundef %39, i32 noundef %40, i32 noundef %41, ptr noundef %42, ptr noundef %44, i32 noundef %45, i32 noundef 1, i32 noundef %46, i32 noundef -1), !dbg !1804
  %48 = load ptr, ptr %4, align 8, !dbg !1805
  %49 = load ptr, ptr @Point_segs_free_ptr, align 8, !dbg !1806
  %50 = load ptr, ptr %7, align 8, !dbg !1807
  %51 = getelementptr inbounds nuw %struct.ai_static, ptr %50, i32 0, i32 4, !dbg !1808
  %52 = load i16, ptr %51, align 4, !dbg !1808
  %53 = sext i16 %52 to i32, !dbg !1807
  %54 = call noundef i32 @_Z11polish_pathP6objectP9point_segi(ptr noundef %48, ptr noundef %49, i32 noundef %53), !dbg !1809
  %55 = trunc i32 %54 to i16, !dbg !1809
  %56 = load ptr, ptr %7, align 8, !dbg !1810
  %57 = getelementptr inbounds nuw %struct.ai_static, ptr %56, i32 0, i32 4, !dbg !1811
  store i16 %55, ptr %57, align 4, !dbg !1812
  %58 = load ptr, ptr @Point_segs_free_ptr, align 8, !dbg !1813
  %59 = ptrtoint ptr %58 to i64, !dbg !1814
  %60 = sub i64 %59, ptrtoint (ptr @Point_segs to i64), !dbg !1814
  %61 = sdiv exact i64 %60, 16, !dbg !1814
  %62 = trunc i64 %61 to i16, !dbg !1813
  %63 = load ptr, ptr %7, align 8, !dbg !1815
  %64 = getelementptr inbounds nuw %struct.ai_static, ptr %63, i32 0, i32 3, !dbg !1816
  store i16 %62, ptr %64, align 2, !dbg !1817
  %65 = load ptr, ptr %7, align 8, !dbg !1818
  %66 = getelementptr inbounds nuw %struct.ai_static, ptr %65, i32 0, i32 5, !dbg !1819
  store i8 0, ptr %66, align 2, !dbg !1820
  %67 = load ptr, ptr %7, align 8, !dbg !1821
  %68 = getelementptr inbounds nuw %struct.ai_static, ptr %67, i32 0, i32 4, !dbg !1822
  %69 = load i16, ptr %68, align 4, !dbg !1822
  %70 = sext i16 %69 to i32, !dbg !1821
  %71 = load ptr, ptr @Point_segs_free_ptr, align 8, !dbg !1823
  %72 = sext i32 %70 to i64, !dbg !1823
  %73 = getelementptr inbounds %struct.point_seg, ptr %71, i64 %72, !dbg !1823
  store ptr %73, ptr @Point_segs_free_ptr, align 8, !dbg !1823
  %74 = load ptr, ptr @Point_segs_free_ptr, align 8, !dbg !1824
  %75 = ptrtoint ptr %74 to i64, !dbg !1826
  %76 = sub i64 %75, ptrtoint (ptr @Point_segs to i64), !dbg !1826
  %77 = sdiv exact i64 %76, 16, !dbg !1826
  %78 = add nsw i64 %77, 60, !dbg !1827
  %79 = icmp sgt i64 %78, 2500, !dbg !1828
  br i1 %79, label %80, label %81, !dbg !1828

80:                                               ; preds = %38
  call void @_Z18ai_reset_all_pathsv(), !dbg !1829
  br label %109, !dbg !1831

81:                                               ; preds = %38
  %82 = load ptr, ptr %7, align 8, !dbg !1832
  %83 = getelementptr inbounds nuw %struct.ai_static, ptr %82, i32 0, i32 1, !dbg !1833
  %84 = getelementptr inbounds [11 x i8], ptr %83, i64 0, i64 3, !dbg !1832
  store i8 1, ptr %84, align 1, !dbg !1834
  %85 = load ptr, ptr %8, align 8, !dbg !1835
  %86 = getelementptr inbounds nuw %struct.ai_local, ptr %85, i32 0, i32 3, !dbg !1836
  store i32 2, ptr %86, align 4, !dbg !1837
  %87 = load ptr, ptr %4, align 8, !dbg !1838
  %88 = ptrtoint ptr %87 to i64, !dbg !1840
  %89 = sub i64 %88, ptrtoint (ptr @Objects to i64), !dbg !1840
  %90 = sdiv exact i64 %89, 268, !dbg !1840
  %91 = icmp eq i64 %90, 28, !dbg !1841
  br i1 %91, label %92, label %105, !dbg !1842

92:                                               ; preds = %81
  %93 = load i32, ptr @GameTime, align 4, !dbg !1843
  %94 = icmp sgt i32 %93, 240000, !dbg !1844
  br i1 %94, label %95, label %105, !dbg !1845

95:                                               ; preds = %92
  %96 = load i32, ptr @GameTime, align 4, !dbg !1846
  %97 = icmp slt i32 %96, 270000, !dbg !1847
  br i1 %97, label %98, label %105, !dbg !1845

98:                                               ; preds = %95
  %99 = load ptr, ptr @__stderrp, align 8, !dbg !1848
  %100 = load ptr, ptr %8, align 8, !dbg !1849
  %101 = getelementptr inbounds nuw %struct.ai_local, ptr %100, i32 0, i32 0, !dbg !1850
  %102 = load i32, ptr %101, align 4, !dbg !1850
  %103 = load i32, ptr @GameTime, align 4, !dbg !1851
  %104 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %99, ptr noundef @.str.11, i32 noundef %102, i32 noundef %103) #7, !dbg !1852
  br label %105, !dbg !1852

105:                                              ; preds = %98, %95, %92, %81
  %106 = load ptr, ptr %8, align 8, !dbg !1853
  %107 = getelementptr inbounds nuw %struct.ai_local, ptr %106, i32 0, i32 0, !dbg !1854
  store i32 0, ptr %107, align 4, !dbg !1855
  br label %108

108:                                              ; preds = %105, %37
  call void @_Z29maybe_ai_path_garbage_collectv(), !dbg !1856
  br label %109, !dbg !1857

109:                                              ; preds = %108, %80
  ret void, !dbg !1857
}

; Function Attrs: nounwind
declare i32 @fprintf(ptr noundef, ptr noundef, ...) #6

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z29maybe_ai_path_garbage_collectv() #0 !dbg !1858 {
  %1 = load ptr, ptr @Point_segs_free_ptr, align 8, !dbg !1859
  %2 = ptrtoint ptr %1 to i64, !dbg !1861
  %3 = sub i64 %2, ptrtoint (ptr @Point_segs to i64), !dbg !1861
  %4 = sdiv exact i64 %3, 16, !dbg !1861
  %5 = icmp sgt i64 %4, 2470, !dbg !1862
  br i1 %5, label %6, label %19, !dbg !1862

6:                                                ; preds = %0
  %7 = load i32, ptr @Last_frame_garbage_collected, align 4, !dbg !1863
  %8 = add nsw i32 %7, 1, !dbg !1866
  %9 = load i32, ptr @FrameCount, align 4, !dbg !1867
  %10 = icmp sge i32 %8, %9, !dbg !1868
  br i1 %10, label %11, label %12, !dbg !1868

11:                                               ; preds = %6
  call void @_Z18ai_reset_all_pathsv(), !dbg !1869
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 1, ptr noundef @.str.25), !dbg !1871
  br label %18, !dbg !1872

12:                                               ; preds = %6
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 1, ptr noundef @.str.26), !dbg !1873
  call void @_Z23ai_path_garbage_collectv(), !dbg !1875
  %13 = load ptr, ptr @Point_segs_free_ptr, align 8, !dbg !1876
  %14 = ptrtoint ptr %13 to i64, !dbg !1876
  %15 = sub i64 %14, ptrtoint (ptr @Point_segs to i64), !dbg !1876
  %16 = sdiv exact i64 %15, 16, !dbg !1876
  %17 = sub nsw i64 2500, %16, !dbg !1876
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 1, ptr noundef @.str.27, i64 noundef %17, i32 noundef 2500), !dbg !1876
  br label %18

18:                                               ; preds = %12, %11
  br label %47, !dbg !1877

19:                                               ; preds = %0
  %20 = load ptr, ptr @Point_segs_free_ptr, align 8, !dbg !1878
  %21 = ptrtoint ptr %20 to i64, !dbg !1880
  %22 = sub i64 %21, ptrtoint (ptr @Point_segs to i64), !dbg !1880
  %23 = sdiv exact i64 %22, 16, !dbg !1880
  %24 = icmp sgt i64 %23, 1875, !dbg !1881
  br i1 %24, label %25, label %32, !dbg !1881

25:                                               ; preds = %19
  %26 = load i32, ptr @Last_frame_garbage_collected, align 4, !dbg !1882
  %27 = add nsw i32 %26, 16, !dbg !1885
  %28 = load i32, ptr @FrameCount, align 4, !dbg !1886
  %29 = icmp slt i32 %27, %28, !dbg !1887
  br i1 %29, label %30, label %31, !dbg !1887

30:                                               ; preds = %25
  call void @_Z23ai_path_garbage_collectv(), !dbg !1888
  br label %31, !dbg !1890

31:                                               ; preds = %30, %25
  br label %46, !dbg !1891

32:                                               ; preds = %19
  %33 = load ptr, ptr @Point_segs_free_ptr, align 8, !dbg !1892
  %34 = ptrtoint ptr %33 to i64, !dbg !1894
  %35 = sub i64 %34, ptrtoint (ptr @Point_segs to i64), !dbg !1894
  %36 = sdiv exact i64 %35, 16, !dbg !1894
  %37 = icmp sgt i64 %36, 1250, !dbg !1895
  br i1 %37, label %38, label %45, !dbg !1895

38:                                               ; preds = %32
  %39 = load i32, ptr @Last_frame_garbage_collected, align 4, !dbg !1896
  %40 = add nsw i32 %39, 256, !dbg !1899
  %41 = load i32, ptr @FrameCount, align 4, !dbg !1900
  %42 = icmp slt i32 %40, %41, !dbg !1901
  br i1 %42, label %43, label %44, !dbg !1901

43:                                               ; preds = %38
  call void @_Z23ai_path_garbage_collectv(), !dbg !1902
  br label %44, !dbg !1904

44:                                               ; preds = %43, %38
  br label %45, !dbg !1905

45:                                               ; preds = %44, %32
  br label %46

46:                                               ; preds = %45, %31
  br label %47

47:                                               ; preds = %46, %18
  ret void, !dbg !1906
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z22create_path_to_segmentP6objectiii(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 !dbg !1907 {
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
    #dbg_declare(ptr %5, !1910, !DIExpression(), !1911)
  store i32 %1, ptr %6, align 4
    #dbg_declare(ptr %6, !1912, !DIExpression(), !1913)
  store i32 %2, ptr %7, align 4
    #dbg_declare(ptr %7, !1914, !DIExpression(), !1915)
  store i32 %3, ptr %8, align 4
    #dbg_declare(ptr %8, !1916, !DIExpression(), !1917)
    #dbg_declare(ptr %9, !1918, !DIExpression(), !1919)
  %13 = load ptr, ptr %5, align 8, !dbg !1920
  %14 = getelementptr inbounds nuw %struct.object, ptr %13, i32 0, i32 22, !dbg !1921
  store ptr %14, ptr %9, align 8, !dbg !1919
    #dbg_declare(ptr %10, !1922, !DIExpression(), !1923)
  %15 = load ptr, ptr %5, align 8, !dbg !1924
  %16 = ptrtoint ptr %15 to i64, !dbg !1925
  %17 = sub i64 %16, ptrtoint (ptr @Objects to i64), !dbg !1925
  %18 = sdiv exact i64 %17, 268, !dbg !1925
  %19 = getelementptr inbounds [350 x %struct.ai_local], ptr @Ai_local_info, i64 0, i64 %18, !dbg !1926
  store ptr %19, ptr %10, align 8, !dbg !1923
    #dbg_declare(ptr %11, !1927, !DIExpression(), !1928)
    #dbg_declare(ptr %12, !1929, !DIExpression(), !1930)
  %20 = load i32, ptr %7, align 4, !dbg !1931
  %21 = icmp eq i32 %20, -1, !dbg !1933
  br i1 %21, label %22, label %23, !dbg !1933

22:                                               ; preds = %4
  store i32 10, ptr %7, align 4, !dbg !1934
  br label %23, !dbg !1935

23:                                               ; preds = %22, %4
  %24 = load i32, ptr @GameTime, align 4, !dbg !1936
  %25 = load ptr, ptr %10, align 8, !dbg !1937
  %26 = getelementptr inbounds nuw %struct.ai_local, ptr %25, i32 0, i32 11, !dbg !1938
  store i32 %24, ptr %26, align 4, !dbg !1939
  %27 = load i32, ptr %6, align 4, !dbg !1940
  %28 = load ptr, ptr %10, align 8, !dbg !1941
  %29 = getelementptr inbounds nuw %struct.ai_local, ptr %28, i32 0, i32 6, !dbg !1942
  store i32 %27, ptr %29, align 4, !dbg !1943
  %30 = load ptr, ptr %5, align 8, !dbg !1944
  %31 = getelementptr inbounds nuw %struct.object, ptr %30, i32 0, i32 9, !dbg !1945
  %32 = load i16, ptr %31, align 2, !dbg !1945
  %33 = sext i16 %32 to i32, !dbg !1944
  store i32 %33, ptr %11, align 4, !dbg !1946
  %34 = load ptr, ptr %10, align 8, !dbg !1947
  %35 = getelementptr inbounds nuw %struct.ai_local, ptr %34, i32 0, i32 6, !dbg !1948
  %36 = load i32, ptr %35, align 4, !dbg !1948
  store i32 %36, ptr %12, align 4, !dbg !1949
  %37 = load i32, ptr %12, align 4, !dbg !1950
  %38 = icmp eq i32 %37, -1, !dbg !1952
  br i1 %38, label %39, label %40, !dbg !1952

39:                                               ; preds = %23
  br label %98, !dbg !1953

40:                                               ; preds = %23
  %41 = load ptr, ptr %5, align 8, !dbg !1955
  %42 = load i32, ptr %11, align 4, !dbg !1957
  %43 = load i32, ptr %12, align 4, !dbg !1958
  %44 = load ptr, ptr @Point_segs_free_ptr, align 8, !dbg !1959
  %45 = load ptr, ptr %9, align 8, !dbg !1960
  %46 = getelementptr inbounds nuw %struct.ai_static, ptr %45, i32 0, i32 4, !dbg !1961
  %47 = load i32, ptr %7, align 4, !dbg !1962
  %48 = load i32, ptr %8, align 4, !dbg !1963
  %49 = call noundef i32 @_Z18create_path_pointsP6objectiiP9point_segPsiiii(ptr noundef %41, i32 noundef %42, i32 noundef %43, ptr noundef %44, ptr noundef %46, i32 noundef %47, i32 noundef 1, i32 noundef %48, i32 noundef -1), !dbg !1964
  %50 = load ptr, ptr @Point_segs_free_ptr, align 8, !dbg !1965
  %51 = ptrtoint ptr %50 to i64, !dbg !1966
  %52 = sub i64 %51, ptrtoint (ptr @Point_segs to i64), !dbg !1966
  %53 = sdiv exact i64 %52, 16, !dbg !1966
  %54 = trunc i64 %53 to i16, !dbg !1965
  %55 = load ptr, ptr %9, align 8, !dbg !1967
  %56 = getelementptr inbounds nuw %struct.ai_static, ptr %55, i32 0, i32 3, !dbg !1968
  store i16 %54, ptr %56, align 2, !dbg !1969
  %57 = load ptr, ptr %9, align 8, !dbg !1970
  %58 = getelementptr inbounds nuw %struct.ai_static, ptr %57, i32 0, i32 5, !dbg !1971
  store i8 0, ptr %58, align 2, !dbg !1972
  %59 = load ptr, ptr %9, align 8, !dbg !1973
  %60 = getelementptr inbounds nuw %struct.ai_static, ptr %59, i32 0, i32 4, !dbg !1974
  %61 = load i16, ptr %60, align 4, !dbg !1974
  %62 = sext i16 %61 to i32, !dbg !1973
  %63 = load ptr, ptr @Point_segs_free_ptr, align 8, !dbg !1975
  %64 = sext i32 %62 to i64, !dbg !1975
  %65 = getelementptr inbounds %struct.point_seg, ptr %63, i64 %64, !dbg !1975
  store ptr %65, ptr @Point_segs_free_ptr, align 8, !dbg !1975
  %66 = load ptr, ptr @Point_segs_free_ptr, align 8, !dbg !1976
  %67 = ptrtoint ptr %66 to i64, !dbg !1978
  %68 = sub i64 %67, ptrtoint (ptr @Point_segs to i64), !dbg !1978
  %69 = sdiv exact i64 %68, 16, !dbg !1978
  %70 = add nsw i64 %69, 60, !dbg !1979
  %71 = icmp sgt i64 %70, 2500, !dbg !1980
  br i1 %71, label %72, label %73, !dbg !1980

72:                                               ; preds = %40
  call void @_Z18ai_reset_all_pathsv(), !dbg !1981
  br label %99, !dbg !1983

73:                                               ; preds = %40
  %74 = load ptr, ptr %9, align 8, !dbg !1984
  %75 = getelementptr inbounds nuw %struct.ai_static, ptr %74, i32 0, i32 1, !dbg !1985
  %76 = getelementptr inbounds [11 x i8], ptr %75, i64 0, i64 3, !dbg !1984
  store i8 1, ptr %76, align 1, !dbg !1986
  %77 = load ptr, ptr %5, align 8, !dbg !1987
  %78 = ptrtoint ptr %77 to i64, !dbg !1989
  %79 = sub i64 %78, ptrtoint (ptr @Objects to i64), !dbg !1989
  %80 = sdiv exact i64 %79, 268, !dbg !1989
  %81 = icmp eq i64 %80, 28, !dbg !1990
  br i1 %81, label %82, label %95, !dbg !1991

82:                                               ; preds = %73
  %83 = load i32, ptr @GameTime, align 4, !dbg !1992
  %84 = icmp sgt i32 %83, 240000, !dbg !1993
  br i1 %84, label %85, label %95, !dbg !1994

85:                                               ; preds = %82
  %86 = load i32, ptr @GameTime, align 4, !dbg !1995
  %87 = icmp slt i32 %86, 270000, !dbg !1996
  br i1 %87, label %88, label %95, !dbg !1994

88:                                               ; preds = %85
  %89 = load ptr, ptr @__stderrp, align 8, !dbg !1997
  %90 = load ptr, ptr %10, align 8, !dbg !1998
  %91 = getelementptr inbounds nuw %struct.ai_local, ptr %90, i32 0, i32 0, !dbg !1999
  %92 = load i32, ptr %91, align 4, !dbg !1999
  %93 = load i32, ptr @GameTime, align 4, !dbg !2000
  %94 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %89, ptr noundef @.str.12, i32 noundef %92, i32 noundef %93) #7, !dbg !2001
  br label %95, !dbg !2001

95:                                               ; preds = %88, %85, %82, %73
  %96 = load ptr, ptr %10, align 8, !dbg !2002
  %97 = getelementptr inbounds nuw %struct.ai_local, ptr %96, i32 0, i32 0, !dbg !2003
  store i32 0, ptr %97, align 4, !dbg !2004
  br label %98

98:                                               ; preds = %95, %39
  call void @_Z29maybe_ai_path_garbage_collectv(), !dbg !2005
  br label %99, !dbg !2006

99:                                               ; preds = %98, %72
  ret void, !dbg !2006
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z22create_path_to_stationP6objecti(ptr noundef %0, i32 noundef %1) #0 !dbg !2007 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !2010, !DIExpression(), !2011)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !2012, !DIExpression(), !2013)
    #dbg_declare(ptr %5, !2014, !DIExpression(), !2015)
  %9 = load ptr, ptr %3, align 8, !dbg !2016
  %10 = getelementptr inbounds nuw %struct.object, ptr %9, i32 0, i32 22, !dbg !2017
  store ptr %10, ptr %5, align 8, !dbg !2015
    #dbg_declare(ptr %6, !2018, !DIExpression(), !2019)
  %11 = load ptr, ptr %3, align 8, !dbg !2020
  %12 = ptrtoint ptr %11 to i64, !dbg !2021
  %13 = sub i64 %12, ptrtoint (ptr @Objects to i64), !dbg !2021
  %14 = sdiv exact i64 %13, 268, !dbg !2021
  %15 = getelementptr inbounds [350 x %struct.ai_local], ptr @Ai_local_info, i64 0, i64 %14, !dbg !2022
  store ptr %15, ptr %6, align 8, !dbg !2019
    #dbg_declare(ptr %7, !2023, !DIExpression(), !2024)
    #dbg_declare(ptr %8, !2025, !DIExpression(), !2026)
  %16 = load i32, ptr %4, align 4, !dbg !2027
  %17 = icmp eq i32 %16, -1, !dbg !2029
  br i1 %17, label %18, label %19, !dbg !2029

18:                                               ; preds = %2
  store i32 10, ptr %4, align 4, !dbg !2030
  br label %19, !dbg !2031

19:                                               ; preds = %18, %2
  %20 = load i32, ptr @GameTime, align 4, !dbg !2032
  %21 = load ptr, ptr %6, align 8, !dbg !2033
  %22 = getelementptr inbounds nuw %struct.ai_local, ptr %21, i32 0, i32 11, !dbg !2034
  store i32 %20, ptr %22, align 4, !dbg !2035
  %23 = load ptr, ptr %3, align 8, !dbg !2036
  %24 = getelementptr inbounds nuw %struct.object, ptr %23, i32 0, i32 9, !dbg !2037
  %25 = load i16, ptr %24, align 2, !dbg !2037
  %26 = sext i16 %25 to i32, !dbg !2036
  store i32 %26, ptr %7, align 4, !dbg !2038
  %27 = load ptr, ptr %5, align 8, !dbg !2039
  %28 = getelementptr inbounds nuw %struct.ai_static, ptr %27, i32 0, i32 2, !dbg !2040
  %29 = load i16, ptr %28, align 4, !dbg !2040
  %30 = sext i16 %29 to i32, !dbg !2039
  store i32 %30, ptr %8, align 4, !dbg !2041
  %31 = load i32, ptr %8, align 4, !dbg !2042
  %32 = icmp eq i32 %31, -1, !dbg !2044
  br i1 %32, label %33, label %34, !dbg !2044

33:                                               ; preds = %19
  br label %103, !dbg !2045

34:                                               ; preds = %19
  %35 = load ptr, ptr %3, align 8, !dbg !2047
  %36 = load i32, ptr %7, align 4, !dbg !2049
  %37 = load i32, ptr %8, align 4, !dbg !2050
  %38 = load ptr, ptr @Point_segs_free_ptr, align 8, !dbg !2051
  %39 = load ptr, ptr %5, align 8, !dbg !2052
  %40 = getelementptr inbounds nuw %struct.ai_static, ptr %39, i32 0, i32 4, !dbg !2053
  %41 = load i32, ptr %4, align 4, !dbg !2054
  %42 = call noundef i32 @_Z18create_path_pointsP6objectiiP9point_segPsiiii(ptr noundef %35, i32 noundef %36, i32 noundef %37, ptr noundef %38, ptr noundef %40, i32 noundef %41, i32 noundef 1, i32 noundef 1, i32 noundef -1), !dbg !2055
  %43 = load ptr, ptr %3, align 8, !dbg !2056
  %44 = load ptr, ptr @Point_segs_free_ptr, align 8, !dbg !2057
  %45 = load ptr, ptr %5, align 8, !dbg !2058
  %46 = getelementptr inbounds nuw %struct.ai_static, ptr %45, i32 0, i32 4, !dbg !2059
  %47 = load i16, ptr %46, align 4, !dbg !2059
  %48 = sext i16 %47 to i32, !dbg !2058
  %49 = call noundef i32 @_Z11polish_pathP6objectP9point_segi(ptr noundef %43, ptr noundef %44, i32 noundef %48), !dbg !2060
  %50 = trunc i32 %49 to i16, !dbg !2060
  %51 = load ptr, ptr %5, align 8, !dbg !2061
  %52 = getelementptr inbounds nuw %struct.ai_static, ptr %51, i32 0, i32 4, !dbg !2062
  store i16 %50, ptr %52, align 4, !dbg !2063
  %53 = load ptr, ptr @Point_segs_free_ptr, align 8, !dbg !2064
  %54 = ptrtoint ptr %53 to i64, !dbg !2065
  %55 = sub i64 %54, ptrtoint (ptr @Point_segs to i64), !dbg !2065
  %56 = sdiv exact i64 %55, 16, !dbg !2065
  %57 = trunc i64 %56 to i16, !dbg !2064
  %58 = load ptr, ptr %5, align 8, !dbg !2066
  %59 = getelementptr inbounds nuw %struct.ai_static, ptr %58, i32 0, i32 3, !dbg !2067
  store i16 %57, ptr %59, align 2, !dbg !2068
  %60 = load ptr, ptr %5, align 8, !dbg !2069
  %61 = getelementptr inbounds nuw %struct.ai_static, ptr %60, i32 0, i32 5, !dbg !2070
  store i8 0, ptr %61, align 2, !dbg !2071
  %62 = load ptr, ptr %5, align 8, !dbg !2072
  %63 = getelementptr inbounds nuw %struct.ai_static, ptr %62, i32 0, i32 4, !dbg !2073
  %64 = load i16, ptr %63, align 4, !dbg !2073
  %65 = sext i16 %64 to i32, !dbg !2072
  %66 = load ptr, ptr @Point_segs_free_ptr, align 8, !dbg !2074
  %67 = sext i32 %65 to i64, !dbg !2074
  %68 = getelementptr inbounds %struct.point_seg, ptr %66, i64 %67, !dbg !2074
  store ptr %68, ptr @Point_segs_free_ptr, align 8, !dbg !2074
  %69 = load ptr, ptr @Point_segs_free_ptr, align 8, !dbg !2075
  %70 = ptrtoint ptr %69 to i64, !dbg !2077
  %71 = sub i64 %70, ptrtoint (ptr @Point_segs to i64), !dbg !2077
  %72 = sdiv exact i64 %71, 16, !dbg !2077
  %73 = add nsw i64 %72, 60, !dbg !2078
  %74 = icmp sgt i64 %73, 2500, !dbg !2079
  br i1 %74, label %75, label %76, !dbg !2079

75:                                               ; preds = %34
  call void @_Z18ai_reset_all_pathsv(), !dbg !2080
  br label %104, !dbg !2082

76:                                               ; preds = %34
  %77 = load ptr, ptr %5, align 8, !dbg !2083
  %78 = getelementptr inbounds nuw %struct.ai_static, ptr %77, i32 0, i32 1, !dbg !2084
  %79 = getelementptr inbounds [11 x i8], ptr %78, i64 0, i64 3, !dbg !2083
  store i8 1, ptr %79, align 1, !dbg !2085
  %80 = load ptr, ptr %6, align 8, !dbg !2086
  %81 = getelementptr inbounds nuw %struct.ai_local, ptr %80, i32 0, i32 3, !dbg !2087
  store i32 2, ptr %81, align 4, !dbg !2088
  %82 = load ptr, ptr %3, align 8, !dbg !2089
  %83 = ptrtoint ptr %82 to i64, !dbg !2091
  %84 = sub i64 %83, ptrtoint (ptr @Objects to i64), !dbg !2091
  %85 = sdiv exact i64 %84, 268, !dbg !2091
  %86 = icmp eq i64 %85, 28, !dbg !2092
  br i1 %86, label %87, label %100, !dbg !2093

87:                                               ; preds = %76
  %88 = load i32, ptr @GameTime, align 4, !dbg !2094
  %89 = icmp sgt i32 %88, 240000, !dbg !2095
  br i1 %89, label %90, label %100, !dbg !2096

90:                                               ; preds = %87
  %91 = load i32, ptr @GameTime, align 4, !dbg !2097
  %92 = icmp slt i32 %91, 270000, !dbg !2098
  br i1 %92, label %93, label %100, !dbg !2096

93:                                               ; preds = %90
  %94 = load ptr, ptr @__stderrp, align 8, !dbg !2099
  %95 = load ptr, ptr %6, align 8, !dbg !2100
  %96 = getelementptr inbounds nuw %struct.ai_local, ptr %95, i32 0, i32 0, !dbg !2101
  %97 = load i32, ptr %96, align 4, !dbg !2101
  %98 = load i32, ptr @GameTime, align 4, !dbg !2102
  %99 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %94, ptr noundef @.str.13, i32 noundef %97, i32 noundef %98) #7, !dbg !2103
  br label %100, !dbg !2103

100:                                              ; preds = %93, %90, %87, %76
  %101 = load ptr, ptr %6, align 8, !dbg !2104
  %102 = getelementptr inbounds nuw %struct.ai_local, ptr %101, i32 0, i32 0, !dbg !2105
  store i32 0, ptr %102, align 4, !dbg !2106
  br label %103

103:                                              ; preds = %100, %33
  call void @_Z29maybe_ai_path_garbage_collectv(), !dbg !2107
  br label %104, !dbg !2108

104:                                              ; preds = %103, %75
  ret void, !dbg !2108
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z21create_n_segment_pathP6objectii(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 !dbg !2109 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !2110, !DIExpression(), !2111)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !2112, !DIExpression(), !2113)
  store i32 %2, ptr %6, align 4
    #dbg_declare(ptr %6, !2114, !DIExpression(), !2115)
    #dbg_declare(ptr %7, !2116, !DIExpression(), !2117)
  %10 = load ptr, ptr %4, align 8, !dbg !2118
  %11 = getelementptr inbounds nuw %struct.object, ptr %10, i32 0, i32 22, !dbg !2119
  store ptr %11, ptr %7, align 8, !dbg !2117
    #dbg_declare(ptr %8, !2120, !DIExpression(), !2121)
  %12 = load ptr, ptr %4, align 8, !dbg !2122
  %13 = ptrtoint ptr %12 to i64, !dbg !2123
  %14 = sub i64 %13, ptrtoint (ptr @Objects to i64), !dbg !2123
  %15 = sdiv exact i64 %14, 268, !dbg !2123
  %16 = getelementptr inbounds [350 x %struct.ai_local], ptr @Ai_local_info, i64 0, i64 %15, !dbg !2124
  store ptr %16, ptr %8, align 8, !dbg !2121
  %17 = load ptr, ptr %4, align 8, !dbg !2125
  %18 = load ptr, ptr %4, align 8, !dbg !2127
  %19 = getelementptr inbounds nuw %struct.object, ptr %18, i32 0, i32 9, !dbg !2128
  %20 = load i16, ptr %19, align 2, !dbg !2128
  %21 = sext i16 %20 to i32, !dbg !2127
  %22 = load ptr, ptr @Point_segs_free_ptr, align 8, !dbg !2129
  %23 = load ptr, ptr %7, align 8, !dbg !2130
  %24 = getelementptr inbounds nuw %struct.ai_static, ptr %23, i32 0, i32 4, !dbg !2131
  %25 = load i32, ptr %5, align 4, !dbg !2132
  %26 = load i32, ptr %6, align 4, !dbg !2133
  %27 = call noundef i32 @_Z18create_path_pointsP6objectiiP9point_segPsiiii(ptr noundef %17, i32 noundef %21, i32 noundef -2, ptr noundef %22, ptr noundef %24, i32 noundef %25, i32 noundef 1, i32 noundef 0, i32 noundef %26), !dbg !2134
  %28 = icmp eq i32 %27, -1, !dbg !2135
  br i1 %28, label %29, label %53, !dbg !2135

29:                                               ; preds = %3
  %30 = load ptr, ptr %7, align 8, !dbg !2136
  %31 = getelementptr inbounds nuw %struct.ai_static, ptr %30, i32 0, i32 4, !dbg !2138
  %32 = load i16, ptr %31, align 4, !dbg !2138
  %33 = sext i16 %32 to i32, !dbg !2136
  %34 = load ptr, ptr @Point_segs_free_ptr, align 8, !dbg !2139
  %35 = sext i32 %33 to i64, !dbg !2139
  %36 = getelementptr inbounds %struct.point_seg, ptr %34, i64 %35, !dbg !2139
  store ptr %36, ptr @Point_segs_free_ptr, align 8, !dbg !2139
  br label %37, !dbg !2140

37:                                               ; preds = %50, %29
  %38 = load ptr, ptr %4, align 8, !dbg !2141
  %39 = load ptr, ptr %4, align 8, !dbg !2142
  %40 = getelementptr inbounds nuw %struct.object, ptr %39, i32 0, i32 9, !dbg !2143
  %41 = load i16, ptr %40, align 2, !dbg !2143
  %42 = sext i16 %41 to i32, !dbg !2142
  %43 = load ptr, ptr @Point_segs_free_ptr, align 8, !dbg !2144
  %44 = load ptr, ptr %7, align 8, !dbg !2145
  %45 = getelementptr inbounds nuw %struct.ai_static, ptr %44, i32 0, i32 4, !dbg !2146
  %46 = load i32, ptr %5, align 4, !dbg !2147
  %47 = add nsw i32 %46, -1, !dbg !2147
  store i32 %47, ptr %5, align 4, !dbg !2147
  %48 = call noundef i32 @_Z18create_path_pointsP6objectiiP9point_segPsiiii(ptr noundef %38, i32 noundef %42, i32 noundef -2, ptr noundef %43, ptr noundef %45, i32 noundef %47, i32 noundef 1, i32 noundef 0, i32 noundef -1), !dbg !2148
  %49 = icmp eq i32 %48, -1, !dbg !2149
  br i1 %49, label %50, label %52, !dbg !2140

50:                                               ; preds = %37
  %51 = load i32, ptr %5, align 4, !dbg !2150
  call void @_Z7_AssertiPKcS0_i(i32 noundef %51, ptr noundef @.str.14, ptr noundef @.str.1, i32 noundef 876), !dbg !2150
  br label %37, !dbg !2140, !llvm.loop !2152

52:                                               ; preds = %37
  br label %53, !dbg !2154

53:                                               ; preds = %52, %3
  %54 = load ptr, ptr @Point_segs_free_ptr, align 8, !dbg !2155
  %55 = ptrtoint ptr %54 to i64, !dbg !2156
  %56 = sub i64 %55, ptrtoint (ptr @Point_segs to i64), !dbg !2156
  %57 = sdiv exact i64 %56, 16, !dbg !2156
  %58 = trunc i64 %57 to i16, !dbg !2155
  %59 = load ptr, ptr %7, align 8, !dbg !2157
  %60 = getelementptr inbounds nuw %struct.ai_static, ptr %59, i32 0, i32 3, !dbg !2158
  store i16 %58, ptr %60, align 2, !dbg !2159
  %61 = load ptr, ptr %7, align 8, !dbg !2160
  %62 = getelementptr inbounds nuw %struct.ai_static, ptr %61, i32 0, i32 5, !dbg !2161
  store i8 0, ptr %62, align 2, !dbg !2162
  %63 = load ptr, ptr %7, align 8, !dbg !2163
  %64 = getelementptr inbounds nuw %struct.ai_static, ptr %63, i32 0, i32 4, !dbg !2164
  %65 = load i16, ptr %64, align 4, !dbg !2164
  %66 = sext i16 %65 to i32, !dbg !2163
  %67 = load ptr, ptr @Point_segs_free_ptr, align 8, !dbg !2165
  %68 = sext i32 %66 to i64, !dbg !2165
  %69 = getelementptr inbounds %struct.point_seg, ptr %67, i64 %68, !dbg !2165
  store ptr %69, ptr @Point_segs_free_ptr, align 8, !dbg !2165
  %70 = load ptr, ptr @Point_segs_free_ptr, align 8, !dbg !2166
  %71 = ptrtoint ptr %70 to i64, !dbg !2168
  %72 = sub i64 %71, ptrtoint (ptr @Point_segs to i64), !dbg !2168
  %73 = sdiv exact i64 %72, 16, !dbg !2168
  %74 = add nsw i64 %73, 60, !dbg !2169
  %75 = icmp sgt i64 %74, 2500, !dbg !2170
  br i1 %75, label %76, label %77, !dbg !2170

76:                                               ; preds = %53
  call void @_Z18ai_reset_all_pathsv(), !dbg !2171
  br label %77, !dbg !2173

77:                                               ; preds = %76, %53
  %78 = load ptr, ptr %7, align 8, !dbg !2174
  %79 = getelementptr inbounds nuw %struct.ai_static, ptr %78, i32 0, i32 1, !dbg !2175
  %80 = getelementptr inbounds [11 x i8], ptr %79, i64 0, i64 3, !dbg !2174
  store i8 1, ptr %80, align 1, !dbg !2176
  %81 = load ptr, ptr %8, align 8, !dbg !2177
  %82 = getelementptr inbounds nuw %struct.ai_local, ptr %81, i32 0, i32 3, !dbg !2178
  store i32 2, ptr %82, align 4, !dbg !2179
  %83 = load ptr, ptr %4, align 8, !dbg !2180
  %84 = ptrtoint ptr %83 to i64, !dbg !2182
  %85 = sub i64 %84, ptrtoint (ptr @Objects to i64), !dbg !2182
  %86 = sdiv exact i64 %85, 268, !dbg !2182
  %87 = getelementptr inbounds [350 x %struct.ai_local], ptr @Ai_local_info, i64 0, i64 %86, !dbg !2183
  %88 = getelementptr inbounds nuw %struct.ai_local, ptr %87, i32 0, i32 4, !dbg !2184
  %89 = load i32, ptr %88, align 4, !dbg !2184
  %90 = icmp ne i32 %89, 0, !dbg !2183
  br i1 %90, label %91, label %112, !dbg !2183

91:                                               ; preds = %77
  %92 = load ptr, ptr %7, align 8, !dbg !2185
  %93 = getelementptr inbounds nuw %struct.ai_static, ptr %92, i32 0, i32 4, !dbg !2188
  %94 = load i16, ptr %93, align 4, !dbg !2188
  %95 = icmp ne i16 %94, 0, !dbg !2185
  br i1 %95, label %96, label %111, !dbg !2185

96:                                               ; preds = %91
    #dbg_declare(ptr %9, !2189, !DIExpression(), !2191)
  %97 = load ptr, ptr %7, align 8, !dbg !2192
  %98 = getelementptr inbounds nuw %struct.ai_static, ptr %97, i32 0, i32 4, !dbg !2193
  %99 = load i16, ptr %98, align 4, !dbg !2193
  %100 = sext i16 %99 to i32, !dbg !2192
  store i32 %100, ptr %9, align 4, !dbg !2191
  %101 = load ptr, ptr %7, align 8, !dbg !2194
  %102 = getelementptr inbounds nuw %struct.ai_static, ptr %101, i32 0, i32 3, !dbg !2195
  %103 = load i16, ptr %102, align 2, !dbg !2195
  %104 = sext i16 %103 to i64, !dbg !2196
  %105 = getelementptr inbounds [2500 x %struct.point_seg], ptr @Point_segs, i64 0, i64 %104, !dbg !2196
  %106 = load ptr, ptr %4, align 8, !dbg !2197
  call void @_Z20move_towards_outsideP9point_segPiP6objecti(ptr noundef %105, ptr noundef %9, ptr noundef %106, i32 noundef 1), !dbg !2198
  %107 = load i32, ptr %9, align 4, !dbg !2199
  %108 = trunc i32 %107 to i16, !dbg !2199
  %109 = load ptr, ptr %7, align 8, !dbg !2200
  %110 = getelementptr inbounds nuw %struct.ai_static, ptr %109, i32 0, i32 4, !dbg !2201
  store i16 %108, ptr %110, align 4, !dbg !2202
  br label %111, !dbg !2203

111:                                              ; preds = %96, %91
  br label %112, !dbg !2204

112:                                              ; preds = %111, %77
  call void @_Z29maybe_ai_path_garbage_collectv(), !dbg !2205
  ret void, !dbg !2206
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z29create_n_segment_path_to_doorP6objectii(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 !dbg !2207 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !2208, !DIExpression(), !2209)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !2210, !DIExpression(), !2211)
  store i32 %2, ptr %6, align 4
    #dbg_declare(ptr %6, !2212, !DIExpression(), !2213)
  %7 = load ptr, ptr %4, align 8, !dbg !2214
  %8 = load i32, ptr %5, align 4, !dbg !2215
  %9 = load i32, ptr %6, align 4, !dbg !2216
  call void @_Z21create_n_segment_pathP6objectii(ptr noundef %7, i32 noundef %8, i32 noundef %9), !dbg !2217
  ret void, !dbg !2218
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z19move_object_to_goalP6objectP10vms_vectori(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 !dbg !2219 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !2222, !DIExpression(), !2223)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !2224, !DIExpression(), !2225)
  store i32 %2, ptr %6, align 4
    #dbg_declare(ptr %6, !2226, !DIExpression(), !2227)
    #dbg_declare(ptr %7, !2228, !DIExpression(), !2229)
  %11 = load ptr, ptr %4, align 8, !dbg !2230
  %12 = getelementptr inbounds nuw %struct.object, ptr %11, i32 0, i32 22, !dbg !2231
  store ptr %12, ptr %7, align 8, !dbg !2229
    #dbg_declare(ptr %8, !2232, !DIExpression(), !2233)
  %13 = load ptr, ptr %7, align 8, !dbg !2234
  %14 = getelementptr inbounds nuw %struct.ai_static, ptr %13, i32 0, i32 4, !dbg !2236
  %15 = load i16, ptr %14, align 4, !dbg !2236
  %16 = sext i16 %15 to i32, !dbg !2234
  %17 = icmp slt i32 %16, 2, !dbg !2237
  br i1 %17, label %18, label %19, !dbg !2237

18:                                               ; preds = %3
  br label %190, !dbg !2238

19:                                               ; preds = %3
  %20 = load ptr, ptr %4, align 8, !dbg !2239
  %21 = getelementptr inbounds nuw %struct.object, ptr %20, i32 0, i32 9, !dbg !2239
  %22 = load i16, ptr %21, align 2, !dbg !2239
  %23 = sext i16 %22 to i32, !dbg !2239
  %24 = icmp ne i32 %23, -1, !dbg !2239
  %25 = zext i1 %24 to i32, !dbg !2239
  call void @_Z7_AssertiPKcS0_i(i32 noundef %25, ptr noundef @.str.15, ptr noundef @.str.1, i32 noundef 930), !dbg !2239
  %26 = load ptr, ptr %4, align 8, !dbg !2240
  %27 = getelementptr inbounds nuw %struct.object, ptr %26, i32 0, i32 9, !dbg !2242
  %28 = load i16, ptr %27, align 2, !dbg !2242
  %29 = sext i16 %28 to i32, !dbg !2240
  %30 = load i32, ptr %6, align 4, !dbg !2243
  %31 = icmp ne i32 %29, %30, !dbg !2244
  br i1 %31, label %32, label %66, !dbg !2244

32:                                               ; preds = %19
  %33 = load ptr, ptr %4, align 8, !dbg !2245
  %34 = getelementptr inbounds nuw %struct.object, ptr %33, i32 0, i32 9, !dbg !2247
  %35 = load i16, ptr %34, align 2, !dbg !2247
  %36 = sext i16 %35 to i64, !dbg !2248
  %37 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %36, !dbg !2248
  %38 = load i32, ptr %6, align 4, !dbg !2249
  %39 = sext i32 %38 to i64, !dbg !2250
  %40 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %39, !dbg !2250
  %41 = call noundef i32 @_Z17find_connect_sideP7segmentS0_(ptr noundef %37, ptr noundef %40), !dbg !2251
  %42 = icmp eq i32 %41, -1, !dbg !2252
  br i1 %42, label %43, label %65, !dbg !2252

43:                                               ; preds = %32
    #dbg_declare(ptr %9, !2253, !DIExpression(), !2255)
  %44 = load ptr, ptr %4, align 8, !dbg !2256
  %45 = getelementptr inbounds nuw %struct.object, ptr %44, i32 0, i32 11, !dbg !2257
  %46 = load ptr, ptr %4, align 8, !dbg !2258
  %47 = getelementptr inbounds nuw %struct.object, ptr %46, i32 0, i32 9, !dbg !2259
  %48 = load i16, ptr %47, align 2, !dbg !2259
  %49 = sext i16 %48 to i32, !dbg !2258
  %50 = load ptr, ptr %5, align 8, !dbg !2260
  %51 = load i32, ptr %6, align 4, !dbg !2261
  %52 = call noundef i32 @_Z23find_connected_distanceP10vms_vectoriS0_iii(ptr noundef %45, i32 noundef %49, ptr noundef %50, i32 noundef %51, i32 noundef 30, i32 noundef 1), !dbg !2262
  store i32 %52, ptr %9, align 4, !dbg !2263
  %53 = load i32, ptr @Connected_segment_distance, align 4, !dbg !2264
  %54 = icmp sgt i32 %53, 2, !dbg !2266
  br i1 %54, label %55, label %64, !dbg !2266

55:                                               ; preds = %43
  %56 = load ptr, ptr %4, align 8, !dbg !2267
  %57 = ptrtoint ptr %56 to i64, !dbg !2267
  %58 = sub i64 %57, ptrtoint (ptr @Objects to i64), !dbg !2267
  %59 = sdiv exact i64 %58, 268, !dbg !2267
  %60 = load i32, ptr @Connected_segment_distance, align 4, !dbg !2267
  %61 = load i32, ptr %9, align 4, !dbg !2267
  %62 = call noundef float @_Z4f2fli(i32 noundef %61), !dbg !2267
  %63 = fpext float %62 to double, !dbg !2267
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 1, ptr noundef @.str.16, i64 noundef %59, i32 noundef %60, double noundef %63), !dbg !2267
  br label %64, !dbg !2269

64:                                               ; preds = %55, %43
  br label %65, !dbg !2270

65:                                               ; preds = %64, %32
  br label %66, !dbg !2271

66:                                               ; preds = %65, %19
  %67 = load ptr, ptr %7, align 8, !dbg !2272
  %68 = getelementptr inbounds nuw %struct.ai_static, ptr %67, i32 0, i32 4, !dbg !2272
  %69 = load i16, ptr %68, align 4, !dbg !2272
  %70 = sext i16 %69 to i32, !dbg !2272
  %71 = icmp sge i32 %70, 2, !dbg !2272
  %72 = zext i1 %71 to i32, !dbg !2272
  call void @_Z7_AssertiPKcS0_i(i32 noundef %72, ptr noundef @.str.17, ptr noundef @.str.1, i32 noundef 946), !dbg !2272
  %73 = load ptr, ptr %7, align 8, !dbg !2273
  %74 = getelementptr inbounds nuw %struct.ai_static, ptr %73, i32 0, i32 5, !dbg !2275
  %75 = load i8, ptr %74, align 2, !dbg !2275
  %76 = sext i8 %75 to i32, !dbg !2273
  %77 = icmp sle i32 %76, 0, !dbg !2276
  br i1 %77, label %78, label %92, !dbg !2276

78:                                               ; preds = %66
  %79 = load ptr, ptr %7, align 8, !dbg !2277
  %80 = getelementptr inbounds nuw %struct.ai_static, ptr %79, i32 0, i32 0, !dbg !2280
  %81 = load i8, ptr %80, align 4, !dbg !2280
  %82 = zext i8 %81 to i32, !dbg !2277
  %83 = icmp eq i32 %82, 133, !dbg !2281
  br i1 %83, label %84, label %86, !dbg !2281

84:                                               ; preds = %78
  %85 = load ptr, ptr %4, align 8, !dbg !2282
  call void @_Z22create_path_to_stationP6objecti(ptr noundef %85, i32 noundef 15), !dbg !2284
  br label %190, !dbg !2285

86:                                               ; preds = %78
  %87 = load ptr, ptr %7, align 8, !dbg !2286
  %88 = getelementptr inbounds nuw %struct.ai_static, ptr %87, i32 0, i32 5, !dbg !2287
  store i8 1, ptr %88, align 2, !dbg !2288
  %89 = load ptr, ptr %7, align 8, !dbg !2289
  %90 = getelementptr inbounds nuw %struct.ai_static, ptr %89, i32 0, i32 1, !dbg !2290
  %91 = getelementptr inbounds [11 x i8], ptr %90, i64 0, i64 3, !dbg !2289
  store i8 1, ptr %91, align 1, !dbg !2291
  br label %156, !dbg !2292

92:                                               ; preds = %66
  %93 = load ptr, ptr %7, align 8, !dbg !2293
  %94 = getelementptr inbounds nuw %struct.ai_static, ptr %93, i32 0, i32 5, !dbg !2295
  %95 = load i8, ptr %94, align 2, !dbg !2295
  %96 = sext i8 %95 to i32, !dbg !2293
  %97 = load ptr, ptr %7, align 8, !dbg !2296
  %98 = getelementptr inbounds nuw %struct.ai_static, ptr %97, i32 0, i32 4, !dbg !2297
  %99 = load i16, ptr %98, align 4, !dbg !2297
  %100 = sext i16 %99 to i32, !dbg !2296
  %101 = sub nsw i32 %100, 1, !dbg !2298
  %102 = icmp sge i32 %96, %101, !dbg !2299
  br i1 %102, label %103, label %143, !dbg !2299

103:                                              ; preds = %92
  %104 = load ptr, ptr %7, align 8, !dbg !2300
  %105 = getelementptr inbounds nuw %struct.ai_static, ptr %104, i32 0, i32 0, !dbg !2303
  %106 = load i8, ptr %105, align 4, !dbg !2303
  %107 = zext i8 %106 to i32, !dbg !2300
  %108 = icmp eq i32 %107, 133, !dbg !2304
  br i1 %108, label %109, label %125, !dbg !2304

109:                                              ; preds = %103
  %110 = load ptr, ptr %4, align 8, !dbg !2305
  call void @_Z22create_path_to_stationP6objecti(ptr noundef %110, i32 noundef 15), !dbg !2307
  %111 = load ptr, ptr %7, align 8, !dbg !2308
  %112 = getelementptr inbounds nuw %struct.ai_static, ptr %111, i32 0, i32 4, !dbg !2310
  %113 = load i16, ptr %112, align 4, !dbg !2310
  %114 = sext i16 %113 to i32, !dbg !2308
  %115 = icmp eq i32 %114, 0, !dbg !2311
  br i1 %115, label %116, label %124, !dbg !2311

116:                                              ; preds = %109
    #dbg_declare(ptr %10, !2312, !DIExpression(), !2314)
  %117 = load ptr, ptr %4, align 8, !dbg !2315
  %118 = ptrtoint ptr %117 to i64, !dbg !2316
  %119 = sub i64 %118, ptrtoint (ptr @Objects to i64), !dbg !2316
  %120 = sdiv exact i64 %119, 268, !dbg !2316
  %121 = getelementptr inbounds [350 x %struct.ai_local], ptr @Ai_local_info, i64 0, i64 %120, !dbg !2317
  store ptr %121, ptr %10, align 8, !dbg !2314
  %122 = load ptr, ptr %10, align 8, !dbg !2318
  %123 = getelementptr inbounds nuw %struct.ai_local, ptr %122, i32 0, i32 3, !dbg !2319
  store i32 0, ptr %123, align 4, !dbg !2320
  br label %124, !dbg !2321

124:                                              ; preds = %116, %109
  br label %190, !dbg !2322

125:                                              ; preds = %103
  %126 = load ptr, ptr %7, align 8, !dbg !2323
  %127 = getelementptr inbounds nuw %struct.ai_static, ptr %126, i32 0, i32 4, !dbg !2323
  %128 = load i16, ptr %127, align 4, !dbg !2323
  %129 = sext i16 %128 to i32, !dbg !2323
  %130 = icmp ne i32 %129, 0, !dbg !2323
  %131 = zext i1 %130 to i32, !dbg !2323
  call void @_Z7_AssertiPKcS0_i(i32 noundef %131, ptr noundef @.str.18, ptr noundef @.str.1, i32 noundef 966), !dbg !2323
  %132 = load ptr, ptr %7, align 8, !dbg !2324
  %133 = getelementptr inbounds nuw %struct.ai_static, ptr %132, i32 0, i32 4, !dbg !2325
  %134 = load i16, ptr %133, align 4, !dbg !2325
  %135 = sext i16 %134 to i32, !dbg !2324
  %136 = sub nsw i32 %135, 2, !dbg !2326
  %137 = trunc i32 %136 to i8, !dbg !2324
  %138 = load ptr, ptr %7, align 8, !dbg !2327
  %139 = getelementptr inbounds nuw %struct.ai_static, ptr %138, i32 0, i32 5, !dbg !2328
  store i8 %137, ptr %139, align 2, !dbg !2329
  %140 = load ptr, ptr %7, align 8, !dbg !2330
  %141 = getelementptr inbounds nuw %struct.ai_static, ptr %140, i32 0, i32 1, !dbg !2331
  %142 = getelementptr inbounds [11 x i8], ptr %141, i64 0, i64 3, !dbg !2330
  store i8 -1, ptr %142, align 1, !dbg !2332
  br label %155, !dbg !2333

143:                                              ; preds = %92
  %144 = load ptr, ptr %7, align 8, !dbg !2334
  %145 = getelementptr inbounds nuw %struct.ai_static, ptr %144, i32 0, i32 1, !dbg !2335
  %146 = getelementptr inbounds [11 x i8], ptr %145, i64 0, i64 3, !dbg !2334
  %147 = load i8, ptr %146, align 1, !dbg !2334
  %148 = sext i8 %147 to i32, !dbg !2334
  %149 = load ptr, ptr %7, align 8, !dbg !2336
  %150 = getelementptr inbounds nuw %struct.ai_static, ptr %149, i32 0, i32 5, !dbg !2337
  %151 = load i8, ptr %150, align 2, !dbg !2338
  %152 = sext i8 %151 to i32, !dbg !2338
  %153 = add nsw i32 %152, %148, !dbg !2338
  %154 = trunc i32 %153 to i8, !dbg !2338
  store i8 %154, ptr %150, align 2, !dbg !2338
  br label %155

155:                                              ; preds = %143, %125
  br label %156

156:                                              ; preds = %155, %86
  %157 = load ptr, ptr %5, align 8, !dbg !2339
  %158 = load ptr, ptr %4, align 8, !dbg !2340
  %159 = getelementptr inbounds nuw %struct.object, ptr %158, i32 0, i32 11, !dbg !2341
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %159, ptr align 4 %157, i64 12, i1 false), !dbg !2342
  %160 = load ptr, ptr %4, align 8, !dbg !2343
  %161 = call noundef i32 @_Z15find_object_segP6object(ptr noundef %160), !dbg !2344
  store i32 %161, ptr %8, align 4, !dbg !2345
  %162 = load i32, ptr %8, align 4, !dbg !2346
  %163 = load i32, ptr %6, align 4, !dbg !2348
  %164 = icmp ne i32 %162, %163, !dbg !2349
  br i1 %164, label %165, label %172, !dbg !2349

165:                                              ; preds = %156
  %166 = load ptr, ptr %4, align 8, !dbg !2350
  %167 = ptrtoint ptr %166 to i64, !dbg !2350
  %168 = sub i64 %167, ptrtoint (ptr @Objects to i64), !dbg !2350
  %169 = sdiv exact i64 %168, 268, !dbg !2350
  %170 = load i32, ptr %6, align 4, !dbg !2350
  %171 = load i32, ptr %8, align 4, !dbg !2350
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 1, ptr noundef @.str.19, i64 noundef %169, i32 noundef %170, i32 noundef %171), !dbg !2350
  br label %172, !dbg !2350

172:                                              ; preds = %165, %156
  %173 = load i32, ptr %8, align 4, !dbg !2351
  %174 = icmp eq i32 %173, -1, !dbg !2353
  br i1 %174, label %175, label %183, !dbg !2353

175:                                              ; preds = %172
  call void @_Z4Int3v(), !dbg !2354
  %176 = load ptr, ptr %4, align 8, !dbg !2356
  %177 = getelementptr inbounds nuw %struct.object, ptr %176, i32 0, i32 11, !dbg !2357
  %178 = load ptr, ptr %4, align 8, !dbg !2358
  %179 = getelementptr inbounds nuw %struct.object, ptr %178, i32 0, i32 9, !dbg !2359
  %180 = load i16, ptr %179, align 2, !dbg !2359
  %181 = sext i16 %180 to i64, !dbg !2360
  %182 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %181, !dbg !2360
  call void @_Z22compute_segment_centerP10vms_vectorP7segment(ptr noundef %177, ptr noundef %182), !dbg !2361
  br label %190, !dbg !2362

183:                                              ; preds = %172
  %184 = load ptr, ptr %4, align 8, !dbg !2363
  %185 = ptrtoint ptr %184 to i64, !dbg !2364
  %186 = sub i64 %185, ptrtoint (ptr @Objects to i64), !dbg !2364
  %187 = sdiv exact i64 %186, 268, !dbg !2364
  %188 = trunc i64 %187 to i32, !dbg !2363
  %189 = load i32, ptr %8, align 4, !dbg !2365
  call void @_Z10obj_relinkii(i32 noundef %188, i32 noundef %189), !dbg !2366
  br label %190

190:                                              ; preds = %18, %84, %124, %183, %175
  ret void, !dbg !2367
}

declare noundef i32 @_Z23find_connected_distanceP10vms_vectoriS0_iii(ptr noundef, i32 noundef, ptr noundef, i32 noundef, i32 noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef float @_Z4f2fli(i32 noundef %0) #3 !dbg !2368 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !2372, !DIExpression(), !2373)
  %3 = load i32, ptr %2, align 4, !dbg !2374
  %4 = sitofp i32 %3 to float, !dbg !2374
  %5 = fdiv float %4, 6.553600e+04, !dbg !2375
  ret float %5, !dbg !2376
}

declare noundef i32 @_Z15find_object_segP6object(ptr noundef) #1

declare void @_Z10obj_relinkii(i32 noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z14ai_follow_pathP6objectiiP10vms_vector(ptr noundef %0, i32 noundef %1, i32 noundef %2, ptr noundef %3) #0 !dbg !2377 {
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca %struct.vms_vector, align 4
  %11 = alloca %struct.vms_vector, align 4
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca ptr, align 8
  %20 = alloca i32, align 4
  %21 = alloca ptr, align 8
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca ptr, align 8
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca ptr, align 8
  %32 = alloca %struct.fvi_info, align 4
  %33 = alloca i32, align 4
  %34 = alloca %struct.fvi_query, align 8
  store ptr %0, ptr %5, align 8
    #dbg_declare(ptr %5, !2380, !DIExpression(), !2381)
  store i32 %1, ptr %6, align 4
    #dbg_declare(ptr %6, !2382, !DIExpression(), !2383)
  store i32 %2, ptr %7, align 4
    #dbg_declare(ptr %7, !2384, !DIExpression(), !2385)
  store ptr %3, ptr %8, align 8
    #dbg_declare(ptr %8, !2386, !DIExpression(), !2387)
    #dbg_declare(ptr %9, !2388, !DIExpression(), !2389)
  %35 = load ptr, ptr %5, align 8, !dbg !2390
  %36 = getelementptr inbounds nuw %struct.object, ptr %35, i32 0, i32 22, !dbg !2391
  store ptr %36, ptr %9, align 8, !dbg !2389
    #dbg_declare(ptr %10, !2392, !DIExpression(), !2393)
    #dbg_declare(ptr %11, !2394, !DIExpression(), !2395)
    #dbg_declare(ptr %12, !2396, !DIExpression(), !2397)
    #dbg_declare(ptr %13, !2398, !DIExpression(), !2473)
  %37 = load ptr, ptr %5, align 8, !dbg !2474
  %38 = getelementptr inbounds nuw %struct.object, ptr %37, i32 0, i32 2, !dbg !2475
  %39 = load i8, ptr %38, align 1, !dbg !2475
  %40 = zext i8 %39 to i64, !dbg !2476
  %41 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %40, !dbg !2476
  store ptr %41, ptr %13, align 8, !dbg !2473
    #dbg_declare(ptr %14, !2477, !DIExpression(), !2478)
    #dbg_declare(ptr %15, !2479, !DIExpression(), !2480)
    #dbg_declare(ptr %16, !2481, !DIExpression(), !2482)
    #dbg_declare(ptr %17, !2483, !DIExpression(), !2484)
    #dbg_declare(ptr %18, !2485, !DIExpression(), !2486)
    #dbg_declare(ptr %19, !2487, !DIExpression(), !2488)
  %42 = load ptr, ptr %5, align 8, !dbg !2489
  %43 = ptrtoint ptr %42 to i64, !dbg !2490
  %44 = sub i64 %43, ptrtoint (ptr @Objects to i64), !dbg !2490
  %45 = sdiv exact i64 %44, 268, !dbg !2490
  %46 = getelementptr inbounds [350 x %struct.ai_local], ptr @Ai_local_info, i64 0, i64 %45, !dbg !2491
  store ptr %46, ptr %19, align 8, !dbg !2488
    #dbg_declare(ptr %20, !2492, !DIExpression(), !2493)
  %47 = load ptr, ptr %9, align 8, !dbg !2494
  %48 = getelementptr inbounds nuw %struct.ai_static, ptr %47, i32 0, i32 3, !dbg !2496
  %49 = load i16, ptr %48, align 2, !dbg !2496
  %50 = sext i16 %49 to i32, !dbg !2494
  %51 = icmp eq i32 %50, -1, !dbg !2497
  br i1 %51, label %58, label %52, !dbg !2498

52:                                               ; preds = %4
  %53 = load ptr, ptr %9, align 8, !dbg !2499
  %54 = getelementptr inbounds nuw %struct.ai_static, ptr %53, i32 0, i32 4, !dbg !2500
  %55 = load i16, ptr %54, align 4, !dbg !2500
  %56 = sext i16 %55 to i32, !dbg !2499
  %57 = icmp eq i32 %56, 0, !dbg !2501
  br i1 %57, label %58, label %70, !dbg !2498

58:                                               ; preds = %52, %4
  %59 = load ptr, ptr %19, align 8, !dbg !2502
  %60 = getelementptr inbounds nuw %struct.ai_local, ptr %59, i32 0, i32 3, !dbg !2504
  %61 = load i32, ptr %60, align 4, !dbg !2504
  %62 = icmp eq i32 %61, 4, !dbg !2505
  br i1 %62, label %63, label %67, !dbg !2505

63:                                               ; preds = %58
  %64 = load ptr, ptr %5, align 8, !dbg !2506
  call void @_Z21create_n_segment_pathP6objectii(ptr noundef %64, i32 noundef 5, i32 noundef -1), !dbg !2508
  %65 = load ptr, ptr %19, align 8, !dbg !2509
  %66 = getelementptr inbounds nuw %struct.ai_local, ptr %65, i32 0, i32 3, !dbg !2510
  store i32 4, ptr %66, align 4, !dbg !2511
  br label %69, !dbg !2512

67:                                               ; preds = %58
  %68 = load ptr, ptr %5, align 8, !dbg !2513
  call void @_Z21create_n_segment_pathP6objectii(ptr noundef %68, i32 noundef 5, i32 noundef -1), !dbg !2515
  br label %69

69:                                               ; preds = %67, %63
  br label %70, !dbg !2516

70:                                               ; preds = %69, %52
  %71 = load ptr, ptr %9, align 8, !dbg !2517
  %72 = getelementptr inbounds nuw %struct.ai_static, ptr %71, i32 0, i32 3, !dbg !2519
  %73 = load i16, ptr %72, align 2, !dbg !2519
  %74 = sext i16 %73 to i32, !dbg !2517
  %75 = load ptr, ptr %9, align 8, !dbg !2520
  %76 = getelementptr inbounds nuw %struct.ai_static, ptr %75, i32 0, i32 4, !dbg !2521
  %77 = load i16, ptr %76, align 4, !dbg !2521
  %78 = sext i16 %77 to i32, !dbg !2520
  %79 = add nsw i32 %74, %78, !dbg !2522
  %80 = sext i32 %79 to i64, !dbg !2517
  %81 = load ptr, ptr @Point_segs_free_ptr, align 8, !dbg !2523
  %82 = ptrtoint ptr %81 to i64, !dbg !2524
  %83 = sub i64 %82, ptrtoint (ptr @Point_segs to i64), !dbg !2524
  %84 = sdiv exact i64 %83, 16, !dbg !2524
  %85 = icmp sgt i64 %80, %84, !dbg !2525
  br i1 %85, label %86, label %93, !dbg !2526

86:                                               ; preds = %70
  %87 = load ptr, ptr %9, align 8, !dbg !2527
  %88 = getelementptr inbounds nuw %struct.ai_static, ptr %87, i32 0, i32 4, !dbg !2528
  %89 = load i16, ptr %88, align 4, !dbg !2528
  %90 = sext i16 %89 to i32, !dbg !2527
  %91 = icmp sgt i32 %90, 0, !dbg !2529
  br i1 %91, label %92, label %93, !dbg !2526

92:                                               ; preds = %86
  call void @_Z4Int3v(), !dbg !2530
  call void @_Z23ai_path_garbage_collectv(), !dbg !2532
  call void @_Z18ai_reset_all_pathsv(), !dbg !2533
  br label %93, !dbg !2534

93:                                               ; preds = %92, %86, %70
  %94 = load ptr, ptr %9, align 8, !dbg !2535
  %95 = getelementptr inbounds nuw %struct.ai_static, ptr %94, i32 0, i32 4, !dbg !2537
  %96 = load i16, ptr %95, align 4, !dbg !2537
  %97 = sext i16 %96 to i32, !dbg !2535
  %98 = icmp slt i32 %97, 2, !dbg !2538
  br i1 %98, label %99, label %163, !dbg !2538

99:                                               ; preds = %93
  %100 = load ptr, ptr %9, align 8, !dbg !2539
  %101 = getelementptr inbounds nuw %struct.ai_static, ptr %100, i32 0, i32 0, !dbg !2542
  %102 = load i8, ptr %101, align 4, !dbg !2542
  %103 = zext i8 %102 to i32, !dbg !2539
  %104 = icmp eq i32 %103, 132, !dbg !2543
  br i1 %104, label %110, label %105, !dbg !2544

105:                                              ; preds = %99
  %106 = load ptr, ptr %19, align 8, !dbg !2545
  %107 = getelementptr inbounds nuw %struct.ai_local, ptr %106, i32 0, i32 3, !dbg !2546
  %108 = load i32, ptr %107, align 4, !dbg !2546
  %109 = icmp eq i32 %108, 4, !dbg !2547
  br i1 %109, label %110, label %150, !dbg !2544

110:                                              ; preds = %105, %99
  %111 = load ptr, ptr @ConsoleObject, align 8, !dbg !2548
  %112 = getelementptr inbounds nuw %struct.object, ptr %111, i32 0, i32 9, !dbg !2551
  %113 = load i16, ptr %112, align 2, !dbg !2551
  %114 = sext i16 %113 to i32, !dbg !2548
  %115 = load ptr, ptr %5, align 8, !dbg !2552
  %116 = getelementptr inbounds nuw %struct.object, ptr %115, i32 0, i32 9, !dbg !2553
  %117 = load i16, ptr %116, align 2, !dbg !2553
  %118 = sext i16 %117 to i32, !dbg !2552
  %119 = icmp eq i32 %114, %118, !dbg !2554
  br i1 %119, label %120, label %122, !dbg !2554

120:                                              ; preds = %110
  %121 = load ptr, ptr %5, align 8, !dbg !2555
  call void @_Z21create_n_segment_pathP6objectii(ptr noundef %121, i32 noundef 7, i32 noundef -1), !dbg !2557
  br label %128, !dbg !2558

122:                                              ; preds = %110
  %123 = load ptr, ptr %5, align 8, !dbg !2559
  %124 = load ptr, ptr @ConsoleObject, align 8, !dbg !2561
  %125 = getelementptr inbounds nuw %struct.object, ptr %124, i32 0, i32 9, !dbg !2562
  %126 = load i16, ptr %125, align 2, !dbg !2562
  %127 = sext i16 %126 to i32, !dbg !2561
  call void @_Z21create_n_segment_pathP6objectii(ptr noundef %123, i32 noundef 7, i32 noundef %127), !dbg !2563
  br label %128

128:                                              ; preds = %122, %120
  %129 = load ptr, ptr %9, align 8, !dbg !2564
  %130 = getelementptr inbounds nuw %struct.ai_static, ptr %129, i32 0, i32 0, !dbg !2566
  %131 = load i8, ptr %130, align 4, !dbg !2566
  %132 = zext i8 %131 to i32, !dbg !2564
  %133 = icmp eq i32 %132, 132, !dbg !2567
  br i1 %133, label %134, label %146, !dbg !2567

134:                                              ; preds = %128
  %135 = load ptr, ptr %13, align 8, !dbg !2568
  %136 = getelementptr inbounds nuw %struct.robot_info, ptr %135, i32 0, i32 40, !dbg !2571
  %137 = load i8, ptr %136, align 4, !dbg !2571
  %138 = icmp ne i8 %137, 0, !dbg !2568
  br i1 %138, label %139, label %142, !dbg !2568

139:                                              ; preds = %134
  %140 = load ptr, ptr %19, align 8, !dbg !2572
  %141 = getelementptr inbounds nuw %struct.ai_local, ptr %140, i32 0, i32 3, !dbg !2573
  store i32 15, ptr %141, align 4, !dbg !2574
  br label %145, !dbg !2572

142:                                              ; preds = %134
  %143 = load ptr, ptr %19, align 8, !dbg !2575
  %144 = getelementptr inbounds nuw %struct.ai_local, ptr %143, i32 0, i32 3, !dbg !2576
  store i32 11, ptr %144, align 4, !dbg !2577
  br label %145

145:                                              ; preds = %142, %139
  br label %149, !dbg !2578

146:                                              ; preds = %128
  %147 = load ptr, ptr %19, align 8, !dbg !2579
  %148 = getelementptr inbounds nuw %struct.ai_local, ptr %147, i32 0, i32 3, !dbg !2581
  store i32 4, ptr %148, align 4, !dbg !2582
  br label %149

149:                                              ; preds = %146, %145
  br label %162, !dbg !2583

150:                                              ; preds = %105
  %151 = load ptr, ptr %13, align 8, !dbg !2584
  %152 = getelementptr inbounds nuw %struct.robot_info, ptr %151, i32 0, i32 37, !dbg !2586
  %153 = load i8, ptr %152, align 1, !dbg !2586
  %154 = sext i8 %153 to i32, !dbg !2584
  %155 = icmp eq i32 %154, 0, !dbg !2587
  br i1 %155, label %156, label %161, !dbg !2587

156:                                              ; preds = %150
  %157 = load ptr, ptr %19, align 8, !dbg !2588
  %158 = getelementptr inbounds nuw %struct.ai_local, ptr %157, i32 0, i32 3, !dbg !2590
  store i32 0, ptr %158, align 4, !dbg !2591
  %159 = load ptr, ptr %9, align 8, !dbg !2592
  %160 = getelementptr inbounds nuw %struct.ai_static, ptr %159, i32 0, i32 4, !dbg !2593
  store i16 0, ptr %160, align 4, !dbg !2594
  br label %826, !dbg !2595

161:                                              ; preds = %150
  br label %162

162:                                              ; preds = %161, %149
  br label %163, !dbg !2596

163:                                              ; preds = %162, %93
  %164 = load ptr, ptr %9, align 8, !dbg !2597
  %165 = getelementptr inbounds nuw %struct.ai_static, ptr %164, i32 0, i32 3, !dbg !2598
  %166 = load i16, ptr %165, align 2, !dbg !2598
  %167 = sext i16 %166 to i32, !dbg !2597
  %168 = load ptr, ptr %9, align 8, !dbg !2599
  %169 = getelementptr inbounds nuw %struct.ai_static, ptr %168, i32 0, i32 5, !dbg !2600
  %170 = load i8, ptr %169, align 2, !dbg !2600
  %171 = sext i8 %170 to i32, !dbg !2599
  %172 = add nsw i32 %167, %171, !dbg !2601
  %173 = sext i32 %172 to i64, !dbg !2602
  %174 = getelementptr inbounds [2500 x %struct.point_seg], ptr @Point_segs, i64 0, i64 %173, !dbg !2602
  %175 = getelementptr inbounds nuw %struct.point_seg, ptr %174, i32 0, i32 1, !dbg !2603
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %10, ptr align 4 %175, i64 12, i1 false), !dbg !2604
  %176 = load ptr, ptr %9, align 8, !dbg !2605
  %177 = getelementptr inbounds nuw %struct.ai_static, ptr %176, i32 0, i32 3, !dbg !2606
  %178 = load i16, ptr %177, align 2, !dbg !2606
  %179 = sext i16 %178 to i32, !dbg !2605
  %180 = load ptr, ptr %9, align 8, !dbg !2607
  %181 = getelementptr inbounds nuw %struct.ai_static, ptr %180, i32 0, i32 5, !dbg !2608
  %182 = load i8, ptr %181, align 2, !dbg !2608
  %183 = sext i8 %182 to i32, !dbg !2607
  %184 = add nsw i32 %179, %183, !dbg !2609
  %185 = sext i32 %184 to i64, !dbg !2610
  %186 = getelementptr inbounds [2500 x %struct.point_seg], ptr @Point_segs, i64 0, i64 %185, !dbg !2610
  %187 = getelementptr inbounds nuw %struct.point_seg, ptr %186, i32 0, i32 0, !dbg !2611
  %188 = load i32, ptr %187, align 4, !dbg !2611
  store i32 %188, ptr %18, align 4, !dbg !2612
  %189 = load ptr, ptr %5, align 8, !dbg !2613
  %190 = getelementptr inbounds nuw %struct.object, ptr %189, i32 0, i32 11, !dbg !2614
  %191 = call noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef %10, ptr noundef %190), !dbg !2615
  store i32 %191, ptr %12, align 4, !dbg !2616
  %192 = load i32, ptr @Player_is_dead, align 4, !dbg !2617
  %193 = icmp ne i32 %192, 0, !dbg !2617
  br i1 %193, label %194, label %200, !dbg !2617

194:                                              ; preds = %163
  %195 = load ptr, ptr %5, align 8, !dbg !2619
  %196 = getelementptr inbounds nuw %struct.object, ptr %195, i32 0, i32 11, !dbg !2620
  %197 = load ptr, ptr @Viewer, align 8, !dbg !2621
  %198 = getelementptr inbounds nuw %struct.object, ptr %197, i32 0, i32 11, !dbg !2622
  %199 = call noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef %196, ptr noundef %198), !dbg !2623
  store i32 %199, ptr %17, align 4, !dbg !2624
  br label %206, !dbg !2625

200:                                              ; preds = %163
  %201 = load ptr, ptr %5, align 8, !dbg !2626
  %202 = getelementptr inbounds nuw %struct.object, ptr %201, i32 0, i32 11, !dbg !2627
  %203 = load ptr, ptr @ConsoleObject, align 8, !dbg !2628
  %204 = getelementptr inbounds nuw %struct.object, ptr %203, i32 0, i32 11, !dbg !2629
  %205 = call noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef %202, ptr noundef %204), !dbg !2630
  store i32 %205, ptr %17, align 4, !dbg !2631
  br label %206

206:                                              ; preds = %200, %194
  %207 = load i32, ptr %6, align 4, !dbg !2632
  %208 = icmp ne i32 %207, 0, !dbg !2632
  br i1 %208, label %281, label %209, !dbg !2634

209:                                              ; preds = %206
  %210 = load i32, ptr %7, align 4, !dbg !2635
  %211 = icmp ne i32 %210, 0, !dbg !2635
  br i1 %211, label %281, label %212, !dbg !2636

212:                                              ; preds = %209
  %213 = load i32, ptr %17, align 4, !dbg !2637
  %214 = icmp sgt i32 %213, 13107200, !dbg !2638
  br i1 %214, label %215, label %281, !dbg !2639

215:                                              ; preds = %212
  %216 = load i32, ptr @Game_mode, align 4, !dbg !2640
  %217 = and i32 %216, 38, !dbg !2641
  %218 = icmp ne i32 %217, 0, !dbg !2642
  br i1 %218, label %281, label %219, !dbg !2639

219:                                              ; preds = %215
  %220 = load i32, ptr %12, align 4, !dbg !2643
  %221 = icmp slt i32 %220, 131072, !dbg !2646
  br i1 %221, label %222, label %225, !dbg !2646

222:                                              ; preds = %219
  %223 = load ptr, ptr %5, align 8, !dbg !2647
  %224 = load i32, ptr %18, align 4, !dbg !2649
  call void @_Z19move_object_to_goalP6objectP10vms_vectori(ptr noundef %223, ptr noundef %10, i32 noundef %224), !dbg !2650
  br label %826, !dbg !2651

225:                                              ; preds = %219
    #dbg_declare(ptr %21, !2652, !DIExpression(), !2654)
  %226 = load ptr, ptr %5, align 8, !dbg !2655
  %227 = getelementptr inbounds nuw %struct.object, ptr %226, i32 0, i32 2, !dbg !2656
  %228 = load i8, ptr %227, align 1, !dbg !2656
  %229 = zext i8 %228 to i64, !dbg !2657
  %230 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %229, !dbg !2657
  store ptr %230, ptr %21, align 8, !dbg !2654
    #dbg_declare(ptr %22, !2658, !DIExpression(), !2659)
  %231 = load ptr, ptr %21, align 8, !dbg !2660
  %232 = getelementptr inbounds nuw %struct.robot_info, ptr %231, i32 0, i32 26, !dbg !2661
  %233 = load i32, ptr @Difficulty_level, align 4, !dbg !2662
  %234 = sext i32 %233 to i64, !dbg !2660
  %235 = getelementptr inbounds [5 x i32], ptr %232, i64 0, i64 %234, !dbg !2660
  %236 = load i32, ptr %235, align 4, !dbg !2660
  %237 = sdiv i32 %236, 2, !dbg !2663
  store i32 %237, ptr %22, align 4, !dbg !2659
    #dbg_declare(ptr %23, !2664, !DIExpression(), !2665)
  %238 = load i32, ptr @FrameTime, align 4, !dbg !2666
  %239 = load i32, ptr %22, align 4, !dbg !2667
  %240 = call noundef i32 @_Z6fixmulii(i32 noundef %238, i32 noundef %239), !dbg !2668
  store i32 %240, ptr %23, align 4, !dbg !2665
  %241 = load ptr, ptr %5, align 8, !dbg !2669
  %242 = getelementptr inbounds nuw %struct.object, ptr %241, i32 0, i32 2, !dbg !2671
  %243 = load i8, ptr %242, align 1, !dbg !2671
  %244 = zext i8 %243 to i64, !dbg !2672
  %245 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %244, !dbg !2672
  %246 = getelementptr inbounds nuw %struct.robot_info, ptr %245, i32 0, i32 37, !dbg !2673
  %247 = load i8, ptr %246, align 1, !dbg !2673
  %248 = icmp ne i8 %247, 0, !dbg !2672
  br i1 %248, label %279, label %249, !dbg !2674

249:                                              ; preds = %225
  %250 = load ptr, ptr %5, align 8, !dbg !2675
  %251 = getelementptr inbounds nuw %struct.object, ptr %250, i32 0, i32 2, !dbg !2676
  %252 = load i8, ptr %251, align 1, !dbg !2676
  %253 = zext i8 %252 to i64, !dbg !2677
  %254 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %253, !dbg !2677
  %255 = getelementptr inbounds nuw %struct.robot_info, ptr %254, i32 0, i32 40, !dbg !2678
  %256 = load i8, ptr %255, align 4, !dbg !2678
  %257 = icmp ne i8 %256, 0, !dbg !2677
  br i1 %257, label %279, label %258, !dbg !2674

258:                                              ; preds = %249
  %259 = load i32, ptr %23, align 4, !dbg !2679
  %260 = load i32, ptr %12, align 4, !dbg !2682
  %261 = icmp sge i32 %259, %260, !dbg !2683
  br i1 %261, label %262, label %265, !dbg !2683

262:                                              ; preds = %258
  %263 = load ptr, ptr %5, align 8, !dbg !2684
  %264 = load i32, ptr %18, align 4, !dbg !2686
  call void @_Z19move_object_to_goalP6objectP10vms_vectori(ptr noundef %263, ptr noundef %10, i32 noundef %264), !dbg !2687
  br label %278, !dbg !2688

265:                                              ; preds = %258
    #dbg_declare(ptr %24, !2689, !DIExpression(), !2691)
  %266 = load i32, ptr %23, align 4, !dbg !2692
  %267 = load i32, ptr %12, align 4, !dbg !2693
  %268 = call noundef i32 @_Z6fixdivii(i32 noundef %266, i32 noundef %267), !dbg !2694
  store i32 %268, ptr %24, align 4, !dbg !2691
    #dbg_declare(ptr %25, !2695, !DIExpression(), !2696)
  %269 = call noundef i32 @_Z6P_Randv(), !dbg !2697
  store i32 %269, ptr %25, align 4, !dbg !2696
  %270 = load i32, ptr %25, align 4, !dbg !2698
  %271 = ashr i32 %270, 1, !dbg !2700
  %272 = load i32, ptr %24, align 4, !dbg !2701
  %273 = icmp slt i32 %271, %272, !dbg !2702
  br i1 %273, label %274, label %277, !dbg !2702

274:                                              ; preds = %265
  %275 = load ptr, ptr %5, align 8, !dbg !2703
  %276 = load i32, ptr %18, align 4, !dbg !2705
  call void @_Z19move_object_to_goalP6objectP10vms_vectori(ptr noundef %275, ptr noundef %10, i32 noundef %276), !dbg !2706
  br label %277, !dbg !2707

277:                                              ; preds = %274, %265
  br label %278

278:                                              ; preds = %277, %262
  br label %826, !dbg !2708

279:                                              ; preds = %249, %225
  br label %280

280:                                              ; preds = %279
  br label %281, !dbg !2709

281:                                              ; preds = %280, %215, %212, %209, %206
  %282 = load ptr, ptr %19, align 8, !dbg !2710
  %283 = getelementptr inbounds nuw %struct.ai_local, ptr %282, i32 0, i32 3, !dbg !2712
  %284 = load i32, ptr %283, align 4, !dbg !2712
  %285 = icmp eq i32 %284, 4, !dbg !2713
  br i1 %285, label %286, label %384, !dbg !2713

286:                                              ; preds = %281
  %287 = load i32, ptr %6, align 4, !dbg !2714
  %288 = icmp eq i32 %287, 0, !dbg !2717
  br i1 %288, label %289, label %307, !dbg !2718

289:                                              ; preds = %286
  %290 = load ptr, ptr %19, align 8, !dbg !2719
  %291 = getelementptr inbounds nuw %struct.ai_local, ptr %290, i32 0, i32 0, !dbg !2720
  %292 = load i32, ptr %291, align 4, !dbg !2720
  %293 = icmp eq i32 %292, 0, !dbg !2721
  br i1 %293, label %294, label %307, !dbg !2718

294:                                              ; preds = %289
    #dbg_declare(ptr %26, !2722, !DIExpression(), !2724)
  %295 = load i32, ptr @FrameTime, align 4, !dbg !2725
  %296 = sdiv i32 %295, 2, !dbg !2726
  %297 = sub nsw i32 65536, %296, !dbg !2727
  store i32 %297, ptr %26, align 4, !dbg !2728
  %298 = load i32, ptr %26, align 4, !dbg !2729
  %299 = icmp slt i32 %298, 32768, !dbg !2731
  br i1 %299, label %300, label %301, !dbg !2731

300:                                              ; preds = %294
  store i32 32768, ptr %26, align 4, !dbg !2732
  br label %301, !dbg !2733

301:                                              ; preds = %300, %294
  %302 = load ptr, ptr %5, align 8, !dbg !2734
  %303 = getelementptr inbounds nuw %struct.object, ptr %302, i32 0, i32 21, !dbg !2735
  %304 = getelementptr inbounds nuw %struct.physics_info, ptr %303, i32 0, i32 0, !dbg !2736
  %305 = load i32, ptr %26, align 4, !dbg !2737
  %306 = call noundef ptr @_Z12vm_vec_scaleP10vms_vectori(ptr noundef %304, i32 noundef %305), !dbg !2738
  br label %826, !dbg !2739

307:                                              ; preds = %289, %286
  %308 = load i32, ptr @FrameCount, align 4, !dbg !2740
  %309 = sext i32 %308 to i64, !dbg !2740
  %310 = load ptr, ptr %5, align 8, !dbg !2742
  %311 = ptrtoint ptr %310 to i64, !dbg !2743
  %312 = sub i64 %311, ptrtoint (ptr @Objects to i64), !dbg !2743
  %313 = sdiv exact i64 %312, 268, !dbg !2743
  %314 = and i64 %313, 7, !dbg !2744
  %315 = xor i64 %309, %314, !dbg !2745
  %316 = icmp ne i64 %315, 0, !dbg !2746
  br i1 %316, label %382, label %317, !dbg !2747

317:                                              ; preds = %307
    #dbg_declare(ptr %27, !2748, !DIExpression(), !2750)
  %318 = load ptr, ptr %9, align 8, !dbg !2751
  %319 = getelementptr inbounds nuw %struct.ai_static, ptr %318, i32 0, i32 3, !dbg !2752
  %320 = load i16, ptr %319, align 2, !dbg !2752
  %321 = sext i16 %320 to i64, !dbg !2753
  %322 = getelementptr inbounds [2500 x %struct.point_seg], ptr @Point_segs, i64 0, i64 %321, !dbg !2753
  store ptr %322, ptr %27, align 8, !dbg !2750
    #dbg_declare(ptr %28, !2754, !DIExpression(), !2755)
  %323 = load ptr, ptr @ConsoleObject, align 8, !dbg !2756
  %324 = getelementptr inbounds nuw %struct.object, ptr %323, i32 0, i32 9, !dbg !2757
  %325 = load i16, ptr %324, align 2, !dbg !2757
  %326 = sext i16 %325 to i32, !dbg !2756
  store i32 %326, ptr %28, align 4, !dbg !2755
    #dbg_declare(ptr %29, !2758, !DIExpression(), !2759)
  %327 = load ptr, ptr %9, align 8, !dbg !2760
  %328 = getelementptr inbounds nuw %struct.ai_static, ptr %327, i32 0, i32 5, !dbg !2762
  %329 = load i8, ptr %328, align 2, !dbg !2762
  %330 = sext i8 %329 to i32, !dbg !2760
  store i32 %330, ptr %29, align 4, !dbg !2763
  br label %331, !dbg !2764

331:                                              ; preds = %369, %317
  %332 = load i32, ptr %29, align 4, !dbg !2765
  %333 = load ptr, ptr %9, align 8, !dbg !2767
  %334 = getelementptr inbounds nuw %struct.ai_static, ptr %333, i32 0, i32 4, !dbg !2768
  %335 = load i16, ptr %334, align 4, !dbg !2768
  %336 = sext i16 %335 to i32, !dbg !2767
  %337 = icmp slt i32 %332, %336, !dbg !2769
  br i1 %337, label %338, label %372, !dbg !2770

338:                                              ; preds = %331
  %339 = load ptr, ptr %27, align 8, !dbg !2771
  %340 = load i32, ptr %29, align 4, !dbg !2774
  %341 = sext i32 %340 to i64, !dbg !2771
  %342 = getelementptr inbounds %struct.point_seg, ptr %339, i64 %341, !dbg !2771
  %343 = getelementptr inbounds nuw %struct.point_seg, ptr %342, i32 0, i32 0, !dbg !2775
  %344 = load i32, ptr %343, align 4, !dbg !2775
  %345 = load i32, ptr %28, align 4, !dbg !2776
  %346 = icmp eq i32 %344, %345, !dbg !2777
  br i1 %346, label %347, label %368, !dbg !2777

347:                                              ; preds = %338
  %348 = load i32, ptr %28, align 4, !dbg !2778
  %349 = load ptr, ptr %5, align 8, !dbg !2781
  %350 = getelementptr inbounds nuw %struct.object, ptr %349, i32 0, i32 9, !dbg !2782
  %351 = load i16, ptr %350, align 2, !dbg !2782
  %352 = sext i16 %351 to i32, !dbg !2781
  %353 = icmp ne i32 %348, %352, !dbg !2783
  br i1 %353, label %354, label %357, !dbg !2783

354:                                              ; preds = %347
  %355 = load ptr, ptr %5, align 8, !dbg !2784
  %356 = load i32, ptr %28, align 4, !dbg !2786
  call void @_Z21create_n_segment_pathP6objectii(ptr noundef %355, i32 noundef 7, i32 noundef %356), !dbg !2787
  br label %359, !dbg !2788

357:                                              ; preds = %347
  %358 = load ptr, ptr %5, align 8, !dbg !2789
  call void @_Z21create_n_segment_pathP6objectii(ptr noundef %358, i32 noundef 7, i32 noundef -1), !dbg !2791
  br label %359

359:                                              ; preds = %357, %354
  %360 = load ptr, ptr %9, align 8, !dbg !2792
  %361 = getelementptr inbounds nuw %struct.ai_static, ptr %360, i32 0, i32 4, !dbg !2792
  %362 = load i16, ptr %361, align 4, !dbg !2792
  %363 = sext i16 %362 to i32, !dbg !2792
  %364 = icmp ne i32 %363, 0, !dbg !2792
  %365 = zext i1 %364 to i32, !dbg !2792
  call void @_Z7_AssertiPKcS0_i(i32 noundef %365, ptr noundef @.str.18, ptr noundef @.str.1, i32 noundef 1151), !dbg !2792
  %366 = load ptr, ptr %19, align 8, !dbg !2793
  %367 = getelementptr inbounds nuw %struct.ai_local, ptr %366, i32 0, i32 3, !dbg !2794
  store i32 4, ptr %367, align 4, !dbg !2795
  br label %373, !dbg !2796

368:                                              ; preds = %338
  br label %369, !dbg !2797

369:                                              ; preds = %368
  %370 = load i32, ptr %29, align 4, !dbg !2798
  %371 = add nsw i32 %370, 1, !dbg !2798
  store i32 %371, ptr %29, align 4, !dbg !2798
  br label %331, !dbg !2799, !llvm.loop !2800

372:                                              ; preds = %331
  br label %373, !dbg !2802

373:                                              ; preds = %372, %359
  %374 = load i32, ptr %6, align 4, !dbg !2802
  %375 = icmp ne i32 %374, 0, !dbg !2802
  br i1 %375, label %376, label %381, !dbg !2802

376:                                              ; preds = %373
  %377 = load ptr, ptr %19, align 8, !dbg !2804
  %378 = getelementptr inbounds nuw %struct.ai_local, ptr %377, i32 0, i32 0, !dbg !2806
  store i32 1, ptr %378, align 4, !dbg !2807
  %379 = load ptr, ptr %19, align 8, !dbg !2808
  %380 = getelementptr inbounds nuw %struct.ai_local, ptr %379, i32 0, i32 10, !dbg !2809
  store i32 65536, ptr %380, align 4, !dbg !2810
  br label %381, !dbg !2811

381:                                              ; preds = %376, %373
  br label %382, !dbg !2812

382:                                              ; preds = %381, %307
  br label %383

383:                                              ; preds = %382
  br label %384, !dbg !2813

384:                                              ; preds = %383, %281
  %385 = load ptr, ptr %9, align 8, !dbg !2814
  %386 = getelementptr inbounds nuw %struct.ai_static, ptr %385, i32 0, i32 5, !dbg !2816
  %387 = load i8, ptr %386, align 2, !dbg !2816
  %388 = sext i8 %387 to i32, !dbg !2814
  %389 = icmp slt i32 %388, 0, !dbg !2817
  br i1 %389, label %390, label %393, !dbg !2817

390:                                              ; preds = %384
  %391 = load ptr, ptr %9, align 8, !dbg !2818
  %392 = getelementptr inbounds nuw %struct.ai_static, ptr %391, i32 0, i32 5, !dbg !2820
  store i8 0, ptr %392, align 2, !dbg !2821
  br label %433, !dbg !2822

393:                                              ; preds = %384
  %394 = load ptr, ptr %9, align 8, !dbg !2823
  %395 = getelementptr inbounds nuw %struct.ai_static, ptr %394, i32 0, i32 5, !dbg !2825
  %396 = load i8, ptr %395, align 2, !dbg !2825
  %397 = sext i8 %396 to i32, !dbg !2823
  %398 = load ptr, ptr %9, align 8, !dbg !2826
  %399 = getelementptr inbounds nuw %struct.ai_static, ptr %398, i32 0, i32 4, !dbg !2827
  %400 = load i16, ptr %399, align 4, !dbg !2827
  %401 = sext i16 %400 to i32, !dbg !2826
  %402 = icmp sge i32 %397, %401, !dbg !2828
  br i1 %402, label %403, label %432, !dbg !2828

403:                                              ; preds = %393
  %404 = load ptr, ptr %19, align 8, !dbg !2829
  %405 = getelementptr inbounds nuw %struct.ai_local, ptr %404, i32 0, i32 3, !dbg !2832
  %406 = load i32, ptr %405, align 4, !dbg !2832
  %407 = icmp eq i32 %406, 4, !dbg !2833
  br i1 %407, label %408, label %422, !dbg !2833

408:                                              ; preds = %403
  %409 = load ptr, ptr %5, align 8, !dbg !2834
  %410 = load ptr, ptr @ConsoleObject, align 8, !dbg !2836
  %411 = getelementptr inbounds nuw %struct.object, ptr %410, i32 0, i32 9, !dbg !2837
  %412 = load i16, ptr %411, align 2, !dbg !2837
  %413 = sext i16 %412 to i32, !dbg !2836
  call void @_Z21create_n_segment_pathP6objectii(ptr noundef %409, i32 noundef 7, i32 noundef %413), !dbg !2838
  %414 = load ptr, ptr %19, align 8, !dbg !2839
  %415 = getelementptr inbounds nuw %struct.ai_local, ptr %414, i32 0, i32 3, !dbg !2840
  store i32 4, ptr %415, align 4, !dbg !2841
  %416 = load ptr, ptr %9, align 8, !dbg !2842
  %417 = getelementptr inbounds nuw %struct.ai_static, ptr %416, i32 0, i32 4, !dbg !2842
  %418 = load i16, ptr %417, align 4, !dbg !2842
  %419 = sext i16 %418 to i32, !dbg !2842
  %420 = icmp ne i32 %419, 0, !dbg !2842
  %421 = zext i1 %420 to i32, !dbg !2842
  call void @_Z7_AssertiPKcS0_i(i32 noundef %421, ptr noundef @.str.18, ptr noundef @.str.1, i32 noundef 1171), !dbg !2842
  br label %431, !dbg !2843

422:                                              ; preds = %403
  %423 = load ptr, ptr %9, align 8, !dbg !2844
  %424 = getelementptr inbounds nuw %struct.ai_static, ptr %423, i32 0, i32 4, !dbg !2846
  %425 = load i16, ptr %424, align 4, !dbg !2846
  %426 = sext i16 %425 to i32, !dbg !2844
  %427 = sub nsw i32 %426, 1, !dbg !2847
  %428 = trunc i32 %427 to i8, !dbg !2844
  %429 = load ptr, ptr %9, align 8, !dbg !2848
  %430 = getelementptr inbounds nuw %struct.ai_static, ptr %429, i32 0, i32 5, !dbg !2849
  store i8 %428, ptr %430, align 2, !dbg !2850
  br label %431

431:                                              ; preds = %422, %408
  br label %432, !dbg !2851

432:                                              ; preds = %431, %393
  br label %433

433:                                              ; preds = %432, %390
  %434 = load ptr, ptr %9, align 8, !dbg !2852
  %435 = getelementptr inbounds nuw %struct.ai_static, ptr %434, i32 0, i32 3, !dbg !2853
  %436 = load i16, ptr %435, align 2, !dbg !2853
  %437 = sext i16 %436 to i32, !dbg !2852
  %438 = load ptr, ptr %9, align 8, !dbg !2854
  %439 = getelementptr inbounds nuw %struct.ai_static, ptr %438, i32 0, i32 5, !dbg !2855
  %440 = load i8, ptr %439, align 2, !dbg !2855
  %441 = sext i8 %440 to i32, !dbg !2854
  %442 = add nsw i32 %437, %441, !dbg !2856
  %443 = sext i32 %442 to i64, !dbg !2857
  %444 = getelementptr inbounds [2500 x %struct.point_seg], ptr @Point_segs, i64 0, i64 %443, !dbg !2857
  %445 = getelementptr inbounds nuw %struct.point_seg, ptr %444, i32 0, i32 1, !dbg !2858
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %10, ptr align 4 %445, i64 12, i1 false), !dbg !2859
  store i32 0, ptr %14, align 4, !dbg !2860
  %446 = load ptr, ptr %9, align 8, !dbg !2861
  %447 = getelementptr inbounds nuw %struct.ai_static, ptr %446, i32 0, i32 1, !dbg !2862
  %448 = getelementptr inbounds [11 x i8], ptr %447, i64 0, i64 3, !dbg !2861
  %449 = load i8, ptr %448, align 1, !dbg !2861
  %450 = sext i8 %449 to i32, !dbg !2861
  store i32 %450, ptr %15, align 4, !dbg !2863
  %451 = load ptr, ptr %9, align 8, !dbg !2864
  %452 = getelementptr inbounds nuw %struct.ai_static, ptr %451, i32 0, i32 5, !dbg !2865
  %453 = load i8, ptr %452, align 2, !dbg !2865
  %454 = sext i8 %453 to i32, !dbg !2864
  store i32 %454, ptr %16, align 4, !dbg !2866
  %455 = load ptr, ptr %5, align 8, !dbg !2867
  %456 = getelementptr inbounds nuw %struct.object, ptr %455, i32 0, i32 21, !dbg !2868
  %457 = getelementptr inbounds nuw %struct.physics_info, ptr %456, i32 0, i32 0, !dbg !2869
  %458 = call noundef i32 @_Z16vm_vec_mag_quickP10vms_vector(ptr noundef %457), !dbg !2870
  %459 = load i32, ptr @FrameTime, align 4, !dbg !2871
  %460 = call noundef i32 @_Z6fixmulii(i32 noundef %458, i32 noundef %459), !dbg !2872
  %461 = mul nsw i32 %460, 2, !dbg !2873
  %462 = add nsw i32 %461, 131072, !dbg !2874
  store i32 %462, ptr %20, align 4, !dbg !2875
  %463 = load ptr, ptr %9, align 8, !dbg !2876
  %464 = getelementptr inbounds nuw %struct.ai_static, ptr %463, i32 0, i32 3, !dbg !2877
  %465 = load i16, ptr %464, align 2, !dbg !2877
  %466 = sext i16 %465 to i32, !dbg !2876
  %467 = load ptr, ptr %9, align 8, !dbg !2878
  %468 = getelementptr inbounds nuw %struct.ai_static, ptr %467, i32 0, i32 5, !dbg !2879
  %469 = load i8, ptr %468, align 2, !dbg !2879
  %470 = sext i8 %469 to i32, !dbg !2878
  %471 = add nsw i32 %466, %470, !dbg !2880
  %472 = sext i32 %471 to i64, !dbg !2881
  %473 = getelementptr inbounds [2500 x %struct.point_seg], ptr @Point_segs, i64 0, i64 %472, !dbg !2881
  %474 = getelementptr inbounds nuw %struct.point_seg, ptr %473, i32 0, i32 1, !dbg !2882
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %11, ptr align 4 %474, i64 12, i1 false), !dbg !2883
  br label %475, !dbg !2884

475:                                              ; preds = %820, %433
  %476 = load i32, ptr %12, align 4, !dbg !2885
  %477 = load i32, ptr %20, align 4, !dbg !2886
  %478 = icmp slt i32 %476, %477, !dbg !2887
  br i1 %478, label %479, label %483, !dbg !2888

479:                                              ; preds = %475
  %480 = load i32, ptr %14, align 4, !dbg !2889
  %481 = icmp ne i32 %480, 0, !dbg !2889
  %482 = xor i1 %481, true, !dbg !2890
  br label %483

483:                                              ; preds = %479, %475
  %484 = phi i1 [ false, %475 ], [ %482, %479 ], !dbg !2891
  br i1 %484, label %485, label %821, !dbg !2884

485:                                              ; preds = %483
  %486 = load ptr, ptr %9, align 8, !dbg !2892
  %487 = getelementptr inbounds nuw %struct.ai_static, ptr %486, i32 0, i32 1, !dbg !2894
  %488 = getelementptr inbounds [11 x i8], ptr %487, i64 0, i64 3, !dbg !2892
  %489 = load i8, ptr %488, align 1, !dbg !2892
  %490 = sext i8 %489 to i32, !dbg !2892
  %491 = load ptr, ptr %9, align 8, !dbg !2895
  %492 = getelementptr inbounds nuw %struct.ai_static, ptr %491, i32 0, i32 5, !dbg !2896
  %493 = load i8, ptr %492, align 2, !dbg !2897
  %494 = sext i8 %493 to i32, !dbg !2897
  %495 = add nsw i32 %494, %490, !dbg !2897
  %496 = trunc i32 %495 to i8, !dbg !2897
  store i8 %496, ptr %492, align 2, !dbg !2897
  %497 = load ptr, ptr %9, align 8, !dbg !2898
  %498 = getelementptr inbounds nuw %struct.ai_static, ptr %497, i32 0, i32 5, !dbg !2900
  %499 = load i8, ptr %498, align 2, !dbg !2900
  %500 = sext i8 %499 to i32, !dbg !2898
  %501 = load ptr, ptr %9, align 8, !dbg !2901
  %502 = getelementptr inbounds nuw %struct.ai_static, ptr %501, i32 0, i32 4, !dbg !2902
  %503 = load i16, ptr %502, align 4, !dbg !2902
  %504 = sext i16 %503 to i32, !dbg !2901
  %505 = icmp sge i32 %500, %504, !dbg !2903
  br i1 %505, label %512, label %506, !dbg !2904

506:                                              ; preds = %485
  %507 = load ptr, ptr %9, align 8, !dbg !2905
  %508 = getelementptr inbounds nuw %struct.ai_static, ptr %507, i32 0, i32 5, !dbg !2906
  %509 = load i8, ptr %508, align 2, !dbg !2906
  %510 = sext i8 %509 to i32, !dbg !2905
  %511 = icmp slt i32 %510, 0, !dbg !2907
  br i1 %511, label %512, label %787, !dbg !2904

512:                                              ; preds = %506, %485
  %513 = load ptr, ptr %13, align 8, !dbg !2908
  %514 = getelementptr inbounds nuw %struct.robot_info, ptr %513, i32 0, i32 37, !dbg !2911
  %515 = load i8, ptr %514, align 1, !dbg !2911
  %516 = icmp ne i8 %515, 0, !dbg !2908
  br i1 %516, label %517, label %578, !dbg !2908

517:                                              ; preds = %512
  %518 = load i32, ptr @Escort_special_goal, align 4, !dbg !2912
  %519 = icmp eq i32 %518, 13, !dbg !2915
  br i1 %519, label %520, label %577, !dbg !2915

520:                                              ; preds = %517
  %521 = load i32, ptr %6, align 4, !dbg !2916
  %522 = icmp ne i32 %521, 0, !dbg !2916
  br i1 %522, label %523, label %550, !dbg !2916

523:                                              ; preds = %520
  %524 = load ptr, ptr %5, align 8, !dbg !2918
  %525 = call noundef i32 @_Z6P_Randv(), !dbg !2920
  %526 = mul nsw i32 %525, 16, !dbg !2921
  %527 = add nsw i32 16, %526, !dbg !2922
  call void @_Z21create_n_segment_pathP6objectii(ptr noundef %524, i32 noundef %527, i32 noundef -1), !dbg !2923
  %528 = load ptr, ptr %5, align 8, !dbg !2924
  %529 = load ptr, ptr %9, align 8, !dbg !2925
  %530 = getelementptr inbounds nuw %struct.ai_static, ptr %529, i32 0, i32 3, !dbg !2926
  %531 = load i16, ptr %530, align 2, !dbg !2926
  %532 = sext i16 %531 to i64, !dbg !2927
  %533 = getelementptr inbounds [2500 x %struct.point_seg], ptr @Point_segs, i64 0, i64 %532, !dbg !2927
  %534 = load ptr, ptr %9, align 8, !dbg !2928
  %535 = getelementptr inbounds nuw %struct.ai_static, ptr %534, i32 0, i32 4, !dbg !2929
  %536 = load i16, ptr %535, align 4, !dbg !2929
  %537 = sext i16 %536 to i32, !dbg !2928
  %538 = call noundef i32 @_Z11polish_pathP6objectP9point_segi(ptr noundef %528, ptr noundef %533, i32 noundef %537), !dbg !2930
  %539 = trunc i32 %538 to i16, !dbg !2930
  %540 = load ptr, ptr %9, align 8, !dbg !2931
  %541 = getelementptr inbounds nuw %struct.ai_static, ptr %540, i32 0, i32 4, !dbg !2932
  store i16 %539, ptr %541, align 4, !dbg !2933
  %542 = load ptr, ptr %9, align 8, !dbg !2934
  %543 = getelementptr inbounds nuw %struct.ai_static, ptr %542, i32 0, i32 4, !dbg !2934
  %544 = load i16, ptr %543, align 4, !dbg !2934
  %545 = sext i16 %544 to i32, !dbg !2934
  %546 = icmp ne i32 %545, 0, !dbg !2934
  %547 = zext i1 %546 to i32, !dbg !2934
  call void @_Z7_AssertiPKcS0_i(i32 noundef %547, ptr noundef @.str.18, ptr noundef @.str.1, i32 noundef 1211), !dbg !2934
  %548 = load ptr, ptr %19, align 8, !dbg !2935
  %549 = getelementptr inbounds nuw %struct.ai_local, ptr %548, i32 0, i32 3, !dbg !2936
  store i32 1, ptr %549, align 4, !dbg !2937
  br label %826, !dbg !2938

550:                                              ; preds = %520
  %551 = load ptr, ptr %19, align 8, !dbg !2939
  %552 = getelementptr inbounds nuw %struct.ai_local, ptr %551, i32 0, i32 3, !dbg !2941
  store i32 1, ptr %552, align 4, !dbg !2942
  %553 = load ptr, ptr %5, align 8, !dbg !2943
  %554 = getelementptr inbounds nuw %struct.object, ptr %553, i32 0, i32 21, !dbg !2943
  %555 = getelementptr inbounds nuw %struct.physics_info, ptr %554, i32 0, i32 0, !dbg !2943
  %556 = getelementptr inbounds nuw %struct.vms_vector, ptr %555, i32 0, i32 2, !dbg !2943
  store i32 0, ptr %556, align 4, !dbg !2943
  %557 = load ptr, ptr %5, align 8, !dbg !2943
  %558 = getelementptr inbounds nuw %struct.object, ptr %557, i32 0, i32 21, !dbg !2943
  %559 = getelementptr inbounds nuw %struct.physics_info, ptr %558, i32 0, i32 0, !dbg !2943
  %560 = getelementptr inbounds nuw %struct.vms_vector, ptr %559, i32 0, i32 1, !dbg !2943
  store i32 0, ptr %560, align 4, !dbg !2943
  %561 = load ptr, ptr %5, align 8, !dbg !2943
  %562 = getelementptr inbounds nuw %struct.object, ptr %561, i32 0, i32 21, !dbg !2943
  %563 = getelementptr inbounds nuw %struct.physics_info, ptr %562, i32 0, i32 0, !dbg !2943
  %564 = getelementptr inbounds nuw %struct.vms_vector, ptr %563, i32 0, i32 0, !dbg !2943
  store i32 0, ptr %564, align 4, !dbg !2943
  %565 = load ptr, ptr %5, align 8, !dbg !2944
  %566 = getelementptr inbounds nuw %struct.object, ptr %565, i32 0, i32 21, !dbg !2944
  %567 = getelementptr inbounds nuw %struct.physics_info, ptr %566, i32 0, i32 5, !dbg !2944
  %568 = getelementptr inbounds nuw %struct.vms_vector, ptr %567, i32 0, i32 2, !dbg !2944
  store i32 0, ptr %568, align 4, !dbg !2944
  %569 = load ptr, ptr %5, align 8, !dbg !2944
  %570 = getelementptr inbounds nuw %struct.object, ptr %569, i32 0, i32 21, !dbg !2944
  %571 = getelementptr inbounds nuw %struct.physics_info, ptr %570, i32 0, i32 5, !dbg !2944
  %572 = getelementptr inbounds nuw %struct.vms_vector, ptr %571, i32 0, i32 1, !dbg !2944
  store i32 0, ptr %572, align 4, !dbg !2944
  %573 = load ptr, ptr %5, align 8, !dbg !2944
  %574 = getelementptr inbounds nuw %struct.object, ptr %573, i32 0, i32 21, !dbg !2944
  %575 = getelementptr inbounds nuw %struct.physics_info, ptr %574, i32 0, i32 5, !dbg !2944
  %576 = getelementptr inbounds nuw %struct.vms_vector, ptr %575, i32 0, i32 0, !dbg !2944
  store i32 0, ptr %576, align 4, !dbg !2944
  br label %826, !dbg !2945

577:                                              ; preds = %517
  br label %578, !dbg !2946

578:                                              ; preds = %577, %512
  %579 = load ptr, ptr %9, align 8, !dbg !2947
  %580 = getelementptr inbounds nuw %struct.ai_static, ptr %579, i32 0, i32 0, !dbg !2949
  %581 = load i8, ptr %580, align 4, !dbg !2949
  %582 = zext i8 %581 to i32, !dbg !2947
  %583 = icmp eq i32 %582, 134, !dbg !2950
  br i1 %583, label %584, label %590, !dbg !2950

584:                                              ; preds = %578
  %585 = load ptr, ptr %5, align 8, !dbg !2951
  %586 = load ptr, ptr @ConsoleObject, align 8, !dbg !2953
  %587 = getelementptr inbounds nuw %struct.object, ptr %586, i32 0, i32 9, !dbg !2954
  %588 = load i16, ptr %587, align 2, !dbg !2954
  %589 = sext i16 %588 to i32, !dbg !2953
  call void @_Z21create_n_segment_pathP6objectii(ptr noundef %585, i32 noundef 10, i32 noundef %589), !dbg !2955
  br label %786, !dbg !2956

590:                                              ; preds = %578
  %591 = load ptr, ptr %9, align 8, !dbg !2957
  %592 = getelementptr inbounds nuw %struct.ai_static, ptr %591, i32 0, i32 0, !dbg !2959
  %593 = load i8, ptr %592, align 4, !dbg !2959
  %594 = zext i8 %593 to i32, !dbg !2957
  %595 = icmp eq i32 %594, 133, !dbg !2960
  br i1 %595, label %596, label %628, !dbg !2960

596:                                              ; preds = %590
  %597 = load ptr, ptr %5, align 8, !dbg !2961
  call void @_Z22create_path_to_stationP6objecti(ptr noundef %597, i32 noundef 15), !dbg !2963
  %598 = load ptr, ptr %9, align 8, !dbg !2964
  %599 = getelementptr inbounds nuw %struct.ai_static, ptr %598, i32 0, i32 2, !dbg !2966
  %600 = load i16, ptr %599, align 4, !dbg !2966
  %601 = sext i16 %600 to i32, !dbg !2964
  %602 = load ptr, ptr %9, align 8, !dbg !2967
  %603 = getelementptr inbounds nuw %struct.ai_static, ptr %602, i32 0, i32 3, !dbg !2968
  %604 = load i16, ptr %603, align 2, !dbg !2968
  %605 = sext i16 %604 to i32, !dbg !2967
  %606 = load ptr, ptr %9, align 8, !dbg !2969
  %607 = getelementptr inbounds nuw %struct.ai_static, ptr %606, i32 0, i32 4, !dbg !2970
  %608 = load i16, ptr %607, align 4, !dbg !2970
  %609 = sext i16 %608 to i32, !dbg !2969
  %610 = add nsw i32 %605, %609, !dbg !2971
  %611 = sub nsw i32 %610, 1, !dbg !2972
  %612 = sext i32 %611 to i64, !dbg !2973
  %613 = getelementptr inbounds [2500 x %struct.point_seg], ptr @Point_segs, i64 0, i64 %612, !dbg !2973
  %614 = getelementptr inbounds nuw %struct.point_seg, ptr %613, i32 0, i32 0, !dbg !2974
  %615 = load i32, ptr %614, align 4, !dbg !2974
  %616 = icmp ne i32 %601, %615, !dbg !2975
  br i1 %616, label %623, label %617, !dbg !2976

617:                                              ; preds = %596
  %618 = load ptr, ptr %9, align 8, !dbg !2977
  %619 = getelementptr inbounds nuw %struct.ai_static, ptr %618, i32 0, i32 4, !dbg !2978
  %620 = load i16, ptr %619, align 4, !dbg !2978
  %621 = sext i16 %620 to i32, !dbg !2977
  %622 = icmp eq i32 %621, 0, !dbg !2979
  br i1 %622, label %623, label %626, !dbg !2976

623:                                              ; preds = %617, %596
  %624 = load ptr, ptr %19, align 8, !dbg !2980
  %625 = getelementptr inbounds nuw %struct.ai_local, ptr %624, i32 0, i32 3, !dbg !2982
  store i32 0, ptr %625, align 4, !dbg !2983
  br label %627, !dbg !2984

626:                                              ; preds = %617
  br label %627

627:                                              ; preds = %626, %623
  br label %826, !dbg !2985

628:                                              ; preds = %590
  %629 = load ptr, ptr %19, align 8, !dbg !2986
  %630 = getelementptr inbounds nuw %struct.ai_local, ptr %629, i32 0, i32 3, !dbg !2988
  %631 = load i32, ptr %630, align 4, !dbg !2988
  %632 = icmp eq i32 %631, 2, !dbg !2989
  br i1 %632, label %633, label %659, !dbg !2989

633:                                              ; preds = %628
  %634 = load ptr, ptr %5, align 8, !dbg !2990
  call void @_Z21create_path_to_playerP6objectii(ptr noundef %634, i32 noundef 10, i32 noundef 1), !dbg !2992
  %635 = load ptr, ptr %9, align 8, !dbg !2993
  %636 = getelementptr inbounds nuw %struct.ai_static, ptr %635, i32 0, i32 2, !dbg !2995
  %637 = load i16, ptr %636, align 4, !dbg !2995
  %638 = sext i16 %637 to i32, !dbg !2993
  %639 = load ptr, ptr %9, align 8, !dbg !2996
  %640 = getelementptr inbounds nuw %struct.ai_static, ptr %639, i32 0, i32 3, !dbg !2997
  %641 = load i16, ptr %640, align 2, !dbg !2997
  %642 = sext i16 %641 to i32, !dbg !2996
  %643 = load ptr, ptr %9, align 8, !dbg !2998
  %644 = getelementptr inbounds nuw %struct.ai_static, ptr %643, i32 0, i32 4, !dbg !2999
  %645 = load i16, ptr %644, align 4, !dbg !2999
  %646 = sext i16 %645 to i32, !dbg !2998
  %647 = add nsw i32 %642, %646, !dbg !3000
  %648 = sub nsw i32 %647, 1, !dbg !3001
  %649 = sext i32 %648 to i64, !dbg !3002
  %650 = getelementptr inbounds [2500 x %struct.point_seg], ptr @Point_segs, i64 0, i64 %649, !dbg !3002
  %651 = getelementptr inbounds nuw %struct.point_seg, ptr %650, i32 0, i32 0, !dbg !3003
  %652 = load i32, ptr %651, align 4, !dbg !3003
  %653 = icmp ne i32 %638, %652, !dbg !3004
  br i1 %653, label %654, label %657, !dbg !3004

654:                                              ; preds = %633
  %655 = load ptr, ptr %19, align 8, !dbg !3005
  %656 = getelementptr inbounds nuw %struct.ai_local, ptr %655, i32 0, i32 3, !dbg !3007
  store i32 0, ptr %656, align 4, !dbg !3008
  br label %826, !dbg !3009

657:                                              ; preds = %633
  br label %658

658:                                              ; preds = %657
  br label %784, !dbg !3010

659:                                              ; preds = %628
  %660 = load ptr, ptr %19, align 8, !dbg !3011
  %661 = getelementptr inbounds nuw %struct.ai_local, ptr %660, i32 0, i32 3, !dbg !3013
  %662 = load i32, ptr %661, align 4, !dbg !3013
  %663 = icmp eq i32 %662, 4, !dbg !3014
  br i1 %663, label %664, label %697, !dbg !3014

664:                                              ; preds = %659
  %665 = load ptr, ptr %5, align 8, !dbg !3015
  %666 = load ptr, ptr @ConsoleObject, align 8, !dbg !3017
  %667 = getelementptr inbounds nuw %struct.object, ptr %666, i32 0, i32 9, !dbg !3018
  %668 = load i16, ptr %667, align 2, !dbg !3018
  %669 = sext i16 %668 to i32, !dbg !3017
  call void @_Z21create_n_segment_pathP6objectii(ptr noundef %665, i32 noundef 7, i32 noundef %669), !dbg !3019
  %670 = load ptr, ptr %19, align 8, !dbg !3020
  %671 = getelementptr inbounds nuw %struct.ai_local, ptr %670, i32 0, i32 3, !dbg !3021
  store i32 4, ptr %671, align 4, !dbg !3022
  %672 = load ptr, ptr %9, align 8, !dbg !3023
  %673 = getelementptr inbounds nuw %struct.ai_static, ptr %672, i32 0, i32 4, !dbg !3025
  %674 = load i16, ptr %673, align 4, !dbg !3025
  %675 = sext i16 %674 to i32, !dbg !3023
  %676 = icmp slt i32 %675, 1, !dbg !3026
  br i1 %676, label %677, label %696, !dbg !3026

677:                                              ; preds = %664
  %678 = load ptr, ptr %5, align 8, !dbg !3027
  %679 = load ptr, ptr @ConsoleObject, align 8, !dbg !3029
  %680 = getelementptr inbounds nuw %struct.object, ptr %679, i32 0, i32 9, !dbg !3030
  %681 = load i16, ptr %680, align 2, !dbg !3030
  %682 = sext i16 %681 to i32, !dbg !3029
  call void @_Z21create_n_segment_pathP6objectii(ptr noundef %678, i32 noundef 7, i32 noundef %682), !dbg !3031
  %683 = load ptr, ptr %19, align 8, !dbg !3032
  %684 = getelementptr inbounds nuw %struct.ai_local, ptr %683, i32 0, i32 3, !dbg !3033
  store i32 4, ptr %684, align 4, !dbg !3034
  %685 = load ptr, ptr %9, align 8, !dbg !3035
  %686 = getelementptr inbounds nuw %struct.ai_static, ptr %685, i32 0, i32 4, !dbg !3037
  %687 = load i16, ptr %686, align 4, !dbg !3037
  %688 = sext i16 %687 to i32, !dbg !3035
  %689 = icmp slt i32 %688, 1, !dbg !3038
  br i1 %689, label %690, label %695, !dbg !3038

690:                                              ; preds = %677
  %691 = load ptr, ptr %9, align 8, !dbg !3039
  %692 = getelementptr inbounds nuw %struct.ai_static, ptr %691, i32 0, i32 0, !dbg !3041
  store i8 -127, ptr %692, align 4, !dbg !3042
  %693 = load ptr, ptr %19, align 8, !dbg !3043
  %694 = getelementptr inbounds nuw %struct.ai_local, ptr %693, i32 0, i32 3, !dbg !3044
  store i32 0, ptr %694, align 4, !dbg !3045
  br label %826, !dbg !3046

695:                                              ; preds = %677
  br label %696, !dbg !3047

696:                                              ; preds = %695, %664
  br label %783, !dbg !3048

697:                                              ; preds = %659
    #dbg_declare(ptr %30, !3049, !DIExpression(), !3051)
    #dbg_declare(ptr %31, !3052, !DIExpression(), !3053)
    #dbg_declare(ptr %32, !3054, !DIExpression(), !3055)
    #dbg_declare(ptr %33, !3056, !DIExpression(), !3057)
    #dbg_declare(ptr %34, !3058, !DIExpression(), !3059)
  %698 = load ptr, ptr %9, align 8, !dbg !3060
  %699 = getelementptr inbounds nuw %struct.ai_static, ptr %698, i32 0, i32 5, !dbg !3062
  %700 = load i8, ptr %699, align 2, !dbg !3062
  %701 = sext i8 %700 to i32, !dbg !3060
  %702 = load ptr, ptr %9, align 8, !dbg !3063
  %703 = getelementptr inbounds nuw %struct.ai_static, ptr %702, i32 0, i32 4, !dbg !3064
  %704 = load i16, ptr %703, align 4, !dbg !3064
  %705 = sext i16 %704 to i32, !dbg !3063
  %706 = sub nsw i32 %701, %705, !dbg !3065
  %707 = call i32 @llvm.abs.i32(i32 %706, i1 true), !dbg !3066
  %708 = load ptr, ptr %9, align 8, !dbg !3067
  %709 = getelementptr inbounds nuw %struct.ai_static, ptr %708, i32 0, i32 5, !dbg !3068
  %710 = load i8, ptr %709, align 2, !dbg !3068
  %711 = sext i8 %710 to i32, !dbg !3067
  %712 = icmp slt i32 %707, %711, !dbg !3069
  br i1 %712, label %713, label %714, !dbg !3069

713:                                              ; preds = %697
  store i32 0, ptr %30, align 4, !dbg !3070
  br label %720, !dbg !3072

714:                                              ; preds = %697
  %715 = load ptr, ptr %9, align 8, !dbg !3073
  %716 = getelementptr inbounds nuw %struct.ai_static, ptr %715, i32 0, i32 4, !dbg !3075
  %717 = load i16, ptr %716, align 4, !dbg !3075
  %718 = sext i16 %717 to i32, !dbg !3073
  %719 = sub nsw i32 %718, 1, !dbg !3076
  store i32 %719, ptr %30, align 4, !dbg !3077
  br label %720

720:                                              ; preds = %714, %713
  %721 = load ptr, ptr %9, align 8, !dbg !3078
  %722 = getelementptr inbounds nuw %struct.ai_static, ptr %721, i32 0, i32 3, !dbg !3079
  %723 = load i16, ptr %722, align 2, !dbg !3079
  %724 = sext i16 %723 to i32, !dbg !3078
  %725 = load i32, ptr %30, align 4, !dbg !3080
  %726 = add nsw i32 %724, %725, !dbg !3081
  %727 = sext i32 %726 to i64, !dbg !3082
  %728 = getelementptr inbounds [2500 x %struct.point_seg], ptr @Point_segs, i64 0, i64 %727, !dbg !3082
  %729 = getelementptr inbounds nuw %struct.point_seg, ptr %728, i32 0, i32 1, !dbg !3083
  store ptr %729, ptr %31, align 8, !dbg !3084
  %730 = load ptr, ptr %5, align 8, !dbg !3085
  %731 = getelementptr inbounds nuw %struct.object, ptr %730, i32 0, i32 11, !dbg !3086
  %732 = getelementptr inbounds nuw %struct.fvi_query, ptr %34, i32 0, i32 0, !dbg !3087
  store ptr %731, ptr %732, align 8, !dbg !3088
  %733 = load ptr, ptr %5, align 8, !dbg !3089
  %734 = getelementptr inbounds nuw %struct.object, ptr %733, i32 0, i32 9, !dbg !3090
  %735 = load i16, ptr %734, align 2, !dbg !3090
  %736 = sext i16 %735 to i32, !dbg !3089
  %737 = getelementptr inbounds nuw %struct.fvi_query, ptr %34, i32 0, i32 2, !dbg !3091
  store i32 %736, ptr %737, align 8, !dbg !3092
  %738 = load ptr, ptr %31, align 8, !dbg !3093
  %739 = getelementptr inbounds nuw %struct.fvi_query, ptr %34, i32 0, i32 1, !dbg !3094
  store ptr %738, ptr %739, align 8, !dbg !3095
  %740 = load ptr, ptr %5, align 8, !dbg !3096
  %741 = getelementptr inbounds nuw %struct.object, ptr %740, i32 0, i32 13, !dbg !3097
  %742 = load i32, ptr %741, align 4, !dbg !3097
  %743 = getelementptr inbounds nuw %struct.fvi_query, ptr %34, i32 0, i32 3, !dbg !3098
  store i32 %742, ptr %743, align 4, !dbg !3099
  %744 = load ptr, ptr %5, align 8, !dbg !3100
  %745 = ptrtoint ptr %744 to i64, !dbg !3101
  %746 = sub i64 %745, ptrtoint (ptr @Objects to i64), !dbg !3101
  %747 = sdiv exact i64 %746, 268, !dbg !3101
  %748 = trunc i64 %747 to i16, !dbg !3100
  %749 = getelementptr inbounds nuw %struct.fvi_query, ptr %34, i32 0, i32 4, !dbg !3102
  store i16 %748, ptr %749, align 8, !dbg !3103
  %750 = getelementptr inbounds nuw %struct.fvi_query, ptr %34, i32 0, i32 5, !dbg !3104
  store ptr null, ptr %750, align 8, !dbg !3105
  %751 = getelementptr inbounds nuw %struct.fvi_query, ptr %34, i32 0, i32 6, !dbg !3106
  store i32 0, ptr %751, align 8, !dbg !3107
  %752 = call noundef i32 @_Z24find_vector_intersectionP9fvi_queryP8fvi_info(ptr noundef %34, ptr noundef %32), !dbg !3108
  store i32 %752, ptr %33, align 4, !dbg !3109
  %753 = load i32, ptr %33, align 4, !dbg !3110
  %754 = icmp ne i32 %753, 1, !dbg !3112
  br i1 %754, label %755, label %760, !dbg !3112

755:                                              ; preds = %720
  %756 = load i32, ptr %30, align 4, !dbg !3113
  %757 = trunc i32 %756 to i8, !dbg !3113
  %758 = load ptr, ptr %9, align 8, !dbg !3115
  %759 = getelementptr inbounds nuw %struct.ai_static, ptr %758, i32 0, i32 5, !dbg !3116
  store i8 %757, ptr %759, align 2, !dbg !3117
  br label %782, !dbg !3118

760:                                              ; preds = %720
  %761 = load ptr, ptr %9, align 8, !dbg !3119
  %762 = getelementptr inbounds nuw %struct.ai_static, ptr %761, i32 0, i32 1, !dbg !3121
  %763 = getelementptr inbounds [11 x i8], ptr %762, i64 0, i64 3, !dbg !3119
  %764 = load i8, ptr %763, align 1, !dbg !3119
  %765 = sext i8 %764 to i32, !dbg !3119
  %766 = sub nsw i32 0, %765, !dbg !3122
  %767 = trunc i32 %766 to i8, !dbg !3122
  %768 = load ptr, ptr %9, align 8, !dbg !3123
  %769 = getelementptr inbounds nuw %struct.ai_static, ptr %768, i32 0, i32 1, !dbg !3124
  %770 = getelementptr inbounds [11 x i8], ptr %769, i64 0, i64 3, !dbg !3123
  store i8 %767, ptr %770, align 1, !dbg !3125
  %771 = load ptr, ptr %9, align 8, !dbg !3126
  %772 = getelementptr inbounds nuw %struct.ai_static, ptr %771, i32 0, i32 1, !dbg !3127
  %773 = getelementptr inbounds [11 x i8], ptr %772, i64 0, i64 3, !dbg !3126
  %774 = load i8, ptr %773, align 1, !dbg !3126
  %775 = sext i8 %774 to i32, !dbg !3126
  %776 = load ptr, ptr %9, align 8, !dbg !3128
  %777 = getelementptr inbounds nuw %struct.ai_static, ptr %776, i32 0, i32 5, !dbg !3129
  %778 = load i8, ptr %777, align 2, !dbg !3130
  %779 = sext i8 %778 to i32, !dbg !3130
  %780 = add nsw i32 %779, %775, !dbg !3130
  %781 = trunc i32 %780 to i8, !dbg !3130
  store i8 %781, ptr %777, align 2, !dbg !3130
  br label %782

782:                                              ; preds = %760, %755
  br label %783

783:                                              ; preds = %782, %696
  br label %784

784:                                              ; preds = %783, %658
  br label %785

785:                                              ; preds = %784
  br label %786

786:                                              ; preds = %785, %584
  br label %822, !dbg !3131

787:                                              ; preds = %506
  %788 = load ptr, ptr %9, align 8, !dbg !3132
  %789 = getelementptr inbounds nuw %struct.ai_static, ptr %788, i32 0, i32 3, !dbg !3134
  %790 = load i16, ptr %789, align 2, !dbg !3134
  %791 = sext i16 %790 to i32, !dbg !3132
  %792 = load ptr, ptr %9, align 8, !dbg !3135
  %793 = getelementptr inbounds nuw %struct.ai_static, ptr %792, i32 0, i32 5, !dbg !3136
  %794 = load i8, ptr %793, align 2, !dbg !3136
  %795 = sext i8 %794 to i32, !dbg !3135
  %796 = add nsw i32 %791, %795, !dbg !3137
  %797 = sext i32 %796 to i64, !dbg !3138
  %798 = getelementptr inbounds [2500 x %struct.point_seg], ptr @Point_segs, i64 0, i64 %797, !dbg !3138
  %799 = getelementptr inbounds nuw %struct.point_seg, ptr %798, i32 0, i32 1, !dbg !3139
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %11, ptr align 4 %799, i64 12, i1 false), !dbg !3140
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %10, ptr align 4 %11, i64 12, i1 false), !dbg !3141
  %800 = load ptr, ptr %5, align 8, !dbg !3142
  %801 = getelementptr inbounds nuw %struct.object, ptr %800, i32 0, i32 11, !dbg !3143
  %802 = call noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef %10, ptr noundef %801), !dbg !3144
  store i32 %802, ptr %12, align 4, !dbg !3145
  br label %803

803:                                              ; preds = %787
  %804 = load ptr, ptr %9, align 8, !dbg !3146
  %805 = getelementptr inbounds nuw %struct.ai_static, ptr %804, i32 0, i32 5, !dbg !3148
  %806 = load i8, ptr %805, align 2, !dbg !3148
  %807 = sext i8 %806 to i32, !dbg !3146
  %808 = load i32, ptr %16, align 4, !dbg !3149
  %809 = icmp eq i32 %807, %808, !dbg !3150
  br i1 %809, label %810, label %820, !dbg !3151

810:                                              ; preds = %803
  %811 = load ptr, ptr %9, align 8, !dbg !3152
  %812 = getelementptr inbounds nuw %struct.ai_static, ptr %811, i32 0, i32 1, !dbg !3153
  %813 = getelementptr inbounds [11 x i8], ptr %812, i64 0, i64 3, !dbg !3152
  %814 = load i8, ptr %813, align 1, !dbg !3152
  %815 = sext i8 %814 to i32, !dbg !3152
  %816 = load i32, ptr %15, align 4, !dbg !3154
  %817 = icmp eq i32 %815, %816, !dbg !3155
  br i1 %817, label %818, label %820, !dbg !3151

818:                                              ; preds = %810
  %819 = load ptr, ptr %5, align 8, !dbg !3156
  call void @_Z21create_path_to_playerP6objectii(ptr noundef %819, i32 noundef 3, i32 noundef 1), !dbg !3158
  store i32 1, ptr %14, align 4, !dbg !3159
  br label %820, !dbg !3160

820:                                              ; preds = %818, %810, %803
  br label %475, !dbg !2884, !llvm.loop !3161

821:                                              ; preds = %483
  br label %822, !dbg !3163

822:                                              ; preds = %821, %786
  %823 = load ptr, ptr %5, align 8, !dbg !3163
  %824 = load i32, ptr %6, align 4, !dbg !3164
  %825 = load ptr, ptr %8, align 8, !dbg !3165
  call void @_Z26ai_path_set_orient_and_velP6objectP10vms_vectoriS2_(ptr noundef %823, ptr noundef %10, i32 noundef %824, ptr noundef %825), !dbg !3166
  br label %826, !dbg !3167

826:                                              ; preds = %822, %690, %654, %627, %550, %523, %301, %278, %222, %156
  ret void, !dbg !3167
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z23ai_path_garbage_collectv() #0 !dbg !3168 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca [350 x %struct.obj_path], align 2
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
    #dbg_declare(ptr %1, !3169, !DIExpression(), !3170)
  store i32 0, ptr %1, align 4, !dbg !3170
    #dbg_declare(ptr %2, !3171, !DIExpression(), !3172)
  store i32 0, ptr %2, align 4, !dbg !3172
    #dbg_declare(ptr %3, !3173, !DIExpression(), !3174)
    #dbg_declare(ptr %4, !3175, !DIExpression(), !3176)
    #dbg_declare(ptr %5, !3177, !DIExpression(), !3186)
  call void @_Z25force_dump_ai_objects_allPKc(ptr noundef @.str.23), !dbg !3187
  %14 = load i32, ptr @FrameCount, align 4, !dbg !3188
  store i32 %14, ptr @Last_frame_garbage_collected, align 4, !dbg !3189
  store i32 0, ptr %3, align 4, !dbg !3190
  br label %15, !dbg !3192

15:                                               ; preds = %64, %0
  %16 = load i32, ptr %3, align 4, !dbg !3193
  %17 = load i32, ptr @Highest_object_index, align 4, !dbg !3195
  %18 = icmp sle i32 %16, %17, !dbg !3196
  br i1 %18, label %19, label %67, !dbg !3197

19:                                               ; preds = %15
    #dbg_declare(ptr %6, !3198, !DIExpression(), !3200)
  %20 = load i32, ptr %3, align 4, !dbg !3201
  %21 = sext i32 %20 to i64, !dbg !3202
  %22 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %21, !dbg !3202
  store ptr %22, ptr %6, align 8, !dbg !3200
  %23 = load ptr, ptr %6, align 8, !dbg !3203
  %24 = getelementptr inbounds nuw %struct.object, ptr %23, i32 0, i32 1, !dbg !3205
  %25 = load i8, ptr %24, align 4, !dbg !3205
  %26 = zext i8 %25 to i32, !dbg !3203
  %27 = icmp eq i32 %26, 2, !dbg !3206
  br i1 %27, label %28, label %63, !dbg !3207

28:                                               ; preds = %19
  %29 = load ptr, ptr %6, align 8, !dbg !3208
  %30 = getelementptr inbounds nuw %struct.object, ptr %29, i32 0, i32 5, !dbg !3209
  %31 = load i8, ptr %30, align 2, !dbg !3209
  %32 = zext i8 %31 to i32, !dbg !3208
  %33 = icmp eq i32 %32, 1, !dbg !3210
  br i1 %33, label %40, label %34, !dbg !3211

34:                                               ; preds = %28
  %35 = load ptr, ptr %6, align 8, !dbg !3212
  %36 = getelementptr inbounds nuw %struct.object, ptr %35, i32 0, i32 5, !dbg !3213
  %37 = load i8, ptr %36, align 2, !dbg !3213
  %38 = zext i8 %37 to i32, !dbg !3212
  %39 = icmp eq i32 %38, 11, !dbg !3214
  br i1 %39, label %40, label %63, !dbg !3207

40:                                               ; preds = %34, %28
    #dbg_declare(ptr %7, !3215, !DIExpression(), !3217)
  %41 = load ptr, ptr %6, align 8, !dbg !3218
  %42 = getelementptr inbounds nuw %struct.object, ptr %41, i32 0, i32 22, !dbg !3219
  store ptr %42, ptr %7, align 8, !dbg !3217
  %43 = load ptr, ptr %7, align 8, !dbg !3220
  %44 = getelementptr inbounds nuw %struct.ai_static, ptr %43, i32 0, i32 4, !dbg !3222
  %45 = load i16, ptr %44, align 4, !dbg !3222
  %46 = icmp ne i16 %45, 0, !dbg !3220
  br i1 %46, label %47, label %62, !dbg !3220

47:                                               ; preds = %40
  %48 = load ptr, ptr %7, align 8, !dbg !3223
  %49 = getelementptr inbounds nuw %struct.ai_static, ptr %48, i32 0, i32 3, !dbg !3225
  %50 = load i16, ptr %49, align 2, !dbg !3225
  %51 = load i32, ptr %2, align 4, !dbg !3226
  %52 = sext i32 %51 to i64, !dbg !3227
  %53 = getelementptr inbounds [350 x %struct.obj_path], ptr %5, i64 0, i64 %52, !dbg !3227
  %54 = getelementptr inbounds nuw %struct.obj_path, ptr %53, i32 0, i32 0, !dbg !3228
  store i16 %50, ptr %54, align 2, !dbg !3229
  %55 = load i32, ptr %3, align 4, !dbg !3230
  %56 = trunc i32 %55 to i16, !dbg !3230
  %57 = load i32, ptr %2, align 4, !dbg !3231
  %58 = add nsw i32 %57, 1, !dbg !3231
  store i32 %58, ptr %2, align 4, !dbg !3231
  %59 = sext i32 %57 to i64, !dbg !3232
  %60 = getelementptr inbounds [350 x %struct.obj_path], ptr %5, i64 0, i64 %59, !dbg !3232
  %61 = getelementptr inbounds nuw %struct.obj_path, ptr %60, i32 0, i32 1, !dbg !3233
  store i16 %56, ptr %61, align 2, !dbg !3234
  br label %62, !dbg !3235

62:                                               ; preds = %47, %40
  br label %63, !dbg !3236

63:                                               ; preds = %62, %34, %19
  br label %64, !dbg !3237

64:                                               ; preds = %63
  %65 = load i32, ptr %3, align 4, !dbg !3238
  %66 = add nsw i32 %65, 1, !dbg !3238
  store i32 %66, ptr %3, align 4, !dbg !3238
  br label %15, !dbg !3239, !llvm.loop !3240

67:                                               ; preds = %15
  %68 = getelementptr inbounds [350 x %struct.obj_path], ptr %5, i64 0, i64 0, !dbg !3242
  %69 = load i32, ptr %2, align 4, !dbg !3243
  %70 = sext i32 %69 to i64, !dbg !3243
  call void @qsort(ptr noundef %68, i64 noundef %70, i64 noundef 4, ptr noundef @_Z18path_index_compareP8obj_pathS0_), !dbg !3244
  store i32 0, ptr %4, align 4, !dbg !3245
  br label %71, !dbg !3247

71:                                               ; preds = %115, %67
  %72 = load i32, ptr %4, align 4, !dbg !3248
  %73 = load i32, ptr %2, align 4, !dbg !3250
  %74 = icmp slt i32 %72, %73, !dbg !3251
  br i1 %74, label %75, label %118, !dbg !3252

75:                                               ; preds = %71
    #dbg_declare(ptr %8, !3253, !DIExpression(), !3255)
    #dbg_declare(ptr %9, !3256, !DIExpression(), !3257)
    #dbg_declare(ptr %10, !3258, !DIExpression(), !3259)
    #dbg_declare(ptr %11, !3260, !DIExpression(), !3261)
  %76 = load i32, ptr %4, align 4, !dbg !3262
  %77 = sext i32 %76 to i64, !dbg !3263
  %78 = getelementptr inbounds [350 x %struct.obj_path], ptr %5, i64 0, i64 %77, !dbg !3263
  %79 = getelementptr inbounds nuw %struct.obj_path, ptr %78, i32 0, i32 1, !dbg !3264
  %80 = load i16, ptr %79, align 2, !dbg !3264
  %81 = sext i16 %80 to i32, !dbg !3263
  store i32 %81, ptr %3, align 4, !dbg !3265
  %82 = load i32, ptr %3, align 4, !dbg !3266
  %83 = sext i32 %82 to i64, !dbg !3267
  %84 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %83, !dbg !3267
  store ptr %84, ptr %8, align 8, !dbg !3268
  %85 = load ptr, ptr %8, align 8, !dbg !3269
  %86 = getelementptr inbounds nuw %struct.object, ptr %85, i32 0, i32 22, !dbg !3270
  store ptr %86, ptr %9, align 8, !dbg !3271
  %87 = load ptr, ptr %9, align 8, !dbg !3272
  %88 = getelementptr inbounds nuw %struct.ai_static, ptr %87, i32 0, i32 3, !dbg !3273
  %89 = load i16, ptr %88, align 2, !dbg !3273
  %90 = sext i16 %89 to i32, !dbg !3272
  store i32 %90, ptr %11, align 4, !dbg !3274
  %91 = load i32, ptr %1, align 4, !dbg !3275
  %92 = trunc i32 %91 to i16, !dbg !3275
  %93 = load ptr, ptr %9, align 8, !dbg !3276
  %94 = getelementptr inbounds nuw %struct.ai_static, ptr %93, i32 0, i32 3, !dbg !3277
  store i16 %92, ptr %94, align 2, !dbg !3278
  store i32 0, ptr %10, align 4, !dbg !3279
  br label %95, !dbg !3281

95:                                               ; preds = %111, %75
  %96 = load i32, ptr %10, align 4, !dbg !3282
  %97 = load ptr, ptr %9, align 8, !dbg !3284
  %98 = getelementptr inbounds nuw %struct.ai_static, ptr %97, i32 0, i32 4, !dbg !3285
  %99 = load i16, ptr %98, align 4, !dbg !3285
  %100 = sext i16 %99 to i32, !dbg !3284
  %101 = icmp slt i32 %96, %100, !dbg !3286
  br i1 %101, label %102, label %114, !dbg !3287

102:                                              ; preds = %95
  %103 = load i32, ptr %11, align 4, !dbg !3288
  %104 = add nsw i32 %103, 1, !dbg !3288
  store i32 %104, ptr %11, align 4, !dbg !3288
  %105 = sext i32 %103 to i64, !dbg !3289
  %106 = getelementptr inbounds [2500 x %struct.point_seg], ptr @Point_segs, i64 0, i64 %105, !dbg !3289
  %107 = load i32, ptr %1, align 4, !dbg !3290
  %108 = add nsw i32 %107, 1, !dbg !3290
  store i32 %108, ptr %1, align 4, !dbg !3290
  %109 = sext i32 %107 to i64, !dbg !3291
  %110 = getelementptr inbounds [2500 x %struct.point_seg], ptr @Point_segs, i64 0, i64 %109, !dbg !3291
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %110, ptr align 4 %106, i64 16, i1 false), !dbg !3292
  br label %111, !dbg !3291

111:                                              ; preds = %102
  %112 = load i32, ptr %10, align 4, !dbg !3293
  %113 = add nsw i32 %112, 1, !dbg !3293
  store i32 %113, ptr %10, align 4, !dbg !3293
  br label %95, !dbg !3294, !llvm.loop !3295

114:                                              ; preds = %95
  br label %115, !dbg !3297

115:                                              ; preds = %114
  %116 = load i32, ptr %4, align 4, !dbg !3298
  %117 = add nsw i32 %116, 1, !dbg !3298
  store i32 %117, ptr %4, align 4, !dbg !3298
  br label %71, !dbg !3299, !llvm.loop !3300

118:                                              ; preds = %71
  %119 = load i32, ptr %1, align 4, !dbg !3302
  %120 = sext i32 %119 to i64, !dbg !3303
  %121 = getelementptr inbounds [2500 x %struct.point_seg], ptr @Point_segs, i64 0, i64 %120, !dbg !3303
  store ptr %121, ptr @Point_segs_free_ptr, align 8, !dbg !3304
    #dbg_declare(ptr %12, !3305, !DIExpression(), !3307)
  call void @_Z25force_dump_ai_objects_allPKc(ptr noundef @.str.24), !dbg !3308
  store i32 0, ptr %12, align 4, !dbg !3309
  br label %122, !dbg !3311

122:                                              ; preds = %171, %118
  %123 = load i32, ptr %12, align 4, !dbg !3312
  %124 = load i32, ptr @Highest_object_index, align 4, !dbg !3314
  %125 = icmp sle i32 %123, %124, !dbg !3315
  br i1 %125, label %126, label %174, !dbg !3316

126:                                              ; preds = %122
    #dbg_declare(ptr %13, !3317, !DIExpression(), !3319)
  %127 = load i32, ptr %12, align 4, !dbg !3320
  %128 = sext i32 %127 to i64, !dbg !3321
  %129 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %128, !dbg !3321
  %130 = getelementptr inbounds nuw %struct.object, ptr %129, i32 0, i32 22, !dbg !3322
  store ptr %130, ptr %13, align 8, !dbg !3319
  %131 = load i32, ptr %12, align 4, !dbg !3323
  %132 = sext i32 %131 to i64, !dbg !3325
  %133 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %132, !dbg !3325
  %134 = getelementptr inbounds nuw %struct.object, ptr %133, i32 0, i32 1, !dbg !3326
  %135 = load i8, ptr %134, align 4, !dbg !3326
  %136 = zext i8 %135 to i32, !dbg !3325
  %137 = icmp eq i32 %136, 2, !dbg !3327
  br i1 %137, label %138, label %170, !dbg !3328

138:                                              ; preds = %126
  %139 = load i32, ptr %12, align 4, !dbg !3329
  %140 = sext i32 %139 to i64, !dbg !3330
  %141 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %140, !dbg !3330
  %142 = getelementptr inbounds nuw %struct.object, ptr %141, i32 0, i32 5, !dbg !3331
  %143 = load i8, ptr %142, align 2, !dbg !3331
  %144 = zext i8 %143 to i32, !dbg !3330
  %145 = icmp eq i32 %144, 1, !dbg !3332
  br i1 %145, label %146, label %170, !dbg !3328

146:                                              ; preds = %138
  %147 = load ptr, ptr %13, align 8, !dbg !3333
  %148 = getelementptr inbounds nuw %struct.ai_static, ptr %147, i32 0, i32 3, !dbg !3335
  %149 = load i16, ptr %148, align 2, !dbg !3335
  %150 = sext i16 %149 to i32, !dbg !3333
  %151 = load ptr, ptr %13, align 8, !dbg !3336
  %152 = getelementptr inbounds nuw %struct.ai_static, ptr %151, i32 0, i32 4, !dbg !3337
  %153 = load i16, ptr %152, align 4, !dbg !3337
  %154 = sext i16 %153 to i32, !dbg !3336
  %155 = add nsw i32 %150, %154, !dbg !3338
  %156 = sext i32 %155 to i64, !dbg !3333
  %157 = load ptr, ptr @Point_segs_free_ptr, align 8, !dbg !3339
  %158 = ptrtoint ptr %157 to i64, !dbg !3340
  %159 = sub i64 %158, ptrtoint (ptr @Point_segs to i64), !dbg !3340
  %160 = sdiv exact i64 %159, 16, !dbg !3340
  %161 = icmp sgt i64 %156, %160, !dbg !3341
  br i1 %161, label %162, label %169, !dbg !3342

162:                                              ; preds = %146
  %163 = load ptr, ptr %13, align 8, !dbg !3343
  %164 = getelementptr inbounds nuw %struct.ai_static, ptr %163, i32 0, i32 4, !dbg !3344
  %165 = load i16, ptr %164, align 4, !dbg !3344
  %166 = sext i16 %165 to i32, !dbg !3343
  %167 = icmp sgt i32 %166, 0, !dbg !3345
  br i1 %167, label %168, label %169, !dbg !3342

168:                                              ; preds = %162
  call void @_Z4Int3v(), !dbg !3346
  br label %169, !dbg !3346

169:                                              ; preds = %168, %162, %146
  br label %170, !dbg !3347

170:                                              ; preds = %169, %138, %126
  br label %171, !dbg !3348

171:                                              ; preds = %170
  %172 = load i32, ptr %12, align 4, !dbg !3349
  %173 = add nsw i32 %172, 1, !dbg !3349
  store i32 %173, ptr %12, align 4, !dbg !3349
  br label %122, !dbg !3350, !llvm.loop !3351

174:                                              ; preds = %122
  call void @_Z18validate_all_pathsv(), !dbg !3353
  ret void, !dbg !3354
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z6fixdivii(i32 noundef %0, i32 noundef %1) #3 !dbg !3355 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
    #dbg_declare(ptr %4, !3356, !DIExpression(), !3357)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !3358, !DIExpression(), !3359)
  %6 = load i32, ptr %5, align 4, !dbg !3360
  %7 = icmp eq i32 %6, 0, !dbg !3362
  br i1 %7, label %8, label %9, !dbg !3362

8:                                                ; preds = %2
  store i32 1, ptr %3, align 4, !dbg !3363
  br label %17, !dbg !3363

9:                                                ; preds = %2
  %10 = load i32, ptr %4, align 4, !dbg !3364
  %11 = sext i32 %10 to i64, !dbg !3364
  %12 = shl i64 %11, 16, !dbg !3365
  %13 = load i32, ptr %5, align 4, !dbg !3366
  %14 = sext i32 %13 to i64, !dbg !3366
  %15 = sdiv i64 %12, %14, !dbg !3367
  %16 = trunc i64 %15 to i32, !dbg !3368
  store i32 %16, ptr %3, align 4, !dbg !3369
  br label %17, !dbg !3369

17:                                               ; preds = %9, %8
  %18 = load i32, ptr %3, align 4, !dbg !3370
  ret i32 %18, !dbg !3370
}

declare noundef ptr @_Z12vm_vec_scaleP10vms_vectori(ptr noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z26ai_path_set_orient_and_velP6objectP10vms_vectoriS2_(ptr noundef %0, ptr noundef %1, i32 noundef %2, ptr noundef %3) #0 !dbg !3371 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca %struct.vms_vector, align 4
  %10 = alloca %struct.vms_vector, align 4
  %11 = alloca %struct.vms_vector, align 4
  %12 = alloca %struct.vms_vector, align 4
  %13 = alloca %struct.vms_vector, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca ptr, align 8
  %17 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
    #dbg_declare(ptr %5, !3374, !DIExpression(), !3375)
  store ptr %1, ptr %6, align 8
    #dbg_declare(ptr %6, !3376, !DIExpression(), !3377)
  store i32 %2, ptr %7, align 4
    #dbg_declare(ptr %7, !3378, !DIExpression(), !3379)
  store ptr %3, ptr %8, align 8
    #dbg_declare(ptr %8, !3380, !DIExpression(), !3381)
    #dbg_declare(ptr %9, !3382, !DIExpression(), !3383)
  %18 = load ptr, ptr %5, align 8, !dbg !3384
  %19 = getelementptr inbounds nuw %struct.object, ptr %18, i32 0, i32 21, !dbg !3385
  %20 = getelementptr inbounds nuw %struct.physics_info, ptr %19, i32 0, i32 0, !dbg !3386
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %9, ptr align 4 %20, i64 12, i1 false), !dbg !3384
    #dbg_declare(ptr %10, !3387, !DIExpression(), !3388)
    #dbg_declare(ptr %11, !3389, !DIExpression(), !3390)
    #dbg_declare(ptr %12, !3391, !DIExpression(), !3392)
  %21 = load ptr, ptr %5, align 8, !dbg !3393
  %22 = getelementptr inbounds nuw %struct.object, ptr %21, i32 0, i32 11, !dbg !3394
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %12, ptr align 4 %22, i64 12, i1 false), !dbg !3393
    #dbg_declare(ptr %13, !3395, !DIExpression(), !3396)
    #dbg_declare(ptr %14, !3397, !DIExpression(), !3398)
    #dbg_declare(ptr %15, !3399, !DIExpression(), !3400)
    #dbg_declare(ptr %16, !3401, !DIExpression(), !3402)
  %23 = load ptr, ptr %5, align 8, !dbg !3403
  %24 = getelementptr inbounds nuw %struct.object, ptr %23, i32 0, i32 2, !dbg !3404
  %25 = load i8, ptr %24, align 1, !dbg !3404
  %26 = zext i8 %25 to i64, !dbg !3405
  %27 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %26, !dbg !3405
  store ptr %27, ptr %16, align 8, !dbg !3402
    #dbg_declare(ptr %17, !3406, !DIExpression(), !3407)
  %28 = load ptr, ptr %16, align 8, !dbg !3408
  %29 = getelementptr inbounds nuw %struct.robot_info, ptr %28, i32 0, i32 26, !dbg !3409
  %30 = load i32, ptr @Difficulty_level, align 4, !dbg !3410
  %31 = sext i32 %30 to i64, !dbg !3408
  %32 = getelementptr inbounds [5 x i32], ptr %29, i64 0, i64 %31, !dbg !3408
  %33 = load i32, ptr %32, align 4, !dbg !3408
  store i32 %33, ptr %17, align 4, !dbg !3411
  %34 = load ptr, ptr %5, align 8, !dbg !3412
  %35 = ptrtoint ptr %34 to i64, !dbg !3414
  %36 = sub i64 %35, ptrtoint (ptr @Objects to i64), !dbg !3414
  %37 = sdiv exact i64 %36, 268, !dbg !3414
  %38 = getelementptr inbounds [350 x %struct.ai_local], ptr @Ai_local_info, i64 0, i64 %37, !dbg !3415
  %39 = getelementptr inbounds nuw %struct.ai_local, ptr %38, i32 0, i32 3, !dbg !3416
  %40 = load i32, ptr %39, align 4, !dbg !3416
  %41 = icmp eq i32 %40, 4, !dbg !3417
  br i1 %41, label %49, label %42, !dbg !3418

42:                                               ; preds = %4
  %43 = load ptr, ptr %5, align 8, !dbg !3419
  %44 = getelementptr inbounds nuw %struct.object, ptr %43, i32 0, i32 22, !dbg !3420
  %45 = getelementptr inbounds nuw %struct.ai_static, ptr %44, i32 0, i32 0, !dbg !3421
  %46 = load i8, ptr %45, align 4, !dbg !3421
  %47 = zext i8 %46 to i32, !dbg !3419
  %48 = icmp eq i32 %47, 132, !dbg !3422
  br i1 %48, label %49, label %53, !dbg !3418

49:                                               ; preds = %42, %4
  %50 = load i32, ptr %17, align 4, !dbg !3423
  %51 = mul nsw i32 %50, 3, !dbg !3424
  %52 = sdiv i32 %51, 2, !dbg !3425
  store i32 %52, ptr %17, align 4, !dbg !3426
  br label %53, !dbg !3427

53:                                               ; preds = %49, %42
  %54 = load ptr, ptr %5, align 8, !dbg !3428
  %55 = ptrtoint ptr %54 to i64, !dbg !3430
  %56 = sub i64 %55, ptrtoint (ptr @Objects to i64), !dbg !3430
  %57 = sdiv exact i64 %56, 268, !dbg !3430
  %58 = icmp eq i64 %57, 50, !dbg !3431
  br i1 %58, label %59, label %99, !dbg !3431

59:                                               ; preds = %53
  %60 = load ptr, ptr @__stderrp, align 8, !dbg !3432
  %61 = getelementptr inbounds nuw %struct.vms_vector, ptr %9, i32 0, i32 0, !dbg !3434
  %62 = load i32, ptr %61, align 4, !dbg !3434
  %63 = getelementptr inbounds nuw %struct.vms_vector, ptr %9, i32 0, i32 1, !dbg !3435
  %64 = load i32, ptr %63, align 4, !dbg !3435
  %65 = getelementptr inbounds nuw %struct.vms_vector, ptr %9, i32 0, i32 2, !dbg !3436
  %66 = load i32, ptr %65, align 4, !dbg !3436
  %67 = getelementptr inbounds nuw %struct.vms_vector, ptr %12, i32 0, i32 0, !dbg !3437
  %68 = load i32, ptr %67, align 4, !dbg !3437
  %69 = getelementptr inbounds nuw %struct.vms_vector, ptr %12, i32 0, i32 1, !dbg !3438
  %70 = load i32, ptr %69, align 4, !dbg !3438
  %71 = getelementptr inbounds nuw %struct.vms_vector, ptr %12, i32 0, i32 2, !dbg !3439
  %72 = load i32, ptr %71, align 4, !dbg !3439
  %73 = load ptr, ptr %5, align 8, !dbg !3440
  %74 = getelementptr inbounds nuw %struct.object, ptr %73, i32 0, i32 12, !dbg !3441
  %75 = getelementptr inbounds nuw %struct.vms_matrix, ptr %74, i32 0, i32 2, !dbg !3442
  %76 = getelementptr inbounds nuw %struct.vms_vector, ptr %75, i32 0, i32 0, !dbg !3443
  %77 = load i32, ptr %76, align 4, !dbg !3443
  %78 = load ptr, ptr %5, align 8, !dbg !3444
  %79 = getelementptr inbounds nuw %struct.object, ptr %78, i32 0, i32 12, !dbg !3445
  %80 = getelementptr inbounds nuw %struct.vms_matrix, ptr %79, i32 0, i32 2, !dbg !3446
  %81 = getelementptr inbounds nuw %struct.vms_vector, ptr %80, i32 0, i32 1, !dbg !3447
  %82 = load i32, ptr %81, align 4, !dbg !3447
  %83 = load ptr, ptr %5, align 8, !dbg !3448
  %84 = getelementptr inbounds nuw %struct.object, ptr %83, i32 0, i32 12, !dbg !3449
  %85 = getelementptr inbounds nuw %struct.vms_matrix, ptr %84, i32 0, i32 2, !dbg !3450
  %86 = getelementptr inbounds nuw %struct.vms_vector, ptr %85, i32 0, i32 2, !dbg !3451
  %87 = load i32, ptr %86, align 4, !dbg !3451
  %88 = load ptr, ptr %6, align 8, !dbg !3452
  %89 = getelementptr inbounds nuw %struct.vms_vector, ptr %88, i32 0, i32 0, !dbg !3453
  %90 = load i32, ptr %89, align 4, !dbg !3453
  %91 = load ptr, ptr %6, align 8, !dbg !3454
  %92 = getelementptr inbounds nuw %struct.vms_vector, ptr %91, i32 0, i32 1, !dbg !3455
  %93 = load i32, ptr %92, align 4, !dbg !3455
  %94 = load ptr, ptr %6, align 8, !dbg !3456
  %95 = getelementptr inbounds nuw %struct.vms_vector, ptr %94, i32 0, i32 2, !dbg !3457
  %96 = load i32, ptr %95, align 4, !dbg !3457
  %97 = load i32, ptr %17, align 4, !dbg !3458
  %98 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %60, ptr noundef @.str.20, i32 noundef %62, i32 noundef %64, i32 noundef %66, i32 noundef %68, i32 noundef %70, i32 noundef %72, i32 noundef %77, i32 noundef %82, i32 noundef %87, i32 noundef %90, i32 noundef %93, i32 noundef %96, i32 noundef %97) #7, !dbg !3459
  br label %99, !dbg !3460

99:                                               ; preds = %59, %53
  %100 = load ptr, ptr %6, align 8, !dbg !3461
  %101 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %11, ptr noundef %100, ptr noundef %12), !dbg !3462
  %102 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %11), !dbg !3463
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %10, ptr align 4 %9, i64 12, i1 false), !dbg !3464
  %103 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %10), !dbg !3465
  %104 = load ptr, ptr %5, align 8, !dbg !3466
  %105 = getelementptr inbounds nuw %struct.object, ptr %104, i32 0, i32 12, !dbg !3467
  %106 = getelementptr inbounds nuw %struct.vms_matrix, ptr %105, i32 0, i32 2, !dbg !3468
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %13, ptr align 4 %106, i64 12, i1 false), !dbg !3469
  %107 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %13), !dbg !3470
  %108 = call noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef %11, ptr noundef %13), !dbg !3471
  store i32 %108, ptr %15, align 4, !dbg !3472
  %109 = load ptr, ptr %5, align 8, !dbg !3473
  %110 = ptrtoint ptr %109 to i64, !dbg !3475
  %111 = sub i64 %110, ptrtoint (ptr @Objects to i64), !dbg !3475
  %112 = sdiv exact i64 %111, 268, !dbg !3475
  %113 = icmp eq i64 %112, 50, !dbg !3476
  br i1 %113, label %114, label %136, !dbg !3476

114:                                              ; preds = %99
  %115 = load ptr, ptr @__stderrp, align 8, !dbg !3477
  %116 = getelementptr inbounds nuw %struct.vms_vector, ptr %11, i32 0, i32 0, !dbg !3479
  %117 = load i32, ptr %116, align 4, !dbg !3479
  %118 = getelementptr inbounds nuw %struct.vms_vector, ptr %11, i32 0, i32 1, !dbg !3480
  %119 = load i32, ptr %118, align 4, !dbg !3480
  %120 = getelementptr inbounds nuw %struct.vms_vector, ptr %11, i32 0, i32 2, !dbg !3481
  %121 = load i32, ptr %120, align 4, !dbg !3481
  %122 = getelementptr inbounds nuw %struct.vms_vector, ptr %10, i32 0, i32 0, !dbg !3482
  %123 = load i32, ptr %122, align 4, !dbg !3482
  %124 = getelementptr inbounds nuw %struct.vms_vector, ptr %10, i32 0, i32 1, !dbg !3483
  %125 = load i32, ptr %124, align 4, !dbg !3483
  %126 = getelementptr inbounds nuw %struct.vms_vector, ptr %10, i32 0, i32 2, !dbg !3484
  %127 = load i32, ptr %126, align 4, !dbg !3484
  %128 = getelementptr inbounds nuw %struct.vms_vector, ptr %13, i32 0, i32 0, !dbg !3485
  %129 = load i32, ptr %128, align 4, !dbg !3485
  %130 = getelementptr inbounds nuw %struct.vms_vector, ptr %13, i32 0, i32 1, !dbg !3486
  %131 = load i32, ptr %130, align 4, !dbg !3486
  %132 = getelementptr inbounds nuw %struct.vms_vector, ptr %13, i32 0, i32 2, !dbg !3487
  %133 = load i32, ptr %132, align 4, !dbg !3487
  %134 = load i32, ptr %15, align 4, !dbg !3488
  %135 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %115, ptr noundef @.str.21, i32 noundef %117, i32 noundef %119, i32 noundef %121, i32 noundef %123, i32 noundef %125, i32 noundef %127, i32 noundef %129, i32 noundef %131, i32 noundef %133, i32 noundef %134) #7, !dbg !3489
  br label %136, !dbg !3490

136:                                              ; preds = %114, %99
  %137 = load i32, ptr %15, align 4, !dbg !3491
  %138 = icmp slt i32 %137, -61440, !dbg !3493
  br i1 %138, label %139, label %140, !dbg !3493

139:                                              ; preds = %136
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %10, ptr align 4 %11, i64 12, i1 false), !dbg !3494
  br label %159, !dbg !3496

140:                                              ; preds = %136
  %141 = getelementptr inbounds nuw %struct.vms_vector, ptr %11, i32 0, i32 0, !dbg !3497
  %142 = load i32, ptr %141, align 4, !dbg !3497
  %143 = sdiv i32 %142, 2, !dbg !3499
  %144 = getelementptr inbounds nuw %struct.vms_vector, ptr %10, i32 0, i32 0, !dbg !3500
  %145 = load i32, ptr %144, align 4, !dbg !3501
  %146 = add nsw i32 %145, %143, !dbg !3501
  store i32 %146, ptr %144, align 4, !dbg !3501
  %147 = getelementptr inbounds nuw %struct.vms_vector, ptr %11, i32 0, i32 1, !dbg !3502
  %148 = load i32, ptr %147, align 4, !dbg !3502
  %149 = sdiv i32 %148, 2, !dbg !3503
  %150 = getelementptr inbounds nuw %struct.vms_vector, ptr %10, i32 0, i32 1, !dbg !3504
  %151 = load i32, ptr %150, align 4, !dbg !3505
  %152 = add nsw i32 %151, %149, !dbg !3505
  store i32 %152, ptr %150, align 4, !dbg !3505
  %153 = getelementptr inbounds nuw %struct.vms_vector, ptr %11, i32 0, i32 2, !dbg !3506
  %154 = load i32, ptr %153, align 4, !dbg !3506
  %155 = sdiv i32 %154, 2, !dbg !3507
  %156 = getelementptr inbounds nuw %struct.vms_vector, ptr %10, i32 0, i32 2, !dbg !3508
  %157 = load i32, ptr %156, align 4, !dbg !3509
  %158 = add nsw i32 %157, %155, !dbg !3509
  store i32 %158, ptr %156, align 4, !dbg !3509
  br label %159

159:                                              ; preds = %140, %139
  %160 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %10), !dbg !3510
  %161 = load i32, ptr %15, align 4, !dbg !3511
  %162 = icmp slt i32 %161, 0, !dbg !3513
  br i1 %162, label %163, label %166, !dbg !3513

163:                                              ; preds = %159
  %164 = load i32, ptr %15, align 4, !dbg !3514
  %165 = sdiv i32 %164, -4, !dbg !3514
  store i32 %165, ptr %15, align 4, !dbg !3514
  br label %166, !dbg !3515

166:                                              ; preds = %163, %159
  %167 = load ptr, ptr %5, align 8, !dbg !3516
  %168 = getelementptr inbounds nuw %struct.object, ptr %167, i32 0, i32 22, !dbg !3518
  %169 = getelementptr inbounds nuw %struct.ai_static, ptr %168, i32 0, i32 0, !dbg !3519
  %170 = load i8, ptr %169, align 4, !dbg !3519
  %171 = zext i8 %170 to i32, !dbg !3516
  %172 = icmp eq i32 %171, 132, !dbg !3520
  br i1 %172, label %173, label %181, !dbg !3520

173:                                              ; preds = %166
  %174 = load i32, ptr %15, align 4, !dbg !3521
  %175 = icmp slt i32 %174, 32768, !dbg !3523
  br i1 %175, label %176, label %180, !dbg !3523

176:                                              ; preds = %173
  %177 = load i32, ptr %15, align 4, !dbg !3524
  %178 = add nsw i32 %177, 65536, !dbg !3525
  %179 = sdiv i32 %178, 2, !dbg !3526
  store i32 %179, ptr %15, align 4, !dbg !3527
  br label %180, !dbg !3528

180:                                              ; preds = %176, %173
  br label %181, !dbg !3529

181:                                              ; preds = %180, %166
  %182 = load i32, ptr %17, align 4, !dbg !3530
  %183 = load i32, ptr %15, align 4, !dbg !3531
  %184 = call noundef i32 @_Z6fixmulii(i32 noundef %182, i32 noundef %183), !dbg !3532
  store i32 %184, ptr %14, align 4, !dbg !3533
  %185 = load i32, ptr %14, align 4, !dbg !3534
  %186 = call noundef ptr @_Z12vm_vec_scaleP10vms_vectori(ptr noundef %10, i32 noundef %185), !dbg !3535
  %187 = load ptr, ptr %5, align 8, !dbg !3536
  %188 = ptrtoint ptr %187 to i64, !dbg !3538
  %189 = sub i64 %188, ptrtoint (ptr @Objects to i64), !dbg !3538
  %190 = sdiv exact i64 %189, 268, !dbg !3538
  %191 = icmp eq i64 %190, 50, !dbg !3539
  br i1 %191, label %192, label %203, !dbg !3539

192:                                              ; preds = %181
  %193 = load ptr, ptr @__stderrp, align 8, !dbg !3540
  %194 = getelementptr inbounds nuw %struct.vms_vector, ptr %10, i32 0, i32 0, !dbg !3542
  %195 = load i32, ptr %194, align 4, !dbg !3542
  %196 = getelementptr inbounds nuw %struct.vms_vector, ptr %10, i32 0, i32 1, !dbg !3543
  %197 = load i32, ptr %196, align 4, !dbg !3543
  %198 = getelementptr inbounds nuw %struct.vms_vector, ptr %10, i32 0, i32 2, !dbg !3544
  %199 = load i32, ptr %198, align 4, !dbg !3544
  %200 = load i32, ptr %14, align 4, !dbg !3545
  %201 = load i32, ptr %15, align 4, !dbg !3546
  %202 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %193, ptr noundef @.str.22, i32 noundef %195, i32 noundef %197, i32 noundef %199, i32 noundef %200, i32 noundef %201) #7, !dbg !3547
  br label %203, !dbg !3548

203:                                              ; preds = %192, %181
  %204 = load ptr, ptr %5, align 8, !dbg !3549
  %205 = getelementptr inbounds nuw %struct.object, ptr %204, i32 0, i32 21, !dbg !3550
  %206 = getelementptr inbounds nuw %struct.physics_info, ptr %205, i32 0, i32 0, !dbg !3551
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %206, ptr align 4 %10, i64 12, i1 false), !dbg !3552
  %207 = load ptr, ptr %5, align 8, !dbg !3553
  %208 = ptrtoint ptr %207 to i64, !dbg !3555
  %209 = sub i64 %208, ptrtoint (ptr @Objects to i64), !dbg !3555
  %210 = sdiv exact i64 %209, 268, !dbg !3555
  %211 = getelementptr inbounds [350 x %struct.ai_local], ptr @Ai_local_info, i64 0, i64 %210, !dbg !3556
  %212 = getelementptr inbounds nuw %struct.ai_local, ptr %211, i32 0, i32 3, !dbg !3557
  %213 = load i32, ptr %212, align 4, !dbg !3557
  %214 = icmp eq i32 %213, 4, !dbg !3558
  br i1 %214, label %228, label %215, !dbg !3559

215:                                              ; preds = %203
  %216 = load ptr, ptr %16, align 8, !dbg !3560
  %217 = getelementptr inbounds nuw %struct.robot_info, ptr %216, i32 0, i32 37, !dbg !3561
  %218 = load i8, ptr %217, align 1, !dbg !3561
  %219 = sext i8 %218 to i32, !dbg !3560
  %220 = icmp eq i32 %219, 1, !dbg !3562
  br i1 %220, label %228, label %221, !dbg !3563

221:                                              ; preds = %215
  %222 = load ptr, ptr %5, align 8, !dbg !3564
  %223 = getelementptr inbounds nuw %struct.object, ptr %222, i32 0, i32 22, !dbg !3565
  %224 = getelementptr inbounds nuw %struct.ai_static, ptr %223, i32 0, i32 0, !dbg !3566
  %225 = load i8, ptr %224, align 4, !dbg !3566
  %226 = zext i8 %225 to i32, !dbg !3564
  %227 = icmp eq i32 %226, 132, !dbg !3567
  br i1 %227, label %228, label %268, !dbg !3563

228:                                              ; preds = %221, %215, %203
  %229 = load ptr, ptr %5, align 8, !dbg !3568
  %230 = ptrtoint ptr %229 to i64, !dbg !3571
  %231 = sub i64 %230, ptrtoint (ptr @Objects to i64), !dbg !3571
  %232 = sdiv exact i64 %231, 268, !dbg !3571
  %233 = getelementptr inbounds [350 x %struct.ai_local], ptr @Ai_local_info, i64 0, i64 %232, !dbg !3572
  %234 = getelementptr inbounds nuw %struct.ai_local, ptr %233, i32 0, i32 3, !dbg !3573
  %235 = load i32, ptr %234, align 4, !dbg !3573
  %236 = icmp eq i32 %235, 13, !dbg !3574
  br i1 %236, label %237, label %261, !dbg !3574

237:                                              ; preds = %228
  %238 = load i32, ptr %7, align 4, !dbg !3575
  %239 = icmp ne i32 %238, 0, !dbg !3578
  br i1 %239, label %240, label %245, !dbg !3579

240:                                              ; preds = %237
  %241 = load ptr, ptr %8, align 8, !dbg !3580
  %242 = icmp ne ptr %241, null, !dbg !3581
  br i1 %242, label %243, label %245, !dbg !3579

243:                                              ; preds = %240
  %244 = load ptr, ptr %8, align 8, !dbg !3582
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %11, ptr align 4 %244, i64 12, i1 false), !dbg !3583
  br label %260, !dbg !3584

245:                                              ; preds = %240, %237
  br label %246, !dbg !3585

246:                                              ; preds = %245
  %247 = getelementptr inbounds nuw %struct.vms_vector, ptr %11, i32 0, i32 0, !dbg !3586
  %248 = load i32, ptr %247, align 4, !dbg !3586
  %249 = sub nsw i32 0, %248, !dbg !3586
  %250 = getelementptr inbounds nuw %struct.vms_vector, ptr %11, i32 0, i32 0, !dbg !3586
  store i32 %249, ptr %250, align 4, !dbg !3586
  %251 = getelementptr inbounds nuw %struct.vms_vector, ptr %11, i32 0, i32 1, !dbg !3586
  %252 = load i32, ptr %251, align 4, !dbg !3586
  %253 = sub nsw i32 0, %252, !dbg !3586
  %254 = getelementptr inbounds nuw %struct.vms_vector, ptr %11, i32 0, i32 1, !dbg !3586
  store i32 %253, ptr %254, align 4, !dbg !3586
  %255 = getelementptr inbounds nuw %struct.vms_vector, ptr %11, i32 0, i32 2, !dbg !3586
  %256 = load i32, ptr %255, align 4, !dbg !3586
  %257 = sub nsw i32 0, %256, !dbg !3586
  %258 = getelementptr inbounds nuw %struct.vms_vector, ptr %11, i32 0, i32 2, !dbg !3586
  store i32 %257, ptr %258, align 4, !dbg !3586
  br label %259, !dbg !3586

259:                                              ; preds = %246
  br label %260

260:                                              ; preds = %259, %243
  br label %261, !dbg !3588

261:                                              ; preds = %260, %228
  %262 = load ptr, ptr %5, align 8, !dbg !3589
  %263 = load ptr, ptr %16, align 8, !dbg !3590
  %264 = getelementptr inbounds nuw %struct.robot_info, ptr %263, i32 0, i32 25, !dbg !3591
  %265 = getelementptr inbounds [5 x i32], ptr %264, i64 0, i64 4, !dbg !3590
  %266 = load i32, ptr %265, align 4, !dbg !3590
  %267 = sdiv i32 %266, 2, !dbg !3592
  call void @_Z22ai_turn_towards_vectorP10vms_vectorP6objecti(ptr noundef %11, ptr noundef %262, i32 noundef %267), !dbg !3593
  br label %276, !dbg !3594

268:                                              ; preds = %221
  %269 = load ptr, ptr %5, align 8, !dbg !3595
  %270 = load ptr, ptr %16, align 8, !dbg !3596
  %271 = getelementptr inbounds nuw %struct.robot_info, ptr %270, i32 0, i32 25, !dbg !3597
  %272 = load i32, ptr @Difficulty_level, align 4, !dbg !3598
  %273 = sext i32 %272 to i64, !dbg !3596
  %274 = getelementptr inbounds [5 x i32], ptr %271, i64 0, i64 %273, !dbg !3596
  %275 = load i32, ptr %274, align 4, !dbg !3596
  call void @_Z22ai_turn_towards_vectorP10vms_vectorP6objecti(ptr noundef %11, ptr noundef %269, i32 noundef %275), !dbg !3599
  br label %276

276:                                              ; preds = %268, %261
  ret void, !dbg !3600
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define noundef i32 @_Z18path_index_compareP8obj_pathS0_(ptr noundef %0, ptr noundef %1) #3 !dbg !3601 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !3605, !DIExpression(), !3606)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !3607, !DIExpression(), !3608)
  %6 = load ptr, ptr %4, align 8, !dbg !3609
  %7 = getelementptr inbounds nuw %struct.obj_path, ptr %6, i32 0, i32 0, !dbg !3611
  %8 = load i16, ptr %7, align 2, !dbg !3611
  %9 = sext i16 %8 to i32, !dbg !3609
  %10 = load ptr, ptr %5, align 8, !dbg !3612
  %11 = getelementptr inbounds nuw %struct.obj_path, ptr %10, i32 0, i32 0, !dbg !3613
  %12 = load i16, ptr %11, align 2, !dbg !3613
  %13 = sext i16 %12 to i32, !dbg !3612
  %14 = icmp slt i32 %9, %13, !dbg !3614
  br i1 %14, label %15, label %16, !dbg !3614

15:                                               ; preds = %2
  store i32 -1, ptr %3, align 4, !dbg !3615
  br label %28, !dbg !3615

16:                                               ; preds = %2
  %17 = load ptr, ptr %4, align 8, !dbg !3616
  %18 = getelementptr inbounds nuw %struct.obj_path, ptr %17, i32 0, i32 0, !dbg !3618
  %19 = load i16, ptr %18, align 2, !dbg !3618
  %20 = sext i16 %19 to i32, !dbg !3616
  %21 = load ptr, ptr %5, align 8, !dbg !3619
  %22 = getelementptr inbounds nuw %struct.obj_path, ptr %21, i32 0, i32 0, !dbg !3620
  %23 = load i16, ptr %22, align 2, !dbg !3620
  %24 = sext i16 %23 to i32, !dbg !3619
  %25 = icmp eq i32 %20, %24, !dbg !3621
  br i1 %25, label %26, label %27, !dbg !3621

26:                                               ; preds = %16
  store i32 0, ptr %3, align 4, !dbg !3622
  br label %28, !dbg !3622

27:                                               ; preds = %16
  store i32 1, ptr %3, align 4, !dbg !3623
  br label %28, !dbg !3623

28:                                               ; preds = %27, %26, %15
  %29 = load i32, ptr %3, align 4, !dbg !3624
  ret i32 %29, !dbg !3624
}

declare void @_Z22ai_turn_towards_vectorP10vms_vectorP6objecti(ptr noundef, ptr noundef, i32 noundef) #1

declare void @_Z25force_dump_ai_objects_allPKc(ptr noundef) #1

declare void @qsort(ptr noundef, i64 noundef, i64 noundef, ptr noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z22attempt_to_resume_pathP6object(ptr noundef %0) #0 !dbg !3625 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !3628, !DIExpression(), !3629)
    #dbg_declare(ptr %3, !3630, !DIExpression(), !3631)
  %7 = load ptr, ptr %2, align 8, !dbg !3632
  %8 = getelementptr inbounds nuw %struct.object, ptr %7, i32 0, i32 22, !dbg !3633
  store ptr %8, ptr %3, align 8, !dbg !3631
    #dbg_declare(ptr %4, !3634, !DIExpression(), !3635)
    #dbg_declare(ptr %5, !3636, !DIExpression(), !3637)
  %9 = load ptr, ptr %3, align 8, !dbg !3638
  %10 = getelementptr inbounds nuw %struct.ai_static, ptr %9, i32 0, i32 0, !dbg !3640
  %11 = load i8, ptr %10, align 4, !dbg !3640
  %12 = zext i8 %11 to i32, !dbg !3638
  %13 = icmp eq i32 %12, 133, !dbg !3641
  br i1 %13, label %14, label %45, !dbg !3642

14:                                               ; preds = %1
  %15 = load ptr, ptr %2, align 8, !dbg !3643
  %16 = getelementptr inbounds nuw %struct.object, ptr %15, i32 0, i32 2, !dbg !3644
  %17 = load i8, ptr %16, align 1, !dbg !3644
  %18 = zext i8 %17 to i64, !dbg !3645
  %19 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %18, !dbg !3645
  %20 = getelementptr inbounds nuw %struct.robot_info, ptr %19, i32 0, i32 37, !dbg !3646
  %21 = load i8, ptr %20, align 1, !dbg !3646
  %22 = sext i8 %21 to i32, !dbg !3645
  %23 = icmp ne i32 %22, 1, !dbg !3647
  br i1 %23, label %24, label %45, !dbg !3642

24:                                               ; preds = %14
  %25 = call noundef i32 @_Z6P_Randv(), !dbg !3648
  %26 = icmp sgt i32 %25, 8192, !dbg !3650
  br i1 %26, label %27, label %44, !dbg !3650

27:                                               ; preds = %24
    #dbg_declare(ptr %6, !3651, !DIExpression(), !3653)
  %28 = load ptr, ptr %2, align 8, !dbg !3654
  %29 = ptrtoint ptr %28 to i64, !dbg !3655
  %30 = sub i64 %29, ptrtoint (ptr @Objects to i64), !dbg !3655
  %31 = sdiv exact i64 %30, 268, !dbg !3655
  %32 = getelementptr inbounds [350 x %struct.ai_local], ptr @Ai_local_info, i64 0, i64 %31, !dbg !3656
  store ptr %32, ptr %6, align 8, !dbg !3653
  %33 = load ptr, ptr %2, align 8, !dbg !3657
  %34 = getelementptr inbounds nuw %struct.object, ptr %33, i32 0, i32 9, !dbg !3658
  %35 = load i16, ptr %34, align 2, !dbg !3658
  %36 = load ptr, ptr %3, align 8, !dbg !3659
  %37 = getelementptr inbounds nuw %struct.ai_static, ptr %36, i32 0, i32 2, !dbg !3660
  store i16 %35, ptr %37, align 4, !dbg !3661
  %38 = load ptr, ptr %6, align 8, !dbg !3662
  %39 = getelementptr inbounds nuw %struct.ai_local, ptr %38, i32 0, i32 3, !dbg !3663
  store i32 0, ptr %39, align 4, !dbg !3664
  %40 = load ptr, ptr %2, align 8, !dbg !3665
  %41 = ptrtoint ptr %40 to i64, !dbg !3665
  %42 = sub i64 %41, ptrtoint (ptr @Objects to i64), !dbg !3665
  %43 = sdiv exact i64 %42, 268, !dbg !3665
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 1, ptr noundef @.str.28, i64 noundef %43), !dbg !3665
  br label %44, !dbg !3666

44:                                               ; preds = %27, %24
  br label %45, !dbg !3667

45:                                               ; preds = %44, %14, %1
  %46 = load ptr, ptr %3, align 8, !dbg !3668
  %47 = getelementptr inbounds nuw %struct.ai_static, ptr %46, i32 0, i32 3, !dbg !3669
  %48 = load i16, ptr %47, align 2, !dbg !3669
  %49 = sext i16 %48 to i32, !dbg !3668
  %50 = load ptr, ptr %3, align 8, !dbg !3670
  %51 = getelementptr inbounds nuw %struct.ai_static, ptr %50, i32 0, i32 5, !dbg !3671
  %52 = load i8, ptr %51, align 2, !dbg !3671
  %53 = sext i8 %52 to i32, !dbg !3670
  %54 = add nsw i32 %49, %53, !dbg !3672
  store i32 %54, ptr %4, align 4, !dbg !3673
  %55 = load ptr, ptr %3, align 8, !dbg !3674
  %56 = getelementptr inbounds nuw %struct.ai_static, ptr %55, i32 0, i32 5, !dbg !3675
  %57 = load i8, ptr %56, align 2, !dbg !3675
  %58 = sext i8 %57 to i32, !dbg !3674
  %59 = load ptr, ptr %3, align 8, !dbg !3676
  %60 = getelementptr inbounds nuw %struct.ai_static, ptr %59, i32 0, i32 1, !dbg !3677
  %61 = getelementptr inbounds [11 x i8], ptr %60, i64 0, i64 3, !dbg !3676
  %62 = load i8, ptr %61, align 1, !dbg !3676
  %63 = sext i8 %62 to i32, !dbg !3676
  %64 = sub nsw i32 %58, %63, !dbg !3678
  store i32 %64, ptr %5, align 4, !dbg !3679
  %65 = load i32, ptr %5, align 4, !dbg !3680
  %66 = icmp sge i32 %65, 0, !dbg !3682
  br i1 %66, label %67, label %79, !dbg !3683

67:                                               ; preds = %45
  %68 = load i32, ptr %5, align 4, !dbg !3684
  %69 = load ptr, ptr %3, align 8, !dbg !3685
  %70 = getelementptr inbounds nuw %struct.ai_static, ptr %69, i32 0, i32 4, !dbg !3686
  %71 = load i16, ptr %70, align 4, !dbg !3686
  %72 = sext i16 %71 to i32, !dbg !3685
  %73 = icmp slt i32 %68, %72, !dbg !3687
  br i1 %73, label %74, label %79, !dbg !3683

74:                                               ; preds = %67
  %75 = load i32, ptr %5, align 4, !dbg !3688
  %76 = trunc i32 %75 to i8, !dbg !3688
  %77 = load ptr, ptr %3, align 8, !dbg !3690
  %78 = getelementptr inbounds nuw %struct.ai_static, ptr %77, i32 0, i32 5, !dbg !3691
  store i8 %76, ptr %78, align 2, !dbg !3692
  br label %82, !dbg !3693

79:                                               ; preds = %67, %45
  %80 = load ptr, ptr %2, align 8, !dbg !3694
  call void @_Z27move_towards_segment_centerP6object(ptr noundef %80), !dbg !3696
  %81 = load ptr, ptr %2, align 8, !dbg !3697
  call void @_Z22create_path_to_stationP6objecti(ptr noundef %81, i32 noundef 15), !dbg !3698
  br label %82

82:                                               ; preds = %79, %74
  ret void, !dbg !3699
}

declare void @_Z27move_towards_segment_centerP6object(ptr noundef) #1

attributes #0 = { mustprogress noinline ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #4 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #6 = { nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #7 = { nounwind }

!llvm.module.flags = !{!230, !231, !232, !233, !234, !235, !236}
!llvm.dbg.cu = !{!57}
!llvm.ident = !{!237}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 66, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "main_d2/aipath.cpp", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "04b82b8b8aad1fdb36edcb0567856a69")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !6)
!4 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !5)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !{!7}
!7 = !DISubrange(count: 40)
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(scope: null, file: !2, line: 66, type: !10, isLocal: true, isDefinition: true)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 448, elements: !11)
!11 = !{!12}
!12 = !DISubrange(count: 56)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(scope: null, file: !2, line: 92, type: !15, isLocal: true, isDefinition: true)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 152, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 19)
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(scope: null, file: !2, line: 103, type: !20, isLocal: true, isDefinition: true)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 552, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 69)
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(scope: null, file: !2, line: 148, type: !25, isLocal: true, isDefinition: true)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 144, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 18)
!28 = !DIGlobalVariableExpression(var: !29, expr: !DIExpression())
!29 = distinct !DIGlobalVariable(scope: null, file: !2, line: 161, type: !25, isLocal: true, isDefinition: true)
!30 = !DIGlobalVariableExpression(var: !31, expr: !DIExpression())
!31 = distinct !DIGlobalVariable(scope: null, file: !2, line: 313, type: !32, isLocal: true, isDefinition: true)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 280, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 35)
!35 = !DIGlobalVariableExpression(var: !36, expr: !DIExpression())
!36 = distinct !DIGlobalVariable(scope: null, file: !2, line: 349, type: !37, isLocal: true, isDefinition: true)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 120, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 15)
!40 = !DIGlobalVariableExpression(var: !41, expr: !DIExpression())
!41 = distinct !DIGlobalVariable(scope: null, file: !2, line: 450, type: !42, isLocal: true, isDefinition: true)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 440, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 55)
!45 = !DIGlobalVariableExpression(var: !46, expr: !DIExpression())
!46 = distinct !DIGlobalVariable(scope: null, file: !2, line: 472, type: !47, isLocal: true, isDefinition: true)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 456, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 57)
!50 = !DIGlobalVariableExpression(var: !51, expr: !DIExpression())
!51 = distinct !DIGlobalVariable(scope: null, file: !2, line: 501, type: !52, isLocal: true, isDefinition: true)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 360, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 45)
!55 = !DIGlobalVariableExpression(var: !56, expr: !DIExpression())
!56 = distinct !DIGlobalVariable(name: "Last_buddy_polish_path_frame", scope: !57, file: !2, line: 531, type: !63, isLocal: false, isDefinition: true)
!57 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !58, producer: "Homebrew clang version 20.1.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !59, globals: !73, imports: !151, splitDebugInlining: false, nameTableKind: Apple, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk", sdk: "MacOSX15.sdk")
!58 = !DIFile(filename: "/Users/richard/code/ChocolateDescent/main_d2/aipath.cpp", directory: "/Users/richard/code/ChocolateDescent/build-c-ref", checksumkind: CSK_MD5, checksum: "04b82b8b8aad1fdb36edcb0567856a69")
!59 = !{!60, !66, !69}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DISubroutineType(types: !62)
!62 = !{!63, !64, !64}
!63 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!66 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !67, line: 30, baseType: !68)
!67 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int64_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e6d85c1a9e23dbf7518ce3b162aac800")
!68 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!69 = !DIDerivedType(tag: DW_TAG_typedef, name: "fix", file: !70, line: 20, baseType: !71)
!70 = !DIFile(filename: "./fix/fix.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "c5006a11bf8b4cb7d963898499eda13a")
!71 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !72, line: 30, baseType: !63)
!72 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int32_t.h", directory: "", checksumkind: CSK_MD5, checksum: "d23e8406e80ee79983f28509c741fa17")
!73 = !{!0, !8, !13, !18, !23, !28, !30, !35, !40, !45, !50, !55, !74, !79, !81, !86, !91, !93, !98, !103, !105, !110, !115, !117, !122, !124, !129, !134, !136, !141, !143, !148}
!74 = !DIGlobalVariableExpression(var: !75, expr: !DIExpression())
!75 = distinct !DIGlobalVariable(scope: null, file: !2, line: 762, type: !76, isLocal: true, isDefinition: true)
!76 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 256, elements: !77)
!77 = !{!78}
!78 = !DISubrange(count: 32)
!79 = !DIGlobalVariableExpression(var: !80, expr: !DIExpression())
!80 = distinct !DIGlobalVariable(scope: null, file: !2, line: 803, type: !76, isLocal: true, isDefinition: true)
!81 = !DIGlobalVariableExpression(var: !82, expr: !DIExpression())
!82 = distinct !DIGlobalVariable(scope: null, file: !2, line: 853, type: !83, isLocal: true, isDefinition: true)
!83 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 264, elements: !84)
!84 = !{!85}
!85 = !DISubrange(count: 33)
!86 = !DIGlobalVariableExpression(var: !87, expr: !DIExpression())
!87 = distinct !DIGlobalVariable(scope: null, file: !2, line: 876, type: !88, isLocal: true, isDefinition: true)
!88 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 96, elements: !89)
!89 = !{!90}
!90 = !DISubrange(count: 12)
!91 = !DIGlobalVariableExpression(var: !92, expr: !DIExpression())
!92 = distinct !DIGlobalVariable(scope: null, file: !2, line: 930, type: !15, isLocal: true, isDefinition: true)
!93 = !DIGlobalVariableExpression(var: !94, expr: !DIExpression())
!94 = distinct !DIGlobalVariable(scope: null, file: !2, line: 941, type: !95, isLocal: true, isDefinition: true)
!95 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 544, elements: !96)
!96 = !{!97}
!97 = !DISubrange(count: 68)
!98 = !DIGlobalVariableExpression(var: !99, expr: !DIExpression())
!99 = distinct !DIGlobalVariable(scope: null, file: !2, line: 946, type: !100, isLocal: true, isDefinition: true)
!100 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 176, elements: !101)
!101 = !{!102}
!102 = !DISubrange(count: 22)
!103 = !DIGlobalVariableExpression(var: !104, expr: !DIExpression())
!104 = distinct !DIGlobalVariable(scope: null, file: !2, line: 966, type: !100, isLocal: true, isDefinition: true)
!105 = !DIGlobalVariableExpression(var: !106, expr: !DIExpression())
!106 = distinct !DIGlobalVariable(scope: null, file: !2, line: 977, type: !107, isLocal: true, isDefinition: true)
!107 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !108)
!108 = !{!109}
!109 = !DISubrange(count: 67)
!110 = !DIGlobalVariableExpression(var: !111, expr: !DIExpression())
!111 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1407, type: !112, isLocal: true, isDefinition: true)
!112 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 688, elements: !113)
!113 = !{!114}
!114 = !DISubrange(count: 86)
!115 = !DIGlobalVariableExpression(var: !116, expr: !DIExpression())
!116 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1426, type: !20, isLocal: true, isDefinition: true)
!117 = !DIGlobalVariableExpression(var: !118, expr: !DIExpression())
!118 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1461, type: !119, isLocal: true, isDefinition: true)
!119 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 376, elements: !120)
!120 = !{!121}
!121 = !DISubrange(count: 47)
!122 = !DIGlobalVariableExpression(var: !123, expr: !DIExpression())
!123 = distinct !DIGlobalVariable(name: "Last_frame_garbage_collected", scope: !57, file: !2, line: 1480, type: !63, isLocal: false, isDefinition: true)
!124 = !DIGlobalVariableExpression(var: !125, expr: !DIExpression())
!125 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1493, type: !126, isLocal: true, isDefinition: true)
!126 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 336, elements: !127)
!127 = !{!128}
!128 = !DISubrange(count: 42)
!129 = !DIGlobalVariableExpression(var: !130, expr: !DIExpression())
!130 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1544, type: !131, isLocal: true, isDefinition: true)
!131 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 344, elements: !132)
!132 = !{!133}
!133 = !DISubrange(count: 43)
!134 = !DIGlobalVariableExpression(var: !135, expr: !DIExpression())
!135 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1569, type: !95, isLocal: true, isDefinition: true)
!136 = !DIGlobalVariableExpression(var: !137, expr: !DIExpression())
!137 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1572, type: !138, isLocal: true, isDefinition: true)
!138 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 464, elements: !139)
!139 = !{!140}
!140 = !DISubrange(count: 58)
!141 = !DIGlobalVariableExpression(var: !142, expr: !DIExpression())
!142 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1574, type: !100, isLocal: true, isDefinition: true)
!143 = !DIGlobalVariableExpression(var: !144, expr: !DIExpression())
!144 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1623, type: !145, isLocal: true, isDefinition: true)
!145 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 624, elements: !146)
!146 = !{!147}
!147 = !DISubrange(count: 78)
!148 = !DIGlobalVariableExpression(var: !149, expr: !DIExpression(DW_OP_constu, 16, DW_OP_stack_value))
!149 = distinct !DIGlobalVariable(name: "FRACBITS", scope: !57, file: !70, line: 18, type: !150, isLocal: true, isDefinition: true)
!150 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !63)
!151 = !{!152, !159, !163, !164, !165, !169, !173, !177, !181, !184, !186, !188, !190, !192, !194, !196, !198, !200, !202, !204, !206, !208, !210, !212, !214, !220, !224, !227}
!152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !153, entity: !155, file: !158, line: 158)
!153 = !DINamespace(name: "__1", scope: !154, exportSymbols: true)
!154 = !DINamespace(name: "std", scope: null)
!155 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !156, line: 30, baseType: !157)
!156 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int8_t.h", directory: "", checksumkind: CSK_MD5, checksum: "5052dfe782b50fed2355b8f61a9e4fa9")
!157 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!158 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdint", directory: "")
!159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !153, entity: !160, file: !158, line: 159)
!160 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !161, line: 30, baseType: !162)
!161 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int16_t.h", directory: "", checksumkind: CSK_MD5, checksum: "47ed3c3ac6f65bfec021ca2b7be18e7e")
!162 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !153, entity: !71, file: !158, line: 160)
!164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !153, entity: !66, file: !158, line: 161)
!165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !153, entity: !166, file: !158, line: 163)
!166 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !167, line: 31, baseType: !168)
!167 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint8_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8b64ccf8c67b8c006b07b8daf1b49be5")
!168 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !153, entity: !170, file: !158, line: 164)
!170 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !171, line: 31, baseType: !172)
!171 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint16_t.h", directory: "", checksumkind: CSK_MD5, checksum: "f0aa926da906b10566dd3171bf347ab7")
!172 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !153, entity: !174, file: !158, line: 165)
!174 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !175, line: 31, baseType: !176)
!175 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint32_t.h", directory: "", checksumkind: CSK_MD5, checksum: "0254eb80c6b9719ac45c3c1cf872109b")
!176 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !153, entity: !178, file: !158, line: 166)
!178 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !179, line: 31, baseType: !180)
!179 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint64_t.h", directory: "", checksumkind: CSK_MD5, checksum: "77fc5e91653260959605f129691cf9b1")
!180 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !153, entity: !182, file: !158, line: 168)
!182 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !183, line: 29, baseType: !155)
!183 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "042ceedaf4137a8aaa272d0b27434016")
!184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !153, entity: !185, file: !158, line: 169)
!185 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !183, line: 30, baseType: !160)
!186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !153, entity: !187, file: !158, line: 170)
!187 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !183, line: 31, baseType: !71)
!188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !153, entity: !189, file: !158, line: 171)
!189 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !183, line: 32, baseType: !66)
!190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !153, entity: !191, file: !158, line: 173)
!191 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !183, line: 33, baseType: !166)
!192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !153, entity: !193, file: !158, line: 174)
!193 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !183, line: 34, baseType: !170)
!194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !153, entity: !195, file: !158, line: 175)
!195 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !183, line: 35, baseType: !174)
!196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !153, entity: !197, file: !158, line: 176)
!197 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !183, line: 36, baseType: !178)
!198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !153, entity: !199, file: !158, line: 178)
!199 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !183, line: 40, baseType: !155)
!200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !153, entity: !201, file: !158, line: 179)
!201 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !183, line: 41, baseType: !160)
!202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !153, entity: !203, file: !158, line: 180)
!203 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !183, line: 42, baseType: !71)
!204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !153, entity: !205, file: !158, line: 181)
!205 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !183, line: 43, baseType: !66)
!206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !153, entity: !207, file: !158, line: 183)
!207 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !183, line: 44, baseType: !166)
!208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !153, entity: !209, file: !158, line: 184)
!209 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !183, line: 45, baseType: !170)
!210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !153, entity: !211, file: !158, line: 185)
!211 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !183, line: 46, baseType: !174)
!212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !153, entity: !213, file: !158, line: 186)
!213 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !183, line: 47, baseType: !178)
!214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !153, entity: !215, file: !158, line: 188)
!215 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !216, line: 32, baseType: !217)
!216 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_intptr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e478ba47270923b1cca6659f19f02db1")
!217 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_intptr_t", file: !218, line: 40, baseType: !219)
!218 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/arm/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "b270144f57ae258d0ce80b8f87be068c")
!219 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !153, entity: !221, file: !158, line: 189)
!221 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !222, line: 34, baseType: !223)
!222 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_uintptr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e70ae655dd1b9d4ae0b1dcc073f5b7e4")
!223 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !153, entity: !225, file: !158, line: 191)
!225 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !226, line: 32, baseType: !219)
!226 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_intmax_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e37b9240f30f486478152ef3989b1545")
!227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !153, entity: !228, file: !158, line: 192)
!228 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !229, line: 32, baseType: !223)
!229 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uintmax_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8217a3fbb207d8e87ca5318c313e81c2")
!230 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 4]}
!231 = !{i32 7, !"Dwarf Version", i32 5}
!232 = !{i32 2, !"Debug Info Version", i32 3}
!233 = !{i32 1, !"wchar_size", i32 4}
!234 = !{i32 8, !"PIC Level", i32 2}
!235 = !{i32 7, !"uwtable", i32 1}
!236 = !{i32 7, !"frame-pointer", i32 1}
!237 = !{!"Homebrew clang version 20.1.8"}
!238 = distinct !DISubprogram(name: "create_random_xlate", linkageName: "_Z19create_random_xlatePa", scope: !2, file: !2, line: 56, type: !239, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !242)
!239 = !DISubroutineType(types: !240)
!240 = !{null, !241}
!241 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !155, size: 64)
!242 = !{}
!243 = !DILocalVariable(name: "xt", arg: 1, scope: !238, file: !2, line: 56, type: !241)
!244 = !DILocation(line: 56, column: 34, scope: !238)
!245 = !DILocalVariable(name: "i", scope: !238, file: !2, line: 58, type: !63)
!246 = !DILocation(line: 58, column: 6, scope: !238)
!247 = !DILocation(line: 60, column: 8, scope: !248)
!248 = distinct !DILexicalBlock(scope: !238, file: !2, line: 60, column: 2)
!249 = !DILocation(line: 60, column: 7, scope: !248)
!250 = !DILocation(line: 60, column: 12, scope: !251)
!251 = distinct !DILexicalBlock(scope: !248, file: !2, line: 60, column: 2)
!252 = !DILocation(line: 60, column: 13, scope: !251)
!253 = !DILocation(line: 60, column: 2, scope: !248)
!254 = !DILocation(line: 61, column: 11, scope: !251)
!255 = !DILocation(line: 61, column: 3, scope: !251)
!256 = !DILocation(line: 61, column: 6, scope: !251)
!257 = !DILocation(line: 61, column: 9, scope: !251)
!258 = !DILocation(line: 60, column: 38, scope: !251)
!259 = !DILocation(line: 60, column: 2, scope: !251)
!260 = distinct !{!260, !253, !261, !262}
!261 = !DILocation(line: 61, column: 11, scope: !248)
!262 = !{!"llvm.loop.mustprogress"}
!263 = !DILocation(line: 63, column: 8, scope: !264)
!264 = distinct !DILexicalBlock(scope: !238, file: !2, line: 63, column: 2)
!265 = !DILocation(line: 63, column: 7, scope: !264)
!266 = !DILocation(line: 63, column: 12, scope: !267)
!267 = distinct !DILexicalBlock(scope: !264, file: !2, line: 63, column: 2)
!268 = !DILocation(line: 63, column: 13, scope: !267)
!269 = !DILocation(line: 63, column: 2, scope: !264)
!270 = !DILocalVariable(name: "j", scope: !271, file: !2, line: 64, type: !63)
!271 = distinct !DILexicalBlock(scope: !267, file: !2, line: 63, column: 42)
!272 = !DILocation(line: 64, column: 7, scope: !271)
!273 = !DILocation(line: 64, column: 12, scope: !271)
!274 = !DILocation(line: 64, column: 20, scope: !271)
!275 = !DILocation(line: 64, column: 43, scope: !271)
!276 = !DILocalVariable(name: "temp_byte", scope: !271, file: !2, line: 65, type: !155)
!277 = !DILocation(line: 65, column: 10, scope: !271)
!278 = !DILocation(line: 66, column: 3, scope: !271)
!279 = !DILocation(line: 0, scope: !271)
!280 = !DILocation(line: 68, column: 15, scope: !271)
!281 = !DILocation(line: 68, column: 18, scope: !271)
!282 = !DILocation(line: 68, column: 13, scope: !271)
!283 = !DILocation(line: 69, column: 11, scope: !271)
!284 = !DILocation(line: 69, column: 14, scope: !271)
!285 = !DILocation(line: 69, column: 3, scope: !271)
!286 = !DILocation(line: 69, column: 6, scope: !271)
!287 = !DILocation(line: 69, column: 9, scope: !271)
!288 = !DILocation(line: 70, column: 11, scope: !271)
!289 = !DILocation(line: 70, column: 3, scope: !271)
!290 = !DILocation(line: 70, column: 6, scope: !271)
!291 = !DILocation(line: 70, column: 9, scope: !271)
!292 = !DILocation(line: 71, column: 2, scope: !271)
!293 = !DILocation(line: 63, column: 38, scope: !267)
!294 = !DILocation(line: 63, column: 2, scope: !267)
!295 = distinct !{!295, !269, !296, !262}
!296 = !DILocation(line: 71, column: 2, scope: !264)
!297 = !DILocation(line: 73, column: 1, scope: !238)
!298 = distinct !DISubprogram(name: "insert_center_points", linkageName: "_Z20insert_center_pointsP9point_segPi", scope: !2, file: !2, line: 79, type: !299, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !242)
!299 = !DISubroutineType(types: !300)
!300 = !{null, !301, !315}
!301 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !302, size: 64)
!302 = !DIDerivedType(tag: DW_TAG_typedef, name: "point_seg", file: !303, line: 178, baseType: !304)
!303 = !DIFile(filename: "main_d2/aistruct.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "d122430e792a0ddc0f9eaa08ad217628")
!304 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !303, line: 175, size: 128, flags: DIFlagTypePassByValue, elements: !305, identifier: "_ZTS9point_seg")
!305 = !{!306, !307}
!306 = !DIDerivedType(tag: DW_TAG_member, name: "segnum", scope: !304, file: !303, line: 176, baseType: !63, size: 32)
!307 = !DIDerivedType(tag: DW_TAG_member, name: "point", scope: !304, file: !303, line: 177, baseType: !308, size: 96, offset: 32)
!308 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_vector", file: !309, line: 22, baseType: !310)
!309 = !DIFile(filename: "./vecmat/vecmat.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "dfa84e3325c1ea4f5f74699fff5ef2bf")
!310 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_vector", file: !309, line: 19, size: 96, flags: DIFlagTypePassByValue, elements: !311, identifier: "_ZTS10vms_vector")
!311 = !{!312, !313, !314}
!312 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !310, file: !309, line: 21, baseType: !69, size: 32)
!313 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !310, file: !309, line: 21, baseType: !69, size: 32, offset: 32)
!314 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !310, file: !309, line: 21, baseType: !69, size: 32, offset: 64)
!315 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!316 = !DILocalVariable(name: "psegs", arg: 1, scope: !298, file: !2, line: 79, type: !301)
!317 = !DILocation(line: 79, column: 38, scope: !298)
!318 = !DILocalVariable(name: "num_points", arg: 2, scope: !298, file: !2, line: 79, type: !315)
!319 = !DILocation(line: 79, column: 50, scope: !298)
!320 = !DILocalVariable(name: "i", scope: !298, file: !2, line: 81, type: !63)
!321 = !DILocation(line: 81, column: 6, scope: !298)
!322 = !DILocalVariable(name: "j", scope: !298, file: !2, line: 81, type: !63)
!323 = !DILocation(line: 81, column: 9, scope: !298)
!324 = !DILocalVariable(name: "last_point", scope: !298, file: !2, line: 81, type: !63)
!325 = !DILocation(line: 81, column: 12, scope: !298)
!326 = !DILocalVariable(name: "count", scope: !298, file: !2, line: 82, type: !63)
!327 = !DILocation(line: 82, column: 6, scope: !298)
!328 = !DILocation(line: 82, column: 13, scope: !298)
!329 = !DILocation(line: 82, column: 12, scope: !298)
!330 = !DILocation(line: 84, column: 16, scope: !298)
!331 = !DILocation(line: 84, column: 15, scope: !298)
!332 = !DILocation(line: 84, column: 26, scope: !298)
!333 = !DILocation(line: 84, column: 13, scope: !298)
!334 = !DILocation(line: 86, column: 9, scope: !335)
!335 = distinct !DILexicalBlock(scope: !298, file: !2, line: 86, column: 2)
!336 = !DILocation(line: 86, column: 8, scope: !335)
!337 = !DILocation(line: 86, column: 7, scope: !335)
!338 = !DILocation(line: 86, column: 21, scope: !339)
!339 = distinct !DILexicalBlock(scope: !335, file: !2, line: 86, column: 2)
!340 = !DILocation(line: 86, column: 22, scope: !339)
!341 = !DILocation(line: 86, column: 2, scope: !335)
!342 = !DILocalVariable(name: "connect_side", scope: !343, file: !2, line: 87, type: !63)
!343 = distinct !DILexicalBlock(scope: !339, file: !2, line: 86, column: 31)
!344 = !DILocation(line: 87, column: 9, scope: !343)
!345 = !DILocalVariable(name: "temp_segnum", scope: !343, file: !2, line: 87, type: !63)
!346 = !DILocation(line: 87, column: 23, scope: !343)
!347 = !DILocalVariable(name: "center_point", scope: !343, file: !2, line: 88, type: !308)
!348 = !DILocation(line: 88, column: 14, scope: !343)
!349 = !DILocalVariable(name: "new_point", scope: !343, file: !2, line: 88, type: !308)
!350 = !DILocation(line: 88, column: 28, scope: !343)
!351 = !DILocation(line: 90, column: 16, scope: !343)
!352 = !DILocation(line: 90, column: 22, scope: !343)
!353 = !DILocation(line: 90, column: 3, scope: !343)
!354 = !DILocation(line: 90, column: 11, scope: !343)
!355 = !DILocation(line: 90, column: 10, scope: !343)
!356 = !DILocation(line: 90, column: 14, scope: !343)
!357 = !DILocation(line: 91, column: 46, scope: !343)
!358 = !DILocation(line: 91, column: 52, scope: !343)
!359 = !DILocation(line: 91, column: 55, scope: !343)
!360 = !DILocation(line: 91, column: 37, scope: !343)
!361 = !DILocation(line: 91, column: 74, scope: !343)
!362 = !DILocation(line: 91, column: 80, scope: !343)
!363 = !DILocation(line: 91, column: 81, scope: !343)
!364 = !DILocation(line: 91, column: 85, scope: !343)
!365 = !DILocation(line: 91, column: 65, scope: !343)
!366 = !DILocation(line: 91, column: 18, scope: !343)
!367 = !DILocation(line: 91, column: 16, scope: !343)
!368 = !DILocation(line: 92, column: 3, scope: !343)
!369 = !DILocation(line: 93, column: 7, scope: !370)
!370 = distinct !DILexicalBlock(scope: !343, file: !2, line: 93, column: 7)
!371 = !DILocation(line: 93, column: 20, scope: !370)
!372 = !DILocation(line: 94, column: 17, scope: !370)
!373 = !DILocation(line: 94, column: 4, scope: !370)
!374 = !DILocation(line: 95, column: 57, scope: !343)
!375 = !DILocation(line: 95, column: 63, scope: !343)
!376 = !DILocation(line: 95, column: 64, scope: !343)
!377 = !DILocation(line: 95, column: 68, scope: !343)
!378 = !DILocation(line: 95, column: 48, scope: !343)
!379 = !DILocation(line: 95, column: 77, scope: !343)
!380 = !DILocation(line: 95, column: 3, scope: !343)
!381 = !DILocation(line: 96, column: 27, scope: !343)
!382 = !DILocation(line: 96, column: 33, scope: !343)
!383 = !DILocation(line: 96, column: 34, scope: !343)
!384 = !DILocation(line: 96, column: 38, scope: !343)
!385 = !DILocation(line: 96, column: 3, scope: !343)
!386 = !DILocation(line: 97, column: 13, scope: !343)
!387 = !DILocation(line: 97, column: 15, scope: !343)
!388 = !DILocation(line: 98, column: 13, scope: !343)
!389 = !DILocation(line: 98, column: 15, scope: !343)
!390 = !DILocation(line: 99, column: 13, scope: !343)
!391 = !DILocation(line: 99, column: 15, scope: !343)
!392 = !DILocation(line: 100, column: 15, scope: !343)
!393 = !DILocation(line: 100, column: 23, scope: !343)
!394 = !DILocation(line: 100, column: 22, scope: !343)
!395 = !DILocation(line: 100, column: 24, scope: !343)
!396 = !DILocation(line: 100, column: 28, scope: !343)
!397 = !DILocation(line: 100, column: 3, scope: !343)
!398 = !DILocation(line: 101, column: 33, scope: !343)
!399 = !DILocation(line: 101, column: 41, scope: !343)
!400 = !DILocation(line: 101, column: 40, scope: !343)
!401 = !DILocation(line: 101, column: 42, scope: !343)
!402 = !DILocation(line: 101, column: 46, scope: !343)
!403 = !DILocation(line: 101, column: 53, scope: !343)
!404 = !DILocation(line: 101, column: 61, scope: !343)
!405 = !DILocation(line: 101, column: 60, scope: !343)
!406 = !DILocation(line: 101, column: 64, scope: !343)
!407 = !DILocation(line: 101, column: 17, scope: !343)
!408 = !DILocation(line: 101, column: 15, scope: !343)
!409 = !DILocation(line: 102, column: 7, scope: !410)
!410 = distinct !DILexicalBlock(scope: !343, file: !2, line: 102, column: 7)
!411 = !DILocation(line: 102, column: 19, scope: !410)
!412 = !DILocation(line: 103, column: 4, scope: !413)
!413 = distinct !DILexicalBlock(scope: !410, file: !2, line: 102, column: 26)
!414 = !DILocation(line: 104, column: 4, scope: !413)
!415 = !DILocation(line: 104, column: 12, scope: !413)
!416 = !DILocation(line: 104, column: 11, scope: !413)
!417 = !DILocation(line: 104, column: 13, scope: !413)
!418 = !DILocation(line: 104, column: 17, scope: !413)
!419 = !DILocation(line: 104, column: 23, scope: !413)
!420 = !DILocation(line: 105, column: 20, scope: !413)
!421 = !DILocation(line: 105, column: 28, scope: !413)
!422 = !DILocation(line: 105, column: 27, scope: !413)
!423 = !DILocation(line: 105, column: 29, scope: !413)
!424 = !DILocation(line: 105, column: 33, scope: !413)
!425 = !DILocation(line: 105, column: 40, scope: !413)
!426 = !DILocation(line: 105, column: 48, scope: !413)
!427 = !DILocation(line: 105, column: 47, scope: !413)
!428 = !DILocation(line: 105, column: 51, scope: !413)
!429 = !DILocation(line: 105, column: 4, scope: !413)
!430 = !DILocation(line: 106, column: 3, scope: !413)
!431 = !DILocation(line: 108, column: 25, scope: !343)
!432 = !DILocation(line: 108, column: 33, scope: !343)
!433 = !DILocation(line: 108, column: 32, scope: !343)
!434 = !DILocation(line: 108, column: 36, scope: !343)
!435 = !DILocation(line: 108, column: 3, scope: !343)
!436 = !DILocation(line: 108, column: 11, scope: !343)
!437 = !DILocation(line: 108, column: 10, scope: !343)
!438 = !DILocation(line: 108, column: 12, scope: !343)
!439 = !DILocation(line: 108, column: 16, scope: !343)
!440 = !DILocation(line: 108, column: 23, scope: !343)
!441 = !DILocation(line: 109, column: 8, scope: !343)
!442 = !DILocation(line: 110, column: 2, scope: !343)
!443 = !DILocation(line: 86, column: 27, scope: !339)
!444 = !DILocation(line: 86, column: 2, scope: !339)
!445 = distinct !{!445, !341, !446, !262}
!446 = !DILocation(line: 110, column: 2, scope: !335)
!447 = !DILocation(line: 115, column: 8, scope: !448)
!448 = distinct !DILexicalBlock(scope: !298, file: !2, line: 115, column: 2)
!449 = !DILocation(line: 115, column: 7, scope: !448)
!450 = !DILocation(line: 115, column: 12, scope: !451)
!451 = distinct !DILexicalBlock(scope: !448, file: !2, line: 115, column: 2)
!452 = !DILocation(line: 115, column: 14, scope: !451)
!453 = !DILocation(line: 115, column: 19, scope: !451)
!454 = !DILocation(line: 115, column: 13, scope: !451)
!455 = !DILocation(line: 115, column: 2, scope: !448)
!456 = !DILocalVariable(name: "temp1", scope: !457, file: !2, line: 116, type: !308)
!457 = distinct !DILexicalBlock(scope: !451, file: !2, line: 115, column: 29)
!458 = !DILocation(line: 116, column: 14, scope: !457)
!459 = !DILocalVariable(name: "temp2", scope: !457, file: !2, line: 116, type: !308)
!460 = !DILocation(line: 116, column: 21, scope: !457)
!461 = !DILocalVariable(name: "dot", scope: !457, file: !2, line: 117, type: !69)
!462 = !DILocation(line: 117, column: 9, scope: !457)
!463 = !DILocation(line: 119, column: 9, scope: !457)
!464 = !DILocation(line: 119, column: 7, scope: !457)
!465 = !DILocation(line: 121, column: 7, scope: !466)
!466 = distinct !DILexicalBlock(scope: !457, file: !2, line: 121, column: 7)
!467 = !DILocation(line: 121, column: 11, scope: !466)
!468 = !DILocation(line: 121, column: 14, scope: !466)
!469 = !DILocation(line: 121, column: 26, scope: !466)
!470 = !DILocation(line: 121, column: 46, scope: !466)
!471 = !DILocation(line: 121, column: 19, scope: !466)
!472 = !DILocation(line: 121, column: 17, scope: !466)
!473 = !DILocation(line: 122, column: 4, scope: !466)
!474 = !DILocation(line: 122, column: 10, scope: !466)
!475 = !DILocation(line: 122, column: 13, scope: !466)
!476 = !DILocation(line: 122, column: 20, scope: !466)
!477 = !DILocation(line: 124, column: 2, scope: !457)
!478 = !DILocation(line: 115, column: 24, scope: !451)
!479 = !DILocation(line: 115, column: 2, scope: !451)
!480 = distinct !{!480, !455, !481, !262}
!481 = !DILocation(line: 124, column: 2, scope: !448)
!482 = !DILocation(line: 127, column: 4, scope: !298)
!483 = !DILocation(line: 128, column: 8, scope: !484)
!484 = distinct !DILexicalBlock(scope: !298, file: !2, line: 128, column: 2)
!485 = !DILocation(line: 128, column: 7, scope: !484)
!486 = !DILocation(line: 128, column: 12, scope: !487)
!487 = distinct !DILexicalBlock(scope: !484, file: !2, line: 128, column: 2)
!488 = !DILocation(line: 128, column: 14, scope: !487)
!489 = !DILocation(line: 128, column: 13, scope: !487)
!490 = !DILocation(line: 128, column: 2, scope: !484)
!491 = !DILocation(line: 129, column: 7, scope: !492)
!492 = distinct !DILexicalBlock(scope: !487, file: !2, line: 129, column: 7)
!493 = !DILocation(line: 129, column: 13, scope: !492)
!494 = !DILocation(line: 129, column: 16, scope: !492)
!495 = !DILocation(line: 129, column: 23, scope: !492)
!496 = !DILocation(line: 130, column: 17, scope: !492)
!497 = !DILocation(line: 130, column: 23, scope: !492)
!498 = !DILocation(line: 130, column: 4, scope: !492)
!499 = !DILocation(line: 130, column: 11, scope: !492)
!500 = !DILocation(line: 130, column: 15, scope: !492)
!501 = !DILocation(line: 129, column: 27, scope: !492)
!502 = !DILocation(line: 128, column: 22, scope: !487)
!503 = !DILocation(line: 128, column: 2, scope: !487)
!504 = distinct !{!504, !490, !505, !262}
!505 = !DILocation(line: 130, column: 24, scope: !484)
!506 = !DILocation(line: 132, column: 16, scope: !298)
!507 = !DILocation(line: 132, column: 3, scope: !298)
!508 = !DILocation(line: 132, column: 14, scope: !298)
!509 = !DILocation(line: 133, column: 1, scope: !298)
!510 = distinct !DISubprogram(name: "fixmul", linkageName: "_Z6fixmulii", scope: !70, file: !70, line: 83, type: !511, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !242)
!511 = !DISubroutineType(types: !512)
!512 = !{!69, !69, !69}
!513 = !DILocalVariable(name: "a", arg: 1, scope: !510, file: !70, line: 83, type: !69)
!514 = !DILocation(line: 83, column: 26, scope: !510)
!515 = !DILocalVariable(name: "b", arg: 2, scope: !510, file: !70, line: 83, type: !69)
!516 = !DILocation(line: 83, column: 33, scope: !510)
!517 = !DILocation(line: 85, column: 19, scope: !510)
!518 = !DILocation(line: 85, column: 32, scope: !510)
!519 = !DILocation(line: 85, column: 21, scope: !510)
!520 = !DILocation(line: 85, column: 35, scope: !510)
!521 = !DILocation(line: 85, column: 9, scope: !510)
!522 = !DILocation(line: 85, column: 2, scope: !510)
!523 = distinct !DISubprogram(name: "move_towards_outside", linkageName: "_Z20move_towards_outsideP9point_segPiP6objecti", scope: !2, file: !2, line: 143, type: !524, scopeLine: 144, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !242)
!524 = !DISubroutineType(types: !525)
!525 = !{null, !301, !315, !526, !63}
!526 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !527, size: 64)
!527 = !DIDerivedType(tag: DW_TAG_typedef, name: "object", file: !528, line: 259, baseType: !529)
!528 = !DIFile(filename: "main_d2/object.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "1f2325d356aae4b692933d2aae4f3afd")
!529 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "object", file: !528, line: 210, size: 2144, flags: DIFlagTypePassByValue, elements: !530, identifier: "_ZTS6object")
!530 = !{!531, !532, !533, !534, !535, !536, !537, !538, !539, !540, !541, !542, !543, !550, !551, !552, !553, !554, !555, !556, !557, !558, !576, !629}
!531 = !DIDerivedType(tag: DW_TAG_member, name: "signature", scope: !529, file: !528, line: 212, baseType: !63, size: 32)
!532 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !529, file: !528, line: 213, baseType: !166, size: 8, offset: 32)
!533 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !529, file: !528, line: 214, baseType: !166, size: 8, offset: 40)
!534 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !529, file: !528, line: 215, baseType: !162, size: 16, offset: 48)
!535 = !DIDerivedType(tag: DW_TAG_member, name: "prev", scope: !529, file: !528, line: 215, baseType: !162, size: 16, offset: 64)
!536 = !DIDerivedType(tag: DW_TAG_member, name: "control_type", scope: !529, file: !528, line: 216, baseType: !166, size: 8, offset: 80)
!537 = !DIDerivedType(tag: DW_TAG_member, name: "movement_type", scope: !529, file: !528, line: 217, baseType: !166, size: 8, offset: 88)
!538 = !DIDerivedType(tag: DW_TAG_member, name: "render_type", scope: !529, file: !528, line: 218, baseType: !166, size: 8, offset: 96)
!539 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !529, file: !528, line: 219, baseType: !166, size: 8, offset: 104)
!540 = !DIDerivedType(tag: DW_TAG_member, name: "segnum", scope: !529, file: !528, line: 220, baseType: !162, size: 16, offset: 112)
!541 = !DIDerivedType(tag: DW_TAG_member, name: "attached_obj", scope: !529, file: !528, line: 221, baseType: !162, size: 16, offset: 128)
!542 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !529, file: !528, line: 222, baseType: !308, size: 96, offset: 160)
!543 = !DIDerivedType(tag: DW_TAG_member, name: "orient", scope: !529, file: !528, line: 223, baseType: !544, size: 288, offset: 256)
!544 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_matrix", file: !309, line: 47, baseType: !545)
!545 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_matrix", file: !309, line: 44, size: 288, flags: DIFlagTypePassByValue, elements: !546, identifier: "_ZTS10vms_matrix")
!546 = !{!547, !548, !549}
!547 = !DIDerivedType(tag: DW_TAG_member, name: "rvec", scope: !545, file: !309, line: 46, baseType: !308, size: 96)
!548 = !DIDerivedType(tag: DW_TAG_member, name: "uvec", scope: !545, file: !309, line: 46, baseType: !308, size: 96, offset: 96)
!549 = !DIDerivedType(tag: DW_TAG_member, name: "fvec", scope: !545, file: !309, line: 46, baseType: !308, size: 96, offset: 192)
!550 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !529, file: !528, line: 224, baseType: !69, size: 32, offset: 544)
!551 = !DIDerivedType(tag: DW_TAG_member, name: "shields", scope: !529, file: !528, line: 225, baseType: !69, size: 32, offset: 576)
!552 = !DIDerivedType(tag: DW_TAG_member, name: "last_pos", scope: !529, file: !528, line: 226, baseType: !308, size: 96, offset: 608)
!553 = !DIDerivedType(tag: DW_TAG_member, name: "contains_type", scope: !529, file: !528, line: 227, baseType: !155, size: 8, offset: 704)
!554 = !DIDerivedType(tag: DW_TAG_member, name: "contains_id", scope: !529, file: !528, line: 228, baseType: !155, size: 8, offset: 712)
!555 = !DIDerivedType(tag: DW_TAG_member, name: "contains_count", scope: !529, file: !528, line: 229, baseType: !155, size: 8, offset: 720)
!556 = !DIDerivedType(tag: DW_TAG_member, name: "matcen_creator", scope: !529, file: !528, line: 230, baseType: !155, size: 8, offset: 728)
!557 = !DIDerivedType(tag: DW_TAG_member, name: "lifeleft", scope: !529, file: !528, line: 231, baseType: !69, size: 32, offset: 736)
!558 = !DIDerivedType(tag: DW_TAG_member, name: "mtype", scope: !529, file: !528, line: 240, baseType: !559, size: 512, offset: 768)
!559 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !529, file: !528, line: 236, size: 512, flags: DIFlagTypePassByValue, elements: !560, identifier: "_ZTSN6objectUt_E")
!560 = !{!561, !575}
!561 = !DIDerivedType(tag: DW_TAG_member, name: "phys_info", scope: !559, file: !528, line: 238, baseType: !562, size: 512)
!562 = !DIDerivedType(tag: DW_TAG_typedef, name: "physics_info", file: !528, line: 153, baseType: !563)
!563 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "physics_info", file: !528, line: 142, size: 512, flags: DIFlagTypePassByValue, elements: !564, identifier: "_ZTS12physics_info")
!564 = !{!565, !566, !567, !568, !569, !570, !571, !572, !574}
!565 = !DIDerivedType(tag: DW_TAG_member, name: "velocity", scope: !563, file: !528, line: 144, baseType: !308, size: 96)
!566 = !DIDerivedType(tag: DW_TAG_member, name: "thrust", scope: !563, file: !528, line: 145, baseType: !308, size: 96, offset: 96)
!567 = !DIDerivedType(tag: DW_TAG_member, name: "mass", scope: !563, file: !528, line: 146, baseType: !69, size: 32, offset: 192)
!568 = !DIDerivedType(tag: DW_TAG_member, name: "drag", scope: !563, file: !528, line: 147, baseType: !69, size: 32, offset: 224)
!569 = !DIDerivedType(tag: DW_TAG_member, name: "brakes", scope: !563, file: !528, line: 148, baseType: !69, size: 32, offset: 256)
!570 = !DIDerivedType(tag: DW_TAG_member, name: "rotvel", scope: !563, file: !528, line: 149, baseType: !308, size: 96, offset: 288)
!571 = !DIDerivedType(tag: DW_TAG_member, name: "rotthrust", scope: !563, file: !528, line: 150, baseType: !308, size: 96, offset: 384)
!572 = !DIDerivedType(tag: DW_TAG_member, name: "turnroll", scope: !563, file: !528, line: 151, baseType: !573, size: 16, offset: 480)
!573 = !DIDerivedType(tag: DW_TAG_typedef, name: "fixang", file: !70, line: 21, baseType: !162)
!574 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !563, file: !528, line: 152, baseType: !170, size: 16, offset: 496)
!575 = !DIDerivedType(tag: DW_TAG_member, name: "spin_rate", scope: !559, file: !528, line: 239, baseType: !308, size: 96)
!576 = !DIDerivedType(tag: DW_TAG_member, name: "ctype", scope: !529, file: !528, line: 250, baseType: !577, size: 256, offset: 1280)
!577 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !529, file: !528, line: 243, size: 256, flags: DIFlagTypePassByValue, elements: !578, identifier: "_ZTSN6objectUt0_E")
!578 = !{!579, !590, !600, !617, !622}
!579 = !DIDerivedType(tag: DW_TAG_member, name: "laser_info", scope: !577, file: !528, line: 245, baseType: !580, size: 160)
!580 = !DIDerivedType(tag: DW_TAG_typedef, name: "laser_info_t", file: !528, line: 166, baseType: !581)
!581 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "laser_info_s", file: !528, line: 157, size: 160, flags: DIFlagTypePassByValue, elements: !582, identifier: "_ZTS12laser_info_s")
!582 = !{!583, !584, !585, !586, !587, !588, !589}
!583 = !DIDerivedType(tag: DW_TAG_member, name: "parent_type", scope: !581, file: !528, line: 159, baseType: !162, size: 16)
!584 = !DIDerivedType(tag: DW_TAG_member, name: "parent_num", scope: !581, file: !528, line: 160, baseType: !162, size: 16, offset: 16)
!585 = !DIDerivedType(tag: DW_TAG_member, name: "parent_signature", scope: !581, file: !528, line: 161, baseType: !63, size: 32, offset: 32)
!586 = !DIDerivedType(tag: DW_TAG_member, name: "creation_time", scope: !581, file: !528, line: 162, baseType: !69, size: 32, offset: 64)
!587 = !DIDerivedType(tag: DW_TAG_member, name: "last_hitobj", scope: !581, file: !528, line: 163, baseType: !162, size: 16, offset: 96)
!588 = !DIDerivedType(tag: DW_TAG_member, name: "track_goal", scope: !581, file: !528, line: 164, baseType: !162, size: 16, offset: 112)
!589 = !DIDerivedType(tag: DW_TAG_member, name: "multiplier", scope: !581, file: !528, line: 165, baseType: !69, size: 32, offset: 128)
!590 = !DIDerivedType(tag: DW_TAG_member, name: "expl_info", scope: !577, file: !528, line: 246, baseType: !591, size: 128)
!591 = !DIDerivedType(tag: DW_TAG_typedef, name: "explosion_info", file: !528, line: 176, baseType: !592)
!592 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "explosion_info", file: !528, line: 168, size: 128, flags: DIFlagTypePassByValue, elements: !593, identifier: "_ZTS14explosion_info")
!593 = !{!594, !595, !596, !597, !598, !599}
!594 = !DIDerivedType(tag: DW_TAG_member, name: "spawn_time", scope: !592, file: !528, line: 170, baseType: !69, size: 32)
!595 = !DIDerivedType(tag: DW_TAG_member, name: "delete_time", scope: !592, file: !528, line: 171, baseType: !69, size: 32, offset: 32)
!596 = !DIDerivedType(tag: DW_TAG_member, name: "delete_objnum", scope: !592, file: !528, line: 172, baseType: !162, size: 16, offset: 64)
!597 = !DIDerivedType(tag: DW_TAG_member, name: "attach_parent", scope: !592, file: !528, line: 173, baseType: !162, size: 16, offset: 80)
!598 = !DIDerivedType(tag: DW_TAG_member, name: "prev_attach", scope: !592, file: !528, line: 174, baseType: !162, size: 16, offset: 96)
!599 = !DIDerivedType(tag: DW_TAG_member, name: "next_attach", scope: !592, file: !528, line: 175, baseType: !162, size: 16, offset: 112)
!600 = !DIDerivedType(tag: DW_TAG_member, name: "ai_info", scope: !577, file: !528, line: 247, baseType: !601, size: 256)
!601 = !DIDerivedType(tag: DW_TAG_typedef, name: "ai_static", file: !303, line: 144, baseType: !602)
!602 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ai_static", file: !303, line: 127, size: 256, flags: DIFlagTypePassByValue, elements: !603, identifier: "_ZTS9ai_static")
!603 = !{!604, !605, !609, !610, !611, !612, !613, !614, !615, !616}
!604 = !DIDerivedType(tag: DW_TAG_member, name: "behavior", scope: !602, file: !303, line: 128, baseType: !166, size: 8)
!605 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !602, file: !303, line: 129, baseType: !606, size: 88, offset: 8)
!606 = !DICompositeType(tag: DW_TAG_array_type, baseType: !155, size: 88, elements: !607)
!607 = !{!608}
!608 = !DISubrange(count: 11)
!609 = !DIDerivedType(tag: DW_TAG_member, name: "hide_segment", scope: !602, file: !303, line: 130, baseType: !162, size: 16, offset: 96)
!610 = !DIDerivedType(tag: DW_TAG_member, name: "hide_index", scope: !602, file: !303, line: 131, baseType: !162, size: 16, offset: 112)
!611 = !DIDerivedType(tag: DW_TAG_member, name: "path_length", scope: !602, file: !303, line: 132, baseType: !162, size: 16, offset: 128)
!612 = !DIDerivedType(tag: DW_TAG_member, name: "cur_path_index", scope: !602, file: !303, line: 133, baseType: !155, size: 8, offset: 144)
!613 = !DIDerivedType(tag: DW_TAG_member, name: "dying_sound_playing", scope: !602, file: !303, line: 134, baseType: !155, size: 8, offset: 152)
!614 = !DIDerivedType(tag: DW_TAG_member, name: "danger_laser_num", scope: !602, file: !303, line: 139, baseType: !162, size: 16, offset: 160)
!615 = !DIDerivedType(tag: DW_TAG_member, name: "danger_laser_signature", scope: !602, file: !303, line: 140, baseType: !63, size: 32, offset: 192)
!616 = !DIDerivedType(tag: DW_TAG_member, name: "dying_start_time", scope: !602, file: !303, line: 141, baseType: !69, size: 32, offset: 224)
!617 = !DIDerivedType(tag: DW_TAG_member, name: "light_info", scope: !577, file: !528, line: 248, baseType: !618, size: 32)
!618 = !DIDerivedType(tag: DW_TAG_typedef, name: "light_info_t", file: !528, line: 181, baseType: !619)
!619 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "light_info_s", file: !528, line: 178, size: 32, flags: DIFlagTypePassByValue, elements: !620, identifier: "_ZTS12light_info_s")
!620 = !{!621}
!621 = !DIDerivedType(tag: DW_TAG_member, name: "intensity", scope: !619, file: !528, line: 180, baseType: !69, size: 32)
!622 = !DIDerivedType(tag: DW_TAG_member, name: "powerup_info", scope: !577, file: !528, line: 249, baseType: !623, size: 96)
!623 = !DIDerivedType(tag: DW_TAG_typedef, name: "powerup_info_t", file: !528, line: 190, baseType: !624)
!624 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "powerup_info_s", file: !528, line: 185, size: 96, flags: DIFlagTypePassByValue, elements: !625, identifier: "_ZTS14powerup_info_s")
!625 = !{!626, !627, !628}
!626 = !DIDerivedType(tag: DW_TAG_member, name: "count", scope: !624, file: !528, line: 187, baseType: !63, size: 32)
!627 = !DIDerivedType(tag: DW_TAG_member, name: "creation_time", scope: !624, file: !528, line: 188, baseType: !69, size: 32, offset: 32)
!628 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !624, file: !528, line: 189, baseType: !63, size: 32, offset: 64)
!629 = !DIDerivedType(tag: DW_TAG_member, name: "rtype", scope: !529, file: !528, line: 257, baseType: !630, size: 608, offset: 1536)
!630 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !529, file: !528, line: 253, size: 608, flags: DIFlagTypePassByValue, elements: !631, identifier: "_ZTSN6objectUt1_E")
!631 = !{!632, !650}
!632 = !DIDerivedType(tag: DW_TAG_member, name: "pobj_info", scope: !630, file: !528, line: 255, baseType: !633, size: 608)
!633 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyobj_info", file: !528, line: 208, baseType: !634)
!634 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "polyobj_info", file: !528, line: 201, size: 608, flags: DIFlagTypePassByValue, elements: !635, identifier: "_ZTS12polyobj_info")
!635 = !{!636, !637, !647, !648, !649}
!636 = !DIDerivedType(tag: DW_TAG_member, name: "model_num", scope: !634, file: !528, line: 203, baseType: !63, size: 32)
!637 = !DIDerivedType(tag: DW_TAG_member, name: "anim_angles", scope: !634, file: !528, line: 204, baseType: !638, size: 480, offset: 32)
!638 = !DICompositeType(tag: DW_TAG_array_type, baseType: !639, size: 480, elements: !645)
!639 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_angvec", file: !309, line: 40, baseType: !640)
!640 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_angvec", file: !309, line: 37, size: 48, flags: DIFlagTypePassByValue, elements: !641, identifier: "_ZTS10vms_angvec")
!641 = !{!642, !643, !644}
!642 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !640, file: !309, line: 39, baseType: !573, size: 16)
!643 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !640, file: !309, line: 39, baseType: !573, size: 16, offset: 16)
!644 = !DIDerivedType(tag: DW_TAG_member, name: "h", scope: !640, file: !309, line: 39, baseType: !573, size: 16, offset: 32)
!645 = !{!646}
!646 = !DISubrange(count: 10)
!647 = !DIDerivedType(tag: DW_TAG_member, name: "subobj_flags", scope: !634, file: !528, line: 205, baseType: !63, size: 32, offset: 512)
!648 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_override", scope: !634, file: !528, line: 206, baseType: !63, size: 32, offset: 544)
!649 = !DIDerivedType(tag: DW_TAG_member, name: "alt_textures", scope: !634, file: !528, line: 207, baseType: !63, size: 32, offset: 576)
!650 = !DIDerivedType(tag: DW_TAG_member, name: "vclip_info", scope: !630, file: !528, line: 256, baseType: !651, size: 96)
!651 = !DIDerivedType(tag: DW_TAG_typedef, name: "vclip_info_t", file: !528, line: 197, baseType: !652)
!652 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vclip_info_s", file: !528, line: 192, size: 96, flags: DIFlagTypePassByValue, elements: !653, identifier: "_ZTS12vclip_info_s")
!653 = !{!654, !655, !656}
!654 = !DIDerivedType(tag: DW_TAG_member, name: "vclip_num", scope: !652, file: !528, line: 194, baseType: !63, size: 32)
!655 = !DIDerivedType(tag: DW_TAG_member, name: "frametime", scope: !652, file: !528, line: 195, baseType: !69, size: 32, offset: 32)
!656 = !DIDerivedType(tag: DW_TAG_member, name: "framenum", scope: !652, file: !528, line: 196, baseType: !155, size: 8, offset: 64)
!657 = !DILocalVariable(name: "psegs", arg: 1, scope: !523, file: !2, line: 143, type: !301)
!658 = !DILocation(line: 143, column: 38, scope: !523)
!659 = !DILocalVariable(name: "num_points", arg: 2, scope: !523, file: !2, line: 143, type: !315)
!660 = !DILocation(line: 143, column: 50, scope: !523)
!661 = !DILocalVariable(name: "objp", arg: 3, scope: !523, file: !2, line: 143, type: !526)
!662 = !DILocation(line: 143, column: 70, scope: !523)
!663 = !DILocalVariable(name: "rand_flag", arg: 4, scope: !523, file: !2, line: 143, type: !63)
!664 = !DILocation(line: 143, column: 80, scope: !523)
!665 = !DILocalVariable(name: "i", scope: !523, file: !2, line: 145, type: !63)
!666 = !DILocation(line: 145, column: 6, scope: !523)
!667 = !DILocalVariable(name: "new_psegs", scope: !523, file: !2, line: 146, type: !668)
!668 = !DICompositeType(tag: DW_TAG_array_type, baseType: !302, size: 25600, elements: !669)
!669 = !{!670}
!670 = !DISubrange(count: 200)
!671 = !DILocation(line: 146, column: 12, scope: !523)
!672 = !DILocation(line: 148, column: 2, scope: !523)
!673 = !DILocation(line: 150, column: 8, scope: !674)
!674 = distinct !DILexicalBlock(scope: !523, file: !2, line: 150, column: 2)
!675 = !DILocation(line: 150, column: 7, scope: !674)
!676 = !DILocation(line: 150, column: 12, scope: !677)
!677 = distinct !DILexicalBlock(scope: !674, file: !2, line: 150, column: 2)
!678 = !DILocation(line: 150, column: 15, scope: !677)
!679 = !DILocation(line: 150, column: 14, scope: !677)
!680 = !DILocation(line: 150, column: 25, scope: !677)
!681 = !DILocation(line: 150, column: 13, scope: !677)
!682 = !DILocation(line: 150, column: 2, scope: !674)
!683 = !DILocalVariable(name: "new_segnum", scope: !684, file: !2, line: 151, type: !63)
!684 = distinct !DILexicalBlock(scope: !677, file: !2, line: 150, column: 34)
!685 = !DILocation(line: 151, column: 9, scope: !684)
!686 = !DILocalVariable(name: "segment_size", scope: !684, file: !2, line: 152, type: !69)
!687 = !DILocation(line: 152, column: 9, scope: !684)
!688 = !DILocalVariable(name: "segnum", scope: !684, file: !2, line: 153, type: !63)
!689 = !DILocation(line: 153, column: 9, scope: !684)
!690 = !DILocalVariable(name: "a", scope: !684, file: !2, line: 154, type: !308)
!691 = !DILocation(line: 154, column: 14, scope: !684)
!692 = !DILocalVariable(name: "b", scope: !684, file: !2, line: 154, type: !308)
!693 = !DILocation(line: 154, column: 17, scope: !684)
!694 = !DILocalVariable(name: "c", scope: !684, file: !2, line: 154, type: !308)
!695 = !DILocation(line: 154, column: 20, scope: !684)
!696 = !DILocalVariable(name: "d", scope: !684, file: !2, line: 154, type: !308)
!697 = !DILocation(line: 154, column: 23, scope: !684)
!698 = !DILocalVariable(name: "e", scope: !684, file: !2, line: 154, type: !308)
!699 = !DILocation(line: 154, column: 26, scope: !684)
!700 = !DILocalVariable(name: "goal_pos", scope: !684, file: !2, line: 155, type: !308)
!701 = !DILocation(line: 155, column: 14, scope: !684)
!702 = !DILocalVariable(name: "count", scope: !684, file: !2, line: 156, type: !63)
!703 = !DILocation(line: 156, column: 9, scope: !684)
!704 = !DILocalVariable(name: "temp_segnum", scope: !684, file: !2, line: 157, type: !63)
!705 = !DILocation(line: 157, column: 9, scope: !684)
!706 = !DILocation(line: 160, column: 33, scope: !684)
!707 = !DILocation(line: 160, column: 39, scope: !684)
!708 = !DILocation(line: 160, column: 42, scope: !684)
!709 = !DILocation(line: 160, column: 49, scope: !684)
!710 = !DILocation(line: 160, column: 55, scope: !684)
!711 = !DILocation(line: 160, column: 58, scope: !684)
!712 = !DILocation(line: 160, column: 17, scope: !684)
!713 = !DILocation(line: 160, column: 15, scope: !684)
!714 = !DILocation(line: 161, column: 3, scope: !684)
!715 = !DILocation(line: 162, column: 21, scope: !684)
!716 = !DILocation(line: 162, column: 3, scope: !684)
!717 = !DILocation(line: 162, column: 9, scope: !684)
!718 = !DILocation(line: 162, column: 12, scope: !684)
!719 = !DILocation(line: 162, column: 19, scope: !684)
!720 = !DILocation(line: 163, column: 12, scope: !684)
!721 = !DILocation(line: 163, column: 18, scope: !684)
!722 = !DILocation(line: 163, column: 21, scope: !684)
!723 = !DILocation(line: 163, column: 10, scope: !684)
!724 = !DILocation(line: 165, column: 19, scope: !684)
!725 = !DILocation(line: 165, column: 25, scope: !684)
!726 = !DILocation(line: 165, column: 28, scope: !684)
!727 = !DILocation(line: 165, column: 36, scope: !684)
!728 = !DILocation(line: 165, column: 42, scope: !684)
!729 = !DILocation(line: 165, column: 43, scope: !684)
!730 = !DILocation(line: 165, column: 47, scope: !684)
!731 = !DILocation(line: 165, column: 3, scope: !684)
!732 = !DILocation(line: 166, column: 19, scope: !684)
!733 = !DILocation(line: 166, column: 25, scope: !684)
!734 = !DILocation(line: 166, column: 26, scope: !684)
!735 = !DILocation(line: 166, column: 30, scope: !684)
!736 = !DILocation(line: 166, column: 38, scope: !684)
!737 = !DILocation(line: 166, column: 44, scope: !684)
!738 = !DILocation(line: 166, column: 47, scope: !684)
!739 = !DILocation(line: 166, column: 3, scope: !684)
!740 = !DILocation(line: 167, column: 19, scope: !684)
!741 = !DILocation(line: 167, column: 25, scope: !684)
!742 = !DILocation(line: 167, column: 26, scope: !684)
!743 = !DILocation(line: 167, column: 30, scope: !684)
!744 = !DILocation(line: 167, column: 38, scope: !684)
!745 = !DILocation(line: 167, column: 44, scope: !684)
!746 = !DILocation(line: 167, column: 45, scope: !684)
!747 = !DILocation(line: 167, column: 49, scope: !684)
!748 = !DILocation(line: 167, column: 3, scope: !684)
!749 = !DILocation(line: 169, column: 3, scope: !684)
!750 = !DILocation(line: 170, column: 3, scope: !684)
!751 = !DILocation(line: 171, column: 11, scope: !752)
!752 = distinct !DILexicalBlock(scope: !684, file: !2, line: 171, column: 7)
!753 = !DILocation(line: 171, column: 7, scope: !752)
!754 = !DILocation(line: 171, column: 31, scope: !752)
!755 = !DILocation(line: 172, column: 14, scope: !756)
!756 = distinct !DILexicalBlock(scope: !757, file: !2, line: 172, column: 8)
!757 = distinct !DILexicalBlock(scope: !752, file: !2, line: 171, column: 44)
!758 = !DILocation(line: 172, column: 8, scope: !756)
!759 = !DILocation(line: 172, column: 17, scope: !756)
!760 = !DILocation(line: 173, column: 9, scope: !761)
!761 = distinct !DILexicalBlock(scope: !762, file: !2, line: 173, column: 9)
!762 = distinct !DILexicalBlock(scope: !756, file: !2, line: 172, column: 27)
!763 = !DILocation(line: 174, column: 13, scope: !764)
!764 = distinct !DILexicalBlock(scope: !761, file: !2, line: 173, column: 20)
!765 = !DILocation(line: 174, column: 21, scope: !764)
!766 = !DILocation(line: 174, column: 28, scope: !764)
!767 = !DILocation(line: 174, column: 8, scope: !764)
!768 = !DILocation(line: 174, column: 10, scope: !764)
!769 = !DILocation(line: 175, column: 13, scope: !764)
!770 = !DILocation(line: 175, column: 21, scope: !764)
!771 = !DILocation(line: 175, column: 28, scope: !764)
!772 = !DILocation(line: 175, column: 8, scope: !764)
!773 = !DILocation(line: 175, column: 10, scope: !764)
!774 = !DILocation(line: 176, column: 18, scope: !764)
!775 = !DILocation(line: 176, column: 12, scope: !764)
!776 = !DILocation(line: 176, column: 29, scope: !764)
!777 = !DILocation(line: 176, column: 23, scope: !764)
!778 = !DILocation(line: 176, column: 21, scope: !764)
!779 = !DILocation(line: 176, column: 32, scope: !764)
!780 = !DILocation(line: 176, column: 8, scope: !764)
!781 = !DILocation(line: 176, column: 10, scope: !764)
!782 = !DILocation(line: 177, column: 6, scope: !764)
!783 = !DILocation(line: 178, column: 5, scope: !764)
!784 = !DILocation(line: 179, column: 8, scope: !785)
!785 = distinct !DILexicalBlock(scope: !761, file: !2, line: 178, column: 12)
!786 = !DILocation(line: 179, column: 10, scope: !785)
!787 = !DILocation(line: 180, column: 8, scope: !785)
!788 = !DILocation(line: 180, column: 10, scope: !785)
!789 = !DILocation(line: 181, column: 8, scope: !785)
!790 = !DILocation(line: 181, column: 10, scope: !785)
!791 = !DILocation(line: 183, column: 4, scope: !762)
!792 = !DILocation(line: 184, column: 9, scope: !793)
!793 = distinct !DILexicalBlock(scope: !794, file: !2, line: 184, column: 9)
!794 = distinct !DILexicalBlock(scope: !756, file: !2, line: 183, column: 11)
!795 = !DILocation(line: 185, column: 13, scope: !796)
!796 = distinct !DILexicalBlock(scope: !793, file: !2, line: 184, column: 20)
!797 = !DILocation(line: 185, column: 21, scope: !796)
!798 = !DILocation(line: 185, column: 28, scope: !796)
!799 = !DILocation(line: 185, column: 8, scope: !796)
!800 = !DILocation(line: 185, column: 10, scope: !796)
!801 = !DILocation(line: 186, column: 13, scope: !796)
!802 = !DILocation(line: 186, column: 21, scope: !796)
!803 = !DILocation(line: 186, column: 28, scope: !796)
!804 = !DILocation(line: 186, column: 8, scope: !796)
!805 = !DILocation(line: 186, column: 10, scope: !796)
!806 = !DILocation(line: 187, column: 18, scope: !796)
!807 = !DILocation(line: 187, column: 12, scope: !796)
!808 = !DILocation(line: 187, column: 29, scope: !796)
!809 = !DILocation(line: 187, column: 23, scope: !796)
!810 = !DILocation(line: 187, column: 21, scope: !796)
!811 = !DILocation(line: 187, column: 32, scope: !796)
!812 = !DILocation(line: 187, column: 8, scope: !796)
!813 = !DILocation(line: 187, column: 10, scope: !796)
!814 = !DILocation(line: 188, column: 6, scope: !796)
!815 = !DILocation(line: 189, column: 5, scope: !796)
!816 = !DILocation(line: 190, column: 8, scope: !817)
!817 = distinct !DILexicalBlock(scope: !793, file: !2, line: 189, column: 12)
!818 = !DILocation(line: 190, column: 10, scope: !817)
!819 = !DILocation(line: 191, column: 8, scope: !817)
!820 = !DILocation(line: 191, column: 10, scope: !817)
!821 = !DILocation(line: 192, column: 8, scope: !817)
!822 = !DILocation(line: 192, column: 10, scope: !817)
!823 = !DILocation(line: 195, column: 3, scope: !757)
!824 = !DILocation(line: 196, column: 4, scope: !825)
!825 = distinct !DILexicalBlock(scope: !752, file: !2, line: 195, column: 10)
!826 = !DILocation(line: 197, column: 4, scope: !825)
!827 = !DILocation(line: 198, column: 4, scope: !825)
!828 = !DILocation(line: 201, column: 5, scope: !829)
!829 = distinct !DILexicalBlock(scope: !684, file: !2, line: 201, column: 5)
!830 = !DILocation(line: 201, column: 26, scope: !829)
!831 = !DILocation(line: 202, column: 2, scope: !829)
!832 = !DILocation(line: 206, column: 55, scope: !684)
!833 = !DILocation(line: 206, column: 46, scope: !684)
!834 = !DILocation(line: 206, column: 63, scope: !684)
!835 = !DILocation(line: 206, column: 37, scope: !684)
!836 = !DILocation(line: 206, column: 93, scope: !684)
!837 = !DILocation(line: 206, column: 84, scope: !684)
!838 = !DILocation(line: 206, column: 101, scope: !684)
!839 = !DILocation(line: 206, column: 75, scope: !684)
!840 = !DILocation(line: 206, column: 18, scope: !684)
!841 = !DILocation(line: 206, column: 16, scope: !684)
!842 = !DILocation(line: 207, column: 7, scope: !843)
!843 = distinct !DILexicalBlock(scope: !684, file: !2, line: 207, column: 7)
!844 = !DILocation(line: 207, column: 20, scope: !843)
!845 = !DILocation(line: 208, column: 17, scope: !843)
!846 = !DILocation(line: 208, column: 4, scope: !843)
!847 = !DILocation(line: 210, column: 32, scope: !684)
!848 = !DILocation(line: 210, column: 38, scope: !684)
!849 = !DILocation(line: 210, column: 41, scope: !684)
!850 = !DILocation(line: 210, column: 52, scope: !684)
!851 = !DILocation(line: 210, column: 64, scope: !684)
!852 = !DILocation(line: 210, column: 3, scope: !684)
!853 = !DILocation(line: 212, column: 9, scope: !684)
!854 = !DILocation(line: 213, column: 3, scope: !684)
!855 = !DILocation(line: 213, column: 10, scope: !684)
!856 = !DILocalVariable(name: "fq", scope: !857, file: !2, line: 214, type: !858)
!857 = distinct !DILexicalBlock(scope: !684, file: !2, line: 213, column: 17)
!858 = !DIDerivedType(tag: DW_TAG_typedef, name: "fvi_query", file: !859, line: 58, baseType: !860)
!859 = !DIFile(filename: "main_d2/fvi.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "d2a92d1b0ff4ebfc1a57eff3c7d6fa46")
!860 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fvi_query", file: !859, line: 50, size: 384, flags: DIFlagTypePassByValue, elements: !861, identifier: "_ZTS9fvi_query")
!861 = !{!862, !864, !865, !866, !867, !868, !869}
!862 = !DIDerivedType(tag: DW_TAG_member, name: "p0", scope: !860, file: !859, line: 52, baseType: !863, size: 64)
!863 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !308, size: 64)
!864 = !DIDerivedType(tag: DW_TAG_member, name: "p1", scope: !860, file: !859, line: 52, baseType: !863, size: 64, offset: 64)
!865 = !DIDerivedType(tag: DW_TAG_member, name: "startseg", scope: !860, file: !859, line: 53, baseType: !63, size: 32, offset: 128)
!866 = !DIDerivedType(tag: DW_TAG_member, name: "rad", scope: !860, file: !859, line: 54, baseType: !69, size: 32, offset: 160)
!867 = !DIDerivedType(tag: DW_TAG_member, name: "thisobjnum", scope: !860, file: !859, line: 55, baseType: !162, size: 16, offset: 192)
!868 = !DIDerivedType(tag: DW_TAG_member, name: "ignore_obj_list", scope: !860, file: !859, line: 56, baseType: !315, size: 64, offset: 256)
!869 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !860, file: !859, line: 57, baseType: !63, size: 32, offset: 320)
!870 = !DILocation(line: 214, column: 14, scope: !857)
!871 = !DILocalVariable(name: "hit_data", scope: !857, file: !2, line: 215, type: !872)
!872 = !DIDerivedType(tag: DW_TAG_typedef, name: "fvi_info", file: !859, line: 40, baseType: !873)
!873 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fvi_info", file: !859, line: 29, size: 3584, flags: DIFlagTypePassByValue, elements: !874, identifier: "_ZTS8fvi_info")
!874 = !{!875, !876, !877, !878, !879, !880, !881, !882, !883}
!875 = !DIDerivedType(tag: DW_TAG_member, name: "hit_type", scope: !873, file: !859, line: 31, baseType: !63, size: 32)
!876 = !DIDerivedType(tag: DW_TAG_member, name: "hit_pnt", scope: !873, file: !859, line: 32, baseType: !308, size: 96, offset: 32)
!877 = !DIDerivedType(tag: DW_TAG_member, name: "hit_seg", scope: !873, file: !859, line: 33, baseType: !63, size: 32, offset: 128)
!878 = !DIDerivedType(tag: DW_TAG_member, name: "hit_side", scope: !873, file: !859, line: 34, baseType: !63, size: 32, offset: 160)
!879 = !DIDerivedType(tag: DW_TAG_member, name: "hit_side_seg", scope: !873, file: !859, line: 35, baseType: !63, size: 32, offset: 192)
!880 = !DIDerivedType(tag: DW_TAG_member, name: "hit_object", scope: !873, file: !859, line: 36, baseType: !63, size: 32, offset: 224)
!881 = !DIDerivedType(tag: DW_TAG_member, name: "hit_wallnorm", scope: !873, file: !859, line: 37, baseType: !308, size: 96, offset: 256)
!882 = !DIDerivedType(tag: DW_TAG_member, name: "n_segs", scope: !873, file: !859, line: 38, baseType: !63, size: 32, offset: 352)
!883 = !DIDerivedType(tag: DW_TAG_member, name: "seglist", scope: !873, file: !859, line: 39, baseType: !884, size: 3200, offset: 384)
!884 = !DICompositeType(tag: DW_TAG_array_type, baseType: !63, size: 3200, elements: !885)
!885 = !{!886}
!886 = !DISubrange(count: 100)
!887 = !DILocation(line: 215, column: 14, scope: !857)
!888 = !DILocalVariable(name: "hit_type", scope: !857, file: !2, line: 216, type: !63)
!889 = !DILocation(line: 216, column: 10, scope: !857)
!890 = !DILocation(line: 218, column: 18, scope: !857)
!891 = !DILocation(line: 218, column: 24, scope: !857)
!892 = !DILocation(line: 218, column: 27, scope: !857)
!893 = !DILocation(line: 218, column: 7, scope: !857)
!894 = !DILocation(line: 218, column: 15, scope: !857)
!895 = !DILocation(line: 219, column: 21, scope: !857)
!896 = !DILocation(line: 219, column: 27, scope: !857)
!897 = !DILocation(line: 219, column: 30, scope: !857)
!898 = !DILocation(line: 219, column: 7, scope: !857)
!899 = !DILocation(line: 219, column: 19, scope: !857)
!900 = !DILocation(line: 220, column: 7, scope: !857)
!901 = !DILocation(line: 220, column: 15, scope: !857)
!902 = !DILocation(line: 221, column: 17, scope: !857)
!903 = !DILocation(line: 221, column: 23, scope: !857)
!904 = !DILocation(line: 221, column: 7, scope: !857)
!905 = !DILocation(line: 221, column: 15, scope: !857)
!906 = !DILocation(line: 222, column: 22, scope: !857)
!907 = !DILocation(line: 222, column: 26, scope: !857)
!908 = !DILocation(line: 222, column: 7, scope: !857)
!909 = !DILocation(line: 222, column: 20, scope: !857)
!910 = !DILocation(line: 223, column: 7, scope: !857)
!911 = !DILocation(line: 223, column: 23, scope: !857)
!912 = !DILocation(line: 224, column: 7, scope: !857)
!913 = !DILocation(line: 224, column: 17, scope: !857)
!914 = !DILocation(line: 226, column: 15, scope: !857)
!915 = !DILocation(line: 226, column: 13, scope: !857)
!916 = !DILocation(line: 228, column: 8, scope: !917)
!917 = distinct !DILexicalBlock(scope: !857, file: !2, line: 228, column: 8)
!918 = !DILocation(line: 228, column: 17, scope: !917)
!919 = !DILocation(line: 229, column: 11, scope: !917)
!920 = !DILocation(line: 229, column: 5, scope: !917)
!921 = !DILocation(line: 231, column: 10, scope: !922)
!922 = distinct !DILexicalBlock(scope: !923, file: !2, line: 231, column: 9)
!923 = distinct !DILexicalBlock(scope: !917, file: !2, line: 230, column: 9)
!924 = !DILocation(line: 231, column: 16, scope: !922)
!925 = !DILocation(line: 231, column: 22, scope: !922)
!926 = !DILocation(line: 231, column: 26, scope: !922)
!927 = !DILocation(line: 231, column: 35, scope: !922)
!928 = !DILocation(line: 232, column: 6, scope: !922)
!929 = !DILocation(line: 233, column: 22, scope: !923)
!930 = !DILocation(line: 233, column: 26, scope: !923)
!931 = !DILocation(line: 233, column: 39, scope: !923)
!932 = !DILocation(line: 233, column: 47, scope: !923)
!933 = !DILocation(line: 233, column: 28, scope: !923)
!934 = !DILocation(line: 233, column: 49, scope: !923)
!935 = !DILocation(line: 233, column: 14, scope: !923)
!936 = !DILocation(line: 233, column: 16, scope: !923)
!937 = !DILocation(line: 234, column: 22, scope: !923)
!938 = !DILocation(line: 234, column: 26, scope: !923)
!939 = !DILocation(line: 234, column: 39, scope: !923)
!940 = !DILocation(line: 234, column: 47, scope: !923)
!941 = !DILocation(line: 234, column: 28, scope: !923)
!942 = !DILocation(line: 234, column: 49, scope: !923)
!943 = !DILocation(line: 234, column: 14, scope: !923)
!944 = !DILocation(line: 234, column: 16, scope: !923)
!945 = !DILocation(line: 235, column: 22, scope: !923)
!946 = !DILocation(line: 235, column: 26, scope: !923)
!947 = !DILocation(line: 235, column: 39, scope: !923)
!948 = !DILocation(line: 235, column: 47, scope: !923)
!949 = !DILocation(line: 235, column: 28, scope: !923)
!950 = !DILocation(line: 235, column: 49, scope: !923)
!951 = !DILocation(line: 235, column: 14, scope: !923)
!952 = !DILocation(line: 235, column: 16, scope: !923)
!953 = !DILocation(line: 236, column: 10, scope: !923)
!954 = !DILocation(line: 237, column: 9, scope: !955)
!955 = distinct !DILexicalBlock(scope: !923, file: !2, line: 237, column: 9)
!956 = !DILocation(line: 237, column: 15, scope: !955)
!957 = !DILocation(line: 238, column: 17, scope: !958)
!958 = distinct !DILexicalBlock(scope: !955, file: !2, line: 237, column: 21)
!959 = !DILocation(line: 238, column: 23, scope: !958)
!960 = !DILocation(line: 238, column: 26, scope: !958)
!961 = !DILocation(line: 238, column: 15, scope: !958)
!962 = !DILocation(line: 239, column: 5, scope: !958)
!963 = distinct !{!963, !854, !964, !262}
!964 = !DILocation(line: 241, column: 3, scope: !684)
!965 = !DILocation(line: 244, column: 42, scope: !684)
!966 = !DILocation(line: 244, column: 48, scope: !684)
!967 = !DILocation(line: 244, column: 51, scope: !684)
!968 = !DILocation(line: 244, column: 16, scope: !684)
!969 = !DILocation(line: 244, column: 14, scope: !684)
!970 = !DILocation(line: 245, column: 7, scope: !971)
!971 = distinct !DILexicalBlock(scope: !684, file: !2, line: 245, column: 7)
!972 = !DILocation(line: 245, column: 21, scope: !971)
!973 = !DILocation(line: 245, column: 27, scope: !971)
!974 = !DILocation(line: 245, column: 30, scope: !971)
!975 = !DILocation(line: 245, column: 18, scope: !971)
!976 = !DILocation(line: 246, column: 14, scope: !977)
!977 = distinct !DILexicalBlock(scope: !971, file: !2, line: 245, column: 38)
!978 = !DILocation(line: 246, column: 4, scope: !977)
!979 = !DILocation(line: 246, column: 17, scope: !977)
!980 = !DILocation(line: 246, column: 23, scope: !977)
!981 = !DILocation(line: 247, column: 26, scope: !977)
!982 = !DILocation(line: 247, column: 14, scope: !977)
!983 = !DILocation(line: 247, column: 4, scope: !977)
!984 = !DILocation(line: 247, column: 17, scope: !977)
!985 = !DILocation(line: 247, column: 24, scope: !977)
!986 = !DILocation(line: 248, column: 3, scope: !977)
!987 = !DILocation(line: 249, column: 25, scope: !988)
!988 = distinct !DILexicalBlock(scope: !971, file: !2, line: 248, column: 10)
!989 = !DILocation(line: 249, column: 31, scope: !988)
!990 = !DILocation(line: 249, column: 34, scope: !988)
!991 = !DILocation(line: 249, column: 14, scope: !988)
!992 = !DILocation(line: 249, column: 4, scope: !988)
!993 = !DILocation(line: 249, column: 17, scope: !988)
!994 = !DILocation(line: 249, column: 23, scope: !988)
!995 = !DILocation(line: 250, column: 26, scope: !988)
!996 = !DILocation(line: 250, column: 32, scope: !988)
!997 = !DILocation(line: 250, column: 35, scope: !988)
!998 = !DILocation(line: 250, column: 14, scope: !988)
!999 = !DILocation(line: 250, column: 4, scope: !988)
!1000 = !DILocation(line: 250, column: 17, scope: !988)
!1001 = !DILocation(line: 250, column: 24, scope: !988)
!1002 = !DILocation(line: 253, column: 2, scope: !684)
!1003 = !DILocation(line: 150, column: 30, scope: !677)
!1004 = !DILocation(line: 150, column: 2, scope: !677)
!1005 = distinct !{!1005, !682, !1006, !262}
!1006 = !DILocation(line: 253, column: 2, scope: !674)
!1007 = !DILocation(line: 255, column: 8, scope: !1008)
!1008 = distinct !DILexicalBlock(scope: !523, file: !2, line: 255, column: 2)
!1009 = !DILocation(line: 255, column: 7, scope: !1008)
!1010 = !DILocation(line: 255, column: 12, scope: !1011)
!1011 = distinct !DILexicalBlock(scope: !1008, file: !2, line: 255, column: 2)
!1012 = !DILocation(line: 255, column: 15, scope: !1011)
!1013 = !DILocation(line: 255, column: 14, scope: !1011)
!1014 = !DILocation(line: 255, column: 25, scope: !1011)
!1015 = !DILocation(line: 255, column: 13, scope: !1011)
!1016 = !DILocation(line: 255, column: 2, scope: !1008)
!1017 = !DILocation(line: 256, column: 24, scope: !1011)
!1018 = !DILocation(line: 256, column: 14, scope: !1011)
!1019 = !DILocation(line: 256, column: 3, scope: !1011)
!1020 = !DILocation(line: 256, column: 9, scope: !1011)
!1021 = !DILocation(line: 256, column: 12, scope: !1011)
!1022 = !DILocation(line: 255, column: 30, scope: !1011)
!1023 = !DILocation(line: 255, column: 2, scope: !1011)
!1024 = distinct !{!1024, !1016, !1025, !262}
!1025 = !DILocation(line: 256, column: 25, scope: !1008)
!1026 = !DILocation(line: 257, column: 1, scope: !523)
!1027 = distinct !DISubprogram(name: "create_path_points", linkageName: "_Z18create_path_pointsP6objectiiP9point_segPsiiii", scope: !2, file: !2, line: 272, type: !1028, scopeLine: 273, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !242)
!1028 = !DISubroutineType(types: !1029)
!1029 = !{!63, !526, !63, !63, !301, !1030, !63, !63, !63, !63}
!1030 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !162, size: 64)
!1031 = !DILocalVariable(name: "objp", arg: 1, scope: !1027, file: !2, line: 272, type: !526)
!1032 = !DILocation(line: 272, column: 32, scope: !1027)
!1033 = !DILocalVariable(name: "start_seg", arg: 2, scope: !1027, file: !2, line: 272, type: !63)
!1034 = !DILocation(line: 272, column: 42, scope: !1027)
!1035 = !DILocalVariable(name: "end_seg", arg: 3, scope: !1027, file: !2, line: 272, type: !63)
!1036 = !DILocation(line: 272, column: 57, scope: !1027)
!1037 = !DILocalVariable(name: "psegs", arg: 4, scope: !1027, file: !2, line: 272, type: !301)
!1038 = !DILocation(line: 272, column: 77, scope: !1027)
!1039 = !DILocalVariable(name: "num_points", arg: 5, scope: !1027, file: !2, line: 272, type: !1030)
!1040 = !DILocation(line: 272, column: 91, scope: !1027)
!1041 = !DILocalVariable(name: "max_depth", arg: 6, scope: !1027, file: !2, line: 272, type: !63)
!1042 = !DILocation(line: 272, column: 107, scope: !1027)
!1043 = !DILocalVariable(name: "random_flag", arg: 7, scope: !1027, file: !2, line: 272, type: !63)
!1044 = !DILocation(line: 272, column: 122, scope: !1027)
!1045 = !DILocalVariable(name: "safety_flag", arg: 8, scope: !1027, file: !2, line: 272, type: !63)
!1046 = !DILocation(line: 272, column: 139, scope: !1027)
!1047 = !DILocalVariable(name: "avoid_seg", arg: 9, scope: !1027, file: !2, line: 272, type: !63)
!1048 = !DILocation(line: 272, column: 156, scope: !1027)
!1049 = !DILocalVariable(name: "cur_seg", scope: !1027, file: !2, line: 274, type: !63)
!1050 = !DILocation(line: 274, column: 7, scope: !1027)
!1051 = !DILocalVariable(name: "sidenum", scope: !1027, file: !2, line: 275, type: !63)
!1052 = !DILocation(line: 275, column: 7, scope: !1027)
!1053 = !DILocalVariable(name: "qtail", scope: !1027, file: !2, line: 276, type: !63)
!1054 = !DILocation(line: 276, column: 7, scope: !1027)
!1055 = !DILocalVariable(name: "qhead", scope: !1027, file: !2, line: 276, type: !63)
!1056 = !DILocation(line: 276, column: 18, scope: !1027)
!1057 = !DILocalVariable(name: "i", scope: !1027, file: !2, line: 277, type: !63)
!1058 = !DILocation(line: 277, column: 7, scope: !1027)
!1059 = !DILocalVariable(name: "visited", scope: !1027, file: !2, line: 278, type: !1060)
!1060 = !DICompositeType(tag: DW_TAG_array_type, baseType: !155, size: 7200, elements: !1061)
!1061 = !{!1062}
!1062 = !DISubrange(count: 900)
!1063 = !DILocation(line: 278, column: 10, scope: !1027)
!1064 = !DILocalVariable(name: "seg_queue", scope: !1027, file: !2, line: 279, type: !1065)
!1065 = !DICompositeType(tag: DW_TAG_array_type, baseType: !1066, size: 28800, elements: !1061)
!1066 = !DIDerivedType(tag: DW_TAG_typedef, name: "seg_seg", file: !303, line: 182, baseType: !1067)
!1067 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !303, line: 180, size: 32, flags: DIFlagTypePassByValue, elements: !1068, identifier: "_ZTS7seg_seg")
!1068 = !{!1069, !1070}
!1069 = !DIDerivedType(tag: DW_TAG_member, name: "start", scope: !1067, file: !303, line: 181, baseType: !162, size: 16)
!1070 = !DIDerivedType(tag: DW_TAG_member, name: "end", scope: !1067, file: !303, line: 181, baseType: !162, size: 16, offset: 16)
!1071 = !DILocation(line: 279, column: 10, scope: !1027)
!1072 = !DILocalVariable(name: "depth", scope: !1027, file: !2, line: 280, type: !1073)
!1073 = !DICompositeType(tag: DW_TAG_array_type, baseType: !162, size: 14400, elements: !1061)
!1074 = !DILocation(line: 280, column: 9, scope: !1027)
!1075 = !DILocalVariable(name: "cur_depth", scope: !1027, file: !2, line: 281, type: !63)
!1076 = !DILocation(line: 281, column: 7, scope: !1027)
!1077 = !DILocalVariable(name: "random_xlate", scope: !1027, file: !2, line: 282, type: !1078)
!1078 = !DICompositeType(tag: DW_TAG_array_type, baseType: !155, size: 48, elements: !1079)
!1079 = !{!1080}
!1080 = !DISubrange(count: 6)
!1081 = !DILocation(line: 282, column: 10, scope: !1027)
!1082 = !DILocalVariable(name: "original_psegs", scope: !1027, file: !2, line: 283, type: !301)
!1083 = !DILocation(line: 283, column: 13, scope: !1027)
!1084 = !DILocation(line: 283, column: 30, scope: !1027)
!1085 = !DILocalVariable(name: "l_num_points", scope: !1027, file: !2, line: 284, type: !63)
!1086 = !DILocation(line: 284, column: 7, scope: !1027)
!1087 = !DILocation(line: 291, column: 6, scope: !1088)
!1088 = distinct !DILexicalBlock(scope: !1027, file: !2, line: 291, column: 5)
!1089 = !DILocation(line: 291, column: 12, scope: !1088)
!1090 = !DILocation(line: 291, column: 17, scope: !1088)
!1091 = !DILocation(line: 291, column: 31, scope: !1088)
!1092 = !DILocation(line: 291, column: 35, scope: !1088)
!1093 = !DILocation(line: 291, column: 41, scope: !1088)
!1094 = !DILocation(line: 291, column: 55, scope: !1088)
!1095 = !DILocation(line: 291, column: 64, scope: !1088)
!1096 = !DILocation(line: 292, column: 14, scope: !1097)
!1097 = distinct !DILexicalBlock(scope: !1088, file: !2, line: 291, column: 82)
!1098 = !DILocation(line: 293, column: 14, scope: !1097)
!1099 = !DILocation(line: 293, column: 29, scope: !1097)
!1100 = !DILocation(line: 293, column: 12, scope: !1097)
!1101 = !DILocation(line: 295, column: 1, scope: !1097)
!1102 = !DILocation(line: 297, column: 6, scope: !1103)
!1103 = distinct !DILexicalBlock(scope: !1027, file: !2, line: 297, column: 6)
!1104 = !DILocation(line: 297, column: 16, scope: !1103)
!1105 = !DILocation(line: 298, column: 13, scope: !1103)
!1106 = !DILocation(line: 298, column: 3, scope: !1103)
!1107 = !DILocation(line: 300, column: 15, scope: !1027)
!1108 = !DILocation(line: 308, column: 2, scope: !1027)
!1109 = !DILocation(line: 308, column: 41, scope: !1027)
!1110 = !DILocation(line: 308, column: 62, scope: !1027)
!1111 = !DILocation(line: 308, column: 40, scope: !1027)
!1112 = !DILocation(line: 308, column: 39, scope: !1027)
!1113 = !DILocation(line: 309, column: 2, scope: !1027)
!1114 = !DILocation(line: 309, column: 37, scope: !1027)
!1115 = !DILocation(line: 309, column: 58, scope: !1027)
!1116 = !DILocation(line: 309, column: 36, scope: !1027)
!1117 = !DILocation(line: 309, column: 35, scope: !1027)
!1118 = !DILocation(line: 312, column: 6, scope: !1119)
!1119 = distinct !DILexicalBlock(scope: !1027, file: !2, line: 312, column: 6)
!1120 = !DILocation(line: 312, column: 16, scope: !1119)
!1121 = !DILocation(line: 313, column: 3, scope: !1122)
!1122 = distinct !DILexicalBlock(scope: !1119, file: !2, line: 312, column: 23)
!1123 = !DILocation(line: 314, column: 8, scope: !1124)
!1124 = distinct !DILexicalBlock(scope: !1122, file: !2, line: 314, column: 7)
!1125 = !DILocation(line: 314, column: 21, scope: !1124)
!1126 = !DILocation(line: 314, column: 18, scope: !1124)
!1127 = !DILocation(line: 314, column: 32, scope: !1124)
!1128 = !DILocation(line: 314, column: 36, scope: !1124)
!1129 = !DILocation(line: 314, column: 47, scope: !1124)
!1130 = !DILocation(line: 314, column: 44, scope: !1124)
!1131 = !DILocation(line: 316, column: 12, scope: !1132)
!1132 = distinct !DILexicalBlock(scope: !1124, file: !2, line: 315, column: 3)
!1133 = !DILocation(line: 316, column: 4, scope: !1132)
!1134 = !DILocation(line: 316, column: 23, scope: !1132)
!1135 = !DILocation(line: 317, column: 10, scope: !1132)
!1136 = !DILocation(line: 317, column: 4, scope: !1132)
!1137 = !DILocation(line: 317, column: 21, scope: !1132)
!1138 = !DILocation(line: 318, column: 3, scope: !1132)
!1139 = !DILocation(line: 320, column: 2, scope: !1122)
!1140 = !DILocation(line: 322, column: 6, scope: !1141)
!1141 = distinct !DILexicalBlock(scope: !1027, file: !2, line: 322, column: 6)
!1142 = !DILocation(line: 323, column: 23, scope: !1141)
!1143 = !DILocation(line: 323, column: 3, scope: !1141)
!1144 = !DILocation(line: 325, column: 12, scope: !1027)
!1145 = !DILocation(line: 325, column: 10, scope: !1027)
!1146 = !DILocation(line: 326, column: 10, scope: !1027)
!1147 = !DILocation(line: 326, column: 2, scope: !1027)
!1148 = !DILocation(line: 326, column: 19, scope: !1027)
!1149 = !DILocation(line: 327, column: 12, scope: !1027)
!1150 = !DILocation(line: 329, column: 2, scope: !1027)
!1151 = !DILocation(line: 329, column: 9, scope: !1027)
!1152 = !DILocation(line: 329, column: 20, scope: !1027)
!1153 = !DILocation(line: 329, column: 17, scope: !1027)
!1154 = !DILocalVariable(name: "segp", scope: !1155, file: !2, line: 331, type: !1156)
!1155 = distinct !DILexicalBlock(scope: !1027, file: !2, line: 330, column: 2)
!1156 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1157, size: 64)
!1157 = !DIDerivedType(tag: DW_TAG_typedef, name: "segment", file: !1158, line: 123, baseType: !1159)
!1158 = !DIFile(filename: "main_d2/segment.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "c950815a9b07e6bab2fa2587b90affec")
!1159 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "segment", file: !1158, line: 100, size: 4096, flags: DIFlagTypePassByValue, elements: !1160, identifier: "_ZTS7segment")
!1160 = !{!1161, !1185, !1187, !1191}
!1161 = !DIDerivedType(tag: DW_TAG_member, name: "sides", scope: !1159, file: !1158, line: 105, baseType: !1162, size: 3840)
!1162 = !DICompositeType(tag: DW_TAG_array_type, baseType: !1163, size: 3840, elements: !1079)
!1163 = !DIDerivedType(tag: DW_TAG_typedef, name: "side", file: !1158, line: 91, baseType: !1164)
!1164 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "side", file: !1158, line: 82, size: 640, flags: DIFlagTypePassByValue, elements: !1165, identifier: "_ZTS4side")
!1165 = !{!1166, !1167, !1168, !1169, !1170, !1171, !1181}
!1166 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !1164, file: !1158, line: 84, baseType: !155, size: 8)
!1167 = !DIDerivedType(tag: DW_TAG_member, name: "pad", scope: !1164, file: !1158, line: 85, baseType: !166, size: 8, offset: 8)
!1168 = !DIDerivedType(tag: DW_TAG_member, name: "wall_num", scope: !1164, file: !1158, line: 86, baseType: !162, size: 16, offset: 16)
!1169 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_num", scope: !1164, file: !1158, line: 87, baseType: !162, size: 16, offset: 32)
!1170 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_num2", scope: !1164, file: !1158, line: 88, baseType: !162, size: 16, offset: 48)
!1171 = !DIDerivedType(tag: DW_TAG_member, name: "uvls", scope: !1164, file: !1158, line: 89, baseType: !1172, size: 384, offset: 64)
!1172 = !DICompositeType(tag: DW_TAG_array_type, baseType: !1173, size: 384, elements: !1179)
!1173 = !DIDerivedType(tag: DW_TAG_typedef, name: "uvl", file: !1158, line: 67, baseType: !1174)
!1174 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uvl", file: !1158, line: 64, size: 96, flags: DIFlagTypePassByValue, elements: !1175, identifier: "_ZTS3uvl")
!1175 = !{!1176, !1177, !1178}
!1176 = !DIDerivedType(tag: DW_TAG_member, name: "u", scope: !1174, file: !1158, line: 66, baseType: !69, size: 32)
!1177 = !DIDerivedType(tag: DW_TAG_member, name: "v", scope: !1174, file: !1158, line: 66, baseType: !69, size: 32, offset: 32)
!1178 = !DIDerivedType(tag: DW_TAG_member, name: "l", scope: !1174, file: !1158, line: 66, baseType: !69, size: 32, offset: 64)
!1179 = !{!1180}
!1180 = !DISubrange(count: 4)
!1181 = !DIDerivedType(tag: DW_TAG_member, name: "normals", scope: !1164, file: !1158, line: 90, baseType: !1182, size: 192, offset: 448)
!1182 = !DICompositeType(tag: DW_TAG_array_type, baseType: !308, size: 192, elements: !1183)
!1183 = !{!1184}
!1184 = !DISubrange(count: 2)
!1185 = !DIDerivedType(tag: DW_TAG_member, name: "children", scope: !1159, file: !1158, line: 106, baseType: !1186, size: 96, offset: 3840)
!1186 = !DICompositeType(tag: DW_TAG_array_type, baseType: !162, size: 96, elements: !1079)
!1187 = !DIDerivedType(tag: DW_TAG_member, name: "verts", scope: !1159, file: !1158, line: 107, baseType: !1188, size: 128, offset: 3936)
!1188 = !DICompositeType(tag: DW_TAG_array_type, baseType: !162, size: 128, elements: !1189)
!1189 = !{!1190}
!1190 = !DISubrange(count: 8)
!1191 = !DIDerivedType(tag: DW_TAG_member, name: "objects", scope: !1159, file: !1158, line: 112, baseType: !63, size: 32, offset: 4064)
!1192 = !DILocation(line: 331, column: 12, scope: !1155)
!1193 = !DILocation(line: 331, column: 29, scope: !1155)
!1194 = !DILocation(line: 331, column: 20, scope: !1155)
!1195 = !DILocation(line: 333, column: 7, scope: !1196)
!1196 = distinct !DILexicalBlock(scope: !1155, file: !2, line: 333, column: 7)
!1197 = !DILocation(line: 334, column: 8, scope: !1198)
!1198 = distinct !DILexicalBlock(scope: !1196, file: !2, line: 334, column: 8)
!1199 = !DILocation(line: 334, column: 17, scope: !1198)
!1200 = !DILocation(line: 335, column: 25, scope: !1198)
!1201 = !DILocation(line: 335, column: 5, scope: !1198)
!1202 = !DILocation(line: 334, column: 19, scope: !1198)
!1203 = !DILocation(line: 338, column: 16, scope: !1204)
!1204 = distinct !DILexicalBlock(scope: !1155, file: !2, line: 338, column: 3)
!1205 = !DILocation(line: 338, column: 8, scope: !1204)
!1206 = !DILocation(line: 338, column: 21, scope: !1207)
!1207 = distinct !DILexicalBlock(scope: !1204, file: !2, line: 338, column: 3)
!1208 = !DILocation(line: 338, column: 29, scope: !1207)
!1209 = !DILocation(line: 338, column: 3, scope: !1204)
!1210 = !DILocalVariable(name: "snum", scope: !1211, file: !2, line: 341, type: !63)
!1211 = distinct !DILexicalBlock(scope: !1207, file: !2, line: 339, column: 3)
!1212 = !DILocation(line: 341, column: 8, scope: !1211)
!1213 = !DILocation(line: 341, column: 15, scope: !1211)
!1214 = !DILocation(line: 343, column: 8, scope: !1215)
!1215 = distinct !DILexicalBlock(scope: !1211, file: !2, line: 343, column: 8)
!1216 = !DILocation(line: 344, column: 25, scope: !1215)
!1217 = !DILocation(line: 344, column: 12, scope: !1215)
!1218 = !DILocation(line: 344, column: 10, scope: !1215)
!1219 = !DILocation(line: 344, column: 5, scope: !1215)
!1220 = !DILocation(line: 346, column: 8, scope: !1221)
!1221 = distinct !DILexicalBlock(scope: !1211, file: !2, line: 346, column: 8)
!1222 = !DILocation(line: 346, column: 39, scope: !1221)
!1223 = !DILocation(line: 346, column: 44, scope: !1221)
!1224 = !DILocation(line: 346, column: 72, scope: !1221)
!1225 = !DILocation(line: 346, column: 43, scope: !1221)
!1226 = !DILocation(line: 346, column: 88, scope: !1221)
!1227 = !DILocation(line: 346, column: 112, scope: !1221)
!1228 = !DILocation(line: 346, column: 118, scope: !1221)
!1229 = !DILocation(line: 346, column: 124, scope: !1221)
!1230 = !DILocation(line: 346, column: 92, scope: !1221)
!1231 = !DILocation(line: 346, column: 91, scope: !1221)
!1232 = !DILocalVariable(name: "this_seg", scope: !1233, file: !2, line: 348, type: !63)
!1233 = distinct !DILexicalBlock(scope: !1221, file: !2, line: 347, column: 4)
!1234 = !DILocation(line: 348, column: 11, scope: !1233)
!1235 = !DILocation(line: 348, column: 22, scope: !1233)
!1236 = !DILocation(line: 348, column: 28, scope: !1233)
!1237 = !DILocation(line: 348, column: 37, scope: !1233)
!1238 = !DILocation(line: 349, column: 5, scope: !1233)
!1239 = !DILocation(line: 350, column: 11, scope: !1240)
!1240 = distinct !DILexicalBlock(scope: !1233, file: !2, line: 350, column: 9)
!1241 = !DILocation(line: 350, column: 22, scope: !1240)
!1242 = !DILocation(line: 350, column: 19, scope: !1240)
!1243 = !DILocation(line: 350, column: 33, scope: !1240)
!1244 = !DILocation(line: 350, column: 37, scope: !1240)
!1245 = !DILocation(line: 350, column: 49, scope: !1240)
!1246 = !DILocation(line: 350, column: 46, scope: !1240)
!1247 = !DILocation(line: 350, column: 61, scope: !1240)
!1248 = !DILocation(line: 350, column: 65, scope: !1240)
!1249 = !DILocation(line: 350, column: 80, scope: !1240)
!1250 = !DILocation(line: 350, column: 90, scope: !1240)
!1251 = !DILocation(line: 350, column: 87, scope: !1240)
!1252 = !DILocalVariable(name: "center_point", scope: !1253, file: !2, line: 352, type: !308)
!1253 = distinct !DILexicalBlock(scope: !1240, file: !2, line: 351, column: 5)
!1254 = !DILocation(line: 352, column: 17, scope: !1253)
!1255 = !DILocalVariable(name: "fq", scope: !1253, file: !2, line: 354, type: !858)
!1256 = !DILocation(line: 354, column: 16, scope: !1253)
!1257 = !DILocalVariable(name: "hit_data", scope: !1253, file: !2, line: 355, type: !872)
!1258 = !DILocation(line: 355, column: 16, scope: !1253)
!1259 = !DILocalVariable(name: "hit_type", scope: !1253, file: !2, line: 356, type: !63)
!1260 = !DILocation(line: 356, column: 12, scope: !1253)
!1261 = !DILocation(line: 358, column: 50, scope: !1253)
!1262 = !DILocation(line: 358, column: 56, scope: !1253)
!1263 = !DILocation(line: 358, column: 6, scope: !1253)
!1264 = !DILocation(line: 360, column: 20, scope: !1253)
!1265 = !DILocation(line: 360, column: 26, scope: !1253)
!1266 = !DILocation(line: 360, column: 9, scope: !1253)
!1267 = !DILocation(line: 360, column: 17, scope: !1253)
!1268 = !DILocation(line: 361, column: 23, scope: !1253)
!1269 = !DILocation(line: 361, column: 29, scope: !1253)
!1270 = !DILocation(line: 361, column: 9, scope: !1253)
!1271 = !DILocation(line: 361, column: 21, scope: !1253)
!1272 = !DILocation(line: 362, column: 9, scope: !1253)
!1273 = !DILocation(line: 362, column: 17, scope: !1253)
!1274 = !DILocation(line: 363, column: 19, scope: !1253)
!1275 = !DILocation(line: 363, column: 25, scope: !1253)
!1276 = !DILocation(line: 363, column: 9, scope: !1253)
!1277 = !DILocation(line: 363, column: 17, scope: !1253)
!1278 = !DILocation(line: 364, column: 24, scope: !1253)
!1279 = !DILocation(line: 364, column: 28, scope: !1253)
!1280 = !DILocation(line: 364, column: 9, scope: !1253)
!1281 = !DILocation(line: 364, column: 22, scope: !1253)
!1282 = !DILocation(line: 365, column: 9, scope: !1253)
!1283 = !DILocation(line: 365, column: 25, scope: !1253)
!1284 = !DILocation(line: 366, column: 9, scope: !1253)
!1285 = !DILocation(line: 366, column: 19, scope: !1253)
!1286 = !DILocation(line: 368, column: 17, scope: !1253)
!1287 = !DILocation(line: 368, column: 15, scope: !1253)
!1288 = !DILocation(line: 369, column: 10, scope: !1289)
!1289 = distinct !DILexicalBlock(scope: !1253, file: !2, line: 369, column: 10)
!1290 = !DILocation(line: 369, column: 19, scope: !1289)
!1291 = !DILocation(line: 372, column: 7, scope: !1292)
!1292 = distinct !DILexicalBlock(scope: !1289, file: !2, line: 370, column: 6)
!1293 = !DILocation(line: 374, column: 5, scope: !1253)
!1294 = !DILocation(line: 376, column: 18, scope: !1295)
!1295 = distinct !DILexicalBlock(scope: !1233, file: !2, line: 376, column: 9)
!1296 = !DILocation(line: 376, column: 10, scope: !1295)
!1297 = !DILocation(line: 376, column: 9, scope: !1295)
!1298 = !DILocation(line: 378, column: 31, scope: !1299)
!1299 = distinct !DILexicalBlock(scope: !1295, file: !2, line: 377, column: 5)
!1300 = !DILocation(line: 378, column: 16, scope: !1299)
!1301 = !DILocation(line: 378, column: 6, scope: !1299)
!1302 = !DILocation(line: 378, column: 23, scope: !1299)
!1303 = !DILocation(line: 378, column: 29, scope: !1299)
!1304 = !DILocation(line: 379, column: 29, scope: !1299)
!1305 = !DILocation(line: 379, column: 16, scope: !1299)
!1306 = !DILocation(line: 379, column: 6, scope: !1299)
!1307 = !DILocation(line: 379, column: 23, scope: !1299)
!1308 = !DILocation(line: 379, column: 27, scope: !1299)
!1309 = !DILocation(line: 380, column: 14, scope: !1299)
!1310 = !DILocation(line: 380, column: 6, scope: !1299)
!1311 = !DILocation(line: 380, column: 24, scope: !1299)
!1312 = !DILocation(line: 381, column: 23, scope: !1299)
!1313 = !DILocation(line: 381, column: 32, scope: !1299)
!1314 = !DILocation(line: 381, column: 17, scope: !1299)
!1315 = !DILocation(line: 381, column: 6, scope: !1299)
!1316 = !DILocation(line: 381, column: 21, scope: !1299)
!1317 = !DILocation(line: 382, column: 16, scope: !1318)
!1318 = distinct !DILexicalBlock(scope: !1299, file: !2, line: 382, column: 10)
!1319 = !DILocation(line: 382, column: 21, scope: !1318)
!1320 = !DILocation(line: 382, column: 10, scope: !1318)
!1321 = !DILocation(line: 382, column: 28, scope: !1318)
!1322 = !DILocation(line: 382, column: 25, scope: !1318)
!1323 = !DILocation(line: 385, column: 27, scope: !1324)
!1324 = distinct !DILexicalBlock(scope: !1318, file: !2, line: 383, column: 6)
!1325 = !DILocation(line: 385, column: 32, scope: !1324)
!1326 = !DILocation(line: 385, column: 17, scope: !1324)
!1327 = !DILocation(line: 385, column: 36, scope: !1324)
!1328 = !DILocation(line: 385, column: 15, scope: !1324)
!1329 = !DILocation(line: 386, column: 7, scope: !1324)
!1330 = !DILocation(line: 388, column: 5, scope: !1299)
!1331 = !DILocation(line: 389, column: 4, scope: !1233)
!1332 = !DILocation(line: 346, column: 130, scope: !1221)
!1333 = !DILabel(scope: !1211, name: "dont_add", file: !2, line: 390)
!1334 = !DILocation(line: 390, column: 1, scope: !1211)
!1335 = !DILocation(line: 391, column: 3, scope: !1211)
!1336 = !DILocation(line: 338, column: 61, scope: !1207)
!1337 = !DILocation(line: 338, column: 3, scope: !1207)
!1338 = distinct !{!1338, !1209, !1339, !262}
!1339 = !DILocation(line: 391, column: 3, scope: !1204)
!1340 = !DILocation(line: 393, column: 7, scope: !1341)
!1341 = distinct !DILexicalBlock(scope: !1155, file: !2, line: 393, column: 7)
!1342 = !DILocation(line: 393, column: 16, scope: !1341)
!1343 = !DILocation(line: 393, column: 13, scope: !1341)
!1344 = !DILocation(line: 396, column: 8, scope: !1345)
!1345 = distinct !DILexicalBlock(scope: !1346, file: !2, line: 396, column: 8)
!1346 = distinct !DILexicalBlock(scope: !1341, file: !2, line: 394, column: 3)
!1347 = !DILocation(line: 396, column: 14, scope: !1345)
!1348 = !DILocation(line: 397, column: 15, scope: !1345)
!1349 = !DILocation(line: 398, column: 8, scope: !1345)
!1350 = !DILocation(line: 398, column: 34, scope: !1345)
!1351 = !DILocation(line: 398, column: 5, scope: !1345)
!1352 = !DILocation(line: 399, column: 8, scope: !1345)
!1353 = !DILocation(line: 399, column: 34, scope: !1345)
!1354 = !DILocation(line: 399, column: 5, scope: !1345)
!1355 = !DILocation(line: 400, column: 8, scope: !1345)
!1356 = !DILocation(line: 400, column: 34, scope: !1345)
!1357 = !DILocation(line: 400, column: 5, scope: !1345)
!1358 = !DILocation(line: 397, column: 13, scope: !1345)
!1359 = !DILocation(line: 397, column: 5, scope: !1345)
!1360 = !DILocation(line: 402, column: 25, scope: !1345)
!1361 = !DILocation(line: 402, column: 31, scope: !1345)
!1362 = !DILocation(line: 402, column: 15, scope: !1345)
!1363 = !DILocation(line: 402, column: 36, scope: !1345)
!1364 = !DILocation(line: 402, column: 13, scope: !1345)
!1365 = !DILocation(line: 403, column: 4, scope: !1346)
!1366 = !DILocation(line: 406, column: 23, scope: !1155)
!1367 = !DILocation(line: 406, column: 13, scope: !1155)
!1368 = !DILocation(line: 406, column: 30, scope: !1155)
!1369 = !DILocation(line: 406, column: 11, scope: !1155)
!1370 = !DILocation(line: 407, column: 21, scope: !1155)
!1371 = !DILocation(line: 407, column: 15, scope: !1155)
!1372 = !DILocation(line: 407, column: 13, scope: !1155)
!1373 = !DILocation(line: 408, column: 8, scope: !1155)
!1374 = !DILocation(line: 408, column: 3, scope: !1155)
!1375 = !DILabel(scope: !1155, name: "cpp_done1", file: !2, line: 410)
!1376 = !DILocation(line: 410, column: 1, scope: !1155)
!1377 = distinct !{!1377, !1150, !1378, !262}
!1378 = !DILocation(line: 411, column: 2, scope: !1027)
!1379 = !DILocation(line: 416, column: 7, scope: !1027)
!1380 = !DILocalVariable(name: "checkval", scope: !1027, file: !2, line: 415, type: !63)
!1381 = !DILocation(line: 415, column: 6, scope: !1027)
!1382 = !DILocation(line: 417, column: 6, scope: !1383)
!1383 = distinct !DILexicalBlock(scope: !1027, file: !2, line: 417, column: 6)
!1384 = !DILocation(line: 417, column: 12, scope: !1383)
!1385 = !DILocation(line: 418, column: 14, scope: !1383)
!1386 = !DILocation(line: 419, column: 6, scope: !1383)
!1387 = !DILocation(line: 419, column: 32, scope: !1383)
!1388 = !DILocation(line: 419, column: 3, scope: !1383)
!1389 = !DILocation(line: 420, column: 6, scope: !1383)
!1390 = !DILocation(line: 420, column: 32, scope: !1383)
!1391 = !DILocation(line: 420, column: 3, scope: !1383)
!1392 = !DILocation(line: 421, column: 6, scope: !1383)
!1393 = !DILocation(line: 421, column: 32, scope: !1383)
!1394 = !DILocation(line: 421, column: 3, scope: !1383)
!1395 = !DILocation(line: 418, column: 12, scope: !1383)
!1396 = !DILocation(line: 418, column: 3, scope: !1383)
!1397 = !DILocation(line: 423, column: 24, scope: !1383)
!1398 = !DILocation(line: 423, column: 14, scope: !1383)
!1399 = !DILocation(line: 423, column: 31, scope: !1383)
!1400 = !DILocation(line: 423, column: 12, scope: !1383)
!1401 = !DILocation(line: 425, column: 2, scope: !1027)
!1402 = !DILocation(line: 425, column: 9, scope: !1027)
!1403 = !DILocation(line: 425, column: 21, scope: !1027)
!1404 = !DILocation(line: 425, column: 18, scope: !1027)
!1405 = !DILocation(line: 427, column: 7, scope: !1406)
!1406 = distinct !DILexicalBlock(scope: !1407, file: !2, line: 427, column: 7)
!1407 = distinct !DILexicalBlock(scope: !1027, file: !2, line: 426, column: 2)
!1408 = !DILocation(line: 427, column: 13, scope: !1406)
!1409 = !DILocation(line: 432, column: 18, scope: !1410)
!1410 = distinct !DILexicalBlock(scope: !1406, file: !2, line: 428, column: 3)
!1411 = !DILocation(line: 432, column: 5, scope: !1410)
!1412 = !DILocation(line: 432, column: 16, scope: !1410)
!1413 = !DILocation(line: 433, column: 4, scope: !1410)
!1414 = !DILocation(line: 436, column: 8, scope: !1407)
!1415 = !DILocation(line: 437, column: 24, scope: !1407)
!1416 = !DILocation(line: 437, column: 14, scope: !1407)
!1417 = !DILocation(line: 437, column: 31, scope: !1407)
!1418 = !DILocation(line: 437, column: 12, scope: !1407)
!1419 = distinct !{!1419, !1401, !1420, !262}
!1420 = !DILocation(line: 438, column: 2, scope: !1027)
!1421 = !DILocation(line: 445, column: 2, scope: !1027)
!1422 = !DILocation(line: 445, column: 9, scope: !1027)
!1423 = !DILocation(line: 445, column: 15, scope: !1027)
!1424 = !DILocalVariable(name: "parent_seg", scope: !1425, file: !2, line: 446, type: !63)
!1425 = distinct !DILexicalBlock(scope: !1027, file: !2, line: 445, column: 21)
!1426 = !DILocation(line: 446, column: 7, scope: !1425)
!1427 = !DILocalVariable(name: "this_seg", scope: !1425, file: !2, line: 446, type: !63)
!1428 = !DILocation(line: 446, column: 19, scope: !1425)
!1429 = !DILocation(line: 448, column: 24, scope: !1425)
!1430 = !DILocation(line: 448, column: 14, scope: !1425)
!1431 = !DILocation(line: 448, column: 31, scope: !1425)
!1432 = !DILocation(line: 448, column: 12, scope: !1425)
!1433 = !DILocation(line: 449, column: 26, scope: !1425)
!1434 = !DILocation(line: 449, column: 16, scope: !1425)
!1435 = !DILocation(line: 449, column: 33, scope: !1425)
!1436 = !DILocation(line: 449, column: 14, scope: !1425)
!1437 = !DILocation(line: 450, column: 3, scope: !1425)
!1438 = !DILocation(line: 0, scope: !1425)
!1439 = !DILocation(line: 451, column: 19, scope: !1425)
!1440 = !DILocation(line: 451, column: 3, scope: !1425)
!1441 = !DILocation(line: 451, column: 10, scope: !1425)
!1442 = !DILocation(line: 451, column: 17, scope: !1425)
!1443 = !DILocation(line: 453, column: 27, scope: !1425)
!1444 = !DILocation(line: 453, column: 34, scope: !1425)
!1445 = !DILocation(line: 453, column: 50, scope: !1425)
!1446 = !DILocation(line: 453, column: 41, scope: !1425)
!1447 = !DILocation(line: 453, column: 3, scope: !1425)
!1448 = !DILocation(line: 454, column: 8, scope: !1425)
!1449 = !DILocation(line: 455, column: 15, scope: !1425)
!1450 = !DILocation(line: 460, column: 7, scope: !1451)
!1451 = distinct !DILexicalBlock(scope: !1425, file: !2, line: 460, column: 7)
!1452 = !DILocation(line: 460, column: 21, scope: !1451)
!1453 = !DILocation(line: 460, column: 18, scope: !1451)
!1454 = !DILocation(line: 461, column: 4, scope: !1451)
!1455 = !DILocation(line: 463, column: 3, scope: !1425)
!1456 = !DILocation(line: 465, column: 9, scope: !1457)
!1457 = distinct !DILexicalBlock(scope: !1425, file: !2, line: 464, column: 3)
!1458 = !DILocation(line: 466, column: 8, scope: !1459)
!1459 = distinct !DILexicalBlock(scope: !1457, file: !2, line: 466, column: 8)
!1460 = !DILocation(line: 466, column: 14, scope: !1459)
!1461 = !DILocation(line: 467, column: 5, scope: !1459)
!1462 = !DILocation(line: 469, column: 3, scope: !1457)
!1463 = !DILocation(line: 469, column: 22, scope: !1425)
!1464 = !DILocation(line: 469, column: 12, scope: !1425)
!1465 = !DILocation(line: 469, column: 29, scope: !1425)
!1466 = !DILocation(line: 469, column: 36, scope: !1425)
!1467 = !DILocation(line: 469, column: 33, scope: !1425)
!1468 = distinct !{!1468, !1455, !1469, !262}
!1469 = !DILocation(line: 469, column: 46, scope: !1425)
!1470 = distinct !{!1470, !1421, !1471, !262}
!1471 = !DILocation(line: 470, column: 2, scope: !1027)
!1472 = !DILocation(line: 472, column: 2, scope: !1027)
!1473 = !DILocation(line: 0, scope: !1027)
!1474 = !DILocation(line: 473, column: 18, scope: !1027)
!1475 = !DILocation(line: 473, column: 2, scope: !1027)
!1476 = !DILocation(line: 473, column: 9, scope: !1027)
!1477 = !DILocation(line: 473, column: 16, scope: !1027)
!1478 = !DILocation(line: 475, column: 26, scope: !1027)
!1479 = !DILocation(line: 475, column: 33, scope: !1027)
!1480 = !DILocation(line: 475, column: 49, scope: !1027)
!1481 = !DILocation(line: 475, column: 40, scope: !1027)
!1482 = !DILocation(line: 475, column: 2, scope: !1027)
!1483 = !DILocation(line: 476, column: 7, scope: !1027)
!1484 = !DILocation(line: 477, column: 14, scope: !1027)
!1485 = !DILocation(line: 484, column: 8, scope: !1486)
!1486 = distinct !DILexicalBlock(scope: !1027, file: !2, line: 484, column: 2)
!1487 = !DILocation(line: 484, column: 7, scope: !1486)
!1488 = !DILocation(line: 484, column: 12, scope: !1489)
!1489 = distinct !DILexicalBlock(scope: !1486, file: !2, line: 484, column: 2)
!1490 = !DILocation(line: 484, column: 15, scope: !1489)
!1491 = !DILocation(line: 484, column: 27, scope: !1489)
!1492 = !DILocation(line: 484, column: 13, scope: !1489)
!1493 = !DILocation(line: 484, column: 2, scope: !1486)
!1494 = !DILocalVariable(name: "temp_point_seg", scope: !1495, file: !2, line: 485, type: !302)
!1495 = distinct !DILexicalBlock(scope: !1489, file: !2, line: 484, column: 36)
!1496 = !DILocation(line: 485, column: 14, scope: !1495)
!1497 = !DILocation(line: 485, column: 33, scope: !1495)
!1498 = !DILocation(line: 485, column: 50, scope: !1495)
!1499 = !DILocation(line: 485, column: 48, scope: !1495)
!1500 = !DILocation(line: 485, column: 31, scope: !1495)
!1501 = !DILocation(line: 486, column: 29, scope: !1495)
!1502 = !DILocation(line: 486, column: 46, scope: !1495)
!1503 = !DILocation(line: 486, column: 44, scope: !1495)
!1504 = !DILocation(line: 486, column: 61, scope: !1495)
!1505 = !DILocation(line: 486, column: 59, scope: !1495)
!1506 = !DILocation(line: 486, column: 63, scope: !1495)
!1507 = !DILocation(line: 486, column: 5, scope: !1495)
!1508 = !DILocation(line: 486, column: 22, scope: !1495)
!1509 = !DILocation(line: 486, column: 20, scope: !1495)
!1510 = !DILocation(line: 486, column: 25, scope: !1495)
!1511 = !DILocation(line: 487, column: 5, scope: !1495)
!1512 = !DILocation(line: 487, column: 22, scope: !1495)
!1513 = !DILocation(line: 487, column: 20, scope: !1495)
!1514 = !DILocation(line: 487, column: 37, scope: !1495)
!1515 = !DILocation(line: 487, column: 35, scope: !1495)
!1516 = !DILocation(line: 487, column: 39, scope: !1495)
!1517 = !DILocation(line: 487, column: 44, scope: !1495)
!1518 = !DILocation(line: 488, column: 2, scope: !1495)
!1519 = !DILocation(line: 484, column: 32, scope: !1489)
!1520 = !DILocation(line: 484, column: 2, scope: !1489)
!1521 = distinct !{!1521, !1493, !1522, !262}
!1522 = !DILocation(line: 488, column: 2, scope: !1486)
!1523 = !DILocation(line: 496, column: 6, scope: !1524)
!1524 = distinct !DILexicalBlock(scope: !1027, file: !2, line: 496, column: 6)
!1525 = !DILocation(line: 497, column: 7, scope: !1526)
!1526 = distinct !DILexicalBlock(scope: !1527, file: !2, line: 497, column: 7)
!1527 = distinct !DILexicalBlock(scope: !1524, file: !2, line: 496, column: 19)
!1528 = !DILocation(line: 497, column: 13, scope: !1526)
!1529 = !DILocation(line: 497, column: 28, scope: !1526)
!1530 = !DILocation(line: 497, column: 26, scope: !1526)
!1531 = !DILocation(line: 497, column: 41, scope: !1526)
!1532 = !DILocation(line: 497, column: 45, scope: !1526)
!1533 = !DILocation(line: 501, column: 4, scope: !1534)
!1534 = distinct !DILexicalBlock(scope: !1526, file: !2, line: 497, column: 63)
!1535 = !DILocation(line: 502, column: 4, scope: !1534)
!1536 = !DILocation(line: 503, column: 18, scope: !1534)
!1537 = !DILocation(line: 503, column: 5, scope: !1534)
!1538 = !DILocation(line: 503, column: 16, scope: !1534)
!1539 = !DILocation(line: 504, column: 4, scope: !1534)
!1540 = !DILocation(line: 507, column: 25, scope: !1541)
!1541 = distinct !DILexicalBlock(scope: !1526, file: !2, line: 505, column: 10)
!1542 = !DILocation(line: 507, column: 4, scope: !1541)
!1543 = !DILocation(line: 510, column: 2, scope: !1527)
!1544 = !DILocation(line: 519, column: 6, scope: !1545)
!1545 = distinct !DILexicalBlock(scope: !1027, file: !2, line: 519, column: 6)
!1546 = !DILocation(line: 519, column: 12, scope: !1545)
!1547 = !DILocation(line: 519, column: 17, scope: !1545)
!1548 = !DILocation(line: 520, column: 18, scope: !1549)
!1549 = distinct !DILexicalBlock(scope: !1545, file: !2, line: 520, column: 7)
!1550 = !DILocation(line: 520, column: 24, scope: !1549)
!1551 = !DILocation(line: 520, column: 7, scope: !1549)
!1552 = !DILocation(line: 520, column: 28, scope: !1549)
!1553 = !DILocation(line: 521, column: 25, scope: !1549)
!1554 = !DILocation(line: 521, column: 56, scope: !1549)
!1555 = !DILocation(line: 521, column: 4, scope: !1549)
!1556 = !DILocation(line: 527, column: 16, scope: !1027)
!1557 = !DILocation(line: 527, column: 3, scope: !1027)
!1558 = !DILocation(line: 527, column: 14, scope: !1027)
!1559 = !DILocation(line: 528, column: 2, scope: !1027)
!1560 = !DILocation(line: 529, column: 1, scope: !1027)
!1561 = distinct !DISubprogram(name: "ai_reset_all_paths", linkageName: "_Z18ai_reset_all_pathsv", scope: !2, file: !2, line: 1590, type: !1562, scopeLine: 1591, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !242)
!1562 = !DISubroutineType(types: !1563)
!1563 = !{null}
!1564 = !DILocalVariable(name: "i", scope: !1561, file: !2, line: 1592, type: !63)
!1565 = !DILocation(line: 1592, column: 6, scope: !1561)
!1566 = !DILocation(line: 1594, column: 8, scope: !1567)
!1567 = distinct !DILexicalBlock(scope: !1561, file: !2, line: 1594, column: 2)
!1568 = !DILocation(line: 1594, column: 7, scope: !1567)
!1569 = !DILocation(line: 1594, column: 12, scope: !1570)
!1570 = distinct !DILexicalBlock(scope: !1567, file: !2, line: 1594, column: 2)
!1571 = !DILocation(line: 1594, column: 15, scope: !1570)
!1572 = !DILocation(line: 1594, column: 13, scope: !1570)
!1573 = !DILocation(line: 1594, column: 2, scope: !1567)
!1574 = !DILocation(line: 1595, column: 15, scope: !1575)
!1575 = distinct !DILexicalBlock(scope: !1570, file: !2, line: 1595, column: 7)
!1576 = !DILocation(line: 1595, column: 7, scope: !1575)
!1577 = !DILocation(line: 1595, column: 18, scope: !1575)
!1578 = !DILocation(line: 1595, column: 31, scope: !1575)
!1579 = !DILocation(line: 1596, column: 12, scope: !1580)
!1580 = distinct !DILexicalBlock(scope: !1575, file: !2, line: 1595, column: 41)
!1581 = !DILocation(line: 1596, column: 4, scope: !1580)
!1582 = !DILocation(line: 1596, column: 15, scope: !1580)
!1583 = !DILocation(line: 1596, column: 29, scope: !1580)
!1584 = !DILocation(line: 1596, column: 40, scope: !1580)
!1585 = !DILocation(line: 1597, column: 12, scope: !1580)
!1586 = !DILocation(line: 1597, column: 4, scope: !1580)
!1587 = !DILocation(line: 1597, column: 15, scope: !1580)
!1588 = !DILocation(line: 1597, column: 29, scope: !1580)
!1589 = !DILocation(line: 1597, column: 41, scope: !1580)
!1590 = !DILocation(line: 1598, column: 3, scope: !1580)
!1591 = !DILocation(line: 1595, column: 34, scope: !1575)
!1592 = !DILocation(line: 1594, column: 38, scope: !1570)
!1593 = !DILocation(line: 1594, column: 2, scope: !1570)
!1594 = distinct !{!1594, !1573, !1595, !262}
!1595 = !DILocation(line: 1598, column: 3, scope: !1567)
!1596 = !DILocation(line: 1600, column: 2, scope: !1561)
!1597 = !DILocation(line: 1602, column: 1, scope: !1561)
!1598 = distinct !DISubprogram(name: "polish_path", linkageName: "_Z11polish_pathP6objectP9point_segi", scope: !2, file: !2, line: 543, type: !1599, scopeLine: 544, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !242)
!1599 = !DISubroutineType(types: !1600)
!1600 = !{!63, !526, !301, !63}
!1601 = !DILocalVariable(name: "objp", arg: 1, scope: !1598, file: !2, line: 543, type: !526)
!1602 = !DILocation(line: 543, column: 25, scope: !1598)
!1603 = !DILocalVariable(name: "psegs", arg: 2, scope: !1598, file: !2, line: 543, type: !301)
!1604 = !DILocation(line: 543, column: 42, scope: !1598)
!1605 = !DILocalVariable(name: "num_points", arg: 3, scope: !1598, file: !2, line: 543, type: !63)
!1606 = !DILocation(line: 543, column: 53, scope: !1598)
!1607 = !DILocalVariable(name: "i", scope: !1598, file: !2, line: 545, type: !63)
!1608 = !DILocation(line: 545, column: 6, scope: !1598)
!1609 = !DILocalVariable(name: "first_point", scope: !1598, file: !2, line: 545, type: !63)
!1610 = !DILocation(line: 545, column: 9, scope: !1598)
!1611 = !DILocation(line: 547, column: 6, scope: !1612)
!1612 = distinct !DILexicalBlock(scope: !1598, file: !2, line: 547, column: 6)
!1613 = !DILocation(line: 547, column: 17, scope: !1612)
!1614 = !DILocation(line: 548, column: 10, scope: !1612)
!1615 = !DILocation(line: 548, column: 3, scope: !1612)
!1616 = !DILocation(line: 551, column: 17, scope: !1617)
!1617 = distinct !DILexicalBlock(scope: !1598, file: !2, line: 551, column: 6)
!1618 = !DILocation(line: 551, column: 23, scope: !1617)
!1619 = !DILocation(line: 551, column: 6, scope: !1617)
!1620 = !DILocation(line: 551, column: 27, scope: !1617)
!1621 = !DILocation(line: 552, column: 7, scope: !1622)
!1622 = distinct !DILexicalBlock(scope: !1617, file: !2, line: 552, column: 7)
!1623 = !DILocation(line: 552, column: 21, scope: !1622)
!1624 = !DILocation(line: 552, column: 18, scope: !1622)
!1625 = !DILocation(line: 553, column: 11, scope: !1622)
!1626 = !DILocation(line: 553, column: 4, scope: !1622)
!1627 = !DILocation(line: 555, column: 35, scope: !1622)
!1628 = !DILocation(line: 555, column: 33, scope: !1622)
!1629 = !DILocation(line: 558, column: 8, scope: !1630)
!1630 = distinct !DILexicalBlock(scope: !1598, file: !2, line: 558, column: 2)
!1631 = !DILocation(line: 558, column: 7, scope: !1630)
!1632 = !DILocation(line: 558, column: 12, scope: !1633)
!1633 = distinct !DILexicalBlock(scope: !1630, file: !2, line: 558, column: 2)
!1634 = !DILocation(line: 558, column: 13, scope: !1633)
!1635 = !DILocation(line: 558, column: 2, scope: !1630)
!1636 = !DILocalVariable(name: "fq", scope: !1637, file: !2, line: 559, type: !858)
!1637 = distinct !DILexicalBlock(scope: !1633, file: !2, line: 558, column: 22)
!1638 = !DILocation(line: 559, column: 13, scope: !1637)
!1639 = !DILocalVariable(name: "hit_data", scope: !1637, file: !2, line: 560, type: !872)
!1640 = !DILocation(line: 560, column: 13, scope: !1637)
!1641 = !DILocalVariable(name: "hit_type", scope: !1637, file: !2, line: 561, type: !63)
!1642 = !DILocation(line: 561, column: 9, scope: !1637)
!1643 = !DILocation(line: 563, column: 17, scope: !1637)
!1644 = !DILocation(line: 563, column: 23, scope: !1637)
!1645 = !DILocation(line: 563, column: 6, scope: !1637)
!1646 = !DILocation(line: 563, column: 14, scope: !1637)
!1647 = !DILocation(line: 564, column: 20, scope: !1637)
!1648 = !DILocation(line: 564, column: 26, scope: !1637)
!1649 = !DILocation(line: 564, column: 6, scope: !1637)
!1650 = !DILocation(line: 564, column: 18, scope: !1637)
!1651 = !DILocation(line: 565, column: 17, scope: !1637)
!1652 = !DILocation(line: 565, column: 23, scope: !1637)
!1653 = !DILocation(line: 565, column: 26, scope: !1637)
!1654 = !DILocation(line: 565, column: 6, scope: !1637)
!1655 = !DILocation(line: 565, column: 14, scope: !1637)
!1656 = !DILocation(line: 566, column: 16, scope: !1637)
!1657 = !DILocation(line: 566, column: 22, scope: !1637)
!1658 = !DILocation(line: 566, column: 6, scope: !1637)
!1659 = !DILocation(line: 566, column: 14, scope: !1637)
!1660 = !DILocation(line: 567, column: 21, scope: !1637)
!1661 = !DILocation(line: 567, column: 25, scope: !1637)
!1662 = !DILocation(line: 567, column: 6, scope: !1637)
!1663 = !DILocation(line: 567, column: 19, scope: !1637)
!1664 = !DILocation(line: 568, column: 6, scope: !1637)
!1665 = !DILocation(line: 568, column: 22, scope: !1637)
!1666 = !DILocation(line: 569, column: 6, scope: !1637)
!1667 = !DILocation(line: 569, column: 16, scope: !1637)
!1668 = !DILocation(line: 571, column: 14, scope: !1637)
!1669 = !DILocation(line: 571, column: 12, scope: !1637)
!1670 = !DILocation(line: 573, column: 7, scope: !1671)
!1671 = distinct !DILexicalBlock(scope: !1637, file: !2, line: 573, column: 7)
!1672 = !DILocation(line: 573, column: 16, scope: !1671)
!1673 = !DILocation(line: 574, column: 18, scope: !1671)
!1674 = !DILocation(line: 574, column: 19, scope: !1671)
!1675 = !DILocation(line: 574, column: 16, scope: !1671)
!1676 = !DILocation(line: 574, column: 4, scope: !1671)
!1677 = !DILocation(line: 576, column: 4, scope: !1671)
!1678 = !DILocation(line: 577, column: 2, scope: !1637)
!1679 = !DILocation(line: 558, column: 18, scope: !1633)
!1680 = !DILocation(line: 558, column: 2, scope: !1633)
!1681 = distinct !{!1681, !1635, !1682, !262}
!1682 = !DILocation(line: 577, column: 2, scope: !1630)
!1683 = !DILocation(line: 579, column: 6, scope: !1684)
!1684 = distinct !DILexicalBlock(scope: !1598, file: !2, line: 579, column: 6)
!1685 = !DILocation(line: 581, column: 10, scope: !1686)
!1686 = distinct !DILexicalBlock(scope: !1687, file: !2, line: 581, column: 3)
!1687 = distinct !DILexicalBlock(scope: !1684, file: !2, line: 579, column: 19)
!1688 = !DILocation(line: 581, column: 9, scope: !1686)
!1689 = !DILocation(line: 581, column: 8, scope: !1686)
!1690 = !DILocation(line: 581, column: 23, scope: !1691)
!1691 = distinct !DILexicalBlock(scope: !1686, file: !2, line: 581, column: 3)
!1692 = !DILocation(line: 581, column: 25, scope: !1691)
!1693 = !DILocation(line: 581, column: 24, scope: !1691)
!1694 = !DILocation(line: 581, column: 3, scope: !1686)
!1695 = !DILocation(line: 582, column: 27, scope: !1691)
!1696 = !DILocation(line: 582, column: 33, scope: !1691)
!1697 = !DILocation(line: 582, column: 4, scope: !1691)
!1698 = !DILocation(line: 582, column: 10, scope: !1691)
!1699 = !DILocation(line: 582, column: 12, scope: !1691)
!1700 = !DILocation(line: 582, column: 11, scope: !1691)
!1701 = !DILocation(line: 582, column: 25, scope: !1691)
!1702 = !DILocation(line: 581, column: 38, scope: !1691)
!1703 = !DILocation(line: 581, column: 3, scope: !1691)
!1704 = distinct !{!1704, !1694, !1705, !262}
!1705 = !DILocation(line: 582, column: 34, scope: !1686)
!1706 = !DILocation(line: 583, column: 2, scope: !1687)
!1707 = !DILocation(line: 585, column: 9, scope: !1598)
!1708 = !DILocation(line: 585, column: 22, scope: !1598)
!1709 = !DILocation(line: 585, column: 20, scope: !1598)
!1710 = !DILocation(line: 585, column: 2, scope: !1598)
!1711 = !DILocation(line: 586, column: 1, scope: !1598)
!1712 = distinct !DISubprogram(name: "validate_path", linkageName: "_Z13validate_pathiP9point_segi", scope: !2, file: !2, line: 594, type: !1713, scopeLine: 595, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !242)
!1713 = !DISubroutineType(types: !1714)
!1714 = !{!63, !63, !301, !63}
!1715 = !DILocalVariable(name: "debug_flag", arg: 1, scope: !1712, file: !2, line: 594, type: !63)
!1716 = !DILocation(line: 594, column: 23, scope: !1712)
!1717 = !DILocalVariable(name: "psegs", arg: 2, scope: !1712, file: !2, line: 594, type: !301)
!1718 = !DILocation(line: 594, column: 46, scope: !1712)
!1719 = !DILocalVariable(name: "num_points", arg: 3, scope: !1712, file: !2, line: 594, type: !63)
!1720 = !DILocation(line: 594, column: 57, scope: !1712)
!1721 = !DILocation(line: 641, column: 2, scope: !1712)
!1722 = distinct !DISubprogram(name: "validate_all_paths", linkageName: "_Z18validate_all_pathsv", scope: !2, file: !2, line: 649, type: !1562, scopeLine: 650, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57)
!1723 = !DILocation(line: 674, column: 1, scope: !1722)
!1724 = distinct !DISubprogram(name: "create_path_to_player", linkageName: "_Z21create_path_to_playerP6objectii", scope: !2, file: !2, line: 725, type: !1725, scopeLine: 726, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !242)
!1725 = !DISubroutineType(types: !1726)
!1726 = !{null, !526, !63, !63}
!1727 = !DILocalVariable(name: "objp", arg: 1, scope: !1724, file: !2, line: 725, type: !526)
!1728 = !DILocation(line: 725, column: 36, scope: !1724)
!1729 = !DILocalVariable(name: "max_length", arg: 2, scope: !1724, file: !2, line: 725, type: !63)
!1730 = !DILocation(line: 725, column: 46, scope: !1724)
!1731 = !DILocalVariable(name: "safety_flag", arg: 3, scope: !1724, file: !2, line: 725, type: !63)
!1732 = !DILocation(line: 725, column: 62, scope: !1724)
!1733 = !DILocalVariable(name: "aip", scope: !1724, file: !2, line: 727, type: !1734)
!1734 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !601, size: 64)
!1735 = !DILocation(line: 727, column: 13, scope: !1724)
!1736 = !DILocation(line: 727, column: 20, scope: !1724)
!1737 = !DILocation(line: 727, column: 26, scope: !1724)
!1738 = !DILocalVariable(name: "ailp", scope: !1724, file: !2, line: 728, type: !1739)
!1739 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1740, size: 64)
!1740 = !DIDerivedType(tag: DW_TAG_typedef, name: "ai_local", file: !303, line: 173, baseType: !1741)
!1741 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ai_local", file: !303, line: 147, size: 1600, flags: DIFlagTypePassByValue, elements: !1742, identifier: "_ZTS8ai_local")
!1742 = !{!1743, !1744, !1745, !1746, !1747, !1748, !1749, !1750, !1751, !1752, !1753, !1754, !1755, !1756, !1757, !1758, !1759, !1760, !1762}
!1743 = !DIDerivedType(tag: DW_TAG_member, name: "player_awareness_type", scope: !1741, file: !303, line: 151, baseType: !63, size: 32)
!1744 = !DIDerivedType(tag: DW_TAG_member, name: "retry_count", scope: !1741, file: !303, line: 152, baseType: !63, size: 32, offset: 32)
!1745 = !DIDerivedType(tag: DW_TAG_member, name: "consecutive_retries", scope: !1741, file: !303, line: 153, baseType: !63, size: 32, offset: 64)
!1746 = !DIDerivedType(tag: DW_TAG_member, name: "mode", scope: !1741, file: !303, line: 154, baseType: !63, size: 32, offset: 96)
!1747 = !DIDerivedType(tag: DW_TAG_member, name: "previous_visibility", scope: !1741, file: !303, line: 155, baseType: !63, size: 32, offset: 128)
!1748 = !DIDerivedType(tag: DW_TAG_member, name: "rapidfire_count", scope: !1741, file: !303, line: 156, baseType: !63, size: 32, offset: 160)
!1749 = !DIDerivedType(tag: DW_TAG_member, name: "goal_segment", scope: !1741, file: !303, line: 157, baseType: !63, size: 32, offset: 192)
!1750 = !DIDerivedType(tag: DW_TAG_member, name: "next_action_time", scope: !1741, file: !303, line: 161, baseType: !69, size: 32, offset: 224)
!1751 = !DIDerivedType(tag: DW_TAG_member, name: "next_fire", scope: !1741, file: !303, line: 162, baseType: !69, size: 32, offset: 256)
!1752 = !DIDerivedType(tag: DW_TAG_member, name: "next_fire2", scope: !1741, file: !303, line: 163, baseType: !69, size: 32, offset: 288)
!1753 = !DIDerivedType(tag: DW_TAG_member, name: "player_awareness_time", scope: !1741, file: !303, line: 164, baseType: !69, size: 32, offset: 320)
!1754 = !DIDerivedType(tag: DW_TAG_member, name: "time_player_seen", scope: !1741, file: !303, line: 165, baseType: !69, size: 32, offset: 352)
!1755 = !DIDerivedType(tag: DW_TAG_member, name: "time_player_sound_attacked", scope: !1741, file: !303, line: 166, baseType: !69, size: 32, offset: 384)
!1756 = !DIDerivedType(tag: DW_TAG_member, name: "next_misc_sound_time", scope: !1741, file: !303, line: 167, baseType: !69, size: 32, offset: 416)
!1757 = !DIDerivedType(tag: DW_TAG_member, name: "time_since_processed", scope: !1741, file: !303, line: 168, baseType: !69, size: 32, offset: 448)
!1758 = !DIDerivedType(tag: DW_TAG_member, name: "goal_angles", scope: !1741, file: !303, line: 169, baseType: !638, size: 480, offset: 480)
!1759 = !DIDerivedType(tag: DW_TAG_member, name: "delta_angles", scope: !1741, file: !303, line: 170, baseType: !638, size: 480, offset: 960)
!1760 = !DIDerivedType(tag: DW_TAG_member, name: "goal_state", scope: !1741, file: !303, line: 171, baseType: !1761, size: 80, offset: 1440)
!1761 = !DICompositeType(tag: DW_TAG_array_type, baseType: !155, size: 80, elements: !645)
!1762 = !DIDerivedType(tag: DW_TAG_member, name: "achieved_state", scope: !1741, file: !303, line: 172, baseType: !1761, size: 80, offset: 1520)
!1763 = !DILocation(line: 728, column: 13, scope: !1724)
!1764 = !DILocation(line: 728, column: 35, scope: !1724)
!1765 = !DILocation(line: 728, column: 39, scope: !1724)
!1766 = !DILocation(line: 728, column: 21, scope: !1724)
!1767 = !DILocalVariable(name: "start_seg", scope: !1724, file: !2, line: 729, type: !63)
!1768 = !DILocation(line: 729, column: 8, scope: !1724)
!1769 = !DILocalVariable(name: "end_seg", scope: !1724, file: !2, line: 729, type: !63)
!1770 = !DILocation(line: 729, column: 19, scope: !1724)
!1771 = !DILocation(line: 732, column: 6, scope: !1772)
!1772 = distinct !DILexicalBlock(scope: !1724, file: !2, line: 732, column: 6)
!1773 = !DILocation(line: 732, column: 17, scope: !1772)
!1774 = !DILocation(line: 733, column: 14, scope: !1772)
!1775 = !DILocation(line: 733, column: 3, scope: !1772)
!1776 = !DILocation(line: 735, column: 27, scope: !1724)
!1777 = !DILocation(line: 735, column: 2, scope: !1724)
!1778 = !DILocation(line: 735, column: 8, scope: !1724)
!1779 = !DILocation(line: 735, column: 25, scope: !1724)
!1780 = !DILocation(line: 736, column: 23, scope: !1724)
!1781 = !DILocation(line: 736, column: 2, scope: !1724)
!1782 = !DILocation(line: 736, column: 8, scope: !1724)
!1783 = !DILocation(line: 736, column: 21, scope: !1724)
!1784 = !DILocation(line: 738, column: 14, scope: !1724)
!1785 = !DILocation(line: 738, column: 20, scope: !1724)
!1786 = !DILocation(line: 738, column: 12, scope: !1724)
!1787 = !DILocation(line: 739, column: 12, scope: !1724)
!1788 = !DILocation(line: 739, column: 18, scope: !1724)
!1789 = !DILocation(line: 739, column: 10, scope: !1724)
!1790 = !DILocation(line: 743, column: 6, scope: !1791)
!1791 = distinct !DILexicalBlock(scope: !1724, file: !2, line: 743, column: 6)
!1792 = !DILocation(line: 743, column: 14, scope: !1791)
!1793 = !DILocation(line: 745, column: 2, scope: !1794)
!1794 = distinct !DILexicalBlock(scope: !1791, file: !2, line: 743, column: 21)
!1795 = !DILocation(line: 746, column: 22, scope: !1796)
!1796 = distinct !DILexicalBlock(scope: !1791, file: !2, line: 745, column: 9)
!1797 = !DILocation(line: 746, column: 28, scope: !1796)
!1798 = !DILocation(line: 746, column: 39, scope: !1796)
!1799 = !DILocation(line: 746, column: 48, scope: !1796)
!1800 = !DILocation(line: 746, column: 70, scope: !1796)
!1801 = !DILocation(line: 746, column: 75, scope: !1796)
!1802 = !DILocation(line: 746, column: 88, scope: !1796)
!1803 = !DILocation(line: 746, column: 103, scope: !1796)
!1804 = !DILocation(line: 746, column: 3, scope: !1796)
!1805 = !DILocation(line: 747, column: 34, scope: !1796)
!1806 = !DILocation(line: 747, column: 40, scope: !1796)
!1807 = !DILocation(line: 747, column: 61, scope: !1796)
!1808 = !DILocation(line: 747, column: 66, scope: !1796)
!1809 = !DILocation(line: 747, column: 22, scope: !1796)
!1810 = !DILocation(line: 747, column: 3, scope: !1796)
!1811 = !DILocation(line: 747, column: 8, scope: !1796)
!1812 = !DILocation(line: 747, column: 20, scope: !1796)
!1813 = !DILocation(line: 748, column: 21, scope: !1796)
!1814 = !DILocation(line: 748, column: 41, scope: !1796)
!1815 = !DILocation(line: 748, column: 3, scope: !1796)
!1816 = !DILocation(line: 748, column: 8, scope: !1796)
!1817 = !DILocation(line: 748, column: 19, scope: !1796)
!1818 = !DILocation(line: 749, column: 3, scope: !1796)
!1819 = !DILocation(line: 749, column: 8, scope: !1796)
!1820 = !DILocation(line: 749, column: 23, scope: !1796)
!1821 = !DILocation(line: 750, column: 26, scope: !1796)
!1822 = !DILocation(line: 750, column: 31, scope: !1796)
!1823 = !DILocation(line: 750, column: 23, scope: !1796)
!1824 = !DILocation(line: 751, column: 7, scope: !1825)
!1825 = distinct !DILexicalBlock(scope: !1796, file: !2, line: 751, column: 7)
!1826 = !DILocation(line: 751, column: 27, scope: !1825)
!1827 = !DILocation(line: 751, column: 40, scope: !1825)
!1828 = !DILocation(line: 751, column: 60, scope: !1825)
!1829 = !DILocation(line: 754, column: 4, scope: !1830)
!1830 = distinct !DILexicalBlock(scope: !1825, file: !2, line: 751, column: 78)
!1831 = !DILocation(line: 755, column: 4, scope: !1830)
!1832 = !DILocation(line: 758, column: 3, scope: !1796)
!1833 = !DILocation(line: 758, column: 8, scope: !1796)
!1834 = !DILocation(line: 758, column: 17, scope: !1796)
!1835 = !DILocation(line: 760, column: 3, scope: !1796)
!1836 = !DILocation(line: 760, column: 9, scope: !1796)
!1837 = !DILocation(line: 760, column: 14, scope: !1796)
!1838 = !DILocation(line: 761, column: 8, scope: !1839)
!1839 = distinct !DILexicalBlock(scope: !1796, file: !2, line: 761, column: 7)
!1840 = !DILocation(line: 761, column: 13, scope: !1839)
!1841 = !DILocation(line: 761, column: 24, scope: !1839)
!1842 = !DILocation(line: 761, column: 30, scope: !1839)
!1843 = !DILocation(line: 761, column: 33, scope: !1839)
!1844 = !DILocation(line: 761, column: 42, scope: !1839)
!1845 = !DILocation(line: 761, column: 51, scope: !1839)
!1846 = !DILocation(line: 761, column: 54, scope: !1839)
!1847 = !DILocation(line: 761, column: 63, scope: !1839)
!1848 = !DILocation(line: 762, column: 12, scope: !1839)
!1849 = !DILocation(line: 762, column: 56, scope: !1839)
!1850 = !DILocation(line: 762, column: 62, scope: !1839)
!1851 = !DILocation(line: 762, column: 85, scope: !1839)
!1852 = !DILocation(line: 762, column: 4, scope: !1839)
!1853 = !DILocation(line: 763, column: 3, scope: !1796)
!1854 = !DILocation(line: 763, column: 9, scope: !1796)
!1855 = !DILocation(line: 763, column: 31, scope: !1796)
!1856 = !DILocation(line: 767, column: 2, scope: !1724)
!1857 = !DILocation(line: 769, column: 1, scope: !1724)
!1858 = distinct !DISubprogram(name: "maybe_ai_path_garbage_collect", linkageName: "_Z29maybe_ai_path_garbage_collectv", scope: !2, file: !2, line: 1562, type: !1562, scopeLine: 1563, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57)
!1859 = !DILocation(line: 1564, column: 6, scope: !1860)
!1860 = distinct !DILexicalBlock(scope: !1858, file: !2, line: 1564, column: 6)
!1861 = !DILocation(line: 1564, column: 26, scope: !1860)
!1862 = !DILocation(line: 1564, column: 39, scope: !1860)
!1863 = !DILocation(line: 1565, column: 7, scope: !1864)
!1864 = distinct !DILexicalBlock(scope: !1865, file: !2, line: 1565, column: 7)
!1865 = distinct !DILexicalBlock(scope: !1860, file: !2, line: 1564, column: 75)
!1866 = !DILocation(line: 1565, column: 35, scope: !1864)
!1867 = !DILocation(line: 1565, column: 41, scope: !1864)
!1868 = !DILocation(line: 1565, column: 38, scope: !1864)
!1869 = !DILocation(line: 1568, column: 4, scope: !1870)
!1870 = distinct !DILexicalBlock(scope: !1864, file: !2, line: 1565, column: 53)
!1871 = !DILocation(line: 1569, column: 4, scope: !1870)
!1872 = !DILocation(line: 1570, column: 3, scope: !1870)
!1873 = !DILocation(line: 1572, column: 4, scope: !1874)
!1874 = distinct !DILexicalBlock(scope: !1864, file: !2, line: 1570, column: 10)
!1875 = !DILocation(line: 1573, column: 4, scope: !1874)
!1876 = !DILocation(line: 1574, column: 4, scope: !1874)
!1877 = !DILocation(line: 1576, column: 2, scope: !1865)
!1878 = !DILocation(line: 1576, column: 13, scope: !1879)
!1879 = distinct !DILexicalBlock(scope: !1860, file: !2, line: 1576, column: 13)
!1880 = !DILocation(line: 1576, column: 33, scope: !1879)
!1881 = !DILocation(line: 1576, column: 46, scope: !1879)
!1882 = !DILocation(line: 1577, column: 7, scope: !1883)
!1883 = distinct !DILexicalBlock(scope: !1884, file: !2, line: 1577, column: 7)
!1884 = distinct !DILexicalBlock(scope: !1879, file: !2, line: 1576, column: 68)
!1885 = !DILocation(line: 1577, column: 36, scope: !1883)
!1886 = !DILocation(line: 1577, column: 43, scope: !1883)
!1887 = !DILocation(line: 1577, column: 41, scope: !1883)
!1888 = !DILocation(line: 1578, column: 4, scope: !1889)
!1889 = distinct !DILexicalBlock(scope: !1883, file: !2, line: 1577, column: 55)
!1890 = !DILocation(line: 1579, column: 3, scope: !1889)
!1891 = !DILocation(line: 1580, column: 2, scope: !1884)
!1892 = !DILocation(line: 1580, column: 13, scope: !1893)
!1893 = distinct !DILexicalBlock(scope: !1879, file: !2, line: 1580, column: 13)
!1894 = !DILocation(line: 1580, column: 33, scope: !1893)
!1895 = !DILocation(line: 1580, column: 46, scope: !1893)
!1896 = !DILocation(line: 1581, column: 7, scope: !1897)
!1897 = distinct !DILexicalBlock(scope: !1898, file: !2, line: 1581, column: 7)
!1898 = distinct !DILexicalBlock(scope: !1893, file: !2, line: 1580, column: 66)
!1899 = !DILocation(line: 1581, column: 36, scope: !1897)
!1900 = !DILocation(line: 1581, column: 44, scope: !1897)
!1901 = !DILocation(line: 1581, column: 42, scope: !1897)
!1902 = !DILocation(line: 1582, column: 4, scope: !1903)
!1903 = distinct !DILexicalBlock(scope: !1897, file: !2, line: 1581, column: 56)
!1904 = !DILocation(line: 1583, column: 3, scope: !1903)
!1905 = !DILocation(line: 1584, column: 2, scope: !1898)
!1906 = !DILocation(line: 1585, column: 1, scope: !1858)
!1907 = distinct !DISubprogram(name: "create_path_to_segment", linkageName: "_Z22create_path_to_segmentP6objectiii", scope: !2, file: !2, line: 773, type: !1908, scopeLine: 774, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !242)
!1908 = !DISubroutineType(types: !1909)
!1909 = !{null, !526, !63, !63, !63}
!1910 = !DILocalVariable(name: "objp", arg: 1, scope: !1907, file: !2, line: 773, type: !526)
!1911 = !DILocation(line: 773, column: 37, scope: !1907)
!1912 = !DILocalVariable(name: "goalseg", arg: 2, scope: !1907, file: !2, line: 773, type: !63)
!1913 = !DILocation(line: 773, column: 47, scope: !1907)
!1914 = !DILocalVariable(name: "max_length", arg: 3, scope: !1907, file: !2, line: 773, type: !63)
!1915 = !DILocation(line: 773, column: 60, scope: !1907)
!1916 = !DILocalVariable(name: "safety_flag", arg: 4, scope: !1907, file: !2, line: 773, type: !63)
!1917 = !DILocation(line: 773, column: 76, scope: !1907)
!1918 = !DILocalVariable(name: "aip", scope: !1907, file: !2, line: 775, type: !1734)
!1919 = !DILocation(line: 775, column: 13, scope: !1907)
!1920 = !DILocation(line: 775, column: 20, scope: !1907)
!1921 = !DILocation(line: 775, column: 26, scope: !1907)
!1922 = !DILocalVariable(name: "ailp", scope: !1907, file: !2, line: 776, type: !1739)
!1923 = !DILocation(line: 776, column: 13, scope: !1907)
!1924 = !DILocation(line: 776, column: 35, scope: !1907)
!1925 = !DILocation(line: 776, column: 39, scope: !1907)
!1926 = !DILocation(line: 776, column: 21, scope: !1907)
!1927 = !DILocalVariable(name: "start_seg", scope: !1907, file: !2, line: 777, type: !63)
!1928 = !DILocation(line: 777, column: 8, scope: !1907)
!1929 = !DILocalVariable(name: "end_seg", scope: !1907, file: !2, line: 777, type: !63)
!1930 = !DILocation(line: 777, column: 19, scope: !1907)
!1931 = !DILocation(line: 779, column: 6, scope: !1932)
!1932 = distinct !DILexicalBlock(scope: !1907, file: !2, line: 779, column: 6)
!1933 = !DILocation(line: 779, column: 17, scope: !1932)
!1934 = !DILocation(line: 780, column: 14, scope: !1932)
!1935 = !DILocation(line: 780, column: 3, scope: !1932)
!1936 = !DILocation(line: 782, column: 27, scope: !1907)
!1937 = !DILocation(line: 782, column: 2, scope: !1907)
!1938 = !DILocation(line: 782, column: 8, scope: !1907)
!1939 = !DILocation(line: 782, column: 25, scope: !1907)
!1940 = !DILocation(line: 783, column: 23, scope: !1907)
!1941 = !DILocation(line: 783, column: 2, scope: !1907)
!1942 = !DILocation(line: 783, column: 8, scope: !1907)
!1943 = !DILocation(line: 783, column: 21, scope: !1907)
!1944 = !DILocation(line: 785, column: 14, scope: !1907)
!1945 = !DILocation(line: 785, column: 20, scope: !1907)
!1946 = !DILocation(line: 785, column: 12, scope: !1907)
!1947 = !DILocation(line: 786, column: 12, scope: !1907)
!1948 = !DILocation(line: 786, column: 18, scope: !1907)
!1949 = !DILocation(line: 786, column: 10, scope: !1907)
!1950 = !DILocation(line: 788, column: 6, scope: !1951)
!1951 = distinct !DILexicalBlock(scope: !1907, file: !2, line: 788, column: 6)
!1952 = !DILocation(line: 788, column: 14, scope: !1951)
!1953 = !DILocation(line: 790, column: 2, scope: !1954)
!1954 = distinct !DILexicalBlock(scope: !1951, file: !2, line: 788, column: 21)
!1955 = !DILocation(line: 791, column: 22, scope: !1956)
!1956 = distinct !DILexicalBlock(scope: !1951, file: !2, line: 790, column: 9)
!1957 = !DILocation(line: 791, column: 28, scope: !1956)
!1958 = !DILocation(line: 791, column: 39, scope: !1956)
!1959 = !DILocation(line: 791, column: 48, scope: !1956)
!1960 = !DILocation(line: 791, column: 70, scope: !1956)
!1961 = !DILocation(line: 791, column: 75, scope: !1956)
!1962 = !DILocation(line: 791, column: 88, scope: !1956)
!1963 = !DILocation(line: 791, column: 103, scope: !1956)
!1964 = !DILocation(line: 791, column: 3, scope: !1956)
!1965 = !DILocation(line: 792, column: 21, scope: !1956)
!1966 = !DILocation(line: 792, column: 41, scope: !1956)
!1967 = !DILocation(line: 792, column: 3, scope: !1956)
!1968 = !DILocation(line: 792, column: 8, scope: !1956)
!1969 = !DILocation(line: 792, column: 19, scope: !1956)
!1970 = !DILocation(line: 793, column: 3, scope: !1956)
!1971 = !DILocation(line: 793, column: 8, scope: !1956)
!1972 = !DILocation(line: 793, column: 23, scope: !1956)
!1973 = !DILocation(line: 794, column: 26, scope: !1956)
!1974 = !DILocation(line: 794, column: 31, scope: !1956)
!1975 = !DILocation(line: 794, column: 23, scope: !1956)
!1976 = !DILocation(line: 795, column: 7, scope: !1977)
!1977 = distinct !DILexicalBlock(scope: !1956, file: !2, line: 795, column: 7)
!1978 = !DILocation(line: 795, column: 27, scope: !1977)
!1979 = !DILocation(line: 795, column: 40, scope: !1977)
!1980 = !DILocation(line: 795, column: 60, scope: !1977)
!1981 = !DILocation(line: 796, column: 4, scope: !1982)
!1982 = distinct !DILexicalBlock(scope: !1977, file: !2, line: 795, column: 78)
!1983 = !DILocation(line: 797, column: 4, scope: !1982)
!1984 = !DILocation(line: 800, column: 3, scope: !1956)
!1985 = !DILocation(line: 800, column: 8, scope: !1956)
!1986 = !DILocation(line: 800, column: 17, scope: !1956)
!1987 = !DILocation(line: 802, column: 8, scope: !1988)
!1988 = distinct !DILexicalBlock(scope: !1956, file: !2, line: 802, column: 7)
!1989 = !DILocation(line: 802, column: 13, scope: !1988)
!1990 = !DILocation(line: 802, column: 24, scope: !1988)
!1991 = !DILocation(line: 802, column: 30, scope: !1988)
!1992 = !DILocation(line: 802, column: 33, scope: !1988)
!1993 = !DILocation(line: 802, column: 42, scope: !1988)
!1994 = !DILocation(line: 802, column: 51, scope: !1988)
!1995 = !DILocation(line: 802, column: 54, scope: !1988)
!1996 = !DILocation(line: 802, column: 63, scope: !1988)
!1997 = !DILocation(line: 803, column: 12, scope: !1988)
!1998 = !DILocation(line: 803, column: 56, scope: !1988)
!1999 = !DILocation(line: 803, column: 62, scope: !1988)
!2000 = !DILocation(line: 803, column: 85, scope: !1988)
!2001 = !DILocation(line: 803, column: 4, scope: !1988)
!2002 = !DILocation(line: 804, column: 3, scope: !1956)
!2003 = !DILocation(line: 804, column: 9, scope: !1956)
!2004 = !DILocation(line: 804, column: 31, scope: !1956)
!2005 = !DILocation(line: 807, column: 2, scope: !1907)
!2006 = !DILocation(line: 809, column: 1, scope: !1907)
!2007 = distinct !DISubprogram(name: "create_path_to_station", linkageName: "_Z22create_path_to_stationP6objecti", scope: !2, file: !2, line: 817, type: !2008, scopeLine: 818, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !242)
!2008 = !DISubroutineType(types: !2009)
!2009 = !{null, !526, !63}
!2010 = !DILocalVariable(name: "objp", arg: 1, scope: !2007, file: !2, line: 817, type: !526)
!2011 = !DILocation(line: 817, column: 37, scope: !2007)
!2012 = !DILocalVariable(name: "max_length", arg: 2, scope: !2007, file: !2, line: 817, type: !63)
!2013 = !DILocation(line: 817, column: 47, scope: !2007)
!2014 = !DILocalVariable(name: "aip", scope: !2007, file: !2, line: 819, type: !1734)
!2015 = !DILocation(line: 819, column: 13, scope: !2007)
!2016 = !DILocation(line: 819, column: 20, scope: !2007)
!2017 = !DILocation(line: 819, column: 26, scope: !2007)
!2018 = !DILocalVariable(name: "ailp", scope: !2007, file: !2, line: 820, type: !1739)
!2019 = !DILocation(line: 820, column: 13, scope: !2007)
!2020 = !DILocation(line: 820, column: 35, scope: !2007)
!2021 = !DILocation(line: 820, column: 39, scope: !2007)
!2022 = !DILocation(line: 820, column: 21, scope: !2007)
!2023 = !DILocalVariable(name: "start_seg", scope: !2007, file: !2, line: 821, type: !63)
!2024 = !DILocation(line: 821, column: 8, scope: !2007)
!2025 = !DILocalVariable(name: "end_seg", scope: !2007, file: !2, line: 821, type: !63)
!2026 = !DILocation(line: 821, column: 19, scope: !2007)
!2027 = !DILocation(line: 823, column: 6, scope: !2028)
!2028 = distinct !DILexicalBlock(scope: !2007, file: !2, line: 823, column: 6)
!2029 = !DILocation(line: 823, column: 17, scope: !2028)
!2030 = !DILocation(line: 824, column: 14, scope: !2028)
!2031 = !DILocation(line: 824, column: 3, scope: !2028)
!2032 = !DILocation(line: 826, column: 27, scope: !2007)
!2033 = !DILocation(line: 826, column: 2, scope: !2007)
!2034 = !DILocation(line: 826, column: 8, scope: !2007)
!2035 = !DILocation(line: 826, column: 25, scope: !2007)
!2036 = !DILocation(line: 828, column: 14, scope: !2007)
!2037 = !DILocation(line: 828, column: 20, scope: !2007)
!2038 = !DILocation(line: 828, column: 12, scope: !2007)
!2039 = !DILocation(line: 829, column: 12, scope: !2007)
!2040 = !DILocation(line: 829, column: 17, scope: !2007)
!2041 = !DILocation(line: 829, column: 10, scope: !2007)
!2042 = !DILocation(line: 833, column: 6, scope: !2043)
!2043 = distinct !DILexicalBlock(scope: !2007, file: !2, line: 833, column: 6)
!2044 = !DILocation(line: 833, column: 14, scope: !2043)
!2045 = !DILocation(line: 835, column: 2, scope: !2046)
!2046 = distinct !DILexicalBlock(scope: !2043, file: !2, line: 833, column: 21)
!2047 = !DILocation(line: 836, column: 22, scope: !2048)
!2048 = distinct !DILexicalBlock(scope: !2043, file: !2, line: 835, column: 9)
!2049 = !DILocation(line: 836, column: 28, scope: !2048)
!2050 = !DILocation(line: 836, column: 39, scope: !2048)
!2051 = !DILocation(line: 836, column: 48, scope: !2048)
!2052 = !DILocation(line: 836, column: 70, scope: !2048)
!2053 = !DILocation(line: 836, column: 75, scope: !2048)
!2054 = !DILocation(line: 836, column: 88, scope: !2048)
!2055 = !DILocation(line: 836, column: 3, scope: !2048)
!2056 = !DILocation(line: 837, column: 34, scope: !2048)
!2057 = !DILocation(line: 837, column: 40, scope: !2048)
!2058 = !DILocation(line: 837, column: 61, scope: !2048)
!2059 = !DILocation(line: 837, column: 66, scope: !2048)
!2060 = !DILocation(line: 837, column: 22, scope: !2048)
!2061 = !DILocation(line: 837, column: 3, scope: !2048)
!2062 = !DILocation(line: 837, column: 8, scope: !2048)
!2063 = !DILocation(line: 837, column: 20, scope: !2048)
!2064 = !DILocation(line: 838, column: 21, scope: !2048)
!2065 = !DILocation(line: 838, column: 41, scope: !2048)
!2066 = !DILocation(line: 838, column: 3, scope: !2048)
!2067 = !DILocation(line: 838, column: 8, scope: !2048)
!2068 = !DILocation(line: 838, column: 19, scope: !2048)
!2069 = !DILocation(line: 839, column: 3, scope: !2048)
!2070 = !DILocation(line: 839, column: 8, scope: !2048)
!2071 = !DILocation(line: 839, column: 23, scope: !2048)
!2072 = !DILocation(line: 841, column: 26, scope: !2048)
!2073 = !DILocation(line: 841, column: 31, scope: !2048)
!2074 = !DILocation(line: 841, column: 23, scope: !2048)
!2075 = !DILocation(line: 842, column: 7, scope: !2076)
!2076 = distinct !DILexicalBlock(scope: !2048, file: !2, line: 842, column: 7)
!2077 = !DILocation(line: 842, column: 27, scope: !2076)
!2078 = !DILocation(line: 842, column: 40, scope: !2076)
!2079 = !DILocation(line: 842, column: 60, scope: !2076)
!2080 = !DILocation(line: 845, column: 4, scope: !2081)
!2081 = distinct !DILexicalBlock(scope: !2076, file: !2, line: 842, column: 78)
!2082 = !DILocation(line: 846, column: 4, scope: !2081)
!2083 = !DILocation(line: 849, column: 3, scope: !2048)
!2084 = !DILocation(line: 849, column: 8, scope: !2048)
!2085 = !DILocation(line: 849, column: 17, scope: !2048)
!2086 = !DILocation(line: 851, column: 3, scope: !2048)
!2087 = !DILocation(line: 851, column: 9, scope: !2048)
!2088 = !DILocation(line: 851, column: 14, scope: !2048)
!2089 = !DILocation(line: 852, column: 8, scope: !2090)
!2090 = distinct !DILexicalBlock(scope: !2048, file: !2, line: 852, column: 7)
!2091 = !DILocation(line: 852, column: 13, scope: !2090)
!2092 = !DILocation(line: 852, column: 24, scope: !2090)
!2093 = !DILocation(line: 852, column: 30, scope: !2090)
!2094 = !DILocation(line: 852, column: 33, scope: !2090)
!2095 = !DILocation(line: 852, column: 42, scope: !2090)
!2096 = !DILocation(line: 852, column: 51, scope: !2090)
!2097 = !DILocation(line: 852, column: 54, scope: !2090)
!2098 = !DILocation(line: 852, column: 63, scope: !2090)
!2099 = !DILocation(line: 853, column: 12, scope: !2090)
!2100 = !DILocation(line: 853, column: 57, scope: !2090)
!2101 = !DILocation(line: 853, column: 63, scope: !2090)
!2102 = !DILocation(line: 853, column: 86, scope: !2090)
!2103 = !DILocation(line: 853, column: 4, scope: !2090)
!2104 = !DILocation(line: 854, column: 3, scope: !2048)
!2105 = !DILocation(line: 854, column: 9, scope: !2048)
!2106 = !DILocation(line: 854, column: 31, scope: !2048)
!2107 = !DILocation(line: 858, column: 2, scope: !2007)
!2108 = !DILocation(line: 860, column: 1, scope: !2007)
!2109 = distinct !DISubprogram(name: "create_n_segment_path", linkageName: "_Z21create_n_segment_pathP6objectii", scope: !2, file: !2, line: 865, type: !1725, scopeLine: 866, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !242)
!2110 = !DILocalVariable(name: "objp", arg: 1, scope: !2109, file: !2, line: 865, type: !526)
!2111 = !DILocation(line: 865, column: 36, scope: !2109)
!2112 = !DILocalVariable(name: "path_length", arg: 2, scope: !2109, file: !2, line: 865, type: !63)
!2113 = !DILocation(line: 865, column: 46, scope: !2109)
!2114 = !DILocalVariable(name: "avoid_seg", arg: 3, scope: !2109, file: !2, line: 865, type: !63)
!2115 = !DILocation(line: 865, column: 63, scope: !2109)
!2116 = !DILocalVariable(name: "aip", scope: !2109, file: !2, line: 867, type: !1734)
!2117 = !DILocation(line: 867, column: 13, scope: !2109)
!2118 = !DILocation(line: 867, column: 18, scope: !2109)
!2119 = !DILocation(line: 867, column: 24, scope: !2109)
!2120 = !DILocalVariable(name: "ailp", scope: !2109, file: !2, line: 868, type: !1739)
!2121 = !DILocation(line: 868, column: 13, scope: !2109)
!2122 = !DILocation(line: 868, column: 35, scope: !2109)
!2123 = !DILocation(line: 868, column: 39, scope: !2109)
!2124 = !DILocation(line: 868, column: 21, scope: !2109)
!2125 = !DILocation(line: 872, column: 25, scope: !2126)
!2126 = distinct !DILexicalBlock(scope: !2109, file: !2, line: 872, column: 6)
!2127 = !DILocation(line: 872, column: 31, scope: !2126)
!2128 = !DILocation(line: 872, column: 37, scope: !2126)
!2129 = !DILocation(line: 872, column: 49, scope: !2126)
!2130 = !DILocation(line: 872, column: 71, scope: !2126)
!2131 = !DILocation(line: 872, column: 76, scope: !2126)
!2132 = !DILocation(line: 872, column: 89, scope: !2126)
!2133 = !DILocation(line: 872, column: 108, scope: !2126)
!2134 = !DILocation(line: 872, column: 6, scope: !2126)
!2135 = !DILocation(line: 872, column: 119, scope: !2126)
!2136 = !DILocation(line: 873, column: 26, scope: !2137)
!2137 = distinct !DILexicalBlock(scope: !2126, file: !2, line: 872, column: 126)
!2138 = !DILocation(line: 873, column: 31, scope: !2137)
!2139 = !DILocation(line: 873, column: 23, scope: !2137)
!2140 = !DILocation(line: 874, column: 3, scope: !2137)
!2141 = !DILocation(line: 874, column: 30, scope: !2137)
!2142 = !DILocation(line: 874, column: 36, scope: !2137)
!2143 = !DILocation(line: 874, column: 42, scope: !2137)
!2144 = !DILocation(line: 874, column: 54, scope: !2137)
!2145 = !DILocation(line: 874, column: 76, scope: !2137)
!2146 = !DILocation(line: 874, column: 81, scope: !2137)
!2147 = !DILocation(line: 874, column: 94, scope: !2137)
!2148 = !DILocation(line: 874, column: 11, scope: !2137)
!2149 = !DILocation(line: 874, column: 119, scope: !2137)
!2150 = !DILocation(line: 876, column: 4, scope: !2151)
!2151 = distinct !DILexicalBlock(scope: !2137, file: !2, line: 874, column: 127)
!2152 = distinct !{!2152, !2140, !2153, !262}
!2153 = !DILocation(line: 877, column: 3, scope: !2137)
!2154 = !DILocation(line: 878, column: 2, scope: !2137)
!2155 = !DILocation(line: 880, column: 20, scope: !2109)
!2156 = !DILocation(line: 880, column: 40, scope: !2109)
!2157 = !DILocation(line: 880, column: 2, scope: !2109)
!2158 = !DILocation(line: 880, column: 7, scope: !2109)
!2159 = !DILocation(line: 880, column: 18, scope: !2109)
!2160 = !DILocation(line: 881, column: 2, scope: !2109)
!2161 = !DILocation(line: 881, column: 7, scope: !2109)
!2162 = !DILocation(line: 881, column: 22, scope: !2109)
!2163 = !DILocation(line: 885, column: 25, scope: !2109)
!2164 = !DILocation(line: 885, column: 30, scope: !2109)
!2165 = !DILocation(line: 885, column: 22, scope: !2109)
!2166 = !DILocation(line: 886, column: 6, scope: !2167)
!2167 = distinct !DILexicalBlock(scope: !2109, file: !2, line: 886, column: 6)
!2168 = !DILocation(line: 886, column: 26, scope: !2167)
!2169 = !DILocation(line: 886, column: 39, scope: !2167)
!2170 = !DILocation(line: 886, column: 59, scope: !2167)
!2171 = !DILocation(line: 889, column: 3, scope: !2172)
!2172 = distinct !DILexicalBlock(scope: !2167, file: !2, line: 886, column: 77)
!2173 = !DILocation(line: 890, column: 2, scope: !2172)
!2174 = !DILocation(line: 892, column: 2, scope: !2109)
!2175 = !DILocation(line: 892, column: 7, scope: !2109)
!2176 = !DILocation(line: 892, column: 16, scope: !2109)
!2177 = !DILocation(line: 894, column: 2, scope: !2109)
!2178 = !DILocation(line: 894, column: 8, scope: !2109)
!2179 = !DILocation(line: 894, column: 13, scope: !2109)
!2180 = !DILocation(line: 898, column: 20, scope: !2181)
!2181 = distinct !DILexicalBlock(scope: !2109, file: !2, line: 898, column: 6)
!2182 = !DILocation(line: 898, column: 24, scope: !2181)
!2183 = !DILocation(line: 898, column: 6, scope: !2181)
!2184 = !DILocation(line: 898, column: 34, scope: !2181)
!2185 = !DILocation(line: 899, column: 7, scope: !2186)
!2186 = distinct !DILexicalBlock(scope: !2187, file: !2, line: 899, column: 7)
!2187 = distinct !DILexicalBlock(scope: !2181, file: !2, line: 898, column: 55)
!2188 = !DILocation(line: 899, column: 12, scope: !2186)
!2189 = !DILocalVariable(name: "t_num_points", scope: !2190, file: !2, line: 900, type: !63)
!2190 = distinct !DILexicalBlock(scope: !2186, file: !2, line: 899, column: 25)
!2191 = !DILocation(line: 900, column: 8, scope: !2190)
!2192 = !DILocation(line: 900, column: 23, scope: !2190)
!2193 = !DILocation(line: 900, column: 28, scope: !2190)
!2194 = !DILocation(line: 901, column: 37, scope: !2190)
!2195 = !DILocation(line: 901, column: 42, scope: !2190)
!2196 = !DILocation(line: 901, column: 26, scope: !2190)
!2197 = !DILocation(line: 901, column: 70, scope: !2190)
!2198 = !DILocation(line: 901, column: 4, scope: !2190)
!2199 = !DILocation(line: 902, column: 23, scope: !2190)
!2200 = !DILocation(line: 902, column: 4, scope: !2190)
!2201 = !DILocation(line: 902, column: 9, scope: !2190)
!2202 = !DILocation(line: 902, column: 21, scope: !2190)
!2203 = !DILocation(line: 903, column: 3, scope: !2190)
!2204 = !DILocation(line: 904, column: 2, scope: !2187)
!2205 = !DILocation(line: 907, column: 2, scope: !2109)
!2206 = !DILocation(line: 909, column: 1, scope: !2109)
!2207 = distinct !DISubprogram(name: "create_n_segment_path_to_door", linkageName: "_Z29create_n_segment_path_to_doorP6objectii", scope: !2, file: !2, line: 912, type: !1725, scopeLine: 913, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !242)
!2208 = !DILocalVariable(name: "objp", arg: 1, scope: !2207, file: !2, line: 912, type: !526)
!2209 = !DILocation(line: 912, column: 44, scope: !2207)
!2210 = !DILocalVariable(name: "path_length", arg: 2, scope: !2207, file: !2, line: 912, type: !63)
!2211 = !DILocation(line: 912, column: 54, scope: !2207)
!2212 = !DILocalVariable(name: "avoid_seg", arg: 3, scope: !2207, file: !2, line: 912, type: !63)
!2213 = !DILocation(line: 912, column: 71, scope: !2207)
!2214 = !DILocation(line: 914, column: 24, scope: !2207)
!2215 = !DILocation(line: 914, column: 30, scope: !2207)
!2216 = !DILocation(line: 914, column: 43, scope: !2207)
!2217 = !DILocation(line: 914, column: 2, scope: !2207)
!2218 = !DILocation(line: 915, column: 1, scope: !2207)
!2219 = distinct !DISubprogram(name: "move_object_to_goal", linkageName: "_Z19move_object_to_goalP6objectP10vms_vectori", scope: !2, file: !2, line: 922, type: !2220, scopeLine: 923, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !242)
!2220 = !DISubroutineType(types: !2221)
!2221 = !{null, !526, !863, !63}
!2222 = !DILocalVariable(name: "objp", arg: 1, scope: !2219, file: !2, line: 922, type: !526)
!2223 = !DILocation(line: 922, column: 34, scope: !2219)
!2224 = !DILocalVariable(name: "goal_point", arg: 2, scope: !2219, file: !2, line: 922, type: !863)
!2225 = !DILocation(line: 922, column: 52, scope: !2219)
!2226 = !DILocalVariable(name: "goal_seg", arg: 3, scope: !2219, file: !2, line: 922, type: !63)
!2227 = !DILocation(line: 922, column: 68, scope: !2219)
!2228 = !DILocalVariable(name: "aip", scope: !2219, file: !2, line: 924, type: !1734)
!2229 = !DILocation(line: 924, column: 13, scope: !2219)
!2230 = !DILocation(line: 924, column: 20, scope: !2219)
!2231 = !DILocation(line: 924, column: 26, scope: !2219)
!2232 = !DILocalVariable(name: "segnum", scope: !2219, file: !2, line: 925, type: !63)
!2233 = !DILocation(line: 925, column: 8, scope: !2219)
!2234 = !DILocation(line: 927, column: 6, scope: !2235)
!2235 = distinct !DILexicalBlock(scope: !2219, file: !2, line: 927, column: 6)
!2236 = !DILocation(line: 927, column: 11, scope: !2235)
!2237 = !DILocation(line: 927, column: 23, scope: !2235)
!2238 = !DILocation(line: 928, column: 3, scope: !2235)
!2239 = !DILocation(line: 930, column: 2, scope: !2219)
!2240 = !DILocation(line: 935, column: 6, scope: !2241)
!2241 = distinct !DILexicalBlock(scope: !2219, file: !2, line: 935, column: 6)
!2242 = !DILocation(line: 935, column: 12, scope: !2241)
!2243 = !DILocation(line: 935, column: 22, scope: !2241)
!2244 = !DILocation(line: 935, column: 19, scope: !2241)
!2245 = !DILocation(line: 936, column: 35, scope: !2246)
!2246 = distinct !DILexicalBlock(scope: !2241, file: !2, line: 936, column: 7)
!2247 = !DILocation(line: 936, column: 41, scope: !2246)
!2248 = !DILocation(line: 936, column: 26, scope: !2246)
!2249 = !DILocation(line: 936, column: 60, scope: !2246)
!2250 = !DILocation(line: 936, column: 51, scope: !2246)
!2251 = !DILocation(line: 936, column: 7, scope: !2246)
!2252 = !DILocation(line: 936, column: 71, scope: !2246)
!2253 = !DILocalVariable(name: "dist", scope: !2254, file: !2, line: 937, type: !69)
!2254 = distinct !DILexicalBlock(scope: !2246, file: !2, line: 936, column: 78)
!2255 = !DILocation(line: 937, column: 8, scope: !2254)
!2256 = !DILocation(line: 938, column: 36, scope: !2254)
!2257 = !DILocation(line: 938, column: 42, scope: !2254)
!2258 = !DILocation(line: 938, column: 47, scope: !2254)
!2259 = !DILocation(line: 938, column: 53, scope: !2254)
!2260 = !DILocation(line: 938, column: 61, scope: !2254)
!2261 = !DILocation(line: 938, column: 73, scope: !2254)
!2262 = !DILocation(line: 938, column: 11, scope: !2254)
!2263 = !DILocation(line: 938, column: 9, scope: !2254)
!2264 = !DILocation(line: 939, column: 8, scope: !2265)
!2265 = distinct !DILexicalBlock(scope: !2254, file: !2, line: 939, column: 8)
!2266 = !DILocation(line: 939, column: 35, scope: !2265)
!2267 = !DILocation(line: 941, column: 5, scope: !2268)
!2268 = distinct !DILexicalBlock(scope: !2265, file: !2, line: 939, column: 40)
!2269 = !DILocation(line: 942, column: 4, scope: !2268)
!2270 = !DILocation(line: 943, column: 3, scope: !2254)
!2271 = !DILocation(line: 936, column: 75, scope: !2246)
!2272 = !DILocation(line: 946, column: 2, scope: !2219)
!2273 = !DILocation(line: 948, column: 6, scope: !2274)
!2274 = distinct !DILexicalBlock(scope: !2219, file: !2, line: 948, column: 6)
!2275 = !DILocation(line: 948, column: 11, scope: !2274)
!2276 = !DILocation(line: 948, column: 26, scope: !2274)
!2277 = !DILocation(line: 949, column: 7, scope: !2278)
!2278 = distinct !DILexicalBlock(scope: !2279, file: !2, line: 949, column: 7)
!2279 = distinct !DILexicalBlock(scope: !2274, file: !2, line: 948, column: 32)
!2280 = !DILocation(line: 949, column: 12, scope: !2278)
!2281 = !DILocation(line: 949, column: 21, scope: !2278)
!2282 = !DILocation(line: 951, column: 27, scope: !2283)
!2283 = distinct !DILexicalBlock(scope: !2278, file: !2, line: 949, column: 37)
!2284 = !DILocation(line: 951, column: 4, scope: !2283)
!2285 = !DILocation(line: 952, column: 4, scope: !2283)
!2286 = !DILocation(line: 954, column: 3, scope: !2279)
!2287 = !DILocation(line: 954, column: 8, scope: !2279)
!2288 = !DILocation(line: 954, column: 23, scope: !2279)
!2289 = !DILocation(line: 955, column: 3, scope: !2279)
!2290 = !DILocation(line: 955, column: 8, scope: !2279)
!2291 = !DILocation(line: 955, column: 17, scope: !2279)
!2292 = !DILocation(line: 956, column: 2, scope: !2279)
!2293 = !DILocation(line: 956, column: 13, scope: !2294)
!2294 = distinct !DILexicalBlock(scope: !2274, file: !2, line: 956, column: 13)
!2295 = !DILocation(line: 956, column: 18, scope: !2294)
!2296 = !DILocation(line: 956, column: 36, scope: !2294)
!2297 = !DILocation(line: 956, column: 41, scope: !2294)
!2298 = !DILocation(line: 956, column: 53, scope: !2294)
!2299 = !DILocation(line: 956, column: 33, scope: !2294)
!2300 = !DILocation(line: 957, column: 7, scope: !2301)
!2301 = distinct !DILexicalBlock(scope: !2302, file: !2, line: 957, column: 7)
!2302 = distinct !DILexicalBlock(scope: !2294, file: !2, line: 956, column: 58)
!2303 = !DILocation(line: 957, column: 12, scope: !2301)
!2304 = !DILocation(line: 957, column: 21, scope: !2301)
!2305 = !DILocation(line: 959, column: 27, scope: !2306)
!2306 = distinct !DILexicalBlock(scope: !2301, file: !2, line: 957, column: 37)
!2307 = !DILocation(line: 959, column: 4, scope: !2306)
!2308 = !DILocation(line: 960, column: 8, scope: !2309)
!2309 = distinct !DILexicalBlock(scope: !2306, file: !2, line: 960, column: 8)
!2310 = !DILocation(line: 960, column: 13, scope: !2309)
!2311 = !DILocation(line: 960, column: 25, scope: !2309)
!2312 = !DILocalVariable(name: "ailp", scope: !2313, file: !2, line: 961, type: !1739)
!2313 = distinct !DILexicalBlock(scope: !2309, file: !2, line: 960, column: 31)
!2314 = !DILocation(line: 961, column: 16, scope: !2313)
!2315 = !DILocation(line: 961, column: 38, scope: !2313)
!2316 = !DILocation(line: 961, column: 42, scope: !2313)
!2317 = !DILocation(line: 961, column: 24, scope: !2313)
!2318 = !DILocation(line: 962, column: 5, scope: !2313)
!2319 = !DILocation(line: 962, column: 11, scope: !2313)
!2320 = !DILocation(line: 962, column: 16, scope: !2313)
!2321 = !DILocation(line: 963, column: 4, scope: !2313)
!2322 = !DILocation(line: 964, column: 4, scope: !2306)
!2323 = !DILocation(line: 966, column: 3, scope: !2302)
!2324 = !DILocation(line: 967, column: 25, scope: !2302)
!2325 = !DILocation(line: 967, column: 30, scope: !2302)
!2326 = !DILocation(line: 967, column: 41, scope: !2302)
!2327 = !DILocation(line: 967, column: 3, scope: !2302)
!2328 = !DILocation(line: 967, column: 8, scope: !2302)
!2329 = !DILocation(line: 967, column: 23, scope: !2302)
!2330 = !DILocation(line: 968, column: 3, scope: !2302)
!2331 = !DILocation(line: 968, column: 8, scope: !2302)
!2332 = !DILocation(line: 968, column: 17, scope: !2302)
!2333 = !DILocation(line: 969, column: 2, scope: !2302)
!2334 = !DILocation(line: 970, column: 26, scope: !2294)
!2335 = !DILocation(line: 970, column: 31, scope: !2294)
!2336 = !DILocation(line: 970, column: 3, scope: !2294)
!2337 = !DILocation(line: 970, column: 8, scope: !2294)
!2338 = !DILocation(line: 970, column: 23, scope: !2294)
!2339 = !DILocation(line: 974, column: 15, scope: !2219)
!2340 = !DILocation(line: 974, column: 2, scope: !2219)
!2341 = !DILocation(line: 974, column: 8, scope: !2219)
!2342 = !DILocation(line: 974, column: 12, scope: !2219)
!2343 = !DILocation(line: 975, column: 27, scope: !2219)
!2344 = !DILocation(line: 975, column: 11, scope: !2219)
!2345 = !DILocation(line: 975, column: 9, scope: !2219)
!2346 = !DILocation(line: 976, column: 6, scope: !2347)
!2347 = distinct !DILexicalBlock(scope: !2219, file: !2, line: 976, column: 6)
!2348 = !DILocation(line: 976, column: 16, scope: !2347)
!2349 = !DILocation(line: 976, column: 13, scope: !2347)
!2350 = !DILocation(line: 977, column: 3, scope: !2347)
!2351 = !DILocation(line: 979, column: 6, scope: !2352)
!2352 = distinct !DILexicalBlock(scope: !2219, file: !2, line: 979, column: 6)
!2353 = !DILocation(line: 979, column: 13, scope: !2352)
!2354 = !DILocation(line: 980, column: 3, scope: !2355)
!2355 = distinct !DILexicalBlock(scope: !2352, file: !2, line: 979, column: 20)
!2356 = !DILocation(line: 983, column: 27, scope: !2355)
!2357 = !DILocation(line: 983, column: 33, scope: !2355)
!2358 = !DILocation(line: 983, column: 48, scope: !2355)
!2359 = !DILocation(line: 983, column: 54, scope: !2355)
!2360 = !DILocation(line: 983, column: 39, scope: !2355)
!2361 = !DILocation(line: 983, column: 3, scope: !2355)
!2362 = !DILocation(line: 984, column: 2, scope: !2355)
!2363 = !DILocation(line: 985, column: 14, scope: !2352)
!2364 = !DILocation(line: 985, column: 18, scope: !2352)
!2365 = !DILocation(line: 985, column: 28, scope: !2352)
!2366 = !DILocation(line: 985, column: 3, scope: !2352)
!2367 = !DILocation(line: 986, column: 1, scope: !2219)
!2368 = distinct !DISubprogram(name: "f2fl", linkageName: "_Z4f2fli", scope: !70, file: !70, line: 72, type: !2369, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !242)
!2369 = !DISubroutineType(types: !2370)
!2370 = !{!2371, !69}
!2371 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!2372 = !DILocalVariable(name: "f", arg: 1, scope: !2368, file: !70, line: 72, type: !69)
!2373 = !DILocation(line: 72, column: 26, scope: !2368)
!2374 = !DILocation(line: 74, column: 9, scope: !2368)
!2375 = !DILocation(line: 74, column: 11, scope: !2368)
!2376 = !DILocation(line: 74, column: 2, scope: !2368)
!2377 = distinct !DISubprogram(name: "ai_follow_path", linkageName: "_Z14ai_follow_pathP6objectiiP10vms_vector", scope: !2, file: !2, line: 1022, type: !2378, scopeLine: 1023, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !242)
!2378 = !DISubroutineType(types: !2379)
!2379 = !{null, !526, !63, !63, !863}
!2380 = !DILocalVariable(name: "objp", arg: 1, scope: !2377, file: !2, line: 1022, type: !526)
!2381 = !DILocation(line: 1022, column: 29, scope: !2377)
!2382 = !DILocalVariable(name: "player_visibility", arg: 2, scope: !2377, file: !2, line: 1022, type: !63)
!2383 = !DILocation(line: 1022, column: 39, scope: !2377)
!2384 = !DILocalVariable(name: "previous_visibility", arg: 3, scope: !2377, file: !2, line: 1022, type: !63)
!2385 = !DILocation(line: 1022, column: 62, scope: !2377)
!2386 = !DILocalVariable(name: "vec_to_player", arg: 4, scope: !2377, file: !2, line: 1022, type: !863)
!2387 = !DILocation(line: 1022, column: 95, scope: !2377)
!2388 = !DILocalVariable(name: "aip", scope: !2377, file: !2, line: 1024, type: !1734)
!2389 = !DILocation(line: 1024, column: 14, scope: !2377)
!2390 = !DILocation(line: 1024, column: 21, scope: !2377)
!2391 = !DILocation(line: 1024, column: 27, scope: !2377)
!2392 = !DILocalVariable(name: "goal_point", scope: !2377, file: !2, line: 1026, type: !308)
!2393 = !DILocation(line: 1026, column: 13, scope: !2377)
!2394 = !DILocalVariable(name: "new_goal_point", scope: !2377, file: !2, line: 1026, type: !308)
!2395 = !DILocation(line: 1026, column: 25, scope: !2377)
!2396 = !DILocalVariable(name: "dist_to_goal", scope: !2377, file: !2, line: 1027, type: !69)
!2397 = !DILocation(line: 1027, column: 8, scope: !2377)
!2398 = !DILocalVariable(name: "robptr", scope: !2377, file: !2, line: 1028, type: !2399)
!2399 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2400, size: 64)
!2400 = !DIDerivedType(tag: DW_TAG_typedef, name: "robot_info", file: !2401, line: 128, baseType: !2402)
!2401 = !DIFile(filename: "main_d2/robot.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "7821ab73cbe058734a84802231002e5e")
!2402 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "robot_info", file: !2401, line: 53, size: 3840, flags: DIFlagTypePassByValue, elements: !2403, identifier: "_ZTS10robot_info")
!2403 = !{!2404, !2405, !2407, !2409, !2410, !2411, !2412, !2413, !2414, !2415, !2416, !2417, !2418, !2419, !2420, !2421, !2422, !2423, !2424, !2425, !2426, !2427, !2428, !2432, !2433, !2434, !2435, !2436, !2437, !2439, !2440, !2441, !2442, !2443, !2444, !2445, !2446, !2447, !2448, !2449, !2450, !2451, !2452, !2453, !2454, !2455, !2459, !2460, !2461, !2462, !2463, !2472}
!2404 = !DIDerivedType(tag: DW_TAG_member, name: "model_num", scope: !2402, file: !2401, line: 55, baseType: !63, size: 32)
!2405 = !DIDerivedType(tag: DW_TAG_member, name: "gun_points", scope: !2402, file: !2401, line: 56, baseType: !2406, size: 768, offset: 32)
!2406 = !DICompositeType(tag: DW_TAG_array_type, baseType: !308, size: 768, elements: !1189)
!2407 = !DIDerivedType(tag: DW_TAG_member, name: "gun_submodels", scope: !2402, file: !2401, line: 57, baseType: !2408, size: 64, offset: 800)
!2408 = !DICompositeType(tag: DW_TAG_array_type, baseType: !166, size: 64, elements: !1189)
!2409 = !DIDerivedType(tag: DW_TAG_member, name: "exp1_vclip_num", scope: !2402, file: !2401, line: 59, baseType: !162, size: 16, offset: 864)
!2410 = !DIDerivedType(tag: DW_TAG_member, name: "exp1_sound_num", scope: !2402, file: !2401, line: 60, baseType: !162, size: 16, offset: 880)
!2411 = !DIDerivedType(tag: DW_TAG_member, name: "exp2_vclip_num", scope: !2402, file: !2401, line: 62, baseType: !162, size: 16, offset: 896)
!2412 = !DIDerivedType(tag: DW_TAG_member, name: "exp2_sound_num", scope: !2402, file: !2401, line: 63, baseType: !162, size: 16, offset: 912)
!2413 = !DIDerivedType(tag: DW_TAG_member, name: "weapon_type", scope: !2402, file: !2401, line: 65, baseType: !155, size: 8, offset: 928)
!2414 = !DIDerivedType(tag: DW_TAG_member, name: "weapon_type2", scope: !2402, file: !2401, line: 66, baseType: !155, size: 8, offset: 936)
!2415 = !DIDerivedType(tag: DW_TAG_member, name: "n_guns", scope: !2402, file: !2401, line: 67, baseType: !155, size: 8, offset: 944)
!2416 = !DIDerivedType(tag: DW_TAG_member, name: "contains_id", scope: !2402, file: !2401, line: 68, baseType: !155, size: 8, offset: 952)
!2417 = !DIDerivedType(tag: DW_TAG_member, name: "contains_count", scope: !2402, file: !2401, line: 70, baseType: !155, size: 8, offset: 960)
!2418 = !DIDerivedType(tag: DW_TAG_member, name: "contains_prob", scope: !2402, file: !2401, line: 71, baseType: !155, size: 8, offset: 968)
!2419 = !DIDerivedType(tag: DW_TAG_member, name: "contains_type", scope: !2402, file: !2401, line: 72, baseType: !155, size: 8, offset: 976)
!2420 = !DIDerivedType(tag: DW_TAG_member, name: "kamikaze", scope: !2402, file: !2401, line: 73, baseType: !155, size: 8, offset: 984)
!2421 = !DIDerivedType(tag: DW_TAG_member, name: "score_value", scope: !2402, file: !2401, line: 75, baseType: !162, size: 16, offset: 992)
!2422 = !DIDerivedType(tag: DW_TAG_member, name: "badass", scope: !2402, file: !2401, line: 76, baseType: !155, size: 8, offset: 1008)
!2423 = !DIDerivedType(tag: DW_TAG_member, name: "energy_drain", scope: !2402, file: !2401, line: 77, baseType: !155, size: 8, offset: 1016)
!2424 = !DIDerivedType(tag: DW_TAG_member, name: "lighting", scope: !2402, file: !2401, line: 79, baseType: !69, size: 32, offset: 1024)
!2425 = !DIDerivedType(tag: DW_TAG_member, name: "strength", scope: !2402, file: !2401, line: 80, baseType: !69, size: 32, offset: 1056)
!2426 = !DIDerivedType(tag: DW_TAG_member, name: "mass", scope: !2402, file: !2401, line: 82, baseType: !69, size: 32, offset: 1088)
!2427 = !DIDerivedType(tag: DW_TAG_member, name: "drag", scope: !2402, file: !2401, line: 83, baseType: !69, size: 32, offset: 1120)
!2428 = !DIDerivedType(tag: DW_TAG_member, name: "field_of_view", scope: !2402, file: !2401, line: 85, baseType: !2429, size: 160, offset: 1152)
!2429 = !DICompositeType(tag: DW_TAG_array_type, baseType: !69, size: 160, elements: !2430)
!2430 = !{!2431}
!2431 = !DISubrange(count: 5)
!2432 = !DIDerivedType(tag: DW_TAG_member, name: "firing_wait", scope: !2402, file: !2401, line: 86, baseType: !2429, size: 160, offset: 1312)
!2433 = !DIDerivedType(tag: DW_TAG_member, name: "firing_wait2", scope: !2402, file: !2401, line: 87, baseType: !2429, size: 160, offset: 1472)
!2434 = !DIDerivedType(tag: DW_TAG_member, name: "turn_time", scope: !2402, file: !2401, line: 88, baseType: !2429, size: 160, offset: 1632)
!2435 = !DIDerivedType(tag: DW_TAG_member, name: "max_speed", scope: !2402, file: !2401, line: 91, baseType: !2429, size: 160, offset: 1792)
!2436 = !DIDerivedType(tag: DW_TAG_member, name: "circle_distance", scope: !2402, file: !2401, line: 92, baseType: !2429, size: 160, offset: 1952)
!2437 = !DIDerivedType(tag: DW_TAG_member, name: "rapidfire_count", scope: !2402, file: !2401, line: 94, baseType: !2438, size: 40, offset: 2112)
!2438 = !DICompositeType(tag: DW_TAG_array_type, baseType: !155, size: 40, elements: !2430)
!2439 = !DIDerivedType(tag: DW_TAG_member, name: "evade_speed", scope: !2402, file: !2401, line: 95, baseType: !2438, size: 40, offset: 2152)
!2440 = !DIDerivedType(tag: DW_TAG_member, name: "cloak_type", scope: !2402, file: !2401, line: 96, baseType: !155, size: 8, offset: 2192)
!2441 = !DIDerivedType(tag: DW_TAG_member, name: "attack_type", scope: !2402, file: !2401, line: 97, baseType: !155, size: 8, offset: 2200)
!2442 = !DIDerivedType(tag: DW_TAG_member, name: "see_sound", scope: !2402, file: !2401, line: 99, baseType: !166, size: 8, offset: 2208)
!2443 = !DIDerivedType(tag: DW_TAG_member, name: "attack_sound", scope: !2402, file: !2401, line: 100, baseType: !166, size: 8, offset: 2216)
!2444 = !DIDerivedType(tag: DW_TAG_member, name: "claw_sound", scope: !2402, file: !2401, line: 101, baseType: !166, size: 8, offset: 2224)
!2445 = !DIDerivedType(tag: DW_TAG_member, name: "taunt_sound", scope: !2402, file: !2401, line: 102, baseType: !166, size: 8, offset: 2232)
!2446 = !DIDerivedType(tag: DW_TAG_member, name: "boss_flag", scope: !2402, file: !2401, line: 104, baseType: !155, size: 8, offset: 2240)
!2447 = !DIDerivedType(tag: DW_TAG_member, name: "companion", scope: !2402, file: !2401, line: 105, baseType: !155, size: 8, offset: 2248)
!2448 = !DIDerivedType(tag: DW_TAG_member, name: "smart_blobs", scope: !2402, file: !2401, line: 106, baseType: !155, size: 8, offset: 2256)
!2449 = !DIDerivedType(tag: DW_TAG_member, name: "energy_blobs", scope: !2402, file: !2401, line: 107, baseType: !155, size: 8, offset: 2264)
!2450 = !DIDerivedType(tag: DW_TAG_member, name: "thief", scope: !2402, file: !2401, line: 109, baseType: !155, size: 8, offset: 2272)
!2451 = !DIDerivedType(tag: DW_TAG_member, name: "pursuit", scope: !2402, file: !2401, line: 110, baseType: !155, size: 8, offset: 2280)
!2452 = !DIDerivedType(tag: DW_TAG_member, name: "lightcast", scope: !2402, file: !2401, line: 111, baseType: !155, size: 8, offset: 2288)
!2453 = !DIDerivedType(tag: DW_TAG_member, name: "death_roll", scope: !2402, file: !2401, line: 112, baseType: !155, size: 8, offset: 2296)
!2454 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !2402, file: !2401, line: 115, baseType: !166, size: 8, offset: 2304)
!2455 = !DIDerivedType(tag: DW_TAG_member, name: "pad", scope: !2402, file: !2401, line: 116, baseType: !2456, size: 24, offset: 2312)
!2456 = !DICompositeType(tag: DW_TAG_array_type, baseType: !166, size: 24, elements: !2457)
!2457 = !{!2458}
!2458 = !DISubrange(count: 3)
!2459 = !DIDerivedType(tag: DW_TAG_member, name: "deathroll_sound", scope: !2402, file: !2401, line: 118, baseType: !166, size: 8, offset: 2336)
!2460 = !DIDerivedType(tag: DW_TAG_member, name: "glow", scope: !2402, file: !2401, line: 119, baseType: !166, size: 8, offset: 2344)
!2461 = !DIDerivedType(tag: DW_TAG_member, name: "behavior", scope: !2402, file: !2401, line: 120, baseType: !166, size: 8, offset: 2352)
!2462 = !DIDerivedType(tag: DW_TAG_member, name: "aim", scope: !2402, file: !2401, line: 121, baseType: !166, size: 8, offset: 2360)
!2463 = !DIDerivedType(tag: DW_TAG_member, name: "anim_states", scope: !2402, file: !2401, line: 124, baseType: !2464, size: 1440, offset: 2368)
!2464 = !DICompositeType(tag: DW_TAG_array_type, baseType: !2465, size: 1440, elements: !2470)
!2465 = !DIDerivedType(tag: DW_TAG_typedef, name: "jointlist", file: !2401, line: 46, baseType: !2466)
!2466 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "jointlist", file: !2401, line: 42, size: 32, flags: DIFlagTypePassByValue, elements: !2467, identifier: "_ZTS9jointlist")
!2467 = !{!2468, !2469}
!2468 = !DIDerivedType(tag: DW_TAG_member, name: "n_joints", scope: !2466, file: !2401, line: 44, baseType: !162, size: 16)
!2469 = !DIDerivedType(tag: DW_TAG_member, name: "offset", scope: !2466, file: !2401, line: 45, baseType: !162, size: 16, offset: 16)
!2470 = !{!2471, !2431}
!2471 = !DISubrange(count: 9)
!2472 = !DIDerivedType(tag: DW_TAG_member, name: "always_0xabcd", scope: !2402, file: !2401, line: 126, baseType: !63, size: 32, offset: 3808)
!2473 = !DILocation(line: 1028, column: 14, scope: !2377)
!2474 = !DILocation(line: 1028, column: 35, scope: !2377)
!2475 = !DILocation(line: 1028, column: 41, scope: !2377)
!2476 = !DILocation(line: 1028, column: 24, scope: !2377)
!2477 = !DILocalVariable(name: "forced_break", scope: !2377, file: !2, line: 1029, type: !63)
!2478 = !DILocation(line: 1029, column: 8, scope: !2377)
!2479 = !DILocalVariable(name: "original_dir", scope: !2377, file: !2, line: 1029, type: !63)
!2480 = !DILocation(line: 1029, column: 22, scope: !2377)
!2481 = !DILocalVariable(name: "original_index", scope: !2377, file: !2, line: 1029, type: !63)
!2482 = !DILocation(line: 1029, column: 36, scope: !2377)
!2483 = !DILocalVariable(name: "dist_to_player", scope: !2377, file: !2, line: 1030, type: !69)
!2484 = !DILocation(line: 1030, column: 8, scope: !2377)
!2485 = !DILocalVariable(name: "goal_seg", scope: !2377, file: !2, line: 1031, type: !63)
!2486 = !DILocation(line: 1031, column: 8, scope: !2377)
!2487 = !DILocalVariable(name: "ailp", scope: !2377, file: !2, line: 1032, type: !1739)
!2488 = !DILocation(line: 1032, column: 13, scope: !2377)
!2489 = !DILocation(line: 1032, column: 35, scope: !2377)
!2490 = !DILocation(line: 1032, column: 39, scope: !2377)
!2491 = !DILocation(line: 1032, column: 21, scope: !2377)
!2492 = !DILocalVariable(name: "threshold_distance", scope: !2377, file: !2, line: 1033, type: !69)
!2493 = !DILocation(line: 1033, column: 8, scope: !2377)
!2494 = !DILocation(line: 1038, column: 7, scope: !2495)
!2495 = distinct !DILexicalBlock(scope: !2377, file: !2, line: 1038, column: 6)
!2496 = !DILocation(line: 1038, column: 12, scope: !2495)
!2497 = !DILocation(line: 1038, column: 23, scope: !2495)
!2498 = !DILocation(line: 1038, column: 30, scope: !2495)
!2499 = !DILocation(line: 1038, column: 34, scope: !2495)
!2500 = !DILocation(line: 1038, column: 39, scope: !2495)
!2501 = !DILocation(line: 1038, column: 51, scope: !2495)
!2502 = !DILocation(line: 1039, column: 7, scope: !2503)
!2503 = distinct !DILexicalBlock(scope: !2495, file: !2, line: 1039, column: 7)
!2504 = !DILocation(line: 1039, column: 13, scope: !2503)
!2505 = !DILocation(line: 1039, column: 18, scope: !2503)
!2506 = !DILocation(line: 1040, column: 26, scope: !2507)
!2507 = distinct !DILexicalBlock(scope: !2503, file: !2, line: 1039, column: 42)
!2508 = !DILocation(line: 1040, column: 4, scope: !2507)
!2509 = !DILocation(line: 1042, column: 4, scope: !2507)
!2510 = !DILocation(line: 1042, column: 10, scope: !2507)
!2511 = !DILocation(line: 1042, column: 15, scope: !2507)
!2512 = !DILocation(line: 1043, column: 3, scope: !2507)
!2513 = !DILocation(line: 1045, column: 26, scope: !2514)
!2514 = distinct !DILexicalBlock(scope: !2503, file: !2, line: 1043, column: 10)
!2515 = !DILocation(line: 1045, column: 4, scope: !2514)
!2516 = !DILocation(line: 1039, column: 21, scope: !2503)
!2517 = !DILocation(line: 1049, column: 7, scope: !2518)
!2518 = distinct !DILexicalBlock(scope: !2377, file: !2, line: 1049, column: 6)
!2519 = !DILocation(line: 1049, column: 12, scope: !2518)
!2520 = !DILocation(line: 1049, column: 25, scope: !2518)
!2521 = !DILocation(line: 1049, column: 30, scope: !2518)
!2522 = !DILocation(line: 1049, column: 23, scope: !2518)
!2523 = !DILocation(line: 1049, column: 44, scope: !2518)
!2524 = !DILocation(line: 1049, column: 64, scope: !2518)
!2525 = !DILocation(line: 1049, column: 42, scope: !2518)
!2526 = !DILocation(line: 1049, column: 78, scope: !2518)
!2527 = !DILocation(line: 1049, column: 82, scope: !2518)
!2528 = !DILocation(line: 1049, column: 87, scope: !2518)
!2529 = !DILocation(line: 1049, column: 98, scope: !2518)
!2530 = !DILocation(line: 1050, column: 3, scope: !2531)
!2531 = distinct !DILexicalBlock(scope: !2518, file: !2, line: 1049, column: 103)
!2532 = !DILocation(line: 1053, column: 3, scope: !2531)
!2533 = !DILocation(line: 1055, column: 3, scope: !2531)
!2534 = !DILocation(line: 1056, column: 2, scope: !2531)
!2535 = !DILocation(line: 1058, column: 6, scope: !2536)
!2536 = distinct !DILexicalBlock(scope: !2377, file: !2, line: 1058, column: 6)
!2537 = !DILocation(line: 1058, column: 11, scope: !2536)
!2538 = !DILocation(line: 1058, column: 23, scope: !2536)
!2539 = !DILocation(line: 1059, column: 8, scope: !2540)
!2540 = distinct !DILexicalBlock(scope: !2541, file: !2, line: 1059, column: 7)
!2541 = distinct !DILexicalBlock(scope: !2536, file: !2, line: 1058, column: 28)
!2542 = !DILocation(line: 1059, column: 13, scope: !2540)
!2543 = !DILocation(line: 1059, column: 22, scope: !2540)
!2544 = !DILocation(line: 1059, column: 36, scope: !2540)
!2545 = !DILocation(line: 1059, column: 40, scope: !2540)
!2546 = !DILocation(line: 1059, column: 46, scope: !2540)
!2547 = !DILocation(line: 1059, column: 51, scope: !2540)
!2548 = !DILocation(line: 1060, column: 8, scope: !2549)
!2549 = distinct !DILexicalBlock(scope: !2550, file: !2, line: 1060, column: 8)
!2550 = distinct !DILexicalBlock(scope: !2540, file: !2, line: 1059, column: 76)
!2551 = !DILocation(line: 1060, column: 23, scope: !2549)
!2552 = !DILocation(line: 1060, column: 33, scope: !2549)
!2553 = !DILocation(line: 1060, column: 39, scope: !2549)
!2554 = !DILocation(line: 1060, column: 30, scope: !2549)
!2555 = !DILocation(line: 1061, column: 27, scope: !2556)
!2556 = distinct !DILexicalBlock(scope: !2549, file: !2, line: 1060, column: 47)
!2557 = !DILocation(line: 1061, column: 5, scope: !2556)
!2558 = !DILocation(line: 1063, column: 4, scope: !2556)
!2559 = !DILocation(line: 1064, column: 27, scope: !2560)
!2560 = distinct !DILexicalBlock(scope: !2549, file: !2, line: 1063, column: 11)
!2561 = !DILocation(line: 1064, column: 51, scope: !2560)
!2562 = !DILocation(line: 1064, column: 66, scope: !2560)
!2563 = !DILocation(line: 1064, column: 5, scope: !2560)
!2564 = !DILocation(line: 1067, column: 8, scope: !2565)
!2565 = distinct !DILexicalBlock(scope: !2550, file: !2, line: 1067, column: 8)
!2566 = !DILocation(line: 1067, column: 13, scope: !2565)
!2567 = !DILocation(line: 1067, column: 22, scope: !2565)
!2568 = !DILocation(line: 1068, column: 9, scope: !2569)
!2569 = distinct !DILexicalBlock(scope: !2570, file: !2, line: 1068, column: 9)
!2570 = distinct !DILexicalBlock(scope: !2565, file: !2, line: 1067, column: 36)
!2571 = !DILocation(line: 1068, column: 17, scope: !2569)
!2572 = !DILocation(line: 1069, column: 6, scope: !2569)
!2573 = !DILocation(line: 1069, column: 12, scope: !2569)
!2574 = !DILocation(line: 1069, column: 17, scope: !2569)
!2575 = !DILocation(line: 1071, column: 6, scope: !2569)
!2576 = !DILocation(line: 1071, column: 12, scope: !2569)
!2577 = !DILocation(line: 1071, column: 17, scope: !2569)
!2578 = !DILocation(line: 1072, column: 4, scope: !2570)
!2579 = !DILocation(line: 1073, column: 5, scope: !2580)
!2580 = distinct !DILexicalBlock(scope: !2565, file: !2, line: 1072, column: 11)
!2581 = !DILocation(line: 1073, column: 11, scope: !2580)
!2582 = !DILocation(line: 1073, column: 16, scope: !2580)
!2583 = !DILocation(line: 1075, column: 3, scope: !2550)
!2584 = !DILocation(line: 1075, column: 14, scope: !2585)
!2585 = distinct !DILexicalBlock(scope: !2540, file: !2, line: 1075, column: 14)
!2586 = !DILocation(line: 1075, column: 22, scope: !2585)
!2587 = !DILocation(line: 1075, column: 32, scope: !2585)
!2588 = !DILocation(line: 1076, column: 4, scope: !2589)
!2589 = distinct !DILexicalBlock(scope: !2585, file: !2, line: 1075, column: 38)
!2590 = !DILocation(line: 1076, column: 10, scope: !2589)
!2591 = !DILocation(line: 1076, column: 15, scope: !2589)
!2592 = !DILocation(line: 1077, column: 4, scope: !2589)
!2593 = !DILocation(line: 1077, column: 9, scope: !2589)
!2594 = !DILocation(line: 1077, column: 21, scope: !2589)
!2595 = !DILocation(line: 1078, column: 4, scope: !2589)
!2596 = !DILocation(line: 1080, column: 2, scope: !2541)
!2597 = !DILocation(line: 1085, column: 26, scope: !2377)
!2598 = !DILocation(line: 1085, column: 31, scope: !2377)
!2599 = !DILocation(line: 1085, column: 44, scope: !2377)
!2600 = !DILocation(line: 1085, column: 49, scope: !2377)
!2601 = !DILocation(line: 1085, column: 42, scope: !2377)
!2602 = !DILocation(line: 1085, column: 15, scope: !2377)
!2603 = !DILocation(line: 1085, column: 65, scope: !2377)
!2604 = !DILocation(line: 1085, column: 13, scope: !2377)
!2605 = !DILocation(line: 1086, column: 24, scope: !2377)
!2606 = !DILocation(line: 1086, column: 29, scope: !2377)
!2607 = !DILocation(line: 1086, column: 42, scope: !2377)
!2608 = !DILocation(line: 1086, column: 47, scope: !2377)
!2609 = !DILocation(line: 1086, column: 40, scope: !2377)
!2610 = !DILocation(line: 1086, column: 13, scope: !2377)
!2611 = !DILocation(line: 1086, column: 63, scope: !2377)
!2612 = !DILocation(line: 1086, column: 11, scope: !2377)
!2613 = !DILocation(line: 1087, column: 49, scope: !2377)
!2614 = !DILocation(line: 1087, column: 55, scope: !2377)
!2615 = !DILocation(line: 1087, column: 17, scope: !2377)
!2616 = !DILocation(line: 1087, column: 15, scope: !2377)
!2617 = !DILocation(line: 1089, column: 6, scope: !2618)
!2618 = distinct !DILexicalBlock(scope: !2377, file: !2, line: 1089, column: 6)
!2619 = !DILocation(line: 1090, column: 39, scope: !2618)
!2620 = !DILocation(line: 1090, column: 45, scope: !2618)
!2621 = !DILocation(line: 1090, column: 51, scope: !2618)
!2622 = !DILocation(line: 1090, column: 59, scope: !2618)
!2623 = !DILocation(line: 1090, column: 20, scope: !2618)
!2624 = !DILocation(line: 1090, column: 18, scope: !2618)
!2625 = !DILocation(line: 1090, column: 3, scope: !2618)
!2626 = !DILocation(line: 1092, column: 39, scope: !2618)
!2627 = !DILocation(line: 1092, column: 45, scope: !2618)
!2628 = !DILocation(line: 1092, column: 51, scope: !2618)
!2629 = !DILocation(line: 1092, column: 66, scope: !2618)
!2630 = !DILocation(line: 1092, column: 20, scope: !2618)
!2631 = !DILocation(line: 1092, column: 18, scope: !2618)
!2632 = !DILocation(line: 1095, column: 8, scope: !2633)
!2633 = distinct !DILexicalBlock(scope: !2377, file: !2, line: 1095, column: 6)
!2634 = !DILocation(line: 1095, column: 26, scope: !2633)
!2635 = !DILocation(line: 1095, column: 29, scope: !2633)
!2636 = !DILocation(line: 1095, column: 50, scope: !2633)
!2637 = !DILocation(line: 1095, column: 54, scope: !2633)
!2638 = !DILocation(line: 1095, column: 69, scope: !2633)
!2639 = !DILocation(line: 1095, column: 81, scope: !2633)
!2640 = !DILocation(line: 1095, column: 86, scope: !2633)
!2641 = !DILocation(line: 1095, column: 96, scope: !2633)
!2642 = !DILocation(line: 1095, column: 85, scope: !2633)
!2643 = !DILocation(line: 1096, column: 7, scope: !2644)
!2644 = distinct !DILexicalBlock(scope: !2645, file: !2, line: 1096, column: 7)
!2645 = distinct !DILexicalBlock(scope: !2633, file: !2, line: 1095, column: 109)
!2646 = !DILocation(line: 1096, column: 20, scope: !2644)
!2647 = !DILocation(line: 1097, column: 24, scope: !2648)
!2648 = distinct !DILexicalBlock(scope: !2644, file: !2, line: 1096, column: 30)
!2649 = !DILocation(line: 1097, column: 43, scope: !2648)
!2650 = !DILocation(line: 1097, column: 4, scope: !2648)
!2651 = !DILocation(line: 1098, column: 4, scope: !2648)
!2652 = !DILocalVariable(name: "robptr", scope: !2653, file: !2, line: 1100, type: !2399)
!2653 = distinct !DILexicalBlock(scope: !2644, file: !2, line: 1099, column: 10)
!2654 = !DILocation(line: 1100, column: 16, scope: !2653)
!2655 = !DILocation(line: 1100, column: 37, scope: !2653)
!2656 = !DILocation(line: 1100, column: 43, scope: !2653)
!2657 = !DILocation(line: 1100, column: 26, scope: !2653)
!2658 = !DILocalVariable(name: "cur_speed", scope: !2653, file: !2, line: 1101, type: !69)
!2659 = !DILocation(line: 1101, column: 8, scope: !2653)
!2660 = !DILocation(line: 1101, column: 20, scope: !2653)
!2661 = !DILocation(line: 1101, column: 28, scope: !2653)
!2662 = !DILocation(line: 1101, column: 38, scope: !2653)
!2663 = !DILocation(line: 1101, column: 55, scope: !2653)
!2664 = !DILocalVariable(name: "distance_travellable", scope: !2653, file: !2, line: 1102, type: !69)
!2665 = !DILocation(line: 1102, column: 8, scope: !2653)
!2666 = !DILocation(line: 1102, column: 38, scope: !2653)
!2667 = !DILocation(line: 1102, column: 49, scope: !2653)
!2668 = !DILocation(line: 1102, column: 31, scope: !2653)
!2669 = !DILocation(line: 1108, column: 20, scope: !2670)
!2670 = distinct !DILexicalBlock(scope: !2653, file: !2, line: 1108, column: 8)
!2671 = !DILocation(line: 1108, column: 26, scope: !2670)
!2672 = !DILocation(line: 1108, column: 9, scope: !2670)
!2673 = !DILocation(line: 1108, column: 30, scope: !2670)
!2674 = !DILocation(line: 1108, column: 40, scope: !2670)
!2675 = !DILocation(line: 1108, column: 55, scope: !2670)
!2676 = !DILocation(line: 1108, column: 61, scope: !2670)
!2677 = !DILocation(line: 1108, column: 44, scope: !2670)
!2678 = !DILocation(line: 1108, column: 65, scope: !2670)
!2679 = !DILocation(line: 1109, column: 9, scope: !2680)
!2680 = distinct !DILexicalBlock(scope: !2681, file: !2, line: 1109, column: 9)
!2681 = distinct !DILexicalBlock(scope: !2670, file: !2, line: 1108, column: 72)
!2682 = !DILocation(line: 1109, column: 33, scope: !2680)
!2683 = !DILocation(line: 1109, column: 30, scope: !2680)
!2684 = !DILocation(line: 1110, column: 26, scope: !2685)
!2685 = distinct !DILexicalBlock(scope: !2680, file: !2, line: 1109, column: 47)
!2686 = !DILocation(line: 1110, column: 45, scope: !2685)
!2687 = !DILocation(line: 1110, column: 6, scope: !2685)
!2688 = !DILocation(line: 1111, column: 5, scope: !2685)
!2689 = !DILocalVariable(name: "prob", scope: !2690, file: !2, line: 1112, type: !69)
!2690 = distinct !DILexicalBlock(scope: !2680, file: !2, line: 1111, column: 12)
!2691 = !DILocation(line: 1112, column: 10, scope: !2690)
!2692 = !DILocation(line: 1112, column: 24, scope: !2690)
!2693 = !DILocation(line: 1112, column: 46, scope: !2690)
!2694 = !DILocation(line: 1112, column: 17, scope: !2690)
!2695 = !DILocalVariable(name: "rand_num", scope: !2690, file: !2, line: 1114, type: !63)
!2696 = !DILocation(line: 1114, column: 10, scope: !2690)
!2697 = !DILocation(line: 1114, column: 21, scope: !2690)
!2698 = !DILocation(line: 1115, column: 12, scope: !2699)
!2699 = distinct !DILexicalBlock(scope: !2690, file: !2, line: 1115, column: 11)
!2700 = !DILocation(line: 1115, column: 21, scope: !2699)
!2701 = !DILocation(line: 1115, column: 29, scope: !2699)
!2702 = !DILocation(line: 1115, column: 27, scope: !2699)
!2703 = !DILocation(line: 1116, column: 27, scope: !2704)
!2704 = distinct !DILexicalBlock(scope: !2699, file: !2, line: 1115, column: 35)
!2705 = !DILocation(line: 1116, column: 46, scope: !2704)
!2706 = !DILocation(line: 1116, column: 7, scope: !2704)
!2707 = !DILocation(line: 1117, column: 6, scope: !2704)
!2708 = !DILocation(line: 1119, column: 5, scope: !2681)
!2709 = !DILocation(line: 1123, column: 2, scope: !2645)
!2710 = !DILocation(line: 1126, column: 6, scope: !2711)
!2711 = distinct !DILexicalBlock(scope: !2377, file: !2, line: 1126, column: 6)
!2712 = !DILocation(line: 1126, column: 12, scope: !2711)
!2713 = !DILocation(line: 1126, column: 17, scope: !2711)
!2714 = !DILocation(line: 1127, column: 8, scope: !2715)
!2715 = distinct !DILexicalBlock(scope: !2716, file: !2, line: 1127, column: 7)
!2716 = distinct !DILexicalBlock(scope: !2711, file: !2, line: 1126, column: 41)
!2717 = !DILocation(line: 1127, column: 26, scope: !2715)
!2718 = !DILocation(line: 1127, column: 32, scope: !2715)
!2719 = !DILocation(line: 1127, column: 36, scope: !2715)
!2720 = !DILocation(line: 1127, column: 42, scope: !2715)
!2721 = !DILocation(line: 1127, column: 64, scope: !2715)
!2722 = !DILocalVariable(name: "vel_scale", scope: !2723, file: !2, line: 1128, type: !69)
!2723 = distinct !DILexicalBlock(scope: !2715, file: !2, line: 1127, column: 71)
!2724 = !DILocation(line: 1128, column: 8, scope: !2723)
!2725 = !DILocation(line: 1130, column: 23, scope: !2723)
!2726 = !DILocation(line: 1130, column: 32, scope: !2723)
!2727 = !DILocation(line: 1130, column: 21, scope: !2723)
!2728 = !DILocation(line: 1130, column: 14, scope: !2723)
!2729 = !DILocation(line: 1131, column: 8, scope: !2730)
!2730 = distinct !DILexicalBlock(scope: !2723, file: !2, line: 1131, column: 8)
!2731 = !DILocation(line: 1131, column: 18, scope: !2730)
!2732 = !DILocation(line: 1132, column: 15, scope: !2730)
!2733 = !DILocation(line: 1132, column: 5, scope: !2730)
!2734 = !DILocation(line: 1134, column: 18, scope: !2723)
!2735 = !DILocation(line: 1134, column: 24, scope: !2723)
!2736 = !DILocation(line: 1134, column: 40, scope: !2723)
!2737 = !DILocation(line: 1134, column: 50, scope: !2723)
!2738 = !DILocation(line: 1134, column: 4, scope: !2723)
!2739 = !DILocation(line: 1136, column: 4, scope: !2723)
!2740 = !DILocation(line: 1137, column: 16, scope: !2741)
!2741 = distinct !DILexicalBlock(scope: !2715, file: !2, line: 1137, column: 14)
!2742 = !DILocation(line: 1137, column: 31, scope: !2741)
!2743 = !DILocation(line: 1137, column: 35, scope: !2741)
!2744 = !DILocation(line: 1137, column: 45, scope: !2741)
!2745 = !DILocation(line: 1137, column: 27, scope: !2741)
!2746 = !DILocation(line: 1137, column: 15, scope: !2741)
!2747 = !DILocation(line: 1137, column: 14, scope: !2741)
!2748 = !DILocalVariable(name: "curpsp", scope: !2749, file: !2, line: 1139, type: !301)
!2749 = distinct !DILexicalBlock(scope: !2741, file: !2, line: 1137, column: 55)
!2750 = !DILocation(line: 1139, column: 15, scope: !2749)
!2751 = !DILocation(line: 1139, column: 36, scope: !2749)
!2752 = !DILocation(line: 1139, column: 41, scope: !2749)
!2753 = !DILocation(line: 1139, column: 25, scope: !2749)
!2754 = !DILocalVariable(name: "player_segnum", scope: !2749, file: !2, line: 1140, type: !63)
!2755 = !DILocation(line: 1140, column: 10, scope: !2749)
!2756 = !DILocation(line: 1140, column: 26, scope: !2749)
!2757 = !DILocation(line: 1140, column: 41, scope: !2749)
!2758 = !DILocalVariable(name: "i", scope: !2749, file: !2, line: 1141, type: !63)
!2759 = !DILocation(line: 1141, column: 10, scope: !2749)
!2760 = !DILocation(line: 1144, column: 11, scope: !2761)
!2761 = distinct !DILexicalBlock(scope: !2749, file: !2, line: 1144, column: 4)
!2762 = !DILocation(line: 1144, column: 16, scope: !2761)
!2763 = !DILocation(line: 1144, column: 10, scope: !2761)
!2764 = !DILocation(line: 1144, column: 9, scope: !2761)
!2765 = !DILocation(line: 1144, column: 32, scope: !2766)
!2766 = distinct !DILexicalBlock(scope: !2761, file: !2, line: 1144, column: 4)
!2767 = !DILocation(line: 1144, column: 34, scope: !2766)
!2768 = !DILocation(line: 1144, column: 39, scope: !2766)
!2769 = !DILocation(line: 1144, column: 33, scope: !2766)
!2770 = !DILocation(line: 1144, column: 4, scope: !2761)
!2771 = !DILocation(line: 1145, column: 9, scope: !2772)
!2772 = distinct !DILexicalBlock(scope: !2773, file: !2, line: 1145, column: 9)
!2773 = distinct !DILexicalBlock(scope: !2766, file: !2, line: 1144, column: 57)
!2774 = !DILocation(line: 1145, column: 16, scope: !2772)
!2775 = !DILocation(line: 1145, column: 19, scope: !2772)
!2776 = !DILocation(line: 1145, column: 29, scope: !2772)
!2777 = !DILocation(line: 1145, column: 26, scope: !2772)
!2778 = !DILocation(line: 1146, column: 10, scope: !2779)
!2779 = distinct !DILexicalBlock(scope: !2780, file: !2, line: 1146, column: 10)
!2780 = distinct !DILexicalBlock(scope: !2772, file: !2, line: 1145, column: 44)
!2781 = !DILocation(line: 1146, column: 27, scope: !2779)
!2782 = !DILocation(line: 1146, column: 33, scope: !2779)
!2783 = !DILocation(line: 1146, column: 24, scope: !2779)
!2784 = !DILocation(line: 1147, column: 29, scope: !2785)
!2785 = distinct !DILexicalBlock(scope: !2779, file: !2, line: 1146, column: 41)
!2786 = !DILocation(line: 1147, column: 53, scope: !2785)
!2787 = !DILocation(line: 1147, column: 7, scope: !2785)
!2788 = !DILocation(line: 1148, column: 6, scope: !2785)
!2789 = !DILocation(line: 1149, column: 29, scope: !2790)
!2790 = distinct !DILexicalBlock(scope: !2779, file: !2, line: 1148, column: 13)
!2791 = !DILocation(line: 1149, column: 7, scope: !2790)
!2792 = !DILocation(line: 1151, column: 6, scope: !2780)
!2793 = !DILocation(line: 1152, column: 6, scope: !2780)
!2794 = !DILocation(line: 1152, column: 12, scope: !2780)
!2795 = !DILocation(line: 1152, column: 17, scope: !2780)
!2796 = !DILocation(line: 1153, column: 6, scope: !2780)
!2797 = !DILocation(line: 1155, column: 4, scope: !2773)
!2798 = !DILocation(line: 1144, column: 53, scope: !2766)
!2799 = !DILocation(line: 1144, column: 4, scope: !2766)
!2800 = distinct !{!2800, !2770, !2801, !262}
!2801 = !DILocation(line: 1155, column: 4, scope: !2761)
!2802 = !DILocation(line: 1156, column: 8, scope: !2803)
!2803 = distinct !DILexicalBlock(scope: !2749, file: !2, line: 1156, column: 8)
!2804 = !DILocation(line: 1157, column: 5, scope: !2805)
!2805 = distinct !DILexicalBlock(scope: !2803, file: !2, line: 1156, column: 27)
!2806 = !DILocation(line: 1157, column: 11, scope: !2805)
!2807 = !DILocation(line: 1157, column: 33, scope: !2805)
!2808 = !DILocation(line: 1158, column: 5, scope: !2805)
!2809 = !DILocation(line: 1158, column: 11, scope: !2805)
!2810 = !DILocation(line: 1158, column: 33, scope: !2805)
!2811 = !DILocation(line: 1159, column: 4, scope: !2805)
!2812 = !DILocation(line: 1160, column: 3, scope: !2749)
!2813 = !DILocation(line: 1161, column: 2, scope: !2716)
!2814 = !DILocation(line: 1165, column: 6, scope: !2815)
!2815 = distinct !DILexicalBlock(scope: !2377, file: !2, line: 1165, column: 6)
!2816 = !DILocation(line: 1165, column: 11, scope: !2815)
!2817 = !DILocation(line: 1165, column: 26, scope: !2815)
!2818 = !DILocation(line: 1166, column: 3, scope: !2819)
!2819 = distinct !DILexicalBlock(scope: !2815, file: !2, line: 1165, column: 31)
!2820 = !DILocation(line: 1166, column: 8, scope: !2819)
!2821 = !DILocation(line: 1166, column: 23, scope: !2819)
!2822 = !DILocation(line: 1167, column: 2, scope: !2819)
!2823 = !DILocation(line: 1167, column: 13, scope: !2824)
!2824 = distinct !DILexicalBlock(scope: !2815, file: !2, line: 1167, column: 13)
!2825 = !DILocation(line: 1167, column: 18, scope: !2824)
!2826 = !DILocation(line: 1167, column: 36, scope: !2824)
!2827 = !DILocation(line: 1167, column: 41, scope: !2824)
!2828 = !DILocation(line: 1167, column: 33, scope: !2824)
!2829 = !DILocation(line: 1168, column: 7, scope: !2830)
!2830 = distinct !DILexicalBlock(scope: !2831, file: !2, line: 1168, column: 7)
!2831 = distinct !DILexicalBlock(scope: !2824, file: !2, line: 1167, column: 54)
!2832 = !DILocation(line: 1168, column: 13, scope: !2830)
!2833 = !DILocation(line: 1168, column: 18, scope: !2830)
!2834 = !DILocation(line: 1169, column: 26, scope: !2835)
!2835 = distinct !DILexicalBlock(scope: !2830, file: !2, line: 1168, column: 42)
!2836 = !DILocation(line: 1169, column: 50, scope: !2835)
!2837 = !DILocation(line: 1169, column: 65, scope: !2835)
!2838 = !DILocation(line: 1169, column: 4, scope: !2835)
!2839 = !DILocation(line: 1170, column: 4, scope: !2835)
!2840 = !DILocation(line: 1170, column: 10, scope: !2835)
!2841 = !DILocation(line: 1170, column: 15, scope: !2835)
!2842 = !DILocation(line: 1171, column: 4, scope: !2835)
!2843 = !DILocation(line: 1172, column: 3, scope: !2835)
!2844 = !DILocation(line: 1173, column: 26, scope: !2845)
!2845 = distinct !DILexicalBlock(scope: !2830, file: !2, line: 1172, column: 10)
!2846 = !DILocation(line: 1173, column: 31, scope: !2845)
!2847 = !DILocation(line: 1173, column: 42, scope: !2845)
!2848 = !DILocation(line: 1173, column: 4, scope: !2845)
!2849 = !DILocation(line: 1173, column: 9, scope: !2845)
!2850 = !DILocation(line: 1173, column: 24, scope: !2845)
!2851 = !DILocation(line: 1175, column: 2, scope: !2831)
!2852 = !DILocation(line: 1177, column: 26, scope: !2377)
!2853 = !DILocation(line: 1177, column: 31, scope: !2377)
!2854 = !DILocation(line: 1177, column: 44, scope: !2377)
!2855 = !DILocation(line: 1177, column: 49, scope: !2377)
!2856 = !DILocation(line: 1177, column: 42, scope: !2377)
!2857 = !DILocation(line: 1177, column: 15, scope: !2377)
!2858 = !DILocation(line: 1177, column: 65, scope: !2377)
!2859 = !DILocation(line: 1177, column: 13, scope: !2377)
!2860 = !DILocation(line: 1180, column: 15, scope: !2377)
!2861 = !DILocation(line: 1181, column: 17, scope: !2377)
!2862 = !DILocation(line: 1181, column: 22, scope: !2377)
!2863 = !DILocation(line: 1181, column: 15, scope: !2377)
!2864 = !DILocation(line: 1182, column: 19, scope: !2377)
!2865 = !DILocation(line: 1182, column: 24, scope: !2377)
!2866 = !DILocation(line: 1182, column: 17, scope: !2377)
!2867 = !DILocation(line: 1183, column: 48, scope: !2377)
!2868 = !DILocation(line: 1183, column: 54, scope: !2377)
!2869 = !DILocation(line: 1183, column: 70, scope: !2377)
!2870 = !DILocation(line: 1183, column: 30, scope: !2377)
!2871 = !DILocation(line: 1183, column: 81, scope: !2377)
!2872 = !DILocation(line: 1183, column: 23, scope: !2377)
!2873 = !DILocation(line: 1183, column: 91, scope: !2377)
!2874 = !DILocation(line: 1183, column: 94, scope: !2377)
!2875 = !DILocation(line: 1183, column: 21, scope: !2377)
!2876 = !DILocation(line: 1185, column: 30, scope: !2377)
!2877 = !DILocation(line: 1185, column: 35, scope: !2377)
!2878 = !DILocation(line: 1185, column: 48, scope: !2377)
!2879 = !DILocation(line: 1185, column: 53, scope: !2377)
!2880 = !DILocation(line: 1185, column: 46, scope: !2377)
!2881 = !DILocation(line: 1185, column: 19, scope: !2377)
!2882 = !DILocation(line: 1185, column: 69, scope: !2377)
!2883 = !DILocation(line: 1185, column: 17, scope: !2377)
!2884 = !DILocation(line: 1189, column: 2, scope: !2377)
!2885 = !DILocation(line: 1189, column: 10, scope: !2377)
!2886 = !DILocation(line: 1189, column: 25, scope: !2377)
!2887 = !DILocation(line: 1189, column: 23, scope: !2377)
!2888 = !DILocation(line: 1189, column: 45, scope: !2377)
!2889 = !DILocation(line: 1189, column: 49, scope: !2377)
!2890 = !DILocation(line: 1189, column: 48, scope: !2377)
!2891 = !DILocation(line: 0, scope: !2377)
!2892 = !DILocation(line: 1192, column: 26, scope: !2893)
!2893 = distinct !DILexicalBlock(scope: !2377, file: !2, line: 1189, column: 63)
!2894 = !DILocation(line: 1192, column: 31, scope: !2893)
!2895 = !DILocation(line: 1192, column: 3, scope: !2893)
!2896 = !DILocation(line: 1192, column: 8, scope: !2893)
!2897 = !DILocation(line: 1192, column: 23, scope: !2893)
!2898 = !DILocation(line: 1195, column: 8, scope: !2899)
!2899 = distinct !DILexicalBlock(scope: !2893, file: !2, line: 1195, column: 7)
!2900 = !DILocation(line: 1195, column: 13, scope: !2899)
!2901 = !DILocation(line: 1195, column: 31, scope: !2899)
!2902 = !DILocation(line: 1195, column: 36, scope: !2899)
!2903 = !DILocation(line: 1195, column: 28, scope: !2899)
!2904 = !DILocation(line: 1195, column: 49, scope: !2899)
!2905 = !DILocation(line: 1195, column: 53, scope: !2899)
!2906 = !DILocation(line: 1195, column: 58, scope: !2899)
!2907 = !DILocation(line: 1195, column: 73, scope: !2899)
!2908 = !DILocation(line: 1206, column: 8, scope: !2909)
!2909 = distinct !DILexicalBlock(scope: !2910, file: !2, line: 1206, column: 8)
!2910 = distinct !DILexicalBlock(scope: !2899, file: !2, line: 1195, column: 79)
!2911 = !DILocation(line: 1206, column: 16, scope: !2909)
!2912 = !DILocation(line: 1207, column: 9, scope: !2913)
!2913 = distinct !DILexicalBlock(scope: !2914, file: !2, line: 1207, column: 9)
!2914 = distinct !DILexicalBlock(scope: !2909, file: !2, line: 1206, column: 27)
!2915 = !DILocation(line: 1207, column: 29, scope: !2913)
!2916 = !DILocation(line: 1208, column: 10, scope: !2917)
!2917 = distinct !DILexicalBlock(scope: !2913, file: !2, line: 1208, column: 10)
!2918 = !DILocation(line: 1209, column: 29, scope: !2919)
!2919 = distinct !DILexicalBlock(scope: !2917, file: !2, line: 1208, column: 29)
!2920 = !DILocation(line: 1209, column: 40, scope: !2919)
!2921 = !DILocation(line: 1209, column: 49, scope: !2919)
!2922 = !DILocation(line: 1209, column: 38, scope: !2919)
!2923 = !DILocation(line: 1209, column: 7, scope: !2919)
!2924 = !DILocation(line: 1210, column: 38, scope: !2919)
!2925 = !DILocation(line: 1210, column: 56, scope: !2919)
!2926 = !DILocation(line: 1210, column: 61, scope: !2919)
!2927 = !DILocation(line: 1210, column: 45, scope: !2919)
!2928 = !DILocation(line: 1210, column: 74, scope: !2919)
!2929 = !DILocation(line: 1210, column: 79, scope: !2919)
!2930 = !DILocation(line: 1210, column: 26, scope: !2919)
!2931 = !DILocation(line: 1210, column: 7, scope: !2919)
!2932 = !DILocation(line: 1210, column: 12, scope: !2919)
!2933 = !DILocation(line: 1210, column: 24, scope: !2919)
!2934 = !DILocation(line: 1211, column: 7, scope: !2919)
!2935 = !DILocation(line: 1213, column: 7, scope: !2919)
!2936 = !DILocation(line: 1213, column: 13, scope: !2919)
!2937 = !DILocation(line: 1213, column: 18, scope: !2919)
!2938 = !DILocation(line: 1215, column: 7, scope: !2919)
!2939 = !DILocation(line: 1217, column: 7, scope: !2940)
!2940 = distinct !DILexicalBlock(scope: !2917, file: !2, line: 1216, column: 13)
!2941 = !DILocation(line: 1217, column: 13, scope: !2940)
!2942 = !DILocation(line: 1217, column: 18, scope: !2940)
!2943 = !DILocation(line: 1218, column: 7, scope: !2940)
!2944 = !DILocation(line: 1219, column: 7, scope: !2940)
!2945 = !DILocation(line: 1222, column: 7, scope: !2940)
!2946 = !DILocation(line: 1224, column: 4, scope: !2914)
!2947 = !DILocation(line: 1226, column: 8, scope: !2948)
!2948 = distinct !DILexicalBlock(scope: !2910, file: !2, line: 1226, column: 8)
!2949 = !DILocation(line: 1226, column: 13, scope: !2948)
!2950 = !DILocation(line: 1226, column: 22, scope: !2948)
!2951 = !DILocation(line: 1228, column: 27, scope: !2952)
!2952 = distinct !DILexicalBlock(scope: !2948, file: !2, line: 1226, column: 37)
!2953 = !DILocation(line: 1228, column: 37, scope: !2952)
!2954 = !DILocation(line: 1228, column: 52, scope: !2952)
!2955 = !DILocation(line: 1228, column: 5, scope: !2952)
!2956 = !DILocation(line: 1230, column: 4, scope: !2952)
!2957 = !DILocation(line: 1230, column: 15, scope: !2958)
!2958 = distinct !DILexicalBlock(scope: !2948, file: !2, line: 1230, column: 15)
!2959 = !DILocation(line: 1230, column: 20, scope: !2958)
!2960 = !DILocation(line: 1230, column: 29, scope: !2958)
!2961 = !DILocation(line: 1232, column: 28, scope: !2962)
!2962 = distinct !DILexicalBlock(scope: !2958, file: !2, line: 1230, column: 45)
!2963 = !DILocation(line: 1232, column: 5, scope: !2962)
!2964 = !DILocation(line: 1233, column: 10, scope: !2965)
!2965 = distinct !DILexicalBlock(scope: !2962, file: !2, line: 1233, column: 9)
!2966 = !DILocation(line: 1233, column: 15, scope: !2965)
!2967 = !DILocation(line: 1233, column: 42, scope: !2965)
!2968 = !DILocation(line: 1233, column: 47, scope: !2965)
!2969 = !DILocation(line: 1233, column: 58, scope: !2965)
!2970 = !DILocation(line: 1233, column: 63, scope: !2965)
!2971 = !DILocation(line: 1233, column: 57, scope: !2965)
!2972 = !DILocation(line: 1233, column: 74, scope: !2965)
!2973 = !DILocation(line: 1233, column: 31, scope: !2965)
!2974 = !DILocation(line: 1233, column: 78, scope: !2965)
!2975 = !DILocation(line: 1233, column: 28, scope: !2965)
!2976 = !DILocation(line: 1233, column: 86, scope: !2965)
!2977 = !DILocation(line: 1233, column: 90, scope: !2965)
!2978 = !DILocation(line: 1233, column: 95, scope: !2965)
!2979 = !DILocation(line: 1233, column: 107, scope: !2965)
!2980 = !DILocation(line: 1234, column: 6, scope: !2981)
!2981 = distinct !DILexicalBlock(scope: !2965, file: !2, line: 1233, column: 114)
!2982 = !DILocation(line: 1234, column: 12, scope: !2981)
!2983 = !DILocation(line: 1234, column: 17, scope: !2981)
!2984 = !DILocation(line: 1235, column: 5, scope: !2981)
!2985 = !DILocation(line: 1238, column: 5, scope: !2962)
!2986 = !DILocation(line: 1239, column: 15, scope: !2987)
!2987 = distinct !DILexicalBlock(scope: !2958, file: !2, line: 1239, column: 15)
!2988 = !DILocation(line: 1239, column: 21, scope: !2987)
!2989 = !DILocation(line: 1239, column: 26, scope: !2987)
!2990 = !DILocation(line: 1240, column: 27, scope: !2991)
!2991 = distinct !DILexicalBlock(scope: !2987, file: !2, line: 1239, column: 46)
!2992 = !DILocation(line: 1240, column: 5, scope: !2991)
!2993 = !DILocation(line: 1241, column: 9, scope: !2994)
!2994 = distinct !DILexicalBlock(scope: !2991, file: !2, line: 1241, column: 9)
!2995 = !DILocation(line: 1241, column: 14, scope: !2994)
!2996 = !DILocation(line: 1241, column: 41, scope: !2994)
!2997 = !DILocation(line: 1241, column: 46, scope: !2994)
!2998 = !DILocation(line: 1241, column: 57, scope: !2994)
!2999 = !DILocation(line: 1241, column: 62, scope: !2994)
!3000 = !DILocation(line: 1241, column: 56, scope: !2994)
!3001 = !DILocation(line: 1241, column: 73, scope: !2994)
!3002 = !DILocation(line: 1241, column: 30, scope: !2994)
!3003 = !DILocation(line: 1241, column: 77, scope: !2994)
!3004 = !DILocation(line: 1241, column: 27, scope: !2994)
!3005 = !DILocation(line: 1242, column: 6, scope: !3006)
!3006 = distinct !DILexicalBlock(scope: !2994, file: !2, line: 1241, column: 85)
!3007 = !DILocation(line: 1242, column: 12, scope: !3006)
!3008 = !DILocation(line: 1242, column: 17, scope: !3006)
!3009 = !DILocation(line: 1243, column: 6, scope: !3006)
!3010 = !DILocation(line: 1247, column: 4, scope: !2991)
!3011 = !DILocation(line: 1247, column: 15, scope: !3012)
!3012 = distinct !DILexicalBlock(scope: !2987, file: !2, line: 1247, column: 15)
!3013 = !DILocation(line: 1247, column: 21, scope: !3012)
!3014 = !DILocation(line: 1247, column: 26, scope: !3012)
!3015 = !DILocation(line: 1248, column: 27, scope: !3016)
!3016 = distinct !DILexicalBlock(scope: !3012, file: !2, line: 1247, column: 50)
!3017 = !DILocation(line: 1248, column: 51, scope: !3016)
!3018 = !DILocation(line: 1248, column: 66, scope: !3016)
!3019 = !DILocation(line: 1248, column: 5, scope: !3016)
!3020 = !DILocation(line: 1249, column: 5, scope: !3016)
!3021 = !DILocation(line: 1249, column: 11, scope: !3016)
!3022 = !DILocation(line: 1249, column: 16, scope: !3016)
!3023 = !DILocation(line: 1250, column: 9, scope: !3024)
!3024 = distinct !DILexicalBlock(scope: !3016, file: !2, line: 1250, column: 9)
!3025 = !DILocation(line: 1250, column: 14, scope: !3024)
!3026 = !DILocation(line: 1250, column: 26, scope: !3024)
!3027 = !DILocation(line: 1251, column: 28, scope: !3028)
!3028 = distinct !DILexicalBlock(scope: !3024, file: !2, line: 1250, column: 31)
!3029 = !DILocation(line: 1251, column: 52, scope: !3028)
!3030 = !DILocation(line: 1251, column: 67, scope: !3028)
!3031 = !DILocation(line: 1251, column: 6, scope: !3028)
!3032 = !DILocation(line: 1252, column: 6, scope: !3028)
!3033 = !DILocation(line: 1252, column: 12, scope: !3028)
!3034 = !DILocation(line: 1252, column: 17, scope: !3028)
!3035 = !DILocation(line: 1253, column: 10, scope: !3036)
!3036 = distinct !DILexicalBlock(scope: !3028, file: !2, line: 1253, column: 10)
!3037 = !DILocation(line: 1253, column: 15, scope: !3036)
!3038 = !DILocation(line: 1253, column: 27, scope: !3036)
!3039 = !DILocation(line: 1254, column: 7, scope: !3040)
!3040 = distinct !DILexicalBlock(scope: !3036, file: !2, line: 1253, column: 32)
!3041 = !DILocation(line: 1254, column: 12, scope: !3040)
!3042 = !DILocation(line: 1254, column: 21, scope: !3040)
!3043 = !DILocation(line: 1255, column: 7, scope: !3040)
!3044 = !DILocation(line: 1255, column: 13, scope: !3040)
!3045 = !DILocation(line: 1255, column: 18, scope: !3040)
!3046 = !DILocation(line: 1256, column: 7, scope: !3040)
!3047 = !DILocation(line: 1258, column: 5, scope: !3028)
!3048 = !DILocation(line: 1260, column: 4, scope: !3016)
!3049 = !DILocalVariable(name: "opposite_end_index", scope: !3050, file: !2, line: 1263, type: !63)
!3050 = distinct !DILexicalBlock(scope: !3012, file: !2, line: 1260, column: 11)
!3051 = !DILocation(line: 1263, column: 11, scope: !3050)
!3052 = !DILocalVariable(name: "opposite_end_point", scope: !3050, file: !2, line: 1264, type: !863)
!3053 = !DILocation(line: 1264, column: 17, scope: !3050)
!3054 = !DILocalVariable(name: "hit_data", scope: !3050, file: !2, line: 1265, type: !872)
!3055 = !DILocation(line: 1265, column: 15, scope: !3050)
!3056 = !DILocalVariable(name: "fate", scope: !3050, file: !2, line: 1266, type: !63)
!3057 = !DILocation(line: 1266, column: 11, scope: !3050)
!3058 = !DILocalVariable(name: "fq", scope: !3050, file: !2, line: 1267, type: !858)
!3059 = !DILocation(line: 1267, column: 15, scope: !3050)
!3060 = !DILocation(line: 1270, column: 13, scope: !3061)
!3061 = distinct !DILexicalBlock(scope: !3050, file: !2, line: 1270, column: 9)
!3062 = !DILocation(line: 1270, column: 18, scope: !3061)
!3063 = !DILocation(line: 1270, column: 35, scope: !3061)
!3064 = !DILocation(line: 1270, column: 40, scope: !3061)
!3065 = !DILocation(line: 1270, column: 33, scope: !3061)
!3066 = !DILocation(line: 1270, column: 9, scope: !3061)
!3067 = !DILocation(line: 1270, column: 55, scope: !3061)
!3068 = !DILocation(line: 1270, column: 60, scope: !3061)
!3069 = !DILocation(line: 1270, column: 53, scope: !3061)
!3070 = !DILocation(line: 1272, column: 25, scope: !3071)
!3071 = distinct !DILexicalBlock(scope: !3061, file: !2, line: 1270, column: 76)
!3072 = !DILocation(line: 1273, column: 5, scope: !3071)
!3073 = !DILocation(line: 1275, column: 27, scope: !3074)
!3074 = distinct !DILexicalBlock(scope: !3061, file: !2, line: 1273, column: 12)
!3075 = !DILocation(line: 1275, column: 32, scope: !3074)
!3076 = !DILocation(line: 1275, column: 43, scope: !3074)
!3077 = !DILocation(line: 1275, column: 25, scope: !3074)
!3078 = !DILocation(line: 1280, column: 38, scope: !3050)
!3079 = !DILocation(line: 1280, column: 43, scope: !3050)
!3080 = !DILocation(line: 1280, column: 56, scope: !3050)
!3081 = !DILocation(line: 1280, column: 54, scope: !3050)
!3082 = !DILocation(line: 1280, column: 27, scope: !3050)
!3083 = !DILocation(line: 1280, column: 76, scope: !3050)
!3084 = !DILocation(line: 1280, column: 24, scope: !3050)
!3085 = !DILocation(line: 1282, column: 19, scope: !3050)
!3086 = !DILocation(line: 1282, column: 25, scope: !3050)
!3087 = !DILocation(line: 1282, column: 8, scope: !3050)
!3088 = !DILocation(line: 1282, column: 16, scope: !3050)
!3089 = !DILocation(line: 1283, column: 22, scope: !3050)
!3090 = !DILocation(line: 1283, column: 28, scope: !3050)
!3091 = !DILocation(line: 1283, column: 8, scope: !3050)
!3092 = !DILocation(line: 1283, column: 20, scope: !3050)
!3093 = !DILocation(line: 1284, column: 18, scope: !3050)
!3094 = !DILocation(line: 1284, column: 8, scope: !3050)
!3095 = !DILocation(line: 1284, column: 16, scope: !3050)
!3096 = !DILocation(line: 1285, column: 18, scope: !3050)
!3097 = !DILocation(line: 1285, column: 24, scope: !3050)
!3098 = !DILocation(line: 1285, column: 8, scope: !3050)
!3099 = !DILocation(line: 1285, column: 16, scope: !3050)
!3100 = !DILocation(line: 1286, column: 23, scope: !3050)
!3101 = !DILocation(line: 1286, column: 27, scope: !3050)
!3102 = !DILocation(line: 1286, column: 8, scope: !3050)
!3103 = !DILocation(line: 1286, column: 21, scope: !3050)
!3104 = !DILocation(line: 1287, column: 8, scope: !3050)
!3105 = !DILocation(line: 1287, column: 24, scope: !3050)
!3106 = !DILocation(line: 1288, column: 8, scope: !3050)
!3107 = !DILocation(line: 1288, column: 18, scope: !3050)
!3108 = !DILocation(line: 1290, column: 12, scope: !3050)
!3109 = !DILocation(line: 1290, column: 10, scope: !3050)
!3110 = !DILocation(line: 1292, column: 9, scope: !3111)
!3111 = distinct !DILexicalBlock(scope: !3050, file: !2, line: 1292, column: 9)
!3112 = !DILocation(line: 1292, column: 14, scope: !3111)
!3113 = !DILocation(line: 1295, column: 28, scope: !3114)
!3114 = distinct !DILexicalBlock(scope: !3111, file: !2, line: 1292, column: 27)
!3115 = !DILocation(line: 1295, column: 6, scope: !3114)
!3116 = !DILocation(line: 1295, column: 11, scope: !3114)
!3117 = !DILocation(line: 1295, column: 26, scope: !3114)
!3118 = !DILocation(line: 1296, column: 5, scope: !3114)
!3119 = !DILocation(line: 1297, column: 23, scope: !3120)
!3120 = distinct !DILexicalBlock(scope: !3111, file: !2, line: 1296, column: 12)
!3121 = !DILocation(line: 1297, column: 28, scope: !3120)
!3122 = !DILocation(line: 1297, column: 22, scope: !3120)
!3123 = !DILocation(line: 1297, column: 6, scope: !3120)
!3124 = !DILocation(line: 1297, column: 11, scope: !3120)
!3125 = !DILocation(line: 1297, column: 20, scope: !3120)
!3126 = !DILocation(line: 1298, column: 29, scope: !3120)
!3127 = !DILocation(line: 1298, column: 34, scope: !3120)
!3128 = !DILocation(line: 1298, column: 6, scope: !3120)
!3129 = !DILocation(line: 1298, column: 11, scope: !3120)
!3130 = !DILocation(line: 1298, column: 26, scope: !3120)
!3131 = !DILocation(line: 1302, column: 4, scope: !2910)
!3132 = !DILocation(line: 1304, column: 32, scope: !3133)
!3133 = distinct !DILexicalBlock(scope: !2899, file: !2, line: 1303, column: 10)
!3134 = !DILocation(line: 1304, column: 37, scope: !3133)
!3135 = !DILocation(line: 1304, column: 50, scope: !3133)
!3136 = !DILocation(line: 1304, column: 55, scope: !3133)
!3137 = !DILocation(line: 1304, column: 48, scope: !3133)
!3138 = !DILocation(line: 1304, column: 21, scope: !3133)
!3139 = !DILocation(line: 1304, column: 71, scope: !3133)
!3140 = !DILocation(line: 1304, column: 19, scope: !3133)
!3141 = !DILocation(line: 1305, column: 15, scope: !3133)
!3142 = !DILocation(line: 1306, column: 51, scope: !3133)
!3143 = !DILocation(line: 1306, column: 57, scope: !3133)
!3144 = !DILocation(line: 1306, column: 19, scope: !3133)
!3145 = !DILocation(line: 1306, column: 17, scope: !3133)
!3146 = !DILocation(line: 1311, column: 8, scope: !3147)
!3147 = distinct !DILexicalBlock(scope: !2893, file: !2, line: 1311, column: 7)
!3148 = !DILocation(line: 1311, column: 13, scope: !3147)
!3149 = !DILocation(line: 1311, column: 31, scope: !3147)
!3150 = !DILocation(line: 1311, column: 28, scope: !3147)
!3151 = !DILocation(line: 1311, column: 47, scope: !3147)
!3152 = !DILocation(line: 1311, column: 51, scope: !3147)
!3153 = !DILocation(line: 1311, column: 56, scope: !3147)
!3154 = !DILocation(line: 1311, column: 68, scope: !3147)
!3155 = !DILocation(line: 1311, column: 65, scope: !3147)
!3156 = !DILocation(line: 1312, column: 26, scope: !3157)
!3157 = distinct !DILexicalBlock(scope: !3147, file: !2, line: 1311, column: 83)
!3158 = !DILocation(line: 1312, column: 4, scope: !3157)
!3159 = !DILocation(line: 1314, column: 17, scope: !3157)
!3160 = !DILocation(line: 1315, column: 3, scope: !3157)
!3161 = distinct !{!3161, !2884, !3162, !262}
!3162 = !DILocation(line: 1317, column: 2, scope: !2377)
!3163 = !DILocation(line: 1321, column: 29, scope: !2377)
!3164 = !DILocation(line: 1321, column: 48, scope: !2377)
!3165 = !DILocation(line: 1321, column: 67, scope: !2377)
!3166 = !DILocation(line: 1321, column: 2, scope: !2377)
!3167 = !DILocation(line: 1324, column: 1, scope: !2377)
!3168 = distinct !DISubprogram(name: "ai_path_garbage_collect", linkageName: "_Z23ai_path_garbage_collectv", scope: !2, file: !2, line: 1484, type: !1562, scopeLine: 1485, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !242)
!3169 = !DILocalVariable(name: "free_path_index", scope: !3168, file: !2, line: 1486, type: !63)
!3170 = !DILocation(line: 1486, column: 6, scope: !3168)
!3171 = !DILocalVariable(name: "num_path_objects", scope: !3168, file: !2, line: 1487, type: !63)
!3172 = !DILocation(line: 1487, column: 6, scope: !3168)
!3173 = !DILocalVariable(name: "objnum", scope: !3168, file: !2, line: 1488, type: !63)
!3174 = !DILocation(line: 1488, column: 6, scope: !3168)
!3175 = !DILocalVariable(name: "objind", scope: !3168, file: !2, line: 1489, type: !63)
!3176 = !DILocation(line: 1489, column: 6, scope: !3168)
!3177 = !DILocalVariable(name: "object_list", scope: !3168, file: !2, line: 1490, type: !3178)
!3178 = !DICompositeType(tag: DW_TAG_array_type, baseType: !3179, size: 11200, elements: !3184)
!3179 = !DIDerivedType(tag: DW_TAG_typedef, name: "obj_path", file: !2, line: 1328, baseType: !3180)
!3180 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !2, line: 1326, size: 32, flags: DIFlagTypePassByValue, elements: !3181, identifier: "_ZTS8obj_path")
!3181 = !{!3182, !3183}
!3182 = !DIDerivedType(tag: DW_TAG_member, name: "path_start", scope: !3180, file: !2, line: 1327, baseType: !162, size: 16)
!3183 = !DIDerivedType(tag: DW_TAG_member, name: "objnum", scope: !3180, file: !2, line: 1327, baseType: !162, size: 16, offset: 16)
!3184 = !{!3185}
!3185 = !DISubrange(count: 350)
!3186 = !DILocation(line: 1490, column: 12, scope: !3168)
!3187 = !DILocation(line: 1493, column: 2, scope: !3168)
!3188 = !DILocation(line: 1498, column: 33, scope: !3168)
!3189 = !DILocation(line: 1498, column: 31, scope: !3168)
!3190 = !DILocation(line: 1504, column: 13, scope: !3191)
!3191 = distinct !DILexicalBlock(scope: !3168, file: !2, line: 1504, column: 2)
!3192 = !DILocation(line: 1504, column: 7, scope: !3191)
!3193 = !DILocation(line: 1504, column: 17, scope: !3194)
!3194 = distinct !DILexicalBlock(scope: !3191, file: !2, line: 1504, column: 2)
!3195 = !DILocation(line: 1504, column: 27, scope: !3194)
!3196 = !DILocation(line: 1504, column: 24, scope: !3194)
!3197 = !DILocation(line: 1504, column: 2, scope: !3191)
!3198 = !DILocalVariable(name: "objp", scope: !3199, file: !2, line: 1505, type: !526)
!3199 = distinct !DILexicalBlock(scope: !3194, file: !2, line: 1504, column: 59)
!3200 = !DILocation(line: 1505, column: 11, scope: !3199)
!3201 = !DILocation(line: 1505, column: 27, scope: !3199)
!3202 = !DILocation(line: 1505, column: 19, scope: !3199)
!3203 = !DILocation(line: 1507, column: 8, scope: !3204)
!3204 = distinct !DILexicalBlock(scope: !3199, file: !2, line: 1507, column: 7)
!3205 = !DILocation(line: 1507, column: 14, scope: !3204)
!3206 = !DILocation(line: 1507, column: 19, scope: !3204)
!3207 = !DILocation(line: 1507, column: 33, scope: !3204)
!3208 = !DILocation(line: 1507, column: 38, scope: !3204)
!3209 = !DILocation(line: 1507, column: 44, scope: !3204)
!3210 = !DILocation(line: 1507, column: 57, scope: !3204)
!3211 = !DILocation(line: 1507, column: 67, scope: !3204)
!3212 = !DILocation(line: 1507, column: 71, scope: !3204)
!3213 = !DILocation(line: 1507, column: 77, scope: !3204)
!3214 = !DILocation(line: 1507, column: 90, scope: !3204)
!3215 = !DILocalVariable(name: "aip", scope: !3216, file: !2, line: 1508, type: !1734)
!3216 = distinct !DILexicalBlock(scope: !3204, file: !2, line: 1507, column: 105)
!3217 = !DILocation(line: 1508, column: 15, scope: !3216)
!3218 = !DILocation(line: 1508, column: 22, scope: !3216)
!3219 = !DILocation(line: 1508, column: 28, scope: !3216)
!3220 = !DILocation(line: 1510, column: 8, scope: !3221)
!3221 = distinct !DILexicalBlock(scope: !3216, file: !2, line: 1510, column: 8)
!3222 = !DILocation(line: 1510, column: 13, scope: !3221)
!3223 = !DILocation(line: 1511, column: 48, scope: !3224)
!3224 = distinct !DILexicalBlock(scope: !3221, file: !2, line: 1510, column: 26)
!3225 = !DILocation(line: 1511, column: 53, scope: !3224)
!3226 = !DILocation(line: 1511, column: 17, scope: !3224)
!3227 = !DILocation(line: 1511, column: 5, scope: !3224)
!3228 = !DILocation(line: 1511, column: 35, scope: !3224)
!3229 = !DILocation(line: 1511, column: 46, scope: !3224)
!3230 = !DILocation(line: 1512, column: 46, scope: !3224)
!3231 = !DILocation(line: 1512, column: 33, scope: !3224)
!3232 = !DILocation(line: 1512, column: 5, scope: !3224)
!3233 = !DILocation(line: 1512, column: 37, scope: !3224)
!3234 = !DILocation(line: 1512, column: 44, scope: !3224)
!3235 = !DILocation(line: 1513, column: 4, scope: !3224)
!3236 = !DILocation(line: 1514, column: 3, scope: !3216)
!3237 = !DILocation(line: 1515, column: 2, scope: !3199)
!3238 = !DILocation(line: 1504, column: 55, scope: !3194)
!3239 = !DILocation(line: 1504, column: 2, scope: !3194)
!3240 = distinct !{!3240, !3197, !3241, !262}
!3241 = !DILocation(line: 1515, column: 2, scope: !3191)
!3242 = !DILocation(line: 1517, column: 8, scope: !3168)
!3243 = !DILocation(line: 1517, column: 21, scope: !3168)
!3244 = !DILocation(line: 1517, column: 2, scope: !3168)
!3245 = !DILocation(line: 1520, column: 13, scope: !3246)
!3246 = distinct !DILexicalBlock(scope: !3168, file: !2, line: 1520, column: 2)
!3247 = !DILocation(line: 1520, column: 7, scope: !3246)
!3248 = !DILocation(line: 1520, column: 17, scope: !3249)
!3249 = distinct !DILexicalBlock(scope: !3246, file: !2, line: 1520, column: 2)
!3250 = !DILocation(line: 1520, column: 26, scope: !3249)
!3251 = !DILocation(line: 1520, column: 24, scope: !3249)
!3252 = !DILocation(line: 1520, column: 2, scope: !3246)
!3253 = !DILocalVariable(name: "objp", scope: !3254, file: !2, line: 1521, type: !526)
!3254 = distinct !DILexicalBlock(scope: !3249, file: !2, line: 1520, column: 54)
!3255 = !DILocation(line: 1521, column: 12, scope: !3254)
!3256 = !DILocalVariable(name: "aip", scope: !3254, file: !2, line: 1522, type: !1734)
!3257 = !DILocation(line: 1522, column: 14, scope: !3254)
!3258 = !DILocalVariable(name: "i", scope: !3254, file: !2, line: 1523, type: !63)
!3259 = !DILocation(line: 1523, column: 9, scope: !3254)
!3260 = !DILocalVariable(name: "old_index", scope: !3254, file: !2, line: 1524, type: !63)
!3261 = !DILocation(line: 1524, column: 9, scope: !3254)
!3262 = !DILocation(line: 1526, column: 24, scope: !3254)
!3263 = !DILocation(line: 1526, column: 12, scope: !3254)
!3264 = !DILocation(line: 1526, column: 32, scope: !3254)
!3265 = !DILocation(line: 1526, column: 10, scope: !3254)
!3266 = !DILocation(line: 1527, column: 19, scope: !3254)
!3267 = !DILocation(line: 1527, column: 11, scope: !3254)
!3268 = !DILocation(line: 1527, column: 8, scope: !3254)
!3269 = !DILocation(line: 1528, column: 10, scope: !3254)
!3270 = !DILocation(line: 1528, column: 16, scope: !3254)
!3271 = !DILocation(line: 1528, column: 7, scope: !3254)
!3272 = !DILocation(line: 1529, column: 15, scope: !3254)
!3273 = !DILocation(line: 1529, column: 20, scope: !3254)
!3274 = !DILocation(line: 1529, column: 13, scope: !3254)
!3275 = !DILocation(line: 1531, column: 21, scope: !3254)
!3276 = !DILocation(line: 1531, column: 3, scope: !3254)
!3277 = !DILocation(line: 1531, column: 8, scope: !3254)
!3278 = !DILocation(line: 1531, column: 19, scope: !3254)
!3279 = !DILocation(line: 1532, column: 9, scope: !3280)
!3280 = distinct !DILexicalBlock(scope: !3254, file: !2, line: 1532, column: 3)
!3281 = !DILocation(line: 1532, column: 8, scope: !3280)
!3282 = !DILocation(line: 1532, column: 13, scope: !3283)
!3283 = distinct !DILexicalBlock(scope: !3280, file: !2, line: 1532, column: 3)
!3284 = !DILocation(line: 1532, column: 15, scope: !3283)
!3285 = !DILocation(line: 1532, column: 20, scope: !3283)
!3286 = !DILocation(line: 1532, column: 14, scope: !3283)
!3287 = !DILocation(line: 1532, column: 3, scope: !3280)
!3288 = !DILocation(line: 1533, column: 56, scope: !3283)
!3289 = !DILocation(line: 1533, column: 36, scope: !3283)
!3290 = !DILocation(line: 1533, column: 30, scope: !3283)
!3291 = !DILocation(line: 1533, column: 4, scope: !3283)
!3292 = !DILocation(line: 1533, column: 34, scope: !3283)
!3293 = !DILocation(line: 1532, column: 34, scope: !3283)
!3294 = !DILocation(line: 1532, column: 3, scope: !3283)
!3295 = distinct !{!3295, !3287, !3296, !262}
!3296 = !DILocation(line: 1533, column: 58, scope: !3280)
!3297 = !DILocation(line: 1534, column: 2, scope: !3254)
!3298 = !DILocation(line: 1520, column: 50, scope: !3249)
!3299 = !DILocation(line: 1520, column: 2, scope: !3249)
!3300 = distinct !{!3300, !3252, !3301, !262}
!3301 = !DILocation(line: 1534, column: 2, scope: !3246)
!3302 = !DILocation(line: 1536, column: 36, scope: !3168)
!3303 = !DILocation(line: 1536, column: 25, scope: !3168)
!3304 = !DILocation(line: 1536, column: 22, scope: !3168)
!3305 = !DILocalVariable(name: "i", scope: !3306, file: !2, line: 1542, type: !63)
!3306 = distinct !DILexicalBlock(scope: !3168, file: !2, line: 1541, column: 2)
!3307 = !DILocation(line: 1542, column: 6, scope: !3306)
!3308 = !DILocation(line: 1544, column: 2, scope: !3306)
!3309 = !DILocation(line: 1546, column: 8, scope: !3310)
!3310 = distinct !DILexicalBlock(scope: !3306, file: !2, line: 1546, column: 2)
!3311 = !DILocation(line: 1546, column: 7, scope: !3310)
!3312 = !DILocation(line: 1546, column: 12, scope: !3313)
!3313 = distinct !DILexicalBlock(scope: !3310, file: !2, line: 1546, column: 2)
!3314 = !DILocation(line: 1546, column: 15, scope: !3313)
!3315 = !DILocation(line: 1546, column: 13, scope: !3313)
!3316 = !DILocation(line: 1546, column: 2, scope: !3310)
!3317 = !DILocalVariable(name: "aip", scope: !3318, file: !2, line: 1547, type: !1734)
!3318 = distinct !DILexicalBlock(scope: !3313, file: !2, line: 1546, column: 42)
!3319 = !DILocation(line: 1547, column: 14, scope: !3318)
!3320 = !DILocation(line: 1547, column: 29, scope: !3318)
!3321 = !DILocation(line: 1547, column: 21, scope: !3318)
!3322 = !DILocation(line: 1547, column: 32, scope: !3318)
!3323 = !DILocation(line: 1549, column: 16, scope: !3324)
!3324 = distinct !DILexicalBlock(scope: !3318, file: !2, line: 1549, column: 7)
!3325 = !DILocation(line: 1549, column: 8, scope: !3324)
!3326 = !DILocation(line: 1549, column: 19, scope: !3324)
!3327 = !DILocation(line: 1549, column: 24, scope: !3324)
!3328 = !DILocation(line: 1549, column: 38, scope: !3324)
!3329 = !DILocation(line: 1549, column: 50, scope: !3324)
!3330 = !DILocation(line: 1549, column: 42, scope: !3324)
!3331 = !DILocation(line: 1549, column: 53, scope: !3324)
!3332 = !DILocation(line: 1549, column: 66, scope: !3324)
!3333 = !DILocation(line: 1550, column: 9, scope: !3334)
!3334 = distinct !DILexicalBlock(scope: !3324, file: !2, line: 1550, column: 8)
!3335 = !DILocation(line: 1550, column: 14, scope: !3334)
!3336 = !DILocation(line: 1550, column: 27, scope: !3334)
!3337 = !DILocation(line: 1550, column: 32, scope: !3334)
!3338 = !DILocation(line: 1550, column: 25, scope: !3334)
!3339 = !DILocation(line: 1550, column: 46, scope: !3334)
!3340 = !DILocation(line: 1550, column: 66, scope: !3334)
!3341 = !DILocation(line: 1550, column: 44, scope: !3334)
!3342 = !DILocation(line: 1550, column: 80, scope: !3334)
!3343 = !DILocation(line: 1550, column: 84, scope: !3334)
!3344 = !DILocation(line: 1550, column: 89, scope: !3334)
!3345 = !DILocation(line: 1550, column: 100, scope: !3334)
!3346 = !DILocation(line: 1551, column: 5, scope: !3334)
!3347 = !DILocation(line: 1550, column: 102, scope: !3334)
!3348 = !DILocation(line: 1552, column: 2, scope: !3318)
!3349 = !DILocation(line: 1546, column: 38, scope: !3313)
!3350 = !DILocation(line: 1546, column: 2, scope: !3313)
!3351 = distinct !{!3351, !3316, !3352, !262}
!3352 = !DILocation(line: 1552, column: 2, scope: !3310)
!3353 = !DILocation(line: 1554, column: 2, scope: !3306)
!3354 = !DILocation(line: 1558, column: 1, scope: !3168)
!3355 = distinct !DISubprogram(name: "fixdiv", linkageName: "_Z6fixdivii", scope: !70, file: !70, line: 89, type: !511, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !242)
!3356 = !DILocalVariable(name: "a", arg: 1, scope: !3355, file: !70, line: 89, type: !69)
!3357 = !DILocation(line: 89, column: 26, scope: !3355)
!3358 = !DILocalVariable(name: "b", arg: 2, scope: !3355, file: !70, line: 89, type: !69)
!3359 = !DILocation(line: 89, column: 33, scope: !3355)
!3360 = !DILocation(line: 92, column: 6, scope: !3361)
!3361 = distinct !DILexicalBlock(scope: !3355, file: !70, line: 92, column: 6)
!3362 = !DILocation(line: 92, column: 8, scope: !3361)
!3363 = !DILocation(line: 92, column: 14, scope: !3361)
!3364 = !DILocation(line: 94, column: 25, scope: !3355)
!3365 = !DILocation(line: 94, column: 27, scope: !3355)
!3366 = !DILocation(line: 94, column: 36, scope: !3355)
!3367 = !DILocation(line: 94, column: 34, scope: !3355)
!3368 = !DILocation(line: 94, column: 14, scope: !3355)
!3369 = !DILocation(line: 94, column: 2, scope: !3355)
!3370 = !DILocation(line: 95, column: 1, scope: !3355)
!3371 = distinct !DISubprogram(name: "ai_path_set_orient_and_vel", linkageName: "_Z26ai_path_set_orient_and_velP6objectP10vms_vectoriS2_", scope: !2, file: !2, line: 1342, type: !3372, scopeLine: 1343, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !242)
!3372 = !DISubroutineType(types: !3373)
!3373 = !{null, !526, !863, !63, !863}
!3374 = !DILocalVariable(name: "objp", arg: 1, scope: !3371, file: !2, line: 1342, type: !526)
!3375 = !DILocation(line: 1342, column: 41, scope: !3371)
!3376 = !DILocalVariable(name: "goal_point", arg: 2, scope: !3371, file: !2, line: 1342, type: !863)
!3377 = !DILocation(line: 1342, column: 59, scope: !3371)
!3378 = !DILocalVariable(name: "player_visibility", arg: 3, scope: !3371, file: !2, line: 1342, type: !63)
!3379 = !DILocation(line: 1342, column: 75, scope: !3371)
!3380 = !DILocalVariable(name: "vec_to_player", arg: 4, scope: !3371, file: !2, line: 1342, type: !863)
!3381 = !DILocation(line: 1342, column: 106, scope: !3371)
!3382 = !DILocalVariable(name: "cur_vel", scope: !3371, file: !2, line: 1391, type: !308)
!3383 = !DILocation(line: 1391, column: 13, scope: !3371)
!3384 = !DILocation(line: 1391, column: 23, scope: !3371)
!3385 = !DILocation(line: 1391, column: 29, scope: !3371)
!3386 = !DILocation(line: 1391, column: 45, scope: !3371)
!3387 = !DILocalVariable(name: "norm_cur_vel", scope: !3371, file: !2, line: 1392, type: !308)
!3388 = !DILocation(line: 1392, column: 13, scope: !3371)
!3389 = !DILocalVariable(name: "norm_vec_to_goal", scope: !3371, file: !2, line: 1393, type: !308)
!3390 = !DILocation(line: 1393, column: 13, scope: !3371)
!3391 = !DILocalVariable(name: "cur_pos", scope: !3371, file: !2, line: 1394, type: !308)
!3392 = !DILocation(line: 1394, column: 13, scope: !3371)
!3393 = !DILocation(line: 1394, column: 23, scope: !3371)
!3394 = !DILocation(line: 1394, column: 29, scope: !3371)
!3395 = !DILocalVariable(name: "norm_fvec", scope: !3371, file: !2, line: 1395, type: !308)
!3396 = !DILocation(line: 1395, column: 13, scope: !3371)
!3397 = !DILocalVariable(name: "speed_scale", scope: !3371, file: !2, line: 1396, type: !69)
!3398 = !DILocation(line: 1396, column: 8, scope: !3371)
!3399 = !DILocalVariable(name: "dot", scope: !3371, file: !2, line: 1397, type: !69)
!3400 = !DILocation(line: 1397, column: 8, scope: !3371)
!3401 = !DILocalVariable(name: "robptr", scope: !3371, file: !2, line: 1398, type: !2399)
!3402 = !DILocation(line: 1398, column: 14, scope: !3371)
!3403 = !DILocation(line: 1398, column: 35, scope: !3371)
!3404 = !DILocation(line: 1398, column: 41, scope: !3371)
!3405 = !DILocation(line: 1398, column: 24, scope: !3371)
!3406 = !DILocalVariable(name: "max_speed", scope: !3371, file: !2, line: 1399, type: !69)
!3407 = !DILocation(line: 1399, column: 8, scope: !3371)
!3408 = !DILocation(line: 1402, column: 14, scope: !3371)
!3409 = !DILocation(line: 1402, column: 22, scope: !3371)
!3410 = !DILocation(line: 1402, column: 32, scope: !3371)
!3411 = !DILocation(line: 1402, column: 12, scope: !3371)
!3412 = !DILocation(line: 1403, column: 21, scope: !3413)
!3413 = distinct !DILexicalBlock(scope: !3371, file: !2, line: 1403, column: 6)
!3414 = !DILocation(line: 1403, column: 25, scope: !3413)
!3415 = !DILocation(line: 1403, column: 7, scope: !3413)
!3416 = !DILocation(line: 1403, column: 35, scope: !3413)
!3417 = !DILocation(line: 1403, column: 40, scope: !3413)
!3418 = !DILocation(line: 1403, column: 64, scope: !3413)
!3419 = !DILocation(line: 1403, column: 68, scope: !3413)
!3420 = !DILocation(line: 1403, column: 74, scope: !3413)
!3421 = !DILocation(line: 1403, column: 88, scope: !3413)
!3422 = !DILocation(line: 1403, column: 97, scope: !3413)
!3423 = !DILocation(line: 1404, column: 15, scope: !3413)
!3424 = !DILocation(line: 1404, column: 24, scope: !3413)
!3425 = !DILocation(line: 1404, column: 26, scope: !3413)
!3426 = !DILocation(line: 1404, column: 13, scope: !3413)
!3427 = !DILocation(line: 1404, column: 3, scope: !3413)
!3428 = !DILocation(line: 1406, column: 7, scope: !3429)
!3429 = distinct !DILexicalBlock(scope: !3371, file: !2, line: 1406, column: 6)
!3430 = !DILocation(line: 1406, column: 12, scope: !3429)
!3431 = !DILocation(line: 1406, column: 23, scope: !3429)
!3432 = !DILocation(line: 1407, column: 11, scope: !3433)
!3433 = distinct !DILexicalBlock(scope: !3429, file: !2, line: 1406, column: 30)
!3434 = !DILocation(line: 1408, column: 12, scope: !3433)
!3435 = !DILocation(line: 1408, column: 23, scope: !3433)
!3436 = !DILocation(line: 1408, column: 34, scope: !3433)
!3437 = !DILocation(line: 1409, column: 12, scope: !3433)
!3438 = !DILocation(line: 1409, column: 23, scope: !3433)
!3439 = !DILocation(line: 1409, column: 34, scope: !3433)
!3440 = !DILocation(line: 1410, column: 4, scope: !3433)
!3441 = !DILocation(line: 1410, column: 10, scope: !3433)
!3442 = !DILocation(line: 1410, column: 17, scope: !3433)
!3443 = !DILocation(line: 1410, column: 22, scope: !3433)
!3444 = !DILocation(line: 1410, column: 25, scope: !3433)
!3445 = !DILocation(line: 1410, column: 31, scope: !3433)
!3446 = !DILocation(line: 1410, column: 38, scope: !3433)
!3447 = !DILocation(line: 1410, column: 43, scope: !3433)
!3448 = !DILocation(line: 1410, column: 46, scope: !3433)
!3449 = !DILocation(line: 1410, column: 52, scope: !3433)
!3450 = !DILocation(line: 1410, column: 59, scope: !3433)
!3451 = !DILocation(line: 1410, column: 64, scope: !3433)
!3452 = !DILocation(line: 1411, column: 4, scope: !3433)
!3453 = !DILocation(line: 1411, column: 16, scope: !3433)
!3454 = !DILocation(line: 1411, column: 19, scope: !3433)
!3455 = !DILocation(line: 1411, column: 31, scope: !3433)
!3456 = !DILocation(line: 1411, column: 34, scope: !3433)
!3457 = !DILocation(line: 1411, column: 46, scope: !3433)
!3458 = !DILocation(line: 1411, column: 49, scope: !3433)
!3459 = !DILocation(line: 1407, column: 3, scope: !3433)
!3460 = !DILocation(line: 1412, column: 2, scope: !3433)
!3461 = !DILocation(line: 1414, column: 32, scope: !3371)
!3462 = !DILocation(line: 1414, column: 2, scope: !3371)
!3463 = !DILocation(line: 1415, column: 2, scope: !3371)
!3464 = !DILocation(line: 1417, column: 15, scope: !3371)
!3465 = !DILocation(line: 1418, column: 2, scope: !3371)
!3466 = !DILocation(line: 1420, column: 14, scope: !3371)
!3467 = !DILocation(line: 1420, column: 20, scope: !3371)
!3468 = !DILocation(line: 1420, column: 27, scope: !3371)
!3469 = !DILocation(line: 1420, column: 12, scope: !3371)
!3470 = !DILocation(line: 1421, column: 2, scope: !3371)
!3471 = !DILocation(line: 1423, column: 8, scope: !3371)
!3472 = !DILocation(line: 1423, column: 6, scope: !3371)
!3473 = !DILocation(line: 1425, column: 7, scope: !3474)
!3474 = distinct !DILexicalBlock(scope: !3371, file: !2, line: 1425, column: 6)
!3475 = !DILocation(line: 1425, column: 12, scope: !3474)
!3476 = !DILocation(line: 1425, column: 23, scope: !3474)
!3477 = !DILocation(line: 1426, column: 11, scope: !3478)
!3478 = distinct !DILexicalBlock(scope: !3474, file: !2, line: 1425, column: 30)
!3479 = !DILocation(line: 1427, column: 21, scope: !3478)
!3480 = !DILocation(line: 1427, column: 41, scope: !3478)
!3481 = !DILocation(line: 1427, column: 61, scope: !3478)
!3482 = !DILocation(line: 1428, column: 17, scope: !3478)
!3483 = !DILocation(line: 1428, column: 33, scope: !3478)
!3484 = !DILocation(line: 1428, column: 49, scope: !3478)
!3485 = !DILocation(line: 1429, column: 14, scope: !3478)
!3486 = !DILocation(line: 1429, column: 27, scope: !3478)
!3487 = !DILocation(line: 1429, column: 40, scope: !3478)
!3488 = !DILocation(line: 1429, column: 43, scope: !3478)
!3489 = !DILocation(line: 1426, column: 3, scope: !3478)
!3490 = !DILocation(line: 1430, column: 2, scope: !3478)
!3491 = !DILocation(line: 1433, column: 6, scope: !3492)
!3492 = distinct !DILexicalBlock(scope: !3371, file: !2, line: 1433, column: 6)
!3493 = !DILocation(line: 1433, column: 10, scope: !3492)
!3494 = !DILocation(line: 1435, column: 16, scope: !3495)
!3495 = distinct !DILexicalBlock(scope: !3492, file: !2, line: 1433, column: 25)
!3496 = !DILocation(line: 1436, column: 2, scope: !3495)
!3497 = !DILocation(line: 1437, column: 38, scope: !3498)
!3498 = distinct !DILexicalBlock(scope: !3492, file: !2, line: 1436, column: 9)
!3499 = !DILocation(line: 1437, column: 39, scope: !3498)
!3500 = !DILocation(line: 1437, column: 16, scope: !3498)
!3501 = !DILocation(line: 1437, column: 18, scope: !3498)
!3502 = !DILocation(line: 1438, column: 38, scope: !3498)
!3503 = !DILocation(line: 1438, column: 39, scope: !3498)
!3504 = !DILocation(line: 1438, column: 16, scope: !3498)
!3505 = !DILocation(line: 1438, column: 18, scope: !3498)
!3506 = !DILocation(line: 1439, column: 38, scope: !3498)
!3507 = !DILocation(line: 1439, column: 39, scope: !3498)
!3508 = !DILocation(line: 1439, column: 16, scope: !3498)
!3509 = !DILocation(line: 1439, column: 18, scope: !3498)
!3510 = !DILocation(line: 1442, column: 2, scope: !3371)
!3511 = !DILocation(line: 1449, column: 6, scope: !3512)
!3512 = distinct !DILexicalBlock(scope: !3371, file: !2, line: 1449, column: 6)
!3513 = !DILocation(line: 1449, column: 10, scope: !3512)
!3514 = !DILocation(line: 1450, column: 7, scope: !3512)
!3515 = !DILocation(line: 1450, column: 3, scope: !3512)
!3516 = !DILocation(line: 1453, column: 6, scope: !3517)
!3517 = distinct !DILexicalBlock(scope: !3371, file: !2, line: 1453, column: 6)
!3518 = !DILocation(line: 1453, column: 12, scope: !3517)
!3519 = !DILocation(line: 1453, column: 26, scope: !3517)
!3520 = !DILocation(line: 1453, column: 35, scope: !3517)
!3521 = !DILocation(line: 1454, column: 7, scope: !3522)
!3522 = distinct !DILexicalBlock(scope: !3517, file: !2, line: 1454, column: 7)
!3523 = !DILocation(line: 1454, column: 11, scope: !3522)
!3524 = !DILocation(line: 1455, column: 11, scope: !3522)
!3525 = !DILocation(line: 1455, column: 15, scope: !3522)
!3526 = !DILocation(line: 1455, column: 22, scope: !3522)
!3527 = !DILocation(line: 1455, column: 8, scope: !3522)
!3528 = !DILocation(line: 1455, column: 4, scope: !3522)
!3529 = !DILocation(line: 1454, column: 18, scope: !3522)
!3530 = !DILocation(line: 1457, column: 23, scope: !3371)
!3531 = !DILocation(line: 1457, column: 34, scope: !3371)
!3532 = !DILocation(line: 1457, column: 16, scope: !3371)
!3533 = !DILocation(line: 1457, column: 14, scope: !3371)
!3534 = !DILocation(line: 1458, column: 30, scope: !3371)
!3535 = !DILocation(line: 1458, column: 2, scope: !3371)
!3536 = !DILocation(line: 1460, column: 7, scope: !3537)
!3537 = distinct !DILexicalBlock(scope: !3371, file: !2, line: 1460, column: 6)
!3538 = !DILocation(line: 1460, column: 12, scope: !3537)
!3539 = !DILocation(line: 1460, column: 23, scope: !3537)
!3540 = !DILocation(line: 1461, column: 11, scope: !3541)
!3541 = distinct !DILexicalBlock(scope: !3537, file: !2, line: 1460, column: 30)
!3542 = !DILocation(line: 1462, column: 17, scope: !3541)
!3543 = !DILocation(line: 1462, column: 33, scope: !3541)
!3544 = !DILocation(line: 1462, column: 49, scope: !3541)
!3545 = !DILocation(line: 1462, column: 52, scope: !3541)
!3546 = !DILocation(line: 1462, column: 65, scope: !3541)
!3547 = !DILocation(line: 1461, column: 3, scope: !3541)
!3548 = !DILocation(line: 1463, column: 2, scope: !3541)
!3549 = !DILocation(line: 1465, column: 2, scope: !3371)
!3550 = !DILocation(line: 1465, column: 8, scope: !3371)
!3551 = !DILocation(line: 1465, column: 24, scope: !3371)
!3552 = !DILocation(line: 1465, column: 33, scope: !3371)
!3553 = !DILocation(line: 1467, column: 21, scope: !3554)
!3554 = distinct !DILexicalBlock(scope: !3371, file: !2, line: 1467, column: 6)
!3555 = !DILocation(line: 1467, column: 25, scope: !3554)
!3556 = !DILocation(line: 1467, column: 7, scope: !3554)
!3557 = !DILocation(line: 1467, column: 35, scope: !3554)
!3558 = !DILocation(line: 1467, column: 40, scope: !3554)
!3559 = !DILocation(line: 1467, column: 64, scope: !3554)
!3560 = !DILocation(line: 1467, column: 68, scope: !3554)
!3561 = !DILocation(line: 1467, column: 76, scope: !3554)
!3562 = !DILocation(line: 1467, column: 86, scope: !3554)
!3563 = !DILocation(line: 1467, column: 92, scope: !3554)
!3564 = !DILocation(line: 1467, column: 96, scope: !3554)
!3565 = !DILocation(line: 1467, column: 102, scope: !3554)
!3566 = !DILocation(line: 1467, column: 116, scope: !3554)
!3567 = !DILocation(line: 1467, column: 125, scope: !3554)
!3568 = !DILocation(line: 1468, column: 21, scope: !3569)
!3569 = distinct !DILexicalBlock(scope: !3570, file: !2, line: 1468, column: 7)
!3570 = distinct !DILexicalBlock(scope: !3554, file: !2, line: 1467, column: 140)
!3571 = !DILocation(line: 1468, column: 25, scope: !3569)
!3572 = !DILocation(line: 1468, column: 7, scope: !3569)
!3573 = !DILocation(line: 1468, column: 35, scope: !3569)
!3574 = !DILocation(line: 1468, column: 40, scope: !3569)
!3575 = !DILocation(line: 1469, column: 9, scope: !3576)
!3576 = distinct !DILexicalBlock(scope: !3577, file: !2, line: 1469, column: 8)
!3577 = distinct !DILexicalBlock(scope: !3569, file: !2, line: 1468, column: 72)
!3578 = !DILocation(line: 1469, column: 8, scope: !3576)
!3579 = !DILocation(line: 1469, column: 28, scope: !3576)
!3580 = !DILocation(line: 1469, column: 32, scope: !3576)
!3581 = !DILocation(line: 1469, column: 46, scope: !3576)
!3582 = !DILocation(line: 1470, column: 25, scope: !3576)
!3583 = !DILocation(line: 1470, column: 22, scope: !3576)
!3584 = !DILocation(line: 1470, column: 5, scope: !3576)
!3585 = !DILocation(line: 1472, column: 5, scope: !3576)
!3586 = !DILocation(line: 1472, column: 5, scope: !3587)
!3587 = distinct !DILexicalBlock(scope: !3576, file: !2, line: 1472, column: 5)
!3588 = !DILocation(line: 1473, column: 3, scope: !3577)
!3589 = !DILocation(line: 1474, column: 45, scope: !3570)
!3590 = !DILocation(line: 1474, column: 51, scope: !3570)
!3591 = !DILocation(line: 1474, column: 59, scope: !3570)
!3592 = !DILocation(line: 1474, column: 75, scope: !3570)
!3593 = !DILocation(line: 1474, column: 3, scope: !3570)
!3594 = !DILocation(line: 1475, column: 2, scope: !3570)
!3595 = !DILocation(line: 1476, column: 45, scope: !3554)
!3596 = !DILocation(line: 1476, column: 51, scope: !3554)
!3597 = !DILocation(line: 1476, column: 59, scope: !3554)
!3598 = !DILocation(line: 1476, column: 69, scope: !3554)
!3599 = !DILocation(line: 1476, column: 3, scope: !3554)
!3600 = !DILocation(line: 1478, column: 1, scope: !3371)
!3601 = distinct !DISubprogram(name: "path_index_compare", linkageName: "_Z18path_index_compareP8obj_pathS0_", scope: !2, file: !2, line: 1330, type: !3602, scopeLine: 1331, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !242)
!3602 = !DISubroutineType(types: !3603)
!3603 = !{!63, !3604, !3604}
!3604 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3179, size: 64)
!3605 = !DILocalVariable(name: "i1", arg: 1, scope: !3601, file: !2, line: 1330, type: !3604)
!3606 = !DILocation(line: 1330, column: 34, scope: !3601)
!3607 = !DILocalVariable(name: "i2", arg: 2, scope: !3601, file: !2, line: 1330, type: !3604)
!3608 = !DILocation(line: 1330, column: 48, scope: !3601)
!3609 = !DILocation(line: 1332, column: 6, scope: !3610)
!3610 = distinct !DILexicalBlock(scope: !3601, file: !2, line: 1332, column: 6)
!3611 = !DILocation(line: 1332, column: 10, scope: !3610)
!3612 = !DILocation(line: 1332, column: 23, scope: !3610)
!3613 = !DILocation(line: 1332, column: 27, scope: !3610)
!3614 = !DILocation(line: 1332, column: 21, scope: !3610)
!3615 = !DILocation(line: 1333, column: 3, scope: !3610)
!3616 = !DILocation(line: 1334, column: 11, scope: !3617)
!3617 = distinct !DILexicalBlock(scope: !3610, file: !2, line: 1334, column: 11)
!3618 = !DILocation(line: 1334, column: 15, scope: !3617)
!3619 = !DILocation(line: 1334, column: 29, scope: !3617)
!3620 = !DILocation(line: 1334, column: 33, scope: !3617)
!3621 = !DILocation(line: 1334, column: 26, scope: !3617)
!3622 = !DILocation(line: 1335, column: 3, scope: !3617)
!3623 = !DILocation(line: 1337, column: 3, scope: !3617)
!3624 = !DILocation(line: 1338, column: 1, scope: !3601)
!3625 = distinct !DISubprogram(name: "attempt_to_resume_path", linkageName: "_Z22attempt_to_resume_pathP6object", scope: !2, file: !2, line: 1607, type: !3626, scopeLine: 1608, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !242)
!3626 = !DISubroutineType(types: !3627)
!3627 = !{null, !526}
!3628 = !DILocalVariable(name: "objp", arg: 1, scope: !3625, file: !2, line: 1607, type: !526)
!3629 = !DILocation(line: 1607, column: 37, scope: !3625)
!3630 = !DILocalVariable(name: "aip", scope: !3625, file: !2, line: 1610, type: !1734)
!3631 = !DILocation(line: 1610, column: 14, scope: !3625)
!3632 = !DILocation(line: 1610, column: 21, scope: !3625)
!3633 = !DILocation(line: 1610, column: 27, scope: !3625)
!3634 = !DILocalVariable(name: "abs_index", scope: !3625, file: !2, line: 1612, type: !63)
!3635 = !DILocation(line: 1612, column: 9, scope: !3625)
!3636 = !DILocalVariable(name: "new_path_index", scope: !3625, file: !2, line: 1612, type: !63)
!3637 = !DILocation(line: 1612, column: 20, scope: !3625)
!3638 = !DILocation(line: 1616, column: 7, scope: !3639)
!3639 = distinct !DILexicalBlock(scope: !3625, file: !2, line: 1616, column: 6)
!3640 = !DILocation(line: 1616, column: 12, scope: !3639)
!3641 = !DILocation(line: 1616, column: 21, scope: !3639)
!3642 = !DILocation(line: 1616, column: 37, scope: !3639)
!3643 = !DILocation(line: 1616, column: 52, scope: !3639)
!3644 = !DILocation(line: 1616, column: 58, scope: !3639)
!3645 = !DILocation(line: 1616, column: 41, scope: !3639)
!3646 = !DILocation(line: 1616, column: 62, scope: !3639)
!3647 = !DILocation(line: 1616, column: 72, scope: !3639)
!3648 = !DILocation(line: 1617, column: 7, scope: !3649)
!3649 = distinct !DILexicalBlock(scope: !3639, file: !2, line: 1617, column: 7)
!3650 = !DILocation(line: 1617, column: 16, scope: !3649)
!3651 = !DILocalVariable(name: "ailp", scope: !3652, file: !2, line: 1618, type: !1739)
!3652 = distinct !DILexicalBlock(scope: !3649, file: !2, line: 1617, column: 24)
!3653 = !DILocation(line: 1618, column: 16, scope: !3652)
!3654 = !DILocation(line: 1618, column: 38, scope: !3652)
!3655 = !DILocation(line: 1618, column: 42, scope: !3652)
!3656 = !DILocation(line: 1618, column: 24, scope: !3652)
!3657 = !DILocation(line: 1620, column: 24, scope: !3652)
!3658 = !DILocation(line: 1620, column: 30, scope: !3652)
!3659 = !DILocation(line: 1620, column: 4, scope: !3652)
!3660 = !DILocation(line: 1620, column: 9, scope: !3652)
!3661 = !DILocation(line: 1620, column: 22, scope: !3652)
!3662 = !DILocation(line: 1622, column: 4, scope: !3652)
!3663 = !DILocation(line: 1622, column: 10, scope: !3652)
!3664 = !DILocation(line: 1622, column: 15, scope: !3652)
!3665 = !DILocation(line: 1623, column: 4, scope: !3652)
!3666 = !DILocation(line: 1624, column: 3, scope: !3652)
!3667 = !DILocation(line: 1617, column: 18, scope: !3649)
!3668 = !DILocation(line: 1627, column: 14, scope: !3625)
!3669 = !DILocation(line: 1627, column: 19, scope: !3625)
!3670 = !DILocation(line: 1627, column: 30, scope: !3625)
!3671 = !DILocation(line: 1627, column: 35, scope: !3625)
!3672 = !DILocation(line: 1627, column: 29, scope: !3625)
!3673 = !DILocation(line: 1627, column: 12, scope: !3625)
!3674 = !DILocation(line: 1633, column: 19, scope: !3625)
!3675 = !DILocation(line: 1633, column: 24, scope: !3625)
!3676 = !DILocation(line: 1633, column: 41, scope: !3625)
!3677 = !DILocation(line: 1633, column: 46, scope: !3625)
!3678 = !DILocation(line: 1633, column: 39, scope: !3625)
!3679 = !DILocation(line: 1633, column: 17, scope: !3625)
!3680 = !DILocation(line: 1635, column: 7, scope: !3681)
!3681 = distinct !DILexicalBlock(scope: !3625, file: !2, line: 1635, column: 6)
!3682 = !DILocation(line: 1635, column: 22, scope: !3681)
!3683 = !DILocation(line: 1635, column: 28, scope: !3681)
!3684 = !DILocation(line: 1635, column: 32, scope: !3681)
!3685 = !DILocation(line: 1635, column: 49, scope: !3681)
!3686 = !DILocation(line: 1635, column: 54, scope: !3681)
!3687 = !DILocation(line: 1635, column: 47, scope: !3681)
!3688 = !DILocation(line: 1637, column: 25, scope: !3689)
!3689 = distinct !DILexicalBlock(scope: !3681, file: !2, line: 1635, column: 68)
!3690 = !DILocation(line: 1637, column: 3, scope: !3689)
!3691 = !DILocation(line: 1637, column: 8, scope: !3689)
!3692 = !DILocation(line: 1637, column: 23, scope: !3689)
!3693 = !DILocation(line: 1638, column: 2, scope: !3689)
!3694 = !DILocation(line: 1641, column: 31, scope: !3695)
!3695 = distinct !DILexicalBlock(scope: !3681, file: !2, line: 1638, column: 9)
!3696 = !DILocation(line: 1641, column: 3, scope: !3695)
!3697 = !DILocation(line: 1642, column: 26, scope: !3695)
!3698 = !DILocation(line: 1642, column: 3, scope: !3695)
!3699 = !DILocation(line: 1645, column: 1, scope: !3625)
