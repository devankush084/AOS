import 'package:aos/Core/constants/app_dimensions.dart';
import 'package:aos/Core/utils/app_extension.dart';
import 'package:aos/config/theme/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MyBooksScreen extends ConsumerStatefulWidget {
  const MyBooksScreen({super.key});

  @override
  ConsumerState<MyBooksScreen> createState() => _MyBooksScreenState();
}

class _MyBooksScreenState extends ConsumerState<MyBooksScreen> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.shortestSide >= 600;
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

            },
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.white,
            ).paddingOnly(left: AppDimensions.d26.w),
          ),
          title: Text("My Books").extrabold(color: AppColors.white, size: (isTablet ? 28 :AppDimensions.d19.sp)),
        ),
        body: SafeArea(child: SizedBox(
          child: Column(
            children: [
              SizedBox(height: AppDimensions.d10.h,),
              SearchBar(
                leading: Icon(Icons.search,
                    color: AppColors.fontColor),
                hintText: "Search Courses",
              ),
              SizedBox(height: AppDimensions.d10.h,),
              isTablet ?
              Expanded(
                child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 10,crossAxisSpacing: 10),itemCount: 6, itemBuilder: (context,index){
                  return Container(
                    height: 200.h,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(AppDimensions.d20.r)
                    ),

                    child: Column(
                      children: [
                        Container(

                          height: 100.h,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(AppDimensions.d20.r)
                            )
                        ),
                        Text("Mathematics"),
                        Text("12C Chapters")
                      ],


                    ).paddingAll(5),
                  );

                }),
              ) :
              Expanded(
                child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10),itemCount: 6, itemBuilder: (context,index){
                  return Container(
                    height: 200.h,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(AppDimensions.d20.r)
                    ),

                    child: Column(
                      children: [
                        Container(

                            height: 100.h,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(AppDimensions.d20.r)
                            )
                        ),
                        Text("Mathematics"),
                        Text("12C Chapters")
                      ],


                    ).paddingAll(5),
                  );

                }),
              )

            ],
          ),
        ).paddingHorizontal(10.w)),
      ),
    );
  }
}
