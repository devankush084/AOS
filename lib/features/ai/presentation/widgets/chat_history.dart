import 'package:aos/Core/constants/app_dimensions.dart';
import 'package:aos/Core/utils/app_extension.dart';
import 'package:aos/config/theme/color_scheme.dart';
import 'package:aos/features/ai/presentation/providers/ai_chat_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ChatHistory extends ConsumerWidget {
  const ChatHistory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final chatState = ref.watch(chatProvider);

    return Container(
      margin:  EdgeInsets.only(
        top: kToolbarHeight + MediaQuery.of(context).padding.top,
      ),
      child: Drawer(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(

          ),
        ),
        child: Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("History")
                    .extrabold(color: AppColors.fontColor, size: AppDimensions.d18.sp),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close, color: Colors.black),
                )
              ],
            ),

            SizedBox(height: AppDimensions.d20.h),
            GestureDetector(

              onTap: (){

                ref.read(chatProvider.notifier).clearChat();
              },
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("New Chat").extrabold(color: AppColors.fontColor, size: AppDimensions.d18.sp),
                  const FaIcon(FontAwesomeIcons.edit,color: Colors.black,)
                ],
              ),
            ),


            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return  ListTile(
                    title: const Text("your History is saved here"
                        ).bold(color: AppColors.fontColor,size: AppDimensions.d14.sp),
                  );
                },
              ),
            )
          ],
        ).paddingAll(20),
      ),
    );
  }
}