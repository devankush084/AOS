import 'package:aos/Core/constants/app_dimensions.dart';
import 'package:aos/Core/utils/app_extension.dart';
import 'package:aos/config/theme/color_scheme.dart';
import 'package:aos/core/constants/app_images.dart';
import 'package:aos/features/courses/presentation/providers/course_video_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';

class CourseOverviewScreen extends ConsumerStatefulWidget {
  const CourseOverviewScreen({super.key});

  @override
  ConsumerState<CourseOverviewScreen> createState() =>
      _CourseOverviewScreenState();
}

class _CourseOverviewScreenState extends ConsumerState<CourseOverviewScreen> {




  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(videoProvider.notifier)
          .init('assets/videos/coding_video.mp4');
    });
  }



  String _formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(d.inMinutes.remainder(60));
    final seconds = twoDigits(d.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final isTablet = size.shortestSide >= 600;

    final state = ref.watch(videoProvider);
    final notifier = ref.read(videoProvider.notifier);
    final controller = notifier.controller;


    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.white, AppColors.scaffoldGradientCenter],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: AppColors.appBarColor,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.white,
            ).paddingOnly(left: AppDimensions.d26.w),
          ),
          title: Text("Mathematics Fundamental")
              .extrabold(color: AppColors.white, size: (isTablet ? 28 :AppDimensions.d19.sp)),
        ),
        body: SafeArea(
            child: Stack(
              children: [isTablet ?
                  SizedBox(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        SizedBox(
                          width: double.infinity,
                          height:  300.h ,
                          child: (state.isInitialized && controller != null)
                              ? GestureDetector(
                            onTap: notifier.toggleControls,

                            /// ⏪⏩ DOUBLE TAP SEEK (5 SEC)
                            onDoubleTapDown: (details) {
                              final w = MediaQuery.of(context).size.width;

                              if (details.localPosition.dx < w / 2) {
                                notifier.seekRelative(-5);
                              } else {
                                notifier.seekRelative(5);
                              }
                            },

                            child: ClipRRect(
                              borderRadius: state.isFullscreen
                                  ? BorderRadius.zero
                                  : BorderRadius.circular(20),
                              child: Stack(
                                children: [

                                  /// 🎥 VIDEO
                                  Positioned.fill(
                                    child: FittedBox(
                                      fit: BoxFit.cover,
                                      child: SizedBox(
                                        width: controller.value.size.width,
                                        height: controller.value.size.height,
                                        child: VideoPlayer(controller),
                                      ),
                                    ),
                                  ),

                                  /// 🔲 DARK OVERLAY
                                  if (state.showControls)
                                    Container(color: Colors.black.withOpacity(0.3)),

                                  /// 🔝 TOP RIGHT (SPEED + VOLUME)
                                  if (state.showControls)
                                    Positioned(
                                      top: 10,
                                      right: 10,
                                      child: Row(
                                        children: [

                                          /// ⚡ SPEED
                                          PopupMenuButton<double>(
                                            initialValue: state.speed,
                                            onSelected: notifier.setSpeed,
                                            itemBuilder: (context) => [
                                              const PopupMenuItem(value: 0.5, child: Text("0.5x")),
                                              const PopupMenuItem(value: 1.0, child: Text("1x")),
                                              const PopupMenuItem(value: 1.5, child: Text("1.5x")),
                                              const PopupMenuItem(value: 2.0, child: Text("2x")),
                                            ],
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 6),
                                              decoration: BoxDecoration(
                                                color: Colors.black54,
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              child: Row(
                                                children: [
                                                  const Icon(Icons.speed,
                                                      size: 16, color: Colors.white),
                                                  const SizedBox(width: 4),
                                                  Text("${state.speed}x",
                                                      style: const TextStyle(
                                                          color: Colors.white)),
                                                ],
                                              ),
                                            ),
                                          ),

                                          const SizedBox(width: 8),

                                          /// 🔊 VOLUME
                                          IconButton(
                                            icon: const Icon(Icons.volume_up,
                                                color: Colors.white),
                                            onPressed: notifier.toggleVolume,
                                          ),
                                        ],
                                      ),
                                    ),

                                  /// 🎯 CENTER CONTROLS (MAIN LOGIC)
                                  if (state.showControls)
                                    Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [

                                          /// ⏪ BACK
                                          IconButton(
                                            icon: Icon(Icons.replay_5,
                                                color: Colors.white.withOpacity(0.8), size: 40),
                                            onPressed: () => notifier.seekRelative(-5),
                                          ),

                                          /// ▶️ PLAY / PAUSE
                                          IconButton(
                                            icon: Icon(
                                              state.isPlaying
                                                  ? Icons.pause_circle
                                                  : Icons.play_circle,
                                              color: Colors.white,
                                              size: 60,
                                            ),
                                            onPressed: notifier.togglePlay,
                                          ),

                                          /// ⏩ FORWARD
                                          IconButton(
                                            icon: Icon(Icons.forward_5,
                                                color: Colors.white.withOpacity(0.8), size: 40),
                                            onPressed: () => notifier.seekRelative(5),
                                          ),
                                        ],
                                      ),
                                    ),

                                  /// 📊 BOTTOM CONTROLS

                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [

                                        /// ⏱ TIME + SLIDER + FULLSCREEN
                                        Row(
                                          children: [
                                            Text(
                                              _formatDuration(state.position),
                                              style: const TextStyle(color: Colors.white),
                                            ),

                                            Expanded(
                                              child: Slider(
                                                value: state.position.inSeconds
                                                    .clamp(0, state.duration.inSeconds)
                                                    .toDouble(),
                                                max: state.duration.inSeconds == 0
                                                    ? 1
                                                    : state.duration.inSeconds.toDouble(),
                                                activeColor: AppColors.appBarColor,
                                                inactiveColor: Colors.grey,
                                                onChanged: (v) => notifier.seekTo(
                                                  Duration(seconds: v.toInt()),
                                                ),
                                              ),
                                            ),

                                            Text(
                                              _formatDuration(state.duration),
                                              style: const TextStyle(color: Colors.white),
                                            ),

                                            /// ⛶ FULLSCREEN
                                            IconButton(
                                              icon: Icon(
                                                state.isFullscreen
                                                    ? Icons.fullscreen_exit
                                                    : Icons.fullscreen,
                                                color: Colors.white,
                                              ),
                                              onPressed: (){},
                                            ),
                                          ],
                                        ).paddingHorizontal(AppDimensions.d10.w),

                                        /// 🔊 VOLUME SLIDER
                                        if (state.showVolume)
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 12),
                                            child: Row(
                                              children: [
                                                const Icon(Icons.volume_down,
                                                    color: Colors.white),
                                                Expanded(
                                                  child: Slider(
                                                    value: state.volume,
                                                    min: 0,
                                                    max: 1,
                                                    activeColor: Colors.white,
                                                    onChanged: notifier.setVolume,
                                                  ),
                                                ),
                                                const Icon(Icons.volume_up,
                                                    color: Colors.white),
                                              ],
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                              : Container(
                            height: AppDimensions.d132.h,
                            width: AppDimensions.d330.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(AppDimensions.d20.r),
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.centerRight,

                                    colors: [Colors.white,Colors.black.withOpacity(0.5),Colors.white])
                            ),
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),

                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [

                            _teacherInfo(isTablet),

                            _courseInfo(isTablet)

                          ],
                        ),
                        SizedBox(height: 10,),
                        Text("Courses Overview:")
                            .extrabold(color: Colors.black, size: 34),
                        Text("Learn Python basics and how they apply to analyzing large data sets. This practical course provides a solid foundation for further studies in data science and AI.")
                            .semiBold(
                            color: AppColors.color4E4E4E, size: 20),
                        SizedBox(height: 10,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Your Progress").extrabold(
                                color: AppColors.color4E4E4E, size:20),
                            Text("70% Completed").extrabold(
                                color: AppColors.color4E4E4E, size:20),
                          ],
                        ),
                        SizedBox(height: 10,),
                        ClipRRect(
                          borderRadius:
                          BorderRadius.circular(AppDimensions.d10.r),
                          child: LinearProgressIndicator(
                            value: 0.8,
                            minHeight: AppDimensions.d10.h,
                            backgroundColor: AppColors.color917FF2,
                            valueColor: const AlwaysStoppedAnimation(
                                AppColors.colorF6500E2),
                          ),
                        ),
                        const Spacer(),

                        Expanded(
                          child: Row(
                            children: [
                              Expanded(child: _actionButton(text: "Start Learning", onTap: (){}, isTablet: isTablet)),
                              SizedBox(width: 10.w,),
                              Expanded(
                                child: SizedBox(
                                  height: AppDimensions.d53.h,
                                  width: double.infinity,
                                  child: OutlinedButton.icon(
                                    icon: Icon(
                                      Icons.file_download_outlined,
                                      color: AppColors.colorF6500E2,
                                      size: AppDimensions.d34.h,
                                    ),
                                    onPressed: () {},
                                    style: ButtonStyle(
                                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(AppDimensions.d20.r),
                                        )),
                                        side: WidgetStatePropertyAll(BorderSide(
                                            color: AppColors.colorF6500E2,
                                            width:isTablet ? 3: AppDimensions.d3.w))),
                                    label: Text("Download for Offline").extrabold(
                                        color: AppColors.colorF6500E2,
                                        size: isTablet? 20 :AppDimensions.d18.sp),
                                  ),
                                ),
                              )

                            ],
                          ),
                        ),


                      ],
                    ),

                  ).paddingHorizontal(20)
                  :
              SizedBox(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: AppDimensions.d24.h,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: state.isFullscreen
                          ? MediaQuery.of(context).size.height
                          : (isTablet ? 300.h : AppDimensions.d170.h),
                      child: (state.isInitialized && controller != null)
                          ? GestureDetector(
                        onTap: notifier.toggleControls,

                        /// ⏪⏩ DOUBLE TAP SEEK (5 SEC)
                        onDoubleTapDown: (details) {
                          final w = MediaQuery.of(context).size.width;

                          if (details.localPosition.dx < w / 2) {
                            notifier.seekRelative(-5);
                          } else {
                            notifier.seekRelative(5);
                          }
                        },

                        child: ClipRRect(
                          borderRadius: state.isFullscreen
                              ? BorderRadius.zero
                              : BorderRadius.circular(20),
                          child: Stack(
                            children: [

                              /// 🎥 VIDEO
                              Positioned.fill(
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: SizedBox(
                                    width: controller.value.size.width,
                                    height: controller.value.size.height,
                                    child: VideoPlayer(controller),
                                  ),
                                ),
                              ),

                              /// 🔲 DARK OVERLAY
                              if (state.showControls)
                                Container(color: Colors.black.withOpacity(0.3)),

                              /// 🔝 TOP RIGHT (SPEED + VOLUME)
                              if (state.showControls)
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: Row(
                                    children: [

                                      /// ⚡ SPEED
                                      PopupMenuButton<double>(
                                        initialValue: state.speed,
                                        onSelected: notifier.setSpeed,
                                        itemBuilder: (context) => [
                                          const PopupMenuItem(value: 0.5, child: Text("0.5x")),
                                          const PopupMenuItem(value: 1.0, child: Text("1x")),
                                          const PopupMenuItem(value: 1.5, child: Text("1.5x")),
                                          const PopupMenuItem(value: 2.0, child: Text("2x")),
                                        ],
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 6),
                                          decoration: BoxDecoration(
                                            color: Colors.black54,
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            children: [
                                              const Icon(Icons.speed,
                                                  size: 16, color: Colors.white),
                                              const SizedBox(width: 4),
                                              Text("${state.speed}x",
                                                  style: const TextStyle(
                                                      color: Colors.white)),
                                            ],
                                          ),
                                        ),
                                      ),

                                      const SizedBox(width: 8),

                                      /// 🔊 VOLUME
                                      IconButton(
                                        icon: const Icon(Icons.volume_up,
                                            color: Colors.white),
                                        onPressed: notifier.toggleVolume,
                                      ),
                                    ],
                                  ),
                                ),

                              /// 🎯 CENTER CONTROLS (MAIN LOGIC)
                              if (state.showControls)
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [

                                      /// ⏪ BACK
                                      IconButton(
                                        icon: Icon(Icons.replay_5,
                                            color: Colors.white.withOpacity(0.8), size: 40),
                                        onPressed: () => notifier.seekRelative(-5),
                                      ),

                                      /// ▶️ PLAY / PAUSE
                                      IconButton(
                                        icon: Icon(
                                          state.isPlaying
                                              ? Icons.pause_circle
                                              : Icons.play_circle,
                                          color: Colors.white,
                                          size: 60,
                                        ),
                                        onPressed: notifier.togglePlay,
                                      ),

                                      /// ⏩ FORWARD
                                      IconButton(
                                        icon: Icon(Icons.forward_5,
                                            color: Colors.white.withOpacity(0.8), size: 40),
                                        onPressed: () => notifier.seekRelative(5),
                                      ),
                                    ],
                                  ),
                                ),

                              /// 📊 BOTTOM CONTROLS

                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [

                                    /// ⏱ TIME + SLIDER + FULLSCREEN
                                    Row(
                                      children: [
                                        Text(
                                          _formatDuration(state.position),
                                          style: const TextStyle(color: Colors.white),
                                        ),

                                        Expanded(
                                          child: Slider(
                                            value: state.position.inSeconds
                                                .clamp(0, state.duration.inSeconds)
                                                .toDouble(),
                                            max: state.duration.inSeconds == 0
                                                ? 1
                                                : state.duration.inSeconds.toDouble(),
                                            activeColor: AppColors.appBarColor,
                                            inactiveColor: Colors.grey,
                                            onChanged: (v) => notifier.seekTo(
                                              Duration(seconds: v.toInt()),
                                            ),
                                          ),
                                        ),

                                        Text(
                                          _formatDuration(state.duration),
                                          style: const TextStyle(color: Colors.white),
                                        ),

                                        /// ⛶ FULLSCREEN
                                        IconButton(
                                          icon: Icon(
                                            state.isFullscreen
                                                ? Icons.fullscreen_exit
                                                : Icons.fullscreen,
                                            color: Colors.white,
                                          ),
                                          onPressed:(){
                                            ref.read(videoProvider.notifier).toggleFullscreen(context);

                                          },
                                        ),
                                      ],
                                    ).paddingHorizontal(AppDimensions.d10.w),

                                    /// 🔊 VOLUME SLIDER
                                    if (state.showVolume)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 12),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.volume_down,
                                                color: Colors.white),
                                            Expanded(
                                              child: Slider(
                                                value: state.volume,
                                                min: 0,
                                                max: 1,
                                                activeColor: Colors.white,
                                                onChanged: notifier.setVolume,
                                              ),
                                            ),
                                            const Icon(Icons.volume_up,
                                                color: Colors.white),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                          : Container(
                        height: AppDimensions.d132.h,
                        width: AppDimensions.d330.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppDimensions.d20.r),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.centerRight,

                                colors: [Colors.white,Colors.black.withOpacity(0.5),Colors.white])
                        ),
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppDimensions.d23.h,
                    ),


                        _teacherInfo(isTablet),
                    SizedBox(
                      height: AppDimensions.d23.h,
                    ),

                        _courseInfo(isTablet),
                    SizedBox(
                      height: AppDimensions.d19.h,
                    ),


                    Text("Courses Overview:")
                        .extrabold(color: Colors.black, size:AppDimensions.d17.sp),
                    Text("Learn Python basics and how they apply to analyzing large data sets. This practical course provides a solid foundation for further studies in data science and AI.This practical course provides a solid foundation for further studies in data science and AI")
                        .semiBold(
                        color: AppColors.color4E4E4E, size:AppDimensions.d14.sp),
                    SizedBox(
                      height: AppDimensions.d14.h,
                    ),
                    Expanded(
                      child: SizedBox(
                        child: Column(
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Your Progress").extrabold(
                                    color: AppColors.color4E4E4E, size:AppDimensions.d14.sp),
                                Text("70% Completed").extrabold(
                                    color: AppColors.color4E4E4E, size:AppDimensions.d14.sp),
                              ],
                            ),
                            SizedBox(
                              height: AppDimensions.d14.h,
                            ),
                            ClipRRect(
                              borderRadius:
                              BorderRadius.circular(AppDimensions.d10.r),
                              child: LinearProgressIndicator(
                                value: 0.8,
                                minHeight: AppDimensions.d10.h,
                                backgroundColor: AppColors.color917FF2,
                                valueColor: const AlwaysStoppedAnimation(
                                    AppColors.colorF6500E2),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    _actionButton(text: "Start Learning", onTap: (){}, isTablet: isTablet),
                    SizedBox(
                      height: AppDimensions.d14.h,
                    ),
                    SizedBox(
                      height: AppDimensions.d53.h,
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        icon: Icon(
                          Icons.file_download_outlined,
                          color: AppColors.colorF6500E2,
                          size: AppDimensions.d34.h,
                        ),
                        onPressed: () {},
                        style: ButtonStyle(
                            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(AppDimensions.d20.r),
                            )),
                            side: WidgetStatePropertyAll(BorderSide(
                                color: AppColors.colorF6500E2,
                                width: AppDimensions.d3.w))),
                        label: Text("Download for Offline").extrabold(
                            color: AppColors.colorF6500E2,
                            size: AppDimensions.d18.sp),
                      ),
                    ),
                    if (state.isFullscreen && controller != null)
                      Positioned.fill(
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: SizedBox.expand( // 🔥 FULL SCREEN FORCE
                            child: FittedBox(
                              fit: BoxFit.cover, // 🔥 REMOVE BLACK SPACE
                              child: SizedBox(
                                width: controller.value.size.height, // 🔁 swapped
                                height: controller.value.size.width, // 🔁 swapped
                                child: VideoPlayer(controller),
                              ),
                            ),
                          ),
                        ),
                      ),

                  ],
                ),
              ).paddingHorizontal(AppDimensions.d30.w),]
            )
        )
      ),
    );
  }

  Widget _teacherInfo(bool isTablet ){
  return  Row(mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(   crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Mathematics Fundamental")
                .extrabold(color: Colors.black,size:isTablet ? 28: AppDimensions.d19.sp),
            Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: isTablet ? 30 :AppDimensions.d15.r,
                  child: Image.asset(AppImages.courseTeacher),
                ),
                SizedBox(width: 30,),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Dr. John Smith").bold(
                        color: AppColors.fontColor,
                        size: isTablet? 20:  AppDimensions.d10.sp  ),
                    Text("4.8 Rating | 12.5k Students").bold(
                        color: AppColors.fontColor,
                        size: isTablet ? 20 : AppDimensions.d10.sp),

                  ],
                )

              ],
            ),
            SizedBox(
              width: AppDimensions.d12.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [



              ],
            )
          ],
        )

      ],
    );
  }
  Widget _courseInfo(bool isTablet) {
    return Container(
      height: isTablet ? 100.h : AppDimensions.d75.h,
      width: isTablet ? 500 : double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isTablet ? 24 : AppDimensions.d16.w,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: AppColors.colorF2F2F2,
        borderRadius: BorderRadius.circular(AppDimensions.d20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: AppDimensions.d4.r,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child: _infoItem(Icons.calendar_today, "6 Weeks", "Duration", isTablet)),
         VerticalDivider(),

          Expanded(child: _infoItem(FontAwesomeIcons.bookOpen, "24 Lessons", "Level", isTablet)),
          VerticalDivider(),
          Expanded(child: _infoItem(Icons.language, "English", "Language", isTablet)),
        ],
      ),
    );
  }
  Widget _infoItem(IconData icon, String title, String subtitle, bool isTablet) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon,
            size: isTablet ? 20 : AppDimensions.d14.h,
            color: AppColors.appBarColor),
        SizedBox(height: 6),
        Text(title).extrabold(
          color: Colors.black,
          size: isTablet ? 14 : AppDimensions.d14.sp,
        ),
        Text(subtitle).semiBold(
          color: AppColors.fontColor,
          size: isTablet ? 14 : AppDimensions.d9.sp,
        ),
      ],
    );
  }

  Widget _actionButton({
    required String text,
    required VoidCallback onTap,
    IconData? icon,
    bool isPrimary = true,
    required bool isTablet,
  }) {
    double scale = isTablet ? 1.2 : 1;

    return SizedBox(
      height: AppDimensions.d53.h,
      width: double.infinity,
      child: icon == null
          ? OutlinedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            isPrimary ? AppColors.colorF6500E2 : Colors.transparent,
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(AppDimensions.d20.r),
            ),
          ),
        ),
        child: Text(text).extrabold(
          color: isPrimary
              ? AppColors.white
              : AppColors.colorF6500E2,
          size: isTablet ? 20 : AppDimensions.d20.sp,
        ),
      )
          : OutlinedButton.icon(
        icon: Icon(
          icon,
          color: AppColors.colorF6500E2,
          size: AppDimensions.d34.h * scale,
        ),
        onPressed: onTap,
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(AppDimensions.d20.r),
            ),
          ),
          side: WidgetStatePropertyAll(
            BorderSide(
              color: AppColors.colorF6500E2,
              width: AppDimensions.d3.w,
            ),
          ),
        ),
        label: Text(text).extrabold(
          color: AppColors.colorF6500E2,
          size: AppDimensions.d18.sp * scale,
        ),
      ),
    );
  }
}
