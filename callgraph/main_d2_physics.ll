; ModuleID = '/Users/richard/code/ChocolateDescent/main_d2/physics.cpp'
source_filename = "/Users/richard/code/ChocolateDescent/main_d2/physics.cpp"
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
%struct.tmap_info = type { i8, [3 x i8], i32, i32, i16, i16, i16, i16 }
%struct.ai_local = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [10 x %struct.vms_angvec], [10 x %struct.vms_angvec], [10 x i8], [10 x i8] }
%struct.segment2 = type { i8, i8, i8, i8, i32 }
%struct.robot_info = type { i32, [8 x %struct.vms_vector], [8 x i8], i16, i16, i16, i16, i8, i8, i8, i8, i8, i8, i8, i8, i16, i8, i8, i32, i32, i32, i32, [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i8], [5 x i8], i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, [3 x i8], i8, i8, i8, i8, [9 x [5 x %struct.jointlist]], i32 }
%struct.jointlist = type { i16, i16 }
%struct.fvi_info = type { i32, %struct.vms_vector, i32, i32, i32, i32, %struct.vms_vector, i32, [100 x i32] }
%struct.fvi_query = type { ptr, ptr, i32, i32, i16, ptr, i32 }
%struct.segmasks = type { i16, i8, i8 }

@Physics_cheat_flag = global i32 0, align 4, !dbg !0
@floor_levelling = global i32 0, align 4, !dbg !14
@Segments = external global [0 x %struct.segment], align 4
@FrameTime = external global i32, align 4
@phys_seglist = global [100 x i32] zeroinitializer, align 4, !dbg !17
@n_phys_segs = global i32 0, align 4, !dbg !22
@debug_obj = global ptr null, align 8, !dbg !24
@Total_retries = global i32 0, align 4, !dbg !175
@Total_sims = global i32 0, align 4, !dbg !177
@Dont_move_ai_objects = global i32 0, align 4, !dbg !179
@.str = private unnamed_addr constant [14 x i8] c"FrameTime > 0\00", align 1, !dbg !181
@.str.1 = private unnamed_addr constant [57 x i8] c"/Users/richard/code/ChocolateDescent/main_d2/physics.cpp\00", align 1, !dbg !188
@.str.2 = private unnamed_addr constant [22 x i8] c"obj->type != OBJ_NONE\00", align 1, !dbg !193
@.str.3 = private unnamed_addr constant [33 x i8] c"obj->movement_type == MT_PHYSICS\00", align 1, !dbg !198
@Objects = external global [0 x %struct.object], align 4
@disable_new_fvi_stuff = external global i32, align 4
@.str.4 = private unnamed_addr constant [35 x i8] c"object %d:\0A  start pos = %x %x %x\0A\00", align 1, !dbg !203
@.str.5 = private unnamed_addr constant [21 x i8] c"  thrust = %x %x %x\0A\00", align 1, !dbg !208
@.str.6 = private unnamed_addr constant [17 x i8] c"  sim_time = %x\0A\00", align 1, !dbg !213
@.str.7 = private unnamed_addr constant [38 x i8] c"Warning: object %d not in given seg!\0A\00", align 1, !dbg !218
@.str.8 = private unnamed_addr constant [48 x i8] c"Warning: can't find seg for object %d - moving\0A\00", align 1, !dbg !223
@Game_mode = external global i32, align 4
@.str.9 = private unnamed_addr constant [31 x i8] c"obj->mtype.phys_info.brakes==0\00", align 1, !dbg !228
@.str.10 = private unnamed_addr constant [77 x i8] c"!(obj->mtype.phys_info.flags&PF_USES_THRUST) || obj->mtype.phys_info.drag!=0\00", align 1, !dbg !233
@.str.11 = private unnamed_addr constant [23 x i8] c"  velocity = %x %x %x\0A\00", align 1, !dbg !238
@.str.12 = private unnamed_addr constant [33 x i8] c"  pass %d, frame_vec = %x %x %x\0A\00", align 1, !dbg !243
@.str.13 = private unnamed_addr constant [28 x i8] c"   desired_pos  = %x %x %x\0A\00", align 1, !dbg !245
@.str.14 = private unnamed_addr constant [52 x i8] c"   FVI parms: p0 = %8x %8x %8x, segnum=%x, size=%x\0A\00", align 1, !dbg !250
@.str.15 = private unnamed_addr constant [32 x i8] c"              p1 = %8x %8x %8x\0A\00", align 1, !dbg !255
@_ZZ14do_physics_simP6objectE12cfvi50_count = internal global i32 0, align 4, !dbg !260
@__stderrp = external global ptr, align 8
@.str.16 = private unnamed_addr constant [103 x i8] c"CFVI50 c=%d p0=(%d,%d,%d) p1=(%d,%d,%d) seg=%d rad=%d -> fate=%d hit=(%d,%d,%d) hseg=%d wn=(%d,%d,%d)\0A\00", align 1, !dbg !266
@.str.17 = private unnamed_addr constant [58 x i8] c"Warning: Bad p0 in physics!  Object = %i, type = %i [%s]\0A\00", align 1, !dbg !271
@Object_type_names = external global [16 x [9 x i8]], align 1
@.str.18 = private unnamed_addr constant [38 x i8] c"   fate  = %d, hit_pnt = %8x %8x %8x\0A\00", align 1, !dbg !276
@.str.19 = private unnamed_addr constant [51 x i8] c"iseg==-1 in physics!  Object = %i, type = %i (%s)\0A\00", align 1, !dbg !278
@Highest_segment_index = external global i32, align 4
@.str.20 = private unnamed_addr constant [84 x i8] c"!((fate==HIT_WALL) && ((WallHitSeg == -1) || (WallHitSeg > Highest_segment_index)))\00", align 1, !dbg !283
@.str.21 = private unnamed_addr constant [23 x i8] c"   new pos = %x %x %x\0A\00", align 1, !dbg !288
@.str.22 = private unnamed_addr constant [30 x i8] c"   Warning: moved backwards!\0A\00", align 1, !dbg !290
@.str.23 = private unnamed_addr constant [31 x i8] c"Bogus sim_time = %x, old = %x\0A\00", align 1, !dbg !295
@.str.24 = private unnamed_addr constant [73 x i8] c"   Bogus sim_time = %x, old = %x, attempted_dist = %x, actual_dist = %x\0A\00", align 1, !dbg !297
@.str.25 = private unnamed_addr constant [22 x i8] c"   new sim_time = %x\0A\00", align 1, !dbg !302
@.str.26 = private unnamed_addr constant [16 x i8] c"WallHitSeg > -1\00", align 1, !dbg !304
@.str.27 = private unnamed_addr constant [17 x i8] c"WallHitSide > -1\00", align 1, !dbg !309
@BounceCheat = external global i8, align 1
@.str.28 = private unnamed_addr constant [98 x i8] c"BounceCheat || !(obj->mtype.phys_info.flags & PF_STICK && obj->mtype.phys_info.flags & PF_BOUNCE)\00", align 1, !dbg !311
@TmapInfo = external global [1200 x %struct.tmap_info], align 4
@.str.29 = private unnamed_addr constant [39 x i8] c"obj->mtype.phys_info.flags & PF_BOUNCE\00", align 1, !dbg !316
@.str.30 = private unnamed_addr constant [30 x i8] c"   sliding - wall_norm %x %x\0A\00", align 1, !dbg !321
@.str.31 = private unnamed_addr constant [42 x i8] c"   wall_part %x, new velocity = %x %x %x\0A\00", align 1, !dbg !323
@.str.32 = private unnamed_addr constant [26 x i8] c"hit_info.hit_object != -1\00", align 1, !dbg !328
@.str.33 = private unnamed_addr constant [17 x i8] c"size0+size1 != 0\00", align 1, !dbg !333
@.str.34 = private unnamed_addr constant [31 x i8] c"Warning: Bad p0 in physics!!!\0A\00", align 1, !dbg !335
@Ai_local_info = external global [350 x %struct.ai_local], align 4
@ConsoleObject = external global ptr, align 8
@Segment2s = external global [0 x %struct.segment2], align 4
@.str.35 = private unnamed_addr constant [29 x i8] c"orig_segnum == -1 in physics\00", align 1, !dbg !337
@Vertices = external global [0 x %struct.vms_vector], align 4
@Robot_info = external global [0 x %struct.robot_info], align 4

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z20check_and_fix_matrixP10vms_matrix(ptr noundef %0) #0 !dbg !422 {
  %2 = alloca ptr, align 8
  %3 = alloca %struct.vms_matrix, align 4
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !426, !DIExpression(), !427)
    #dbg_declare(ptr %3, !428, !DIExpression(), !429)
  %4 = load ptr, ptr %2, align 8, !dbg !430
  %5 = getelementptr inbounds nuw %struct.vms_matrix, ptr %4, i32 0, i32 2, !dbg !431
  %6 = load ptr, ptr %2, align 8, !dbg !432
  %7 = getelementptr inbounds nuw %struct.vms_matrix, ptr %6, i32 0, i32 1, !dbg !433
  %8 = call noundef ptr @_Z18vm_vector_2_matrixP10vms_matrixP10vms_vectorS2_S2_(ptr noundef %3, ptr noundef %5, ptr noundef %7, ptr noundef null), !dbg !434
  %9 = load ptr, ptr %2, align 8, !dbg !435
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %9, ptr align 4 %3, i64 36, i1 false), !dbg !436
  ret void, !dbg !437
}

declare noundef ptr @_Z18vm_vector_2_matrixP10vms_matrixP10vms_vectorS2_S2_(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z23do_physics_align_objectP6object(ptr noundef %0) #0 !dbg !438 {
  %2 = alloca ptr, align 8
  %3 = alloca %struct.vms_vector, align 4
  %4 = alloca i16, align 2
  %5 = alloca i16, align 2
  %6 = alloca %struct.vms_matrix, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca i16, align 2
  %13 = alloca %struct.vms_angvec, align 2
  %14 = alloca %struct.vms_matrix, align 4
  %15 = alloca %struct.vms_matrix, align 4
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !439, !DIExpression(), !440)
    #dbg_declare(ptr %3, !441, !DIExpression(), !442)
    #dbg_declare(ptr %4, !443, !DIExpression(), !444)
    #dbg_declare(ptr %5, !445, !DIExpression(), !446)
    #dbg_declare(ptr %6, !447, !DIExpression(), !448)
    #dbg_declare(ptr %7, !449, !DIExpression(), !450)
    #dbg_declare(ptr %8, !451, !DIExpression(), !452)
  store i32 -65536, ptr %8, align 4, !dbg !452
    #dbg_declare(ptr %9, !453, !DIExpression(), !454)
    #dbg_declare(ptr %10, !455, !DIExpression(), !456)
  store i32 0, ptr %9, align 4, !dbg !457
  br label %16, !dbg !459

16:                                               ; preds = %42, %1
  %17 = load i32, ptr %9, align 4, !dbg !460
  %18 = icmp slt i32 %17, 6, !dbg !462
  br i1 %18, label %19, label %45, !dbg !463

19:                                               ; preds = %16
  %20 = load ptr, ptr %2, align 8, !dbg !464
  %21 = getelementptr inbounds nuw %struct.object, ptr %20, i32 0, i32 9, !dbg !464
  %22 = load i16, ptr %21, align 2, !dbg !464
  %23 = sext i16 %22 to i64, !dbg !464
  %24 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %23, !dbg !464
  %25 = getelementptr inbounds nuw %struct.segment, ptr %24, i32 0, i32 0, !dbg !464
  %26 = load i32, ptr %9, align 4, !dbg !464
  %27 = sext i32 %26 to i64, !dbg !464
  %28 = getelementptr inbounds [6 x %struct.side], ptr %25, i64 0, i64 %27, !dbg !464
  %29 = getelementptr inbounds nuw %struct.side, ptr %28, i32 0, i32 6, !dbg !464
  %30 = getelementptr inbounds [2 x %struct.vms_vector], ptr %29, i64 0, i64 0, !dbg !464
  %31 = load ptr, ptr %2, align 8, !dbg !464
  %32 = getelementptr inbounds nuw %struct.object, ptr %31, i32 0, i32 12, !dbg !464
  %33 = getelementptr inbounds nuw %struct.vms_matrix, ptr %32, i32 0, i32 1, !dbg !464
  %34 = call noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef %30, ptr noundef %33), !dbg !464
  store i32 %34, ptr %7, align 4, !dbg !466
  %35 = load i32, ptr %7, align 4, !dbg !467
  %36 = load i32, ptr %8, align 4, !dbg !469
  %37 = icmp sgt i32 %35, %36, !dbg !470
  br i1 %37, label %38, label %41, !dbg !470

38:                                               ; preds = %19
  %39 = load i32, ptr %7, align 4, !dbg !471
  store i32 %39, ptr %8, align 4, !dbg !473
  %40 = load i32, ptr %9, align 4, !dbg !474
  store i32 %40, ptr %10, align 4, !dbg !475
  br label %41, !dbg !476

41:                                               ; preds = %38, %19
  br label %42, !dbg !477

42:                                               ; preds = %41
  %43 = load i32, ptr %9, align 4, !dbg !478
  %44 = add nsw i32 %43, 1, !dbg !478
  store i32 %44, ptr %9, align 4, !dbg !478
  br label %16, !dbg !479, !llvm.loop !480

45:                                               ; preds = %16
  %46 = load i32, ptr @floor_levelling, align 4, !dbg !483
  %47 = icmp ne i32 %46, 0, !dbg !483
  br i1 %47, label %48, label %58, !dbg !483

48:                                               ; preds = %45
  %49 = load ptr, ptr %2, align 8, !dbg !485
  %50 = getelementptr inbounds nuw %struct.object, ptr %49, i32 0, i32 9, !dbg !487
  %51 = load i16, ptr %50, align 2, !dbg !487
  %52 = sext i16 %51 to i64, !dbg !488
  %53 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %52, !dbg !488
  %54 = getelementptr inbounds nuw %struct.segment, ptr %53, i32 0, i32 0, !dbg !489
  %55 = getelementptr inbounds [6 x %struct.side], ptr %54, i64 0, i64 3, !dbg !488
  %56 = getelementptr inbounds nuw %struct.side, ptr %55, i32 0, i32 6, !dbg !490
  %57 = getelementptr inbounds [2 x %struct.vms_vector], ptr %56, i64 0, i64 0, !dbg !488
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %3, ptr align 4 %57, i64 12, i1 false), !dbg !491
  br label %133, !dbg !492

58:                                               ; preds = %45
  %59 = load ptr, ptr %2, align 8, !dbg !493
  %60 = getelementptr inbounds nuw %struct.object, ptr %59, i32 0, i32 9, !dbg !495
  %61 = load i16, ptr %60, align 2, !dbg !495
  %62 = sext i16 %61 to i64, !dbg !496
  %63 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %62, !dbg !496
  %64 = getelementptr inbounds nuw %struct.segment, ptr %63, i32 0, i32 0, !dbg !497
  %65 = load i32, ptr %10, align 4, !dbg !498
  %66 = sext i32 %65 to i64, !dbg !496
  %67 = getelementptr inbounds [6 x %struct.side], ptr %64, i64 0, i64 %66, !dbg !496
  %68 = call noundef i32 @_Z13get_num_facesP4side(ptr noundef %67), !dbg !499
  %69 = icmp eq i32 %68, 2, !dbg !500
  br i1 %69, label %70, label %120, !dbg !500

70:                                               ; preds = %58
    #dbg_declare(ptr %11, !501, !DIExpression(), !527)
  %71 = load ptr, ptr %2, align 8, !dbg !528
  %72 = getelementptr inbounds nuw %struct.object, ptr %71, i32 0, i32 9, !dbg !529
  %73 = load i16, ptr %72, align 2, !dbg !529
  %74 = sext i16 %73 to i64, !dbg !530
  %75 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %74, !dbg !530
  %76 = getelementptr inbounds nuw %struct.segment, ptr %75, i32 0, i32 0, !dbg !531
  %77 = load i32, ptr %10, align 4, !dbg !532
  %78 = sext i32 %77 to i64, !dbg !530
  %79 = getelementptr inbounds [6 x %struct.side], ptr %76, i64 0, i64 %78, !dbg !530
  store ptr %79, ptr %11, align 8, !dbg !527
  %80 = load ptr, ptr %11, align 8, !dbg !533
  %81 = getelementptr inbounds nuw %struct.side, ptr %80, i32 0, i32 6, !dbg !534
  %82 = getelementptr inbounds [2 x %struct.vms_vector], ptr %81, i64 0, i64 0, !dbg !533
  %83 = getelementptr inbounds nuw %struct.vms_vector, ptr %82, i32 0, i32 0, !dbg !535
  %84 = load i32, ptr %83, align 4, !dbg !535
  %85 = load ptr, ptr %11, align 8, !dbg !536
  %86 = getelementptr inbounds nuw %struct.side, ptr %85, i32 0, i32 6, !dbg !537
  %87 = getelementptr inbounds [2 x %struct.vms_vector], ptr %86, i64 0, i64 1, !dbg !536
  %88 = getelementptr inbounds nuw %struct.vms_vector, ptr %87, i32 0, i32 0, !dbg !538
  %89 = load i32, ptr %88, align 4, !dbg !538
  %90 = add nsw i32 %84, %89, !dbg !539
  %91 = sdiv i32 %90, 2, !dbg !540
  %92 = getelementptr inbounds nuw %struct.vms_vector, ptr %3, i32 0, i32 0, !dbg !541
  store i32 %91, ptr %92, align 4, !dbg !542
  %93 = load ptr, ptr %11, align 8, !dbg !543
  %94 = getelementptr inbounds nuw %struct.side, ptr %93, i32 0, i32 6, !dbg !544
  %95 = getelementptr inbounds [2 x %struct.vms_vector], ptr %94, i64 0, i64 0, !dbg !543
  %96 = getelementptr inbounds nuw %struct.vms_vector, ptr %95, i32 0, i32 1, !dbg !545
  %97 = load i32, ptr %96, align 4, !dbg !545
  %98 = load ptr, ptr %11, align 8, !dbg !546
  %99 = getelementptr inbounds nuw %struct.side, ptr %98, i32 0, i32 6, !dbg !547
  %100 = getelementptr inbounds [2 x %struct.vms_vector], ptr %99, i64 0, i64 1, !dbg !546
  %101 = getelementptr inbounds nuw %struct.vms_vector, ptr %100, i32 0, i32 1, !dbg !548
  %102 = load i32, ptr %101, align 4, !dbg !548
  %103 = add nsw i32 %97, %102, !dbg !549
  %104 = sdiv i32 %103, 2, !dbg !550
  %105 = getelementptr inbounds nuw %struct.vms_vector, ptr %3, i32 0, i32 1, !dbg !551
  store i32 %104, ptr %105, align 4, !dbg !552
  %106 = load ptr, ptr %11, align 8, !dbg !553
  %107 = getelementptr inbounds nuw %struct.side, ptr %106, i32 0, i32 6, !dbg !554
  %108 = getelementptr inbounds [2 x %struct.vms_vector], ptr %107, i64 0, i64 0, !dbg !553
  %109 = getelementptr inbounds nuw %struct.vms_vector, ptr %108, i32 0, i32 2, !dbg !555
  %110 = load i32, ptr %109, align 4, !dbg !555
  %111 = load ptr, ptr %11, align 8, !dbg !556
  %112 = getelementptr inbounds nuw %struct.side, ptr %111, i32 0, i32 6, !dbg !557
  %113 = getelementptr inbounds [2 x %struct.vms_vector], ptr %112, i64 0, i64 1, !dbg !556
  %114 = getelementptr inbounds nuw %struct.vms_vector, ptr %113, i32 0, i32 2, !dbg !558
  %115 = load i32, ptr %114, align 4, !dbg !558
  %116 = add nsw i32 %110, %115, !dbg !559
  %117 = sdiv i32 %116, 2, !dbg !560
  %118 = getelementptr inbounds nuw %struct.vms_vector, ptr %3, i32 0, i32 2, !dbg !561
  store i32 %117, ptr %118, align 4, !dbg !562
  %119 = call noundef i32 @_Z16vm_vec_normalizeP10vms_vector(ptr noundef %3), !dbg !563
  br label %132, !dbg !564

120:                                              ; preds = %58
  %121 = load ptr, ptr %2, align 8, !dbg !565
  %122 = getelementptr inbounds nuw %struct.object, ptr %121, i32 0, i32 9, !dbg !566
  %123 = load i16, ptr %122, align 2, !dbg !566
  %124 = sext i16 %123 to i64, !dbg !567
  %125 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %124, !dbg !567
  %126 = getelementptr inbounds nuw %struct.segment, ptr %125, i32 0, i32 0, !dbg !568
  %127 = load i32, ptr %10, align 4, !dbg !569
  %128 = sext i32 %127 to i64, !dbg !567
  %129 = getelementptr inbounds [6 x %struct.side], ptr %126, i64 0, i64 %128, !dbg !567
  %130 = getelementptr inbounds nuw %struct.side, ptr %129, i32 0, i32 6, !dbg !570
  %131 = getelementptr inbounds [2 x %struct.vms_vector], ptr %130, i64 0, i64 0, !dbg !567
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %3, ptr align 4 %131, i64 12, i1 false), !dbg !571
  br label %132

132:                                              ; preds = %120, %70
  br label %133

133:                                              ; preds = %132, %48
  %134 = load ptr, ptr %2, align 8, !dbg !572
  %135 = getelementptr inbounds nuw %struct.object, ptr %134, i32 0, i32 12, !dbg !572
  %136 = getelementptr inbounds nuw %struct.vms_matrix, ptr %135, i32 0, i32 2, !dbg !572
  %137 = call noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef %3, ptr noundef %136), !dbg !572
  %138 = sext i32 %137 to i64, !dbg !572
  %139 = call i64 @llvm.abs.i64(i64 %138, i1 true), !dbg !574
  %140 = icmp slt i64 %139, 32768, !dbg !575
  br i1 %140, label %141, label %202, !dbg !575

141:                                              ; preds = %133
    #dbg_declare(ptr %12, !576, !DIExpression(), !578)
    #dbg_declare(ptr %13, !579, !DIExpression(), !580)
  %142 = load ptr, ptr %2, align 8, !dbg !581
  %143 = getelementptr inbounds nuw %struct.object, ptr %142, i32 0, i32 12, !dbg !582
  %144 = getelementptr inbounds nuw %struct.vms_matrix, ptr %143, i32 0, i32 2, !dbg !583
  %145 = call noundef ptr @_Z18vm_vector_2_matrixP10vms_matrixP10vms_vectorS2_S2_(ptr noundef %6, ptr noundef %144, ptr noundef %3, ptr noundef null), !dbg !584
  %146 = load ptr, ptr %2, align 8, !dbg !585
  %147 = getelementptr inbounds nuw %struct.object, ptr %146, i32 0, i32 12, !dbg !586
  %148 = getelementptr inbounds nuw %struct.vms_matrix, ptr %147, i32 0, i32 1, !dbg !587
  %149 = getelementptr inbounds nuw %struct.vms_matrix, ptr %6, i32 0, i32 1, !dbg !588
  %150 = load ptr, ptr %2, align 8, !dbg !589
  %151 = getelementptr inbounds nuw %struct.object, ptr %150, i32 0, i32 12, !dbg !590
  %152 = getelementptr inbounds nuw %struct.vms_matrix, ptr %151, i32 0, i32 2, !dbg !591
  %153 = call noundef signext i16 @_Z16vm_vec_delta_angP10vms_vectorS0_S0_(ptr noundef %148, ptr noundef %149, ptr noundef %152), !dbg !592
  store i16 %153, ptr %4, align 2, !dbg !593
  store i16 %153, ptr %12, align 2, !dbg !594
  %154 = load ptr, ptr %2, align 8, !dbg !595
  %155 = getelementptr inbounds nuw %struct.object, ptr %154, i32 0, i32 21, !dbg !596
  %156 = getelementptr inbounds nuw %struct.physics_info, ptr %155, i32 0, i32 7, !dbg !597
  %157 = load i16, ptr %156, align 4, !dbg !597
  %158 = sext i16 %157 to i32, !dbg !595
  %159 = load i16, ptr %4, align 2, !dbg !598
  %160 = sext i16 %159 to i32, !dbg !598
  %161 = add nsw i32 %160, %158, !dbg !598
  %162 = trunc i32 %161 to i16, !dbg !598
  store i16 %162, ptr %4, align 2, !dbg !598
  %163 = load i16, ptr %4, align 2, !dbg !599
  %164 = sext i16 %163 to i32, !dbg !599
  %165 = call i32 @llvm.abs.i32(i32 %164, i1 true), !dbg !601
  %166 = icmp sgt i32 %165, 1024, !dbg !602
  br i1 %166, label %167, label %200, !dbg !602

167:                                              ; preds = %141
    #dbg_declare(ptr %14, !603, !DIExpression(), !605)
    #dbg_declare(ptr %15, !606, !DIExpression(), !607)
  %168 = load i32, ptr @FrameTime, align 4, !dbg !608
  %169 = call noundef i32 @_Z6fixmulii(i32 noundef %168, i32 noundef 8192), !dbg !609
  %170 = trunc i32 %169 to i16, !dbg !609
  store i16 %170, ptr %5, align 2, !dbg !610
  %171 = load i16, ptr %4, align 2, !dbg !611
  %172 = sext i16 %171 to i32, !dbg !611
  %173 = call i32 @llvm.abs.i32(i32 %172, i1 true), !dbg !613
  %174 = load i16, ptr %5, align 2, !dbg !614
  %175 = sext i16 %174 to i32, !dbg !614
  %176 = icmp slt i32 %173, %175, !dbg !615
  br i1 %176, label %177, label %179, !dbg !615

177:                                              ; preds = %167
  %178 = load i16, ptr %4, align 2, !dbg !616
  store i16 %178, ptr %5, align 2, !dbg !617
  br label %189, !dbg !618

179:                                              ; preds = %167
  %180 = load i16, ptr %4, align 2, !dbg !619
  %181 = sext i16 %180 to i32, !dbg !619
  %182 = icmp slt i32 %181, 0, !dbg !621
  br i1 %182, label %183, label %188, !dbg !621

183:                                              ; preds = %179
  %184 = load i16, ptr %5, align 2, !dbg !622
  %185 = sext i16 %184 to i32, !dbg !622
  %186 = sub nsw i32 0, %185, !dbg !623
  %187 = trunc i32 %186 to i16, !dbg !623
  store i16 %187, ptr %5, align 2, !dbg !624
  br label %188, !dbg !625

188:                                              ; preds = %183, %179
  br label %189

189:                                              ; preds = %188, %177
  %190 = getelementptr inbounds nuw %struct.vms_angvec, ptr %13, i32 0, i32 2, !dbg !626
  store i16 0, ptr %190, align 2, !dbg !627
  %191 = getelementptr inbounds nuw %struct.vms_angvec, ptr %13, i32 0, i32 0, !dbg !628
  store i16 0, ptr %191, align 2, !dbg !629
  %192 = load i16, ptr %5, align 2, !dbg !630
  %193 = getelementptr inbounds nuw %struct.vms_angvec, ptr %13, i32 0, i32 1, !dbg !631
  store i16 %192, ptr %193, align 2, !dbg !632
  %194 = call noundef ptr @_Z18vm_angles_2_matrixP10vms_matrixP10vms_angvec(ptr noundef %14, ptr noundef %13), !dbg !633
  %195 = load ptr, ptr %2, align 8, !dbg !634
  %196 = getelementptr inbounds nuw %struct.object, ptr %195, i32 0, i32 12, !dbg !635
  %197 = call noundef ptr @_Z18vm_matrix_x_matrixP10vms_matrixS0_S0_(ptr noundef %15, ptr noundef %196, ptr noundef %14), !dbg !636
  %198 = load ptr, ptr %2, align 8, !dbg !637
  %199 = getelementptr inbounds nuw %struct.object, ptr %198, i32 0, i32 12, !dbg !638
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %199, ptr align 4 %15, i64 36, i1 false), !dbg !639
  br label %201, !dbg !640

200:                                              ; preds = %141
  store i32 0, ptr @floor_levelling, align 4, !dbg !641
  br label %201

201:                                              ; preds = %200, %189
  br label %202, !dbg !642

202:                                              ; preds = %201, %133
  ret void, !dbg !643
}

declare noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef, ptr noundef) #1

declare noundef i32 @_Z13get_num_facesP4side(ptr noundef) #1

declare noundef i32 @_Z16vm_vec_normalizeP10vms_vector(ptr noundef) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.abs.i64(i64, i1 immarg) #3

declare noundef signext i16 @_Z16vm_vec_delta_angP10vms_vectorS0_S0_(ptr noundef, ptr noundef, ptr noundef) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.abs.i32(i32, i1 immarg) #3

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z6fixmulii(i32 noundef %0, i32 noundef %1) #4 !dbg !644 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !647, !DIExpression(), !648)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !649, !DIExpression(), !650)
  %5 = load i32, ptr %3, align 4, !dbg !651
  %6 = sext i32 %5 to i64, !dbg !651
  %7 = load i32, ptr %4, align 4, !dbg !652
  %8 = sext i32 %7 to i64, !dbg !652
  %9 = mul nsw i64 %6, %8, !dbg !653
  %10 = ashr i64 %9, 16, !dbg !654
  %11 = trunc i64 %10 to i32, !dbg !655
  ret i32 %11, !dbg !656
}

declare noundef ptr @_Z18vm_angles_2_matrixP10vms_matrixP10vms_angvec(ptr noundef, ptr noundef) #1

declare noundef ptr @_Z18vm_matrix_x_matrixP10vms_matrixS0_S0_(ptr noundef, ptr noundef, ptr noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z19set_object_turnrollP6object(ptr noundef %0) #0 !dbg !657 {
  %2 = alloca ptr, align 8
  %3 = alloca i16, align 2
  %4 = alloca i16, align 2
  %5 = alloca i16, align 2
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !658, !DIExpression(), !659)
    #dbg_declare(ptr %3, !660, !DIExpression(), !661)
  %6 = load ptr, ptr %2, align 8, !dbg !662
  %7 = getelementptr inbounds nuw %struct.object, ptr %6, i32 0, i32 21, !dbg !663
  %8 = getelementptr inbounds nuw %struct.physics_info, ptr %7, i32 0, i32 5, !dbg !664
  %9 = getelementptr inbounds nuw %struct.vms_vector, ptr %8, i32 0, i32 1, !dbg !665
  %10 = load i32, ptr %9, align 4, !dbg !665
  %11 = call noundef i32 @_Z6fixmulii(i32 noundef %10, i32 noundef 10082), !dbg !666
  %12 = sub nsw i32 0, %11, !dbg !667
  %13 = trunc i32 %12 to i16, !dbg !667
  store i16 %13, ptr %3, align 2, !dbg !668
  %14 = load ptr, ptr %2, align 8, !dbg !669
  %15 = getelementptr inbounds nuw %struct.object, ptr %14, i32 0, i32 21, !dbg !671
  %16 = getelementptr inbounds nuw %struct.physics_info, ptr %15, i32 0, i32 7, !dbg !672
  %17 = load i16, ptr %16, align 4, !dbg !672
  %18 = sext i16 %17 to i32, !dbg !669
  %19 = load i16, ptr %3, align 2, !dbg !673
  %20 = sext i16 %19 to i32, !dbg !673
  %21 = icmp ne i32 %18, %20, !dbg !674
  br i1 %21, label %22, label %63, !dbg !674

22:                                               ; preds = %1
    #dbg_declare(ptr %4, !675, !DIExpression(), !677)
    #dbg_declare(ptr %5, !678, !DIExpression(), !679)
  %23 = load i32, ptr @FrameTime, align 4, !dbg !680
  %24 = call noundef i32 @_Z6fixmulii(i32 noundef 8192, i32 noundef %23), !dbg !681
  %25 = trunc i32 %24 to i16, !dbg !681
  store i16 %25, ptr %5, align 2, !dbg !682
  %26 = load i16, ptr %3, align 2, !dbg !683
  %27 = sext i16 %26 to i32, !dbg !683
  %28 = load ptr, ptr %2, align 8, !dbg !684
  %29 = getelementptr inbounds nuw %struct.object, ptr %28, i32 0, i32 21, !dbg !685
  %30 = getelementptr inbounds nuw %struct.physics_info, ptr %29, i32 0, i32 7, !dbg !686
  %31 = load i16, ptr %30, align 4, !dbg !686
  %32 = sext i16 %31 to i32, !dbg !684
  %33 = sub nsw i32 %27, %32, !dbg !687
  %34 = trunc i32 %33 to i16, !dbg !683
  store i16 %34, ptr %4, align 2, !dbg !688
  %35 = load i16, ptr %4, align 2, !dbg !689
  %36 = sext i16 %35 to i64, !dbg !689
  %37 = call i64 @llvm.abs.i64(i64 %36, i1 true), !dbg !691
  %38 = load i16, ptr %5, align 2, !dbg !692
  %39 = sext i16 %38 to i64, !dbg !692
  %40 = icmp slt i64 %37, %39, !dbg !693
  br i1 %40, label %41, label %43, !dbg !693

41:                                               ; preds = %22
  %42 = load i16, ptr %4, align 2, !dbg !694
  store i16 %42, ptr %5, align 2, !dbg !695
  br label %53, !dbg !696

43:                                               ; preds = %22
  %44 = load i16, ptr %4, align 2, !dbg !697
  %45 = sext i16 %44 to i32, !dbg !697
  %46 = icmp slt i32 %45, 0, !dbg !699
  br i1 %46, label %47, label %52, !dbg !699

47:                                               ; preds = %43
  %48 = load i16, ptr %5, align 2, !dbg !700
  %49 = sext i16 %48 to i32, !dbg !700
  %50 = sub nsw i32 0, %49, !dbg !701
  %51 = trunc i32 %50 to i16, !dbg !701
  store i16 %51, ptr %5, align 2, !dbg !702
  br label %52, !dbg !703

52:                                               ; preds = %47, %43
  br label %53

53:                                               ; preds = %52, %41
  %54 = load i16, ptr %5, align 2, !dbg !704
  %55 = sext i16 %54 to i32, !dbg !704
  %56 = load ptr, ptr %2, align 8, !dbg !705
  %57 = getelementptr inbounds nuw %struct.object, ptr %56, i32 0, i32 21, !dbg !706
  %58 = getelementptr inbounds nuw %struct.physics_info, ptr %57, i32 0, i32 7, !dbg !707
  %59 = load i16, ptr %58, align 4, !dbg !708
  %60 = sext i16 %59 to i32, !dbg !708
  %61 = add nsw i32 %60, %55, !dbg !708
  %62 = trunc i32 %61 to i16, !dbg !708
  store i16 %62, ptr %58, align 4, !dbg !708
  br label %63, !dbg !709

63:                                               ; preds = %53, %1
  ret void, !dbg !710
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z18do_physics_sim_rotP6object(ptr noundef %0) #0 !dbg !711 {
  %2 = alloca ptr, align 8
  %3 = alloca %struct.vms_angvec, align 2
  %4 = alloca %struct.vms_matrix, align 4
  %5 = alloca %struct.vms_matrix, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca %struct.vms_vector, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca %struct.vms_matrix, align 4
  %14 = alloca %struct.vms_matrix, align 4
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !712, !DIExpression(), !713)
    #dbg_declare(ptr %3, !714, !DIExpression(), !715)
    #dbg_declare(ptr %4, !716, !DIExpression(), !717)
    #dbg_declare(ptr %5, !718, !DIExpression(), !719)
    #dbg_declare(ptr %6, !720, !DIExpression(), !722)
  %15 = load i32, ptr @FrameTime, align 4, !dbg !723
  %16 = icmp sgt i32 %15, 0, !dbg !723
  %17 = zext i1 %16 to i32, !dbg !723
  call void @_Z7_AssertiPKcS0_i(i32 noundef %17, ptr noundef @.str, ptr noundef @.str.1, i32 noundef 318), !dbg !723
  %18 = load ptr, ptr %2, align 8, !dbg !724
  %19 = getelementptr inbounds nuw %struct.object, ptr %18, i32 0, i32 21, !dbg !725
  store ptr %19, ptr %6, align 8, !dbg !726
  %20 = load ptr, ptr %6, align 8, !dbg !727
  %21 = getelementptr inbounds nuw %struct.physics_info, ptr %20, i32 0, i32 5, !dbg !729
  %22 = getelementptr inbounds nuw %struct.vms_vector, ptr %21, i32 0, i32 0, !dbg !730
  %23 = load i32, ptr %22, align 4, !dbg !730
  %24 = icmp ne i32 %23, 0, !dbg !727
  br i1 %24, label %56, label %25, !dbg !731

25:                                               ; preds = %1
  %26 = load ptr, ptr %6, align 8, !dbg !732
  %27 = getelementptr inbounds nuw %struct.physics_info, ptr %26, i32 0, i32 5, !dbg !733
  %28 = getelementptr inbounds nuw %struct.vms_vector, ptr %27, i32 0, i32 1, !dbg !734
  %29 = load i32, ptr %28, align 4, !dbg !734
  %30 = icmp ne i32 %29, 0, !dbg !732
  br i1 %30, label %56, label %31, !dbg !735

31:                                               ; preds = %25
  %32 = load ptr, ptr %6, align 8, !dbg !736
  %33 = getelementptr inbounds nuw %struct.physics_info, ptr %32, i32 0, i32 5, !dbg !737
  %34 = getelementptr inbounds nuw %struct.vms_vector, ptr %33, i32 0, i32 2, !dbg !738
  %35 = load i32, ptr %34, align 4, !dbg !738
  %36 = icmp ne i32 %35, 0, !dbg !736
  br i1 %36, label %56, label %37, !dbg !739

37:                                               ; preds = %31
  %38 = load ptr, ptr %6, align 8, !dbg !740
  %39 = getelementptr inbounds nuw %struct.physics_info, ptr %38, i32 0, i32 6, !dbg !741
  %40 = getelementptr inbounds nuw %struct.vms_vector, ptr %39, i32 0, i32 0, !dbg !742
  %41 = load i32, ptr %40, align 4, !dbg !742
  %42 = icmp ne i32 %41, 0, !dbg !740
  br i1 %42, label %56, label %43, !dbg !743

43:                                               ; preds = %37
  %44 = load ptr, ptr %6, align 8, !dbg !744
  %45 = getelementptr inbounds nuw %struct.physics_info, ptr %44, i32 0, i32 6, !dbg !745
  %46 = getelementptr inbounds nuw %struct.vms_vector, ptr %45, i32 0, i32 1, !dbg !746
  %47 = load i32, ptr %46, align 4, !dbg !746
  %48 = icmp ne i32 %47, 0, !dbg !744
  br i1 %48, label %56, label %49, !dbg !747

49:                                               ; preds = %43
  %50 = load ptr, ptr %6, align 8, !dbg !748
  %51 = getelementptr inbounds nuw %struct.physics_info, ptr %50, i32 0, i32 6, !dbg !749
  %52 = getelementptr inbounds nuw %struct.vms_vector, ptr %51, i32 0, i32 2, !dbg !750
  %53 = load i32, ptr %52, align 4, !dbg !750
  %54 = icmp ne i32 %53, 0, !dbg !748
  br i1 %54, label %56, label %55, !dbg !751

55:                                               ; preds = %49
  br label %242, !dbg !752

56:                                               ; preds = %49, %43, %37, %31, %25, %1
  %57 = load ptr, ptr %2, align 8, !dbg !753
  %58 = getelementptr inbounds nuw %struct.object, ptr %57, i32 0, i32 21, !dbg !755
  %59 = getelementptr inbounds nuw %struct.physics_info, ptr %58, i32 0, i32 3, !dbg !756
  %60 = load i32, ptr %59, align 4, !dbg !756
  %61 = icmp ne i32 %60, 0, !dbg !753
  br i1 %61, label %62, label %153, !dbg !753

62:                                               ; preds = %56
    #dbg_declare(ptr %7, !757, !DIExpression(), !759)
    #dbg_declare(ptr %8, !760, !DIExpression(), !761)
    #dbg_declare(ptr %9, !762, !DIExpression(), !763)
    #dbg_declare(ptr %10, !764, !DIExpression(), !765)
    #dbg_declare(ptr %11, !766, !DIExpression(), !767)
  %63 = load i32, ptr @FrameTime, align 4, !dbg !768
  %64 = sdiv i32 %63, 1024, !dbg !769
  store i32 %64, ptr %7, align 4, !dbg !770
  %65 = load i32, ptr @FrameTime, align 4, !dbg !771
  %66 = srem i32 %65, 1024, !dbg !772
  store i32 %66, ptr %10, align 4, !dbg !773
  %67 = load i32, ptr %10, align 4, !dbg !774
  %68 = call noundef i32 @_Z6fixdivii(i32 noundef %67, i32 noundef 1024), !dbg !775
  store i32 %68, ptr %11, align 4, !dbg !776
  %69 = load ptr, ptr %2, align 8, !dbg !777
  %70 = getelementptr inbounds nuw %struct.object, ptr %69, i32 0, i32 21, !dbg !778
  %71 = getelementptr inbounds nuw %struct.physics_info, ptr %70, i32 0, i32 3, !dbg !779
  %72 = load i32, ptr %71, align 4, !dbg !779
  %73 = mul nsw i32 %72, 5, !dbg !780
  %74 = sdiv i32 %73, 2, !dbg !781
  store i32 %74, ptr %9, align 4, !dbg !782
  %75 = load ptr, ptr %2, align 8, !dbg !783
  %76 = getelementptr inbounds nuw %struct.object, ptr %75, i32 0, i32 21, !dbg !785
  %77 = getelementptr inbounds nuw %struct.physics_info, ptr %76, i32 0, i32 8, !dbg !786
  %78 = load i16, ptr %77, align 2, !dbg !786
  %79 = zext i16 %78 to i32, !dbg !783
  %80 = and i32 %79, 64, !dbg !787
  %81 = icmp ne i32 %80, 0, !dbg !783
  br i1 %81, label %82, label %121, !dbg !783

82:                                               ; preds = %62
  %83 = load ptr, ptr %2, align 8, !dbg !788
  %84 = getelementptr inbounds nuw %struct.object, ptr %83, i32 0, i32 21, !dbg !790
  %85 = getelementptr inbounds nuw %struct.physics_info, ptr %84, i32 0, i32 6, !dbg !791
  %86 = load ptr, ptr %2, align 8, !dbg !792
  %87 = getelementptr inbounds nuw %struct.object, ptr %86, i32 0, i32 21, !dbg !793
  %88 = getelementptr inbounds nuw %struct.physics_info, ptr %87, i32 0, i32 2, !dbg !794
  %89 = load i32, ptr %88, align 4, !dbg !794
  %90 = call noundef i32 @_Z6fixdivii(i32 noundef 65536, i32 noundef %89), !dbg !795
  %91 = call noundef ptr @_Z17vm_vec_copy_scaleP10vms_vectorS0_i(ptr noundef %8, ptr noundef %85, i32 noundef %90), !dbg !796
  br label %92, !dbg !797

92:                                               ; preds = %96, %82
  %93 = load i32, ptr %7, align 4, !dbg !798
  %94 = add nsw i32 %93, -1, !dbg !798
  store i32 %94, ptr %7, align 4, !dbg !798
  %95 = icmp ne i32 %93, 0, !dbg !799
  br i1 %95, label %96, label %107, !dbg !797

96:                                               ; preds = %92
  %97 = load ptr, ptr %2, align 8, !dbg !800
  %98 = getelementptr inbounds nuw %struct.object, ptr %97, i32 0, i32 21, !dbg !802
  %99 = getelementptr inbounds nuw %struct.physics_info, ptr %98, i32 0, i32 5, !dbg !803
  %100 = call noundef ptr @_Z11vm_vec_add2P10vms_vectorS0_(ptr noundef %99, ptr noundef %8), !dbg !804
  %101 = load ptr, ptr %2, align 8, !dbg !805
  %102 = getelementptr inbounds nuw %struct.object, ptr %101, i32 0, i32 21, !dbg !806
  %103 = getelementptr inbounds nuw %struct.physics_info, ptr %102, i32 0, i32 5, !dbg !807
  %104 = load i32, ptr %9, align 4, !dbg !808
  %105 = sub nsw i32 65536, %104, !dbg !809
  %106 = call noundef ptr @_Z12vm_vec_scaleP10vms_vectori(ptr noundef %103, i32 noundef %105), !dbg !810
  br label %92, !dbg !797, !llvm.loop !811

107:                                              ; preds = %92
  %108 = load ptr, ptr %2, align 8, !dbg !813
  %109 = getelementptr inbounds nuw %struct.object, ptr %108, i32 0, i32 21, !dbg !814
  %110 = getelementptr inbounds nuw %struct.physics_info, ptr %109, i32 0, i32 5, !dbg !815
  %111 = load i32, ptr %11, align 4, !dbg !816
  %112 = call noundef ptr @_Z17vm_vec_scale_add2P10vms_vectorS0_i(ptr noundef %110, ptr noundef %8, i32 noundef %111), !dbg !817
  %113 = load ptr, ptr %2, align 8, !dbg !818
  %114 = getelementptr inbounds nuw %struct.object, ptr %113, i32 0, i32 21, !dbg !819
  %115 = getelementptr inbounds nuw %struct.physics_info, ptr %114, i32 0, i32 5, !dbg !820
  %116 = load i32, ptr %11, align 4, !dbg !821
  %117 = load i32, ptr %9, align 4, !dbg !822
  %118 = call noundef i32 @_Z6fixmulii(i32 noundef %116, i32 noundef %117), !dbg !823
  %119 = sub nsw i32 65536, %118, !dbg !824
  %120 = call noundef ptr @_Z12vm_vec_scaleP10vms_vectori(ptr noundef %115, i32 noundef %119), !dbg !825
  br label %152, !dbg !826

121:                                              ; preds = %62
  %122 = load ptr, ptr %2, align 8, !dbg !827
  %123 = getelementptr inbounds nuw %struct.object, ptr %122, i32 0, i32 21, !dbg !829
  %124 = getelementptr inbounds nuw %struct.physics_info, ptr %123, i32 0, i32 8, !dbg !830
  %125 = load i16, ptr %124, align 2, !dbg !830
  %126 = zext i16 %125 to i32, !dbg !827
  %127 = and i32 %126, 256, !dbg !831
  %128 = icmp ne i32 %127, 0, !dbg !832
  br i1 %128, label %151, label %129, !dbg !833

129:                                              ; preds = %121
    #dbg_declare(ptr %12, !834, !DIExpression(), !836)
  store i32 65536, ptr %12, align 4, !dbg !836
  br label %130, !dbg !837

130:                                              ; preds = %134, %129
  %131 = load i32, ptr %7, align 4, !dbg !838
  %132 = add nsw i32 %131, -1, !dbg !838
  store i32 %132, ptr %7, align 4, !dbg !838
  %133 = icmp ne i32 %131, 0, !dbg !839
  br i1 %133, label %134, label %139, !dbg !837

134:                                              ; preds = %130
  %135 = load i32, ptr %12, align 4, !dbg !840
  %136 = load i32, ptr %9, align 4, !dbg !841
  %137 = sub nsw i32 65536, %136, !dbg !842
  %138 = call noundef i32 @_Z6fixmulii(i32 noundef %135, i32 noundef %137), !dbg !843
  store i32 %138, ptr %12, align 4, !dbg !844
  br label %130, !dbg !837, !llvm.loop !845

139:                                              ; preds = %130
  %140 = load i32, ptr %12, align 4, !dbg !847
  %141 = load i32, ptr %11, align 4, !dbg !848
  %142 = load i32, ptr %9, align 4, !dbg !849
  %143 = call noundef i32 @_Z6fixmulii(i32 noundef %141, i32 noundef %142), !dbg !850
  %144 = sub nsw i32 65536, %143, !dbg !851
  %145 = call noundef i32 @_Z6fixmulii(i32 noundef %140, i32 noundef %144), !dbg !852
  store i32 %145, ptr %12, align 4, !dbg !853
  %146 = load ptr, ptr %2, align 8, !dbg !854
  %147 = getelementptr inbounds nuw %struct.object, ptr %146, i32 0, i32 21, !dbg !855
  %148 = getelementptr inbounds nuw %struct.physics_info, ptr %147, i32 0, i32 5, !dbg !856
  %149 = load i32, ptr %12, align 4, !dbg !857
  %150 = call noundef ptr @_Z12vm_vec_scaleP10vms_vectori(ptr noundef %148, i32 noundef %149), !dbg !858
  br label %151, !dbg !859

151:                                              ; preds = %139, %121
  br label %152

152:                                              ; preds = %151, %107
  br label %153, !dbg !860

153:                                              ; preds = %152, %56
  %154 = load ptr, ptr %2, align 8, !dbg !861
  %155 = getelementptr inbounds nuw %struct.object, ptr %154, i32 0, i32 21, !dbg !863
  %156 = getelementptr inbounds nuw %struct.physics_info, ptr %155, i32 0, i32 7, !dbg !864
  %157 = load i16, ptr %156, align 4, !dbg !864
  %158 = icmp ne i16 %157, 0, !dbg !861
  br i1 %158, label %159, label %176, !dbg !861

159:                                              ; preds = %153
    #dbg_declare(ptr %13, !865, !DIExpression(), !867)
  %160 = getelementptr inbounds nuw %struct.vms_angvec, ptr %3, i32 0, i32 2, !dbg !868
  store i16 0, ptr %160, align 2, !dbg !869
  %161 = getelementptr inbounds nuw %struct.vms_angvec, ptr %3, i32 0, i32 0, !dbg !870
  store i16 0, ptr %161, align 2, !dbg !871
  %162 = load ptr, ptr %2, align 8, !dbg !872
  %163 = getelementptr inbounds nuw %struct.object, ptr %162, i32 0, i32 21, !dbg !873
  %164 = getelementptr inbounds nuw %struct.physics_info, ptr %163, i32 0, i32 7, !dbg !874
  %165 = load i16, ptr %164, align 4, !dbg !874
  %166 = sext i16 %165 to i32, !dbg !872
  %167 = sub nsw i32 0, %166, !dbg !875
  %168 = trunc i32 %167 to i16, !dbg !875
  %169 = getelementptr inbounds nuw %struct.vms_angvec, ptr %3, i32 0, i32 1, !dbg !876
  store i16 %168, ptr %169, align 2, !dbg !877
  %170 = call noundef ptr @_Z18vm_angles_2_matrixP10vms_matrixP10vms_angvec(ptr noundef %4, ptr noundef %3), !dbg !878
  %171 = load ptr, ptr %2, align 8, !dbg !879
  %172 = getelementptr inbounds nuw %struct.object, ptr %171, i32 0, i32 12, !dbg !880
  %173 = call noundef ptr @_Z18vm_matrix_x_matrixP10vms_matrixS0_S0_(ptr noundef %13, ptr noundef %172, ptr noundef %4), !dbg !881
  %174 = load ptr, ptr %2, align 8, !dbg !882
  %175 = getelementptr inbounds nuw %struct.object, ptr %174, i32 0, i32 12, !dbg !883
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %175, ptr align 4 %13, i64 36, i1 false), !dbg !884
  br label %176, !dbg !885

176:                                              ; preds = %159, %153
  %177 = load ptr, ptr %2, align 8, !dbg !886
  %178 = getelementptr inbounds nuw %struct.object, ptr %177, i32 0, i32 21, !dbg !887
  %179 = getelementptr inbounds nuw %struct.physics_info, ptr %178, i32 0, i32 5, !dbg !888
  %180 = getelementptr inbounds nuw %struct.vms_vector, ptr %179, i32 0, i32 0, !dbg !889
  %181 = load i32, ptr %180, align 4, !dbg !889
  %182 = load i32, ptr @FrameTime, align 4, !dbg !890
  %183 = call noundef i32 @_Z6fixmulii(i32 noundef %181, i32 noundef %182), !dbg !891
  %184 = trunc i32 %183 to i16, !dbg !891
  %185 = getelementptr inbounds nuw %struct.vms_angvec, ptr %3, i32 0, i32 0, !dbg !892
  store i16 %184, ptr %185, align 2, !dbg !893
  %186 = load ptr, ptr %2, align 8, !dbg !894
  %187 = getelementptr inbounds nuw %struct.object, ptr %186, i32 0, i32 21, !dbg !895
  %188 = getelementptr inbounds nuw %struct.physics_info, ptr %187, i32 0, i32 5, !dbg !896
  %189 = getelementptr inbounds nuw %struct.vms_vector, ptr %188, i32 0, i32 1, !dbg !897
  %190 = load i32, ptr %189, align 4, !dbg !897
  %191 = load i32, ptr @FrameTime, align 4, !dbg !898
  %192 = call noundef i32 @_Z6fixmulii(i32 noundef %190, i32 noundef %191), !dbg !899
  %193 = trunc i32 %192 to i16, !dbg !899
  %194 = getelementptr inbounds nuw %struct.vms_angvec, ptr %3, i32 0, i32 2, !dbg !900
  store i16 %193, ptr %194, align 2, !dbg !901
  %195 = load ptr, ptr %2, align 8, !dbg !902
  %196 = getelementptr inbounds nuw %struct.object, ptr %195, i32 0, i32 21, !dbg !903
  %197 = getelementptr inbounds nuw %struct.physics_info, ptr %196, i32 0, i32 5, !dbg !904
  %198 = getelementptr inbounds nuw %struct.vms_vector, ptr %197, i32 0, i32 2, !dbg !905
  %199 = load i32, ptr %198, align 4, !dbg !905
  %200 = load i32, ptr @FrameTime, align 4, !dbg !906
  %201 = call noundef i32 @_Z6fixmulii(i32 noundef %199, i32 noundef %200), !dbg !907
  %202 = trunc i32 %201 to i16, !dbg !907
  %203 = getelementptr inbounds nuw %struct.vms_angvec, ptr %3, i32 0, i32 1, !dbg !908
  store i16 %202, ptr %203, align 2, !dbg !909
  %204 = call noundef ptr @_Z18vm_angles_2_matrixP10vms_matrixP10vms_angvec(ptr noundef %4, ptr noundef %3), !dbg !910
  %205 = load ptr, ptr %2, align 8, !dbg !911
  %206 = getelementptr inbounds nuw %struct.object, ptr %205, i32 0, i32 12, !dbg !912
  %207 = call noundef ptr @_Z18vm_matrix_x_matrixP10vms_matrixS0_S0_(ptr noundef %5, ptr noundef %206, ptr noundef %4), !dbg !913
  %208 = load ptr, ptr %2, align 8, !dbg !914
  %209 = getelementptr inbounds nuw %struct.object, ptr %208, i32 0, i32 12, !dbg !915
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %209, ptr align 4 %5, i64 36, i1 false), !dbg !916
  %210 = load ptr, ptr %2, align 8, !dbg !917
  %211 = getelementptr inbounds nuw %struct.object, ptr %210, i32 0, i32 21, !dbg !919
  %212 = getelementptr inbounds nuw %struct.physics_info, ptr %211, i32 0, i32 8, !dbg !920
  %213 = load i16, ptr %212, align 2, !dbg !920
  %214 = zext i16 %213 to i32, !dbg !917
  %215 = and i32 %214, 1, !dbg !921
  %216 = icmp ne i32 %215, 0, !dbg !917
  br i1 %216, label %217, label %219, !dbg !917

217:                                              ; preds = %176
  %218 = load ptr, ptr %2, align 8, !dbg !922
  call void @_Z19set_object_turnrollP6object(ptr noundef %218), !dbg !923
  br label %219, !dbg !923

219:                                              ; preds = %217, %176
  %220 = load ptr, ptr %2, align 8, !dbg !924
  %221 = getelementptr inbounds nuw %struct.object, ptr %220, i32 0, i32 21, !dbg !926
  %222 = getelementptr inbounds nuw %struct.physics_info, ptr %221, i32 0, i32 7, !dbg !927
  %223 = load i16, ptr %222, align 4, !dbg !927
  %224 = icmp ne i16 %223, 0, !dbg !924
  br i1 %224, label %225, label %239, !dbg !924

225:                                              ; preds = %219
    #dbg_declare(ptr %14, !928, !DIExpression(), !930)
  %226 = getelementptr inbounds nuw %struct.vms_angvec, ptr %3, i32 0, i32 2, !dbg !931
  store i16 0, ptr %226, align 2, !dbg !932
  %227 = getelementptr inbounds nuw %struct.vms_angvec, ptr %3, i32 0, i32 0, !dbg !933
  store i16 0, ptr %227, align 2, !dbg !934
  %228 = load ptr, ptr %2, align 8, !dbg !935
  %229 = getelementptr inbounds nuw %struct.object, ptr %228, i32 0, i32 21, !dbg !936
  %230 = getelementptr inbounds nuw %struct.physics_info, ptr %229, i32 0, i32 7, !dbg !937
  %231 = load i16, ptr %230, align 4, !dbg !937
  %232 = getelementptr inbounds nuw %struct.vms_angvec, ptr %3, i32 0, i32 1, !dbg !938
  store i16 %231, ptr %232, align 2, !dbg !939
  %233 = call noundef ptr @_Z18vm_angles_2_matrixP10vms_matrixP10vms_angvec(ptr noundef %4, ptr noundef %3), !dbg !940
  %234 = load ptr, ptr %2, align 8, !dbg !941
  %235 = getelementptr inbounds nuw %struct.object, ptr %234, i32 0, i32 12, !dbg !942
  %236 = call noundef ptr @_Z18vm_matrix_x_matrixP10vms_matrixS0_S0_(ptr noundef %14, ptr noundef %235, ptr noundef %4), !dbg !943
  %237 = load ptr, ptr %2, align 8, !dbg !944
  %238 = getelementptr inbounds nuw %struct.object, ptr %237, i32 0, i32 12, !dbg !945
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %238, ptr align 4 %14, i64 36, i1 false), !dbg !946
  br label %239, !dbg !947

239:                                              ; preds = %225, %219
  %240 = load ptr, ptr %2, align 8, !dbg !948
  %241 = getelementptr inbounds nuw %struct.object, ptr %240, i32 0, i32 12, !dbg !949
  call void @_Z20check_and_fix_matrixP10vms_matrix(ptr noundef %241), !dbg !950
  br label %242, !dbg !951

242:                                              ; preds = %239, %55
  ret void, !dbg !951
}

declare void @_Z7_AssertiPKcS0_i(i32 noundef, ptr noundef, ptr noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z6fixdivii(i32 noundef %0, i32 noundef %1) #4 !dbg !952 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
    #dbg_declare(ptr %4, !953, !DIExpression(), !954)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !955, !DIExpression(), !956)
  %6 = load i32, ptr %5, align 4, !dbg !957
  %7 = icmp eq i32 %6, 0, !dbg !959
  br i1 %7, label %8, label %9, !dbg !959

8:                                                ; preds = %2
  store i32 1, ptr %3, align 4, !dbg !960
  br label %17, !dbg !960

9:                                                ; preds = %2
  %10 = load i32, ptr %4, align 4, !dbg !961
  %11 = sext i32 %10 to i64, !dbg !961
  %12 = shl i64 %11, 16, !dbg !962
  %13 = load i32, ptr %5, align 4, !dbg !963
  %14 = sext i32 %13 to i64, !dbg !963
  %15 = sdiv i64 %12, %14, !dbg !964
  %16 = trunc i64 %15 to i32, !dbg !965
  store i32 %16, ptr %3, align 4, !dbg !966
  br label %17, !dbg !966

17:                                               ; preds = %9, %8
  %18 = load i32, ptr %3, align 4, !dbg !967
  ret i32 %18, !dbg !967
}

declare noundef ptr @_Z17vm_vec_copy_scaleP10vms_vectorS0_i(ptr noundef, ptr noundef, i32 noundef) #1

declare noundef ptr @_Z11vm_vec_add2P10vms_vectorS0_(ptr noundef, ptr noundef) #1

declare noundef ptr @_Z12vm_vec_scaleP10vms_vectori(ptr noundef, i32 noundef) #1

declare noundef ptr @_Z17vm_vec_scale_add2P10vms_vectorS0_i(ptr noundef, ptr noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z14do_physics_simP6object(ptr noundef %0) #0 !dbg !262 {
  %2 = alloca ptr, align 8
  %3 = alloca [100 x i32], align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca %struct.vms_vector, align 4
  %9 = alloca %struct.vms_vector, align 4
  %10 = alloca %struct.vms_vector, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca %struct.fvi_info, align 4
  %16 = alloca %struct.fvi_query, align 8
  %17 = alloca %struct.vms_vector, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca %struct.vms_vector, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca %struct.vms_vector, align 4
  %26 = alloca %struct.vms_vector, align 4
  %27 = alloca ptr, align 8
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca %struct.segmasks, align 2
  %31 = alloca i32, align 4
  %32 = alloca %struct.vms_vector, align 4
  %33 = alloca i32, align 4
  %34 = alloca i32, align 4
  %35 = alloca i32, align 4
  %36 = alloca ptr, align 8
  %37 = alloca i32, align 4
  %38 = alloca %struct.segmasks, align 2
  %39 = alloca i32, align 4
  %40 = alloca %struct.vms_vector, align 4
  %41 = alloca i32, align 4
  %42 = alloca i32, align 4
  %43 = alloca %struct.vms_vector, align 4
  %44 = alloca i32, align 4
  %45 = alloca i32, align 4
  %46 = alloca i32, align 4
  %47 = alloca i32, align 4
  %48 = alloca i32, align 4
  %49 = alloca %struct.vms_vector, align 4
  %50 = alloca ptr, align 8
  %51 = alloca ptr, align 8
  %52 = alloca %struct.vms_vector, align 4
  %53 = alloca i32, align 4
  %54 = alloca i32, align 4
  %55 = alloca %struct.vms_vector, align 4
  %56 = alloca %struct.vms_vector, align 4
  %57 = alloca %struct.vms_vector, align 4
  %58 = alloca i32, align 4
  %59 = alloca ptr, align 8
  %60 = alloca i32, align 4
  %61 = alloca i32, align 4
  %62 = alloca i32, align 4
  %63 = alloca i32, align 4
  %64 = alloca [6 x i32], align 4
  %65 = alloca %struct.segmasks, align 2
  %66 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !968, !DIExpression(), !969)
    #dbg_declare(ptr %3, !970, !DIExpression(), !972)
    #dbg_declare(ptr %4, !973, !DIExpression(), !974)
    #dbg_declare(ptr %5, !975, !DIExpression(), !976)
    #dbg_declare(ptr %6, !977, !DIExpression(), !978)
    #dbg_declare(ptr %7, !979, !DIExpression(), !980)
    #dbg_declare(ptr %8, !981, !DIExpression(), !982)
    #dbg_declare(ptr %9, !983, !DIExpression(), !984)
    #dbg_declare(ptr %10, !985, !DIExpression(), !986)
    #dbg_declare(ptr %11, !987, !DIExpression(), !988)
  store i32 0, ptr %11, align 4, !dbg !988
    #dbg_declare(ptr %12, !989, !DIExpression(), !990)
    #dbg_declare(ptr %13, !991, !DIExpression(), !992)
    #dbg_declare(ptr %14, !993, !DIExpression(), !994)
    #dbg_declare(ptr %15, !995, !DIExpression(), !1009)
    #dbg_declare(ptr %16, !1010, !DIExpression(), !1023)
    #dbg_declare(ptr %17, !1024, !DIExpression(), !1025)
    #dbg_declare(ptr %18, !1026, !DIExpression(), !1027)
    #dbg_declare(ptr %19, !1028, !DIExpression(), !1029)
    #dbg_declare(ptr %20, !1030, !DIExpression(), !1031)
    #dbg_declare(ptr %21, !1032, !DIExpression(), !1033)
    #dbg_declare(ptr %22, !1034, !DIExpression(), !1035)
    #dbg_declare(ptr %23, !1036, !DIExpression(), !1037)
  store i32 0, ptr %23, align 4, !dbg !1037
    #dbg_declare(ptr %24, !1038, !DIExpression(), !1039)
    #dbg_declare(ptr %25, !1040, !DIExpression(), !1041)
    #dbg_declare(ptr %26, !1042, !DIExpression(), !1043)
    #dbg_declare(ptr %27, !1044, !DIExpression(), !1045)
    #dbg_declare(ptr %28, !1046, !DIExpression(), !1047)
  %67 = load ptr, ptr %2, align 8, !dbg !1048
  %68 = getelementptr inbounds nuw %struct.object, ptr %67, i32 0, i32 9, !dbg !1049
  %69 = load i16, ptr %68, align 2, !dbg !1049
  %70 = sext i16 %69 to i32, !dbg !1048
  store i32 %70, ptr %28, align 4, !dbg !1047
    #dbg_declare(ptr %29, !1050, !DIExpression(), !1051)
  store i32 0, ptr %29, align 4, !dbg !1051
  %71 = load ptr, ptr %2, align 8, !dbg !1052
  %72 = getelementptr inbounds nuw %struct.object, ptr %71, i32 0, i32 1, !dbg !1052
  %73 = load i8, ptr %72, align 4, !dbg !1052
  %74 = zext i8 %73 to i32, !dbg !1052
  %75 = icmp ne i32 %74, 255, !dbg !1052
  %76 = zext i1 %75 to i32, !dbg !1052
  call void @_Z7_AssertiPKcS0_i(i32 noundef %76, ptr noundef @.str.2, ptr noundef @.str.1, i32 noundef 972), !dbg !1052
  %77 = load ptr, ptr %2, align 8, !dbg !1053
  %78 = getelementptr inbounds nuw %struct.object, ptr %77, i32 0, i32 6, !dbg !1053
  %79 = load i8, ptr %78, align 1, !dbg !1053
  %80 = zext i8 %79 to i32, !dbg !1053
  %81 = icmp eq i32 %80, 1, !dbg !1053
  %82 = zext i1 %81 to i32, !dbg !1053
  call void @_Z7_AssertiPKcS0_i(i32 noundef %82, ptr noundef @.str.3, ptr noundef @.str.1, i32 noundef 973), !dbg !1053
  %83 = load i32, ptr @Dont_move_ai_objects, align 4, !dbg !1054
  %84 = icmp ne i32 %83, 0, !dbg !1054
  br i1 %84, label %85, label %93, !dbg !1054

85:                                               ; preds = %1
  %86 = load ptr, ptr %2, align 8, !dbg !1056
  %87 = getelementptr inbounds nuw %struct.object, ptr %86, i32 0, i32 5, !dbg !1058
  %88 = load i8, ptr %87, align 2, !dbg !1058
  %89 = zext i8 %88 to i32, !dbg !1056
  %90 = icmp eq i32 %89, 1, !dbg !1059
  br i1 %90, label %91, label %92, !dbg !1059

91:                                               ; preds = %85
  br label %1601, !dbg !1060

92:                                               ; preds = %85
  br label %93, !dbg !1061

93:                                               ; preds = %92, %1
  %94 = load ptr, ptr %2, align 8, !dbg !1062
  %95 = getelementptr inbounds nuw %struct.object, ptr %94, i32 0, i32 21, !dbg !1063
  store ptr %95, ptr %27, align 8, !dbg !1064
  %96 = load ptr, ptr %2, align 8, !dbg !1065
  call void @_Z18do_physics_sim_rotP6object(ptr noundef %96), !dbg !1066
  %97 = load ptr, ptr %27, align 8, !dbg !1067
  %98 = getelementptr inbounds nuw %struct.physics_info, ptr %97, i32 0, i32 0, !dbg !1069
  %99 = getelementptr inbounds nuw %struct.vms_vector, ptr %98, i32 0, i32 0, !dbg !1070
  %100 = load i32, ptr %99, align 4, !dbg !1070
  %101 = icmp ne i32 %100, 0, !dbg !1067
  br i1 %101, label %133, label %102, !dbg !1071

102:                                              ; preds = %93
  %103 = load ptr, ptr %27, align 8, !dbg !1072
  %104 = getelementptr inbounds nuw %struct.physics_info, ptr %103, i32 0, i32 0, !dbg !1073
  %105 = getelementptr inbounds nuw %struct.vms_vector, ptr %104, i32 0, i32 1, !dbg !1074
  %106 = load i32, ptr %105, align 4, !dbg !1074
  %107 = icmp ne i32 %106, 0, !dbg !1072
  br i1 %107, label %133, label %108, !dbg !1075

108:                                              ; preds = %102
  %109 = load ptr, ptr %27, align 8, !dbg !1076
  %110 = getelementptr inbounds nuw %struct.physics_info, ptr %109, i32 0, i32 0, !dbg !1077
  %111 = getelementptr inbounds nuw %struct.vms_vector, ptr %110, i32 0, i32 2, !dbg !1078
  %112 = load i32, ptr %111, align 4, !dbg !1078
  %113 = icmp ne i32 %112, 0, !dbg !1076
  br i1 %113, label %133, label %114, !dbg !1079

114:                                              ; preds = %108
  %115 = load ptr, ptr %27, align 8, !dbg !1080
  %116 = getelementptr inbounds nuw %struct.physics_info, ptr %115, i32 0, i32 1, !dbg !1081
  %117 = getelementptr inbounds nuw %struct.vms_vector, ptr %116, i32 0, i32 0, !dbg !1082
  %118 = load i32, ptr %117, align 4, !dbg !1082
  %119 = icmp ne i32 %118, 0, !dbg !1080
  br i1 %119, label %133, label %120, !dbg !1083

120:                                              ; preds = %114
  %121 = load ptr, ptr %27, align 8, !dbg !1084
  %122 = getelementptr inbounds nuw %struct.physics_info, ptr %121, i32 0, i32 1, !dbg !1085
  %123 = getelementptr inbounds nuw %struct.vms_vector, ptr %122, i32 0, i32 1, !dbg !1086
  %124 = load i32, ptr %123, align 4, !dbg !1086
  %125 = icmp ne i32 %124, 0, !dbg !1084
  br i1 %125, label %133, label %126, !dbg !1087

126:                                              ; preds = %120
  %127 = load ptr, ptr %27, align 8, !dbg !1088
  %128 = getelementptr inbounds nuw %struct.physics_info, ptr %127, i32 0, i32 1, !dbg !1089
  %129 = getelementptr inbounds nuw %struct.vms_vector, ptr %128, i32 0, i32 2, !dbg !1090
  %130 = load i32, ptr %129, align 4, !dbg !1090
  %131 = icmp ne i32 %130, 0, !dbg !1088
  br i1 %131, label %133, label %132, !dbg !1091

132:                                              ; preds = %126
  br label %1601, !dbg !1092

133:                                              ; preds = %126, %120, %114, %108, %102, %93
  %134 = load ptr, ptr %2, align 8, !dbg !1093
  %135 = ptrtoint ptr %134 to i64, !dbg !1094
  %136 = sub i64 %135, ptrtoint (ptr @Objects to i64), !dbg !1094
  %137 = sdiv exact i64 %136, 268, !dbg !1094
  %138 = trunc i64 %137 to i32, !dbg !1093
  store i32 %138, ptr %12, align 4, !dbg !1095
  store i32 0, ptr @n_phys_segs, align 4, !dbg !1096
  %139 = load ptr, ptr %2, align 8, !dbg !1097
  %140 = getelementptr inbounds nuw %struct.object, ptr %139, i32 0, i32 1, !dbg !1098
  %141 = load i8, ptr %140, align 4, !dbg !1098
  %142 = zext i8 %141 to i32, !dbg !1097
  %143 = icmp ne i32 %142, 4, !dbg !1099
  %144 = zext i1 %143 to i32, !dbg !1100
  store i32 %144, ptr @disable_new_fvi_stuff, align 4, !dbg !1101
  %145 = load i32, ptr @FrameTime, align 4, !dbg !1102
  store i32 %145, ptr %20, align 4, !dbg !1103
  %146 = load ptr, ptr %2, align 8, !dbg !1104
  %147 = load ptr, ptr @debug_obj, align 8, !dbg !1106
  %148 = icmp eq ptr %146, %147, !dbg !1107
  br i1 %148, label %149, label %182, !dbg !1107

149:                                              ; preds = %133
  %150 = load i32, ptr %12, align 4, !dbg !1108
  %151 = load ptr, ptr %2, align 8, !dbg !1110
  %152 = getelementptr inbounds nuw %struct.object, ptr %151, i32 0, i32 11, !dbg !1110
  %153 = getelementptr inbounds nuw %struct.vms_vector, ptr %152, i32 0, i32 0, !dbg !1110
  %154 = load i32, ptr %153, align 4, !dbg !1110
  %155 = load ptr, ptr %2, align 8, !dbg !1110
  %156 = getelementptr inbounds nuw %struct.object, ptr %155, i32 0, i32 11, !dbg !1110
  %157 = getelementptr inbounds nuw %struct.vms_vector, ptr %156, i32 0, i32 1, !dbg !1110
  %158 = load i32, ptr %157, align 4, !dbg !1110
  %159 = load ptr, ptr %2, align 8, !dbg !1110
  %160 = getelementptr inbounds nuw %struct.object, ptr %159, i32 0, i32 11, !dbg !1110
  %161 = getelementptr inbounds nuw %struct.vms_vector, ptr %160, i32 0, i32 2, !dbg !1110
  %162 = load i32, ptr %161, align 4, !dbg !1110
  %163 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %150, i32 noundef %154, i32 noundef %158, i32 noundef %162), !dbg !1111
  %164 = load ptr, ptr %2, align 8, !dbg !1112
  %165 = getelementptr inbounds nuw %struct.object, ptr %164, i32 0, i32 21, !dbg !1112
  %166 = getelementptr inbounds nuw %struct.physics_info, ptr %165, i32 0, i32 1, !dbg !1112
  %167 = getelementptr inbounds nuw %struct.vms_vector, ptr %166, i32 0, i32 0, !dbg !1112
  %168 = load i32, ptr %167, align 4, !dbg !1112
  %169 = load ptr, ptr %2, align 8, !dbg !1112
  %170 = getelementptr inbounds nuw %struct.object, ptr %169, i32 0, i32 21, !dbg !1112
  %171 = getelementptr inbounds nuw %struct.physics_info, ptr %170, i32 0, i32 1, !dbg !1112
  %172 = getelementptr inbounds nuw %struct.vms_vector, ptr %171, i32 0, i32 1, !dbg !1112
  %173 = load i32, ptr %172, align 4, !dbg !1112
  %174 = load ptr, ptr %2, align 8, !dbg !1112
  %175 = getelementptr inbounds nuw %struct.object, ptr %174, i32 0, i32 21, !dbg !1112
  %176 = getelementptr inbounds nuw %struct.physics_info, ptr %175, i32 0, i32 1, !dbg !1112
  %177 = getelementptr inbounds nuw %struct.vms_vector, ptr %176, i32 0, i32 2, !dbg !1112
  %178 = load i32, ptr %177, align 4, !dbg !1112
  %179 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %168, i32 noundef %173, i32 noundef %178), !dbg !1113
  %180 = load i32, ptr %20, align 4, !dbg !1114
  %181 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %180), !dbg !1115
  br label %182, !dbg !1116

182:                                              ; preds = %149, %133
  %183 = load ptr, ptr %2, align 8, !dbg !1117
  %184 = getelementptr inbounds nuw %struct.object, ptr %183, i32 0, i32 11, !dbg !1119
  %185 = load ptr, ptr %2, align 8, !dbg !1120
  %186 = getelementptr inbounds nuw %struct.object, ptr %185, i32 0, i32 9, !dbg !1121
  %187 = load i16, ptr %186, align 2, !dbg !1121
  %188 = sext i16 %187 to i32, !dbg !1120
  %189 = call i32 @_Z13get_seg_masksP10vms_vectorii(ptr noundef %184, i32 noundef %188, i32 noundef 0), !dbg !1122
  store i32 %189, ptr %30, align 2, !dbg !1122
  %190 = getelementptr inbounds nuw %struct.segmasks, ptr %30, i32 0, i32 2, !dbg !1123
  %191 = load i8, ptr %190, align 1, !dbg !1123
  %192 = icmp ne i8 %191, 0, !dbg !1122
  %193 = xor i1 %192, true, !dbg !1124
  %194 = zext i1 %193 to i32, !dbg !1124
  %195 = icmp eq i32 %194, 0, !dbg !1125
  br i1 %195, label %196, label %222, !dbg !1124

196:                                              ; preds = %182
  %197 = load i32, ptr %12, align 4, !dbg !1126
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.7, i32 noundef %197), !dbg !1126
  %198 = load ptr, ptr %2, align 8, !dbg !1128
  %199 = call noundef i32 @_Z17update_object_segP6object(ptr noundef %198), !dbg !1130
  %200 = icmp ne i32 %199, 0, !dbg !1130
  br i1 %200, label %221, label %201, !dbg !1131

201:                                              ; preds = %196
  %202 = load i32, ptr %12, align 4, !dbg !1132
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.8, i32 noundef %202), !dbg !1132
  %203 = load i32, ptr @Game_mode, align 4, !dbg !1134
  %204 = and i32 %203, 38, !dbg !1136
  %205 = icmp ne i32 %204, 0, !dbg !1137
  br i1 %205, label %207, label %206, !dbg !1138

206:                                              ; preds = %201
  call void @_Z4Int3v(), !dbg !1139
  br label %207, !dbg !1139

207:                                              ; preds = %206, %201
  %208 = load ptr, ptr %2, align 8, !dbg !1140
  %209 = getelementptr inbounds nuw %struct.object, ptr %208, i32 0, i32 11, !dbg !1141
  %210 = load ptr, ptr %2, align 8, !dbg !1142
  %211 = getelementptr inbounds nuw %struct.object, ptr %210, i32 0, i32 9, !dbg !1143
  %212 = load i16, ptr %211, align 2, !dbg !1143
  %213 = sext i16 %212 to i64, !dbg !1144
  %214 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %213, !dbg !1144
  call void @_Z22compute_segment_centerP10vms_vectorP7segment(ptr noundef %209, ptr noundef %214), !dbg !1145
  %215 = load i32, ptr %12, align 4, !dbg !1146
  %216 = load ptr, ptr %2, align 8, !dbg !1147
  %217 = getelementptr inbounds nuw %struct.object, ptr %216, i32 0, i32 11, !dbg !1148
  %218 = getelementptr inbounds nuw %struct.vms_vector, ptr %217, i32 0, i32 0, !dbg !1149
  %219 = load i32, ptr %218, align 4, !dbg !1150
  %220 = add nsw i32 %219, %215, !dbg !1150
  store i32 %220, ptr %218, align 4, !dbg !1150
  br label %221, !dbg !1151

221:                                              ; preds = %207, %196
  br label %222, !dbg !1152

222:                                              ; preds = %221, %182
  %223 = load ptr, ptr %2, align 8, !dbg !1153
  %224 = getelementptr inbounds nuw %struct.object, ptr %223, i32 0, i32 11, !dbg !1154
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %22, ptr align 4 %224, i64 12, i1 false), !dbg !1155
  store i32 0, ptr %4, align 4, !dbg !1156
  %225 = load ptr, ptr %2, align 8, !dbg !1157
  %226 = getelementptr inbounds nuw %struct.object, ptr %225, i32 0, i32 21, !dbg !1157
  %227 = getelementptr inbounds nuw %struct.physics_info, ptr %226, i32 0, i32 4, !dbg !1157
  %228 = load i32, ptr %227, align 4, !dbg !1157
  %229 = icmp eq i32 %228, 0, !dbg !1157
  %230 = zext i1 %229 to i32, !dbg !1157
  call void @_Z7_AssertiPKcS0_i(i32 noundef %230, ptr noundef @.str.9, ptr noundef @.str.1, i32 noundef 1027), !dbg !1157
  %231 = load ptr, ptr %2, align 8, !dbg !1158
  %232 = getelementptr inbounds nuw %struct.object, ptr %231, i32 0, i32 21, !dbg !1158
  %233 = getelementptr inbounds nuw %struct.physics_info, ptr %232, i32 0, i32 8, !dbg !1158
  %234 = load i16, ptr %233, align 2, !dbg !1158
  %235 = zext i16 %234 to i32, !dbg !1158
  %236 = and i32 %235, 64, !dbg !1158
  %237 = icmp ne i32 %236, 0, !dbg !1158
  br i1 %237, label %238, label %244, !dbg !1158

238:                                              ; preds = %222
  %239 = load ptr, ptr %2, align 8, !dbg !1158
  %240 = getelementptr inbounds nuw %struct.object, ptr %239, i32 0, i32 21, !dbg !1158
  %241 = getelementptr inbounds nuw %struct.physics_info, ptr %240, i32 0, i32 3, !dbg !1158
  %242 = load i32, ptr %241, align 4, !dbg !1158
  %243 = icmp ne i32 %242, 0, !dbg !1158
  br label %244, !dbg !1158

244:                                              ; preds = %238, %222
  %245 = phi i1 [ true, %222 ], [ %243, %238 ]
  %246 = zext i1 %245 to i32, !dbg !1158
  call void @_Z7_AssertiPKcS0_i(i32 noundef %246, ptr noundef @.str.10, ptr noundef @.str.1, i32 noundef 1030), !dbg !1158
  %247 = load ptr, ptr %2, align 8, !dbg !1159
  %248 = getelementptr inbounds nuw %struct.object, ptr %247, i32 0, i32 21, !dbg !1161
  %249 = getelementptr inbounds nuw %struct.physics_info, ptr %248, i32 0, i32 3, !dbg !1162
  %250 = load i32, ptr %249, align 4, !dbg !1162
  store i32 %250, ptr %19, align 4, !dbg !1163
  %251 = icmp ne i32 %250, 0, !dbg !1164
  br i1 %251, label %252, label %328, !dbg !1164

252:                                              ; preds = %244
    #dbg_declare(ptr %31, !1165, !DIExpression(), !1167)
    #dbg_declare(ptr %32, !1168, !DIExpression(), !1169)
    #dbg_declare(ptr %33, !1170, !DIExpression(), !1171)
    #dbg_declare(ptr %34, !1172, !DIExpression(), !1173)
  %253 = load i32, ptr %20, align 4, !dbg !1174
  %254 = sdiv i32 %253, 1024, !dbg !1175
  store i32 %254, ptr %31, align 4, !dbg !1176
  %255 = load i32, ptr %20, align 4, !dbg !1177
  %256 = srem i32 %255, 1024, !dbg !1178
  store i32 %256, ptr %33, align 4, !dbg !1179
  %257 = load i32, ptr %33, align 4, !dbg !1180
  %258 = call noundef i32 @_Z6fixdivii(i32 noundef %257, i32 noundef 1024), !dbg !1181
  store i32 %258, ptr %34, align 4, !dbg !1182
  %259 = load ptr, ptr %2, align 8, !dbg !1183
  %260 = getelementptr inbounds nuw %struct.object, ptr %259, i32 0, i32 21, !dbg !1185
  %261 = getelementptr inbounds nuw %struct.physics_info, ptr %260, i32 0, i32 8, !dbg !1186
  %262 = load i16, ptr %261, align 2, !dbg !1186
  %263 = zext i16 %262 to i32, !dbg !1183
  %264 = and i32 %263, 64, !dbg !1187
  %265 = icmp ne i32 %264, 0, !dbg !1183
  br i1 %265, label %266, label %305, !dbg !1183

266:                                              ; preds = %252
  %267 = load ptr, ptr %2, align 8, !dbg !1188
  %268 = getelementptr inbounds nuw %struct.object, ptr %267, i32 0, i32 21, !dbg !1190
  %269 = getelementptr inbounds nuw %struct.physics_info, ptr %268, i32 0, i32 1, !dbg !1191
  %270 = load ptr, ptr %2, align 8, !dbg !1192
  %271 = getelementptr inbounds nuw %struct.object, ptr %270, i32 0, i32 21, !dbg !1193
  %272 = getelementptr inbounds nuw %struct.physics_info, ptr %271, i32 0, i32 2, !dbg !1194
  %273 = load i32, ptr %272, align 4, !dbg !1194
  %274 = call noundef i32 @_Z6fixdivii(i32 noundef 65536, i32 noundef %273), !dbg !1195
  %275 = call noundef ptr @_Z17vm_vec_copy_scaleP10vms_vectorS0_i(ptr noundef %32, ptr noundef %269, i32 noundef %274), !dbg !1196
  br label %276, !dbg !1197

276:                                              ; preds = %280, %266
  %277 = load i32, ptr %31, align 4, !dbg !1198
  %278 = add nsw i32 %277, -1, !dbg !1198
  store i32 %278, ptr %31, align 4, !dbg !1198
  %279 = icmp ne i32 %277, 0, !dbg !1199
  br i1 %279, label %280, label %291, !dbg !1197

280:                                              ; preds = %276
  %281 = load ptr, ptr %2, align 8, !dbg !1200
  %282 = getelementptr inbounds nuw %struct.object, ptr %281, i32 0, i32 21, !dbg !1202
  %283 = getelementptr inbounds nuw %struct.physics_info, ptr %282, i32 0, i32 0, !dbg !1203
  %284 = call noundef ptr @_Z11vm_vec_add2P10vms_vectorS0_(ptr noundef %283, ptr noundef %32), !dbg !1204
  %285 = load ptr, ptr %2, align 8, !dbg !1205
  %286 = getelementptr inbounds nuw %struct.object, ptr %285, i32 0, i32 21, !dbg !1206
  %287 = getelementptr inbounds nuw %struct.physics_info, ptr %286, i32 0, i32 0, !dbg !1207
  %288 = load i32, ptr %19, align 4, !dbg !1208
  %289 = sub nsw i32 65536, %288, !dbg !1209
  %290 = call noundef ptr @_Z12vm_vec_scaleP10vms_vectori(ptr noundef %287, i32 noundef %289), !dbg !1210
  br label %276, !dbg !1197, !llvm.loop !1211

291:                                              ; preds = %276
  %292 = load ptr, ptr %2, align 8, !dbg !1213
  %293 = getelementptr inbounds nuw %struct.object, ptr %292, i32 0, i32 21, !dbg !1214
  %294 = getelementptr inbounds nuw %struct.physics_info, ptr %293, i32 0, i32 0, !dbg !1215
  %295 = load i32, ptr %34, align 4, !dbg !1216
  %296 = call noundef ptr @_Z17vm_vec_scale_add2P10vms_vectorS0_i(ptr noundef %294, ptr noundef %32, i32 noundef %295), !dbg !1217
  %297 = load ptr, ptr %2, align 8, !dbg !1218
  %298 = getelementptr inbounds nuw %struct.object, ptr %297, i32 0, i32 21, !dbg !1219
  %299 = getelementptr inbounds nuw %struct.physics_info, ptr %298, i32 0, i32 0, !dbg !1220
  %300 = load i32, ptr %34, align 4, !dbg !1221
  %301 = load i32, ptr %19, align 4, !dbg !1222
  %302 = call noundef i32 @_Z6fixmulii(i32 noundef %300, i32 noundef %301), !dbg !1223
  %303 = sub nsw i32 65536, %302, !dbg !1224
  %304 = call noundef ptr @_Z12vm_vec_scaleP10vms_vectori(ptr noundef %299, i32 noundef %303), !dbg !1225
  br label %327, !dbg !1226

305:                                              ; preds = %252
    #dbg_declare(ptr %35, !1227, !DIExpression(), !1229)
  store i32 65536, ptr %35, align 4, !dbg !1229
  br label %306, !dbg !1230

306:                                              ; preds = %310, %305
  %307 = load i32, ptr %31, align 4, !dbg !1231
  %308 = add nsw i32 %307, -1, !dbg !1231
  store i32 %308, ptr %31, align 4, !dbg !1231
  %309 = icmp ne i32 %307, 0, !dbg !1232
  br i1 %309, label %310, label %315, !dbg !1230

310:                                              ; preds = %306
  %311 = load i32, ptr %35, align 4, !dbg !1233
  %312 = load i32, ptr %19, align 4, !dbg !1234
  %313 = sub nsw i32 65536, %312, !dbg !1235
  %314 = call noundef i32 @_Z6fixmulii(i32 noundef %311, i32 noundef %313), !dbg !1236
  store i32 %314, ptr %35, align 4, !dbg !1237
  br label %306, !dbg !1230, !llvm.loop !1238

315:                                              ; preds = %306
  %316 = load i32, ptr %35, align 4, !dbg !1240
  %317 = load i32, ptr %34, align 4, !dbg !1241
  %318 = load i32, ptr %19, align 4, !dbg !1242
  %319 = call noundef i32 @_Z6fixmulii(i32 noundef %317, i32 noundef %318), !dbg !1243
  %320 = sub nsw i32 65536, %319, !dbg !1244
  %321 = call noundef i32 @_Z6fixmulii(i32 noundef %316, i32 noundef %320), !dbg !1245
  store i32 %321, ptr %35, align 4, !dbg !1246
  %322 = load ptr, ptr %2, align 8, !dbg !1247
  %323 = getelementptr inbounds nuw %struct.object, ptr %322, i32 0, i32 21, !dbg !1248
  %324 = getelementptr inbounds nuw %struct.physics_info, ptr %323, i32 0, i32 0, !dbg !1249
  %325 = load i32, ptr %35, align 4, !dbg !1250
  %326 = call noundef ptr @_Z12vm_vec_scaleP10vms_vectori(ptr noundef %324, i32 noundef %325), !dbg !1251
  br label %327

327:                                              ; preds = %315, %291
  br label %328, !dbg !1252

328:                                              ; preds = %327, %244
  %329 = load ptr, ptr %2, align 8, !dbg !1253
  %330 = load ptr, ptr @debug_obj, align 8, !dbg !1255
  %331 = icmp eq ptr %329, %330, !dbg !1256
  br i1 %331, label %332, label %349, !dbg !1256

332:                                              ; preds = %328
  %333 = load ptr, ptr %2, align 8, !dbg !1257
  %334 = getelementptr inbounds nuw %struct.object, ptr %333, i32 0, i32 21, !dbg !1257
  %335 = getelementptr inbounds nuw %struct.physics_info, ptr %334, i32 0, i32 0, !dbg !1257
  %336 = getelementptr inbounds nuw %struct.vms_vector, ptr %335, i32 0, i32 0, !dbg !1257
  %337 = load i32, ptr %336, align 4, !dbg !1257
  %338 = load ptr, ptr %2, align 8, !dbg !1257
  %339 = getelementptr inbounds nuw %struct.object, ptr %338, i32 0, i32 21, !dbg !1257
  %340 = getelementptr inbounds nuw %struct.physics_info, ptr %339, i32 0, i32 0, !dbg !1257
  %341 = getelementptr inbounds nuw %struct.vms_vector, ptr %340, i32 0, i32 1, !dbg !1257
  %342 = load i32, ptr %341, align 4, !dbg !1257
  %343 = load ptr, ptr %2, align 8, !dbg !1257
  %344 = getelementptr inbounds nuw %struct.object, ptr %343, i32 0, i32 21, !dbg !1257
  %345 = getelementptr inbounds nuw %struct.physics_info, ptr %344, i32 0, i32 0, !dbg !1257
  %346 = getelementptr inbounds nuw %struct.vms_vector, ptr %345, i32 0, i32 2, !dbg !1257
  %347 = load i32, ptr %346, align 4, !dbg !1257
  %348 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, i32 noundef %337, i32 noundef %342, i32 noundef %347), !dbg !1258
  br label %349, !dbg !1258

349:                                              ; preds = %332, %328
  br label %350, !dbg !1259

350:                                              ; preds = %1243, %349
  store i32 0, ptr %6, align 4, !dbg !1260
  %351 = load ptr, ptr %2, align 8, !dbg !1262
  %352 = getelementptr inbounds nuw %struct.object, ptr %351, i32 0, i32 21, !dbg !1263
  %353 = getelementptr inbounds nuw %struct.physics_info, ptr %352, i32 0, i32 0, !dbg !1264
  %354 = load i32, ptr %20, align 4, !dbg !1265
  %355 = call noundef ptr @_Z17vm_vec_copy_scaleP10vms_vectorS0_i(ptr noundef %8, ptr noundef %353, i32 noundef %354), !dbg !1266
  %356 = load ptr, ptr %2, align 8, !dbg !1267
  %357 = load ptr, ptr @debug_obj, align 8, !dbg !1269
  %358 = icmp eq ptr %356, %357, !dbg !1270
  br i1 %358, label %359, label %368, !dbg !1270

359:                                              ; preds = %350
  %360 = load i32, ptr %11, align 4, !dbg !1271
  %361 = getelementptr inbounds nuw %struct.vms_vector, ptr %8, i32 0, i32 0, !dbg !1272
  %362 = load i32, ptr %361, align 4, !dbg !1272
  %363 = getelementptr inbounds nuw %struct.vms_vector, ptr %8, i32 0, i32 1, !dbg !1272
  %364 = load i32, ptr %363, align 4, !dbg !1272
  %365 = getelementptr inbounds nuw %struct.vms_vector, ptr %8, i32 0, i32 2, !dbg !1272
  %366 = load i32, ptr %365, align 4, !dbg !1272
  %367 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, i32 noundef %360, i32 noundef %362, i32 noundef %364, i32 noundef %366), !dbg !1273
  br label %368, !dbg !1273

368:                                              ; preds = %359, %350
  %369 = getelementptr inbounds nuw %struct.vms_vector, ptr %8, i32 0, i32 0, !dbg !1274
  %370 = load i32, ptr %369, align 4, !dbg !1274
  %371 = icmp eq i32 %370, 0, !dbg !1276
  br i1 %371, label %372, label %381, !dbg !1277

372:                                              ; preds = %368
  %373 = getelementptr inbounds nuw %struct.vms_vector, ptr %8, i32 0, i32 1, !dbg !1278
  %374 = load i32, ptr %373, align 4, !dbg !1278
  %375 = icmp eq i32 %374, 0, !dbg !1279
  br i1 %375, label %376, label %381, !dbg !1280

376:                                              ; preds = %372
  %377 = getelementptr inbounds nuw %struct.vms_vector, ptr %8, i32 0, i32 2, !dbg !1281
  %378 = load i32, ptr %377, align 4, !dbg !1281
  %379 = icmp eq i32 %378, 0, !dbg !1282
  br i1 %379, label %380, label %381, !dbg !1280

380:                                              ; preds = %376
  br label %1247, !dbg !1283

381:                                              ; preds = %376, %372, %368
  %382 = load i32, ptr %11, align 4, !dbg !1284
  %383 = add nsw i32 %382, 1, !dbg !1284
  store i32 %383, ptr %11, align 4, !dbg !1284
  %384 = load i32, ptr %11, align 4, !dbg !1285
  %385 = icmp sgt i32 %384, 3, !dbg !1287
  br i1 %385, label %386, label %399, !dbg !1287

386:                                              ; preds = %381
  %387 = load ptr, ptr %2, align 8, !dbg !1288
  %388 = getelementptr inbounds nuw %struct.object, ptr %387, i32 0, i32 1, !dbg !1291
  %389 = load i8, ptr %388, align 4, !dbg !1291
  %390 = zext i8 %389 to i32, !dbg !1288
  %391 = icmp eq i32 %390, 4, !dbg !1292
  br i1 %391, label %392, label %397, !dbg !1292

392:                                              ; preds = %386
  %393 = load i32, ptr %11, align 4, !dbg !1293
  %394 = icmp sgt i32 %393, 8, !dbg !1296
  br i1 %394, label %395, label %396, !dbg !1296

395:                                              ; preds = %392
  br label %1247, !dbg !1297

396:                                              ; preds = %392
  br label %398, !dbg !1298

397:                                              ; preds = %386
  br label %1247, !dbg !1299

398:                                              ; preds = %396
  br label %399, !dbg !1300

399:                                              ; preds = %398, %381
  %400 = load ptr, ptr %2, align 8, !dbg !1301
  %401 = getelementptr inbounds nuw %struct.object, ptr %400, i32 0, i32 11, !dbg !1302
  %402 = call noundef ptr @_Z10vm_vec_addP10vms_vectorS0_S0_(ptr noundef %9, ptr noundef %401, ptr noundef %8), !dbg !1303
  %403 = load ptr, ptr %2, align 8, !dbg !1304
  %404 = load ptr, ptr @debug_obj, align 8, !dbg !1306
  %405 = icmp eq ptr %403, %404, !dbg !1307
  br i1 %405, label %406, label %414, !dbg !1307

406:                                              ; preds = %399
  %407 = getelementptr inbounds nuw %struct.vms_vector, ptr %9, i32 0, i32 0, !dbg !1308
  %408 = load i32, ptr %407, align 4, !dbg !1308
  %409 = getelementptr inbounds nuw %struct.vms_vector, ptr %9, i32 0, i32 1, !dbg !1308
  %410 = load i32, ptr %409, align 4, !dbg !1308
  %411 = getelementptr inbounds nuw %struct.vms_vector, ptr %9, i32 0, i32 2, !dbg !1308
  %412 = load i32, ptr %411, align 4, !dbg !1308
  %413 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, i32 noundef %408, i32 noundef %410, i32 noundef %412), !dbg !1309
  br label %414, !dbg !1309

414:                                              ; preds = %406, %399
  %415 = load i32, ptr %4, align 4, !dbg !1310
  %416 = sext i32 %415 to i64, !dbg !1311
  %417 = getelementptr inbounds [100 x i32], ptr %3, i64 0, i64 %416, !dbg !1311
  store i32 -1, ptr %417, align 4, !dbg !1312
  %418 = load ptr, ptr %2, align 8, !dbg !1313
  %419 = load ptr, ptr @debug_obj, align 8, !dbg !1315
  %420 = icmp eq ptr %418, %419, !dbg !1316
  br i1 %420, label %421, label %449, !dbg !1316

421:                                              ; preds = %414
  %422 = load ptr, ptr %2, align 8, !dbg !1317
  %423 = getelementptr inbounds nuw %struct.object, ptr %422, i32 0, i32 11, !dbg !1317
  %424 = getelementptr inbounds nuw %struct.vms_vector, ptr %423, i32 0, i32 0, !dbg !1317
  %425 = load i32, ptr %424, align 4, !dbg !1317
  %426 = load ptr, ptr %2, align 8, !dbg !1317
  %427 = getelementptr inbounds nuw %struct.object, ptr %426, i32 0, i32 11, !dbg !1317
  %428 = getelementptr inbounds nuw %struct.vms_vector, ptr %427, i32 0, i32 1, !dbg !1317
  %429 = load i32, ptr %428, align 4, !dbg !1317
  %430 = load ptr, ptr %2, align 8, !dbg !1317
  %431 = getelementptr inbounds nuw %struct.object, ptr %430, i32 0, i32 11, !dbg !1317
  %432 = getelementptr inbounds nuw %struct.vms_vector, ptr %431, i32 0, i32 2, !dbg !1317
  %433 = load i32, ptr %432, align 4, !dbg !1317
  %434 = load ptr, ptr %2, align 8, !dbg !1319
  %435 = getelementptr inbounds nuw %struct.object, ptr %434, i32 0, i32 9, !dbg !1320
  %436 = load i16, ptr %435, align 2, !dbg !1320
  %437 = sext i16 %436 to i32, !dbg !1319
  %438 = load ptr, ptr %2, align 8, !dbg !1321
  %439 = getelementptr inbounds nuw %struct.object, ptr %438, i32 0, i32 13, !dbg !1322
  %440 = load i32, ptr %439, align 4, !dbg !1322
  %441 = call i32 (ptr, ...) @printf(ptr noundef @.str.14, i32 noundef %425, i32 noundef %429, i32 noundef %433, i32 noundef %437, i32 noundef %440), !dbg !1323
  %442 = getelementptr inbounds nuw %struct.vms_vector, ptr %9, i32 0, i32 0, !dbg !1324
  %443 = load i32, ptr %442, align 4, !dbg !1324
  %444 = getelementptr inbounds nuw %struct.vms_vector, ptr %9, i32 0, i32 1, !dbg !1324
  %445 = load i32, ptr %444, align 4, !dbg !1324
  %446 = getelementptr inbounds nuw %struct.vms_vector, ptr %9, i32 0, i32 2, !dbg !1324
  %447 = load i32, ptr %446, align 4, !dbg !1324
  %448 = call i32 (ptr, ...) @printf(ptr noundef @.str.15, i32 noundef %443, i32 noundef %445, i32 noundef %447), !dbg !1325
  br label %449, !dbg !1326

449:                                              ; preds = %421, %414
  %450 = load ptr, ptr %2, align 8, !dbg !1327
  %451 = getelementptr inbounds nuw %struct.object, ptr %450, i32 0, i32 11, !dbg !1328
  %452 = getelementptr inbounds nuw %struct.fvi_query, ptr %16, i32 0, i32 0, !dbg !1329
  store ptr %451, ptr %452, align 8, !dbg !1330
  %453 = load ptr, ptr %2, align 8, !dbg !1331
  %454 = getelementptr inbounds nuw %struct.object, ptr %453, i32 0, i32 9, !dbg !1332
  %455 = load i16, ptr %454, align 2, !dbg !1332
  %456 = sext i16 %455 to i32, !dbg !1331
  %457 = getelementptr inbounds nuw %struct.fvi_query, ptr %16, i32 0, i32 2, !dbg !1333
  store i32 %456, ptr %457, align 8, !dbg !1334
  %458 = getelementptr inbounds nuw %struct.fvi_query, ptr %16, i32 0, i32 1, !dbg !1335
  store ptr %9, ptr %458, align 8, !dbg !1336
  %459 = load ptr, ptr %2, align 8, !dbg !1337
  %460 = getelementptr inbounds nuw %struct.object, ptr %459, i32 0, i32 13, !dbg !1338
  %461 = load i32, ptr %460, align 4, !dbg !1338
  %462 = getelementptr inbounds nuw %struct.fvi_query, ptr %16, i32 0, i32 3, !dbg !1339
  store i32 %461, ptr %462, align 4, !dbg !1340
  %463 = load i32, ptr %12, align 4, !dbg !1341
  %464 = trunc i32 %463 to i16, !dbg !1341
  %465 = getelementptr inbounds nuw %struct.fvi_query, ptr %16, i32 0, i32 4, !dbg !1342
  store i16 %464, ptr %465, align 8, !dbg !1343
  %466 = getelementptr inbounds [100 x i32], ptr %3, i64 0, i64 0, !dbg !1344
  %467 = getelementptr inbounds nuw %struct.fvi_query, ptr %16, i32 0, i32 5, !dbg !1345
  store ptr %466, ptr %467, align 8, !dbg !1346
  %468 = getelementptr inbounds nuw %struct.fvi_query, ptr %16, i32 0, i32 6, !dbg !1347
  store i32 1, ptr %468, align 8, !dbg !1348
  %469 = load ptr, ptr %2, align 8, !dbg !1349
  %470 = getelementptr inbounds nuw %struct.object, ptr %469, i32 0, i32 1, !dbg !1351
  %471 = load i8, ptr %470, align 4, !dbg !1351
  %472 = zext i8 %471 to i32, !dbg !1349
  %473 = icmp eq i32 %472, 5, !dbg !1352
  br i1 %473, label %474, label %478, !dbg !1352

474:                                              ; preds = %449
  %475 = getelementptr inbounds nuw %struct.fvi_query, ptr %16, i32 0, i32 6, !dbg !1353
  %476 = load i32, ptr %475, align 8, !dbg !1354
  %477 = or i32 %476, 4, !dbg !1354
  store i32 %477, ptr %475, align 8, !dbg !1354
  br label %478, !dbg !1355

478:                                              ; preds = %474, %449
  %479 = load ptr, ptr %2, align 8, !dbg !1356
  %480 = getelementptr inbounds nuw %struct.object, ptr %479, i32 0, i32 1, !dbg !1358
  %481 = load i8, ptr %480, align 4, !dbg !1358
  %482 = zext i8 %481 to i32, !dbg !1356
  %483 = icmp eq i32 %482, 4, !dbg !1359
  br i1 %483, label %484, label %488, !dbg !1359

484:                                              ; preds = %478
  %485 = getelementptr inbounds nuw %struct.fvi_query, ptr %16, i32 0, i32 6, !dbg !1360
  %486 = load i32, ptr %485, align 8, !dbg !1361
  %487 = or i32 %486, 8, !dbg !1361
  store i32 %487, ptr %485, align 8, !dbg !1361
  br label %488, !dbg !1362

488:                                              ; preds = %484, %478
  %489 = getelementptr inbounds nuw %struct.fvi_query, ptr %16, i32 0, i32 0, !dbg !1363
  %490 = load ptr, ptr %489, align 8, !dbg !1363
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %25, ptr align 4 %490, i64 12, i1 false), !dbg !1364
  %491 = getelementptr inbounds nuw %struct.fvi_query, ptr %16, i32 0, i32 1, !dbg !1365
  %492 = load ptr, ptr %491, align 8, !dbg !1365
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %26, ptr align 4 %492, i64 12, i1 false), !dbg !1366
  %493 = call noundef i32 @_Z24find_vector_intersectionP9fvi_queryP8fvi_info(ptr noundef %16, ptr noundef %15), !dbg !1367
  store i32 %493, ptr %7, align 4, !dbg !1368
  %494 = load i32, ptr %12, align 4, !dbg !1369
  %495 = icmp eq i32 %494, 50, !dbg !1371
  br i1 %495, label %496, label %555, !dbg !1371

496:                                              ; preds = %488
  %497 = load i32, ptr @_ZZ14do_physics_simP6objectE12cfvi50_count, align 4, !dbg !1372
  %498 = icmp slt i32 %497, 120, !dbg !1375
  br i1 %498, label %499, label %552, !dbg !1375

499:                                              ; preds = %496
  %500 = load ptr, ptr @__stderrp, align 8, !dbg !1376
  %501 = load i32, ptr @_ZZ14do_physics_simP6objectE12cfvi50_count, align 4, !dbg !1378
  %502 = getelementptr inbounds nuw %struct.fvi_query, ptr %16, i32 0, i32 0, !dbg !1379
  %503 = load ptr, ptr %502, align 8, !dbg !1379
  %504 = getelementptr inbounds nuw %struct.vms_vector, ptr %503, i32 0, i32 0, !dbg !1380
  %505 = load i32, ptr %504, align 4, !dbg !1380
  %506 = getelementptr inbounds nuw %struct.fvi_query, ptr %16, i32 0, i32 0, !dbg !1381
  %507 = load ptr, ptr %506, align 8, !dbg !1381
  %508 = getelementptr inbounds nuw %struct.vms_vector, ptr %507, i32 0, i32 1, !dbg !1382
  %509 = load i32, ptr %508, align 4, !dbg !1382
  %510 = getelementptr inbounds nuw %struct.fvi_query, ptr %16, i32 0, i32 0, !dbg !1383
  %511 = load ptr, ptr %510, align 8, !dbg !1383
  %512 = getelementptr inbounds nuw %struct.vms_vector, ptr %511, i32 0, i32 2, !dbg !1384
  %513 = load i32, ptr %512, align 4, !dbg !1384
  %514 = getelementptr inbounds nuw %struct.fvi_query, ptr %16, i32 0, i32 1, !dbg !1385
  %515 = load ptr, ptr %514, align 8, !dbg !1385
  %516 = getelementptr inbounds nuw %struct.vms_vector, ptr %515, i32 0, i32 0, !dbg !1386
  %517 = load i32, ptr %516, align 4, !dbg !1386
  %518 = getelementptr inbounds nuw %struct.fvi_query, ptr %16, i32 0, i32 1, !dbg !1387
  %519 = load ptr, ptr %518, align 8, !dbg !1387
  %520 = getelementptr inbounds nuw %struct.vms_vector, ptr %519, i32 0, i32 1, !dbg !1388
  %521 = load i32, ptr %520, align 4, !dbg !1388
  %522 = getelementptr inbounds nuw %struct.fvi_query, ptr %16, i32 0, i32 1, !dbg !1389
  %523 = load ptr, ptr %522, align 8, !dbg !1389
  %524 = getelementptr inbounds nuw %struct.vms_vector, ptr %523, i32 0, i32 2, !dbg !1390
  %525 = load i32, ptr %524, align 4, !dbg !1390
  %526 = getelementptr inbounds nuw %struct.fvi_query, ptr %16, i32 0, i32 2, !dbg !1391
  %527 = load i32, ptr %526, align 8, !dbg !1391
  %528 = getelementptr inbounds nuw %struct.fvi_query, ptr %16, i32 0, i32 3, !dbg !1392
  %529 = load i32, ptr %528, align 4, !dbg !1392
  %530 = load i32, ptr %7, align 4, !dbg !1393
  %531 = getelementptr inbounds nuw %struct.fvi_info, ptr %15, i32 0, i32 1, !dbg !1394
  %532 = getelementptr inbounds nuw %struct.vms_vector, ptr %531, i32 0, i32 0, !dbg !1395
  %533 = load i32, ptr %532, align 4, !dbg !1395
  %534 = getelementptr inbounds nuw %struct.fvi_info, ptr %15, i32 0, i32 1, !dbg !1396
  %535 = getelementptr inbounds nuw %struct.vms_vector, ptr %534, i32 0, i32 1, !dbg !1397
  %536 = load i32, ptr %535, align 4, !dbg !1397
  %537 = getelementptr inbounds nuw %struct.fvi_info, ptr %15, i32 0, i32 1, !dbg !1398
  %538 = getelementptr inbounds nuw %struct.vms_vector, ptr %537, i32 0, i32 2, !dbg !1399
  %539 = load i32, ptr %538, align 4, !dbg !1399
  %540 = getelementptr inbounds nuw %struct.fvi_info, ptr %15, i32 0, i32 2, !dbg !1400
  %541 = load i32, ptr %540, align 4, !dbg !1400
  %542 = getelementptr inbounds nuw %struct.fvi_info, ptr %15, i32 0, i32 6, !dbg !1401
  %543 = getelementptr inbounds nuw %struct.vms_vector, ptr %542, i32 0, i32 0, !dbg !1402
  %544 = load i32, ptr %543, align 4, !dbg !1402
  %545 = getelementptr inbounds nuw %struct.fvi_info, ptr %15, i32 0, i32 6, !dbg !1403
  %546 = getelementptr inbounds nuw %struct.vms_vector, ptr %545, i32 0, i32 1, !dbg !1404
  %547 = load i32, ptr %546, align 4, !dbg !1404
  %548 = getelementptr inbounds nuw %struct.fvi_info, ptr %15, i32 0, i32 6, !dbg !1405
  %549 = getelementptr inbounds nuw %struct.vms_vector, ptr %548, i32 0, i32 2, !dbg !1406
  %550 = load i32, ptr %549, align 4, !dbg !1406
  %551 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %500, ptr noundef @.str.16, i32 noundef %501, i32 noundef %505, i32 noundef %509, i32 noundef %513, i32 noundef %517, i32 noundef %521, i32 noundef %525, i32 noundef %527, i32 noundef %529, i32 noundef %530, i32 noundef %533, i32 noundef %536, i32 noundef %539, i32 noundef %541, i32 noundef %544, i32 noundef %547, i32 noundef %550) #6, !dbg !1407
  br label %552, !dbg !1408

552:                                              ; preds = %499, %496
  %553 = load i32, ptr @_ZZ14do_physics_simP6objectE12cfvi50_count, align 4, !dbg !1409
  %554 = add nsw i32 %553, 1, !dbg !1409
  store i32 %554, ptr @_ZZ14do_physics_simP6objectE12cfvi50_count, align 4, !dbg !1409
  br label %555, !dbg !1410

555:                                              ; preds = %552, %488
  %556 = load i32, ptr %7, align 4, !dbg !1411
  %557 = icmp eq i32 %556, 2, !dbg !1413
  br i1 %557, label %558, label %584, !dbg !1413

558:                                              ; preds = %555
    #dbg_declare(ptr %36, !1414, !DIExpression(), !1416)
  %559 = getelementptr inbounds nuw %struct.fvi_info, ptr %15, i32 0, i32 5, !dbg !1417
  %560 = load i32, ptr %559, align 4, !dbg !1417
  %561 = sext i32 %560 to i64, !dbg !1418
  %562 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %561, !dbg !1418
  store ptr %562, ptr %36, align 8, !dbg !1416
  %563 = load ptr, ptr %36, align 8, !dbg !1419
  %564 = getelementptr inbounds nuw %struct.object, ptr %563, i32 0, i32 1, !dbg !1421
  %565 = load i8, ptr %564, align 4, !dbg !1421
  %566 = zext i8 %565 to i32, !dbg !1419
  %567 = icmp eq i32 %566, 5, !dbg !1422
  br i1 %567, label %568, label %583, !dbg !1423

568:                                              ; preds = %558
  %569 = load ptr, ptr %36, align 8, !dbg !1424
  %570 = getelementptr inbounds nuw %struct.object, ptr %569, i32 0, i32 2, !dbg !1425
  %571 = load i8, ptr %570, align 1, !dbg !1425
  %572 = zext i8 %571 to i32, !dbg !1424
  %573 = icmp eq i32 %572, 16, !dbg !1426
  br i1 %573, label %580, label %574, !dbg !1427

574:                                              ; preds = %568
  %575 = load ptr, ptr %36, align 8, !dbg !1428
  %576 = getelementptr inbounds nuw %struct.object, ptr %575, i32 0, i32 2, !dbg !1429
  %577 = load i8, ptr %576, align 1, !dbg !1429
  %578 = zext i8 %577 to i32, !dbg !1428
  %579 = icmp eq i32 %578, 38, !dbg !1430
  br i1 %579, label %580, label %583, !dbg !1423

580:                                              ; preds = %574, %568
  %581 = load i32, ptr %11, align 4, !dbg !1431
  %582 = add nsw i32 %581, -1, !dbg !1431
  store i32 %582, ptr %11, align 4, !dbg !1431
  br label %583, !dbg !1432

583:                                              ; preds = %580, %574, %558
  br label %584, !dbg !1433

584:                                              ; preds = %583, %555
  %585 = load i32, ptr %7, align 4, !dbg !1434
  %586 = icmp eq i32 %585, 3, !dbg !1436
  br i1 %586, label %587, label %602, !dbg !1436

587:                                              ; preds = %584
  %588 = load ptr, ptr %2, align 8, !dbg !1437
  %589 = ptrtoint ptr %588 to i64, !dbg !1437
  %590 = sub i64 %589, ptrtoint (ptr @Objects to i64), !dbg !1437
  %591 = sdiv exact i64 %590, 268, !dbg !1437
  %592 = load ptr, ptr %2, align 8, !dbg !1437
  %593 = getelementptr inbounds nuw %struct.object, ptr %592, i32 0, i32 1, !dbg !1437
  %594 = load i8, ptr %593, align 4, !dbg !1437
  %595 = zext i8 %594 to i32, !dbg !1437
  %596 = load ptr, ptr %2, align 8, !dbg !1437
  %597 = getelementptr inbounds nuw %struct.object, ptr %596, i32 0, i32 1, !dbg !1437
  %598 = load i8, ptr %597, align 4, !dbg !1437
  %599 = zext i8 %598 to i64, !dbg !1437
  %600 = getelementptr inbounds nuw [16 x [9 x i8]], ptr @Object_type_names, i64 0, i64 %599, !dbg !1437
  %601 = getelementptr inbounds [9 x i8], ptr %600, i64 0, i64 0, !dbg !1437
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.17, i64 noundef %591, i32 noundef %595, ptr noundef %601), !dbg !1437
  call void @_Z4Int3v(), !dbg !1439
  br label %602, !dbg !1440

602:                                              ; preds = %587, %584
  %603 = load ptr, ptr %2, align 8, !dbg !1441
  %604 = getelementptr inbounds nuw %struct.object, ptr %603, i32 0, i32 1, !dbg !1443
  %605 = load i8, ptr %604, align 4, !dbg !1443
  %606 = zext i8 %605 to i32, !dbg !1441
  %607 = icmp eq i32 %606, 4, !dbg !1444
  br i1 %607, label %608, label %647, !dbg !1444

608:                                              ; preds = %602
    #dbg_declare(ptr %37, !1445, !DIExpression(), !1447)
  %609 = load i32, ptr @n_phys_segs, align 4, !dbg !1448
  %610 = icmp ne i32 %609, 0, !dbg !1448
  br i1 %610, label %611, label %624, !dbg !1450

611:                                              ; preds = %608
  %612 = load i32, ptr @n_phys_segs, align 4, !dbg !1451
  %613 = sub nsw i32 %612, 1, !dbg !1452
  %614 = sext i32 %613 to i64, !dbg !1453
  %615 = getelementptr inbounds [100 x i32], ptr @phys_seglist, i64 0, i64 %614, !dbg !1453
  %616 = load i32, ptr %615, align 4, !dbg !1453
  %617 = getelementptr inbounds nuw %struct.fvi_info, ptr %15, i32 0, i32 8, !dbg !1454
  %618 = getelementptr inbounds [100 x i32], ptr %617, i64 0, i64 0, !dbg !1455
  %619 = load i32, ptr %618, align 4, !dbg !1455
  %620 = icmp eq i32 %616, %619, !dbg !1456
  br i1 %620, label %621, label %624, !dbg !1450

621:                                              ; preds = %611
  %622 = load i32, ptr @n_phys_segs, align 4, !dbg !1457
  %623 = add nsw i32 %622, -1, !dbg !1457
  store i32 %623, ptr @n_phys_segs, align 4, !dbg !1457
  br label %624, !dbg !1458

624:                                              ; preds = %621, %611, %608
  store i32 0, ptr %37, align 4, !dbg !1459
  br label %625, !dbg !1461

625:                                              ; preds = %635, %624
  %626 = load i32, ptr %37, align 4, !dbg !1462
  %627 = getelementptr inbounds nuw %struct.fvi_info, ptr %15, i32 0, i32 7, !dbg !1464
  %628 = load i32, ptr %627, align 4, !dbg !1464
  %629 = icmp slt i32 %626, %628, !dbg !1465
  br i1 %629, label %630, label %633, !dbg !1466

630:                                              ; preds = %625
  %631 = load i32, ptr @n_phys_segs, align 4, !dbg !1467
  %632 = icmp slt i32 %631, 99, !dbg !1468
  br label %633

633:                                              ; preds = %630, %625
  %634 = phi i1 [ false, %625 ], [ %632, %630 ], !dbg !1469
  br i1 %634, label %635, label %646, !dbg !1470

635:                                              ; preds = %633
  %636 = getelementptr inbounds nuw %struct.fvi_info, ptr %15, i32 0, i32 8, !dbg !1471
  %637 = load i32, ptr %37, align 4, !dbg !1472
  %638 = add nsw i32 %637, 1, !dbg !1472
  store i32 %638, ptr %37, align 4, !dbg !1472
  %639 = sext i32 %637 to i64, !dbg !1473
  %640 = getelementptr inbounds [100 x i32], ptr %636, i64 0, i64 %639, !dbg !1473
  %641 = load i32, ptr %640, align 4, !dbg !1473
  %642 = load i32, ptr @n_phys_segs, align 4, !dbg !1474
  %643 = add nsw i32 %642, 1, !dbg !1474
  store i32 %643, ptr @n_phys_segs, align 4, !dbg !1474
  %644 = sext i32 %642 to i64, !dbg !1475
  %645 = getelementptr inbounds [100 x i32], ptr @phys_seglist, i64 0, i64 %644, !dbg !1475
  store i32 %641, ptr %645, align 4, !dbg !1476
  br label %625, !dbg !1477, !llvm.loop !1478

646:                                              ; preds = %633
  br label %647, !dbg !1480

647:                                              ; preds = %646, %602
  %648 = load ptr, ptr %2, align 8, !dbg !1481
  %649 = load ptr, ptr @debug_obj, align 8, !dbg !1483
  %650 = icmp eq ptr %648, %649, !dbg !1484
  br i1 %650, label %651, label %663, !dbg !1484

651:                                              ; preds = %647
  %652 = load i32, ptr %7, align 4, !dbg !1485
  %653 = getelementptr inbounds nuw %struct.fvi_info, ptr %15, i32 0, i32 1, !dbg !1486
  %654 = getelementptr inbounds nuw %struct.vms_vector, ptr %653, i32 0, i32 0, !dbg !1486
  %655 = load i32, ptr %654, align 4, !dbg !1486
  %656 = getelementptr inbounds nuw %struct.fvi_info, ptr %15, i32 0, i32 1, !dbg !1486
  %657 = getelementptr inbounds nuw %struct.vms_vector, ptr %656, i32 0, i32 1, !dbg !1486
  %658 = load i32, ptr %657, align 4, !dbg !1486
  %659 = getelementptr inbounds nuw %struct.fvi_info, ptr %15, i32 0, i32 1, !dbg !1486
  %660 = getelementptr inbounds nuw %struct.vms_vector, ptr %659, i32 0, i32 2, !dbg !1486
  %661 = load i32, ptr %660, align 4, !dbg !1486
  %662 = call i32 (ptr, ...) @printf(ptr noundef @.str.18, i32 noundef %652, i32 noundef %655, i32 noundef %658, i32 noundef %661), !dbg !1487
  br label %663, !dbg !1487

663:                                              ; preds = %651, %647
  %664 = getelementptr inbounds nuw %struct.fvi_info, ptr %15, i32 0, i32 1, !dbg !1488
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %10, ptr align 4 %664, i64 12, i1 false), !dbg !1489
  %665 = getelementptr inbounds nuw %struct.fvi_info, ptr %15, i32 0, i32 2, !dbg !1490
  %666 = load i32, ptr %665, align 4, !dbg !1490
  store i32 %666, ptr %5, align 4, !dbg !1491
  %667 = getelementptr inbounds nuw %struct.fvi_info, ptr %15, i32 0, i32 3, !dbg !1492
  %668 = load i32, ptr %667, align 4, !dbg !1492
  store i32 %668, ptr %14, align 4, !dbg !1493
  %669 = getelementptr inbounds nuw %struct.fvi_info, ptr %15, i32 0, i32 4, !dbg !1494
  %670 = load i32, ptr %669, align 4, !dbg !1494
  store i32 %670, ptr %13, align 4, !dbg !1495
  %671 = load i32, ptr %5, align 4, !dbg !1496
  %672 = icmp eq i32 %671, -1, !dbg !1498
  br i1 %672, label %673, label %701, !dbg !1498

673:                                              ; preds = %663
  %674 = load ptr, ptr %2, align 8, !dbg !1499
  %675 = ptrtoint ptr %674 to i64, !dbg !1499
  %676 = sub i64 %675, ptrtoint (ptr @Objects to i64), !dbg !1499
  %677 = sdiv exact i64 %676, 268, !dbg !1499
  %678 = load ptr, ptr %2, align 8, !dbg !1499
  %679 = getelementptr inbounds nuw %struct.object, ptr %678, i32 0, i32 1, !dbg !1499
  %680 = load i8, ptr %679, align 4, !dbg !1499
  %681 = zext i8 %680 to i32, !dbg !1499
  %682 = load ptr, ptr %2, align 8, !dbg !1499
  %683 = getelementptr inbounds nuw %struct.object, ptr %682, i32 0, i32 1, !dbg !1499
  %684 = load i8, ptr %683, align 4, !dbg !1499
  %685 = zext i8 %684 to i64, !dbg !1499
  %686 = getelementptr inbounds nuw [16 x [9 x i8]], ptr @Object_type_names, i64 0, i64 %685, !dbg !1499
  %687 = getelementptr inbounds [9 x i8], ptr %686, i64 0, i64 0, !dbg !1499
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 1, ptr noundef @.str.19, i64 noundef %677, i32 noundef %681, ptr noundef %687), !dbg !1499
  %688 = load ptr, ptr %2, align 8, !dbg !1501
  %689 = getelementptr inbounds nuw %struct.object, ptr %688, i32 0, i32 1, !dbg !1503
  %690 = load i8, ptr %689, align 4, !dbg !1503
  %691 = zext i8 %690 to i32, !dbg !1501
  %692 = icmp eq i32 %691, 5, !dbg !1504
  br i1 %692, label %693, label %700, !dbg !1504

693:                                              ; preds = %673
  %694 = load ptr, ptr %2, align 8, !dbg !1505
  %695 = getelementptr inbounds nuw %struct.object, ptr %694, i32 0, i32 8, !dbg !1506
  %696 = load i8, ptr %695, align 1, !dbg !1507
  %697 = zext i8 %696 to i32, !dbg !1507
  %698 = or i32 %697, 2, !dbg !1507
  %699 = trunc i32 %698 to i8, !dbg !1507
  store i8 %699, ptr %695, align 1, !dbg !1507
  br label %700, !dbg !1505

700:                                              ; preds = %693, %673
  br label %1247, !dbg !1508

701:                                              ; preds = %663
  %702 = load i32, ptr %7, align 4, !dbg !1509
  %703 = icmp eq i32 %702, 1, !dbg !1509
  br i1 %703, label %704, label %713, !dbg !1509

704:                                              ; preds = %701
  %705 = load i32, ptr %13, align 4, !dbg !1509
  %706 = icmp eq i32 %705, -1, !dbg !1509
  br i1 %706, label %711, label %707, !dbg !1509

707:                                              ; preds = %704
  %708 = load i32, ptr %13, align 4, !dbg !1509
  %709 = load i32, ptr @Highest_segment_index, align 4, !dbg !1509
  %710 = icmp sgt i32 %708, %709, !dbg !1509
  br label %711, !dbg !1509

711:                                              ; preds = %707, %704
  %712 = phi i1 [ true, %704 ], [ %710, %707 ]
  br label %713

713:                                              ; preds = %711, %701
  %714 = phi i1 [ false, %701 ], [ %712, %711 ], !dbg !1510
  %715 = xor i1 %714, true, !dbg !1509
  %716 = zext i1 %715 to i32, !dbg !1509
  call void @_Z7_AssertiPKcS0_i(i32 noundef %716, ptr noundef @.str.20, ptr noundef @.str.1, i32 noundef 1203), !dbg !1509
  %717 = load ptr, ptr %2, align 8, !dbg !1511
  %718 = getelementptr inbounds nuw %struct.object, ptr %717, i32 0, i32 11, !dbg !1512
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %17, ptr align 4 %718, i64 12, i1 false), !dbg !1513
  %719 = load ptr, ptr %2, align 8, !dbg !1514
  %720 = getelementptr inbounds nuw %struct.object, ptr %719, i32 0, i32 9, !dbg !1515
  %721 = load i16, ptr %720, align 2, !dbg !1515
  %722 = sext i16 %721 to i32, !dbg !1514
  store i32 %722, ptr %18, align 4, !dbg !1516
  %723 = load ptr, ptr %2, align 8, !dbg !1517
  %724 = getelementptr inbounds nuw %struct.object, ptr %723, i32 0, i32 11, !dbg !1518
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %724, ptr align 4 %10, i64 12, i1 false), !dbg !1519
  %725 = load ptr, ptr %2, align 8, !dbg !1520
  %726 = load ptr, ptr @debug_obj, align 8, !dbg !1522
  %727 = icmp eq ptr %725, %726, !dbg !1523
  br i1 %727, label %728, label %742, !dbg !1523

728:                                              ; preds = %713
  %729 = load ptr, ptr %2, align 8, !dbg !1524
  %730 = getelementptr inbounds nuw %struct.object, ptr %729, i32 0, i32 11, !dbg !1524
  %731 = getelementptr inbounds nuw %struct.vms_vector, ptr %730, i32 0, i32 0, !dbg !1524
  %732 = load i32, ptr %731, align 4, !dbg !1524
  %733 = load ptr, ptr %2, align 8, !dbg !1524
  %734 = getelementptr inbounds nuw %struct.object, ptr %733, i32 0, i32 11, !dbg !1524
  %735 = getelementptr inbounds nuw %struct.vms_vector, ptr %734, i32 0, i32 1, !dbg !1524
  %736 = load i32, ptr %735, align 4, !dbg !1524
  %737 = load ptr, ptr %2, align 8, !dbg !1524
  %738 = getelementptr inbounds nuw %struct.object, ptr %737, i32 0, i32 11, !dbg !1524
  %739 = getelementptr inbounds nuw %struct.vms_vector, ptr %738, i32 0, i32 2, !dbg !1524
  %740 = load i32, ptr %739, align 4, !dbg !1524
  %741 = call i32 (ptr, ...) @printf(ptr noundef @.str.21, i32 noundef %732, i32 noundef %736, i32 noundef %740), !dbg !1525
  br label %742, !dbg !1525

742:                                              ; preds = %728, %713
  %743 = load i32, ptr %5, align 4, !dbg !1526
  %744 = load ptr, ptr %2, align 8, !dbg !1528
  %745 = getelementptr inbounds nuw %struct.object, ptr %744, i32 0, i32 9, !dbg !1529
  %746 = load i16, ptr %745, align 2, !dbg !1529
  %747 = sext i16 %746 to i32, !dbg !1528
  %748 = icmp ne i32 %743, %747, !dbg !1530
  br i1 %748, label %749, label %752, !dbg !1530

749:                                              ; preds = %742
  %750 = load i32, ptr %12, align 4, !dbg !1531
  %751 = load i32, ptr %5, align 4, !dbg !1532
  call void @_Z10obj_relinkii(i32 noundef %750, i32 noundef %751), !dbg !1533
  br label %752, !dbg !1533

752:                                              ; preds = %749, %742
  %753 = load ptr, ptr %2, align 8, !dbg !1534
  %754 = getelementptr inbounds nuw %struct.object, ptr %753, i32 0, i32 11, !dbg !1536
  %755 = load ptr, ptr %2, align 8, !dbg !1537
  %756 = getelementptr inbounds nuw %struct.object, ptr %755, i32 0, i32 9, !dbg !1538
  %757 = load i16, ptr %756, align 2, !dbg !1538
  %758 = sext i16 %757 to i32, !dbg !1537
  %759 = call i32 @_Z13get_seg_masksP10vms_vectorii(ptr noundef %754, i32 noundef %758, i32 noundef 0), !dbg !1539
  store i32 %759, ptr %38, align 2, !dbg !1539
  %760 = getelementptr inbounds nuw %struct.segmasks, ptr %38, i32 0, i32 2, !dbg !1540
  %761 = load i8, ptr %760, align 1, !dbg !1540
  %762 = sext i8 %761 to i32, !dbg !1539
  %763 = icmp ne i32 %762, 0, !dbg !1541
  br i1 %763, label %764, label %819, !dbg !1539

764:                                              ; preds = %752
    #dbg_declare(ptr %39, !1542, !DIExpression(), !1544)
  %765 = load ptr, ptr %2, align 8, !dbg !1545
  %766 = call noundef i32 @_Z15find_object_segP6object(ptr noundef %765), !dbg !1547
  store i32 %766, ptr %39, align 4, !dbg !1548
  %767 = icmp eq i32 %766, -1, !dbg !1549
  br i1 %767, label %768, label %818, !dbg !1549

768:                                              ; preds = %764
  %769 = load ptr, ptr %2, align 8, !dbg !1550
  %770 = getelementptr inbounds nuw %struct.object, ptr %769, i32 0, i32 1, !dbg !1553
  %771 = load i8, ptr %770, align 4, !dbg !1553
  %772 = zext i8 %771 to i32, !dbg !1550
  %773 = icmp eq i32 %772, 4, !dbg !1554
  br i1 %773, label %774, label %790, !dbg !1555

774:                                              ; preds = %768
  %775 = load ptr, ptr %2, align 8, !dbg !1556
  %776 = getelementptr inbounds nuw %struct.object, ptr %775, i32 0, i32 15, !dbg !1557
  %777 = load ptr, ptr %2, align 8, !dbg !1558
  %778 = getelementptr inbounds nuw %struct.object, ptr %777, i32 0, i32 9, !dbg !1559
  %779 = load i16, ptr %778, align 2, !dbg !1559
  %780 = sext i16 %779 to i32, !dbg !1558
  %781 = call noundef i32 @_Z14find_point_segP10vms_vectori(ptr noundef %776, i32 noundef %780), !dbg !1560
  store i32 %781, ptr %39, align 4, !dbg !1561
  %782 = icmp ne i32 %781, -1, !dbg !1562
  br i1 %782, label %783, label %790, !dbg !1555

783:                                              ; preds = %774
  %784 = load ptr, ptr %2, align 8, !dbg !1563
  %785 = getelementptr inbounds nuw %struct.object, ptr %784, i32 0, i32 15, !dbg !1565
  %786 = load ptr, ptr %2, align 8, !dbg !1566
  %787 = getelementptr inbounds nuw %struct.object, ptr %786, i32 0, i32 11, !dbg !1567
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %787, ptr align 4 %785, i64 12, i1 false), !dbg !1568
  %788 = load i32, ptr %12, align 4, !dbg !1569
  %789 = load i32, ptr %39, align 4, !dbg !1570
  call void @_Z10obj_relinkii(i32 noundef %788, i32 noundef %789), !dbg !1571
  br label %804, !dbg !1572

790:                                              ; preds = %774, %768
  %791 = load ptr, ptr %2, align 8, !dbg !1573
  %792 = getelementptr inbounds nuw %struct.object, ptr %791, i32 0, i32 11, !dbg !1575
  %793 = load ptr, ptr %2, align 8, !dbg !1576
  %794 = getelementptr inbounds nuw %struct.object, ptr %793, i32 0, i32 9, !dbg !1577
  %795 = load i16, ptr %794, align 2, !dbg !1577
  %796 = sext i16 %795 to i64, !dbg !1578
  %797 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %796, !dbg !1578
  call void @_Z22compute_segment_centerP10vms_vectorP7segment(ptr noundef %792, ptr noundef %797), !dbg !1579
  %798 = load i32, ptr %12, align 4, !dbg !1580
  %799 = load ptr, ptr %2, align 8, !dbg !1581
  %800 = getelementptr inbounds nuw %struct.object, ptr %799, i32 0, i32 11, !dbg !1582
  %801 = getelementptr inbounds nuw %struct.vms_vector, ptr %800, i32 0, i32 0, !dbg !1583
  %802 = load i32, ptr %801, align 4, !dbg !1584
  %803 = add nsw i32 %802, %798, !dbg !1584
  store i32 %803, ptr %801, align 4, !dbg !1584
  br label %804

804:                                              ; preds = %790, %783
  %805 = load ptr, ptr %2, align 8, !dbg !1585
  %806 = getelementptr inbounds nuw %struct.object, ptr %805, i32 0, i32 1, !dbg !1587
  %807 = load i8, ptr %806, align 4, !dbg !1587
  %808 = zext i8 %807 to i32, !dbg !1585
  %809 = icmp eq i32 %808, 5, !dbg !1588
  br i1 %809, label %810, label %817, !dbg !1588

810:                                              ; preds = %804
  %811 = load ptr, ptr %2, align 8, !dbg !1589
  %812 = getelementptr inbounds nuw %struct.object, ptr %811, i32 0, i32 8, !dbg !1590
  %813 = load i8, ptr %812, align 1, !dbg !1591
  %814 = zext i8 %813 to i32, !dbg !1591
  %815 = or i32 %814, 2, !dbg !1591
  %816 = trunc i32 %815 to i8, !dbg !1591
  store i8 %816, ptr %812, align 1, !dbg !1591
  br label %817, !dbg !1589

817:                                              ; preds = %810, %804
  br label %818, !dbg !1592

818:                                              ; preds = %817, %764
  br label %1601, !dbg !1593

819:                                              ; preds = %752
    #dbg_declare(ptr %40, !1594, !DIExpression(), !1596)
    #dbg_declare(ptr %41, !1597, !DIExpression(), !1598)
    #dbg_declare(ptr %42, !1599, !DIExpression(), !1600)
  %820 = load i32, ptr %20, align 4, !dbg !1601
  store i32 %820, ptr %21, align 4, !dbg !1602
  %821 = load ptr, ptr %2, align 8, !dbg !1603
  %822 = getelementptr inbounds nuw %struct.object, ptr %821, i32 0, i32 11, !dbg !1604
  %823 = call noundef i32 @_Z21vm_vec_normalized_dirP10vms_vectorS0_S0_(ptr noundef %40, ptr noundef %822, ptr noundef %17), !dbg !1605
  store i32 %823, ptr %42, align 4, !dbg !1606
  %824 = load i32, ptr %7, align 4, !dbg !1607
  %825 = icmp eq i32 %824, 1, !dbg !1609
  br i1 %825, label %826, label %840, !dbg !1610

826:                                              ; preds = %819
  %827 = call noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef %40, ptr noundef %8), !dbg !1611
  %828 = icmp slt i32 %827, 0, !dbg !1612
  br i1 %828, label %829, label %840, !dbg !1610

829:                                              ; preds = %826
  %830 = load ptr, ptr %2, align 8, !dbg !1613
  %831 = load ptr, ptr @debug_obj, align 8, !dbg !1616
  %832 = icmp eq ptr %830, %831, !dbg !1617
  br i1 %832, label %833, label %835, !dbg !1617

833:                                              ; preds = %829
  %834 = call i32 (ptr, ...) @printf(ptr noundef @.str.22), !dbg !1618
  br label %835, !dbg !1618

835:                                              ; preds = %833, %829
  %836 = load ptr, ptr %2, align 8, !dbg !1619
  %837 = getelementptr inbounds nuw %struct.object, ptr %836, i32 0, i32 11, !dbg !1620
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %837, ptr align 4 %17, i64 12, i1 false), !dbg !1621
  %838 = load i32, ptr %12, align 4, !dbg !1622
  %839 = load i32, ptr %18, align 4, !dbg !1623
  call void @_Z10obj_relinkii(i32 noundef %838, i32 noundef %839), !dbg !1624
  store i32 0, ptr %24, align 4, !dbg !1625
  br label %872, !dbg !1626

840:                                              ; preds = %826, %819
  %841 = call noundef i32 @_Z10vm_vec_magP10vms_vector(ptr noundef %8), !dbg !1627
  store i32 %841, ptr %41, align 4, !dbg !1629
  %842 = load i32, ptr %20, align 4, !dbg !1630
  %843 = load i32, ptr %41, align 4, !dbg !1631
  %844 = load i32, ptr %42, align 4, !dbg !1632
  %845 = sub nsw i32 %843, %844, !dbg !1633
  %846 = load i32, ptr %41, align 4, !dbg !1634
  %847 = call noundef i32 @_Z9fixmuldiviii(i32 noundef %842, i32 noundef %845, i32 noundef %846), !dbg !1635
  store i32 %847, ptr %20, align 4, !dbg !1636
  %848 = load i32, ptr %21, align 4, !dbg !1637
  %849 = load i32, ptr %20, align 4, !dbg !1638
  %850 = sub nsw i32 %848, %849, !dbg !1639
  store i32 %850, ptr %24, align 4, !dbg !1640
  %851 = load i32, ptr %20, align 4, !dbg !1641
  %852 = icmp slt i32 %851, 0, !dbg !1643
  br i1 %852, label %857, label %853, !dbg !1644

853:                                              ; preds = %840
  %854 = load i32, ptr %20, align 4, !dbg !1645
  %855 = load i32, ptr %21, align 4, !dbg !1646
  %856 = icmp sgt i32 %854, %855, !dbg !1647
  br i1 %856, label %857, label %871, !dbg !1644

857:                                              ; preds = %853, %840
  %858 = load i32, ptr %20, align 4, !dbg !1648
  %859 = load i32, ptr %21, align 4, !dbg !1648
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.23, i32 noundef %858, i32 noundef %859), !dbg !1648
  %860 = load ptr, ptr %2, align 8, !dbg !1650
  %861 = load ptr, ptr @debug_obj, align 8, !dbg !1652
  %862 = icmp eq ptr %860, %861, !dbg !1653
  br i1 %862, label %863, label %869, !dbg !1653

863:                                              ; preds = %857
  %864 = load i32, ptr %20, align 4, !dbg !1654
  %865 = load i32, ptr %21, align 4, !dbg !1655
  %866 = load i32, ptr %41, align 4, !dbg !1656
  %867 = load i32, ptr %42, align 4, !dbg !1657
  %868 = call i32 (ptr, ...) @printf(ptr noundef @.str.24, i32 noundef %864, i32 noundef %865, i32 noundef %866, i32 noundef %867), !dbg !1658
  br label %869, !dbg !1658

869:                                              ; preds = %863, %857
  %870 = load i32, ptr %21, align 4, !dbg !1659
  store i32 %870, ptr %20, align 4, !dbg !1660
  store i32 0, ptr %24, align 4, !dbg !1661
  br label %871, !dbg !1662

871:                                              ; preds = %869, %853
  br label %872

872:                                              ; preds = %871, %835
  %873 = load ptr, ptr %2, align 8, !dbg !1663
  %874 = load ptr, ptr @debug_obj, align 8, !dbg !1665
  %875 = icmp eq ptr %873, %874, !dbg !1666
  br i1 %875, label %876, label %879, !dbg !1666

876:                                              ; preds = %872
  %877 = load i32, ptr %20, align 4, !dbg !1667
  %878 = call i32 (ptr, ...) @printf(ptr noundef @.str.25, i32 noundef %877), !dbg !1668
  br label %879, !dbg !1668

879:                                              ; preds = %876, %872
  %880 = load i32, ptr %7, align 4, !dbg !1669
  switch i32 %880, label %1241 [
    i32 1, label %881
    i32 2, label %1145
    i32 0, label %1239
    i32 3, label %1240
  ], !dbg !1670

881:                                              ; preds = %879
    #dbg_declare(ptr %43, !1671, !DIExpression(), !1674)
    #dbg_declare(ptr %44, !1675, !DIExpression(), !1676)
    #dbg_declare(ptr %45, !1677, !DIExpression(), !1678)
  %882 = load ptr, ptr %2, align 8, !dbg !1679
  %883 = getelementptr inbounds nuw %struct.object, ptr %882, i32 0, i32 11, !dbg !1680
  %884 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %43, ptr noundef %883, ptr noundef %17), !dbg !1681
  %885 = getelementptr inbounds nuw %struct.fvi_info, ptr %15, i32 0, i32 6, !dbg !1682
  %886 = call noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef %43, ptr noundef %885), !dbg !1682
  store i32 %886, ptr %45, align 4, !dbg !1683
  %887 = load i32, ptr %45, align 4, !dbg !1684
  %888 = icmp ne i32 %887, 0, !dbg !1686
  br i1 %888, label %889, label %906, !dbg !1687

889:                                              ; preds = %881
  %890 = load i32, ptr %24, align 4, !dbg !1688
  %891 = icmp sgt i32 %890, 0, !dbg !1689
  br i1 %891, label %892, label %906, !dbg !1690

892:                                              ; preds = %889
  %893 = load i32, ptr %45, align 4, !dbg !1691
  %894 = load i32, ptr %24, align 4, !dbg !1692
  %895 = call noundef i32 @_Z6fixdivii(i32 noundef %893, i32 noundef %894), !dbg !1693
  %896 = sub nsw i32 0, %895, !dbg !1694
  store i32 %896, ptr %44, align 4, !dbg !1695
  %897 = icmp sgt i32 %896, 0, !dbg !1696
  br i1 %897, label %898, label %906, !dbg !1690

898:                                              ; preds = %892
  %899 = load ptr, ptr %2, align 8, !dbg !1697
  %900 = load i32, ptr %44, align 4, !dbg !1699
  %901 = load i32, ptr %13, align 4, !dbg !1700
  %902 = trunc i32 %901 to i16, !dbg !1700
  %903 = load i32, ptr %14, align 4, !dbg !1701
  %904 = trunc i32 %903 to i16, !dbg !1701
  %905 = getelementptr inbounds nuw %struct.fvi_info, ptr %15, i32 0, i32 1, !dbg !1702
  call void @_Z24collide_object_with_wallP6objectissP10vms_vector(ptr noundef %899, i32 noundef %900, i16 noundef signext %902, i16 noundef signext %904, ptr noundef %905), !dbg !1703
  br label %913, !dbg !1704

906:                                              ; preds = %892, %889, %881
  %907 = load ptr, ptr %2, align 8, !dbg !1705
  %908 = load i32, ptr %13, align 4, !dbg !1706
  %909 = trunc i32 %908 to i16, !dbg !1706
  %910 = load i32, ptr %14, align 4, !dbg !1707
  %911 = trunc i32 %910 to i16, !dbg !1707
  %912 = getelementptr inbounds nuw %struct.fvi_info, ptr %15, i32 0, i32 1, !dbg !1708
  call void @_Z21scrape_object_on_wallP6objectssP10vms_vector(ptr noundef %907, i16 noundef signext %909, i16 noundef signext %911, ptr noundef %912), !dbg !1709
  br label %913

913:                                              ; preds = %906, %898
  %914 = load i32, ptr %13, align 4, !dbg !1710
  %915 = icmp sgt i32 %914, -1, !dbg !1710
  %916 = zext i1 %915 to i32, !dbg !1710
  call void @_Z7_AssertiPKcS0_i(i32 noundef %916, ptr noundef @.str.26, ptr noundef @.str.1, i32 noundef 1322), !dbg !1710
  %917 = load i32, ptr %14, align 4, !dbg !1711
  %918 = icmp sgt i32 %917, -1, !dbg !1711
  %919 = zext i1 %918 to i32, !dbg !1711
  call void @_Z7_AssertiPKcS0_i(i32 noundef %919, ptr noundef @.str.27, ptr noundef @.str.1, i32 noundef 1323), !dbg !1711
  %920 = load ptr, ptr %2, align 8, !dbg !1712
  %921 = getelementptr inbounds nuw %struct.object, ptr %920, i32 0, i32 8, !dbg !1714
  %922 = load i8, ptr %921, align 1, !dbg !1714
  %923 = zext i8 %922 to i32, !dbg !1712
  %924 = and i32 %923, 2, !dbg !1715
  %925 = icmp ne i32 %924, 0, !dbg !1716
  br i1 %925, label %1144, label %926, !dbg !1717

926:                                              ; preds = %913
    #dbg_declare(ptr %46, !1718, !DIExpression(), !1720)
  %927 = load i8, ptr @BounceCheat, align 1, !dbg !1721
  %928 = icmp ne i8 %927, 0, !dbg !1721
  br i1 %928, label %948, label %929, !dbg !1721

929:                                              ; preds = %926
  %930 = load ptr, ptr %2, align 8, !dbg !1721
  %931 = getelementptr inbounds nuw %struct.object, ptr %930, i32 0, i32 21, !dbg !1721
  %932 = getelementptr inbounds nuw %struct.physics_info, ptr %931, i32 0, i32 8, !dbg !1721
  %933 = load i16, ptr %932, align 2, !dbg !1721
  %934 = zext i16 %933 to i32, !dbg !1721
  %935 = and i32 %934, 16, !dbg !1721
  %936 = icmp ne i32 %935, 0, !dbg !1721
  br i1 %936, label %937, label %945, !dbg !1721

937:                                              ; preds = %929
  %938 = load ptr, ptr %2, align 8, !dbg !1721
  %939 = getelementptr inbounds nuw %struct.object, ptr %938, i32 0, i32 21, !dbg !1721
  %940 = getelementptr inbounds nuw %struct.physics_info, ptr %939, i32 0, i32 8, !dbg !1721
  %941 = load i16, ptr %940, align 2, !dbg !1721
  %942 = zext i16 %941 to i32, !dbg !1721
  %943 = and i32 %942, 4, !dbg !1721
  %944 = icmp ne i32 %943, 0, !dbg !1721
  br label %945

945:                                              ; preds = %937, %929
  %946 = phi i1 [ false, %929 ], [ %944, %937 ], !dbg !1722
  %947 = xor i1 %946, true, !dbg !1721
  br label %948, !dbg !1721

948:                                              ; preds = %945, %926
  %949 = phi i1 [ true, %926 ], [ %947, %945 ]
  %950 = zext i1 %949 to i32, !dbg !1721
  call void @_Z7_AssertiPKcS0_i(i32 noundef %950, ptr noundef @.str.28, ptr noundef @.str.1, i32 noundef 1328), !dbg !1721
  %951 = load i32, ptr %13, align 4, !dbg !1723
  %952 = sext i32 %951 to i64, !dbg !1724
  %953 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %952, !dbg !1724
  %954 = getelementptr inbounds nuw %struct.segment, ptr %953, i32 0, i32 0, !dbg !1725
  %955 = load i32, ptr %14, align 4, !dbg !1726
  %956 = sext i32 %955 to i64, !dbg !1724
  %957 = getelementptr inbounds [6 x %struct.side], ptr %954, i64 0, i64 %956, !dbg !1724
  %958 = getelementptr inbounds nuw %struct.side, ptr %957, i32 0, i32 3, !dbg !1727
  %959 = load i16, ptr %958, align 4, !dbg !1727
  %960 = sext i16 %959 to i64, !dbg !1728
  %961 = getelementptr inbounds [1200 x %struct.tmap_info], ptr @TmapInfo, i64 0, i64 %960, !dbg !1728
  %962 = getelementptr inbounds nuw %struct.tmap_info, ptr %961, i32 0, i32 0, !dbg !1729
  %963 = load i8, ptr %962, align 4, !dbg !1729
  %964 = zext i8 %963 to i32, !dbg !1728
  %965 = and i32 %964, 4, !dbg !1730
  store i32 %965, ptr %46, align 4, !dbg !1731
  %966 = load i32, ptr %46, align 4, !dbg !1732
  %967 = icmp ne i32 %966, 0, !dbg !1732
  br i1 %967, label %992, label %968, !dbg !1734

968:                                              ; preds = %948
  %969 = load ptr, ptr %2, align 8, !dbg !1735
  %970 = getelementptr inbounds nuw %struct.object, ptr %969, i32 0, i32 21, !dbg !1736
  %971 = getelementptr inbounds nuw %struct.physics_info, ptr %970, i32 0, i32 8, !dbg !1737
  %972 = load i16, ptr %971, align 2, !dbg !1737
  %973 = zext i16 %972 to i32, !dbg !1735
  %974 = and i32 %973, 16, !dbg !1738
  %975 = icmp ne i32 %974, 0, !dbg !1739
  br i1 %975, label %976, label %992, !dbg !1734

976:                                              ; preds = %968
  %977 = load ptr, ptr %2, align 8, !dbg !1740
  %978 = load i32, ptr %13, align 4, !dbg !1742
  %979 = load i32, ptr %14, align 4, !dbg !1743
  call void @_Z16add_stuck_objectP6objectii(ptr noundef %977, i32 noundef %978, i32 noundef %979), !dbg !1744
  %980 = load ptr, ptr %2, align 8, !dbg !1745
  %981 = getelementptr inbounds nuw %struct.object, ptr %980, i32 0, i32 21, !dbg !1745
  %982 = getelementptr inbounds nuw %struct.physics_info, ptr %981, i32 0, i32 0, !dbg !1745
  %983 = getelementptr inbounds nuw %struct.vms_vector, ptr %982, i32 0, i32 2, !dbg !1745
  store i32 0, ptr %983, align 4, !dbg !1745
  %984 = load ptr, ptr %2, align 8, !dbg !1745
  %985 = getelementptr inbounds nuw %struct.object, ptr %984, i32 0, i32 21, !dbg !1745
  %986 = getelementptr inbounds nuw %struct.physics_info, ptr %985, i32 0, i32 0, !dbg !1745
  %987 = getelementptr inbounds nuw %struct.vms_vector, ptr %986, i32 0, i32 1, !dbg !1745
  store i32 0, ptr %987, align 4, !dbg !1745
  %988 = load ptr, ptr %2, align 8, !dbg !1745
  %989 = getelementptr inbounds nuw %struct.object, ptr %988, i32 0, i32 21, !dbg !1745
  %990 = getelementptr inbounds nuw %struct.physics_info, ptr %989, i32 0, i32 0, !dbg !1745
  %991 = getelementptr inbounds nuw %struct.vms_vector, ptr %990, i32 0, i32 0, !dbg !1745
  store i32 0, ptr %991, align 4, !dbg !1745
  store i32 1, ptr %23, align 4, !dbg !1746
  store i32 0, ptr %6, align 4, !dbg !1747
  br label %1143, !dbg !1748

992:                                              ; preds = %968, %948
    #dbg_declare(ptr %47, !1749, !DIExpression(), !1751)
  store i32 0, ptr %47, align 4, !dbg !1751
  %993 = getelementptr inbounds nuw %struct.fvi_info, ptr %15, i32 0, i32 6, !dbg !1752
  %994 = load ptr, ptr %2, align 8, !dbg !1752
  %995 = getelementptr inbounds nuw %struct.object, ptr %994, i32 0, i32 21, !dbg !1752
  %996 = getelementptr inbounds nuw %struct.physics_info, ptr %995, i32 0, i32 0, !dbg !1752
  %997 = call noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef %993, ptr noundef %996), !dbg !1752
  store i32 %997, ptr %45, align 4, !dbg !1753
  %998 = load i32, ptr %46, align 4, !dbg !1754
  %999 = icmp ne i32 %998, 0, !dbg !1754
  br i1 %999, label %1008, label %1000, !dbg !1756

1000:                                             ; preds = %992
  %1001 = load ptr, ptr %2, align 8, !dbg !1757
  %1002 = getelementptr inbounds nuw %struct.object, ptr %1001, i32 0, i32 21, !dbg !1758
  %1003 = getelementptr inbounds nuw %struct.physics_info, ptr %1002, i32 0, i32 8, !dbg !1759
  %1004 = load i16, ptr %1003, align 2, !dbg !1759
  %1005 = zext i16 %1004 to i32, !dbg !1757
  %1006 = and i32 %1005, 4, !dbg !1760
  %1007 = icmp ne i32 %1006, 0, !dbg !1761
  br i1 %1007, label %1008, label %1063, !dbg !1756

1008:                                             ; preds = %1000, %992
  %1009 = load i32, ptr %45, align 4, !dbg !1762
  %1010 = mul nsw i32 %1009, 2, !dbg !1762
  store i32 %1010, ptr %45, align 4, !dbg !1762
  %1011 = load i32, ptr %46, align 4, !dbg !1764
  %1012 = icmp ne i32 %1011, 0, !dbg !1764
  br i1 %1012, label %1013, label %1023, !dbg !1764

1013:                                             ; preds = %1008
  store i32 1, ptr %47, align 4, !dbg !1766
  %1014 = load ptr, ptr %2, align 8, !dbg !1768
  %1015 = getelementptr inbounds nuw %struct.object, ptr %1014, i32 0, i32 1, !dbg !1770
  %1016 = load i8, ptr %1015, align 4, !dbg !1770
  %1017 = zext i8 %1016 to i32, !dbg !1768
  %1018 = icmp eq i32 %1017, 4, !dbg !1771
  br i1 %1018, label %1019, label %1022, !dbg !1771

1019:                                             ; preds = %1013
  %1020 = load i32, ptr %45, align 4, !dbg !1772
  %1021 = mul nsw i32 %1020, 2, !dbg !1772
  store i32 %1021, ptr %45, align 4, !dbg !1772
  br label %1022, !dbg !1773

1022:                                             ; preds = %1019, %1013
  br label %1023, !dbg !1774

1023:                                             ; preds = %1022, %1008
  %1024 = load ptr, ptr %2, align 8, !dbg !1775
  %1025 = getelementptr inbounds nuw %struct.object, ptr %1024, i32 0, i32 21, !dbg !1777
  %1026 = getelementptr inbounds nuw %struct.physics_info, ptr %1025, i32 0, i32 8, !dbg !1778
  %1027 = load i16, ptr %1026, align 2, !dbg !1778
  %1028 = zext i16 %1027 to i32, !dbg !1775
  %1029 = and i32 %1028, 512, !dbg !1779
  %1030 = icmp ne i32 %1029, 0, !dbg !1775
  br i1 %1030, label %1031, label %1062, !dbg !1775

1031:                                             ; preds = %1023
  %1032 = load ptr, ptr %2, align 8, !dbg !1780
  %1033 = getelementptr inbounds nuw %struct.object, ptr %1032, i32 0, i32 21, !dbg !1780
  %1034 = getelementptr inbounds nuw %struct.physics_info, ptr %1033, i32 0, i32 8, !dbg !1780
  %1035 = load i16, ptr %1034, align 2, !dbg !1780
  %1036 = zext i16 %1035 to i32, !dbg !1780
  %1037 = and i32 %1036, 4, !dbg !1780
  call void @_Z7_AssertiPKcS0_i(i32 noundef %1037, ptr noundef @.str.29, ptr noundef @.str.1, i32 noundef 1361), !dbg !1780
  %1038 = load ptr, ptr %2, align 8, !dbg !1782
  %1039 = getelementptr inbounds nuw %struct.object, ptr %1038, i32 0, i32 21, !dbg !1784
  %1040 = getelementptr inbounds nuw %struct.physics_info, ptr %1039, i32 0, i32 8, !dbg !1785
  %1041 = load i16, ptr %1040, align 2, !dbg !1785
  %1042 = zext i16 %1041 to i32, !dbg !1782
  %1043 = and i32 %1042, 128, !dbg !1786
  %1044 = icmp ne i32 %1043, 0, !dbg !1782
  br i1 %1044, label %1045, label %1053, !dbg !1782

1045:                                             ; preds = %1031
  %1046 = load ptr, ptr %2, align 8, !dbg !1787
  %1047 = getelementptr inbounds nuw %struct.object, ptr %1046, i32 0, i32 21, !dbg !1788
  %1048 = getelementptr inbounds nuw %struct.physics_info, ptr %1047, i32 0, i32 8, !dbg !1789
  %1049 = load i16, ptr %1048, align 2, !dbg !1790
  %1050 = zext i16 %1049 to i32, !dbg !1790
  %1051 = and i32 %1050, -645, !dbg !1790
  %1052 = trunc i32 %1051 to i16, !dbg !1790
  store i16 %1052, ptr %1048, align 2, !dbg !1790
  br label %1061, !dbg !1787

1053:                                             ; preds = %1031
  %1054 = load ptr, ptr %2, align 8, !dbg !1791
  %1055 = getelementptr inbounds nuw %struct.object, ptr %1054, i32 0, i32 21, !dbg !1792
  %1056 = getelementptr inbounds nuw %struct.physics_info, ptr %1055, i32 0, i32 8, !dbg !1793
  %1057 = load i16, ptr %1056, align 2, !dbg !1794
  %1058 = zext i16 %1057 to i32, !dbg !1794
  %1059 = or i32 %1058, 128, !dbg !1794
  %1060 = trunc i32 %1059 to i16, !dbg !1794
  store i16 %1060, ptr %1056, align 2, !dbg !1794
  br label %1061

1061:                                             ; preds = %1053, %1045
  br label %1062, !dbg !1795

1062:                                             ; preds = %1061, %1023
  store i32 1, ptr %29, align 4, !dbg !1796
  br label %1063, !dbg !1797

1063:                                             ; preds = %1062, %1000
  %1064 = load ptr, ptr %2, align 8, !dbg !1798
  %1065 = getelementptr inbounds nuw %struct.object, ptr %1064, i32 0, i32 21, !dbg !1799
  %1066 = getelementptr inbounds nuw %struct.physics_info, ptr %1065, i32 0, i32 0, !dbg !1800
  %1067 = getelementptr inbounds nuw %struct.fvi_info, ptr %15, i32 0, i32 6, !dbg !1801
  %1068 = load i32, ptr %45, align 4, !dbg !1802
  %1069 = sub nsw i32 0, %1068, !dbg !1803
  %1070 = call noundef ptr @_Z17vm_vec_scale_add2P10vms_vectorS0_i(ptr noundef %1066, ptr noundef %1067, i32 noundef %1069), !dbg !1804
  %1071 = load i32, ptr %47, align 4, !dbg !1805
  %1072 = icmp ne i32 %1071, 0, !dbg !1805
  br i1 %1072, label %1073, label %1090, !dbg !1805

1073:                                             ; preds = %1063
    #dbg_declare(ptr %48, !1807, !DIExpression(), !1809)
  %1074 = load ptr, ptr %2, align 8, !dbg !1810
  %1075 = getelementptr inbounds nuw %struct.object, ptr %1074, i32 0, i32 21, !dbg !1811
  %1076 = getelementptr inbounds nuw %struct.physics_info, ptr %1075, i32 0, i32 0, !dbg !1812
  %1077 = call noundef i32 @_Z16vm_vec_mag_quickP10vms_vector(ptr noundef %1076), !dbg !1813
  store i32 %1077, ptr %48, align 4, !dbg !1809
  %1078 = load i32, ptr %48, align 4, !dbg !1814
  %1079 = call noundef i32 @_Z3i2fi(i32 noundef 100), !dbg !1816
  %1080 = icmp sgt i32 %1078, %1079, !dbg !1817
  br i1 %1080, label %1081, label %1089, !dbg !1817

1081:                                             ; preds = %1073
  %1082 = load ptr, ptr %2, align 8, !dbg !1818
  %1083 = getelementptr inbounds nuw %struct.object, ptr %1082, i32 0, i32 21, !dbg !1819
  %1084 = getelementptr inbounds nuw %struct.physics_info, ptr %1083, i32 0, i32 0, !dbg !1820
  %1085 = call noundef i32 @_Z3i2fi(i32 noundef 100), !dbg !1821
  %1086 = load i32, ptr %48, align 4, !dbg !1822
  %1087 = call noundef i32 @_Z6fixdivii(i32 noundef %1085, i32 noundef %1086), !dbg !1823
  %1088 = call noundef ptr @_Z12vm_vec_scaleP10vms_vectori(ptr noundef %1084, i32 noundef %1087), !dbg !1824
  br label %1089, !dbg !1824

1089:                                             ; preds = %1081, %1073
  br label %1090, !dbg !1825

1090:                                             ; preds = %1089, %1063
  %1091 = load i32, ptr %29, align 4, !dbg !1826
  %1092 = icmp ne i32 %1091, 0, !dbg !1826
  br i1 %1092, label %1093, label %1109, !dbg !1828

1093:                                             ; preds = %1090
  %1094 = load ptr, ptr %2, align 8, !dbg !1829
  %1095 = getelementptr inbounds nuw %struct.object, ptr %1094, i32 0, i32 1, !dbg !1830
  %1096 = load i8, ptr %1095, align 4, !dbg !1830
  %1097 = zext i8 %1096 to i32, !dbg !1829
  %1098 = icmp eq i32 %1097, 5, !dbg !1831
  br i1 %1098, label %1099, label %1109, !dbg !1828

1099:                                             ; preds = %1093
  %1100 = load ptr, ptr %2, align 8, !dbg !1832
  %1101 = getelementptr inbounds nuw %struct.object, ptr %1100, i32 0, i32 12, !dbg !1833
  %1102 = load ptr, ptr %2, align 8, !dbg !1834
  %1103 = getelementptr inbounds nuw %struct.object, ptr %1102, i32 0, i32 21, !dbg !1835
  %1104 = getelementptr inbounds nuw %struct.physics_info, ptr %1103, i32 0, i32 0, !dbg !1836
  %1105 = load ptr, ptr %2, align 8, !dbg !1837
  %1106 = getelementptr inbounds nuw %struct.object, ptr %1105, i32 0, i32 12, !dbg !1838
  %1107 = getelementptr inbounds nuw %struct.vms_matrix, ptr %1106, i32 0, i32 1, !dbg !1839
  %1108 = call noundef ptr @_Z18vm_vector_2_matrixP10vms_matrixP10vms_vectorS2_S2_(ptr noundef %1101, ptr noundef %1104, ptr noundef %1107, ptr noundef null), !dbg !1840
  br label %1109, !dbg !1840

1109:                                             ; preds = %1099, %1093, %1090
  %1110 = load ptr, ptr %2, align 8, !dbg !1841
  %1111 = load ptr, ptr @debug_obj, align 8, !dbg !1843
  %1112 = icmp eq ptr %1110, %1111, !dbg !1844
  br i1 %1112, label %1113, label %1142, !dbg !1844

1113:                                             ; preds = %1109
  %1114 = load i32, ptr %45, align 4, !dbg !1845
  %1115 = getelementptr inbounds nuw %struct.fvi_info, ptr %15, i32 0, i32 6, !dbg !1847
  %1116 = getelementptr inbounds nuw %struct.vms_vector, ptr %1115, i32 0, i32 0, !dbg !1847
  %1117 = load i32, ptr %1116, align 4, !dbg !1847
  %1118 = getelementptr inbounds nuw %struct.fvi_info, ptr %15, i32 0, i32 6, !dbg !1847
  %1119 = getelementptr inbounds nuw %struct.vms_vector, ptr %1118, i32 0, i32 1, !dbg !1847
  %1120 = load i32, ptr %1119, align 4, !dbg !1847
  %1121 = getelementptr inbounds nuw %struct.fvi_info, ptr %15, i32 0, i32 6, !dbg !1847
  %1122 = getelementptr inbounds nuw %struct.vms_vector, ptr %1121, i32 0, i32 2, !dbg !1847
  %1123 = load i32, ptr %1122, align 4, !dbg !1847
  %1124 = call i32 (ptr, ...) @printf(ptr noundef @.str.30, i32 noundef %1114, i32 noundef %1117, i32 noundef %1120, i32 noundef %1123), !dbg !1848
  %1125 = load i32, ptr %45, align 4, !dbg !1849
  %1126 = load ptr, ptr %2, align 8, !dbg !1850
  %1127 = getelementptr inbounds nuw %struct.object, ptr %1126, i32 0, i32 21, !dbg !1850
  %1128 = getelementptr inbounds nuw %struct.physics_info, ptr %1127, i32 0, i32 0, !dbg !1850
  %1129 = getelementptr inbounds nuw %struct.vms_vector, ptr %1128, i32 0, i32 0, !dbg !1850
  %1130 = load i32, ptr %1129, align 4, !dbg !1850
  %1131 = load ptr, ptr %2, align 8, !dbg !1850
  %1132 = getelementptr inbounds nuw %struct.object, ptr %1131, i32 0, i32 21, !dbg !1850
  %1133 = getelementptr inbounds nuw %struct.physics_info, ptr %1132, i32 0, i32 0, !dbg !1850
  %1134 = getelementptr inbounds nuw %struct.vms_vector, ptr %1133, i32 0, i32 1, !dbg !1850
  %1135 = load i32, ptr %1134, align 4, !dbg !1850
  %1136 = load ptr, ptr %2, align 8, !dbg !1850
  %1137 = getelementptr inbounds nuw %struct.object, ptr %1136, i32 0, i32 21, !dbg !1850
  %1138 = getelementptr inbounds nuw %struct.physics_info, ptr %1137, i32 0, i32 0, !dbg !1850
  %1139 = getelementptr inbounds nuw %struct.vms_vector, ptr %1138, i32 0, i32 2, !dbg !1850
  %1140 = load i32, ptr %1139, align 4, !dbg !1850
  %1141 = call i32 (ptr, ...) @printf(ptr noundef @.str.31, i32 noundef %1125, i32 noundef %1130, i32 noundef %1135, i32 noundef %1140), !dbg !1851
  br label %1142, !dbg !1852

1142:                                             ; preds = %1113, %1109
  store i32 1, ptr %6, align 4, !dbg !1853
  br label %1143

1143:                                             ; preds = %1142, %976
  br label %1144, !dbg !1854

1144:                                             ; preds = %1143, %913
  br label %1242, !dbg !1855

1145:                                             ; preds = %879
    #dbg_declare(ptr %49, !1856, !DIExpression(), !1858)
  %1146 = getelementptr inbounds nuw %struct.fvi_info, ptr %15, i32 0, i32 5, !dbg !1859
  %1147 = load i32, ptr %1146, align 4, !dbg !1859
  %1148 = icmp ne i32 %1147, -1, !dbg !1859
  %1149 = zext i1 %1148 to i32, !dbg !1859
  call void @_Z7_AssertiPKcS0_i(i32 noundef %1149, ptr noundef @.str.32, ptr noundef @.str.1, i32 noundef 1407), !dbg !1859
    #dbg_declare(ptr %50, !1860, !DIExpression(), !1862)
    #dbg_declare(ptr %51, !1863, !DIExpression(), !1864)
    #dbg_declare(ptr %52, !1865, !DIExpression(), !1866)
    #dbg_declare(ptr %53, !1867, !DIExpression(), !1868)
    #dbg_declare(ptr %54, !1869, !DIExpression(), !1870)
  %1150 = getelementptr inbounds nuw %struct.fvi_info, ptr %15, i32 0, i32 5, !dbg !1871
  %1151 = load i32, ptr %1150, align 4, !dbg !1871
  %1152 = sext i32 %1151 to i64, !dbg !1872
  %1153 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %1152, !dbg !1872
  %1154 = getelementptr inbounds nuw %struct.object, ptr %1153, i32 0, i32 11, !dbg !1873
  store ptr %1154, ptr %50, align 8, !dbg !1874
  %1155 = load ptr, ptr %2, align 8, !dbg !1875
  %1156 = getelementptr inbounds nuw %struct.object, ptr %1155, i32 0, i32 11, !dbg !1876
  store ptr %1156, ptr %51, align 8, !dbg !1877
  %1157 = getelementptr inbounds nuw %struct.fvi_info, ptr %15, i32 0, i32 5, !dbg !1878
  %1158 = load i32, ptr %1157, align 4, !dbg !1878
  %1159 = sext i32 %1158 to i64, !dbg !1879
  %1160 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %1159, !dbg !1879
  %1161 = getelementptr inbounds nuw %struct.object, ptr %1160, i32 0, i32 13, !dbg !1880
  %1162 = load i32, ptr %1161, align 4, !dbg !1880
  store i32 %1162, ptr %53, align 4, !dbg !1881
  %1163 = load ptr, ptr %2, align 8, !dbg !1882
  %1164 = getelementptr inbounds nuw %struct.object, ptr %1163, i32 0, i32 13, !dbg !1883
  %1165 = load i32, ptr %1164, align 4, !dbg !1883
  store i32 %1165, ptr %54, align 4, !dbg !1884
  %1166 = load i32, ptr %53, align 4, !dbg !1885
  %1167 = load i32, ptr %54, align 4, !dbg !1885
  %1168 = add nsw i32 %1166, %1167, !dbg !1885
  %1169 = icmp ne i32 %1168, 0, !dbg !1885
  %1170 = zext i1 %1169 to i32, !dbg !1885
  call void @_Z7_AssertiPKcS0_i(i32 noundef %1170, ptr noundef @.str.33, ptr noundef @.str.1, i32 noundef 1416), !dbg !1885
  %1171 = load ptr, ptr %51, align 8, !dbg !1886
  %1172 = load ptr, ptr %50, align 8, !dbg !1887
  %1173 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %52, ptr noundef %1171, ptr noundef %1172), !dbg !1888
  %1174 = load ptr, ptr %50, align 8, !dbg !1889
  %1175 = load i32, ptr %53, align 4, !dbg !1890
  %1176 = load i32, ptr %53, align 4, !dbg !1891
  %1177 = load i32, ptr %54, align 4, !dbg !1892
  %1178 = add nsw i32 %1176, %1177, !dbg !1893
  %1179 = call noundef i32 @_Z6fixdivii(i32 noundef %1175, i32 noundef %1178), !dbg !1894
  %1180 = call noundef ptr @_Z16vm_vec_scale_addP10vms_vectorS0_S0_i(ptr noundef %52, ptr noundef %1174, ptr noundef %52, i32 noundef %1179), !dbg !1895
  %1181 = load ptr, ptr %2, align 8, !dbg !1896
  %1182 = getelementptr inbounds nuw %struct.object, ptr %1181, i32 0, i32 21, !dbg !1897
  %1183 = getelementptr inbounds nuw %struct.physics_info, ptr %1182, i32 0, i32 0, !dbg !1898
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %49, ptr align 4 %1183, i64 12, i1 false), !dbg !1899
  %1184 = load ptr, ptr %2, align 8, !dbg !1900
  %1185 = getelementptr inbounds nuw %struct.fvi_info, ptr %15, i32 0, i32 5, !dbg !1901
  %1186 = load i32, ptr %1185, align 4, !dbg !1901
  %1187 = sext i32 %1186 to i64, !dbg !1902
  %1188 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %1187, !dbg !1902
  call void @_Z19collide_two_objectsP6objectS0_P10vms_vector(ptr noundef %1184, ptr noundef %1188, ptr noundef %52), !dbg !1903
  %1189 = load ptr, ptr %2, align 8, !dbg !1904
  %1190 = getelementptr inbounds nuw %struct.object, ptr %1189, i32 0, i32 8, !dbg !1906
  %1191 = load i8, ptr %1190, align 1, !dbg !1906
  %1192 = zext i8 %1191 to i32, !dbg !1904
  %1193 = and i32 %1192, 2, !dbg !1907
  %1194 = icmp ne i32 %1193, 0, !dbg !1908
  br i1 %1194, label %1238, label %1195, !dbg !1909

1195:                                             ; preds = %1145
  %1196 = load ptr, ptr %2, align 8, !dbg !1910
  %1197 = getelementptr inbounds nuw %struct.object, ptr %1196, i32 0, i32 21, !dbg !1913
  %1198 = getelementptr inbounds nuw %struct.physics_info, ptr %1197, i32 0, i32 8, !dbg !1914
  %1199 = load i16, ptr %1198, align 2, !dbg !1914
  %1200 = zext i16 %1199 to i32, !dbg !1910
  %1201 = and i32 %1200, 32, !dbg !1915
  %1202 = icmp ne i32 %1201, 0, !dbg !1910
  br i1 %1202, label %1230, label %1203, !dbg !1916

1203:                                             ; preds = %1195
  %1204 = getelementptr inbounds nuw %struct.vms_vector, ptr %49, i32 0, i32 0, !dbg !1917
  %1205 = load i32, ptr %1204, align 4, !dbg !1917
  %1206 = load ptr, ptr %2, align 8, !dbg !1918
  %1207 = getelementptr inbounds nuw %struct.object, ptr %1206, i32 0, i32 21, !dbg !1919
  %1208 = getelementptr inbounds nuw %struct.physics_info, ptr %1207, i32 0, i32 0, !dbg !1920
  %1209 = getelementptr inbounds nuw %struct.vms_vector, ptr %1208, i32 0, i32 0, !dbg !1921
  %1210 = load i32, ptr %1209, align 4, !dbg !1921
  %1211 = icmp eq i32 %1205, %1210, !dbg !1922
  br i1 %1211, label %1212, label %1237, !dbg !1923

1212:                                             ; preds = %1203
  %1213 = getelementptr inbounds nuw %struct.vms_vector, ptr %49, i32 0, i32 1, !dbg !1924
  %1214 = load i32, ptr %1213, align 4, !dbg !1924
  %1215 = load ptr, ptr %2, align 8, !dbg !1925
  %1216 = getelementptr inbounds nuw %struct.object, ptr %1215, i32 0, i32 21, !dbg !1926
  %1217 = getelementptr inbounds nuw %struct.physics_info, ptr %1216, i32 0, i32 0, !dbg !1927
  %1218 = getelementptr inbounds nuw %struct.vms_vector, ptr %1217, i32 0, i32 1, !dbg !1928
  %1219 = load i32, ptr %1218, align 4, !dbg !1928
  %1220 = icmp eq i32 %1214, %1219, !dbg !1929
  br i1 %1220, label %1221, label %1237, !dbg !1930

1221:                                             ; preds = %1212
  %1222 = getelementptr inbounds nuw %struct.vms_vector, ptr %49, i32 0, i32 2, !dbg !1931
  %1223 = load i32, ptr %1222, align 4, !dbg !1931
  %1224 = load ptr, ptr %2, align 8, !dbg !1932
  %1225 = getelementptr inbounds nuw %struct.object, ptr %1224, i32 0, i32 21, !dbg !1933
  %1226 = getelementptr inbounds nuw %struct.physics_info, ptr %1225, i32 0, i32 0, !dbg !1934
  %1227 = getelementptr inbounds nuw %struct.vms_vector, ptr %1226, i32 0, i32 2, !dbg !1935
  %1228 = load i32, ptr %1227, align 4, !dbg !1935
  %1229 = icmp eq i32 %1223, %1228, !dbg !1936
  br i1 %1229, label %1230, label %1237, !dbg !1916

1230:                                             ; preds = %1221, %1195
  %1231 = getelementptr inbounds nuw %struct.fvi_info, ptr %15, i32 0, i32 5, !dbg !1937
  %1232 = load i32, ptr %1231, align 4, !dbg !1937
  %1233 = load i32, ptr %4, align 4, !dbg !1939
  %1234 = add nsw i32 %1233, 1, !dbg !1939
  store i32 %1234, ptr %4, align 4, !dbg !1939
  %1235 = sext i32 %1233 to i64, !dbg !1940
  %1236 = getelementptr inbounds [100 x i32], ptr %3, i64 0, i64 %1235, !dbg !1940
  store i32 %1232, ptr %1236, align 4, !dbg !1941
  store i32 1, ptr %6, align 4, !dbg !1942
  br label %1237, !dbg !1943

1237:                                             ; preds = %1230, %1221, %1212, %1203
  br label %1238, !dbg !1944

1238:                                             ; preds = %1237, %1145
  br label %1242, !dbg !1945

1239:                                             ; preds = %879
  br label %1242, !dbg !1946

1240:                                             ; preds = %879
  call void @_Z4Int3v(), !dbg !1947
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.34), !dbg !1948
  br label %1242, !dbg !1949

1241:                                             ; preds = %879
  call void @_Z4Int3v(), !dbg !1950
  br label %1242, !dbg !1951

1242:                                             ; preds = %1241, %1240, %1239, %1238, %1144
  br label %1243, !dbg !1952

1243:                                             ; preds = %1242
  %1244 = load i32, ptr %6, align 4, !dbg !1953
  %1245 = icmp ne i32 %1244, 0, !dbg !1953
  br i1 %1245, label %350, label %1246, !dbg !1952, !llvm.loop !1954

1246:                                             ; preds = %1243
  br label %1247, !dbg !1956

1247:                                             ; preds = %1246, %700, %397, %395, %380
  %1248 = load ptr, ptr %2, align 8, !dbg !1956
  %1249 = getelementptr inbounds nuw %struct.object, ptr %1248, i32 0, i32 5, !dbg !1958
  %1250 = load i8, ptr %1249, align 2, !dbg !1958
  %1251 = zext i8 %1250 to i32, !dbg !1956
  %1252 = icmp eq i32 %1251, 1, !dbg !1959
  br i1 %1252, label %1253, label %1270, !dbg !1959

1253:                                             ; preds = %1247
  %1254 = load i32, ptr %11, align 4, !dbg !1960
  %1255 = icmp sgt i32 %1254, 0, !dbg !1963
  br i1 %1255, label %1256, label %1269, !dbg !1963

1256:                                             ; preds = %1253
  %1257 = load i32, ptr %11, align 4, !dbg !1964
  %1258 = sub nsw i32 %1257, 1, !dbg !1966
  %1259 = load i32, ptr %12, align 4, !dbg !1967
  %1260 = sext i32 %1259 to i64, !dbg !1968
  %1261 = getelementptr inbounds [350 x %struct.ai_local], ptr @Ai_local_info, i64 0, i64 %1260, !dbg !1968
  %1262 = getelementptr inbounds nuw %struct.ai_local, ptr %1261, i32 0, i32 1, !dbg !1969
  store i32 %1258, ptr %1262, align 4, !dbg !1970
  %1263 = load i32, ptr %11, align 4, !dbg !1971
  %1264 = sub nsw i32 %1263, 1, !dbg !1972
  %1265 = load i32, ptr @Total_retries, align 4, !dbg !1973
  %1266 = add nsw i32 %1265, %1264, !dbg !1973
  store i32 %1266, ptr @Total_retries, align 4, !dbg !1973
  %1267 = load i32, ptr @Total_sims, align 4, !dbg !1974
  %1268 = add nsw i32 %1267, 1, !dbg !1974
  store i32 %1268, ptr @Total_sims, align 4, !dbg !1974
  br label %1269, !dbg !1975

1269:                                             ; preds = %1256, %1253
  br label %1270, !dbg !1976

1270:                                             ; preds = %1269, %1247
  %1271 = load i32, ptr %23, align 4, !dbg !1977
  %1272 = icmp ne i32 %1271, 0, !dbg !1977
  br i1 %1272, label %1386, label %1273, !dbg !1979

1273:                                             ; preds = %1270
  %1274 = load i32, ptr %29, align 4, !dbg !1980
  %1275 = icmp ne i32 %1274, 0, !dbg !1980
  br i1 %1275, label %1386, label %1276, !dbg !1979

1276:                                             ; preds = %1273
    #dbg_declare(ptr %55, !1981, !DIExpression(), !1983)
  %1277 = load ptr, ptr %2, align 8, !dbg !1984
  %1278 = getelementptr inbounds nuw %struct.object, ptr %1277, i32 0, i32 11, !dbg !1985
  %1279 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %55, ptr noundef %1278, ptr noundef %22), !dbg !1986
  %1280 = load ptr, ptr %2, align 8, !dbg !1987
  %1281 = getelementptr inbounds nuw %struct.object, ptr %1280, i32 0, i32 21, !dbg !1988
  %1282 = getelementptr inbounds nuw %struct.physics_info, ptr %1281, i32 0, i32 0, !dbg !1989
  %1283 = load i32, ptr @FrameTime, align 4, !dbg !1990
  %1284 = call noundef i32 @_Z6fixdivii(i32 noundef 65536, i32 noundef %1283), !dbg !1991
  %1285 = call noundef ptr @_Z17vm_vec_copy_scaleP10vms_vectorS0_i(ptr noundef %1282, ptr noundef %55, i32 noundef %1284), !dbg !1992
  %1286 = load ptr, ptr %2, align 8, !dbg !1993
  %1287 = load ptr, ptr @ConsoleObject, align 8, !dbg !1995
  %1288 = icmp eq ptr %1286, %1287, !dbg !1996
  br i1 %1288, label %1289, label %1385, !dbg !1997

1289:                                             ; preds = %1276
  %1290 = load ptr, ptr %2, align 8, !dbg !1998
  %1291 = getelementptr inbounds nuw %struct.object, ptr %1290, i32 0, i32 21, !dbg !1999
  %1292 = getelementptr inbounds nuw %struct.physics_info, ptr %1291, i32 0, i32 0, !dbg !2000
  %1293 = getelementptr inbounds nuw %struct.vms_vector, ptr %1292, i32 0, i32 0, !dbg !2001
  %1294 = load i32, ptr %1293, align 4, !dbg !2001
  %1295 = icmp eq i32 %1294, 0, !dbg !2002
  br i1 %1295, label %1296, label %1385, !dbg !2003

1296:                                             ; preds = %1289
  %1297 = load ptr, ptr %2, align 8, !dbg !2004
  %1298 = getelementptr inbounds nuw %struct.object, ptr %1297, i32 0, i32 21, !dbg !2005
  %1299 = getelementptr inbounds nuw %struct.physics_info, ptr %1298, i32 0, i32 0, !dbg !2006
  %1300 = getelementptr inbounds nuw %struct.vms_vector, ptr %1299, i32 0, i32 1, !dbg !2007
  %1301 = load i32, ptr %1300, align 4, !dbg !2007
  %1302 = icmp eq i32 %1301, 0, !dbg !2008
  br i1 %1302, label %1303, label %1385, !dbg !2009

1303:                                             ; preds = %1296
  %1304 = load ptr, ptr %2, align 8, !dbg !2010
  %1305 = getelementptr inbounds nuw %struct.object, ptr %1304, i32 0, i32 21, !dbg !2011
  %1306 = getelementptr inbounds nuw %struct.physics_info, ptr %1305, i32 0, i32 0, !dbg !2012
  %1307 = getelementptr inbounds nuw %struct.vms_vector, ptr %1306, i32 0, i32 2, !dbg !2013
  %1308 = load i32, ptr %1307, align 4, !dbg !2013
  %1309 = icmp eq i32 %1308, 0, !dbg !2014
  br i1 %1309, label %1310, label %1385, !dbg !2015

1310:                                             ; preds = %1303
  %1311 = load ptr, ptr %2, align 8, !dbg !2016
  %1312 = getelementptr inbounds nuw %struct.object, ptr %1311, i32 0, i32 21, !dbg !2017
  %1313 = getelementptr inbounds nuw %struct.physics_info, ptr %1312, i32 0, i32 1, !dbg !2018
  %1314 = getelementptr inbounds nuw %struct.vms_vector, ptr %1313, i32 0, i32 0, !dbg !2019
  %1315 = load i32, ptr %1314, align 4, !dbg !2019
  %1316 = icmp eq i32 %1315, 0, !dbg !2020
  br i1 %1316, label %1317, label %1331, !dbg !2021

1317:                                             ; preds = %1310
  %1318 = load ptr, ptr %2, align 8, !dbg !2022
  %1319 = getelementptr inbounds nuw %struct.object, ptr %1318, i32 0, i32 21, !dbg !2023
  %1320 = getelementptr inbounds nuw %struct.physics_info, ptr %1319, i32 0, i32 1, !dbg !2024
  %1321 = getelementptr inbounds nuw %struct.vms_vector, ptr %1320, i32 0, i32 1, !dbg !2025
  %1322 = load i32, ptr %1321, align 4, !dbg !2025
  %1323 = icmp eq i32 %1322, 0, !dbg !2026
  br i1 %1323, label %1324, label %1331, !dbg !2027

1324:                                             ; preds = %1317
  %1325 = load ptr, ptr %2, align 8, !dbg !2028
  %1326 = getelementptr inbounds nuw %struct.object, ptr %1325, i32 0, i32 21, !dbg !2029
  %1327 = getelementptr inbounds nuw %struct.physics_info, ptr %1326, i32 0, i32 1, !dbg !2030
  %1328 = getelementptr inbounds nuw %struct.vms_vector, ptr %1327, i32 0, i32 2, !dbg !2031
  %1329 = load i32, ptr %1328, align 4, !dbg !2031
  %1330 = icmp eq i32 %1329, 0, !dbg !2032
  br i1 %1330, label %1385, label %1331, !dbg !2015

1331:                                             ; preds = %1324, %1317, %1310
    #dbg_declare(ptr %56, !2033, !DIExpression(), !2035)
    #dbg_declare(ptr %57, !2036, !DIExpression(), !2037)
  %1332 = load ptr, ptr %2, align 8, !dbg !2038
  %1333 = getelementptr inbounds nuw %struct.object, ptr %1332, i32 0, i32 9, !dbg !2039
  %1334 = load i16, ptr %1333, align 2, !dbg !2039
  %1335 = sext i16 %1334 to i64, !dbg !2040
  %1336 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %1335, !dbg !2040
  call void @_Z22compute_segment_centerP10vms_vectorP7segment(ptr noundef %56, ptr noundef %1336), !dbg !2041
  %1337 = load ptr, ptr %2, align 8, !dbg !2042
  %1338 = getelementptr inbounds nuw %struct.object, ptr %1337, i32 0, i32 11, !dbg !2043
  %1339 = call noundef i32 @_Z27vm_vec_normalized_dir_quickP10vms_vectorS0_S0_(ptr noundef %57, ptr noundef %56, ptr noundef %1338), !dbg !2044
  %1340 = load ptr, ptr %2, align 8, !dbg !2045
  %1341 = getelementptr inbounds nuw %struct.object, ptr %1340, i32 0, i32 9, !dbg !2047
  %1342 = load i16, ptr %1341, align 2, !dbg !2047
  %1343 = sext i16 %1342 to i64, !dbg !2048
  %1344 = getelementptr inbounds [0 x %struct.segment2], ptr @Segment2s, i64 0, i64 %1343, !dbg !2048
  %1345 = getelementptr inbounds nuw %struct.segment2, ptr %1344, i32 0, i32 0, !dbg !2049
  %1346 = load i8, ptr %1345, align 4, !dbg !2049
  %1347 = zext i8 %1346 to i32, !dbg !2048
  %1348 = icmp eq i32 %1347, 3, !dbg !2050
  br i1 %1348, label %1349, label %1364, !dbg !2050

1349:                                             ; preds = %1331
  br label %1350, !dbg !2051

1350:                                             ; preds = %1349
  %1351 = getelementptr inbounds nuw %struct.vms_vector, ptr %57, i32 0, i32 0, !dbg !2052
  %1352 = load i32, ptr %1351, align 4, !dbg !2052
  %1353 = sub nsw i32 0, %1352, !dbg !2052
  %1354 = getelementptr inbounds nuw %struct.vms_vector, ptr %57, i32 0, i32 0, !dbg !2052
  store i32 %1353, ptr %1354, align 4, !dbg !2052
  %1355 = getelementptr inbounds nuw %struct.vms_vector, ptr %57, i32 0, i32 1, !dbg !2052
  %1356 = load i32, ptr %1355, align 4, !dbg !2052
  %1357 = sub nsw i32 0, %1356, !dbg !2052
  %1358 = getelementptr inbounds nuw %struct.vms_vector, ptr %57, i32 0, i32 1, !dbg !2052
  store i32 %1357, ptr %1358, align 4, !dbg !2052
  %1359 = getelementptr inbounds nuw %struct.vms_vector, ptr %57, i32 0, i32 2, !dbg !2052
  %1360 = load i32, ptr %1359, align 4, !dbg !2052
  %1361 = sub nsw i32 0, %1360, !dbg !2052
  %1362 = getelementptr inbounds nuw %struct.vms_vector, ptr %57, i32 0, i32 2, !dbg !2052
  store i32 %1361, ptr %1362, align 4, !dbg !2052
  br label %1363, !dbg !2052

1363:                                             ; preds = %1350
  br label %1364, !dbg !2052

1364:                                             ; preds = %1363, %1331
  %1365 = load ptr, ptr %2, align 8, !dbg !2054
  %1366 = getelementptr inbounds nuw %struct.object, ptr %1365, i32 0, i32 11, !dbg !2055
  %1367 = load ptr, ptr %2, align 8, !dbg !2056
  %1368 = getelementptr inbounds nuw %struct.object, ptr %1367, i32 0, i32 13, !dbg !2057
  %1369 = load i32, ptr %1368, align 4, !dbg !2057
  %1370 = sdiv i32 %1369, 5, !dbg !2058
  %1371 = call noundef ptr @_Z17vm_vec_scale_add2P10vms_vectorS0_i(ptr noundef %1366, ptr noundef %57, i32 noundef %1370), !dbg !2059
  %1372 = load ptr, ptr %2, align 8, !dbg !2060
  %1373 = getelementptr inbounds nuw %struct.object, ptr %1372, i32 0, i32 9, !dbg !2062
  %1374 = load i16, ptr %1373, align 2, !dbg !2062
  %1375 = sext i16 %1374 to i64, !dbg !2063
  %1376 = getelementptr inbounds [0 x %struct.segment2], ptr @Segment2s, i64 0, i64 %1375, !dbg !2063
  %1377 = getelementptr inbounds nuw %struct.segment2, ptr %1376, i32 0, i32 0, !dbg !2064
  %1378 = load i8, ptr %1377, align 4, !dbg !2064
  %1379 = zext i8 %1378 to i32, !dbg !2063
  %1380 = icmp eq i32 %1379, 3, !dbg !2065
  br i1 %1380, label %1381, label %1384, !dbg !2065

1381:                                             ; preds = %1364
  %1382 = load ptr, ptr %2, align 8, !dbg !2066
  %1383 = call noundef i32 @_Z17update_object_segP6object(ptr noundef %1382), !dbg !2067
  br label %1384, !dbg !2067

1384:                                             ; preds = %1381, %1364
  br label %1385, !dbg !2068

1385:                                             ; preds = %1384, %1324, %1303, %1296, %1289, %1276
  br label %1386, !dbg !2069

1386:                                             ; preds = %1385, %1273, %1270
  %1387 = load ptr, ptr %2, align 8, !dbg !2070
  %1388 = getelementptr inbounds nuw %struct.object, ptr %1387, i32 0, i32 21, !dbg !2072
  %1389 = getelementptr inbounds nuw %struct.physics_info, ptr %1388, i32 0, i32 8, !dbg !2073
  %1390 = load i16, ptr %1389, align 2, !dbg !2073
  %1391 = zext i16 %1390 to i32, !dbg !2070
  %1392 = and i32 %1391, 2, !dbg !2074
  %1393 = icmp ne i32 %1392, 0, !dbg !2070
  br i1 %1393, label %1394, label %1396, !dbg !2070

1394:                                             ; preds = %1386
  %1395 = load ptr, ptr %2, align 8, !dbg !2075
  call void @_Z23do_physics_align_objectP6object(ptr noundef %1395), !dbg !2076
  br label %1396, !dbg !2076

1396:                                             ; preds = %1394, %1386
  %1397 = load ptr, ptr %2, align 8, !dbg !2077
  %1398 = getelementptr inbounds nuw %struct.object, ptr %1397, i32 0, i32 1, !dbg !2079
  %1399 = load i8, ptr %1398, align 4, !dbg !2079
  %1400 = zext i8 %1399 to i32, !dbg !2077
  %1401 = icmp eq i32 %1400, 4, !dbg !2080
  br i1 %1401, label %1402, label %1534, !dbg !2081

1402:                                             ; preds = %1396
  %1403 = load ptr, ptr %2, align 8, !dbg !2082
  %1404 = getelementptr inbounds nuw %struct.object, ptr %1403, i32 0, i32 9, !dbg !2083
  %1405 = load i16, ptr %1404, align 2, !dbg !2083
  %1406 = sext i16 %1405 to i32, !dbg !2082
  %1407 = load i32, ptr %28, align 4, !dbg !2084
  %1408 = icmp ne i32 %1406, %1407, !dbg !2085
  br i1 %1408, label %1409, label %1534, !dbg !2086

1409:                                             ; preds = %1402
  %1410 = load i32, ptr @Physics_cheat_flag, align 4, !dbg !2087
  %1411 = icmp ne i32 %1410, 12245589, !dbg !2088
  br i1 %1411, label %1412, label %1534, !dbg !2086

1412:                                             ; preds = %1409
    #dbg_declare(ptr %58, !2089, !DIExpression(), !2091)
  %1413 = load ptr, ptr %2, align 8, !dbg !2092
  %1414 = getelementptr inbounds nuw %struct.object, ptr %1413, i32 0, i32 9, !dbg !2093
  %1415 = load i16, ptr %1414, align 2, !dbg !2093
  %1416 = sext i16 %1415 to i64, !dbg !2094
  %1417 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %1416, !dbg !2094
  %1418 = load i32, ptr %28, align 4, !dbg !2095
  %1419 = sext i32 %1418 to i64, !dbg !2096
  %1420 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %1419, !dbg !2096
  %1421 = call noundef i32 @_Z17find_connect_sideP7segmentS0_(ptr noundef %1417, ptr noundef %1420), !dbg !2097
  store i32 %1421, ptr %58, align 4, !dbg !2098
  %1422 = load i32, ptr %58, align 4, !dbg !2099
  %1423 = icmp ne i32 %1422, -1, !dbg !2101
  br i1 %1423, label %1424, label %1533, !dbg !2101

1424:                                             ; preds = %1412
  %1425 = load i32, ptr %28, align 4, !dbg !2102
  %1426 = sext i32 %1425 to i64, !dbg !2102
  %1427 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %1426, !dbg !2102
  %1428 = getelementptr inbounds nuw %struct.segment, ptr %1427, i32 0, i32 1, !dbg !2102
  %1429 = load i32, ptr %58, align 4, !dbg !2102
  %1430 = sext i32 %1429 to i64, !dbg !2102
  %1431 = getelementptr inbounds [6 x i16], ptr %1428, i64 0, i64 %1430, !dbg !2102
  %1432 = load i16, ptr %1431, align 2, !dbg !2102
  %1433 = sext i16 %1432 to i32, !dbg !2102
  %1434 = icmp eq i32 %1433, -1, !dbg !2102
  br i1 %1434, label %1435, label %1436, !dbg !2102

1435:                                             ; preds = %1424
  br label %1471, !dbg !2102

1436:                                             ; preds = %1424
  %1437 = load i32, ptr %28, align 4, !dbg !2102
  %1438 = sext i32 %1437 to i64, !dbg !2102
  %1439 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %1438, !dbg !2102
  %1440 = getelementptr inbounds nuw %struct.segment, ptr %1439, i32 0, i32 1, !dbg !2102
  %1441 = load i32, ptr %58, align 4, !dbg !2102
  %1442 = sext i32 %1441 to i64, !dbg !2102
  %1443 = getelementptr inbounds [6 x i16], ptr %1440, i64 0, i64 %1442, !dbg !2102
  %1444 = load i16, ptr %1443, align 2, !dbg !2102
  %1445 = sext i16 %1444 to i32, !dbg !2102
  %1446 = icmp eq i32 %1445, -2, !dbg !2102
  br i1 %1446, label %1447, label %1448, !dbg !2102

1447:                                             ; preds = %1436
  br label %1469, !dbg !2102

1448:                                             ; preds = %1436
  %1449 = load i32, ptr %28, align 4, !dbg !2102
  %1450 = sext i32 %1449 to i64, !dbg !2102
  %1451 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %1450, !dbg !2102
  %1452 = getelementptr inbounds nuw %struct.segment, ptr %1451, i32 0, i32 0, !dbg !2102
  %1453 = load i32, ptr %58, align 4, !dbg !2102
  %1454 = sext i32 %1453 to i64, !dbg !2102
  %1455 = getelementptr inbounds [6 x %struct.side], ptr %1452, i64 0, i64 %1454, !dbg !2102
  %1456 = getelementptr inbounds nuw %struct.side, ptr %1455, i32 0, i32 2, !dbg !2102
  %1457 = load i16, ptr %1456, align 2, !dbg !2102
  %1458 = sext i16 %1457 to i32, !dbg !2102
  %1459 = icmp eq i32 %1458, -1, !dbg !2102
  br i1 %1459, label %1460, label %1461, !dbg !2102

1460:                                             ; preds = %1448
  br label %1467, !dbg !2102

1461:                                             ; preds = %1448
  %1462 = load i32, ptr %28, align 4, !dbg !2102
  %1463 = sext i32 %1462 to i64, !dbg !2102
  %1464 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %1463, !dbg !2102
  %1465 = load i32, ptr %58, align 4, !dbg !2102
  %1466 = call noundef i32 @_Z15wall_is_doorwayP7segmenti(ptr noundef %1464, i32 noundef %1465), !dbg !2102
  br label %1467, !dbg !2102

1467:                                             ; preds = %1461, %1460
  %1468 = phi i32 [ 5, %1460 ], [ %1466, %1461 ], !dbg !2102
  br label %1469, !dbg !2102

1469:                                             ; preds = %1467, %1447
  %1470 = phi i32 [ 8, %1447 ], [ %1468, %1467 ], !dbg !2102
  br label %1471, !dbg !2102

1471:                                             ; preds = %1469, %1435
  %1472 = phi i32 [ 2, %1435 ], [ %1470, %1469 ], !dbg !2102
  %1473 = and i32 %1472, 1, !dbg !2105
  %1474 = icmp ne i32 %1473, 0, !dbg !2106
  br i1 %1474, label %1532, label %1475, !dbg !2107

1475:                                             ; preds = %1471
    #dbg_declare(ptr %59, !2108, !DIExpression(), !2110)
    #dbg_declare(ptr %60, !2111, !DIExpression(), !2112)
    #dbg_declare(ptr %61, !2113, !DIExpression(), !2114)
    #dbg_declare(ptr %62, !2115, !DIExpression(), !2116)
    #dbg_declare(ptr %63, !2117, !DIExpression(), !2118)
    #dbg_declare(ptr %64, !2119, !DIExpression(), !2123)
  %1476 = load i32, ptr %28, align 4, !dbg !2124
  %1477 = sext i32 %1476 to i64, !dbg !2125
  %1478 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %1477, !dbg !2125
  %1479 = getelementptr inbounds nuw %struct.segment, ptr %1478, i32 0, i32 0, !dbg !2126
  %1480 = load i32, ptr %58, align 4, !dbg !2127
  %1481 = sext i32 %1480 to i64, !dbg !2125
  %1482 = getelementptr inbounds [6 x %struct.side], ptr %1479, i64 0, i64 %1481, !dbg !2125
  store ptr %1482, ptr %59, align 8, !dbg !2128
  %1483 = load i32, ptr %28, align 4, !dbg !2129
  %1484 = icmp eq i32 %1483, -1, !dbg !2131
  br i1 %1484, label %1485, label %1486, !dbg !2131

1485:                                             ; preds = %1475
  call void (ptr, ...) @_Z5ErrorPKcz(ptr noundef @.str.35), !dbg !2132
  br label %1486, !dbg !2132

1486:                                             ; preds = %1485, %1475
  %1487 = getelementptr inbounds [6 x i32], ptr %64, i64 0, i64 0, !dbg !2133
  %1488 = load i32, ptr %28, align 4, !dbg !2134
  %1489 = load i32, ptr %58, align 4, !dbg !2135
  call void @_Z23create_abs_vertex_listsPiS_ii(ptr noundef %61, ptr noundef %1487, i32 noundef %1488, i32 noundef %1489), !dbg !2136
  %1490 = getelementptr inbounds [6 x i32], ptr %64, i64 0, i64 0, !dbg !2137
  %1491 = load i32, ptr %1490, align 4, !dbg !2137
  store i32 %1491, ptr %60, align 4, !dbg !2138
  store i32 1, ptr %62, align 4, !dbg !2139
  br label %1492, !dbg !2141

1492:                                             ; preds = %1508, %1486
  %1493 = load i32, ptr %62, align 4, !dbg !2142
  %1494 = icmp slt i32 %1493, 4, !dbg !2144
  br i1 %1494, label %1495, label %1511, !dbg !2145

1495:                                             ; preds = %1492
  %1496 = load i32, ptr %62, align 4, !dbg !2146
  %1497 = sext i32 %1496 to i64, !dbg !2148
  %1498 = getelementptr inbounds [6 x i32], ptr %64, i64 0, i64 %1497, !dbg !2148
  %1499 = load i32, ptr %1498, align 4, !dbg !2148
  %1500 = load i32, ptr %60, align 4, !dbg !2149
  %1501 = icmp slt i32 %1499, %1500, !dbg !2150
  br i1 %1501, label %1502, label %1507, !dbg !2150

1502:                                             ; preds = %1495
  %1503 = load i32, ptr %62, align 4, !dbg !2151
  %1504 = sext i32 %1503 to i64, !dbg !2152
  %1505 = getelementptr inbounds [6 x i32], ptr %64, i64 0, i64 %1504, !dbg !2152
  %1506 = load i32, ptr %1505, align 4, !dbg !2152
  store i32 %1506, ptr %60, align 4, !dbg !2153
  br label %1507, !dbg !2154

1507:                                             ; preds = %1502, %1495
  br label %1508, !dbg !2149

1508:                                             ; preds = %1507
  %1509 = load i32, ptr %62, align 4, !dbg !2155
  %1510 = add nsw i32 %1509, 1, !dbg !2155
  store i32 %1510, ptr %62, align 4, !dbg !2155
  br label %1492, !dbg !2156, !llvm.loop !2157

1511:                                             ; preds = %1492
  %1512 = load ptr, ptr %59, align 8, !dbg !2159
  %1513 = getelementptr inbounds nuw %struct.side, ptr %1512, i32 0, i32 6, !dbg !2160
  %1514 = getelementptr inbounds [2 x %struct.vms_vector], ptr %1513, i64 0, i64 0, !dbg !2159
  %1515 = load i32, ptr %60, align 4, !dbg !2161
  %1516 = sext i32 %1515 to i64, !dbg !2162
  %1517 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %1516, !dbg !2162
  %1518 = call noundef i32 @_Z16vm_dist_to_planeP10vms_vectorS0_S0_(ptr noundef %22, ptr noundef %1514, ptr noundef %1517), !dbg !2163
  store i32 %1518, ptr %63, align 4, !dbg !2164
  %1519 = load ptr, ptr %2, align 8, !dbg !2165
  %1520 = getelementptr inbounds nuw %struct.object, ptr %1519, i32 0, i32 11, !dbg !2166
  %1521 = load ptr, ptr %59, align 8, !dbg !2167
  %1522 = getelementptr inbounds nuw %struct.side, ptr %1521, i32 0, i32 6, !dbg !2168
  %1523 = getelementptr inbounds [2 x %struct.vms_vector], ptr %1522, i64 0, i64 0, !dbg !2167
  %1524 = load ptr, ptr %2, align 8, !dbg !2169
  %1525 = getelementptr inbounds nuw %struct.object, ptr %1524, i32 0, i32 13, !dbg !2170
  %1526 = load i32, ptr %1525, align 4, !dbg !2170
  %1527 = load i32, ptr %63, align 4, !dbg !2171
  %1528 = sub nsw i32 %1526, %1527, !dbg !2172
  %1529 = call noundef ptr @_Z16vm_vec_scale_addP10vms_vectorS0_S0_i(ptr noundef %1520, ptr noundef %22, ptr noundef %1523, i32 noundef %1528), !dbg !2173
  %1530 = load ptr, ptr %2, align 8, !dbg !2174
  %1531 = call noundef i32 @_Z17update_object_segP6object(ptr noundef %1530), !dbg !2175
  br label %1532, !dbg !2176

1532:                                             ; preds = %1511, %1471
  br label %1533, !dbg !2177

1533:                                             ; preds = %1532, %1412
  br label %1534, !dbg !2178

1534:                                             ; preds = %1533, %1409, %1402, %1396
  %1535 = load ptr, ptr %2, align 8, !dbg !2179
  %1536 = getelementptr inbounds nuw %struct.object, ptr %1535, i32 0, i32 11, !dbg !2181
  %1537 = load ptr, ptr %2, align 8, !dbg !2182
  %1538 = getelementptr inbounds nuw %struct.object, ptr %1537, i32 0, i32 9, !dbg !2183
  %1539 = load i16, ptr %1538, align 2, !dbg !2183
  %1540 = sext i16 %1539 to i32, !dbg !2182
  %1541 = call i32 @_Z13get_seg_masksP10vms_vectorii(ptr noundef %1536, i32 noundef %1540, i32 noundef 0), !dbg !2184
  store i32 %1541, ptr %65, align 2, !dbg !2184
  %1542 = getelementptr inbounds nuw %struct.segmasks, ptr %65, i32 0, i32 2, !dbg !2185
  %1543 = load i8, ptr %1542, align 1, !dbg !2185
  %1544 = sext i8 %1543 to i32, !dbg !2184
  %1545 = icmp ne i32 %1544, 0, !dbg !2186
  br i1 %1545, label %1546, label %1601, !dbg !2184

1546:                                             ; preds = %1534
  %1547 = load ptr, ptr %2, align 8, !dbg !2187
  %1548 = call noundef i32 @_Z15find_object_segP6object(ptr noundef %1547), !dbg !2190
  %1549 = icmp eq i32 %1548, -1, !dbg !2191
  br i1 %1549, label %1550, label %1600, !dbg !2191

1550:                                             ; preds = %1546
    #dbg_declare(ptr %66, !2192, !DIExpression(), !2194)
  %1551 = load ptr, ptr %2, align 8, !dbg !2195
  %1552 = getelementptr inbounds nuw %struct.object, ptr %1551, i32 0, i32 1, !dbg !2197
  %1553 = load i8, ptr %1552, align 4, !dbg !2197
  %1554 = zext i8 %1553 to i32, !dbg !2195
  %1555 = icmp eq i32 %1554, 4, !dbg !2198
  br i1 %1555, label %1556, label %1572, !dbg !2199

1556:                                             ; preds = %1550
  %1557 = load ptr, ptr %2, align 8, !dbg !2200
  %1558 = getelementptr inbounds nuw %struct.object, ptr %1557, i32 0, i32 15, !dbg !2201
  %1559 = load ptr, ptr %2, align 8, !dbg !2202
  %1560 = getelementptr inbounds nuw %struct.object, ptr %1559, i32 0, i32 9, !dbg !2203
  %1561 = load i16, ptr %1560, align 2, !dbg !2203
  %1562 = sext i16 %1561 to i32, !dbg !2202
  %1563 = call noundef i32 @_Z14find_point_segP10vms_vectori(ptr noundef %1558, i32 noundef %1562), !dbg !2204
  store i32 %1563, ptr %66, align 4, !dbg !2205
  %1564 = icmp ne i32 %1563, -1, !dbg !2206
  br i1 %1564, label %1565, label %1572, !dbg !2199

1565:                                             ; preds = %1556
  %1566 = load ptr, ptr %2, align 8, !dbg !2207
  %1567 = getelementptr inbounds nuw %struct.object, ptr %1566, i32 0, i32 15, !dbg !2209
  %1568 = load ptr, ptr %2, align 8, !dbg !2210
  %1569 = getelementptr inbounds nuw %struct.object, ptr %1568, i32 0, i32 11, !dbg !2211
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %1569, ptr align 4 %1567, i64 12, i1 false), !dbg !2212
  %1570 = load i32, ptr %12, align 4, !dbg !2213
  %1571 = load i32, ptr %66, align 4, !dbg !2214
  call void @_Z10obj_relinkii(i32 noundef %1570, i32 noundef %1571), !dbg !2215
  br label %1586, !dbg !2216

1572:                                             ; preds = %1556, %1550
  %1573 = load ptr, ptr %2, align 8, !dbg !2217
  %1574 = getelementptr inbounds nuw %struct.object, ptr %1573, i32 0, i32 11, !dbg !2219
  %1575 = load ptr, ptr %2, align 8, !dbg !2220
  %1576 = getelementptr inbounds nuw %struct.object, ptr %1575, i32 0, i32 9, !dbg !2221
  %1577 = load i16, ptr %1576, align 2, !dbg !2221
  %1578 = sext i16 %1577 to i64, !dbg !2222
  %1579 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %1578, !dbg !2222
  call void @_Z22compute_segment_centerP10vms_vectorP7segment(ptr noundef %1574, ptr noundef %1579), !dbg !2223
  %1580 = load i32, ptr %12, align 4, !dbg !2224
  %1581 = load ptr, ptr %2, align 8, !dbg !2225
  %1582 = getelementptr inbounds nuw %struct.object, ptr %1581, i32 0, i32 11, !dbg !2226
  %1583 = getelementptr inbounds nuw %struct.vms_vector, ptr %1582, i32 0, i32 0, !dbg !2227
  %1584 = load i32, ptr %1583, align 4, !dbg !2228
  %1585 = add nsw i32 %1584, %1580, !dbg !2228
  store i32 %1585, ptr %1583, align 4, !dbg !2228
  br label %1586

1586:                                             ; preds = %1572, %1565
  %1587 = load ptr, ptr %2, align 8, !dbg !2229
  %1588 = getelementptr inbounds nuw %struct.object, ptr %1587, i32 0, i32 1, !dbg !2231
  %1589 = load i8, ptr %1588, align 4, !dbg !2231
  %1590 = zext i8 %1589 to i32, !dbg !2229
  %1591 = icmp eq i32 %1590, 5, !dbg !2232
  br i1 %1591, label %1592, label %1599, !dbg !2232

1592:                                             ; preds = %1586
  %1593 = load ptr, ptr %2, align 8, !dbg !2233
  %1594 = getelementptr inbounds nuw %struct.object, ptr %1593, i32 0, i32 8, !dbg !2234
  %1595 = load i8, ptr %1594, align 1, !dbg !2235
  %1596 = zext i8 %1595 to i32, !dbg !2235
  %1597 = or i32 %1596, 2, !dbg !2235
  %1598 = trunc i32 %1597 to i8, !dbg !2235
  store i8 %1598, ptr %1594, align 1, !dbg !2235
  br label %1599, !dbg !2233

1599:                                             ; preds = %1592, %1586
  br label %1600, !dbg !2236

1600:                                             ; preds = %1599, %1546
  br label %1601, !dbg !2237

1601:                                             ; preds = %91, %132, %818, %1600, %1534
  ret void, !dbg !2238
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @_Z13get_seg_masksP10vms_vectorii(ptr noundef, i32 noundef, i32 noundef) #1

declare void @_Z8_mprintfiPKcz(i32 noundef, ptr noundef, ...) #1

declare noundef i32 @_Z17update_object_segP6object(ptr noundef) #1

declare void @_Z4Int3v() #1

declare void @_Z22compute_segment_centerP10vms_vectorP7segment(ptr noundef, ptr noundef) #1

declare noundef ptr @_Z10vm_vec_addP10vms_vectorS0_S0_(ptr noundef, ptr noundef, ptr noundef) #1

declare noundef i32 @_Z24find_vector_intersectionP9fvi_queryP8fvi_info(ptr noundef, ptr noundef) #1

; Function Attrs: nounwind
declare i32 @fprintf(ptr noundef, ptr noundef, ...) #5

declare void @_Z10obj_relinkii(i32 noundef, i32 noundef) #1

declare noundef i32 @_Z15find_object_segP6object(ptr noundef) #1

declare noundef i32 @_Z14find_point_segP10vms_vectori(ptr noundef, i32 noundef) #1

declare noundef i32 @_Z21vm_vec_normalized_dirP10vms_vectorS0_S0_(ptr noundef, ptr noundef, ptr noundef) #1

declare noundef i32 @_Z10vm_vec_magP10vms_vector(ptr noundef) #1

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z9fixmuldiviii(i32 noundef %0, i32 noundef %1, i32 noundef %2) #4 !dbg !2239 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
    #dbg_declare(ptr %5, !2242, !DIExpression(), !2243)
  store i32 %1, ptr %6, align 4
    #dbg_declare(ptr %6, !2244, !DIExpression(), !2245)
  store i32 %2, ptr %7, align 4
    #dbg_declare(ptr %7, !2246, !DIExpression(), !2247)
  %8 = load i32, ptr %7, align 4, !dbg !2248
  %9 = icmp eq i32 %8, 0, !dbg !2250
  br i1 %9, label %10, label %11, !dbg !2250

10:                                               ; preds = %3
  store i32 1, ptr %4, align 4, !dbg !2251
  br label %21, !dbg !2251

11:                                               ; preds = %3
  %12 = load i32, ptr %5, align 4, !dbg !2252
  %13 = sext i32 %12 to i64, !dbg !2252
  %14 = load i32, ptr %6, align 4, !dbg !2253
  %15 = sext i32 %14 to i64, !dbg !2253
  %16 = mul nsw i64 %13, %15, !dbg !2254
  %17 = load i32, ptr %7, align 4, !dbg !2255
  %18 = sext i32 %17 to i64, !dbg !2255
  %19 = sdiv i64 %16, %18, !dbg !2256
  %20 = trunc i64 %19 to i32, !dbg !2257
  store i32 %20, ptr %4, align 4, !dbg !2258
  br label %21, !dbg !2258

21:                                               ; preds = %11, %10
  %22 = load i32, ptr %4, align 4, !dbg !2259
  ret i32 %22, !dbg !2259
}

declare noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef, ptr noundef, ptr noundef) #1

declare void @_Z24collide_object_with_wallP6objectissP10vms_vector(ptr noundef, i32 noundef, i16 noundef signext, i16 noundef signext, ptr noundef) #1

declare void @_Z21scrape_object_on_wallP6objectssP10vms_vector(ptr noundef, i16 noundef signext, i16 noundef signext, ptr noundef) #1

declare void @_Z16add_stuck_objectP6objectii(ptr noundef, i32 noundef, i32 noundef) #1

declare noundef i32 @_Z16vm_vec_mag_quickP10vms_vector(ptr noundef) #1

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z3i2fi(i32 noundef %0) #4 !dbg !2260 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !2263, !DIExpression(), !2264)
  %3 = load i32, ptr %2, align 4, !dbg !2265
  %4 = shl i32 %3, 16, !dbg !2266
  ret i32 %4, !dbg !2267
}

declare noundef ptr @_Z16vm_vec_scale_addP10vms_vectorS0_S0_i(ptr noundef, ptr noundef, ptr noundef, i32 noundef) #1

declare void @_Z19collide_two_objectsP6objectS0_P10vms_vector(ptr noundef, ptr noundef, ptr noundef) #1

declare noundef i32 @_Z27vm_vec_normalized_dir_quickP10vms_vectorS0_S0_(ptr noundef, ptr noundef, ptr noundef) #1

declare noundef i32 @_Z17find_connect_sideP7segmentS0_(ptr noundef, ptr noundef) #1

declare noundef i32 @_Z15wall_is_doorwayP7segmenti(ptr noundef, i32 noundef) #1

declare void @_Z5ErrorPKcz(ptr noundef, ...) #1

declare void @_Z23create_abs_vertex_listsPiS_ii(ptr noundef, ptr noundef, i32 noundef, i32 noundef) #1

declare noundef i32 @_Z16vm_dist_to_planeP10vms_vectorS0_S0_(ptr noundef, ptr noundef, ptr noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z16phys_apply_forceP6objectP10vms_vector(ptr noundef %0, ptr noundef %1) #0 !dbg !2268 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !2271, !DIExpression(), !2272)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !2273, !DIExpression(), !2274)
  %5 = load ptr, ptr %3, align 8, !dbg !2275
  %6 = getelementptr inbounds nuw %struct.object, ptr %5, i32 0, i32 21, !dbg !2277
  %7 = getelementptr inbounds nuw %struct.physics_info, ptr %6, i32 0, i32 2, !dbg !2278
  %8 = load i32, ptr %7, align 4, !dbg !2278
  %9 = icmp eq i32 %8, 0, !dbg !2279
  br i1 %9, label %10, label %11, !dbg !2279

10:                                               ; preds = %2
  br label %29, !dbg !2280

11:                                               ; preds = %2
  %12 = load ptr, ptr %3, align 8, !dbg !2281
  %13 = getelementptr inbounds nuw %struct.object, ptr %12, i32 0, i32 6, !dbg !2283
  %14 = load i8, ptr %13, align 1, !dbg !2283
  %15 = zext i8 %14 to i32, !dbg !2281
  %16 = icmp ne i32 %15, 1, !dbg !2284
  br i1 %16, label %17, label %18, !dbg !2284

17:                                               ; preds = %11
  br label %29, !dbg !2285

18:                                               ; preds = %11
  %19 = load ptr, ptr %3, align 8, !dbg !2286
  %20 = getelementptr inbounds nuw %struct.object, ptr %19, i32 0, i32 21, !dbg !2287
  %21 = getelementptr inbounds nuw %struct.physics_info, ptr %20, i32 0, i32 0, !dbg !2288
  %22 = load ptr, ptr %4, align 8, !dbg !2289
  %23 = load ptr, ptr %3, align 8, !dbg !2290
  %24 = getelementptr inbounds nuw %struct.object, ptr %23, i32 0, i32 21, !dbg !2291
  %25 = getelementptr inbounds nuw %struct.physics_info, ptr %24, i32 0, i32 2, !dbg !2292
  %26 = load i32, ptr %25, align 4, !dbg !2292
  %27 = call noundef i32 @_Z6fixdivii(i32 noundef 65536, i32 noundef %26), !dbg !2293
  %28 = call noundef ptr @_Z17vm_vec_scale_add2P10vms_vectorS0_i(ptr noundef %21, ptr noundef %22, i32 noundef %27), !dbg !2294
  br label %29, !dbg !2295

29:                                               ; preds = %18, %17, %10
  ret void, !dbg !2295
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define void @_Z31physics_set_rotvel_and_saturatePii(ptr noundef %0, i32 noundef %1) #4 !dbg !2296 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !2300, !DIExpression(), !2301)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !2302, !DIExpression(), !2303)
  %5 = load i32, ptr %4, align 4, !dbg !2304
  %6 = load ptr, ptr %3, align 8, !dbg !2306
  %7 = load i32, ptr %6, align 4, !dbg !2307
  %8 = xor i32 %5, %7, !dbg !2308
  %9 = icmp slt i32 %8, 0, !dbg !2309
  br i1 %9, label %10, label %22, !dbg !2309

10:                                               ; preds = %2
  %11 = load i32, ptr %4, align 4, !dbg !2310
  %12 = call i32 @llvm.abs.i32(i32 %11, i1 true), !dbg !2313
  %13 = icmp slt i32 %12, 8192, !dbg !2314
  br i1 %13, label %14, label %18, !dbg !2314

14:                                               ; preds = %10
  %15 = load i32, ptr %4, align 4, !dbg !2315
  %16 = sdiv i32 %15, 4, !dbg !2317
  %17 = load ptr, ptr %3, align 8, !dbg !2318
  store i32 %16, ptr %17, align 4, !dbg !2319
  br label %21, !dbg !2320

18:                                               ; preds = %10
  %19 = load i32, ptr %4, align 4, !dbg !2321
  %20 = load ptr, ptr %3, align 8, !dbg !2322
  store i32 %19, ptr %20, align 4, !dbg !2323
  br label %21

21:                                               ; preds = %18, %14
  br label %25, !dbg !2324

22:                                               ; preds = %2
  %23 = load i32, ptr %4, align 4, !dbg !2325
  %24 = load ptr, ptr %3, align 8, !dbg !2327
  store i32 %23, ptr %24, align 4, !dbg !2328
  br label %25

25:                                               ; preds = %22, %21
  ret void, !dbg !2329
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z27physics_turn_towards_vectorP10vms_vectorP6objecti(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 !dbg !2330 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.vms_angvec, align 2
  %8 = alloca %struct.vms_angvec, align 2
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !2333, !DIExpression(), !2334)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !2335, !DIExpression(), !2336)
  store i32 %2, ptr %6, align 4
    #dbg_declare(ptr %6, !2337, !DIExpression(), !2338)
    #dbg_declare(ptr %7, !2339, !DIExpression(), !2340)
    #dbg_declare(ptr %8, !2341, !DIExpression(), !2342)
    #dbg_declare(ptr %9, !2343, !DIExpression(), !2344)
    #dbg_declare(ptr %10, !2345, !DIExpression(), !2346)
    #dbg_declare(ptr %11, !2347, !DIExpression(), !2348)
  %12 = load ptr, ptr %5, align 8, !dbg !2349
  %13 = getelementptr inbounds nuw %struct.object, ptr %12, i32 0, i32 21, !dbg !2350
  %14 = getelementptr inbounds nuw %struct.physics_info, ptr %13, i32 0, i32 5, !dbg !2351
  store ptr %14, ptr %11, align 8, !dbg !2348
  %15 = load ptr, ptr %4, align 8, !dbg !2352
  %16 = getelementptr inbounds nuw %struct.vms_vector, ptr %15, i32 0, i32 0, !dbg !2354
  %17 = load i32, ptr %16, align 4, !dbg !2354
  %18 = icmp eq i32 %17, 0, !dbg !2355
  br i1 %18, label %19, label %30, !dbg !2356

19:                                               ; preds = %3
  %20 = load ptr, ptr %4, align 8, !dbg !2357
  %21 = getelementptr inbounds nuw %struct.vms_vector, ptr %20, i32 0, i32 1, !dbg !2358
  %22 = load i32, ptr %21, align 4, !dbg !2358
  %23 = icmp eq i32 %22, 0, !dbg !2359
  br i1 %23, label %24, label %30, !dbg !2360

24:                                               ; preds = %19
  %25 = load ptr, ptr %4, align 8, !dbg !2361
  %26 = getelementptr inbounds nuw %struct.vms_vector, ptr %25, i32 0, i32 2, !dbg !2362
  %27 = load i32, ptr %26, align 4, !dbg !2362
  %28 = icmp eq i32 %27, 0, !dbg !2363
  br i1 %28, label %29, label %30, !dbg !2360

29:                                               ; preds = %24
  br label %136, !dbg !2364

30:                                               ; preds = %24, %19, %3
  %31 = load ptr, ptr %5, align 8, !dbg !2365
  %32 = getelementptr inbounds nuw %struct.object, ptr %31, i32 0, i32 5, !dbg !2367
  %33 = load i8, ptr %32, align 2, !dbg !2367
  %34 = zext i8 %33 to i32, !dbg !2365
  %35 = icmp eq i32 %34, 11, !dbg !2368
  br i1 %35, label %36, label %39, !dbg !2368

36:                                               ; preds = %30
  %37 = load i32, ptr %6, align 4, !dbg !2369
  %38 = mul nsw i32 %37, 2, !dbg !2369
  store i32 %38, ptr %6, align 4, !dbg !2369
  br label %39, !dbg !2370

39:                                               ; preds = %36, %30
  %40 = load ptr, ptr %4, align 8, !dbg !2371
  %41 = call noundef ptr @_Z24vm_extract_angles_vectorP10vms_angvecP10vms_vector(ptr noundef %7, ptr noundef %40), !dbg !2372
  %42 = load ptr, ptr %5, align 8, !dbg !2373
  %43 = getelementptr inbounds nuw %struct.object, ptr %42, i32 0, i32 12, !dbg !2374
  %44 = getelementptr inbounds nuw %struct.vms_matrix, ptr %43, i32 0, i32 2, !dbg !2375
  %45 = call noundef ptr @_Z24vm_extract_angles_vectorP10vms_angvecP10vms_vector(ptr noundef %8, ptr noundef %44), !dbg !2376
  %46 = getelementptr inbounds nuw %struct.vms_angvec, ptr %7, i32 0, i32 0, !dbg !2377
  %47 = load i16, ptr %46, align 2, !dbg !2377
  %48 = sext i16 %47 to i32, !dbg !2378
  %49 = getelementptr inbounds nuw %struct.vms_angvec, ptr %8, i32 0, i32 0, !dbg !2379
  %50 = load i16, ptr %49, align 2, !dbg !2379
  %51 = sext i16 %50 to i32, !dbg !2380
  %52 = sub nsw i32 %48, %51, !dbg !2381
  store i32 %52, ptr %9, align 4, !dbg !2382
  %53 = getelementptr inbounds nuw %struct.vms_angvec, ptr %7, i32 0, i32 2, !dbg !2383
  %54 = load i16, ptr %53, align 2, !dbg !2383
  %55 = sext i16 %54 to i32, !dbg !2384
  %56 = getelementptr inbounds nuw %struct.vms_angvec, ptr %8, i32 0, i32 2, !dbg !2385
  %57 = load i16, ptr %56, align 2, !dbg !2385
  %58 = sext i16 %57 to i32, !dbg !2386
  %59 = sub nsw i32 %55, %58, !dbg !2387
  store i32 %59, ptr %10, align 4, !dbg !2388
  %60 = load i32, ptr %9, align 4, !dbg !2389
  %61 = icmp sgt i32 %60, 32768, !dbg !2391
  br i1 %61, label %62, label %71, !dbg !2391

62:                                               ; preds = %39
  %63 = getelementptr inbounds nuw %struct.vms_angvec, ptr %7, i32 0, i32 0, !dbg !2392
  %64 = load i16, ptr %63, align 2, !dbg !2392
  %65 = sext i16 %64 to i32, !dbg !2393
  %66 = getelementptr inbounds nuw %struct.vms_angvec, ptr %8, i32 0, i32 0, !dbg !2394
  %67 = load i16, ptr %66, align 2, !dbg !2394
  %68 = sext i16 %67 to i32, !dbg !2395
  %69 = sub nsw i32 %65, %68, !dbg !2396
  %70 = sub nsw i32 %69, 65536, !dbg !2397
  store i32 %70, ptr %9, align 4, !dbg !2398
  br label %71, !dbg !2399

71:                                               ; preds = %62, %39
  %72 = load i32, ptr %9, align 4, !dbg !2400
  %73 = icmp slt i32 %72, -32768, !dbg !2402
  br i1 %73, label %74, label %83, !dbg !2402

74:                                               ; preds = %71
  %75 = getelementptr inbounds nuw %struct.vms_angvec, ptr %7, i32 0, i32 0, !dbg !2403
  %76 = load i16, ptr %75, align 2, !dbg !2403
  %77 = sext i16 %76 to i32, !dbg !2404
  %78 = getelementptr inbounds nuw %struct.vms_angvec, ptr %8, i32 0, i32 0, !dbg !2405
  %79 = load i16, ptr %78, align 2, !dbg !2405
  %80 = sext i16 %79 to i32, !dbg !2406
  %81 = sub nsw i32 %77, %80, !dbg !2407
  %82 = add nsw i32 %81, 65536, !dbg !2408
  store i32 %82, ptr %9, align 4, !dbg !2409
  br label %83, !dbg !2410

83:                                               ; preds = %74, %71
  %84 = load i32, ptr %10, align 4, !dbg !2411
  %85 = icmp sgt i32 %84, 32768, !dbg !2413
  br i1 %85, label %86, label %95, !dbg !2413

86:                                               ; preds = %83
  %87 = getelementptr inbounds nuw %struct.vms_angvec, ptr %7, i32 0, i32 2, !dbg !2414
  %88 = load i16, ptr %87, align 2, !dbg !2414
  %89 = sext i16 %88 to i32, !dbg !2415
  %90 = getelementptr inbounds nuw %struct.vms_angvec, ptr %8, i32 0, i32 2, !dbg !2416
  %91 = load i16, ptr %90, align 2, !dbg !2416
  %92 = sext i16 %91 to i32, !dbg !2417
  %93 = sub nsw i32 %89, %92, !dbg !2418
  %94 = sub nsw i32 %93, 65536, !dbg !2419
  store i32 %94, ptr %10, align 4, !dbg !2420
  br label %95, !dbg !2421

95:                                               ; preds = %86, %83
  %96 = load i32, ptr %10, align 4, !dbg !2422
  %97 = icmp slt i32 %96, -32768, !dbg !2424
  br i1 %97, label %98, label %107, !dbg !2424

98:                                               ; preds = %95
  %99 = getelementptr inbounds nuw %struct.vms_angvec, ptr %7, i32 0, i32 2, !dbg !2425
  %100 = load i16, ptr %99, align 2, !dbg !2425
  %101 = sext i16 %100 to i32, !dbg !2426
  %102 = getelementptr inbounds nuw %struct.vms_angvec, ptr %8, i32 0, i32 2, !dbg !2427
  %103 = load i16, ptr %102, align 2, !dbg !2427
  %104 = sext i16 %103 to i32, !dbg !2428
  %105 = sub nsw i32 %101, %104, !dbg !2429
  %106 = add nsw i32 %105, 65536, !dbg !2430
  store i32 %106, ptr %10, align 4, !dbg !2431
  br label %107, !dbg !2432

107:                                              ; preds = %98, %95
  %108 = load i32, ptr %9, align 4, !dbg !2433
  %109 = load i32, ptr %6, align 4, !dbg !2434
  %110 = call noundef i32 @_Z6fixdivii(i32 noundef %108, i32 noundef %109), !dbg !2435
  store i32 %110, ptr %9, align 4, !dbg !2436
  %111 = load i32, ptr %10, align 4, !dbg !2437
  %112 = load i32, ptr %6, align 4, !dbg !2438
  %113 = call noundef i32 @_Z6fixdivii(i32 noundef %111, i32 noundef %112), !dbg !2439
  store i32 %113, ptr %10, align 4, !dbg !2440
  %114 = load i32, ptr %9, align 4, !dbg !2441
  %115 = call i32 @llvm.abs.i32(i32 %114, i1 true), !dbg !2443
  %116 = icmp slt i32 %115, 4096, !dbg !2444
  br i1 %116, label %117, label %120, !dbg !2444

117:                                              ; preds = %107
  %118 = load i32, ptr %9, align 4, !dbg !2445
  %119 = mul nsw i32 %118, 4, !dbg !2445
  store i32 %119, ptr %9, align 4, !dbg !2445
  br label %120, !dbg !2446

120:                                              ; preds = %117, %107
  %121 = load i32, ptr %10, align 4, !dbg !2447
  %122 = call i32 @llvm.abs.i32(i32 %121, i1 true), !dbg !2449
  %123 = icmp slt i32 %122, 4096, !dbg !2450
  br i1 %123, label %124, label %127, !dbg !2450

124:                                              ; preds = %120
  %125 = load i32, ptr %10, align 4, !dbg !2451
  %126 = mul nsw i32 %125, 4, !dbg !2451
  store i32 %126, ptr %10, align 4, !dbg !2451
  br label %127, !dbg !2452

127:                                              ; preds = %124, %120
  %128 = load ptr, ptr %11, align 8, !dbg !2453
  %129 = getelementptr inbounds nuw %struct.vms_vector, ptr %128, i32 0, i32 0, !dbg !2454
  %130 = load i32, ptr %9, align 4, !dbg !2455
  call void @_Z31physics_set_rotvel_and_saturatePii(ptr noundef %129, i32 noundef %130), !dbg !2456
  %131 = load ptr, ptr %11, align 8, !dbg !2457
  %132 = getelementptr inbounds nuw %struct.vms_vector, ptr %131, i32 0, i32 1, !dbg !2458
  %133 = load i32, ptr %10, align 4, !dbg !2459
  call void @_Z31physics_set_rotvel_and_saturatePii(ptr noundef %132, i32 noundef %133), !dbg !2460
  %134 = load ptr, ptr %11, align 8, !dbg !2461
  %135 = getelementptr inbounds nuw %struct.vms_vector, ptr %134, i32 0, i32 2, !dbg !2462
  store i32 0, ptr %135, align 4, !dbg !2463
  br label %136, !dbg !2464

136:                                              ; preds = %127, %29
  ret void, !dbg !2464
}

declare noundef ptr @_Z24vm_extract_angles_vectorP10vms_angvecP10vms_vector(ptr noundef, ptr noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z14phys_apply_rotP6objectP10vms_vector(ptr noundef %0, ptr noundef %1) #0 !dbg !2465 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !2466, !DIExpression(), !2467)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !2468, !DIExpression(), !2469)
    #dbg_declare(ptr %5, !2470, !DIExpression(), !2471)
    #dbg_declare(ptr %6, !2472, !DIExpression(), !2473)
  %9 = load ptr, ptr %3, align 8, !dbg !2474
  %10 = getelementptr inbounds nuw %struct.object, ptr %9, i32 0, i32 6, !dbg !2476
  %11 = load i8, ptr %10, align 1, !dbg !2476
  %12 = zext i8 %11 to i32, !dbg !2474
  %13 = icmp ne i32 %12, 1, !dbg !2477
  br i1 %13, label %14, label %15, !dbg !2477

14:                                               ; preds = %2
  br label %112, !dbg !2478

15:                                               ; preds = %2
  %16 = load ptr, ptr %4, align 8, !dbg !2479
  %17 = call noundef i32 @_Z10vm_vec_magP10vms_vector(ptr noundef %16), !dbg !2480
  %18 = sdiv i32 %17, 8, !dbg !2481
  store i32 %18, ptr %6, align 4, !dbg !2482
  %19 = load i32, ptr %6, align 4, !dbg !2483
  %20 = icmp slt i32 %19, 256, !dbg !2485
  br i1 %20, label %21, label %22, !dbg !2485

21:                                               ; preds = %15
  store i32 262144, ptr %5, align 4, !dbg !2486
  br label %108, !dbg !2487

22:                                               ; preds = %15
  %23 = load i32, ptr %6, align 4, !dbg !2488
  %24 = load ptr, ptr %3, align 8, !dbg !2490
  %25 = getelementptr inbounds nuw %struct.object, ptr %24, i32 0, i32 21, !dbg !2491
  %26 = getelementptr inbounds nuw %struct.physics_info, ptr %25, i32 0, i32 2, !dbg !2492
  %27 = load i32, ptr %26, align 4, !dbg !2492
  %28 = ashr i32 %27, 14, !dbg !2493
  %29 = icmp slt i32 %23, %28, !dbg !2494
  br i1 %29, label %30, label %31, !dbg !2494

30:                                               ; preds = %22
  store i32 262144, ptr %5, align 4, !dbg !2495
  br label %107, !dbg !2496

31:                                               ; preds = %22
  %32 = load ptr, ptr %3, align 8, !dbg !2497
  %33 = getelementptr inbounds nuw %struct.object, ptr %32, i32 0, i32 21, !dbg !2499
  %34 = getelementptr inbounds nuw %struct.physics_info, ptr %33, i32 0, i32 2, !dbg !2500
  %35 = load i32, ptr %34, align 4, !dbg !2500
  %36 = load i32, ptr %6, align 4, !dbg !2501
  %37 = call noundef i32 @_Z6fixdivii(i32 noundef %35, i32 noundef %36), !dbg !2502
  store i32 %37, ptr %5, align 4, !dbg !2503
  %38 = load ptr, ptr %3, align 8, !dbg !2504
  %39 = getelementptr inbounds nuw %struct.object, ptr %38, i32 0, i32 1, !dbg !2506
  %40 = load i8, ptr %39, align 4, !dbg !2506
  %41 = zext i8 %40 to i32, !dbg !2504
  %42 = icmp eq i32 %41, 2, !dbg !2507
  br i1 %42, label %43, label %101, !dbg !2507

43:                                               ; preds = %31
  %44 = load i32, ptr %5, align 4, !dbg !2508
  %45 = icmp slt i32 %44, 16384, !dbg !2511
  br i1 %45, label %46, label %47, !dbg !2511

46:                                               ; preds = %43
  store i32 16384, ptr %5, align 4, !dbg !2512
  br label %47, !dbg !2513

47:                                               ; preds = %46, %43
  %48 = load ptr, ptr %3, align 8, !dbg !2514
  %49 = getelementptr inbounds nuw %struct.object, ptr %48, i32 0, i32 2, !dbg !2516
  %50 = load i8, ptr %49, align 1, !dbg !2516
  %51 = zext i8 %50 to i64, !dbg !2517
  %52 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %51, !dbg !2517
  %53 = getelementptr inbounds nuw %struct.robot_info, ptr %52, i32 0, i32 40, !dbg !2518
  %54 = load i8, ptr %53, align 4, !dbg !2518
  %55 = icmp ne i8 %54, 0, !dbg !2517
  br i1 %55, label %100, label %56, !dbg !2519

56:                                               ; preds = %47
  %57 = load ptr, ptr %3, align 8, !dbg !2520
  %58 = getelementptr inbounds nuw %struct.object, ptr %57, i32 0, i32 2, !dbg !2521
  %59 = load i8, ptr %58, align 1, !dbg !2521
  %60 = zext i8 %59 to i64, !dbg !2522
  %61 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %60, !dbg !2522
  %62 = getelementptr inbounds nuw %struct.robot_info, ptr %61, i32 0, i32 31, !dbg !2523
  %63 = load i8, ptr %62, align 1, !dbg !2523
  %64 = icmp ne i8 %63, 0, !dbg !2522
  br i1 %64, label %100, label %65, !dbg !2519

65:                                               ; preds = %56
  %66 = load ptr, ptr %3, align 8, !dbg !2524
  %67 = getelementptr inbounds nuw %struct.object, ptr %66, i32 0, i32 22, !dbg !2527
  %68 = getelementptr inbounds nuw %struct.ai_static, ptr %67, i32 0, i32 1, !dbg !2528
  %69 = getelementptr inbounds [11 x i8], ptr %68, i64 0, i64 7, !dbg !2524
  %70 = load i8, ptr %69, align 1, !dbg !2524
  %71 = sext i8 %70 to i32, !dbg !2524
  %72 = load i32, ptr @FrameTime, align 4, !dbg !2529
  %73 = mul nsw i32 %71, %72, !dbg !2530
  %74 = icmp slt i32 %73, 49152, !dbg !2531
  br i1 %74, label %75, label %99, !dbg !2531

75:                                               ; preds = %65
    #dbg_declare(ptr %7, !2532, !DIExpression(), !2534)
  %76 = load i32, ptr @FrameTime, align 4, !dbg !2535
  %77 = mul nsw i32 8, %76, !dbg !2536
  %78 = call noundef i32 @_Z6fixdivii(i32 noundef 65536, i32 noundef %77), !dbg !2537
  store i32 %78, ptr %7, align 4, !dbg !2534
    #dbg_declare(ptr %8, !2538, !DIExpression(), !2539)
  %79 = load i32, ptr %7, align 4, !dbg !2540
  %80 = call noundef i32 @_Z3f2ii(i32 noundef %79), !dbg !2541
  store i32 %80, ptr %8, align 4, !dbg !2542
  %81 = call noundef i32 @_Z6P_Randv(), !dbg !2543
  %82 = mul nsw i32 %81, 2, !dbg !2545
  %83 = load i32, ptr %7, align 4, !dbg !2546
  %84 = and i32 %83, 65535, !dbg !2547
  %85 = icmp slt i32 %82, %84, !dbg !2548
  br i1 %85, label %86, label %89, !dbg !2548

86:                                               ; preds = %75
  %87 = load i32, ptr %8, align 4, !dbg !2549
  %88 = add nsw i32 %87, 1, !dbg !2549
  store i32 %88, ptr %8, align 4, !dbg !2549
  br label %89, !dbg !2550

89:                                               ; preds = %86, %75
  %90 = load i32, ptr %8, align 4, !dbg !2551
  %91 = load ptr, ptr %3, align 8, !dbg !2552
  %92 = getelementptr inbounds nuw %struct.object, ptr %91, i32 0, i32 22, !dbg !2553
  %93 = getelementptr inbounds nuw %struct.ai_static, ptr %92, i32 0, i32 1, !dbg !2554
  %94 = getelementptr inbounds [11 x i8], ptr %93, i64 0, i64 7, !dbg !2552
  %95 = load i8, ptr %94, align 1, !dbg !2555
  %96 = sext i8 %95 to i32, !dbg !2555
  %97 = add nsw i32 %96, %90, !dbg !2555
  %98 = trunc i32 %97 to i8, !dbg !2555
  store i8 %98, ptr %94, align 1, !dbg !2555
  br label %99, !dbg !2556

99:                                               ; preds = %89, %65
  br label %100, !dbg !2557

100:                                              ; preds = %99, %56, %47
  br label %106, !dbg !2558

101:                                              ; preds = %31
  %102 = load i32, ptr %5, align 4, !dbg !2559
  %103 = icmp slt i32 %102, 32768, !dbg !2562
  br i1 %103, label %104, label %105, !dbg !2562

104:                                              ; preds = %101
  store i32 32768, ptr %5, align 4, !dbg !2563
  br label %105, !dbg !2564

105:                                              ; preds = %104, %101
  br label %106

106:                                              ; preds = %105, %100
  br label %107

107:                                              ; preds = %106, %30
  br label %108

108:                                              ; preds = %107, %21
  %109 = load ptr, ptr %4, align 8, !dbg !2565
  %110 = load ptr, ptr %3, align 8, !dbg !2566
  %111 = load i32, ptr %5, align 4, !dbg !2567
  call void @_Z27physics_turn_towards_vectorP10vms_vectorP6objecti(ptr noundef %109, ptr noundef %110, i32 noundef %111), !dbg !2568
  br label %112, !dbg !2569

112:                                              ; preds = %108, %14
  ret void, !dbg !2569
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z3f2ii(i32 noundef %0) #4 !dbg !2570 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !2573, !DIExpression(), !2574)
  %3 = load i32, ptr %2, align 4, !dbg !2575
  %4 = ashr i32 %3, 16, !dbg !2576
  ret i32 %4, !dbg !2577
}

declare noundef i32 @_Z6P_Randv() #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z24set_thrust_from_velocityP6object(ptr noundef %0) #0 !dbg !2578 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2579, !DIExpression(), !2580)
    #dbg_declare(ptr %3, !2581, !DIExpression(), !2582)
  %4 = load ptr, ptr %2, align 8, !dbg !2583
  %5 = getelementptr inbounds nuw %struct.object, ptr %4, i32 0, i32 6, !dbg !2583
  %6 = load i8, ptr %5, align 1, !dbg !2583
  %7 = zext i8 %6 to i32, !dbg !2583
  %8 = icmp eq i32 %7, 1, !dbg !2583
  %9 = zext i1 %8 to i32, !dbg !2583
  call void @_Z7_AssertiPKcS0_i(i32 noundef %9, ptr noundef @.str.3, ptr noundef @.str.1, i32 noundef 1812), !dbg !2583
  %10 = load ptr, ptr %2, align 8, !dbg !2584
  %11 = getelementptr inbounds nuw %struct.object, ptr %10, i32 0, i32 21, !dbg !2585
  %12 = getelementptr inbounds nuw %struct.physics_info, ptr %11, i32 0, i32 2, !dbg !2586
  %13 = load i32, ptr %12, align 4, !dbg !2586
  %14 = load ptr, ptr %2, align 8, !dbg !2587
  %15 = getelementptr inbounds nuw %struct.object, ptr %14, i32 0, i32 21, !dbg !2588
  %16 = getelementptr inbounds nuw %struct.physics_info, ptr %15, i32 0, i32 3, !dbg !2589
  %17 = load i32, ptr %16, align 4, !dbg !2589
  %18 = load ptr, ptr %2, align 8, !dbg !2590
  %19 = getelementptr inbounds nuw %struct.object, ptr %18, i32 0, i32 21, !dbg !2591
  %20 = getelementptr inbounds nuw %struct.physics_info, ptr %19, i32 0, i32 3, !dbg !2592
  %21 = load i32, ptr %20, align 4, !dbg !2592
  %22 = sub nsw i32 65536, %21, !dbg !2593
  %23 = call noundef i32 @_Z9fixmuldiviii(i32 noundef %13, i32 noundef %17, i32 noundef %22), !dbg !2594
  store i32 %23, ptr %3, align 4, !dbg !2595
  %24 = load ptr, ptr %2, align 8, !dbg !2596
  %25 = getelementptr inbounds nuw %struct.object, ptr %24, i32 0, i32 21, !dbg !2597
  %26 = getelementptr inbounds nuw %struct.physics_info, ptr %25, i32 0, i32 1, !dbg !2598
  %27 = load ptr, ptr %2, align 8, !dbg !2599
  %28 = getelementptr inbounds nuw %struct.object, ptr %27, i32 0, i32 21, !dbg !2600
  %29 = getelementptr inbounds nuw %struct.physics_info, ptr %28, i32 0, i32 0, !dbg !2601
  %30 = load i32, ptr %3, align 4, !dbg !2602
  %31 = call noundef ptr @_Z17vm_vec_copy_scaleP10vms_vectorS0_i(ptr noundef %26, ptr noundef %29, i32 noundef %30), !dbg !2603
  ret void, !dbg !2604
}

attributes #0 = { mustprogress noinline ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { mustprogress noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #5 = { nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #6 = { nounwind }

!llvm.module.flags = !{!414, !415, !416, !417, !418, !419, !420}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!421}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "Physics_cheat_flag", scope: !2, file: !16, line: 77, type: !12, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !3, producer: "Homebrew clang version 20.1.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !13, imports: !345, splitDebugInlining: false, nameTableKind: Apple, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk", sdk: "MacOSX15.sdk")
!3 = !DIFile(filename: "/Users/richard/code/ChocolateDescent/main_d2/physics.cpp", directory: "/Users/richard/code/ChocolateDescent/build-c-ref", checksumkind: CSK_MD5, checksum: "e2f2157ae24d6c408eb131ba388d172a")
!4 = !{!5, !8}
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !6, line: 30, baseType: !7)
!6 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int64_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e6d85c1a9e23dbf7518ce3b162aac800")
!7 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "fix", file: !9, line: 20, baseType: !10)
!9 = !DIFile(filename: "./fix/fix.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "c5006a11bf8b4cb7d963898499eda13a")
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !11, line: 30, baseType: !12)
!11 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int32_t.h", directory: "", checksumkind: CSK_MD5, checksum: "d23e8406e80ee79983f28509c741fa17")
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !{!0, !14, !17, !22, !24, !175, !177, !179, !181, !188, !193, !198, !203, !208, !213, !218, !223, !228, !233, !238, !243, !245, !250, !255, !260, !266, !271, !276, !278, !283, !288, !290, !295, !297, !302, !304, !309, !311, !316, !321, !323, !328, !333, !335, !337, !342}
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "floor_levelling", scope: !2, file: !16, line: 92, type: !12, isLocal: false, isDefinition: true)
!16 = !DIFile(filename: "main_d2/physics.cpp", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "e2f2157ae24d6c408eb131ba388d172a")
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(name: "phys_seglist", scope: !2, file: !16, line: 285, type: !19, isLocal: false, isDefinition: true)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 3200, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 100)
!22 = !DIGlobalVariableExpression(var: !23, expr: !DIExpression())
!23 = distinct !DIGlobalVariable(name: "n_phys_segs", scope: !2, file: !16, line: 285, type: !12, isLocal: false, isDefinition: true)
!24 = !DIGlobalVariableExpression(var: !25, expr: !DIExpression())
!25 = distinct !DIGlobalVariable(name: "debug_obj", scope: !2, file: !16, line: 295, type: !26, isLocal: false, isDefinition: true)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "object", file: !28, line: 259, baseType: !29)
!28 = !DIFile(filename: "main_d2/object.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "1f2325d356aae4b692933d2aae4f3afd")
!29 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "object", file: !28, line: 210, size: 2144, flags: DIFlagTypePassByValue, elements: !30, identifier: "_ZTS6object")
!30 = !{!31, !32, !36, !37, !39, !40, !41, !42, !43, !44, !45, !46, !54, !61, !62, !63, !64, !68, !69, !70, !71, !72, !93, !147}
!31 = !DIDerivedType(tag: DW_TAG_member, name: "signature", scope: !29, file: !28, line: 212, baseType: !12, size: 32)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !29, file: !28, line: 213, baseType: !33, size: 8, offset: 32)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !34, line: 31, baseType: !35)
!34 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint8_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8b64ccf8c67b8c006b07b8daf1b49be5")
!35 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !29, file: !28, line: 214, baseType: !33, size: 8, offset: 40)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !29, file: !28, line: 215, baseType: !38, size: 16, offset: 48)
!38 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "prev", scope: !29, file: !28, line: 215, baseType: !38, size: 16, offset: 64)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "control_type", scope: !29, file: !28, line: 216, baseType: !33, size: 8, offset: 80)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "movement_type", scope: !29, file: !28, line: 217, baseType: !33, size: 8, offset: 88)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "render_type", scope: !29, file: !28, line: 218, baseType: !33, size: 8, offset: 96)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !29, file: !28, line: 219, baseType: !33, size: 8, offset: 104)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "segnum", scope: !29, file: !28, line: 220, baseType: !38, size: 16, offset: 112)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "attached_obj", scope: !29, file: !28, line: 221, baseType: !38, size: 16, offset: 128)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !29, file: !28, line: 222, baseType: !47, size: 96, offset: 160)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_vector", file: !48, line: 22, baseType: !49)
!48 = !DIFile(filename: "./vecmat/vecmat.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "dfa84e3325c1ea4f5f74699fff5ef2bf")
!49 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_vector", file: !48, line: 19, size: 96, flags: DIFlagTypePassByValue, elements: !50, identifier: "_ZTS10vms_vector")
!50 = !{!51, !52, !53}
!51 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !49, file: !48, line: 21, baseType: !8, size: 32)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !49, file: !48, line: 21, baseType: !8, size: 32, offset: 32)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !49, file: !48, line: 21, baseType: !8, size: 32, offset: 64)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "orient", scope: !29, file: !28, line: 223, baseType: !55, size: 288, offset: 256)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_matrix", file: !48, line: 47, baseType: !56)
!56 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_matrix", file: !48, line: 44, size: 288, flags: DIFlagTypePassByValue, elements: !57, identifier: "_ZTS10vms_matrix")
!57 = !{!58, !59, !60}
!58 = !DIDerivedType(tag: DW_TAG_member, name: "rvec", scope: !56, file: !48, line: 46, baseType: !47, size: 96)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "uvec", scope: !56, file: !48, line: 46, baseType: !47, size: 96, offset: 96)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "fvec", scope: !56, file: !48, line: 46, baseType: !47, size: 96, offset: 192)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !29, file: !28, line: 224, baseType: !8, size: 32, offset: 544)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "shields", scope: !29, file: !28, line: 225, baseType: !8, size: 32, offset: 576)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "last_pos", scope: !29, file: !28, line: 226, baseType: !47, size: 96, offset: 608)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "contains_type", scope: !29, file: !28, line: 227, baseType: !65, size: 8, offset: 704)
!65 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !66, line: 30, baseType: !67)
!66 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int8_t.h", directory: "", checksumkind: CSK_MD5, checksum: "5052dfe782b50fed2355b8f61a9e4fa9")
!67 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "contains_id", scope: !29, file: !28, line: 228, baseType: !65, size: 8, offset: 712)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "contains_count", scope: !29, file: !28, line: 229, baseType: !65, size: 8, offset: 720)
!70 = !DIDerivedType(tag: DW_TAG_member, name: "matcen_creator", scope: !29, file: !28, line: 230, baseType: !65, size: 8, offset: 728)
!71 = !DIDerivedType(tag: DW_TAG_member, name: "lifeleft", scope: !29, file: !28, line: 231, baseType: !8, size: 32, offset: 736)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "mtype", scope: !29, file: !28, line: 240, baseType: !73, size: 512, offset: 768)
!73 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !29, file: !28, line: 236, size: 512, flags: DIFlagTypePassByValue, elements: !74, identifier: "_ZTSN6objectUt_E")
!74 = !{!75, !92}
!75 = !DIDerivedType(tag: DW_TAG_member, name: "phys_info", scope: !73, file: !28, line: 238, baseType: !76, size: 512)
!76 = !DIDerivedType(tag: DW_TAG_typedef, name: "physics_info", file: !28, line: 153, baseType: !77)
!77 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "physics_info", file: !28, line: 142, size: 512, flags: DIFlagTypePassByValue, elements: !78, identifier: "_ZTS12physics_info")
!78 = !{!79, !80, !81, !82, !83, !84, !85, !86, !88}
!79 = !DIDerivedType(tag: DW_TAG_member, name: "velocity", scope: !77, file: !28, line: 144, baseType: !47, size: 96)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "thrust", scope: !77, file: !28, line: 145, baseType: !47, size: 96, offset: 96)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "mass", scope: !77, file: !28, line: 146, baseType: !8, size: 32, offset: 192)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "drag", scope: !77, file: !28, line: 147, baseType: !8, size: 32, offset: 224)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "brakes", scope: !77, file: !28, line: 148, baseType: !8, size: 32, offset: 256)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "rotvel", scope: !77, file: !28, line: 149, baseType: !47, size: 96, offset: 288)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "rotthrust", scope: !77, file: !28, line: 150, baseType: !47, size: 96, offset: 384)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "turnroll", scope: !77, file: !28, line: 151, baseType: !87, size: 16, offset: 480)
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "fixang", file: !9, line: 21, baseType: !38)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !77, file: !28, line: 152, baseType: !89, size: 16, offset: 496)
!89 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !90, line: 31, baseType: !91)
!90 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint16_t.h", directory: "", checksumkind: CSK_MD5, checksum: "f0aa926da906b10566dd3171bf347ab7")
!91 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "spin_rate", scope: !73, file: !28, line: 239, baseType: !47, size: 96)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "ctype", scope: !29, file: !28, line: 250, baseType: !94, size: 256, offset: 1280)
!94 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !29, file: !28, line: 243, size: 256, flags: DIFlagTypePassByValue, elements: !95, identifier: "_ZTSN6objectUt0_E")
!95 = !{!96, !107, !117, !135, !140}
!96 = !DIDerivedType(tag: DW_TAG_member, name: "laser_info", scope: !94, file: !28, line: 245, baseType: !97, size: 160)
!97 = !DIDerivedType(tag: DW_TAG_typedef, name: "laser_info_t", file: !28, line: 166, baseType: !98)
!98 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "laser_info_s", file: !28, line: 157, size: 160, flags: DIFlagTypePassByValue, elements: !99, identifier: "_ZTS12laser_info_s")
!99 = !{!100, !101, !102, !103, !104, !105, !106}
!100 = !DIDerivedType(tag: DW_TAG_member, name: "parent_type", scope: !98, file: !28, line: 159, baseType: !38, size: 16)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "parent_num", scope: !98, file: !28, line: 160, baseType: !38, size: 16, offset: 16)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "parent_signature", scope: !98, file: !28, line: 161, baseType: !12, size: 32, offset: 32)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "creation_time", scope: !98, file: !28, line: 162, baseType: !8, size: 32, offset: 64)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "last_hitobj", scope: !98, file: !28, line: 163, baseType: !38, size: 16, offset: 96)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "track_goal", scope: !98, file: !28, line: 164, baseType: !38, size: 16, offset: 112)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "multiplier", scope: !98, file: !28, line: 165, baseType: !8, size: 32, offset: 128)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "expl_info", scope: !94, file: !28, line: 246, baseType: !108, size: 128)
!108 = !DIDerivedType(tag: DW_TAG_typedef, name: "explosion_info", file: !28, line: 176, baseType: !109)
!109 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "explosion_info", file: !28, line: 168, size: 128, flags: DIFlagTypePassByValue, elements: !110, identifier: "_ZTS14explosion_info")
!110 = !{!111, !112, !113, !114, !115, !116}
!111 = !DIDerivedType(tag: DW_TAG_member, name: "spawn_time", scope: !109, file: !28, line: 170, baseType: !8, size: 32)
!112 = !DIDerivedType(tag: DW_TAG_member, name: "delete_time", scope: !109, file: !28, line: 171, baseType: !8, size: 32, offset: 32)
!113 = !DIDerivedType(tag: DW_TAG_member, name: "delete_objnum", scope: !109, file: !28, line: 172, baseType: !38, size: 16, offset: 64)
!114 = !DIDerivedType(tag: DW_TAG_member, name: "attach_parent", scope: !109, file: !28, line: 173, baseType: !38, size: 16, offset: 80)
!115 = !DIDerivedType(tag: DW_TAG_member, name: "prev_attach", scope: !109, file: !28, line: 174, baseType: !38, size: 16, offset: 96)
!116 = !DIDerivedType(tag: DW_TAG_member, name: "next_attach", scope: !109, file: !28, line: 175, baseType: !38, size: 16, offset: 112)
!117 = !DIDerivedType(tag: DW_TAG_member, name: "ai_info", scope: !94, file: !28, line: 247, baseType: !118, size: 256)
!118 = !DIDerivedType(tag: DW_TAG_typedef, name: "ai_static", file: !119, line: 144, baseType: !120)
!119 = !DIFile(filename: "main_d2/aistruct.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "d122430e792a0ddc0f9eaa08ad217628")
!120 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ai_static", file: !119, line: 127, size: 256, flags: DIFlagTypePassByValue, elements: !121, identifier: "_ZTS9ai_static")
!121 = !{!122, !123, !127, !128, !129, !130, !131, !132, !133, !134}
!122 = !DIDerivedType(tag: DW_TAG_member, name: "behavior", scope: !120, file: !119, line: 128, baseType: !33, size: 8)
!123 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !120, file: !119, line: 129, baseType: !124, size: 88, offset: 8)
!124 = !DICompositeType(tag: DW_TAG_array_type, baseType: !65, size: 88, elements: !125)
!125 = !{!126}
!126 = !DISubrange(count: 11)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "hide_segment", scope: !120, file: !119, line: 130, baseType: !38, size: 16, offset: 96)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "hide_index", scope: !120, file: !119, line: 131, baseType: !38, size: 16, offset: 112)
!129 = !DIDerivedType(tag: DW_TAG_member, name: "path_length", scope: !120, file: !119, line: 132, baseType: !38, size: 16, offset: 128)
!130 = !DIDerivedType(tag: DW_TAG_member, name: "cur_path_index", scope: !120, file: !119, line: 133, baseType: !65, size: 8, offset: 144)
!131 = !DIDerivedType(tag: DW_TAG_member, name: "dying_sound_playing", scope: !120, file: !119, line: 134, baseType: !65, size: 8, offset: 152)
!132 = !DIDerivedType(tag: DW_TAG_member, name: "danger_laser_num", scope: !120, file: !119, line: 139, baseType: !38, size: 16, offset: 160)
!133 = !DIDerivedType(tag: DW_TAG_member, name: "danger_laser_signature", scope: !120, file: !119, line: 140, baseType: !12, size: 32, offset: 192)
!134 = !DIDerivedType(tag: DW_TAG_member, name: "dying_start_time", scope: !120, file: !119, line: 141, baseType: !8, size: 32, offset: 224)
!135 = !DIDerivedType(tag: DW_TAG_member, name: "light_info", scope: !94, file: !28, line: 248, baseType: !136, size: 32)
!136 = !DIDerivedType(tag: DW_TAG_typedef, name: "light_info_t", file: !28, line: 181, baseType: !137)
!137 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "light_info_s", file: !28, line: 178, size: 32, flags: DIFlagTypePassByValue, elements: !138, identifier: "_ZTS12light_info_s")
!138 = !{!139}
!139 = !DIDerivedType(tag: DW_TAG_member, name: "intensity", scope: !137, file: !28, line: 180, baseType: !8, size: 32)
!140 = !DIDerivedType(tag: DW_TAG_member, name: "powerup_info", scope: !94, file: !28, line: 249, baseType: !141, size: 96)
!141 = !DIDerivedType(tag: DW_TAG_typedef, name: "powerup_info_t", file: !28, line: 190, baseType: !142)
!142 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "powerup_info_s", file: !28, line: 185, size: 96, flags: DIFlagTypePassByValue, elements: !143, identifier: "_ZTS14powerup_info_s")
!143 = !{!144, !145, !146}
!144 = !DIDerivedType(tag: DW_TAG_member, name: "count", scope: !142, file: !28, line: 187, baseType: !12, size: 32)
!145 = !DIDerivedType(tag: DW_TAG_member, name: "creation_time", scope: !142, file: !28, line: 188, baseType: !8, size: 32, offset: 32)
!146 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !142, file: !28, line: 189, baseType: !12, size: 32, offset: 64)
!147 = !DIDerivedType(tag: DW_TAG_member, name: "rtype", scope: !29, file: !28, line: 257, baseType: !148, size: 608, offset: 1536)
!148 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !29, file: !28, line: 253, size: 608, flags: DIFlagTypePassByValue, elements: !149, identifier: "_ZTSN6objectUt1_E")
!149 = !{!150, !168}
!150 = !DIDerivedType(tag: DW_TAG_member, name: "pobj_info", scope: !148, file: !28, line: 255, baseType: !151, size: 608)
!151 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyobj_info", file: !28, line: 208, baseType: !152)
!152 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "polyobj_info", file: !28, line: 201, size: 608, flags: DIFlagTypePassByValue, elements: !153, identifier: "_ZTS12polyobj_info")
!153 = !{!154, !155, !165, !166, !167}
!154 = !DIDerivedType(tag: DW_TAG_member, name: "model_num", scope: !152, file: !28, line: 203, baseType: !12, size: 32)
!155 = !DIDerivedType(tag: DW_TAG_member, name: "anim_angles", scope: !152, file: !28, line: 204, baseType: !156, size: 480, offset: 32)
!156 = !DICompositeType(tag: DW_TAG_array_type, baseType: !157, size: 480, elements: !163)
!157 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_angvec", file: !48, line: 40, baseType: !158)
!158 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_angvec", file: !48, line: 37, size: 48, flags: DIFlagTypePassByValue, elements: !159, identifier: "_ZTS10vms_angvec")
!159 = !{!160, !161, !162}
!160 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !158, file: !48, line: 39, baseType: !87, size: 16)
!161 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !158, file: !48, line: 39, baseType: !87, size: 16, offset: 16)
!162 = !DIDerivedType(tag: DW_TAG_member, name: "h", scope: !158, file: !48, line: 39, baseType: !87, size: 16, offset: 32)
!163 = !{!164}
!164 = !DISubrange(count: 10)
!165 = !DIDerivedType(tag: DW_TAG_member, name: "subobj_flags", scope: !152, file: !28, line: 205, baseType: !12, size: 32, offset: 512)
!166 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_override", scope: !152, file: !28, line: 206, baseType: !12, size: 32, offset: 544)
!167 = !DIDerivedType(tag: DW_TAG_member, name: "alt_textures", scope: !152, file: !28, line: 207, baseType: !12, size: 32, offset: 576)
!168 = !DIDerivedType(tag: DW_TAG_member, name: "vclip_info", scope: !148, file: !28, line: 256, baseType: !169, size: 96)
!169 = !DIDerivedType(tag: DW_TAG_typedef, name: "vclip_info_t", file: !28, line: 197, baseType: !170)
!170 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vclip_info_s", file: !28, line: 192, size: 96, flags: DIFlagTypePassByValue, elements: !171, identifier: "_ZTS12vclip_info_s")
!171 = !{!172, !173, !174}
!172 = !DIDerivedType(tag: DW_TAG_member, name: "vclip_num", scope: !170, file: !28, line: 194, baseType: !12, size: 32)
!173 = !DIDerivedType(tag: DW_TAG_member, name: "frametime", scope: !170, file: !28, line: 195, baseType: !8, size: 32, offset: 32)
!174 = !DIDerivedType(tag: DW_TAG_member, name: "framenum", scope: !170, file: !28, line: 196, baseType: !65, size: 8, offset: 64)
!175 = !DIGlobalVariableExpression(var: !176, expr: !DIExpression())
!176 = distinct !DIGlobalVariable(name: "Total_retries", scope: !2, file: !16, line: 302, type: !12, isLocal: false, isDefinition: true)
!177 = !DIGlobalVariableExpression(var: !178, expr: !DIExpression())
!178 = distinct !DIGlobalVariable(name: "Total_sims", scope: !2, file: !16, line: 302, type: !12, isLocal: false, isDefinition: true)
!179 = !DIGlobalVariableExpression(var: !180, expr: !DIExpression())
!180 = distinct !DIGlobalVariable(name: "Dont_move_ai_objects", scope: !2, file: !16, line: 303, type: !12, isLocal: false, isDefinition: true)
!181 = !DIGlobalVariableExpression(var: !182, expr: !DIExpression())
!182 = distinct !DIGlobalVariable(scope: null, file: !16, line: 318, type: !183, isLocal: true, isDefinition: true)
!183 = !DICompositeType(tag: DW_TAG_array_type, baseType: !184, size: 112, elements: !186)
!184 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !185)
!185 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!186 = !{!187}
!187 = !DISubrange(count: 14)
!188 = !DIGlobalVariableExpression(var: !189, expr: !DIExpression())
!189 = distinct !DIGlobalVariable(scope: null, file: !16, line: 318, type: !190, isLocal: true, isDefinition: true)
!190 = !DICompositeType(tag: DW_TAG_array_type, baseType: !184, size: 456, elements: !191)
!191 = !{!192}
!192 = !DISubrange(count: 57)
!193 = !DIGlobalVariableExpression(var: !194, expr: !DIExpression())
!194 = distinct !DIGlobalVariable(scope: null, file: !16, line: 972, type: !195, isLocal: true, isDefinition: true)
!195 = !DICompositeType(tag: DW_TAG_array_type, baseType: !184, size: 176, elements: !196)
!196 = !{!197}
!197 = !DISubrange(count: 22)
!198 = !DIGlobalVariableExpression(var: !199, expr: !DIExpression())
!199 = distinct !DIGlobalVariable(scope: null, file: !16, line: 973, type: !200, isLocal: true, isDefinition: true)
!200 = !DICompositeType(tag: DW_TAG_array_type, baseType: !184, size: 264, elements: !201)
!201 = !{!202}
!202 = !DISubrange(count: 33)
!203 = !DIGlobalVariableExpression(var: !204, expr: !DIExpression())
!204 = distinct !DIGlobalVariable(scope: null, file: !16, line: 1000, type: !205, isLocal: true, isDefinition: true)
!205 = !DICompositeType(tag: DW_TAG_array_type, baseType: !184, size: 280, elements: !206)
!206 = !{!207}
!207 = !DISubrange(count: 35)
!208 = !DIGlobalVariableExpression(var: !209, expr: !DIExpression())
!209 = distinct !DIGlobalVariable(scope: null, file: !16, line: 1001, type: !210, isLocal: true, isDefinition: true)
!210 = !DICompositeType(tag: DW_TAG_array_type, baseType: !184, size: 168, elements: !211)
!211 = !{!212}
!212 = !DISubrange(count: 21)
!213 = !DIGlobalVariableExpression(var: !214, expr: !DIExpression())
!214 = distinct !DIGlobalVariable(scope: null, file: !16, line: 1002, type: !215, isLocal: true, isDefinition: true)
!215 = !DICompositeType(tag: DW_TAG_array_type, baseType: !184, size: 136, elements: !216)
!216 = !{!217}
!217 = !DISubrange(count: 17)
!218 = !DIGlobalVariableExpression(var: !219, expr: !DIExpression())
!219 = distinct !DIGlobalVariable(scope: null, file: !16, line: 1008, type: !220, isLocal: true, isDefinition: true)
!220 = !DICompositeType(tag: DW_TAG_array_type, baseType: !184, size: 304, elements: !221)
!221 = !{!222}
!222 = !DISubrange(count: 38)
!223 = !DIGlobalVariableExpression(var: !224, expr: !DIExpression())
!224 = distinct !DIGlobalVariable(scope: null, file: !16, line: 1013, type: !225, isLocal: true, isDefinition: true)
!225 = !DICompositeType(tag: DW_TAG_array_type, baseType: !184, size: 384, elements: !226)
!226 = !{!227}
!227 = !DISubrange(count: 48)
!228 = !DIGlobalVariableExpression(var: !229, expr: !DIExpression())
!229 = distinct !DIGlobalVariable(scope: null, file: !16, line: 1027, type: !230, isLocal: true, isDefinition: true)
!230 = !DICompositeType(tag: DW_TAG_array_type, baseType: !184, size: 248, elements: !231)
!231 = !{!232}
!232 = !DISubrange(count: 31)
!233 = !DIGlobalVariableExpression(var: !234, expr: !DIExpression())
!234 = distinct !DIGlobalVariable(scope: null, file: !16, line: 1030, type: !235, isLocal: true, isDefinition: true)
!235 = !DICompositeType(tag: DW_TAG_array_type, baseType: !184, size: 616, elements: !236)
!236 = !{!237}
!237 = !DISubrange(count: 77)
!238 = !DIGlobalVariableExpression(var: !239, expr: !DIExpression())
!239 = distinct !DIGlobalVariable(scope: null, file: !16, line: 1078, type: !240, isLocal: true, isDefinition: true)
!240 = !DICompositeType(tag: DW_TAG_array_type, baseType: !184, size: 184, elements: !241)
!241 = !{!242}
!242 = !DISubrange(count: 23)
!243 = !DIGlobalVariableExpression(var: !244, expr: !DIExpression())
!244 = distinct !DIGlobalVariable(scope: null, file: !16, line: 1089, type: !200, isLocal: true, isDefinition: true)
!245 = !DIGlobalVariableExpression(var: !246, expr: !DIExpression())
!246 = distinct !DIGlobalVariable(scope: null, file: !16, line: 1110, type: !247, isLocal: true, isDefinition: true)
!247 = !DICompositeType(tag: DW_TAG_array_type, baseType: !184, size: 224, elements: !248)
!248 = !{!249}
!249 = !DISubrange(count: 28)
!250 = !DIGlobalVariableExpression(var: !251, expr: !DIExpression())
!251 = distinct !DIGlobalVariable(scope: null, file: !16, line: 1117, type: !252, isLocal: true, isDefinition: true)
!252 = !DICompositeType(tag: DW_TAG_array_type, baseType: !184, size: 416, elements: !253)
!253 = !{!254}
!254 = !DISubrange(count: 52)
!255 = !DIGlobalVariableExpression(var: !256, expr: !DIExpression())
!256 = distinct !DIGlobalVariable(scope: null, file: !16, line: 1118, type: !257, isLocal: true, isDefinition: true)
!257 = !DICompositeType(tag: DW_TAG_array_type, baseType: !184, size: 256, elements: !258)
!258 = !{!259}
!259 = !DISubrange(count: 32)
!260 = !DIGlobalVariableExpression(var: !261, expr: !DIExpression())
!261 = distinct !DIGlobalVariable(name: "cfvi50_count", scope: !262, file: !16, line: 1145, type: !12, isLocal: true, isDefinition: true)
!262 = distinct !DISubprogram(name: "do_physics_sim", linkageName: "_Z14do_physics_simP6object", scope: !16, file: !16, line: 443, type: !263, scopeLine: 444, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !265)
!263 = !DISubroutineType(types: !264)
!264 = !{null, !26}
!265 = !{}
!266 = !DIGlobalVariableExpression(var: !267, expr: !DIExpression())
!267 = distinct !DIGlobalVariable(scope: null, file: !16, line: 1147, type: !268, isLocal: true, isDefinition: true)
!268 = !DICompositeType(tag: DW_TAG_array_type, baseType: !184, size: 824, elements: !269)
!269 = !{!270}
!270 = !DISubrange(count: 103)
!271 = !DIGlobalVariableExpression(var: !272, expr: !DIExpression())
!272 = distinct !DIGlobalVariable(scope: null, file: !16, line: 1164, type: !273, isLocal: true, isDefinition: true)
!273 = !DICompositeType(tag: DW_TAG_array_type, baseType: !184, size: 464, elements: !274)
!274 = !{!275}
!275 = !DISubrange(count: 58)
!276 = !DIGlobalVariableExpression(var: !277, expr: !DIExpression())
!277 = distinct !DIGlobalVariable(scope: null, file: !16, line: 1181, type: !220, isLocal: true, isDefinition: true)
!278 = !DIGlobalVariableExpression(var: !279, expr: !DIExpression())
!279 = distinct !DIGlobalVariable(scope: null, file: !16, line: 1191, type: !280, isLocal: true, isDefinition: true)
!280 = !DICompositeType(tag: DW_TAG_array_type, baseType: !184, size: 408, elements: !281)
!281 = !{!282}
!282 = !DISubrange(count: 51)
!283 = !DIGlobalVariableExpression(var: !284, expr: !DIExpression())
!284 = distinct !DIGlobalVariable(scope: null, file: !16, line: 1203, type: !285, isLocal: true, isDefinition: true)
!285 = !DICompositeType(tag: DW_TAG_array_type, baseType: !184, size: 672, elements: !286)
!286 = !{!287}
!287 = !DISubrange(count: 84)
!288 = !DIGlobalVariableExpression(var: !289, expr: !DIExpression())
!289 = distinct !DIGlobalVariable(scope: null, file: !16, line: 1216, type: !240, isLocal: true, isDefinition: true)
!290 = !DIGlobalVariableExpression(var: !291, expr: !DIExpression())
!291 = distinct !DIGlobalVariable(scope: null, file: !16, line: 1260, type: !292, isLocal: true, isDefinition: true)
!292 = !DICompositeType(tag: DW_TAG_array_type, baseType: !184, size: 240, elements: !293)
!293 = !{!294}
!294 = !DISubrange(count: 30)
!295 = !DIGlobalVariableExpression(var: !296, expr: !DIExpression())
!296 = distinct !DIGlobalVariable(scope: null, file: !16, line: 1284, type: !230, isLocal: true, isDefinition: true)
!297 = !DIGlobalVariableExpression(var: !298, expr: !DIExpression())
!298 = distinct !DIGlobalVariable(scope: null, file: !16, line: 1286, type: !299, isLocal: true, isDefinition: true)
!299 = !DICompositeType(tag: DW_TAG_array_type, baseType: !184, size: 584, elements: !300)
!300 = !{!301}
!301 = !DISubrange(count: 73)
!302 = !DIGlobalVariableExpression(var: !303, expr: !DIExpression())
!303 = distinct !DIGlobalVariable(scope: null, file: !16, line: 1298, type: !195, isLocal: true, isDefinition: true)
!304 = !DIGlobalVariableExpression(var: !305, expr: !DIExpression())
!305 = distinct !DIGlobalVariable(scope: null, file: !16, line: 1322, type: !306, isLocal: true, isDefinition: true)
!306 = !DICompositeType(tag: DW_TAG_array_type, baseType: !184, size: 128, elements: !307)
!307 = !{!308}
!308 = !DISubrange(count: 16)
!309 = !DIGlobalVariableExpression(var: !310, expr: !DIExpression())
!310 = distinct !DIGlobalVariable(scope: null, file: !16, line: 1323, type: !215, isLocal: true, isDefinition: true)
!311 = !DIGlobalVariableExpression(var: !312, expr: !DIExpression())
!312 = distinct !DIGlobalVariable(scope: null, file: !16, line: 1328, type: !313, isLocal: true, isDefinition: true)
!313 = !DICompositeType(tag: DW_TAG_array_type, baseType: !184, size: 784, elements: !314)
!314 = !{!315}
!315 = !DISubrange(count: 98)
!316 = !DIGlobalVariableExpression(var: !317, expr: !DIExpression())
!317 = distinct !DIGlobalVariable(scope: null, file: !16, line: 1361, type: !318, isLocal: true, isDefinition: true)
!318 = !DICompositeType(tag: DW_TAG_array_type, baseType: !184, size: 312, elements: !319)
!319 = !{!320}
!320 = !DISubrange(count: 39)
!321 = !DIGlobalVariableExpression(var: !322, expr: !DIExpression())
!322 = distinct !DIGlobalVariable(scope: null, file: !16, line: 1390, type: !292, isLocal: true, isDefinition: true)
!323 = !DIGlobalVariableExpression(var: !324, expr: !DIExpression())
!324 = distinct !DIGlobalVariable(scope: null, file: !16, line: 1391, type: !325, isLocal: true, isDefinition: true)
!325 = !DICompositeType(tag: DW_TAG_array_type, baseType: !184, size: 336, elements: !326)
!326 = !{!327}
!327 = !DISubrange(count: 42)
!328 = !DIGlobalVariableExpression(var: !329, expr: !DIExpression())
!329 = distinct !DIGlobalVariable(scope: null, file: !16, line: 1407, type: !330, isLocal: true, isDefinition: true)
!330 = !DICompositeType(tag: DW_TAG_array_type, baseType: !184, size: 208, elements: !331)
!331 = !{!332}
!332 = !DISubrange(count: 26)
!333 = !DIGlobalVariableExpression(var: !334, expr: !DIExpression())
!334 = distinct !DIGlobalVariable(scope: null, file: !16, line: 1416, type: !215, isLocal: true, isDefinition: true)
!335 = !DIGlobalVariableExpression(var: !336, expr: !DIExpression())
!336 = distinct !DIGlobalVariable(scope: null, file: !16, line: 1451, type: !230, isLocal: true, isDefinition: true)
!337 = !DIGlobalVariableExpression(var: !338, expr: !DIExpression())
!338 = distinct !DIGlobalVariable(scope: null, file: !16, line: 1530, type: !339, isLocal: true, isDefinition: true)
!339 = !DICompositeType(tag: DW_TAG_array_type, baseType: !184, size: 232, elements: !340)
!340 = !{!341}
!341 = !DISubrange(count: 29)
!342 = !DIGlobalVariableExpression(var: !343, expr: !DIExpression(DW_OP_constu, 16, DW_OP_stack_value))
!343 = distinct !DIGlobalVariable(name: "FRACBITS", scope: !2, file: !9, line: 18, type: !344, isLocal: true, isDefinition: true)
!344 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !12)
!345 = !{!346, !350, !353, !354, !355, !356, !357, !361, !365, !368, !370, !372, !374, !376, !378, !380, !382, !384, !386, !388, !390, !392, !394, !396, !398, !404, !408, !411}
!346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !347, entity: !65, file: !349, line: 158)
!347 = !DINamespace(name: "__1", scope: !348, exportSymbols: true)
!348 = !DINamespace(name: "std", scope: null)
!349 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdint", directory: "")
!350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !347, entity: !351, file: !349, line: 159)
!351 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !352, line: 30, baseType: !38)
!352 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int16_t.h", directory: "", checksumkind: CSK_MD5, checksum: "47ed3c3ac6f65bfec021ca2b7be18e7e")
!353 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !347, entity: !10, file: !349, line: 160)
!354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !347, entity: !5, file: !349, line: 161)
!355 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !347, entity: !33, file: !349, line: 163)
!356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !347, entity: !89, file: !349, line: 164)
!357 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !347, entity: !358, file: !349, line: 165)
!358 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !359, line: 31, baseType: !360)
!359 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint32_t.h", directory: "", checksumkind: CSK_MD5, checksum: "0254eb80c6b9719ac45c3c1cf872109b")
!360 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!361 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !347, entity: !362, file: !349, line: 166)
!362 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !363, line: 31, baseType: !364)
!363 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint64_t.h", directory: "", checksumkind: CSK_MD5, checksum: "77fc5e91653260959605f129691cf9b1")
!364 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!365 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !347, entity: !366, file: !349, line: 168)
!366 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !367, line: 29, baseType: !65)
!367 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "042ceedaf4137a8aaa272d0b27434016")
!368 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !347, entity: !369, file: !349, line: 169)
!369 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !367, line: 30, baseType: !351)
!370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !347, entity: !371, file: !349, line: 170)
!371 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !367, line: 31, baseType: !10)
!372 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !347, entity: !373, file: !349, line: 171)
!373 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !367, line: 32, baseType: !5)
!374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !347, entity: !375, file: !349, line: 173)
!375 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !367, line: 33, baseType: !33)
!376 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !347, entity: !377, file: !349, line: 174)
!377 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !367, line: 34, baseType: !89)
!378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !347, entity: !379, file: !349, line: 175)
!379 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !367, line: 35, baseType: !358)
!380 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !347, entity: !381, file: !349, line: 176)
!381 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !367, line: 36, baseType: !362)
!382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !347, entity: !383, file: !349, line: 178)
!383 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !367, line: 40, baseType: !65)
!384 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !347, entity: !385, file: !349, line: 179)
!385 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !367, line: 41, baseType: !351)
!386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !347, entity: !387, file: !349, line: 180)
!387 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !367, line: 42, baseType: !10)
!388 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !347, entity: !389, file: !349, line: 181)
!389 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !367, line: 43, baseType: !5)
!390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !347, entity: !391, file: !349, line: 183)
!391 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !367, line: 44, baseType: !33)
!392 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !347, entity: !393, file: !349, line: 184)
!393 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !367, line: 45, baseType: !89)
!394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !347, entity: !395, file: !349, line: 185)
!395 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !367, line: 46, baseType: !358)
!396 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !347, entity: !397, file: !349, line: 186)
!397 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !367, line: 47, baseType: !362)
!398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !347, entity: !399, file: !349, line: 188)
!399 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !400, line: 32, baseType: !401)
!400 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_intptr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e478ba47270923b1cca6659f19f02db1")
!401 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_intptr_t", file: !402, line: 40, baseType: !403)
!402 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/arm/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "b270144f57ae258d0ce80b8f87be068c")
!403 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!404 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !347, entity: !405, file: !349, line: 189)
!405 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !406, line: 34, baseType: !407)
!406 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_uintptr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e70ae655dd1b9d4ae0b1dcc073f5b7e4")
!407 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!408 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !347, entity: !409, file: !349, line: 191)
!409 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !410, line: 32, baseType: !403)
!410 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_intmax_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e37b9240f30f486478152ef3989b1545")
!411 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !347, entity: !412, file: !349, line: 192)
!412 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !413, line: 32, baseType: !407)
!413 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uintmax_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8217a3fbb207d8e87ca5318c313e81c2")
!414 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 4]}
!415 = !{i32 7, !"Dwarf Version", i32 5}
!416 = !{i32 2, !"Debug Info Version", i32 3}
!417 = !{i32 1, !"wchar_size", i32 4}
!418 = !{i32 8, !"PIC Level", i32 2}
!419 = !{i32 7, !"uwtable", i32 1}
!420 = !{i32 7, !"frame-pointer", i32 1}
!421 = !{!"Homebrew clang version 20.1.8"}
!422 = distinct !DISubprogram(name: "check_and_fix_matrix", linkageName: "_Z20check_and_fix_matrixP10vms_matrix", scope: !16, file: !16, line: 100, type: !423, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !265)
!423 = !DISubroutineType(types: !424)
!424 = !{null, !425}
!425 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!426 = !DILocalVariable(name: "m", arg: 1, scope: !422, file: !16, line: 100, type: !425)
!427 = !DILocation(line: 100, column: 39, scope: !422)
!428 = !DILocalVariable(name: "tempm", scope: !422, file: !16, line: 102, type: !55)
!429 = !DILocation(line: 102, column: 13, scope: !422)
!430 = !DILocation(line: 104, column: 29, scope: !422)
!431 = !DILocation(line: 104, column: 32, scope: !422)
!432 = !DILocation(line: 104, column: 38, scope: !422)
!433 = !DILocation(line: 104, column: 41, scope: !422)
!434 = !DILocation(line: 104, column: 2, scope: !422)
!435 = !DILocation(line: 105, column: 3, scope: !422)
!436 = !DILocation(line: 105, column: 6, scope: !422)
!437 = !DILocation(line: 106, column: 1, scope: !422)
!438 = distinct !DISubprogram(name: "do_physics_align_object", linkageName: "_Z23do_physics_align_objectP6object", scope: !16, file: !16, line: 109, type: !263, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !265)
!439 = !DILocalVariable(name: "obj", arg: 1, scope: !438, file: !16, line: 109, type: !26)
!440 = !DILocation(line: 109, column: 40, scope: !438)
!441 = !DILocalVariable(name: "desired_upvec", scope: !438, file: !16, line: 163, type: !47)
!442 = !DILocation(line: 163, column: 13, scope: !438)
!443 = !DILocalVariable(name: "delta_ang", scope: !438, file: !16, line: 164, type: !87)
!444 = !DILocation(line: 164, column: 9, scope: !438)
!445 = !DILocalVariable(name: "roll_ang", scope: !438, file: !16, line: 164, type: !87)
!446 = !DILocation(line: 164, column: 19, scope: !438)
!447 = !DILocalVariable(name: "temp_matrix", scope: !438, file: !16, line: 166, type: !55)
!448 = !DILocation(line: 166, column: 13, scope: !438)
!449 = !DILocalVariable(name: "d", scope: !438, file: !16, line: 167, type: !8)
!450 = !DILocation(line: 167, column: 6, scope: !438)
!451 = !DILocalVariable(name: "largest_d", scope: !438, file: !16, line: 167, type: !8)
!452 = !DILocation(line: 167, column: 8, scope: !438)
!453 = !DILocalVariable(name: "i", scope: !438, file: !16, line: 168, type: !12)
!454 = !DILocation(line: 168, column: 6, scope: !438)
!455 = !DILocalVariable(name: "best_side", scope: !438, file: !16, line: 168, type: !12)
!456 = !DILocation(line: 168, column: 8, scope: !438)
!457 = !DILocation(line: 175, column: 8, scope: !458)
!458 = distinct !DILexicalBlock(scope: !438, file: !16, line: 175, column: 2)
!459 = !DILocation(line: 175, column: 7, scope: !458)
!460 = !DILocation(line: 175, column: 11, scope: !461)
!461 = distinct !DILexicalBlock(scope: !458, file: !16, line: 175, column: 2)
!462 = !DILocation(line: 175, column: 12, scope: !461)
!463 = !DILocation(line: 175, column: 2, scope: !458)
!464 = !DILocation(line: 181, column: 8, scope: !465)
!465 = distinct !DILexicalBlock(scope: !461, file: !16, line: 175, column: 20)
!466 = !DILocation(line: 181, column: 6, scope: !465)
!467 = !DILocation(line: 184, column: 7, scope: !468)
!468 = distinct !DILexicalBlock(scope: !465, file: !16, line: 184, column: 7)
!469 = !DILocation(line: 184, column: 11, scope: !468)
!470 = !DILocation(line: 184, column: 9, scope: !468)
!471 = !DILocation(line: 184, column: 35, scope: !472)
!472 = distinct !DILexicalBlock(scope: !468, file: !16, line: 184, column: 22)
!473 = !DILocation(line: 184, column: 33, scope: !472)
!474 = !DILocation(line: 184, column: 48, scope: !472)
!475 = !DILocation(line: 184, column: 47, scope: !472)
!476 = !DILocation(line: 184, column: 50, scope: !472)
!477 = !DILocation(line: 185, column: 2, scope: !465)
!478 = !DILocation(line: 175, column: 16, scope: !461)
!479 = !DILocation(line: 175, column: 2, scope: !461)
!480 = distinct !{!480, !463, !481, !482}
!481 = !DILocation(line: 185, column: 2, scope: !458)
!482 = !{!"llvm.loop.mustprogress"}
!483 = !DILocation(line: 187, column: 6, scope: !484)
!484 = distinct !DILexicalBlock(scope: !438, file: !16, line: 187, column: 6)
!485 = !DILocation(line: 193, column: 29, scope: !486)
!486 = distinct !DILexicalBlock(scope: !484, file: !16, line: 187, column: 23)
!487 = !DILocation(line: 193, column: 34, scope: !486)
!488 = !DILocation(line: 193, column: 20, scope: !486)
!489 = !DILocation(line: 193, column: 42, scope: !486)
!490 = !DILocation(line: 193, column: 51, scope: !486)
!491 = !DILocation(line: 193, column: 18, scope: !486)
!492 = !DILocation(line: 196, column: 2, scope: !486)
!493 = !DILocation(line: 198, column: 31, scope: !494)
!494 = distinct !DILexicalBlock(scope: !484, file: !16, line: 198, column: 7)
!495 = !DILocation(line: 198, column: 36, scope: !494)
!496 = !DILocation(line: 198, column: 22, scope: !494)
!497 = !DILocation(line: 198, column: 44, scope: !494)
!498 = !DILocation(line: 198, column: 50, scope: !494)
!499 = !DILocation(line: 198, column: 7, scope: !494)
!500 = !DILocation(line: 198, column: 61, scope: !494)
!501 = !DILocalVariable(name: "s", scope: !502, file: !16, line: 209, type: !503)
!502 = distinct !DILexicalBlock(scope: !494, file: !16, line: 198, column: 66)
!503 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !504, size: 64)
!504 = !DIDerivedType(tag: DW_TAG_typedef, name: "side", file: !505, line: 91, baseType: !506)
!505 = !DIFile(filename: "main_d2/segment.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "c950815a9b07e6bab2fa2587b90affec")
!506 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "side", file: !505, line: 82, size: 640, flags: DIFlagTypePassByValue, elements: !507, identifier: "_ZTS4side")
!507 = !{!508, !509, !510, !511, !512, !513, !523}
!508 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !506, file: !505, line: 84, baseType: !65, size: 8)
!509 = !DIDerivedType(tag: DW_TAG_member, name: "pad", scope: !506, file: !505, line: 85, baseType: !33, size: 8, offset: 8)
!510 = !DIDerivedType(tag: DW_TAG_member, name: "wall_num", scope: !506, file: !505, line: 86, baseType: !38, size: 16, offset: 16)
!511 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_num", scope: !506, file: !505, line: 87, baseType: !38, size: 16, offset: 32)
!512 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_num2", scope: !506, file: !505, line: 88, baseType: !38, size: 16, offset: 48)
!513 = !DIDerivedType(tag: DW_TAG_member, name: "uvls", scope: !506, file: !505, line: 89, baseType: !514, size: 384, offset: 64)
!514 = !DICompositeType(tag: DW_TAG_array_type, baseType: !515, size: 384, elements: !521)
!515 = !DIDerivedType(tag: DW_TAG_typedef, name: "uvl", file: !505, line: 67, baseType: !516)
!516 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uvl", file: !505, line: 64, size: 96, flags: DIFlagTypePassByValue, elements: !517, identifier: "_ZTS3uvl")
!517 = !{!518, !519, !520}
!518 = !DIDerivedType(tag: DW_TAG_member, name: "u", scope: !516, file: !505, line: 66, baseType: !8, size: 32)
!519 = !DIDerivedType(tag: DW_TAG_member, name: "v", scope: !516, file: !505, line: 66, baseType: !8, size: 32, offset: 32)
!520 = !DIDerivedType(tag: DW_TAG_member, name: "l", scope: !516, file: !505, line: 66, baseType: !8, size: 32, offset: 64)
!521 = !{!522}
!522 = !DISubrange(count: 4)
!523 = !DIDerivedType(tag: DW_TAG_member, name: "normals", scope: !506, file: !505, line: 90, baseType: !524, size: 192, offset: 448)
!524 = !DICompositeType(tag: DW_TAG_array_type, baseType: !47, size: 192, elements: !525)
!525 = !{!526}
!526 = !DISubrange(count: 2)
!527 = !DILocation(line: 209, column: 11, scope: !502)
!528 = !DILocation(line: 209, column: 25, scope: !502)
!529 = !DILocation(line: 209, column: 30, scope: !502)
!530 = !DILocation(line: 209, column: 16, scope: !502)
!531 = !DILocation(line: 209, column: 38, scope: !502)
!532 = !DILocation(line: 209, column: 44, scope: !502)
!533 = !DILocation(line: 210, column: 24, scope: !502)
!534 = !DILocation(line: 210, column: 27, scope: !502)
!535 = !DILocation(line: 210, column: 38, scope: !502)
!536 = !DILocation(line: 210, column: 42, scope: !502)
!537 = !DILocation(line: 210, column: 45, scope: !502)
!538 = !DILocation(line: 210, column: 56, scope: !502)
!539 = !DILocation(line: 210, column: 40, scope: !502)
!540 = !DILocation(line: 210, column: 59, scope: !502)
!541 = !DILocation(line: 210, column: 19, scope: !502)
!542 = !DILocation(line: 210, column: 21, scope: !502)
!543 = !DILocation(line: 211, column: 24, scope: !502)
!544 = !DILocation(line: 211, column: 27, scope: !502)
!545 = !DILocation(line: 211, column: 38, scope: !502)
!546 = !DILocation(line: 211, column: 42, scope: !502)
!547 = !DILocation(line: 211, column: 45, scope: !502)
!548 = !DILocation(line: 211, column: 56, scope: !502)
!549 = !DILocation(line: 211, column: 40, scope: !502)
!550 = !DILocation(line: 211, column: 59, scope: !502)
!551 = !DILocation(line: 211, column: 19, scope: !502)
!552 = !DILocation(line: 211, column: 21, scope: !502)
!553 = !DILocation(line: 212, column: 24, scope: !502)
!554 = !DILocation(line: 212, column: 27, scope: !502)
!555 = !DILocation(line: 212, column: 38, scope: !502)
!556 = !DILocation(line: 212, column: 42, scope: !502)
!557 = !DILocation(line: 212, column: 45, scope: !502)
!558 = !DILocation(line: 212, column: 56, scope: !502)
!559 = !DILocation(line: 212, column: 40, scope: !502)
!560 = !DILocation(line: 212, column: 59, scope: !502)
!561 = !DILocation(line: 212, column: 19, scope: !502)
!562 = !DILocation(line: 212, column: 21, scope: !502)
!563 = !DILocation(line: 214, column: 5, scope: !502)
!564 = !DILocation(line: 216, column: 3, scope: !502)
!565 = !DILocation(line: 221, column: 30, scope: !494)
!566 = !DILocation(line: 221, column: 35, scope: !494)
!567 = !DILocation(line: 221, column: 21, scope: !494)
!568 = !DILocation(line: 221, column: 43, scope: !494)
!569 = !DILocation(line: 221, column: 49, scope: !494)
!570 = !DILocation(line: 221, column: 60, scope: !494)
!571 = !DILocation(line: 221, column: 19, scope: !494)
!572 = !DILocation(line: 224, column: 11, scope: !573)
!573 = distinct !DILexicalBlock(scope: !438, file: !16, line: 224, column: 6)
!574 = !DILocation(line: 224, column: 6, scope: !573)
!575 = !DILocation(line: 224, column: 57, scope: !573)
!576 = !DILocalVariable(name: "save_delta_ang", scope: !577, file: !16, line: 225, type: !87)
!577 = distinct !DILexicalBlock(scope: !573, file: !16, line: 224, column: 67)
!578 = !DILocation(line: 225, column: 10, scope: !577)
!579 = !DILocalVariable(name: "tangles", scope: !577, file: !16, line: 226, type: !157)
!580 = !DILocation(line: 226, column: 14, scope: !577)
!581 = !DILocation(line: 228, column: 36, scope: !577)
!582 = !DILocation(line: 228, column: 41, scope: !577)
!583 = !DILocation(line: 228, column: 48, scope: !577)
!584 = !DILocation(line: 228, column: 3, scope: !577)
!585 = !DILocation(line: 230, column: 50, scope: !577)
!586 = !DILocation(line: 230, column: 55, scope: !577)
!587 = !DILocation(line: 230, column: 62, scope: !577)
!588 = !DILocation(line: 230, column: 80, scope: !577)
!589 = !DILocation(line: 230, column: 86, scope: !577)
!590 = !DILocation(line: 230, column: 91, scope: !577)
!591 = !DILocation(line: 230, column: 98, scope: !577)
!592 = !DILocation(line: 230, column: 32, scope: !577)
!593 = !DILocation(line: 230, column: 30, scope: !577)
!594 = !DILocation(line: 230, column: 18, scope: !577)
!595 = !DILocation(line: 232, column: 16, scope: !577)
!596 = !DILocation(line: 232, column: 21, scope: !577)
!597 = !DILocation(line: 232, column: 37, scope: !577)
!598 = !DILocation(line: 232, column: 13, scope: !577)
!599 = !DILocation(line: 234, column: 11, scope: !600)
!600 = distinct !DILexicalBlock(scope: !577, file: !16, line: 234, column: 7)
!601 = !DILocation(line: 234, column: 7, scope: !600)
!602 = !DILocation(line: 234, column: 22, scope: !600)
!603 = !DILocalVariable(name: "rotmat", scope: !604, file: !16, line: 235, type: !55)
!604 = distinct !DILexicalBlock(scope: !600, file: !16, line: 234, column: 34)
!605 = !DILocation(line: 235, column: 15, scope: !604)
!606 = !DILocalVariable(name: "new_pm", scope: !604, file: !16, line: 235, type: !55)
!607 = !DILocation(line: 235, column: 23, scope: !604)
!608 = !DILocation(line: 237, column: 22, scope: !604)
!609 = !DILocation(line: 237, column: 15, scope: !604)
!610 = !DILocation(line: 237, column: 13, scope: !604)
!611 = !DILocation(line: 239, column: 12, scope: !612)
!612 = distinct !DILexicalBlock(scope: !604, file: !16, line: 239, column: 8)
!613 = !DILocation(line: 239, column: 8, scope: !612)
!614 = !DILocation(line: 239, column: 25, scope: !612)
!615 = !DILocation(line: 239, column: 23, scope: !612)
!616 = !DILocation(line: 239, column: 46, scope: !612)
!617 = !DILocation(line: 239, column: 44, scope: !612)
!618 = !DILocation(line: 239, column: 35, scope: !612)
!619 = !DILocation(line: 240, column: 13, scope: !620)
!620 = distinct !DILexicalBlock(scope: !612, file: !16, line: 240, column: 13)
!621 = !DILocation(line: 240, column: 22, scope: !620)
!622 = !DILocation(line: 240, column: 38, scope: !620)
!623 = !DILocation(line: 240, column: 37, scope: !620)
!624 = !DILocation(line: 240, column: 35, scope: !620)
!625 = !DILocation(line: 240, column: 26, scope: !620)
!626 = !DILocation(line: 242, column: 24, scope: !604)
!627 = !DILocation(line: 242, column: 26, scope: !604)
!628 = !DILocation(line: 242, column: 12, scope: !604)
!629 = !DILocation(line: 242, column: 14, scope: !604)
!630 = !DILocation(line: 242, column: 44, scope: !604)
!631 = !DILocation(line: 242, column: 40, scope: !604)
!632 = !DILocation(line: 242, column: 42, scope: !604)
!633 = !DILocation(line: 243, column: 4, scope: !604)
!634 = !DILocation(line: 245, column: 32, scope: !604)
!635 = !DILocation(line: 245, column: 37, scope: !604)
!636 = !DILocation(line: 245, column: 4, scope: !604)
!637 = !DILocation(line: 246, column: 4, scope: !604)
!638 = !DILocation(line: 246, column: 9, scope: !604)
!639 = !DILocation(line: 246, column: 16, scope: !604)
!640 = !DILocation(line: 247, column: 3, scope: !604)
!641 = !DILocation(line: 248, column: 23, scope: !600)
!642 = !DILocation(line: 249, column: 2, scope: !577)
!643 = !DILocation(line: 252, column: 1, scope: !438)
!644 = distinct !DISubprogram(name: "fixmul", linkageName: "_Z6fixmulii", scope: !9, file: !9, line: 83, type: !645, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !265)
!645 = !DISubroutineType(types: !646)
!646 = !{!8, !8, !8}
!647 = !DILocalVariable(name: "a", arg: 1, scope: !644, file: !9, line: 83, type: !8)
!648 = !DILocation(line: 83, column: 26, scope: !644)
!649 = !DILocalVariable(name: "b", arg: 2, scope: !644, file: !9, line: 83, type: !8)
!650 = !DILocation(line: 83, column: 33, scope: !644)
!651 = !DILocation(line: 85, column: 19, scope: !644)
!652 = !DILocation(line: 85, column: 32, scope: !644)
!653 = !DILocation(line: 85, column: 21, scope: !644)
!654 = !DILocation(line: 85, column: 35, scope: !644)
!655 = !DILocation(line: 85, column: 9, scope: !644)
!656 = !DILocation(line: 85, column: 2, scope: !644)
!657 = distinct !DISubprogram(name: "set_object_turnroll", linkageName: "_Z19set_object_turnrollP6object", scope: !16, file: !16, line: 254, type: !263, scopeLine: 255, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !265)
!658 = !DILocalVariable(name: "obj", arg: 1, scope: !657, file: !16, line: 254, type: !26)
!659 = !DILocation(line: 254, column: 34, scope: !657)
!660 = !DILocalVariable(name: "desired_bank", scope: !657, file: !16, line: 262, type: !87)
!661 = !DILocation(line: 262, column: 9, scope: !657)
!662 = !DILocation(line: 264, column: 25, scope: !657)
!663 = !DILocation(line: 264, column: 30, scope: !657)
!664 = !DILocation(line: 264, column: 46, scope: !657)
!665 = !DILocation(line: 264, column: 53, scope: !657)
!666 = !DILocation(line: 264, column: 18, scope: !657)
!667 = !DILocation(line: 264, column: 17, scope: !657)
!668 = !DILocation(line: 264, column: 15, scope: !657)
!669 = !DILocation(line: 266, column: 6, scope: !670)
!670 = distinct !DILexicalBlock(scope: !657, file: !16, line: 266, column: 6)
!671 = !DILocation(line: 266, column: 11, scope: !670)
!672 = !DILocation(line: 266, column: 27, scope: !670)
!673 = !DILocation(line: 266, column: 39, scope: !670)
!674 = !DILocation(line: 266, column: 36, scope: !670)
!675 = !DILocalVariable(name: "delta_ang", scope: !676, file: !16, line: 267, type: !87)
!676 = distinct !DILexicalBlock(scope: !670, file: !16, line: 266, column: 53)
!677 = !DILocation(line: 267, column: 10, scope: !676)
!678 = !DILocalVariable(name: "max_roll", scope: !676, file: !16, line: 267, type: !87)
!679 = !DILocation(line: 267, column: 20, scope: !676)
!680 = !DILocation(line: 269, column: 31, scope: !676)
!681 = !DILocation(line: 269, column: 14, scope: !676)
!682 = !DILocation(line: 269, column: 12, scope: !676)
!683 = !DILocation(line: 271, column: 15, scope: !676)
!684 = !DILocation(line: 271, column: 30, scope: !676)
!685 = !DILocation(line: 271, column: 35, scope: !676)
!686 = !DILocation(line: 271, column: 51, scope: !676)
!687 = !DILocation(line: 271, column: 28, scope: !676)
!688 = !DILocation(line: 271, column: 13, scope: !676)
!689 = !DILocation(line: 273, column: 12, scope: !690)
!690 = distinct !DILexicalBlock(scope: !676, file: !16, line: 273, column: 7)
!691 = !DILocation(line: 273, column: 7, scope: !690)
!692 = !DILocation(line: 273, column: 25, scope: !690)
!693 = !DILocation(line: 273, column: 23, scope: !690)
!694 = !DILocation(line: 274, column: 15, scope: !690)
!695 = !DILocation(line: 274, column: 13, scope: !690)
!696 = !DILocation(line: 274, column: 4, scope: !690)
!697 = !DILocation(line: 276, column: 8, scope: !698)
!698 = distinct !DILexicalBlock(scope: !690, file: !16, line: 276, column: 8)
!699 = !DILocation(line: 276, column: 18, scope: !698)
!700 = !DILocation(line: 277, column: 17, scope: !698)
!701 = !DILocation(line: 277, column: 16, scope: !698)
!702 = !DILocation(line: 277, column: 14, scope: !698)
!703 = !DILocation(line: 277, column: 5, scope: !698)
!704 = !DILocation(line: 279, column: 36, scope: !676)
!705 = !DILocation(line: 279, column: 3, scope: !676)
!706 = !DILocation(line: 279, column: 8, scope: !676)
!707 = !DILocation(line: 279, column: 24, scope: !676)
!708 = !DILocation(line: 279, column: 33, scope: !676)
!709 = !DILocation(line: 280, column: 2, scope: !676)
!710 = !DILocation(line: 282, column: 1, scope: !657)
!711 = distinct !DISubprogram(name: "do_physics_sim_rot", linkageName: "_Z18do_physics_sim_rotP6object", scope: !16, file: !16, line: 311, type: !263, scopeLine: 312, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !265)
!712 = !DILocalVariable(name: "obj", arg: 1, scope: !711, file: !16, line: 311, type: !26)
!713 = !DILocation(line: 311, column: 33, scope: !711)
!714 = !DILocalVariable(name: "tangles", scope: !711, file: !16, line: 313, type: !157)
!715 = !DILocation(line: 313, column: 13, scope: !711)
!716 = !DILocalVariable(name: "rotmat", scope: !711, file: !16, line: 314, type: !55)
!717 = !DILocation(line: 314, column: 13, scope: !711)
!718 = !DILocalVariable(name: "new_orient", scope: !711, file: !16, line: 314, type: !55)
!719 = !DILocation(line: 314, column: 20, scope: !711)
!720 = !DILocalVariable(name: "pi", scope: !711, file: !16, line: 316, type: !721)
!721 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!722 = !DILocation(line: 316, column: 16, scope: !711)
!723 = !DILocation(line: 318, column: 2, scope: !711)
!724 = !DILocation(line: 320, column: 8, scope: !711)
!725 = !DILocation(line: 320, column: 13, scope: !711)
!726 = !DILocation(line: 320, column: 5, scope: !711)
!727 = !DILocation(line: 356, column: 8, scope: !728)
!728 = distinct !DILexicalBlock(scope: !711, file: !16, line: 356, column: 6)
!729 = !DILocation(line: 356, column: 12, scope: !728)
!730 = !DILocation(line: 356, column: 19, scope: !728)
!731 = !DILocation(line: 356, column: 21, scope: !728)
!732 = !DILocation(line: 356, column: 24, scope: !728)
!733 = !DILocation(line: 356, column: 28, scope: !728)
!734 = !DILocation(line: 356, column: 35, scope: !728)
!735 = !DILocation(line: 356, column: 37, scope: !728)
!736 = !DILocation(line: 356, column: 40, scope: !728)
!737 = !DILocation(line: 356, column: 44, scope: !728)
!738 = !DILocation(line: 356, column: 51, scope: !728)
!739 = !DILocation(line: 356, column: 53, scope: !728)
!740 = !DILocation(line: 356, column: 56, scope: !728)
!741 = !DILocation(line: 356, column: 60, scope: !728)
!742 = !DILocation(line: 356, column: 70, scope: !728)
!743 = !DILocation(line: 356, column: 72, scope: !728)
!744 = !DILocation(line: 356, column: 75, scope: !728)
!745 = !DILocation(line: 356, column: 79, scope: !728)
!746 = !DILocation(line: 356, column: 89, scope: !728)
!747 = !DILocation(line: 356, column: 91, scope: !728)
!748 = !DILocation(line: 356, column: 94, scope: !728)
!749 = !DILocation(line: 356, column: 98, scope: !728)
!750 = !DILocation(line: 356, column: 108, scope: !728)
!751 = !DILocation(line: 356, column: 6, scope: !728)
!752 = !DILocation(line: 357, column: 3, scope: !728)
!753 = !DILocation(line: 359, column: 6, scope: !754)
!754 = distinct !DILexicalBlock(scope: !711, file: !16, line: 359, column: 6)
!755 = !DILocation(line: 359, column: 11, scope: !754)
!756 = !DILocation(line: 359, column: 27, scope: !754)
!757 = !DILocalVariable(name: "count", scope: !758, file: !16, line: 360, type: !12)
!758 = distinct !DILexicalBlock(scope: !754, file: !16, line: 359, column: 33)
!759 = !DILocation(line: 360, column: 7, scope: !758)
!760 = !DILocalVariable(name: "accel", scope: !758, file: !16, line: 361, type: !47)
!761 = !DILocation(line: 361, column: 14, scope: !758)
!762 = !DILocalVariable(name: "drag", scope: !758, file: !16, line: 362, type: !8)
!763 = !DILocation(line: 362, column: 7, scope: !758)
!764 = !DILocalVariable(name: "r", scope: !758, file: !16, line: 362, type: !8)
!765 = !DILocation(line: 362, column: 12, scope: !758)
!766 = !DILocalVariable(name: "k", scope: !758, file: !16, line: 362, type: !8)
!767 = !DILocation(line: 362, column: 14, scope: !758)
!768 = !DILocation(line: 364, column: 11, scope: !758)
!769 = !DILocation(line: 364, column: 21, scope: !758)
!770 = !DILocation(line: 364, column: 9, scope: !758)
!771 = !DILocation(line: 365, column: 7, scope: !758)
!772 = !DILocation(line: 365, column: 17, scope: !758)
!773 = !DILocation(line: 365, column: 5, scope: !758)
!774 = !DILocation(line: 366, column: 14, scope: !758)
!775 = !DILocation(line: 366, column: 7, scope: !758)
!776 = !DILocation(line: 366, column: 5, scope: !758)
!777 = !DILocation(line: 368, column: 11, scope: !758)
!778 = !DILocation(line: 368, column: 16, scope: !758)
!779 = !DILocation(line: 368, column: 32, scope: !758)
!780 = !DILocation(line: 368, column: 36, scope: !758)
!781 = !DILocation(line: 368, column: 39, scope: !758)
!782 = !DILocation(line: 368, column: 8, scope: !758)
!783 = !DILocation(line: 370, column: 7, scope: !784)
!784 = distinct !DILexicalBlock(scope: !758, file: !16, line: 370, column: 7)
!785 = !DILocation(line: 370, column: 12, scope: !784)
!786 = !DILocation(line: 370, column: 28, scope: !784)
!787 = !DILocation(line: 370, column: 34, scope: !784)
!788 = !DILocation(line: 372, column: 30, scope: !789)
!789 = distinct !DILexicalBlock(scope: !784, file: !16, line: 370, column: 52)
!790 = !DILocation(line: 372, column: 35, scope: !789)
!791 = !DILocation(line: 372, column: 51, scope: !789)
!792 = !DILocation(line: 372, column: 73, scope: !789)
!793 = !DILocation(line: 372, column: 78, scope: !789)
!794 = !DILocation(line: 372, column: 94, scope: !789)
!795 = !DILocation(line: 372, column: 61, scope: !789)
!796 = !DILocation(line: 372, column: 4, scope: !789)
!797 = !DILocation(line: 374, column: 4, scope: !789)
!798 = !DILocation(line: 374, column: 16, scope: !789)
!799 = !DILocation(line: 374, column: 11, scope: !789)
!800 = !DILocation(line: 376, column: 18, scope: !801)
!801 = distinct !DILexicalBlock(scope: !789, file: !16, line: 374, column: 20)
!802 = !DILocation(line: 376, column: 23, scope: !801)
!803 = !DILocation(line: 376, column: 39, scope: !801)
!804 = !DILocation(line: 376, column: 5, scope: !801)
!805 = !DILocation(line: 378, column: 19, scope: !801)
!806 = !DILocation(line: 378, column: 24, scope: !801)
!807 = !DILocation(line: 378, column: 40, scope: !801)
!808 = !DILocation(line: 378, column: 52, scope: !801)
!809 = !DILocation(line: 378, column: 51, scope: !801)
!810 = !DILocation(line: 378, column: 5, scope: !801)
!811 = distinct !{!811, !797, !812, !482}
!812 = !DILocation(line: 379, column: 4, scope: !789)
!813 = !DILocation(line: 383, column: 23, scope: !789)
!814 = !DILocation(line: 383, column: 28, scope: !789)
!815 = !DILocation(line: 383, column: 44, scope: !789)
!816 = !DILocation(line: 383, column: 58, scope: !789)
!817 = !DILocation(line: 383, column: 4, scope: !789)
!818 = !DILocation(line: 384, column: 18, scope: !789)
!819 = !DILocation(line: 384, column: 23, scope: !789)
!820 = !DILocation(line: 384, column: 39, scope: !789)
!821 = !DILocation(line: 384, column: 58, scope: !789)
!822 = !DILocation(line: 384, column: 60, scope: !789)
!823 = !DILocation(line: 384, column: 51, scope: !789)
!824 = !DILocation(line: 384, column: 50, scope: !789)
!825 = !DILocation(line: 384, column: 4, scope: !789)
!826 = !DILocation(line: 385, column: 3, scope: !789)
!827 = !DILocation(line: 386, column: 15, scope: !828)
!828 = distinct !DILexicalBlock(scope: !784, file: !16, line: 386, column: 12)
!829 = !DILocation(line: 386, column: 20, scope: !828)
!830 = !DILocation(line: 386, column: 36, scope: !828)
!831 = !DILocation(line: 386, column: 42, scope: !828)
!832 = !DILocation(line: 386, column: 14, scope: !828)
!833 = !DILocation(line: 386, column: 12, scope: !828)
!834 = !DILocalVariable(name: "total_drag", scope: !835, file: !16, line: 387, type: !8)
!835 = distinct !DILexicalBlock(scope: !828, file: !16, line: 386, column: 63)
!836 = !DILocation(line: 387, column: 8, scope: !835)
!837 = !DILocation(line: 389, column: 4, scope: !835)
!838 = !DILocation(line: 389, column: 16, scope: !835)
!839 = !DILocation(line: 389, column: 11, scope: !835)
!840 = !DILocation(line: 390, column: 25, scope: !835)
!841 = !DILocation(line: 390, column: 41, scope: !835)
!842 = !DILocation(line: 390, column: 40, scope: !835)
!843 = !DILocation(line: 390, column: 18, scope: !835)
!844 = !DILocation(line: 390, column: 16, scope: !835)
!845 = distinct !{!845, !837, !846, !482}
!846 = !DILocation(line: 390, column: 45, scope: !835)
!847 = !DILocation(line: 394, column: 24, scope: !835)
!848 = !DILocation(line: 394, column: 47, scope: !835)
!849 = !DILocation(line: 394, column: 49, scope: !835)
!850 = !DILocation(line: 394, column: 40, scope: !835)
!851 = !DILocation(line: 394, column: 39, scope: !835)
!852 = !DILocation(line: 394, column: 17, scope: !835)
!853 = !DILocation(line: 394, column: 15, scope: !835)
!854 = !DILocation(line: 396, column: 18, scope: !835)
!855 = !DILocation(line: 396, column: 23, scope: !835)
!856 = !DILocation(line: 396, column: 39, scope: !835)
!857 = !DILocation(line: 396, column: 46, scope: !835)
!858 = !DILocation(line: 396, column: 4, scope: !835)
!859 = !DILocation(line: 397, column: 3, scope: !835)
!860 = !DILocation(line: 399, column: 2, scope: !758)
!861 = !DILocation(line: 406, column: 6, scope: !862)
!862 = distinct !DILexicalBlock(scope: !711, file: !16, line: 406, column: 6)
!863 = !DILocation(line: 406, column: 11, scope: !862)
!864 = !DILocation(line: 406, column: 27, scope: !862)
!865 = !DILocalVariable(name: "new_pm", scope: !866, file: !16, line: 407, type: !55)
!866 = distinct !DILexicalBlock(scope: !862, file: !16, line: 406, column: 37)
!867 = !DILocation(line: 407, column: 14, scope: !866)
!868 = !DILocation(line: 409, column: 23, scope: !866)
!869 = !DILocation(line: 409, column: 25, scope: !866)
!870 = !DILocation(line: 409, column: 11, scope: !866)
!871 = !DILocation(line: 409, column: 13, scope: !866)
!872 = !DILocation(line: 410, column: 16, scope: !866)
!873 = !DILocation(line: 410, column: 21, scope: !866)
!874 = !DILocation(line: 410, column: 37, scope: !866)
!875 = !DILocation(line: 410, column: 15, scope: !866)
!876 = !DILocation(line: 410, column: 11, scope: !866)
!877 = !DILocation(line: 410, column: 13, scope: !866)
!878 = !DILocation(line: 411, column: 3, scope: !866)
!879 = !DILocation(line: 412, column: 31, scope: !866)
!880 = !DILocation(line: 412, column: 36, scope: !866)
!881 = !DILocation(line: 412, column: 3, scope: !866)
!882 = !DILocation(line: 413, column: 3, scope: !866)
!883 = !DILocation(line: 413, column: 8, scope: !866)
!884 = !DILocation(line: 413, column: 15, scope: !866)
!885 = !DILocation(line: 414, column: 2, scope: !866)
!886 = !DILocation(line: 416, column: 21, scope: !711)
!887 = !DILocation(line: 416, column: 26, scope: !711)
!888 = !DILocation(line: 416, column: 42, scope: !711)
!889 = !DILocation(line: 416, column: 49, scope: !711)
!890 = !DILocation(line: 416, column: 51, scope: !711)
!891 = !DILocation(line: 416, column: 14, scope: !711)
!892 = !DILocation(line: 416, column: 10, scope: !711)
!893 = !DILocation(line: 416, column: 12, scope: !711)
!894 = !DILocation(line: 417, column: 21, scope: !711)
!895 = !DILocation(line: 417, column: 26, scope: !711)
!896 = !DILocation(line: 417, column: 42, scope: !711)
!897 = !DILocation(line: 417, column: 49, scope: !711)
!898 = !DILocation(line: 417, column: 51, scope: !711)
!899 = !DILocation(line: 417, column: 14, scope: !711)
!900 = !DILocation(line: 417, column: 10, scope: !711)
!901 = !DILocation(line: 417, column: 12, scope: !711)
!902 = !DILocation(line: 418, column: 22, scope: !711)
!903 = !DILocation(line: 418, column: 27, scope: !711)
!904 = !DILocation(line: 418, column: 43, scope: !711)
!905 = !DILocation(line: 418, column: 50, scope: !711)
!906 = !DILocation(line: 418, column: 52, scope: !711)
!907 = !DILocation(line: 418, column: 15, scope: !711)
!908 = !DILocation(line: 418, column: 10, scope: !711)
!909 = !DILocation(line: 418, column: 13, scope: !711)
!910 = !DILocation(line: 420, column: 2, scope: !711)
!911 = !DILocation(line: 421, column: 34, scope: !711)
!912 = !DILocation(line: 421, column: 39, scope: !711)
!913 = !DILocation(line: 421, column: 2, scope: !711)
!914 = !DILocation(line: 422, column: 2, scope: !711)
!915 = !DILocation(line: 422, column: 7, scope: !711)
!916 = !DILocation(line: 422, column: 14, scope: !711)
!917 = !DILocation(line: 424, column: 6, scope: !918)
!918 = distinct !DILexicalBlock(scope: !711, file: !16, line: 424, column: 6)
!919 = !DILocation(line: 424, column: 11, scope: !918)
!920 = !DILocation(line: 424, column: 27, scope: !918)
!921 = !DILocation(line: 424, column: 33, scope: !918)
!922 = !DILocation(line: 425, column: 23, scope: !918)
!923 = !DILocation(line: 425, column: 3, scope: !918)
!924 = !DILocation(line: 428, column: 6, scope: !925)
!925 = distinct !DILexicalBlock(scope: !711, file: !16, line: 428, column: 6)
!926 = !DILocation(line: 428, column: 11, scope: !925)
!927 = !DILocation(line: 428, column: 27, scope: !925)
!928 = !DILocalVariable(name: "new_pm", scope: !929, file: !16, line: 429, type: !55)
!929 = distinct !DILexicalBlock(scope: !925, file: !16, line: 428, column: 37)
!930 = !DILocation(line: 429, column: 14, scope: !929)
!931 = !DILocation(line: 431, column: 23, scope: !929)
!932 = !DILocation(line: 431, column: 25, scope: !929)
!933 = !DILocation(line: 431, column: 11, scope: !929)
!934 = !DILocation(line: 431, column: 13, scope: !929)
!935 = !DILocation(line: 432, column: 15, scope: !929)
!936 = !DILocation(line: 432, column: 20, scope: !929)
!937 = !DILocation(line: 432, column: 36, scope: !929)
!938 = !DILocation(line: 432, column: 11, scope: !929)
!939 = !DILocation(line: 432, column: 13, scope: !929)
!940 = !DILocation(line: 433, column: 3, scope: !929)
!941 = !DILocation(line: 434, column: 31, scope: !929)
!942 = !DILocation(line: 434, column: 36, scope: !929)
!943 = !DILocation(line: 434, column: 3, scope: !929)
!944 = !DILocation(line: 435, column: 3, scope: !929)
!945 = !DILocation(line: 435, column: 8, scope: !929)
!946 = !DILocation(line: 435, column: 15, scope: !929)
!947 = !DILocation(line: 436, column: 2, scope: !929)
!948 = !DILocation(line: 438, column: 24, scope: !711)
!949 = !DILocation(line: 438, column: 29, scope: !711)
!950 = !DILocation(line: 438, column: 2, scope: !711)
!951 = !DILocation(line: 439, column: 1, scope: !711)
!952 = distinct !DISubprogram(name: "fixdiv", linkageName: "_Z6fixdivii", scope: !9, file: !9, line: 89, type: !645, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !265)
!953 = !DILocalVariable(name: "a", arg: 1, scope: !952, file: !9, line: 89, type: !8)
!954 = !DILocation(line: 89, column: 26, scope: !952)
!955 = !DILocalVariable(name: "b", arg: 2, scope: !952, file: !9, line: 89, type: !8)
!956 = !DILocation(line: 89, column: 33, scope: !952)
!957 = !DILocation(line: 92, column: 6, scope: !958)
!958 = distinct !DILexicalBlock(scope: !952, file: !9, line: 92, column: 6)
!959 = !DILocation(line: 92, column: 8, scope: !958)
!960 = !DILocation(line: 92, column: 14, scope: !958)
!961 = !DILocation(line: 94, column: 25, scope: !952)
!962 = !DILocation(line: 94, column: 27, scope: !952)
!963 = !DILocation(line: 94, column: 36, scope: !952)
!964 = !DILocation(line: 94, column: 34, scope: !952)
!965 = !DILocation(line: 94, column: 14, scope: !952)
!966 = !DILocation(line: 94, column: 2, scope: !952)
!967 = !DILocation(line: 95, column: 1, scope: !952)
!968 = !DILocalVariable(name: "obj", arg: 1, scope: !262, file: !16, line: 443, type: !26)
!969 = !DILocation(line: 443, column: 29, scope: !262)
!970 = !DILocalVariable(name: "ignore_obj_list", scope: !971, file: !16, line: 949, type: !19)
!971 = distinct !DILexicalBlock(scope: !262, file: !16, line: 948, column: 2)
!972 = !DILocation(line: 949, column: 6, scope: !971)
!973 = !DILocalVariable(name: "n_ignore_objs", scope: !971, file: !16, line: 949, type: !12)
!974 = !DILocation(line: 949, column: 39, scope: !971)
!975 = !DILocalVariable(name: "iseg", scope: !971, file: !16, line: 950, type: !12)
!976 = !DILocation(line: 950, column: 6, scope: !971)
!977 = !DILocalVariable(name: "try_again", scope: !971, file: !16, line: 951, type: !12)
!978 = !DILocation(line: 951, column: 6, scope: !971)
!979 = !DILocalVariable(name: "fate", scope: !971, file: !16, line: 952, type: !12)
!980 = !DILocation(line: 952, column: 6, scope: !971)
!981 = !DILocalVariable(name: "frame_vec", scope: !971, file: !16, line: 953, type: !47)
!982 = !DILocation(line: 953, column: 13, scope: !971)
!983 = !DILocalVariable(name: "new_pos", scope: !971, file: !16, line: 954, type: !47)
!984 = !DILocation(line: 954, column: 13, scope: !971)
!985 = !DILocalVariable(name: "ipos", scope: !971, file: !16, line: 954, type: !47)
!986 = !DILocation(line: 954, column: 21, scope: !971)
!987 = !DILocalVariable(name: "count", scope: !971, file: !16, line: 955, type: !12)
!988 = !DILocation(line: 955, column: 6, scope: !971)
!989 = !DILocalVariable(name: "objnum", scope: !971, file: !16, line: 956, type: !12)
!990 = !DILocation(line: 956, column: 6, scope: !971)
!991 = !DILocalVariable(name: "WallHitSeg", scope: !971, file: !16, line: 957, type: !12)
!992 = !DILocation(line: 957, column: 6, scope: !971)
!993 = !DILocalVariable(name: "WallHitSide", scope: !971, file: !16, line: 957, type: !12)
!994 = !DILocation(line: 957, column: 18, scope: !971)
!995 = !DILocalVariable(name: "hit_info", scope: !971, file: !16, line: 958, type: !996)
!996 = !DIDerivedType(tag: DW_TAG_typedef, name: "fvi_info", file: !997, line: 40, baseType: !998)
!997 = !DIFile(filename: "main_d2/fvi.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "d2a92d1b0ff4ebfc1a57eff3c7d6fa46")
!998 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fvi_info", file: !997, line: 29, size: 3584, flags: DIFlagTypePassByValue, elements: !999, identifier: "_ZTS8fvi_info")
!999 = !{!1000, !1001, !1002, !1003, !1004, !1005, !1006, !1007, !1008}
!1000 = !DIDerivedType(tag: DW_TAG_member, name: "hit_type", scope: !998, file: !997, line: 31, baseType: !12, size: 32)
!1001 = !DIDerivedType(tag: DW_TAG_member, name: "hit_pnt", scope: !998, file: !997, line: 32, baseType: !47, size: 96, offset: 32)
!1002 = !DIDerivedType(tag: DW_TAG_member, name: "hit_seg", scope: !998, file: !997, line: 33, baseType: !12, size: 32, offset: 128)
!1003 = !DIDerivedType(tag: DW_TAG_member, name: "hit_side", scope: !998, file: !997, line: 34, baseType: !12, size: 32, offset: 160)
!1004 = !DIDerivedType(tag: DW_TAG_member, name: "hit_side_seg", scope: !998, file: !997, line: 35, baseType: !12, size: 32, offset: 192)
!1005 = !DIDerivedType(tag: DW_TAG_member, name: "hit_object", scope: !998, file: !997, line: 36, baseType: !12, size: 32, offset: 224)
!1006 = !DIDerivedType(tag: DW_TAG_member, name: "hit_wallnorm", scope: !998, file: !997, line: 37, baseType: !47, size: 96, offset: 256)
!1007 = !DIDerivedType(tag: DW_TAG_member, name: "n_segs", scope: !998, file: !997, line: 38, baseType: !12, size: 32, offset: 352)
!1008 = !DIDerivedType(tag: DW_TAG_member, name: "seglist", scope: !998, file: !997, line: 39, baseType: !19, size: 3200, offset: 384)
!1009 = !DILocation(line: 958, column: 11, scope: !971)
!1010 = !DILocalVariable(name: "fq", scope: !971, file: !16, line: 959, type: !1011)
!1011 = !DIDerivedType(tag: DW_TAG_typedef, name: "fvi_query", file: !997, line: 58, baseType: !1012)
!1012 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fvi_query", file: !997, line: 50, size: 384, flags: DIFlagTypePassByValue, elements: !1013, identifier: "_ZTS9fvi_query")
!1013 = !{!1014, !1016, !1017, !1018, !1019, !1020, !1022}
!1014 = !DIDerivedType(tag: DW_TAG_member, name: "p0", scope: !1012, file: !997, line: 52, baseType: !1015, size: 64)
!1015 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!1016 = !DIDerivedType(tag: DW_TAG_member, name: "p1", scope: !1012, file: !997, line: 52, baseType: !1015, size: 64, offset: 64)
!1017 = !DIDerivedType(tag: DW_TAG_member, name: "startseg", scope: !1012, file: !997, line: 53, baseType: !12, size: 32, offset: 128)
!1018 = !DIDerivedType(tag: DW_TAG_member, name: "rad", scope: !1012, file: !997, line: 54, baseType: !8, size: 32, offset: 160)
!1019 = !DIDerivedType(tag: DW_TAG_member, name: "thisobjnum", scope: !1012, file: !997, line: 55, baseType: !38, size: 16, offset: 192)
!1020 = !DIDerivedType(tag: DW_TAG_member, name: "ignore_obj_list", scope: !1012, file: !997, line: 56, baseType: !1021, size: 64, offset: 256)
!1021 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!1022 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !1012, file: !997, line: 57, baseType: !12, size: 32, offset: 320)
!1023 = !DILocation(line: 959, column: 12, scope: !971)
!1024 = !DILocalVariable(name: "save_pos", scope: !971, file: !16, line: 960, type: !47)
!1025 = !DILocation(line: 960, column: 13, scope: !971)
!1026 = !DILocalVariable(name: "save_seg", scope: !971, file: !16, line: 961, type: !12)
!1027 = !DILocation(line: 961, column: 6, scope: !971)
!1028 = !DILocalVariable(name: "drag", scope: !971, file: !16, line: 962, type: !8)
!1029 = !DILocation(line: 962, column: 6, scope: !971)
!1030 = !DILocalVariable(name: "sim_time", scope: !971, file: !16, line: 963, type: !8)
!1031 = !DILocation(line: 963, column: 6, scope: !971)
!1032 = !DILocalVariable(name: "old_sim_time", scope: !971, file: !16, line: 963, type: !8)
!1033 = !DILocation(line: 963, column: 15, scope: !971)
!1034 = !DILocalVariable(name: "start_pos", scope: !971, file: !16, line: 964, type: !47)
!1035 = !DILocation(line: 964, column: 13, scope: !971)
!1036 = !DILocalVariable(name: "obj_stopped", scope: !971, file: !16, line: 965, type: !12)
!1037 = !DILocation(line: 965, column: 6, scope: !971)
!1038 = !DILocalVariable(name: "moved_time", scope: !971, file: !16, line: 966, type: !8)
!1039 = !DILocation(line: 966, column: 6, scope: !971)
!1040 = !DILocalVariable(name: "save_p0", scope: !971, file: !16, line: 967, type: !47)
!1041 = !DILocation(line: 967, column: 13, scope: !971)
!1042 = !DILocalVariable(name: "save_p1", scope: !971, file: !16, line: 967, type: !47)
!1043 = !DILocation(line: 967, column: 21, scope: !971)
!1044 = !DILocalVariable(name: "pi", scope: !971, file: !16, line: 968, type: !721)
!1045 = !DILocation(line: 968, column: 16, scope: !971)
!1046 = !DILocalVariable(name: "orig_segnum", scope: !971, file: !16, line: 969, type: !12)
!1047 = !DILocation(line: 969, column: 6, scope: !971)
!1048 = !DILocation(line: 969, column: 20, scope: !971)
!1049 = !DILocation(line: 969, column: 25, scope: !971)
!1050 = !DILocalVariable(name: "bounced", scope: !971, file: !16, line: 970, type: !12)
!1051 = !DILocation(line: 970, column: 6, scope: !971)
!1052 = !DILocation(line: 972, column: 2, scope: !971)
!1053 = !DILocation(line: 973, column: 2, scope: !971)
!1054 = !DILocation(line: 976, column: 5, scope: !1055)
!1055 = distinct !DILexicalBlock(scope: !971, file: !16, line: 976, column: 5)
!1056 = !DILocation(line: 977, column: 6, scope: !1057)
!1057 = distinct !DILexicalBlock(scope: !1055, file: !16, line: 977, column: 6)
!1058 = !DILocation(line: 977, column: 11, scope: !1057)
!1059 = !DILocation(line: 977, column: 24, scope: !1057)
!1060 = !DILocation(line: 978, column: 3, scope: !1057)
!1061 = !DILocation(line: 977, column: 27, scope: !1057)
!1062 = !DILocation(line: 981, column: 8, scope: !971)
!1063 = !DILocation(line: 981, column: 13, scope: !971)
!1064 = !DILocation(line: 981, column: 5, scope: !971)
!1065 = !DILocation(line: 983, column: 21, scope: !971)
!1066 = !DILocation(line: 983, column: 2, scope: !971)
!1067 = !DILocation(line: 985, column: 8, scope: !1068)
!1068 = distinct !DILexicalBlock(scope: !971, file: !16, line: 985, column: 6)
!1069 = !DILocation(line: 985, column: 12, scope: !1068)
!1070 = !DILocation(line: 985, column: 21, scope: !1068)
!1071 = !DILocation(line: 985, column: 23, scope: !1068)
!1072 = !DILocation(line: 985, column: 26, scope: !1068)
!1073 = !DILocation(line: 985, column: 30, scope: !1068)
!1074 = !DILocation(line: 985, column: 39, scope: !1068)
!1075 = !DILocation(line: 985, column: 41, scope: !1068)
!1076 = !DILocation(line: 985, column: 44, scope: !1068)
!1077 = !DILocation(line: 985, column: 48, scope: !1068)
!1078 = !DILocation(line: 985, column: 57, scope: !1068)
!1079 = !DILocation(line: 985, column: 59, scope: !1068)
!1080 = !DILocation(line: 985, column: 62, scope: !1068)
!1081 = !DILocation(line: 985, column: 66, scope: !1068)
!1082 = !DILocation(line: 985, column: 73, scope: !1068)
!1083 = !DILocation(line: 985, column: 75, scope: !1068)
!1084 = !DILocation(line: 985, column: 78, scope: !1068)
!1085 = !DILocation(line: 985, column: 82, scope: !1068)
!1086 = !DILocation(line: 985, column: 89, scope: !1068)
!1087 = !DILocation(line: 985, column: 91, scope: !1068)
!1088 = !DILocation(line: 985, column: 94, scope: !1068)
!1089 = !DILocation(line: 985, column: 98, scope: !1068)
!1090 = !DILocation(line: 985, column: 105, scope: !1068)
!1091 = !DILocation(line: 985, column: 6, scope: !1068)
!1092 = !DILocation(line: 986, column: 3, scope: !1068)
!1093 = !DILocation(line: 988, column: 11, scope: !971)
!1094 = !DILocation(line: 988, column: 14, scope: !971)
!1095 = !DILocation(line: 988, column: 9, scope: !971)
!1096 = !DILocation(line: 990, column: 14, scope: !971)
!1097 = !DILocation(line: 992, column: 27, scope: !971)
!1098 = !DILocation(line: 992, column: 32, scope: !971)
!1099 = !DILocation(line: 992, column: 37, scope: !971)
!1100 = !DILocation(line: 992, column: 26, scope: !971)
!1101 = !DILocation(line: 992, column: 24, scope: !971)
!1102 = !DILocation(line: 994, column: 13, scope: !971)
!1103 = !DILocation(line: 994, column: 11, scope: !971)
!1104 = !DILocation(line: 999, column: 6, scope: !1105)
!1105 = distinct !DILexicalBlock(scope: !971, file: !16, line: 999, column: 6)
!1106 = !DILocation(line: 999, column: 13, scope: !1105)
!1107 = !DILocation(line: 999, column: 10, scope: !1105)
!1108 = !DILocation(line: 1000, column: 49, scope: !1109)
!1109 = distinct !DILexicalBlock(scope: !1105, file: !16, line: 999, column: 24)
!1110 = !DILocation(line: 1000, column: 56, scope: !1109)
!1111 = !DILocation(line: 1000, column: 3, scope: !1109)
!1112 = !DILocation(line: 1001, column: 34, scope: !1109)
!1113 = !DILocation(line: 1001, column: 3, scope: !1109)
!1114 = !DILocation(line: 1002, column: 30, scope: !1109)
!1115 = !DILocation(line: 1002, column: 3, scope: !1109)
!1116 = !DILocation(line: 1003, column: 2, scope: !1109)
!1117 = !DILocation(line: 1006, column: 21, scope: !1118)
!1118 = distinct !DILexicalBlock(scope: !971, file: !16, line: 1006, column: 5)
!1119 = !DILocation(line: 1006, column: 26, scope: !1118)
!1120 = !DILocation(line: 1006, column: 30, scope: !1118)
!1121 = !DILocation(line: 1006, column: 35, scope: !1118)
!1122 = !DILocation(line: 1006, column: 6, scope: !1118)
!1123 = !DILocation(line: 1006, column: 45, scope: !1118)
!1124 = !DILocation(line: 1006, column: 5, scope: !1118)
!1125 = !DILocation(line: 1006, column: 55, scope: !1118)
!1126 = !DILocation(line: 1008, column: 3, scope: !1127)
!1127 = distinct !DILexicalBlock(scope: !1118, file: !16, line: 1006, column: 60)
!1128 = !DILocation(line: 1011, column: 26, scope: !1129)
!1129 = distinct !DILexicalBlock(scope: !1127, file: !16, line: 1011, column: 7)
!1130 = !DILocation(line: 1011, column: 8, scope: !1129)
!1131 = !DILocation(line: 1011, column: 7, scope: !1129)
!1132 = !DILocation(line: 1013, column: 4, scope: !1133)
!1133 = distinct !DILexicalBlock(scope: !1129, file: !16, line: 1011, column: 32)
!1134 = !DILocation(line: 1015, column: 10, scope: !1135)
!1135 = distinct !DILexicalBlock(scope: !1133, file: !16, line: 1015, column: 8)
!1136 = !DILocation(line: 1015, column: 20, scope: !1135)
!1137 = !DILocation(line: 1015, column: 9, scope: !1135)
!1138 = !DILocation(line: 1015, column: 8, scope: !1135)
!1139 = !DILocation(line: 1016, column: 5, scope: !1135)
!1140 = !DILocation(line: 1017, column: 28, scope: !1133)
!1141 = !DILocation(line: 1017, column: 33, scope: !1133)
!1142 = !DILocation(line: 1017, column: 47, scope: !1133)
!1143 = !DILocation(line: 1017, column: 52, scope: !1133)
!1144 = !DILocation(line: 1017, column: 38, scope: !1133)
!1145 = !DILocation(line: 1017, column: 4, scope: !1133)
!1146 = !DILocation(line: 1018, column: 18, scope: !1133)
!1147 = !DILocation(line: 1018, column: 4, scope: !1133)
!1148 = !DILocation(line: 1018, column: 9, scope: !1133)
!1149 = !DILocation(line: 1018, column: 13, scope: !1133)
!1150 = !DILocation(line: 1018, column: 15, scope: !1133)
!1151 = !DILocation(line: 1019, column: 3, scope: !1133)
!1152 = !DILocation(line: 1020, column: 2, scope: !1127)
!1153 = !DILocation(line: 1023, column: 14, scope: !971)
!1154 = !DILocation(line: 1023, column: 19, scope: !971)
!1155 = !DILocation(line: 1023, column: 12, scope: !971)
!1156 = !DILocation(line: 1025, column: 16, scope: !971)
!1157 = !DILocation(line: 1027, column: 2, scope: !971)
!1158 = !DILocation(line: 1030, column: 2, scope: !971)
!1159 = !DILocation(line: 1036, column: 14, scope: !1160)
!1160 = distinct !DILexicalBlock(scope: !971, file: !16, line: 1036, column: 6)
!1161 = !DILocation(line: 1036, column: 19, scope: !1160)
!1162 = !DILocation(line: 1036, column: 35, scope: !1160)
!1163 = !DILocation(line: 1036, column: 12, scope: !1160)
!1164 = !DILocation(line: 1036, column: 41, scope: !1160)
!1165 = !DILocalVariable(name: "count", scope: !1166, file: !16, line: 1037, type: !12)
!1166 = distinct !DILexicalBlock(scope: !1160, file: !16, line: 1036, column: 47)
!1167 = !DILocation(line: 1037, column: 7, scope: !1166)
!1168 = !DILocalVariable(name: "accel", scope: !1166, file: !16, line: 1038, type: !47)
!1169 = !DILocation(line: 1038, column: 14, scope: !1166)
!1170 = !DILocalVariable(name: "r", scope: !1166, file: !16, line: 1039, type: !8)
!1171 = !DILocation(line: 1039, column: 7, scope: !1166)
!1172 = !DILocalVariable(name: "k", scope: !1166, file: !16, line: 1039, type: !8)
!1173 = !DILocation(line: 1039, column: 9, scope: !1166)
!1174 = !DILocation(line: 1041, column: 11, scope: !1166)
!1175 = !DILocation(line: 1041, column: 20, scope: !1166)
!1176 = !DILocation(line: 1041, column: 9, scope: !1166)
!1177 = !DILocation(line: 1042, column: 7, scope: !1166)
!1178 = !DILocation(line: 1042, column: 16, scope: !1166)
!1179 = !DILocation(line: 1042, column: 5, scope: !1166)
!1180 = !DILocation(line: 1043, column: 14, scope: !1166)
!1181 = !DILocation(line: 1043, column: 7, scope: !1166)
!1182 = !DILocation(line: 1043, column: 5, scope: !1166)
!1183 = !DILocation(line: 1045, column: 7, scope: !1184)
!1184 = distinct !DILexicalBlock(scope: !1166, file: !16, line: 1045, column: 7)
!1185 = !DILocation(line: 1045, column: 12, scope: !1184)
!1186 = !DILocation(line: 1045, column: 28, scope: !1184)
!1187 = !DILocation(line: 1045, column: 34, scope: !1184)
!1188 = !DILocation(line: 1047, column: 30, scope: !1189)
!1189 = distinct !DILexicalBlock(scope: !1184, file: !16, line: 1045, column: 52)
!1190 = !DILocation(line: 1047, column: 35, scope: !1189)
!1191 = !DILocation(line: 1047, column: 51, scope: !1189)
!1192 = !DILocation(line: 1047, column: 70, scope: !1189)
!1193 = !DILocation(line: 1047, column: 75, scope: !1189)
!1194 = !DILocation(line: 1047, column: 91, scope: !1189)
!1195 = !DILocation(line: 1047, column: 58, scope: !1189)
!1196 = !DILocation(line: 1047, column: 4, scope: !1189)
!1197 = !DILocation(line: 1049, column: 4, scope: !1189)
!1198 = !DILocation(line: 1049, column: 16, scope: !1189)
!1199 = !DILocation(line: 1049, column: 11, scope: !1189)
!1200 = !DILocation(line: 1051, column: 18, scope: !1201)
!1201 = distinct !DILexicalBlock(scope: !1189, file: !16, line: 1049, column: 20)
!1202 = !DILocation(line: 1051, column: 23, scope: !1201)
!1203 = !DILocation(line: 1051, column: 39, scope: !1201)
!1204 = !DILocation(line: 1051, column: 5, scope: !1201)
!1205 = !DILocation(line: 1053, column: 19, scope: !1201)
!1206 = !DILocation(line: 1053, column: 24, scope: !1201)
!1207 = !DILocation(line: 1053, column: 40, scope: !1201)
!1208 = !DILocation(line: 1053, column: 54, scope: !1201)
!1209 = !DILocation(line: 1053, column: 53, scope: !1201)
!1210 = !DILocation(line: 1053, column: 5, scope: !1201)
!1211 = distinct !{!1211, !1197, !1212, !482}
!1212 = !DILocation(line: 1054, column: 4, scope: !1189)
!1213 = !DILocation(line: 1058, column: 23, scope: !1189)
!1214 = !DILocation(line: 1058, column: 28, scope: !1189)
!1215 = !DILocation(line: 1058, column: 44, scope: !1189)
!1216 = !DILocation(line: 1058, column: 60, scope: !1189)
!1217 = !DILocation(line: 1058, column: 4, scope: !1189)
!1218 = !DILocation(line: 1060, column: 18, scope: !1189)
!1219 = !DILocation(line: 1060, column: 23, scope: !1189)
!1220 = !DILocation(line: 1060, column: 39, scope: !1189)
!1221 = !DILocation(line: 1060, column: 60, scope: !1189)
!1222 = !DILocation(line: 1060, column: 62, scope: !1189)
!1223 = !DILocation(line: 1060, column: 53, scope: !1189)
!1224 = !DILocation(line: 1060, column: 52, scope: !1189)
!1225 = !DILocation(line: 1060, column: 4, scope: !1189)
!1226 = !DILocation(line: 1061, column: 3, scope: !1189)
!1227 = !DILocalVariable(name: "total_drag", scope: !1228, file: !16, line: 1063, type: !8)
!1228 = distinct !DILexicalBlock(scope: !1184, file: !16, line: 1062, column: 8)
!1229 = !DILocation(line: 1063, column: 8, scope: !1228)
!1230 = !DILocation(line: 1065, column: 4, scope: !1228)
!1231 = !DILocation(line: 1065, column: 16, scope: !1228)
!1232 = !DILocation(line: 1065, column: 11, scope: !1228)
!1233 = !DILocation(line: 1066, column: 25, scope: !1228)
!1234 = !DILocation(line: 1066, column: 41, scope: !1228)
!1235 = !DILocation(line: 1066, column: 40, scope: !1228)
!1236 = !DILocation(line: 1066, column: 18, scope: !1228)
!1237 = !DILocation(line: 1066, column: 16, scope: !1228)
!1238 = distinct !{!1238, !1230, !1239, !482}
!1239 = !DILocation(line: 1066, column: 45, scope: !1228)
!1240 = !DILocation(line: 1070, column: 24, scope: !1228)
!1241 = !DILocation(line: 1070, column: 47, scope: !1228)
!1242 = !DILocation(line: 1070, column: 49, scope: !1228)
!1243 = !DILocation(line: 1070, column: 40, scope: !1228)
!1244 = !DILocation(line: 1070, column: 39, scope: !1228)
!1245 = !DILocation(line: 1070, column: 17, scope: !1228)
!1246 = !DILocation(line: 1070, column: 15, scope: !1228)
!1247 = !DILocation(line: 1072, column: 18, scope: !1228)
!1248 = !DILocation(line: 1072, column: 23, scope: !1228)
!1249 = !DILocation(line: 1072, column: 39, scope: !1228)
!1250 = !DILocation(line: 1072, column: 48, scope: !1228)
!1251 = !DILocation(line: 1072, column: 4, scope: !1228)
!1252 = !DILocation(line: 1074, column: 2, scope: !1166)
!1253 = !DILocation(line: 1077, column: 6, scope: !1254)
!1254 = distinct !DILexicalBlock(scope: !971, file: !16, line: 1077, column: 6)
!1255 = !DILocation(line: 1077, column: 13, scope: !1254)
!1256 = !DILocation(line: 1077, column: 10, scope: !1254)
!1257 = !DILocation(line: 1078, column: 36, scope: !1254)
!1258 = !DILocation(line: 1078, column: 3, scope: !1254)
!1259 = !DILocation(line: 1081, column: 2, scope: !971)
!1260 = !DILocation(line: 1082, column: 13, scope: !1261)
!1261 = distinct !DILexicalBlock(scope: !971, file: !16, line: 1081, column: 5)
!1262 = !DILocation(line: 1085, column: 34, scope: !1261)
!1263 = !DILocation(line: 1085, column: 39, scope: !1261)
!1264 = !DILocation(line: 1085, column: 55, scope: !1261)
!1265 = !DILocation(line: 1085, column: 65, scope: !1261)
!1266 = !DILocation(line: 1085, column: 3, scope: !1261)
!1267 = !DILocation(line: 1088, column: 7, scope: !1268)
!1268 = distinct !DILexicalBlock(scope: !1261, file: !16, line: 1088, column: 7)
!1269 = !DILocation(line: 1088, column: 14, scope: !1268)
!1270 = !DILocation(line: 1088, column: 11, scope: !1268)
!1271 = !DILocation(line: 1089, column: 47, scope: !1268)
!1272 = !DILocation(line: 1089, column: 53, scope: !1268)
!1273 = !DILocation(line: 1089, column: 4, scope: !1268)
!1274 = !DILocation(line: 1092, column: 19, scope: !1275)
!1275 = distinct !DILexicalBlock(scope: !1261, file: !16, line: 1092, column: 8)
!1276 = !DILocation(line: 1092, column: 20, scope: !1275)
!1277 = !DILocation(line: 1092, column: 25, scope: !1275)
!1278 = !DILocation(line: 1092, column: 39, scope: !1275)
!1279 = !DILocation(line: 1092, column: 40, scope: !1275)
!1280 = !DILocation(line: 1092, column: 45, scope: !1275)
!1281 = !DILocation(line: 1092, column: 59, scope: !1275)
!1282 = !DILocation(line: 1092, column: 60, scope: !1275)
!1283 = !DILocation(line: 1093, column: 4, scope: !1275)
!1284 = !DILocation(line: 1095, column: 8, scope: !1261)
!1285 = !DILocation(line: 1098, column: 8, scope: !1286)
!1286 = distinct !DILexicalBlock(scope: !1261, file: !16, line: 1098, column: 8)
!1287 = !DILocation(line: 1098, column: 14, scope: !1286)
!1288 = !DILocation(line: 1099, column: 8, scope: !1289)
!1289 = distinct !DILexicalBlock(scope: !1290, file: !16, line: 1099, column: 8)
!1290 = distinct !DILexicalBlock(scope: !1286, file: !16, line: 1098, column: 20)
!1291 = !DILocation(line: 1099, column: 13, scope: !1289)
!1292 = !DILocation(line: 1099, column: 18, scope: !1289)
!1293 = !DILocation(line: 1100, column: 9, scope: !1294)
!1294 = distinct !DILexicalBlock(scope: !1295, file: !16, line: 1100, column: 9)
!1295 = distinct !DILexicalBlock(scope: !1289, file: !16, line: 1099, column: 33)
!1296 = !DILocation(line: 1100, column: 15, scope: !1294)
!1297 = !DILocation(line: 1101, column: 6, scope: !1294)
!1298 = !DILocation(line: 1102, column: 4, scope: !1295)
!1299 = !DILocation(line: 1103, column: 5, scope: !1289)
!1300 = !DILocation(line: 1104, column: 3, scope: !1290)
!1301 = !DILocation(line: 1106, column: 24, scope: !1261)
!1302 = !DILocation(line: 1106, column: 29, scope: !1261)
!1303 = !DILocation(line: 1106, column: 3, scope: !1261)
!1304 = !DILocation(line: 1109, column: 7, scope: !1305)
!1305 = distinct !DILexicalBlock(scope: !1261, file: !16, line: 1109, column: 7)
!1306 = !DILocation(line: 1109, column: 14, scope: !1305)
!1307 = !DILocation(line: 1109, column: 11, scope: !1305)
!1308 = !DILocation(line: 1110, column: 42, scope: !1305)
!1309 = !DILocation(line: 1110, column: 4, scope: !1305)
!1310 = !DILocation(line: 1113, column: 19, scope: !1261)
!1311 = !DILocation(line: 1113, column: 3, scope: !1261)
!1312 = !DILocation(line: 1113, column: 34, scope: !1261)
!1313 = !DILocation(line: 1116, column: 7, scope: !1314)
!1314 = distinct !DILexicalBlock(scope: !1261, file: !16, line: 1116, column: 7)
!1315 = !DILocation(line: 1116, column: 14, scope: !1314)
!1316 = !DILocation(line: 1116, column: 11, scope: !1314)
!1317 = !DILocation(line: 1117, column: 66, scope: !1318)
!1318 = distinct !DILexicalBlock(scope: !1314, file: !16, line: 1116, column: 25)
!1319 = !DILocation(line: 1117, column: 81, scope: !1318)
!1320 = !DILocation(line: 1117, column: 86, scope: !1318)
!1321 = !DILocation(line: 1117, column: 93, scope: !1318)
!1322 = !DILocation(line: 1117, column: 98, scope: !1318)
!1323 = !DILocation(line: 1117, column: 4, scope: !1318)
!1324 = !DILocation(line: 1118, column: 46, scope: !1318)
!1325 = !DILocation(line: 1118, column: 4, scope: !1318)
!1326 = !DILocation(line: 1119, column: 3, scope: !1318)
!1327 = !DILocation(line: 1122, column: 17, scope: !1261)
!1328 = !DILocation(line: 1122, column: 22, scope: !1261)
!1329 = !DILocation(line: 1122, column: 6, scope: !1261)
!1330 = !DILocation(line: 1122, column: 14, scope: !1261)
!1331 = !DILocation(line: 1123, column: 20, scope: !1261)
!1332 = !DILocation(line: 1123, column: 25, scope: !1261)
!1333 = !DILocation(line: 1123, column: 6, scope: !1261)
!1334 = !DILocation(line: 1123, column: 18, scope: !1261)
!1335 = !DILocation(line: 1124, column: 6, scope: !1261)
!1336 = !DILocation(line: 1124, column: 14, scope: !1261)
!1337 = !DILocation(line: 1125, column: 16, scope: !1261)
!1338 = !DILocation(line: 1125, column: 21, scope: !1261)
!1339 = !DILocation(line: 1125, column: 6, scope: !1261)
!1340 = !DILocation(line: 1125, column: 14, scope: !1261)
!1341 = !DILocation(line: 1126, column: 21, scope: !1261)
!1342 = !DILocation(line: 1126, column: 6, scope: !1261)
!1343 = !DILocation(line: 1126, column: 19, scope: !1261)
!1344 = !DILocation(line: 1127, column: 24, scope: !1261)
!1345 = !DILocation(line: 1127, column: 6, scope: !1261)
!1346 = !DILocation(line: 1127, column: 22, scope: !1261)
!1347 = !DILocation(line: 1128, column: 6, scope: !1261)
!1348 = !DILocation(line: 1128, column: 16, scope: !1261)
!1349 = !DILocation(line: 1130, column: 7, scope: !1350)
!1350 = distinct !DILexicalBlock(scope: !1261, file: !16, line: 1130, column: 7)
!1351 = !DILocation(line: 1130, column: 12, scope: !1350)
!1352 = !DILocation(line: 1130, column: 17, scope: !1350)
!1353 = !DILocation(line: 1131, column: 7, scope: !1350)
!1354 = !DILocation(line: 1131, column: 13, scope: !1350)
!1355 = !DILocation(line: 1131, column: 4, scope: !1350)
!1356 = !DILocation(line: 1133, column: 7, scope: !1357)
!1357 = distinct !DILexicalBlock(scope: !1261, file: !16, line: 1133, column: 7)
!1358 = !DILocation(line: 1133, column: 12, scope: !1357)
!1359 = !DILocation(line: 1133, column: 17, scope: !1357)
!1360 = !DILocation(line: 1134, column: 7, scope: !1357)
!1361 = !DILocation(line: 1134, column: 13, scope: !1357)
!1362 = !DILocation(line: 1134, column: 4, scope: !1357)
!1363 = !DILocation(line: 1139, column: 15, scope: !1261)
!1364 = !DILocation(line: 1139, column: 9, scope: !1261)
!1365 = !DILocation(line: 1140, column: 15, scope: !1261)
!1366 = !DILocation(line: 1140, column: 9, scope: !1261)
!1367 = !DILocation(line: 1143, column: 10, scope: !1261)
!1368 = !DILocation(line: 1143, column: 8, scope: !1261)
!1369 = !DILocation(line: 1144, column: 7, scope: !1370)
!1370 = distinct !DILexicalBlock(scope: !1261, file: !16, line: 1144, column: 7)
!1371 = !DILocation(line: 1144, column: 14, scope: !1370)
!1372 = !DILocation(line: 1146, column: 8, scope: !1373)
!1373 = distinct !DILexicalBlock(scope: !1374, file: !16, line: 1146, column: 8)
!1374 = distinct !DILexicalBlock(scope: !1370, file: !16, line: 1144, column: 21)
!1375 = !DILocation(line: 1146, column: 21, scope: !1373)
!1376 = !DILocation(line: 1147, column: 13, scope: !1377)
!1377 = distinct !DILexicalBlock(scope: !1373, file: !16, line: 1146, column: 28)
!1378 = !DILocation(line: 1148, column: 6, scope: !1377)
!1379 = !DILocation(line: 1148, column: 23, scope: !1377)
!1380 = !DILocation(line: 1148, column: 27, scope: !1377)
!1381 = !DILocation(line: 1148, column: 33, scope: !1377)
!1382 = !DILocation(line: 1148, column: 37, scope: !1377)
!1383 = !DILocation(line: 1148, column: 43, scope: !1377)
!1384 = !DILocation(line: 1148, column: 47, scope: !1377)
!1385 = !DILocation(line: 1148, column: 53, scope: !1377)
!1386 = !DILocation(line: 1148, column: 57, scope: !1377)
!1387 = !DILocation(line: 1148, column: 63, scope: !1377)
!1388 = !DILocation(line: 1148, column: 67, scope: !1377)
!1389 = !DILocation(line: 1148, column: 73, scope: !1377)
!1390 = !DILocation(line: 1148, column: 77, scope: !1377)
!1391 = !DILocation(line: 1148, column: 83, scope: !1377)
!1392 = !DILocation(line: 1148, column: 96, scope: !1377)
!1393 = !DILocation(line: 1149, column: 6, scope: !1377)
!1394 = !DILocation(line: 1149, column: 21, scope: !1377)
!1395 = !DILocation(line: 1149, column: 29, scope: !1377)
!1396 = !DILocation(line: 1149, column: 41, scope: !1377)
!1397 = !DILocation(line: 1149, column: 49, scope: !1377)
!1398 = !DILocation(line: 1149, column: 61, scope: !1377)
!1399 = !DILocation(line: 1149, column: 69, scope: !1377)
!1400 = !DILocation(line: 1149, column: 81, scope: !1377)
!1401 = !DILocation(line: 1150, column: 15, scope: !1377)
!1402 = !DILocation(line: 1150, column: 28, scope: !1377)
!1403 = !DILocation(line: 1150, column: 40, scope: !1377)
!1404 = !DILocation(line: 1150, column: 53, scope: !1377)
!1405 = !DILocation(line: 1150, column: 65, scope: !1377)
!1406 = !DILocation(line: 1150, column: 78, scope: !1377)
!1407 = !DILocation(line: 1147, column: 5, scope: !1377)
!1408 = !DILocation(line: 1151, column: 4, scope: !1377)
!1409 = !DILocation(line: 1152, column: 16, scope: !1374)
!1410 = !DILocation(line: 1153, column: 3, scope: !1374)
!1411 = !DILocation(line: 1155, column: 7, scope: !1412)
!1412 = distinct !DILexicalBlock(scope: !1261, file: !16, line: 1155, column: 7)
!1413 = !DILocation(line: 1155, column: 12, scope: !1412)
!1414 = !DILocalVariable(name: "objp", scope: !1415, file: !16, line: 1156, type: !26)
!1415 = distinct !DILexicalBlock(scope: !1412, file: !16, line: 1155, column: 27)
!1416 = !DILocation(line: 1156, column: 12, scope: !1415)
!1417 = !DILocation(line: 1156, column: 37, scope: !1415)
!1418 = !DILocation(line: 1156, column: 20, scope: !1415)
!1419 = !DILocation(line: 1158, column: 9, scope: !1420)
!1420 = distinct !DILexicalBlock(scope: !1415, file: !16, line: 1158, column: 8)
!1421 = !DILocation(line: 1158, column: 15, scope: !1420)
!1422 = !DILocation(line: 1158, column: 20, scope: !1420)
!1423 = !DILocation(line: 1158, column: 35, scope: !1420)
!1424 = !DILocation(line: 1158, column: 40, scope: !1420)
!1425 = !DILocation(line: 1158, column: 46, scope: !1420)
!1426 = !DILocation(line: 1158, column: 49, scope: !1420)
!1427 = !DILocation(line: 1158, column: 66, scope: !1420)
!1428 = !DILocation(line: 1158, column: 70, scope: !1420)
!1429 = !DILocation(line: 1158, column: 76, scope: !1420)
!1430 = !DILocation(line: 1158, column: 79, scope: !1420)
!1431 = !DILocation(line: 1159, column: 10, scope: !1420)
!1432 = !DILocation(line: 1159, column: 5, scope: !1420)
!1433 = !DILocation(line: 1160, column: 3, scope: !1415)
!1434 = !DILocation(line: 1163, column: 7, scope: !1435)
!1435 = distinct !DILexicalBlock(scope: !1261, file: !16, line: 1163, column: 7)
!1436 = !DILocation(line: 1163, column: 12, scope: !1435)
!1437 = !DILocation(line: 1164, column: 4, scope: !1438)
!1438 = distinct !DILexicalBlock(scope: !1435, file: !16, line: 1163, column: 27)
!1439 = !DILocation(line: 1165, column: 4, scope: !1438)
!1440 = !DILocation(line: 1166, column: 3, scope: !1438)
!1441 = !DILocation(line: 1169, column: 7, scope: !1442)
!1442 = distinct !DILexicalBlock(scope: !1261, file: !16, line: 1169, column: 7)
!1443 = !DILocation(line: 1169, column: 12, scope: !1442)
!1444 = !DILocation(line: 1169, column: 17, scope: !1442)
!1445 = !DILocalVariable(name: "i", scope: !1446, file: !16, line: 1170, type: !12)
!1446 = distinct !DILexicalBlock(scope: !1442, file: !16, line: 1169, column: 32)
!1447 = !DILocation(line: 1170, column: 8, scope: !1446)
!1448 = !DILocation(line: 1172, column: 8, scope: !1449)
!1449 = distinct !DILexicalBlock(scope: !1446, file: !16, line: 1172, column: 8)
!1450 = !DILocation(line: 1172, column: 20, scope: !1449)
!1451 = !DILocation(line: 1172, column: 36, scope: !1449)
!1452 = !DILocation(line: 1172, column: 47, scope: !1449)
!1453 = !DILocation(line: 1172, column: 23, scope: !1449)
!1454 = !DILocation(line: 1172, column: 61, scope: !1449)
!1455 = !DILocation(line: 1172, column: 52, scope: !1449)
!1456 = !DILocation(line: 1172, column: 50, scope: !1449)
!1457 = !DILocation(line: 1173, column: 16, scope: !1449)
!1458 = !DILocation(line: 1173, column: 5, scope: !1449)
!1459 = !DILocation(line: 1175, column: 10, scope: !1460)
!1460 = distinct !DILexicalBlock(scope: !1446, file: !16, line: 1175, column: 4)
!1461 = !DILocation(line: 1175, column: 9, scope: !1460)
!1462 = !DILocation(line: 1175, column: 14, scope: !1463)
!1463 = distinct !DILexicalBlock(scope: !1460, file: !16, line: 1175, column: 4)
!1464 = !DILocation(line: 1175, column: 25, scope: !1463)
!1465 = !DILocation(line: 1175, column: 15, scope: !1463)
!1466 = !DILocation(line: 1175, column: 33, scope: !1463)
!1467 = !DILocation(line: 1175, column: 37, scope: !1463)
!1468 = !DILocation(line: 1175, column: 48, scope: !1463)
!1469 = !DILocation(line: 0, scope: !1463)
!1470 = !DILocation(line: 1175, column: 4, scope: !1460)
!1471 = !DILocation(line: 1176, column: 44, scope: !1463)
!1472 = !DILocation(line: 1176, column: 53, scope: !1463)
!1473 = !DILocation(line: 1176, column: 35, scope: !1463)
!1474 = !DILocation(line: 1176, column: 29, scope: !1463)
!1475 = !DILocation(line: 1176, column: 5, scope: !1463)
!1476 = !DILocation(line: 1176, column: 33, scope: !1463)
!1477 = !DILocation(line: 1175, column: 4, scope: !1463)
!1478 = distinct !{!1478, !1470, !1479, !482}
!1479 = !DILocation(line: 1176, column: 55, scope: !1460)
!1480 = !DILocation(line: 1177, column: 3, scope: !1446)
!1481 = !DILocation(line: 1180, column: 7, scope: !1482)
!1482 = distinct !DILexicalBlock(scope: !1261, file: !16, line: 1180, column: 7)
!1483 = !DILocation(line: 1180, column: 14, scope: !1482)
!1484 = !DILocation(line: 1180, column: 11, scope: !1482)
!1485 = !DILocation(line: 1181, column: 52, scope: !1482)
!1486 = !DILocation(line: 1181, column: 57, scope: !1482)
!1487 = !DILocation(line: 1181, column: 4, scope: !1482)
!1488 = !DILocation(line: 1184, column: 19, scope: !1261)
!1489 = !DILocation(line: 1184, column: 8, scope: !1261)
!1490 = !DILocation(line: 1185, column: 19, scope: !1261)
!1491 = !DILocation(line: 1185, column: 8, scope: !1261)
!1492 = !DILocation(line: 1186, column: 26, scope: !1261)
!1493 = !DILocation(line: 1186, column: 15, scope: !1261)
!1494 = !DILocation(line: 1187, column: 25, scope: !1261)
!1495 = !DILocation(line: 1187, column: 14, scope: !1261)
!1496 = !DILocation(line: 1189, column: 7, scope: !1497)
!1497 = distinct !DILexicalBlock(scope: !1261, file: !16, line: 1189, column: 7)
!1498 = !DILocation(line: 1189, column: 11, scope: !1497)
!1499 = !DILocation(line: 1191, column: 4, scope: !1500)
!1500 = distinct !DILexicalBlock(scope: !1497, file: !16, line: 1189, column: 17)
!1501 = !DILocation(line: 1198, column: 8, scope: !1502)
!1502 = distinct !DILexicalBlock(scope: !1500, file: !16, line: 1198, column: 8)
!1503 = !DILocation(line: 1198, column: 13, scope: !1502)
!1504 = !DILocation(line: 1198, column: 18, scope: !1502)
!1505 = !DILocation(line: 1199, column: 5, scope: !1502)
!1506 = !DILocation(line: 1199, column: 10, scope: !1502)
!1507 = !DILocation(line: 1199, column: 16, scope: !1502)
!1508 = !DILocation(line: 1200, column: 4, scope: !1500)
!1509 = !DILocation(line: 1203, column: 3, scope: !1261)
!1510 = !DILocation(line: 0, scope: !1261)
!1511 = !DILocation(line: 1208, column: 14, scope: !1261)
!1512 = !DILocation(line: 1208, column: 19, scope: !1261)
!1513 = !DILocation(line: 1208, column: 12, scope: !1261)
!1514 = !DILocation(line: 1209, column: 14, scope: !1261)
!1515 = !DILocation(line: 1209, column: 19, scope: !1261)
!1516 = !DILocation(line: 1209, column: 12, scope: !1261)
!1517 = !DILocation(line: 1212, column: 3, scope: !1261)
!1518 = !DILocation(line: 1212, column: 8, scope: !1261)
!1519 = !DILocation(line: 1212, column: 12, scope: !1261)
!1520 = !DILocation(line: 1215, column: 7, scope: !1521)
!1521 = distinct !DILexicalBlock(scope: !1261, file: !16, line: 1215, column: 7)
!1522 = !DILocation(line: 1215, column: 14, scope: !1521)
!1523 = !DILocation(line: 1215, column: 11, scope: !1521)
!1524 = !DILocation(line: 1216, column: 37, scope: !1521)
!1525 = !DILocation(line: 1216, column: 4, scope: !1521)
!1526 = !DILocation(line: 1219, column: 8, scope: !1527)
!1527 = distinct !DILexicalBlock(scope: !1261, file: !16, line: 1219, column: 8)
!1528 = !DILocation(line: 1219, column: 16, scope: !1527)
!1529 = !DILocation(line: 1219, column: 21, scope: !1527)
!1530 = !DILocation(line: 1219, column: 13, scope: !1527)
!1531 = !DILocation(line: 1220, column: 15, scope: !1527)
!1532 = !DILocation(line: 1220, column: 23, scope: !1527)
!1533 = !DILocation(line: 1220, column: 4, scope: !1527)
!1534 = !DILocation(line: 1223, column: 22, scope: !1535)
!1535 = distinct !DILexicalBlock(scope: !1261, file: !16, line: 1223, column: 7)
!1536 = !DILocation(line: 1223, column: 27, scope: !1535)
!1537 = !DILocation(line: 1223, column: 31, scope: !1535)
!1538 = !DILocation(line: 1223, column: 36, scope: !1535)
!1539 = !DILocation(line: 1223, column: 7, scope: !1535)
!1540 = !DILocation(line: 1223, column: 46, scope: !1535)
!1541 = !DILocation(line: 1223, column: 56, scope: !1535)
!1542 = !DILocalVariable(name: "n", scope: !1543, file: !16, line: 1224, type: !12)
!1543 = distinct !DILexicalBlock(scope: !1535, file: !16, line: 1223, column: 61)
!1544 = !DILocation(line: 1224, column: 8, scope: !1543)
!1545 = !DILocation(line: 1226, column: 27, scope: !1546)
!1546 = distinct !DILexicalBlock(scope: !1543, file: !16, line: 1226, column: 8)
!1547 = !DILocation(line: 1226, column: 11, scope: !1546)
!1548 = !DILocation(line: 1226, column: 10, scope: !1546)
!1549 = !DILocation(line: 1226, column: 32, scope: !1546)
!1550 = !DILocation(line: 1228, column: 9, scope: !1551)
!1551 = distinct !DILexicalBlock(scope: !1552, file: !16, line: 1228, column: 9)
!1552 = distinct !DILexicalBlock(scope: !1546, file: !16, line: 1226, column: 38)
!1553 = !DILocation(line: 1228, column: 14, scope: !1551)
!1554 = !DILocation(line: 1228, column: 18, scope: !1551)
!1555 = !DILocation(line: 1228, column: 31, scope: !1551)
!1556 = !DILocation(line: 1228, column: 53, scope: !1551)
!1557 = !DILocation(line: 1228, column: 58, scope: !1551)
!1558 = !DILocation(line: 1228, column: 67, scope: !1551)
!1559 = !DILocation(line: 1228, column: 72, scope: !1551)
!1560 = !DILocation(line: 1228, column: 37, scope: !1551)
!1561 = !DILocation(line: 1228, column: 36, scope: !1551)
!1562 = !DILocation(line: 1228, column: 80, scope: !1551)
!1563 = !DILocation(line: 1229, column: 17, scope: !1564)
!1564 = distinct !DILexicalBlock(scope: !1551, file: !16, line: 1228, column: 86)
!1565 = !DILocation(line: 1229, column: 22, scope: !1564)
!1566 = !DILocation(line: 1229, column: 6, scope: !1564)
!1567 = !DILocation(line: 1229, column: 11, scope: !1564)
!1568 = !DILocation(line: 1229, column: 15, scope: !1564)
!1569 = !DILocation(line: 1230, column: 17, scope: !1564)
!1570 = !DILocation(line: 1230, column: 25, scope: !1564)
!1571 = !DILocation(line: 1230, column: 6, scope: !1564)
!1572 = !DILocation(line: 1231, column: 5, scope: !1564)
!1573 = !DILocation(line: 1233, column: 30, scope: !1574)
!1574 = distinct !DILexicalBlock(scope: !1551, file: !16, line: 1232, column: 10)
!1575 = !DILocation(line: 1233, column: 35, scope: !1574)
!1576 = !DILocation(line: 1233, column: 49, scope: !1574)
!1577 = !DILocation(line: 1233, column: 54, scope: !1574)
!1578 = !DILocation(line: 1233, column: 40, scope: !1574)
!1579 = !DILocation(line: 1233, column: 6, scope: !1574)
!1580 = !DILocation(line: 1234, column: 20, scope: !1574)
!1581 = !DILocation(line: 1234, column: 6, scope: !1574)
!1582 = !DILocation(line: 1234, column: 11, scope: !1574)
!1583 = !DILocation(line: 1234, column: 15, scope: !1574)
!1584 = !DILocation(line: 1234, column: 17, scope: !1574)
!1585 = !DILocation(line: 1236, column: 9, scope: !1586)
!1586 = distinct !DILexicalBlock(scope: !1552, file: !16, line: 1236, column: 9)
!1587 = !DILocation(line: 1236, column: 14, scope: !1586)
!1588 = !DILocation(line: 1236, column: 19, scope: !1586)
!1589 = !DILocation(line: 1237, column: 6, scope: !1586)
!1590 = !DILocation(line: 1237, column: 11, scope: !1586)
!1591 = !DILocation(line: 1237, column: 17, scope: !1586)
!1592 = !DILocation(line: 1238, column: 4, scope: !1552)
!1593 = !DILocation(line: 1239, column: 4, scope: !1543)
!1594 = !DILocalVariable(name: "moved_vec_n", scope: !1595, file: !16, line: 1245, type: !47)
!1595 = distinct !DILexicalBlock(scope: !1261, file: !16, line: 1243, column: 3)
!1596 = !DILocation(line: 1245, column: 15, scope: !1595)
!1597 = !DILocalVariable(name: "attempted_dist", scope: !1595, file: !16, line: 1246, type: !8)
!1598 = !DILocation(line: 1246, column: 8, scope: !1595)
!1599 = !DILocalVariable(name: "actual_dist", scope: !1595, file: !16, line: 1246, type: !8)
!1600 = !DILocation(line: 1246, column: 23, scope: !1595)
!1601 = !DILocation(line: 1248, column: 19, scope: !1595)
!1602 = !DILocation(line: 1248, column: 17, scope: !1595)
!1603 = !DILocation(line: 1250, column: 54, scope: !1595)
!1604 = !DILocation(line: 1250, column: 59, scope: !1595)
!1605 = !DILocation(line: 1250, column: 18, scope: !1595)
!1606 = !DILocation(line: 1250, column: 16, scope: !1595)
!1607 = !DILocation(line: 1252, column: 8, scope: !1608)
!1608 = distinct !DILexicalBlock(scope: !1595, file: !16, line: 1252, column: 8)
!1609 = !DILocation(line: 1252, column: 12, scope: !1608)
!1610 = !DILocation(line: 1252, column: 23, scope: !1608)
!1611 = !DILocation(line: 1252, column: 26, scope: !1608)
!1612 = !DILocation(line: 1252, column: 62, scope: !1608)
!1613 = !DILocation(line: 1259, column: 9, scope: !1614)
!1614 = distinct !DILexicalBlock(scope: !1615, file: !16, line: 1259, column: 9)
!1615 = distinct !DILexicalBlock(scope: !1608, file: !16, line: 1252, column: 67)
!1616 = !DILocation(line: 1259, column: 16, scope: !1614)
!1617 = !DILocation(line: 1259, column: 13, scope: !1614)
!1618 = !DILocation(line: 1260, column: 6, scope: !1614)
!1619 = !DILocation(line: 1263, column: 5, scope: !1615)
!1620 = !DILocation(line: 1263, column: 10, scope: !1615)
!1621 = !DILocation(line: 1263, column: 14, scope: !1615)
!1622 = !DILocation(line: 1267, column: 16, scope: !1615)
!1623 = !DILocation(line: 1267, column: 24, scope: !1615)
!1624 = !DILocation(line: 1267, column: 5, scope: !1615)
!1625 = !DILocation(line: 1269, column: 16, scope: !1615)
!1626 = !DILocation(line: 1270, column: 4, scope: !1615)
!1627 = !DILocation(line: 1276, column: 22, scope: !1628)
!1628 = distinct !DILexicalBlock(scope: !1608, file: !16, line: 1271, column: 9)
!1629 = !DILocation(line: 1276, column: 20, scope: !1628)
!1630 = !DILocation(line: 1278, column: 26, scope: !1628)
!1631 = !DILocation(line: 1278, column: 35, scope: !1628)
!1632 = !DILocation(line: 1278, column: 50, scope: !1628)
!1633 = !DILocation(line: 1278, column: 49, scope: !1628)
!1634 = !DILocation(line: 1278, column: 62, scope: !1628)
!1635 = !DILocation(line: 1278, column: 16, scope: !1628)
!1636 = !DILocation(line: 1278, column: 14, scope: !1628)
!1637 = !DILocation(line: 1280, column: 18, scope: !1628)
!1638 = !DILocation(line: 1280, column: 33, scope: !1628)
!1639 = !DILocation(line: 1280, column: 31, scope: !1628)
!1640 = !DILocation(line: 1280, column: 16, scope: !1628)
!1641 = !DILocation(line: 1282, column: 9, scope: !1642)
!1642 = distinct !DILexicalBlock(scope: !1628, file: !16, line: 1282, column: 9)
!1643 = !DILocation(line: 1282, column: 18, scope: !1642)
!1644 = !DILocation(line: 1282, column: 22, scope: !1642)
!1645 = !DILocation(line: 1282, column: 25, scope: !1642)
!1646 = !DILocation(line: 1282, column: 34, scope: !1642)
!1647 = !DILocation(line: 1282, column: 33, scope: !1642)
!1648 = !DILocation(line: 1284, column: 6, scope: !1649)
!1649 = distinct !DILexicalBlock(scope: !1642, file: !16, line: 1282, column: 48)
!1650 = !DILocation(line: 1285, column: 10, scope: !1651)
!1651 = distinct !DILexicalBlock(scope: !1649, file: !16, line: 1285, column: 10)
!1652 = !DILocation(line: 1285, column: 17, scope: !1651)
!1653 = !DILocation(line: 1285, column: 14, scope: !1651)
!1654 = !DILocation(line: 1286, column: 90, scope: !1651)
!1655 = !DILocation(line: 1286, column: 99, scope: !1651)
!1656 = !DILocation(line: 1286, column: 112, scope: !1651)
!1657 = !DILocation(line: 1286, column: 127, scope: !1651)
!1658 = !DILocation(line: 1286, column: 7, scope: !1651)
!1659 = !DILocation(line: 1289, column: 17, scope: !1649)
!1660 = !DILocation(line: 1289, column: 15, scope: !1649)
!1661 = !DILocation(line: 1292, column: 17, scope: !1649)
!1662 = !DILocation(line: 1293, column: 5, scope: !1649)
!1663 = !DILocation(line: 1297, column: 8, scope: !1664)
!1664 = distinct !DILexicalBlock(scope: !1595, file: !16, line: 1297, column: 8)
!1665 = !DILocation(line: 1297, column: 15, scope: !1664)
!1666 = !DILocation(line: 1297, column: 12, scope: !1664)
!1667 = !DILocation(line: 1298, column: 37, scope: !1664)
!1668 = !DILocation(line: 1298, column: 5, scope: !1664)
!1669 = !DILocation(line: 1304, column: 11, scope: !1261)
!1670 = !DILocation(line: 1304, column: 3, scope: !1261)
!1671 = !DILocalVariable(name: "moved_v", scope: !1672, file: !16, line: 1307, type: !47)
!1672 = distinct !DILexicalBlock(scope: !1673, file: !16, line: 1306, column: 20)
!1673 = distinct !DILexicalBlock(scope: !1261, file: !16, line: 1304, column: 19)
!1674 = !DILocation(line: 1307, column: 16, scope: !1672)
!1675 = !DILocalVariable(name: "hit_speed", scope: !1672, file: !16, line: 1309, type: !8)
!1676 = !DILocation(line: 1309, column: 9, scope: !1672)
!1677 = !DILocalVariable(name: "wall_part", scope: !1672, file: !16, line: 1309, type: !8)
!1678 = !DILocation(line: 1309, column: 19, scope: !1672)
!1679 = !DILocation(line: 1313, column: 26, scope: !1672)
!1680 = !DILocation(line: 1313, column: 31, scope: !1672)
!1681 = !DILocation(line: 1313, column: 5, scope: !1672)
!1682 = !DILocation(line: 1315, column: 17, scope: !1672)
!1683 = !DILocation(line: 1315, column: 15, scope: !1672)
!1684 = !DILocation(line: 1317, column: 9, scope: !1685)
!1685 = distinct !DILexicalBlock(scope: !1672, file: !16, line: 1317, column: 9)
!1686 = !DILocation(line: 1317, column: 19, scope: !1685)
!1687 = !DILocation(line: 1317, column: 24, scope: !1685)
!1688 = !DILocation(line: 1317, column: 27, scope: !1685)
!1689 = !DILocation(line: 1317, column: 37, scope: !1685)
!1690 = !DILocation(line: 1317, column: 40, scope: !1685)
!1691 = !DILocation(line: 1317, column: 62, scope: !1685)
!1692 = !DILocation(line: 1317, column: 72, scope: !1685)
!1693 = !DILocation(line: 1317, column: 55, scope: !1685)
!1694 = !DILocation(line: 1317, column: 54, scope: !1685)
!1695 = !DILocation(line: 1317, column: 53, scope: !1685)
!1696 = !DILocation(line: 1317, column: 84, scope: !1685)
!1697 = !DILocation(line: 1318, column: 32, scope: !1698)
!1698 = distinct !DILexicalBlock(scope: !1685, file: !16, line: 1317, column: 88)
!1699 = !DILocation(line: 1318, column: 37, scope: !1698)
!1700 = !DILocation(line: 1318, column: 48, scope: !1698)
!1701 = !DILocation(line: 1318, column: 60, scope: !1698)
!1702 = !DILocation(line: 1318, column: 83, scope: !1698)
!1703 = !DILocation(line: 1318, column: 6, scope: !1698)
!1704 = !DILocation(line: 1319, column: 5, scope: !1698)
!1705 = !DILocation(line: 1320, column: 28, scope: !1685)
!1706 = !DILocation(line: 1320, column: 33, scope: !1685)
!1707 = !DILocation(line: 1320, column: 45, scope: !1685)
!1708 = !DILocation(line: 1320, column: 68, scope: !1685)
!1709 = !DILocation(line: 1320, column: 6, scope: !1685)
!1710 = !DILocation(line: 1322, column: 5, scope: !1672)
!1711 = !DILocation(line: 1323, column: 5, scope: !1672)
!1712 = !DILocation(line: 1325, column: 12, scope: !1713)
!1713 = distinct !DILexicalBlock(scope: !1672, file: !16, line: 1325, column: 10)
!1714 = !DILocation(line: 1325, column: 17, scope: !1713)
!1715 = !DILocation(line: 1325, column: 22, scope: !1713)
!1716 = !DILocation(line: 1325, column: 11, scope: !1713)
!1717 = !DILocation(line: 1325, column: 10, scope: !1713)
!1718 = !DILocalVariable(name: "forcefield_bounce", scope: !1719, file: !16, line: 1326, type: !12)
!1719 = distinct !DILexicalBlock(scope: !1713, file: !16, line: 1325, column: 44)
!1720 = !DILocation(line: 1326, column: 10, scope: !1719)
!1721 = !DILocation(line: 1328, column: 6, scope: !1719)
!1722 = !DILocation(line: 0, scope: !1719)
!1723 = !DILocation(line: 1330, column: 45, scope: !1719)
!1724 = !DILocation(line: 1330, column: 36, scope: !1719)
!1725 = !DILocation(line: 1330, column: 57, scope: !1719)
!1726 = !DILocation(line: 1330, column: 63, scope: !1719)
!1727 = !DILocation(line: 1330, column: 76, scope: !1719)
!1728 = !DILocation(line: 1330, column: 27, scope: !1719)
!1729 = !DILocation(line: 1330, column: 86, scope: !1719)
!1730 = !DILocation(line: 1330, column: 92, scope: !1719)
!1731 = !DILocation(line: 1330, column: 24, scope: !1719)
!1732 = !DILocation(line: 1332, column: 11, scope: !1733)
!1733 = distinct !DILexicalBlock(scope: !1719, file: !16, line: 1332, column: 10)
!1734 = !DILocation(line: 1332, column: 29, scope: !1733)
!1735 = !DILocation(line: 1332, column: 33, scope: !1733)
!1736 = !DILocation(line: 1332, column: 38, scope: !1733)
!1737 = !DILocation(line: 1332, column: 54, scope: !1733)
!1738 = !DILocation(line: 1332, column: 60, scope: !1733)
!1739 = !DILocation(line: 1332, column: 32, scope: !1733)
!1740 = !DILocation(line: 1335, column: 24, scope: !1741)
!1741 = distinct !DILexicalBlock(scope: !1733, file: !16, line: 1332, column: 73)
!1742 = !DILocation(line: 1335, column: 29, scope: !1741)
!1743 = !DILocation(line: 1335, column: 41, scope: !1741)
!1744 = !DILocation(line: 1335, column: 7, scope: !1741)
!1745 = !DILocation(line: 1337, column: 7, scope: !1741)
!1746 = !DILocation(line: 1338, column: 19, scope: !1741)
!1747 = !DILocation(line: 1339, column: 17, scope: !1741)
!1748 = !DILocation(line: 1340, column: 6, scope: !1741)
!1749 = !DILocalVariable(name: "check_vel", scope: !1750, file: !16, line: 1342, type: !12)
!1750 = distinct !DILexicalBlock(scope: !1733, file: !16, line: 1341, column: 11)
!1751 = !DILocation(line: 1342, column: 11, scope: !1750)
!1752 = !DILocation(line: 1347, column: 19, scope: !1750)
!1753 = !DILocation(line: 1347, column: 17, scope: !1750)
!1754 = !DILocation(line: 1351, column: 11, scope: !1755)
!1755 = distinct !DILexicalBlock(scope: !1750, file: !16, line: 1351, column: 11)
!1756 = !DILocation(line: 1351, column: 29, scope: !1755)
!1757 = !DILocation(line: 1351, column: 33, scope: !1755)
!1758 = !DILocation(line: 1351, column: 38, scope: !1755)
!1759 = !DILocation(line: 1351, column: 54, scope: !1755)
!1760 = !DILocation(line: 1351, column: 60, scope: !1755)
!1761 = !DILocation(line: 1351, column: 32, scope: !1755)
!1762 = !DILocation(line: 1352, column: 18, scope: !1763)
!1763 = distinct !DILexicalBlock(scope: !1755, file: !16, line: 1351, column: 74)
!1764 = !DILocation(line: 1354, column: 12, scope: !1765)
!1765 = distinct !DILexicalBlock(scope: !1763, file: !16, line: 1354, column: 12)
!1766 = !DILocation(line: 1355, column: 19, scope: !1767)
!1767 = distinct !DILexicalBlock(scope: !1765, file: !16, line: 1354, column: 31)
!1768 = !DILocation(line: 1356, column: 13, scope: !1769)
!1769 = distinct !DILexicalBlock(scope: !1767, file: !16, line: 1356, column: 13)
!1770 = !DILocation(line: 1356, column: 18, scope: !1769)
!1771 = !DILocation(line: 1356, column: 23, scope: !1769)
!1772 = !DILocation(line: 1357, column: 20, scope: !1769)
!1773 = !DILocation(line: 1357, column: 10, scope: !1769)
!1774 = !DILocation(line: 1358, column: 8, scope: !1767)
!1775 = !DILocation(line: 1360, column: 13, scope: !1776)
!1776 = distinct !DILexicalBlock(scope: !1763, file: !16, line: 1360, column: 13)
!1777 = !DILocation(line: 1360, column: 18, scope: !1776)
!1778 = !DILocation(line: 1360, column: 34, scope: !1776)
!1779 = !DILocation(line: 1360, column: 40, scope: !1776)
!1780 = !DILocation(line: 1361, column: 9, scope: !1781)
!1781 = distinct !DILexicalBlock(scope: !1776, file: !16, line: 1360, column: 60)
!1782 = !DILocation(line: 1362, column: 13, scope: !1783)
!1783 = distinct !DILexicalBlock(scope: !1781, file: !16, line: 1362, column: 13)
!1784 = !DILocation(line: 1362, column: 18, scope: !1783)
!1785 = !DILocation(line: 1362, column: 34, scope: !1783)
!1786 = !DILocation(line: 1362, column: 40, scope: !1783)
!1787 = !DILocation(line: 1363, column: 10, scope: !1783)
!1788 = !DILocation(line: 1363, column: 15, scope: !1783)
!1789 = !DILocation(line: 1363, column: 31, scope: !1783)
!1790 = !DILocation(line: 1363, column: 37, scope: !1783)
!1791 = !DILocation(line: 1365, column: 10, scope: !1783)
!1792 = !DILocation(line: 1365, column: 15, scope: !1783)
!1793 = !DILocation(line: 1365, column: 31, scope: !1783)
!1794 = !DILocation(line: 1365, column: 37, scope: !1783)
!1795 = !DILocation(line: 1366, column: 8, scope: !1781)
!1796 = !DILocation(line: 1368, column: 16, scope: !1763)
!1797 = !DILocation(line: 1369, column: 7, scope: !1763)
!1798 = !DILocation(line: 1371, column: 26, scope: !1750)
!1799 = !DILocation(line: 1371, column: 31, scope: !1750)
!1800 = !DILocation(line: 1371, column: 47, scope: !1750)
!1801 = !DILocation(line: 1371, column: 66, scope: !1750)
!1802 = !DILocation(line: 1371, column: 80, scope: !1750)
!1803 = !DILocation(line: 1371, column: 79, scope: !1750)
!1804 = !DILocation(line: 1371, column: 7, scope: !1750)
!1805 = !DILocation(line: 1378, column: 11, scope: !1806)
!1806 = distinct !DILexicalBlock(scope: !1750, file: !16, line: 1378, column: 11)
!1807 = !DILocalVariable(name: "vel", scope: !1808, file: !16, line: 1379, type: !8)
!1808 = distinct !DILexicalBlock(scope: !1806, file: !16, line: 1378, column: 22)
!1809 = !DILocation(line: 1379, column: 12, scope: !1808)
!1810 = !DILocation(line: 1379, column: 36, scope: !1808)
!1811 = !DILocation(line: 1379, column: 41, scope: !1808)
!1812 = !DILocation(line: 1379, column: 57, scope: !1808)
!1813 = !DILocation(line: 1379, column: 18, scope: !1808)
!1814 = !DILocation(line: 1381, column: 12, scope: !1815)
!1815 = distinct !DILexicalBlock(scope: !1808, file: !16, line: 1381, column: 12)
!1816 = !DILocation(line: 1381, column: 18, scope: !1815)
!1817 = !DILocation(line: 1381, column: 16, scope: !1815)
!1818 = !DILocation(line: 1382, column: 23, scope: !1815)
!1819 = !DILocation(line: 1382, column: 28, scope: !1815)
!1820 = !DILocation(line: 1382, column: 44, scope: !1815)
!1821 = !DILocation(line: 1382, column: 60, scope: !1815)
!1822 = !DILocation(line: 1382, column: 75, scope: !1815)
!1823 = !DILocation(line: 1382, column: 53, scope: !1815)
!1824 = !DILocation(line: 1382, column: 9, scope: !1815)
!1825 = !DILocation(line: 1383, column: 7, scope: !1808)
!1826 = !DILocation(line: 1385, column: 11, scope: !1827)
!1827 = distinct !DILexicalBlock(scope: !1750, file: !16, line: 1385, column: 11)
!1828 = !DILocation(line: 1385, column: 19, scope: !1827)
!1829 = !DILocation(line: 1385, column: 22, scope: !1827)
!1830 = !DILocation(line: 1385, column: 27, scope: !1827)
!1831 = !DILocation(line: 1385, column: 32, scope: !1827)
!1832 = !DILocation(line: 1386, column: 28, scope: !1827)
!1833 = !DILocation(line: 1386, column: 33, scope: !1827)
!1834 = !DILocation(line: 1386, column: 41, scope: !1827)
!1835 = !DILocation(line: 1386, column: 46, scope: !1827)
!1836 = !DILocation(line: 1386, column: 62, scope: !1827)
!1837 = !DILocation(line: 1386, column: 72, scope: !1827)
!1838 = !DILocation(line: 1386, column: 77, scope: !1827)
!1839 = !DILocation(line: 1386, column: 84, scope: !1827)
!1840 = !DILocation(line: 1386, column: 8, scope: !1827)
!1841 = !DILocation(line: 1389, column: 11, scope: !1842)
!1842 = distinct !DILexicalBlock(scope: !1750, file: !16, line: 1389, column: 11)
!1843 = !DILocation(line: 1389, column: 18, scope: !1842)
!1844 = !DILocation(line: 1389, column: 15, scope: !1842)
!1845 = !DILocation(line: 1390, column: 48, scope: !1846)
!1846 = distinct !DILexicalBlock(scope: !1842, file: !16, line: 1389, column: 29)
!1847 = !DILocation(line: 1390, column: 58, scope: !1846)
!1848 = !DILocation(line: 1390, column: 8, scope: !1846)
!1849 = !DILocation(line: 1391, column: 60, scope: !1846)
!1850 = !DILocation(line: 1391, column: 70, scope: !1846)
!1851 = !DILocation(line: 1391, column: 8, scope: !1846)
!1852 = !DILocation(line: 1392, column: 7, scope: !1846)
!1853 = !DILocation(line: 1395, column: 17, scope: !1750)
!1854 = !DILocation(line: 1397, column: 5, scope: !1719)
!1855 = !DILocation(line: 1398, column: 5, scope: !1672)
!1856 = !DILocalVariable(name: "old_vel", scope: !1857, file: !16, line: 1402, type: !47)
!1857 = distinct !DILexicalBlock(scope: !1673, file: !16, line: 1401, column: 22)
!1858 = !DILocation(line: 1402, column: 16, scope: !1857)
!1859 = !DILocation(line: 1407, column: 5, scope: !1857)
!1860 = !DILocalVariable(name: "ppos0", scope: !1861, file: !16, line: 1410, type: !1015)
!1861 = distinct !DILexicalBlock(scope: !1857, file: !16, line: 1410, column: 5)
!1862 = !DILocation(line: 1410, column: 19, scope: !1861)
!1863 = !DILocalVariable(name: "ppos1", scope: !1861, file: !16, line: 1410, type: !1015)
!1864 = !DILocation(line: 1410, column: 27, scope: !1861)
!1865 = !DILocalVariable(name: "pos_hit", scope: !1861, file: !16, line: 1410, type: !47)
!1866 = !DILocation(line: 1410, column: 34, scope: !1861)
!1867 = !DILocalVariable(name: "size0", scope: !1861, file: !16, line: 1411, type: !8)
!1868 = !DILocation(line: 1411, column: 12, scope: !1861)
!1869 = !DILocalVariable(name: "size1", scope: !1861, file: !16, line: 1411, type: !8)
!1870 = !DILocation(line: 1411, column: 19, scope: !1861)
!1871 = !DILocation(line: 1412, column: 32, scope: !1861)
!1872 = !DILocation(line: 1412, column: 15, scope: !1861)
!1873 = !DILocation(line: 1412, column: 44, scope: !1861)
!1874 = !DILocation(line: 1412, column: 12, scope: !1861)
!1875 = !DILocation(line: 1413, column: 15, scope: !1861)
!1876 = !DILocation(line: 1413, column: 20, scope: !1861)
!1877 = !DILocation(line: 1413, column: 12, scope: !1861)
!1878 = !DILocation(line: 1414, column: 31, scope: !1861)
!1879 = !DILocation(line: 1414, column: 14, scope: !1861)
!1880 = !DILocation(line: 1414, column: 43, scope: !1861)
!1881 = !DILocation(line: 1414, column: 12, scope: !1861)
!1882 = !DILocation(line: 1415, column: 14, scope: !1861)
!1883 = !DILocation(line: 1415, column: 19, scope: !1861)
!1884 = !DILocation(line: 1415, column: 12, scope: !1861)
!1885 = !DILocation(line: 1416, column: 6, scope: !1861)
!1886 = !DILocation(line: 1419, column: 27, scope: !1861)
!1887 = !DILocation(line: 1419, column: 34, scope: !1861)
!1888 = !DILocation(line: 1419, column: 6, scope: !1861)
!1889 = !DILocation(line: 1420, column: 32, scope: !1861)
!1890 = !DILocation(line: 1420, column: 54, scope: !1861)
!1891 = !DILocation(line: 1420, column: 61, scope: !1861)
!1892 = !DILocation(line: 1420, column: 69, scope: !1861)
!1893 = !DILocation(line: 1420, column: 67, scope: !1861)
!1894 = !DILocation(line: 1420, column: 47, scope: !1861)
!1895 = !DILocation(line: 1420, column: 6, scope: !1861)
!1896 = !DILocation(line: 1422, column: 16, scope: !1861)
!1897 = !DILocation(line: 1422, column: 21, scope: !1861)
!1898 = !DILocation(line: 1422, column: 37, scope: !1861)
!1899 = !DILocation(line: 1422, column: 14, scope: !1861)
!1900 = !DILocation(line: 1424, column: 27, scope: !1861)
!1901 = !DILocation(line: 1424, column: 50, scope: !1861)
!1902 = !DILocation(line: 1424, column: 33, scope: !1861)
!1903 = !DILocation(line: 1424, column: 6, scope: !1861)
!1904 = !DILocation(line: 1429, column: 12, scope: !1905)
!1905 = distinct !DILexicalBlock(scope: !1857, file: !16, line: 1429, column: 10)
!1906 = !DILocation(line: 1429, column: 17, scope: !1905)
!1907 = !DILocation(line: 1429, column: 22, scope: !1905)
!1908 = !DILocation(line: 1429, column: 11, scope: !1905)
!1909 = !DILocation(line: 1429, column: 10, scope: !1905)
!1910 = !DILocation(line: 1432, column: 10, scope: !1911)
!1911 = distinct !DILexicalBlock(scope: !1912, file: !16, line: 1432, column: 10)
!1912 = distinct !DILexicalBlock(scope: !1905, file: !16, line: 1429, column: 45)
!1913 = !DILocation(line: 1432, column: 15, scope: !1911)
!1914 = !DILocation(line: 1432, column: 31, scope: !1911)
!1915 = !DILocation(line: 1432, column: 36, scope: !1911)
!1916 = !DILocation(line: 1432, column: 51, scope: !1911)
!1917 = !DILocation(line: 1432, column: 63, scope: !1911)
!1918 = !DILocation(line: 1432, column: 68, scope: !1911)
!1919 = !DILocation(line: 1432, column: 73, scope: !1911)
!1920 = !DILocation(line: 1432, column: 89, scope: !1911)
!1921 = !DILocation(line: 1432, column: 98, scope: !1911)
!1922 = !DILocation(line: 1432, column: 65, scope: !1911)
!1923 = !DILocation(line: 1432, column: 100, scope: !1911)
!1924 = !DILocation(line: 1432, column: 111, scope: !1911)
!1925 = !DILocation(line: 1432, column: 116, scope: !1911)
!1926 = !DILocation(line: 1432, column: 121, scope: !1911)
!1927 = !DILocation(line: 1432, column: 137, scope: !1911)
!1928 = !DILocation(line: 1432, column: 146, scope: !1911)
!1929 = !DILocation(line: 1432, column: 113, scope: !1911)
!1930 = !DILocation(line: 1432, column: 148, scope: !1911)
!1931 = !DILocation(line: 1432, column: 159, scope: !1911)
!1932 = !DILocation(line: 1432, column: 164, scope: !1911)
!1933 = !DILocation(line: 1432, column: 169, scope: !1911)
!1934 = !DILocation(line: 1432, column: 185, scope: !1911)
!1935 = !DILocation(line: 1432, column: 194, scope: !1911)
!1936 = !DILocation(line: 1432, column: 161, scope: !1911)
!1937 = !DILocation(line: 1434, column: 52, scope: !1938)
!1938 = distinct !DILexicalBlock(scope: !1911, file: !16, line: 1432, column: 198)
!1939 = !DILocation(line: 1434, column: 37, scope: !1938)
!1940 = !DILocation(line: 1434, column: 8, scope: !1938)
!1941 = !DILocation(line: 1434, column: 41, scope: !1938)
!1942 = !DILocation(line: 1435, column: 17, scope: !1938)
!1943 = !DILocation(line: 1436, column: 6, scope: !1938)
!1944 = !DILocation(line: 1437, column: 5, scope: !1912)
!1945 = !DILocation(line: 1439, column: 5, scope: !1857)
!1946 = !DILocation(line: 1446, column: 5, scope: !1673)
!1947 = !DILocation(line: 1450, column: 5, scope: !1673)
!1948 = !DILocation(line: 1451, column: 5, scope: !1673)
!1949 = !DILocation(line: 1452, column: 5, scope: !1673)
!1950 = !DILocation(line: 1455, column: 5, scope: !1673)
!1951 = !DILocation(line: 1456, column: 5, scope: !1673)
!1952 = !DILocation(line: 1460, column: 2, scope: !1261)
!1953 = !DILocation(line: 1460, column: 12, scope: !971)
!1954 = distinct !{!1954, !1259, !1955, !482}
!1955 = !DILocation(line: 1460, column: 22, scope: !971)
!1956 = !DILocation(line: 1463, column: 6, scope: !1957)
!1957 = distinct !DILexicalBlock(scope: !971, file: !16, line: 1463, column: 6)
!1958 = !DILocation(line: 1463, column: 11, scope: !1957)
!1959 = !DILocation(line: 1463, column: 24, scope: !1957)
!1960 = !DILocation(line: 1464, column: 7, scope: !1961)
!1961 = distinct !DILexicalBlock(scope: !1962, file: !16, line: 1464, column: 7)
!1962 = distinct !DILexicalBlock(scope: !1957, file: !16, line: 1463, column: 34)
!1963 = !DILocation(line: 1464, column: 13, scope: !1961)
!1964 = !DILocation(line: 1465, column: 40, scope: !1965)
!1965 = distinct !DILexicalBlock(scope: !1961, file: !16, line: 1464, column: 18)
!1966 = !DILocation(line: 1465, column: 45, scope: !1965)
!1967 = !DILocation(line: 1465, column: 18, scope: !1965)
!1968 = !DILocation(line: 1465, column: 4, scope: !1965)
!1969 = !DILocation(line: 1465, column: 26, scope: !1965)
!1970 = !DILocation(line: 1465, column: 38, scope: !1965)
!1971 = !DILocation(line: 1467, column: 21, scope: !1965)
!1972 = !DILocation(line: 1467, column: 26, scope: !1965)
!1973 = !DILocation(line: 1467, column: 18, scope: !1965)
!1974 = !DILocation(line: 1468, column: 14, scope: !1965)
!1975 = !DILocation(line: 1470, column: 3, scope: !1965)
!1976 = !DILocation(line: 1471, column: 2, scope: !1962)
!1977 = !DILocation(line: 1476, column: 7, scope: !1978)
!1978 = distinct !DILexicalBlock(scope: !971, file: !16, line: 1476, column: 6)
!1979 = !DILocation(line: 1476, column: 19, scope: !1978)
!1980 = !DILocation(line: 1476, column: 23, scope: !1978)
!1981 = !DILocalVariable(name: "moved_vec", scope: !1982, file: !16, line: 1477, type: !47)
!1982 = distinct !DILexicalBlock(scope: !1978, file: !16, line: 1476, column: 32)
!1983 = !DILocation(line: 1477, column: 14, scope: !1982)
!1984 = !DILocation(line: 1479, column: 26, scope: !1982)
!1985 = !DILocation(line: 1479, column: 31, scope: !1982)
!1986 = !DILocation(line: 1479, column: 3, scope: !1982)
!1987 = !DILocation(line: 1480, column: 22, scope: !1982)
!1988 = !DILocation(line: 1480, column: 27, scope: !1982)
!1989 = !DILocation(line: 1480, column: 43, scope: !1982)
!1990 = !DILocation(line: 1480, column: 75, scope: !1982)
!1991 = !DILocation(line: 1480, column: 63, scope: !1982)
!1992 = !DILocation(line: 1480, column: 3, scope: !1982)
!1993 = !DILocation(line: 1483, column: 7, scope: !1994)
!1994 = distinct !DILexicalBlock(scope: !1982, file: !16, line: 1483, column: 7)
!1995 = !DILocation(line: 1483, column: 12, scope: !1994)
!1996 = !DILocation(line: 1483, column: 10, scope: !1994)
!1997 = !DILocation(line: 1483, column: 26, scope: !1994)
!1998 = !DILocation(line: 1483, column: 30, scope: !1994)
!1999 = !DILocation(line: 1483, column: 35, scope: !1994)
!2000 = !DILocation(line: 1483, column: 51, scope: !1994)
!2001 = !DILocation(line: 1483, column: 60, scope: !1994)
!2002 = !DILocation(line: 1483, column: 61, scope: !1994)
!2003 = !DILocation(line: 1483, column: 65, scope: !1994)
!2004 = !DILocation(line: 1483, column: 68, scope: !1994)
!2005 = !DILocation(line: 1483, column: 73, scope: !1994)
!2006 = !DILocation(line: 1483, column: 89, scope: !1994)
!2007 = !DILocation(line: 1483, column: 98, scope: !1994)
!2008 = !DILocation(line: 1483, column: 99, scope: !1994)
!2009 = !DILocation(line: 1483, column: 103, scope: !1994)
!2010 = !DILocation(line: 1483, column: 106, scope: !1994)
!2011 = !DILocation(line: 1483, column: 111, scope: !1994)
!2012 = !DILocation(line: 1483, column: 127, scope: !1994)
!2013 = !DILocation(line: 1483, column: 136, scope: !1994)
!2014 = !DILocation(line: 1483, column: 137, scope: !1994)
!2015 = !DILocation(line: 1483, column: 142, scope: !1994)
!2016 = !DILocation(line: 1484, column: 8, scope: !1994)
!2017 = !DILocation(line: 1484, column: 13, scope: !1994)
!2018 = !DILocation(line: 1484, column: 29, scope: !1994)
!2019 = !DILocation(line: 1484, column: 36, scope: !1994)
!2020 = !DILocation(line: 1484, column: 37, scope: !1994)
!2021 = !DILocation(line: 1484, column: 41, scope: !1994)
!2022 = !DILocation(line: 1484, column: 44, scope: !1994)
!2023 = !DILocation(line: 1484, column: 49, scope: !1994)
!2024 = !DILocation(line: 1484, column: 65, scope: !1994)
!2025 = !DILocation(line: 1484, column: 72, scope: !1994)
!2026 = !DILocation(line: 1484, column: 73, scope: !1994)
!2027 = !DILocation(line: 1484, column: 77, scope: !1994)
!2028 = !DILocation(line: 1484, column: 80, scope: !1994)
!2029 = !DILocation(line: 1484, column: 85, scope: !1994)
!2030 = !DILocation(line: 1484, column: 101, scope: !1994)
!2031 = !DILocation(line: 1484, column: 108, scope: !1994)
!2032 = !DILocation(line: 1484, column: 109, scope: !1994)
!2033 = !DILocalVariable(name: "center", scope: !2034, file: !16, line: 1485, type: !47)
!2034 = distinct !DILexicalBlock(scope: !1994, file: !16, line: 1484, column: 115)
!2035 = !DILocation(line: 1485, column: 15, scope: !2034)
!2036 = !DILocalVariable(name: "bump_vec", scope: !2034, file: !16, line: 1485, type: !47)
!2037 = !DILocation(line: 1485, column: 22, scope: !2034)
!2038 = !DILocation(line: 1489, column: 45, scope: !2034)
!2039 = !DILocation(line: 1489, column: 50, scope: !2034)
!2040 = !DILocation(line: 1489, column: 36, scope: !2034)
!2041 = !DILocation(line: 1489, column: 4, scope: !2034)
!2042 = !DILocation(line: 1490, column: 51, scope: !2034)
!2043 = !DILocation(line: 1490, column: 56, scope: !2034)
!2044 = !DILocation(line: 1490, column: 4, scope: !2034)
!2045 = !DILocation(line: 1493, column: 18, scope: !2046)
!2046 = distinct !DILexicalBlock(scope: !2034, file: !16, line: 1493, column: 8)
!2047 = !DILocation(line: 1493, column: 23, scope: !2046)
!2048 = !DILocation(line: 1493, column: 8, scope: !2046)
!2049 = !DILocation(line: 1493, column: 31, scope: !2046)
!2050 = !DILocation(line: 1493, column: 39, scope: !2046)
!2051 = !DILocation(line: 1494, column: 5, scope: !2046)
!2052 = !DILocation(line: 1494, column: 5, scope: !2053)
!2053 = distinct !DILexicalBlock(scope: !2046, file: !16, line: 1494, column: 5)
!2054 = !DILocation(line: 1496, column: 23, scope: !2034)
!2055 = !DILocation(line: 1496, column: 28, scope: !2034)
!2056 = !DILocation(line: 1496, column: 42, scope: !2034)
!2057 = !DILocation(line: 1496, column: 47, scope: !2034)
!2058 = !DILocation(line: 1496, column: 51, scope: !2034)
!2059 = !DILocation(line: 1496, column: 4, scope: !2034)
!2060 = !DILocation(line: 1499, column: 18, scope: !2061)
!2061 = distinct !DILexicalBlock(scope: !2034, file: !16, line: 1499, column: 8)
!2062 = !DILocation(line: 1499, column: 23, scope: !2061)
!2063 = !DILocation(line: 1499, column: 8, scope: !2061)
!2064 = !DILocation(line: 1499, column: 31, scope: !2061)
!2065 = !DILocation(line: 1499, column: 39, scope: !2061)
!2066 = !DILocation(line: 1500, column: 23, scope: !2061)
!2067 = !DILocation(line: 1500, column: 5, scope: !2061)
!2068 = !DILocation(line: 1501, column: 3, scope: !2034)
!2069 = !DILocation(line: 1503, column: 2, scope: !1982)
!2070 = !DILocation(line: 1508, column: 6, scope: !2071)
!2071 = distinct !DILexicalBlock(scope: !971, file: !16, line: 1508, column: 6)
!2072 = !DILocation(line: 1508, column: 11, scope: !2071)
!2073 = !DILocation(line: 1508, column: 27, scope: !2071)
!2074 = !DILocation(line: 1508, column: 33, scope: !2071)
!2075 = !DILocation(line: 1509, column: 28, scope: !2071)
!2076 = !DILocation(line: 1509, column: 3, scope: !2071)
!2077 = !DILocation(line: 1512, column: 6, scope: !2078)
!2078 = distinct !DILexicalBlock(scope: !971, file: !16, line: 1512, column: 6)
!2079 = !DILocation(line: 1512, column: 11, scope: !2078)
!2080 = !DILocation(line: 1512, column: 15, scope: !2078)
!2081 = !DILocation(line: 1512, column: 28, scope: !2078)
!2082 = !DILocation(line: 1512, column: 31, scope: !2078)
!2083 = !DILocation(line: 1512, column: 36, scope: !2078)
!2084 = !DILocation(line: 1512, column: 44, scope: !2078)
!2085 = !DILocation(line: 1512, column: 42, scope: !2078)
!2086 = !DILocation(line: 1512, column: 56, scope: !2078)
!2087 = !DILocation(line: 1512, column: 60, scope: !2078)
!2088 = !DILocation(line: 1512, column: 78, scope: !2078)
!2089 = !DILocalVariable(name: "sidenum", scope: !2090, file: !16, line: 1513, type: !12)
!2090 = distinct !DILexicalBlock(scope: !2078, file: !16, line: 1512, column: 92)
!2091 = !DILocation(line: 1513, column: 7, scope: !2090)
!2092 = !DILocation(line: 1515, column: 41, scope: !2090)
!2093 = !DILocation(line: 1515, column: 46, scope: !2090)
!2094 = !DILocation(line: 1515, column: 32, scope: !2090)
!2095 = !DILocation(line: 1515, column: 64, scope: !2090)
!2096 = !DILocation(line: 1515, column: 55, scope: !2090)
!2097 = !DILocation(line: 1515, column: 13, scope: !2090)
!2098 = !DILocation(line: 1515, column: 11, scope: !2090)
!2099 = !DILocation(line: 1517, column: 7, scope: !2100)
!2100 = distinct !DILexicalBlock(scope: !2090, file: !16, line: 1517, column: 7)
!2101 = !DILocation(line: 1517, column: 15, scope: !2100)
!2102 = !DILocation(line: 1519, column: 11, scope: !2103)
!2103 = distinct !DILexicalBlock(scope: !2104, file: !16, line: 1519, column: 8)
!2104 = distinct !DILexicalBlock(scope: !2100, file: !16, line: 1517, column: 22)
!2105 = !DILocation(line: 1519, column: 59, scope: !2103)
!2106 = !DILocation(line: 1519, column: 10, scope: !2103)
!2107 = !DILocation(line: 1519, column: 8, scope: !2103)
!2108 = !DILocalVariable(name: "s", scope: !2109, file: !16, line: 1520, type: !503)
!2109 = distinct !DILexicalBlock(scope: !2103, file: !16, line: 1519, column: 76)
!2110 = !DILocation(line: 1520, column: 11, scope: !2109)
!2111 = !DILocalVariable(name: "vertnum", scope: !2109, file: !16, line: 1521, type: !12)
!2112 = !DILocation(line: 1521, column: 9, scope: !2109)
!2113 = !DILocalVariable(name: "num_faces", scope: !2109, file: !16, line: 1521, type: !12)
!2114 = !DILocation(line: 1521, column: 17, scope: !2109)
!2115 = !DILocalVariable(name: "i", scope: !2109, file: !16, line: 1521, type: !12)
!2116 = !DILocation(line: 1521, column: 27, scope: !2109)
!2117 = !DILocalVariable(name: "dist", scope: !2109, file: !16, line: 1522, type: !8)
!2118 = !DILocation(line: 1522, column: 9, scope: !2109)
!2119 = !DILocalVariable(name: "vertex_list", scope: !2109, file: !16, line: 1523, type: !2120)
!2120 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 192, elements: !2121)
!2121 = !{!2122}
!2122 = !DISubrange(count: 6)
!2123 = !DILocation(line: 1523, column: 9, scope: !2109)
!2124 = !DILocation(line: 1527, column: 19, scope: !2109)
!2125 = !DILocation(line: 1527, column: 10, scope: !2109)
!2126 = !DILocation(line: 1527, column: 32, scope: !2109)
!2127 = !DILocation(line: 1527, column: 38, scope: !2109)
!2128 = !DILocation(line: 1527, column: 7, scope: !2109)
!2129 = !DILocation(line: 1529, column: 9, scope: !2130)
!2130 = distinct !DILexicalBlock(scope: !2109, file: !16, line: 1529, column: 9)
!2131 = !DILocation(line: 1529, column: 20, scope: !2130)
!2132 = !DILocation(line: 1530, column: 6, scope: !2130)
!2133 = !DILocation(line: 1532, column: 42, scope: !2109)
!2134 = !DILocation(line: 1532, column: 55, scope: !2109)
!2135 = !DILocation(line: 1532, column: 68, scope: !2109)
!2136 = !DILocation(line: 1532, column: 5, scope: !2109)
!2137 = !DILocation(line: 1535, column: 15, scope: !2109)
!2138 = !DILocation(line: 1535, column: 13, scope: !2109)
!2139 = !DILocation(line: 1536, column: 11, scope: !2140)
!2140 = distinct !DILexicalBlock(scope: !2109, file: !16, line: 1536, column: 5)
!2141 = !DILocation(line: 1536, column: 10, scope: !2140)
!2142 = !DILocation(line: 1536, column: 14, scope: !2143)
!2143 = distinct !DILexicalBlock(scope: !2140, file: !16, line: 1536, column: 5)
!2144 = !DILocation(line: 1536, column: 15, scope: !2143)
!2145 = !DILocation(line: 1536, column: 5, scope: !2140)
!2146 = !DILocation(line: 1537, column: 22, scope: !2147)
!2147 = distinct !DILexicalBlock(scope: !2143, file: !16, line: 1537, column: 10)
!2148 = !DILocation(line: 1537, column: 10, scope: !2147)
!2149 = !DILocation(line: 1537, column: 27, scope: !2147)
!2150 = !DILocation(line: 1537, column: 25, scope: !2147)
!2151 = !DILocation(line: 1538, column: 29, scope: !2147)
!2152 = !DILocation(line: 1538, column: 17, scope: !2147)
!2153 = !DILocation(line: 1538, column: 15, scope: !2147)
!2154 = !DILocation(line: 1538, column: 7, scope: !2147)
!2155 = !DILocation(line: 1536, column: 19, scope: !2143)
!2156 = !DILocation(line: 1536, column: 5, scope: !2143)
!2157 = distinct !{!2157, !2145, !2158, !482}
!2158 = !DILocation(line: 1538, column: 30, scope: !2140)
!2159 = !DILocation(line: 1548, column: 43, scope: !2109)
!2160 = !DILocation(line: 1548, column: 46, scope: !2109)
!2161 = !DILocation(line: 1548, column: 68, scope: !2109)
!2162 = !DILocation(line: 1548, column: 59, scope: !2109)
!2163 = !DILocation(line: 1548, column: 13, scope: !2109)
!2164 = !DILocation(line: 1548, column: 11, scope: !2109)
!2165 = !DILocation(line: 1549, column: 24, scope: !2109)
!2166 = !DILocation(line: 1549, column: 29, scope: !2109)
!2167 = !DILocation(line: 1549, column: 45, scope: !2109)
!2168 = !DILocation(line: 1549, column: 48, scope: !2109)
!2169 = !DILocation(line: 1549, column: 59, scope: !2109)
!2170 = !DILocation(line: 1549, column: 64, scope: !2109)
!2171 = !DILocation(line: 1549, column: 69, scope: !2109)
!2172 = !DILocation(line: 1549, column: 68, scope: !2109)
!2173 = !DILocation(line: 1549, column: 6, scope: !2109)
!2174 = !DILocation(line: 1551, column: 23, scope: !2109)
!2175 = !DILocation(line: 1551, column: 5, scope: !2109)
!2176 = !DILocation(line: 1553, column: 4, scope: !2109)
!2177 = !DILocation(line: 1554, column: 3, scope: !2104)
!2178 = !DILocation(line: 1555, column: 2, scope: !2090)
!2179 = !DILocation(line: 1559, column: 21, scope: !2180)
!2180 = distinct !DILexicalBlock(scope: !971, file: !16, line: 1559, column: 6)
!2181 = !DILocation(line: 1559, column: 26, scope: !2180)
!2182 = !DILocation(line: 1559, column: 30, scope: !2180)
!2183 = !DILocation(line: 1559, column: 35, scope: !2180)
!2184 = !DILocation(line: 1559, column: 6, scope: !2180)
!2185 = !DILocation(line: 1559, column: 45, scope: !2180)
!2186 = !DILocation(line: 1559, column: 55, scope: !2180)
!2187 = !DILocation(line: 1560, column: 23, scope: !2188)
!2188 = distinct !DILexicalBlock(scope: !2189, file: !16, line: 1560, column: 7)
!2189 = distinct !DILexicalBlock(scope: !2180, file: !16, line: 1559, column: 60)
!2190 = !DILocation(line: 1560, column: 7, scope: !2188)
!2191 = !DILocation(line: 1560, column: 27, scope: !2188)
!2192 = !DILocalVariable(name: "n", scope: !2193, file: !16, line: 1561, type: !12)
!2193 = distinct !DILexicalBlock(scope: !2188, file: !16, line: 1560, column: 33)
!2194 = !DILocation(line: 1561, column: 8, scope: !2193)
!2195 = !DILocation(line: 1564, column: 8, scope: !2196)
!2196 = distinct !DILexicalBlock(scope: !2193, file: !16, line: 1564, column: 8)
!2197 = !DILocation(line: 1564, column: 13, scope: !2196)
!2198 = !DILocation(line: 1564, column: 17, scope: !2196)
!2199 = !DILocation(line: 1564, column: 30, scope: !2196)
!2200 = !DILocation(line: 1564, column: 52, scope: !2196)
!2201 = !DILocation(line: 1564, column: 57, scope: !2196)
!2202 = !DILocation(line: 1564, column: 66, scope: !2196)
!2203 = !DILocation(line: 1564, column: 71, scope: !2196)
!2204 = !DILocation(line: 1564, column: 36, scope: !2196)
!2205 = !DILocation(line: 1564, column: 35, scope: !2196)
!2206 = !DILocation(line: 1564, column: 79, scope: !2196)
!2207 = !DILocation(line: 1565, column: 16, scope: !2208)
!2208 = distinct !DILexicalBlock(scope: !2196, file: !16, line: 1564, column: 85)
!2209 = !DILocation(line: 1565, column: 21, scope: !2208)
!2210 = !DILocation(line: 1565, column: 5, scope: !2208)
!2211 = !DILocation(line: 1565, column: 10, scope: !2208)
!2212 = !DILocation(line: 1565, column: 14, scope: !2208)
!2213 = !DILocation(line: 1566, column: 16, scope: !2208)
!2214 = !DILocation(line: 1566, column: 24, scope: !2208)
!2215 = !DILocation(line: 1566, column: 5, scope: !2208)
!2216 = !DILocation(line: 1567, column: 4, scope: !2208)
!2217 = !DILocation(line: 1569, column: 29, scope: !2218)
!2218 = distinct !DILexicalBlock(scope: !2196, file: !16, line: 1568, column: 9)
!2219 = !DILocation(line: 1569, column: 34, scope: !2218)
!2220 = !DILocation(line: 1569, column: 48, scope: !2218)
!2221 = !DILocation(line: 1569, column: 53, scope: !2218)
!2222 = !DILocation(line: 1569, column: 39, scope: !2218)
!2223 = !DILocation(line: 1569, column: 5, scope: !2218)
!2224 = !DILocation(line: 1570, column: 19, scope: !2218)
!2225 = !DILocation(line: 1570, column: 5, scope: !2218)
!2226 = !DILocation(line: 1570, column: 10, scope: !2218)
!2227 = !DILocation(line: 1570, column: 14, scope: !2218)
!2228 = !DILocation(line: 1570, column: 16, scope: !2218)
!2229 = !DILocation(line: 1572, column: 8, scope: !2230)
!2230 = distinct !DILexicalBlock(scope: !2193, file: !16, line: 1572, column: 8)
!2231 = !DILocation(line: 1572, column: 13, scope: !2230)
!2232 = !DILocation(line: 1572, column: 18, scope: !2230)
!2233 = !DILocation(line: 1573, column: 5, scope: !2230)
!2234 = !DILocation(line: 1573, column: 10, scope: !2230)
!2235 = !DILocation(line: 1573, column: 16, scope: !2230)
!2236 = !DILocation(line: 1574, column: 3, scope: !2193)
!2237 = !DILocation(line: 1575, column: 2, scope: !2189)
!2238 = !DILocation(line: 1580, column: 1, scope: !262)
!2239 = distinct !DISubprogram(name: "fixmuldiv", linkageName: "_Z9fixmuldiviii", scope: !9, file: !9, line: 98, type: !2240, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !265)
!2240 = !DISubroutineType(types: !2241)
!2241 = !{!8, !8, !8, !8}
!2242 = !DILocalVariable(name: "a", arg: 1, scope: !2239, file: !9, line: 98, type: !8)
!2243 = !DILocation(line: 98, column: 29, scope: !2239)
!2244 = !DILocalVariable(name: "b", arg: 2, scope: !2239, file: !9, line: 98, type: !8)
!2245 = !DILocation(line: 98, column: 36, scope: !2239)
!2246 = !DILocalVariable(name: "c", arg: 3, scope: !2239, file: !9, line: 98, type: !8)
!2247 = !DILocation(line: 98, column: 43, scope: !2239)
!2248 = !DILocation(line: 100, column: 6, scope: !2249)
!2249 = distinct !DILexicalBlock(scope: !2239, file: !9, line: 100, column: 6)
!2250 = !DILocation(line: 100, column: 8, scope: !2249)
!2251 = !DILocation(line: 100, column: 14, scope: !2249)
!2252 = !DILocation(line: 102, column: 24, scope: !2239)
!2253 = !DILocation(line: 102, column: 37, scope: !2239)
!2254 = !DILocation(line: 102, column: 26, scope: !2239)
!2255 = !DILocation(line: 102, column: 41, scope: !2239)
!2256 = !DILocation(line: 102, column: 39, scope: !2239)
!2257 = !DILocation(line: 102, column: 14, scope: !2239)
!2258 = !DILocation(line: 102, column: 2, scope: !2239)
!2259 = !DILocation(line: 103, column: 1, scope: !2239)
!2260 = distinct !DISubprogram(name: "i2f", linkageName: "_Z3i2fi", scope: !9, file: !9, line: 49, type: !2261, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !265)
!2261 = !DISubroutineType(types: !2262)
!2262 = !{!8, !12}
!2263 = !DILocalVariable(name: "i", arg: 1, scope: !2260, file: !9, line: 49, type: !12)
!2264 = !DILocation(line: 49, column: 23, scope: !2260)
!2265 = !DILocation(line: 51, column: 9, scope: !2260)
!2266 = !DILocation(line: 51, column: 11, scope: !2260)
!2267 = !DILocation(line: 51, column: 2, scope: !2260)
!2268 = distinct !DISubprogram(name: "phys_apply_force", linkageName: "_Z16phys_apply_forceP6objectP10vms_vector", scope: !16, file: !16, line: 1625, type: !2269, scopeLine: 1626, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !265)
!2269 = !DISubroutineType(types: !2270)
!2270 = !{null, !26, !1015}
!2271 = !DILocalVariable(name: "obj", arg: 1, scope: !2268, file: !16, line: 1625, type: !26)
!2272 = !DILocation(line: 1625, column: 31, scope: !2268)
!2273 = !DILocalVariable(name: "force_vec", arg: 2, scope: !2268, file: !16, line: 1625, type: !1015)
!2274 = !DILocation(line: 1625, column: 47, scope: !2268)
!2275 = !DILocation(line: 1630, column: 6, scope: !2276)
!2276 = distinct !DILexicalBlock(scope: !2268, file: !16, line: 1630, column: 6)
!2277 = !DILocation(line: 1630, column: 11, scope: !2276)
!2278 = !DILocation(line: 1630, column: 27, scope: !2276)
!2279 = !DILocation(line: 1630, column: 32, scope: !2276)
!2280 = !DILocation(line: 1631, column: 3, scope: !2276)
!2281 = !DILocation(line: 1633, column: 6, scope: !2282)
!2282 = distinct !DILexicalBlock(scope: !2268, file: !16, line: 1633, column: 6)
!2283 = !DILocation(line: 1633, column: 11, scope: !2282)
!2284 = !DILocation(line: 1633, column: 25, scope: !2282)
!2285 = !DILocation(line: 1634, column: 3, scope: !2282)
!2286 = !DILocation(line: 1659, column: 21, scope: !2268)
!2287 = !DILocation(line: 1659, column: 26, scope: !2268)
!2288 = !DILocation(line: 1659, column: 42, scope: !2268)
!2289 = !DILocation(line: 1659, column: 51, scope: !2268)
!2290 = !DILocation(line: 1659, column: 73, scope: !2268)
!2291 = !DILocation(line: 1659, column: 78, scope: !2268)
!2292 = !DILocation(line: 1659, column: 94, scope: !2268)
!2293 = !DILocation(line: 1659, column: 61, scope: !2268)
!2294 = !DILocation(line: 1659, column: 2, scope: !2268)
!2295 = !DILocation(line: 1662, column: 1, scope: !2268)
!2296 = distinct !DISubprogram(name: "physics_set_rotvel_and_saturate", linkageName: "_Z31physics_set_rotvel_and_saturatePii", scope: !16, file: !16, line: 1668, type: !2297, scopeLine: 1669, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !265)
!2297 = !DISubroutineType(types: !2298)
!2298 = !{null, !2299, !8}
!2299 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!2300 = !DILocalVariable(name: "dest", arg: 1, scope: !2296, file: !16, line: 1668, type: !2299)
!2301 = !DILocation(line: 1668, column: 43, scope: !2296)
!2302 = !DILocalVariable(name: "delta", arg: 2, scope: !2296, file: !16, line: 1668, type: !8)
!2303 = !DILocation(line: 1668, column: 53, scope: !2296)
!2304 = !DILocation(line: 1670, column: 7, scope: !2305)
!2305 = distinct !DILexicalBlock(scope: !2296, file: !16, line: 1670, column: 6)
!2306 = !DILocation(line: 1670, column: 16, scope: !2305)
!2307 = !DILocation(line: 1670, column: 15, scope: !2305)
!2308 = !DILocation(line: 1670, column: 13, scope: !2305)
!2309 = !DILocation(line: 1670, column: 22, scope: !2305)
!2310 = !DILocation(line: 1671, column: 11, scope: !2311)
!2311 = distinct !DILexicalBlock(scope: !2312, file: !16, line: 1671, column: 7)
!2312 = distinct !DILexicalBlock(scope: !2305, file: !16, line: 1670, column: 27)
!2313 = !DILocation(line: 1671, column: 7, scope: !2311)
!2314 = !DILocation(line: 1671, column: 18, scope: !2311)
!2315 = !DILocation(line: 1673, column: 12, scope: !2316)
!2316 = distinct !DILexicalBlock(scope: !2311, file: !16, line: 1671, column: 28)
!2317 = !DILocation(line: 1673, column: 17, scope: !2316)
!2318 = !DILocation(line: 1673, column: 5, scope: !2316)
!2319 = !DILocation(line: 1673, column: 10, scope: !2316)
!2320 = !DILocation(line: 1674, column: 3, scope: !2316)
!2321 = !DILocation(line: 1676, column: 12, scope: !2311)
!2322 = !DILocation(line: 1676, column: 5, scope: !2311)
!2323 = !DILocation(line: 1676, column: 10, scope: !2311)
!2324 = !DILocation(line: 1677, column: 2, scope: !2312)
!2325 = !DILocation(line: 1679, column: 11, scope: !2326)
!2326 = distinct !DILexicalBlock(scope: !2305, file: !16, line: 1677, column: 9)
!2327 = !DILocation(line: 1679, column: 4, scope: !2326)
!2328 = !DILocation(line: 1679, column: 9, scope: !2326)
!2329 = !DILocation(line: 1681, column: 1, scope: !2296)
!2330 = distinct !DISubprogram(name: "physics_turn_towards_vector", linkageName: "_Z27physics_turn_towards_vectorP10vms_vectorP6objecti", scope: !16, file: !16, line: 1686, type: !2331, scopeLine: 1687, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !265)
!2331 = !DISubroutineType(types: !2332)
!2332 = !{null, !1015, !26, !8}
!2333 = !DILocalVariable(name: "goal_vector", arg: 1, scope: !2330, file: !16, line: 1686, type: !1015)
!2334 = !DILocation(line: 1686, column: 46, scope: !2330)
!2335 = !DILocalVariable(name: "obj", arg: 2, scope: !2330, file: !16, line: 1686, type: !26)
!2336 = !DILocation(line: 1686, column: 67, scope: !2330)
!2337 = !DILocalVariable(name: "rate", arg: 3, scope: !2330, file: !16, line: 1686, type: !8)
!2338 = !DILocation(line: 1686, column: 76, scope: !2330)
!2339 = !DILocalVariable(name: "dest_angles", scope: !2330, file: !16, line: 1707, type: !157)
!2340 = !DILocation(line: 1707, column: 13, scope: !2330)
!2341 = !DILocalVariable(name: "cur_angles", scope: !2330, file: !16, line: 1707, type: !157)
!2342 = !DILocation(line: 1707, column: 26, scope: !2330)
!2343 = !DILocalVariable(name: "delta_p", scope: !2330, file: !16, line: 1708, type: !8)
!2344 = !DILocation(line: 1708, column: 8, scope: !2330)
!2345 = !DILocalVariable(name: "delta_h", scope: !2330, file: !16, line: 1708, type: !8)
!2346 = !DILocation(line: 1708, column: 17, scope: !2330)
!2347 = !DILocalVariable(name: "rotvel_ptr", scope: !2330, file: !16, line: 1709, type: !1015)
!2348 = !DILocation(line: 1709, column: 14, scope: !2330)
!2349 = !DILocation(line: 1709, column: 28, scope: !2330)
!2350 = !DILocation(line: 1709, column: 33, scope: !2330)
!2351 = !DILocation(line: 1709, column: 49, scope: !2330)
!2352 = !DILocation(line: 1715, column: 7, scope: !2353)
!2353 = distinct !DILexicalBlock(scope: !2330, file: !16, line: 1715, column: 6)
!2354 = !DILocation(line: 1715, column: 20, scope: !2353)
!2355 = !DILocation(line: 1715, column: 22, scope: !2353)
!2356 = !DILocation(line: 1715, column: 28, scope: !2353)
!2357 = !DILocation(line: 1715, column: 32, scope: !2353)
!2358 = !DILocation(line: 1715, column: 45, scope: !2353)
!2359 = !DILocation(line: 1715, column: 47, scope: !2353)
!2360 = !DILocation(line: 1715, column: 53, scope: !2353)
!2361 = !DILocation(line: 1715, column: 57, scope: !2353)
!2362 = !DILocation(line: 1715, column: 70, scope: !2353)
!2363 = !DILocation(line: 1715, column: 72, scope: !2353)
!2364 = !DILocation(line: 1716, column: 3, scope: !2353)
!2365 = !DILocation(line: 1719, column: 6, scope: !2366)
!2366 = distinct !DILexicalBlock(scope: !2330, file: !16, line: 1719, column: 6)
!2367 = !DILocation(line: 1719, column: 11, scope: !2366)
!2368 = !DILocation(line: 1719, column: 24, scope: !2366)
!2369 = !DILocation(line: 1720, column: 8, scope: !2366)
!2370 = !DILocation(line: 1720, column: 3, scope: !2366)
!2371 = !DILocation(line: 1722, column: 41, scope: !2330)
!2372 = !DILocation(line: 1722, column: 2, scope: !2330)
!2373 = !DILocation(line: 1723, column: 41, scope: !2330)
!2374 = !DILocation(line: 1723, column: 46, scope: !2330)
!2375 = !DILocation(line: 1723, column: 53, scope: !2330)
!2376 = !DILocation(line: 1723, column: 2, scope: !2330)
!2377 = !DILocation(line: 1725, column: 25, scope: !2330)
!2378 = !DILocation(line: 1725, column: 13, scope: !2330)
!2379 = !DILocation(line: 1725, column: 40, scope: !2330)
!2380 = !DILocation(line: 1725, column: 29, scope: !2330)
!2381 = !DILocation(line: 1725, column: 27, scope: !2330)
!2382 = !DILocation(line: 1725, column: 10, scope: !2330)
!2383 = !DILocation(line: 1726, column: 25, scope: !2330)
!2384 = !DILocation(line: 1726, column: 13, scope: !2330)
!2385 = !DILocation(line: 1726, column: 40, scope: !2330)
!2386 = !DILocation(line: 1726, column: 29, scope: !2330)
!2387 = !DILocation(line: 1726, column: 27, scope: !2330)
!2388 = !DILocation(line: 1726, column: 10, scope: !2330)
!2389 = !DILocation(line: 1728, column: 6, scope: !2390)
!2390 = distinct !DILexicalBlock(scope: !2330, file: !16, line: 1728, column: 6)
!2391 = !DILocation(line: 1728, column: 14, scope: !2390)
!2392 = !DILocation(line: 1728, column: 46, scope: !2390)
!2393 = !DILocation(line: 1728, column: 34, scope: !2390)
!2394 = !DILocation(line: 1728, column: 61, scope: !2390)
!2395 = !DILocation(line: 1728, column: 50, scope: !2390)
!2396 = !DILocation(line: 1728, column: 48, scope: !2390)
!2397 = !DILocation(line: 1728, column: 63, scope: !2390)
!2398 = !DILocation(line: 1728, column: 32, scope: !2390)
!2399 = !DILocation(line: 1728, column: 24, scope: !2390)
!2400 = !DILocation(line: 1729, column: 6, scope: !2401)
!2401 = distinct !DILexicalBlock(scope: !2330, file: !16, line: 1729, column: 6)
!2402 = !DILocation(line: 1729, column: 14, scope: !2401)
!2403 = !DILocation(line: 1729, column: 47, scope: !2401)
!2404 = !DILocation(line: 1729, column: 35, scope: !2401)
!2405 = !DILocation(line: 1729, column: 62, scope: !2401)
!2406 = !DILocation(line: 1729, column: 51, scope: !2401)
!2407 = !DILocation(line: 1729, column: 49, scope: !2401)
!2408 = !DILocation(line: 1729, column: 64, scope: !2401)
!2409 = !DILocation(line: 1729, column: 33, scope: !2401)
!2410 = !DILocation(line: 1729, column: 25, scope: !2401)
!2411 = !DILocation(line: 1730, column: 6, scope: !2412)
!2412 = distinct !DILexicalBlock(scope: !2330, file: !16, line: 1730, column: 6)
!2413 = !DILocation(line: 1730, column: 14, scope: !2412)
!2414 = !DILocation(line: 1730, column: 46, scope: !2412)
!2415 = !DILocation(line: 1730, column: 34, scope: !2412)
!2416 = !DILocation(line: 1730, column: 61, scope: !2412)
!2417 = !DILocation(line: 1730, column: 50, scope: !2412)
!2418 = !DILocation(line: 1730, column: 48, scope: !2412)
!2419 = !DILocation(line: 1730, column: 63, scope: !2412)
!2420 = !DILocation(line: 1730, column: 32, scope: !2412)
!2421 = !DILocation(line: 1730, column: 24, scope: !2412)
!2422 = !DILocation(line: 1731, column: 6, scope: !2423)
!2423 = distinct !DILexicalBlock(scope: !2330, file: !16, line: 1731, column: 6)
!2424 = !DILocation(line: 1731, column: 14, scope: !2423)
!2425 = !DILocation(line: 1731, column: 47, scope: !2423)
!2426 = !DILocation(line: 1731, column: 35, scope: !2423)
!2427 = !DILocation(line: 1731, column: 62, scope: !2423)
!2428 = !DILocation(line: 1731, column: 51, scope: !2423)
!2429 = !DILocation(line: 1731, column: 49, scope: !2423)
!2430 = !DILocation(line: 1731, column: 64, scope: !2423)
!2431 = !DILocation(line: 1731, column: 33, scope: !2423)
!2432 = !DILocation(line: 1731, column: 25, scope: !2423)
!2433 = !DILocation(line: 1733, column: 19, scope: !2330)
!2434 = !DILocation(line: 1733, column: 28, scope: !2330)
!2435 = !DILocation(line: 1733, column: 12, scope: !2330)
!2436 = !DILocation(line: 1733, column: 10, scope: !2330)
!2437 = !DILocation(line: 1734, column: 19, scope: !2330)
!2438 = !DILocation(line: 1734, column: 28, scope: !2330)
!2439 = !DILocation(line: 1734, column: 12, scope: !2330)
!2440 = !DILocation(line: 1734, column: 10, scope: !2330)
!2441 = !DILocation(line: 1736, column: 10, scope: !2442)
!2442 = distinct !DILexicalBlock(scope: !2330, file: !16, line: 1736, column: 6)
!2443 = !DILocation(line: 1736, column: 6, scope: !2442)
!2444 = !DILocation(line: 1736, column: 19, scope: !2442)
!2445 = !DILocation(line: 1736, column: 38, scope: !2442)
!2446 = !DILocation(line: 1736, column: 30, scope: !2442)
!2447 = !DILocation(line: 1737, column: 10, scope: !2448)
!2448 = distinct !DILexicalBlock(scope: !2330, file: !16, line: 1737, column: 6)
!2449 = !DILocation(line: 1737, column: 6, scope: !2448)
!2450 = !DILocation(line: 1737, column: 19, scope: !2448)
!2451 = !DILocation(line: 1737, column: 38, scope: !2448)
!2452 = !DILocation(line: 1737, column: 30, scope: !2448)
!2453 = !DILocation(line: 1739, column: 35, scope: !2330)
!2454 = !DILocation(line: 1739, column: 47, scope: !2330)
!2455 = !DILocation(line: 1739, column: 50, scope: !2330)
!2456 = !DILocation(line: 1739, column: 2, scope: !2330)
!2457 = !DILocation(line: 1740, column: 35, scope: !2330)
!2458 = !DILocation(line: 1740, column: 47, scope: !2330)
!2459 = !DILocation(line: 1740, column: 50, scope: !2330)
!2460 = !DILocation(line: 1740, column: 2, scope: !2330)
!2461 = !DILocation(line: 1741, column: 2, scope: !2330)
!2462 = !DILocation(line: 1741, column: 14, scope: !2330)
!2463 = !DILocation(line: 1741, column: 16, scope: !2330)
!2464 = !DILocation(line: 1743, column: 1, scope: !2330)
!2465 = distinct !DISubprogram(name: "phys_apply_rot", linkageName: "_Z14phys_apply_rotP6objectP10vms_vector", scope: !16, file: !16, line: 1748, type: !2269, scopeLine: 1749, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !265)
!2466 = !DILocalVariable(name: "obj", arg: 1, scope: !2465, file: !16, line: 1748, type: !26)
!2467 = !DILocation(line: 1748, column: 29, scope: !2465)
!2468 = !DILocalVariable(name: "force_vec", arg: 2, scope: !2465, file: !16, line: 1748, type: !1015)
!2469 = !DILocation(line: 1748, column: 45, scope: !2465)
!2470 = !DILocalVariable(name: "rate", scope: !2465, file: !16, line: 1750, type: !8)
!2471 = !DILocation(line: 1750, column: 6, scope: !2465)
!2472 = !DILocalVariable(name: "vecmag", scope: !2465, file: !16, line: 1750, type: !8)
!2473 = !DILocation(line: 1750, column: 12, scope: !2465)
!2474 = !DILocation(line: 1752, column: 6, scope: !2475)
!2475 = distinct !DILexicalBlock(scope: !2465, file: !16, line: 1752, column: 6)
!2476 = !DILocation(line: 1752, column: 11, scope: !2475)
!2477 = !DILocation(line: 1752, column: 25, scope: !2475)
!2478 = !DILocation(line: 1753, column: 3, scope: !2475)
!2479 = !DILocation(line: 1755, column: 22, scope: !2465)
!2480 = !DILocation(line: 1755, column: 11, scope: !2465)
!2481 = !DILocation(line: 1755, column: 32, scope: !2465)
!2482 = !DILocation(line: 1755, column: 9, scope: !2465)
!2483 = !DILocation(line: 1756, column: 6, scope: !2484)
!2484 = distinct !DILexicalBlock(scope: !2465, file: !16, line: 1756, column: 6)
!2485 = !DILocation(line: 1756, column: 13, scope: !2484)
!2486 = !DILocation(line: 1757, column: 8, scope: !2484)
!2487 = !DILocation(line: 1757, column: 3, scope: !2484)
!2488 = !DILocation(line: 1758, column: 11, scope: !2489)
!2489 = distinct !DILexicalBlock(scope: !2484, file: !16, line: 1758, column: 11)
!2490 = !DILocation(line: 1758, column: 20, scope: !2489)
!2491 = !DILocation(line: 1758, column: 25, scope: !2489)
!2492 = !DILocation(line: 1758, column: 41, scope: !2489)
!2493 = !DILocation(line: 1758, column: 46, scope: !2489)
!2494 = !DILocation(line: 1758, column: 18, scope: !2489)
!2495 = !DILocation(line: 1759, column: 8, scope: !2489)
!2496 = !DILocation(line: 1759, column: 3, scope: !2489)
!2497 = !DILocation(line: 1761, column: 17, scope: !2498)
!2498 = distinct !DILexicalBlock(scope: !2489, file: !16, line: 1760, column: 7)
!2499 = !DILocation(line: 1761, column: 22, scope: !2498)
!2500 = !DILocation(line: 1761, column: 38, scope: !2498)
!2501 = !DILocation(line: 1761, column: 44, scope: !2498)
!2502 = !DILocation(line: 1761, column: 10, scope: !2498)
!2503 = !DILocation(line: 1761, column: 8, scope: !2498)
!2504 = !DILocation(line: 1762, column: 7, scope: !2505)
!2505 = distinct !DILexicalBlock(scope: !2498, file: !16, line: 1762, column: 7)
!2506 = !DILocation(line: 1762, column: 12, scope: !2505)
!2507 = !DILocation(line: 1762, column: 17, scope: !2505)
!2508 = !DILocation(line: 1763, column: 8, scope: !2509)
!2509 = distinct !DILexicalBlock(scope: !2510, file: !16, line: 1763, column: 8)
!2510 = distinct !DILexicalBlock(scope: !2505, file: !16, line: 1762, column: 31)
!2511 = !DILocation(line: 1763, column: 13, scope: !2509)
!2512 = !DILocation(line: 1764, column: 10, scope: !2509)
!2513 = !DILocation(line: 1764, column: 5, scope: !2509)
!2514 = !DILocation(line: 1766, column: 20, scope: !2515)
!2515 = distinct !DILexicalBlock(scope: !2510, file: !16, line: 1766, column: 8)
!2516 = !DILocation(line: 1766, column: 25, scope: !2515)
!2517 = !DILocation(line: 1766, column: 9, scope: !2515)
!2518 = !DILocation(line: 1766, column: 29, scope: !2515)
!2519 = !DILocation(line: 1766, column: 35, scope: !2515)
!2520 = !DILocation(line: 1766, column: 50, scope: !2515)
!2521 = !DILocation(line: 1766, column: 55, scope: !2515)
!2522 = !DILocation(line: 1766, column: 39, scope: !2515)
!2523 = !DILocation(line: 1766, column: 59, scope: !2515)
!2524 = !DILocation(line: 1767, column: 9, scope: !2525)
!2525 = distinct !DILexicalBlock(scope: !2526, file: !16, line: 1767, column: 9)
!2526 = distinct !DILexicalBlock(scope: !2515, file: !16, line: 1766, column: 72)
!2527 = !DILocation(line: 1767, column: 14, scope: !2525)
!2528 = !DILocation(line: 1767, column: 28, scope: !2525)
!2529 = !DILocation(line: 1767, column: 44, scope: !2525)
!2530 = !DILocation(line: 1767, column: 42, scope: !2525)
!2531 = !DILocation(line: 1767, column: 54, scope: !2525)
!2532 = !DILocalVariable(name: "tval", scope: !2533, file: !16, line: 1768, type: !8)
!2533 = distinct !DILexicalBlock(scope: !2525, file: !16, line: 1767, column: 66)
!2534 = !DILocation(line: 1768, column: 10, scope: !2533)
!2535 = !DILocation(line: 1768, column: 32, scope: !2533)
!2536 = !DILocation(line: 1768, column: 31, scope: !2533)
!2537 = !DILocation(line: 1768, column: 17, scope: !2533)
!2538 = !DILocalVariable(name: "addval", scope: !2533, file: !16, line: 1769, type: !12)
!2539 = !DILocation(line: 1769, column: 10, scope: !2533)
!2540 = !DILocation(line: 1771, column: 19, scope: !2533)
!2541 = !DILocation(line: 1771, column: 15, scope: !2533)
!2542 = !DILocation(line: 1771, column: 13, scope: !2533)
!2543 = !DILocation(line: 1773, column: 12, scope: !2544)
!2544 = distinct !DILexicalBlock(scope: !2533, file: !16, line: 1773, column: 11)
!2545 = !DILocation(line: 1773, column: 21, scope: !2544)
!2546 = !DILocation(line: 1773, column: 29, scope: !2544)
!2547 = !DILocation(line: 1773, column: 34, scope: !2544)
!2548 = !DILocation(line: 1773, column: 26, scope: !2544)
!2549 = !DILocation(line: 1774, column: 13, scope: !2544)
!2550 = !DILocation(line: 1774, column: 7, scope: !2544)
!2551 = !DILocation(line: 1775, column: 42, scope: !2533)
!2552 = !DILocation(line: 1775, column: 6, scope: !2533)
!2553 = !DILocation(line: 1775, column: 11, scope: !2533)
!2554 = !DILocation(line: 1775, column: 25, scope: !2533)
!2555 = !DILocation(line: 1775, column: 39, scope: !2533)
!2556 = !DILocation(line: 1777, column: 5, scope: !2533)
!2557 = !DILocation(line: 1778, column: 4, scope: !2526)
!2558 = !DILocation(line: 1779, column: 3, scope: !2510)
!2559 = !DILocation(line: 1780, column: 8, scope: !2560)
!2560 = distinct !DILexicalBlock(scope: !2561, file: !16, line: 1780, column: 8)
!2561 = distinct !DILexicalBlock(scope: !2505, file: !16, line: 1779, column: 10)
!2562 = !DILocation(line: 1780, column: 13, scope: !2560)
!2563 = !DILocation(line: 1781, column: 10, scope: !2560)
!2564 = !DILocation(line: 1781, column: 5, scope: !2560)
!2565 = !DILocation(line: 1786, column: 30, scope: !2465)
!2566 = !DILocation(line: 1786, column: 41, scope: !2465)
!2567 = !DILocation(line: 1786, column: 46, scope: !2465)
!2568 = !DILocation(line: 1786, column: 2, scope: !2465)
!2569 = !DILocation(line: 1789, column: 1, scope: !2465)
!2570 = distinct !DISubprogram(name: "f2i", linkageName: "_Z3f2ii", scope: !9, file: !9, line: 55, type: !2571, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !265)
!2571 = !DISubroutineType(types: !2572)
!2572 = !{!12, !8}
!2573 = !DILocalVariable(name: "f", arg: 1, scope: !2570, file: !9, line: 55, type: !8)
!2574 = !DILocation(line: 55, column: 23, scope: !2570)
!2575 = !DILocation(line: 57, column: 9, scope: !2570)
!2576 = !DILocation(line: 57, column: 11, scope: !2570)
!2577 = !DILocation(line: 57, column: 2, scope: !2570)
!2578 = distinct !DISubprogram(name: "set_thrust_from_velocity", linkageName: "_Z24set_thrust_from_velocityP6object", scope: !16, file: !16, line: 1794, type: !263, scopeLine: 1795, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !265)
!2579 = !DILocalVariable(name: "obj", arg: 1, scope: !2578, file: !16, line: 1794, type: !26)
!2580 = !DILocation(line: 1794, column: 39, scope: !2578)
!2581 = !DILocalVariable(name: "k", scope: !2578, file: !16, line: 1810, type: !8)
!2582 = !DILocation(line: 1810, column: 6, scope: !2578)
!2583 = !DILocation(line: 1812, column: 2, scope: !2578)
!2584 = !DILocation(line: 1814, column: 16, scope: !2578)
!2585 = !DILocation(line: 1814, column: 21, scope: !2578)
!2586 = !DILocation(line: 1814, column: 37, scope: !2578)
!2587 = !DILocation(line: 1814, column: 42, scope: !2578)
!2588 = !DILocation(line: 1814, column: 47, scope: !2578)
!2589 = !DILocation(line: 1814, column: 63, scope: !2578)
!2590 = !DILocation(line: 1814, column: 74, scope: !2578)
!2591 = !DILocation(line: 1814, column: 79, scope: !2578)
!2592 = !DILocation(line: 1814, column: 95, scope: !2578)
!2593 = !DILocation(line: 1814, column: 73, scope: !2578)
!2594 = !DILocation(line: 1814, column: 6, scope: !2578)
!2595 = !DILocation(line: 1814, column: 4, scope: !2578)
!2596 = !DILocation(line: 1816, column: 21, scope: !2578)
!2597 = !DILocation(line: 1816, column: 26, scope: !2578)
!2598 = !DILocation(line: 1816, column: 42, scope: !2578)
!2599 = !DILocation(line: 1816, column: 50, scope: !2578)
!2600 = !DILocation(line: 1816, column: 55, scope: !2578)
!2601 = !DILocation(line: 1816, column: 71, scope: !2578)
!2602 = !DILocation(line: 1816, column: 80, scope: !2578)
!2603 = !DILocation(line: 1816, column: 2, scope: !2578)
!2604 = !DILocation(line: 1818, column: 1, scope: !2578)
