import 'package:aos/Core/constants/app_dimensions.dart';
import 'package:aos/Core/utils/app_extension.dart';
import 'package:aos/config/theme/color_scheme.dart';
import 'package:aos/features/ai/presentation/providers/ai_chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatHistory extends ConsumerStatefulWidget {
  const ChatHistory({super.key});

  @override

  Widget build(BuildContext context, WidgetRef ref) {

  ConsumerState<ChatHistory> createState() => _ChatHistoryState();
}

class _ChatHistoryState extends ConsumerState<ChatHistory> {
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(chatProvider);


    final messages = chatState.messages.where((m) {
      final text = (m.text ?? "").toLowerCase();
      return text.contains(searchQuery.toLowerCase());
    }).toList();

    return Container(
      margin: EdgeInsets.only(
        top: kToolbarHeight + MediaQuery.of(context).padding.top,
      ),
      child: Drawer(
<<<<<<< HEAD
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("History").extrabold(
                    color: AppColors.fontColor, size: AppDimensions.d18.sp),
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
              onTap: () {
                ref.read(chatProvider.notifier).clearChat();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("New Chat").extrabold(
                      color: AppColors.fontColor, size: AppDimensions.d18.sp),
                  const FaIcon(
                    FontAwesomeIcons.edit,
                    color: Colors.black,
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: const Text("your History is saved here").bold(
                        color: AppColors.fontColor, size: AppDimensions.d14.sp),
                  );
                },
=======
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.grey.shade100],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// 🔥 HEADER
              Container(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("History").extrabold(
                      color: AppColors.fontColor,
                      size: AppDimensions.d18.sp,
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close),
                    )
                  ],
                ),
>>>>>>> 198a8b0 (S1 final work)
              ),

              SizedBox(height: 16.h),

              /// 🔍 SEARCH
              TextField(
                onChanged: (val) => setState(() => searchQuery = val),
                decoration: InputDecoration(
                  hintText: "Search chats...",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              SizedBox(height: 16.h),

              /// 🔥 NEW CHAT BUTTON
              GestureDetector(
                onTap: () {
                  ref.read(chatProvider.notifier).clearChat();
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 14.h,
                    horizontal: 14.w,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.deepPurple.shade400,
                        Colors.deepPurple.shade700,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(14.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepPurple.withOpacity(0.4),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("New Chat").extrabold(
                        color: Colors.white,
                        size: AppDimensions.d16.sp,
                      ),
                      const FaIcon(
                        FontAwesomeIcons.penToSquare,
                        color: Colors.white,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 16.h),

              /// 🔥 LIST
              Expanded(
                child: messages.isEmpty
                    ? _buildEmptyState()
                    : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    final isActive =
                        message.id == chatState.currentChatId;

                    return Dismissible(
                      key: ValueKey(message.id),
                      direction: DismissDirection.endToStart,
                      onDismissed: (_) {
                        ref
                            .read(chatProvider.notifier)
                            .deleteMessage(message.id);
                      },
                      background: Container(
                        margin: EdgeInsets.only(bottom: 14.h),
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 20.w),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      child: GestureDetector(
                        onLongPress: () =>
                            _showOptions(context, message.id),
                        child: AnimatedContainer(
                          duration:
                          const Duration(milliseconds: 250),
                          margin:
                          EdgeInsets.only(bottom: 14.h),
                          padding: EdgeInsets.all(14.w),
                          decoration: BoxDecoration(
                            color: isActive
                                ? Colors.deepPurple.withOpacity(0.1)
                                : Colors.white,
                            borderRadius:
                            BorderRadius.circular(14.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              /// ICON IMAGE
                              Container(
                                height: 40.h,
                                width: 40.w,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(10.r),
                                  image: const DecorationImage(
                                    image: NetworkImage(
                                      "https://cdn-icons-png.flaticon.com/512/4712/4712027.png",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              SizedBox(width: 12.w),

                              /// TEXT
                              Expanded(
                                child: Text(
                                  message.text ??
                                      "Chat message",
                                  maxLines: 2,
                                  overflow:
                                  TextOverflow.ellipsis,
                                ).bold(
                                  color:
                                  AppColors.fontColor,
                                  size:
                                  AppDimensions.d14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ).paddingAll(16),
        ),
      ),
    );
  }
<<<<<<< HEAD
}
=======

  /// 🔥 EMPTY STATE
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            "https://cdn-icons-png.flaticon.com/512/7486/7486740.png",
            height: 180,
          ),
          SizedBox(height: 20.h),
          Text("No Conversations Yet").extrabold(size: 18.sp),
          SizedBox(height: 8.h),
          Text("Start chatting to see history here ").bold(
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  /// 🔥 LONG PRESS OPTIONS
  void _showOptions(BuildContext context, String id) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent, // 🔥 important
      isScrollControlled: true,
      builder: (_) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(24.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 30,
                offset: const Offset(0, 15),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              /// 🔥 HANDLE (TOP BAR)
              Container(
                height: 5.h,
                width: 50.w,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),

              SizedBox(height: 20.h),

              /// 🔥 TITLE
              Row(
                children: [
                  Text(
                    "Chat Options",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16.h),

              /// 🔥 DELETE BUTTON (3D STYLE)
              GestureDetector(
                onTap: () {
                  ref.read(chatProvider.notifier).deleteMessage(id);
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 14.h,
                    horizontal: 12.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    gradient: LinearGradient(
                      colors: [
                        Colors.deepPurpleAccent.shade400,
                        Colors.deepPurple.shade700,
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red.withOpacity(0.4),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [

                      /// 🔥 ICON CONTAINER
                      Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.2),
                        ),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),

                      SizedBox(width: 12.w),

                      /// TEXT
                      Expanded(
                        child: Text(
                          "Delete Chat",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      /// ARROW
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 14,
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(height: 12.h),

              /// 🔥 CANCEL BUTTON
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.r),
                    color: Colors.grey.shade100,
                  ),
                  child: Center(
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10.h),
            ],
          ),
        );
      },
    );
  }
}
>>>>>>> 198a8b0 (S1 final work)
