import 'package:aos/Core/constants/app_dimensions.dart';
import 'package:aos/config/routes/app_router.dart';
import 'package:aos/config/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/constants/app_images.dart';
import '../providers/onboarding_provider.dart';

class OnboardingScreen extends ConsumerWidget {
  OnboardingScreen({super.key});

  final PageController _controller = PageController();

  final List<Map<String, String>> data = [
    {
      "image": AppImages.onboarding1,
      "title": "Your Life ID",
      "desc":
      "Track your progress, achievements, and learning journey securely.",
    },
    {
      "image": AppImages.onboarding2,
      "title": "Meet Yana AI",
      "desc": "Ask. Learn. Grow — with AI support anytime.",
    },
    {
      "image": AppImages.onboarding3,
      "title": "Smart Learning Experience",
      "desc": "Interactive lessons. Real progress. Real results.",
    },
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.shortestSide >= 600;

    final index = ref.watch(onboardingProvider);
    final controller = ref.read(onboardingProvider.notifier);

    return Scaffold(
      body: Stack(
        children: [

          /// 🔥 BACKGROUND
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF6C63FF),
                  Color(0xFF7F7AFB),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),


          const Positioned(
              top: 80,
              left: 40,
              child: Icon(Icons.star, color: Colors.white, size: 16)),
          const Positioned(
              top: 90,
              left: 120,
              child: Icon(Icons.star_border, color: Colors.white, size: 16)),
          const Positioned(
              top: 85,
              right: 120,
              child: Icon(Icons.star, color: Colors.white, size: 16)),
          const Positioned(
              top: 95,
              right: 40,
              child: Icon(Icons.star_border, color: Colors.white, size: 16)),

          /// 🔥 CONTENT
          SafeArea(
            child: PageView.builder(
              controller: _controller,
              itemCount: data.length,
              onPageChanged: controller.setIndex,
              itemBuilder: (context, i) {
                return Column(
                  children: [

                  isTablet ? SizedBox(height: 20,):SizedBox(height: 80.h,),


                    SizedBox(
                      height: isTablet
                          ? size.height * 0.45
                          : size.height * 0.5,
                      child: Image.asset(
                        data[i]["image"]!,
                        fit: BoxFit.contain,
                      ),
                    ),

                    SizedBox(height: isTablet ? 20 : 10),

                    /// 🔘 DOTS
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                      List.generate(data.length, (dotIndex) {
                        return AnimatedContainer(
                          duration:
                          const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 4),
                          width: index == dotIndex ? 18 : 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: index == dotIndex
                                ? Colors.white
                                : Colors.white54,
                            borderRadius:
                            BorderRadius.circular(10),
                          ),
                        );
                      }),
                    ),
                    isTablet ? Spacer() : SizedBox(height: AppDimensions.d57.h,),




                    /// 🔥 CARD
                    Expanded(
                      child: Center(
                        child: Container(
                          width: isTablet ? 500 : double.infinity,
                          margin: EdgeInsets.symmetric(
                            horizontal: isTablet ? 0 : 20,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: isTablet ? 32 : 24,
                            vertical: isTablet ? 10 : 24,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.circular(30),
                            boxShadow: isTablet
                                ? [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.1),
                                blurRadius: 20,
                                offset:
                                const Offset(0, 10),
                              )
                            ]
                                : [],
                          ),

                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [

                              /// TITLE
                              Text(
                                data[i]["title"]!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize:
                                  isTablet ? 20 : 22.sp,
                                  fontWeight:
                                  FontWeight.bold,
                                  color: isTablet
                                      ? const Color(0xFF6500E2)
                                      : const Color(0xFF6500E2),
                                ),
                              ),

                              SizedBox(
                                  height:
                                  isTablet ? 16 : 12),

                              /// DESC
                              Text(
                                data[i]["desc"]!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize:
                                  isTablet ? 14 : 17.sp,
                                  color: Colors.black54,
                                ),
                              ),

                              SizedBox(
                                  height:
                                  isTablet ? 10  : 24),

                              /// 🔥 BUTTON
                              GestureDetector(
                                onTap: () {
                                  controller.next(
                                    data.length,
                                        () =>
                                        Navigator.pushReplacementNamed(
                                            context,
                                            AppNames
                                                .welcome),
                                  );

                                  if (index !=
                                      data.length - 1) {
                                    _controller.nextPage(
                                      duration:
                                      const Duration(
                                          milliseconds:
                                          300),
                                      curve: Curves
                                          .easeInOut,
                                    );
                                  }
                                },
                                child: Container(
                                  height:
                                  isTablet ? 60 : 55,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    gradient:
                                    const LinearGradient(
                                      colors: [
                                        Color(0xFF5F2EEA),
                                        Color(0xFF7B61FF),
                                      ],
                                    ),
                                    borderRadius:
                                    BorderRadius
                                        .circular(50),
                                  ),
                                  child: Center(
                                    child: Text(
                                      index ==
                                          data.length -
                                              1
                                          ? "Get Started"
                                          : "Next",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: isTablet
                                            ? 14
                                            : 21.sp,
                                        fontWeight:
                                        FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: isTablet ? 30 : 0),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}