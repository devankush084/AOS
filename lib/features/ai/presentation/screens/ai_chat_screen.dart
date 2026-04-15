  import 'package:aos/Core/constants/app_dimensions.dart';
  import 'package:aos/Core/constants/app_images.dart';
  import 'package:aos/Core/utils/app_extension.dart';
  import 'package:aos/config/theme/color_scheme.dart';
  import 'package:aos/features/ai/presentation/providers/ai_chat_provider.dart';
  import 'package:aos/features/ai/presentation/providers/image_pick_provider.dart';
  import 'package:aos/features/ai/presentation/providers/text_to_speech_model.dart';
  import 'package:aos/features/ai/presentation/providers/text_to_speech_provider.dart';
  import 'package:aos/features/ai/presentation/screens/speech_to_text_screen.dart';
import 'package:aos/features/ai/presentation/widgets/chat_history.dart';
  import 'package:aos/features/ai/presentation/widgets/dialog_box.dart';
  import 'package:aos/features/ai/presentation/widgets/suggestion_chip_widget.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter_riverpod/flutter_riverpod.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

  class AiChatScreen extends ConsumerStatefulWidget {
    const AiChatScreen({super.key});

    @override
    ConsumerState<AiChatScreen> createState() => _AiChatScreenState();
  }

  class _AiChatScreenState extends ConsumerState<AiChatScreen> {
    final TextEditingController messageController = TextEditingController();
    final TextEditingController editController = TextEditingController();

    int? selectedIndex;
    int? editingIndex;
    final bool isSent = true;
    bool _showScrollToBottom = false;
    bool _isUserAtBottom = true;
    final ScrollController _scrollController = ScrollController();
    @override
    void initState() {
      super.initState();

      _scrollController.addListener(() {
        if (!_scrollController.hasClients) return;

        final maxScroll = _scrollController.position.maxScrollExtent;
        final currentScroll = _scrollController.position.pixels;

        _isUserAtBottom = currentScroll >= maxScroll - 50;

        // Show button
        if (!_isUserAtBottom) {
          if (!_showScrollToBottom) {
            setState(() => _showScrollToBottom = true);
          }
        } else {
          if (_showScrollToBottom) {
            setState(() => _showScrollToBottom = false);
          }
        }
      });
    }

    @override
    void dispose() {
      messageController.dispose();
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {

      ref.listen(chatProvider, (previous, next) {
        if (previous?.messages.length != next.messages.length) {

          final wasAtBottom = _isUserAtBottom;

          if (wasAtBottom) {
            Future.delayed(const Duration(milliseconds: 60), () {
              if (!_scrollController.hasClients) return;

              _scrollController.jumpTo(
                _scrollController.position.maxScrollExtent,
              );
            });
          } else {
            setState(() {
              _showScrollToBottom = true;
            });
          }
        }
      });

      ref.listen<SpeechState>(speechProvider, (previous, next) {
        if (previous?.recognizedText != next.recognizedText &&
            next.recognizedText.isNotEmpty) {
          messageController.text = next.recognizedText;

          messageController.selection = TextSelection.fromPosition(
            TextPosition(offset: messageController.text.length),
          );
        }
      });

      final chatState = ref.watch(chatProvider);
      final imagePicker = ref.watch(imagePickerProvider);
      final speech = ref.watch(speechProvider);
      final chatNotifier = ref.read(chatProvider.notifier);

      return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: [AppColors.white, AppColors.backgroundColor],
          ),
        ),
        child: Scaffold(
          drawer: const ChatHistory(),
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            actions: [
               GestureDetector(
                   onTap: (){
                     ref.read(chatProvider.notifier).clearChat();
                   },


                   child: FaIcon(FontAwesomeIcons.edit,color: Colors.white,).paddingOnly(right: 20))

            ],
            backgroundColor: AppColors.appBarColor,
            title: const Text("Yana Ai tutor")
                .bold(color: AppColors.white, size: AppDimensions.d20.sp),
            centerTitle: true,
            leading: Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.menu, color: AppColors.white),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),

          ),
          body: SafeArea(
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.all(16),
                        itemCount: chatState.messages.length,
                        itemBuilder: (context, index) {
                          final msg = chatState.messages[index];

                          return Align(
                            alignment: msg.isUser
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: msg.isUser
                                  ? CrossAxisAlignment.end
                                  : CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onLongPress: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: AppDimensions.d6.h),
                                    padding: const EdgeInsets.all(12),
                                    constraints: BoxConstraints(
                                        maxWidth: AppDimensions.d280.w),
                                    decoration: BoxDecoration(
                                      color: msg.isUser
                                          ? AppColors.chatMessageColor
                                              .withOpacity(0.8)
                                          : AppColors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft:
                                            Radius.circular(AppDimensions.d20.r),
                                        topRight:
                                            Radius.circular(AppDimensions.d20.r),
                                        bottomLeft: msg.isUser
                                            ? Radius.circular(AppDimensions.d20.r)
                                            : Radius.circular(AppDimensions.d0.r),
                                        bottomRight: msg.isUser
                                            ? Radius.circular(AppDimensions.d0.r)
                                            : Radius.circular(
                                                AppDimensions.d20.r),
                                      ),
                                      border: msg.isUser
                                          ? null
                                          : Border.all(
                                              color: AppColors.borderColor),
                                      boxShadow: msg.isUser
                                          ? []
                                          : [
                                              BoxShadow(
                                                color:
                                                    Colors.black.withOpacity(0.2),
                                                blurRadius: 4,
                                                offset: const Offset(0, 4),
                                              )
                                            ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (msg.images.isNotEmpty)
                                          Wrap(
                                            spacing: 6,
                                            runSpacing: 6,
                                            children:
                                                msg.images.map<Widget>((img) {
                                              return ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.file(
                                                  img,
                                                  height: AppDimensions.d120.h,
                                                  width: AppDimensions.d120.w,
                                                  fit: BoxFit.cover,
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        if (msg.text.isNotEmpty) ...[
                                          if (msg.images.isNotEmpty)
                                            SizedBox(height: AppDimensions.d6.h),
                                          chatState.editingIndex == index && msg.isUser
                                              ? TextField(
                                            controller: editController,
                                            autofocus: true,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: AppDimensions.d16.sp,
                                            ),
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                            ),
                                            onSubmitted: (value) {
                                              chatNotifier.editMessage(value);
                                            },
                                          )
                                              : Text(
                                            msg.text,
                                            style: TextStyle(
                                              color: msg.isUser ? Colors.white : Colors.black,
                                              fontSize: AppDimensions.d16.sp,
                                            ),
                                          ),
                                        ],
                                      ],
                                    ),
                                  ),
                                ),
                                if (selectedIndex == index && msg.isUser)
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 4),
                                    child: OptionContainer(
                                      onCopy: () {
                                        chatNotifier.copyMessage(
                                          chatState.messages[index].text,
                                          context,
                                        );

                                        setState(() {
                                          selectedIndex = null;
                                        });
                                      },
                                      onEdit: () {
                                        final message = chatState.messages[index];

                                        chatNotifier.startEditing(index);

                                        editController.text = message.text; // 👈 use THIS controller

                                        setState(() {
                                          selectedIndex = null;
                                        });
                                      },
                                    ),
                                  ),
                                if (msg.isUser)
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    spacing: 10,
                                    children: [
                                      Text(
                                        msg.time,
                                        style: TextStyle(
                                          fontSize: AppDimensions.d12.sp,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Icon(
                                          isSent
                                              ? Icons.done_all
                                              : Icons.error_outline,
                                          size: 15,
                                          color: isSent
                                              ? AppColors.fontColor
                                              : Colors.red)
                                    ],
                                  ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                    if (chatState.messages.isEmpty) ...[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: SuggestionWrap(
                          onSuggestionTap: (text) {
                            ref
                                .read(chatProvider.notifier)
                                .sendMessage(text, [], context);
                          },
                        ),
                      ),
                      SizedBox(height: AppDimensions.d30.h),
                    ],
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                            BorderRadius.circular(AppDimensions.d10.r),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: AppDimensions.d10.w,
                            vertical: AppDimensions.d8.h,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (imagePicker.images.isNotEmpty)
                                SizedBox(
                                  height: AppDimensions.d80.h,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: imagePicker.images.length,
                                    itemBuilder: (context, index) {
                                      final file = imagePicker.images[index];

                                      return Stack(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(right: 8),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(
                                                  AppDimensions.d8.r),
                                              child: Image.file(
                                                file,
                                                height: AppDimensions.d70.h,
                                                width: AppDimensions.d70.h,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 0,
                                            right: 0,
                                            child: GestureDetector(
                                              onTap: () => ref
                                                  .read(imagePickerProvider.notifier)
                                                  .removeImage(index),
                                              child: CircleAvatar(
                                                radius: AppDimensions.d9.r,
                                                backgroundColor: Colors.black54,
                                                child: const Icon(
                                                  Icons.close,
                                                  size: 12,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),

                              if (imagePicker.images.isNotEmpty)
                                SizedBox(height: AppDimensions.d4.h),

                              /// 🔥 ONLY HEIGHT FIX HERE
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  minHeight: AppDimensions.d50.h,
                                  maxHeight: imagePicker.images.isNotEmpty
                                      ? AppDimensions.d120.h
                                      : AppDimensions.d55.h,
                                ),
                                child: TextField(
                                  controller: messageController,
                                  maxLines: null, // 🔥 important for expansion
                                  keyboardType: TextInputType.multiline,
                                  decoration: InputDecoration(
                                    hintText:
                                    "Ask Yana Ai anything about your lesson",
                                    hintStyle: TextStyle(
                                      fontSize: AppDimensions.d13.sp,
                                      color: AppColors.fontColor,
                                    ),
                                    suffixIcon: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.attach_file,
                                              color: Color(0xCC8459FE)),
                                          onPressed: () {
                                            ref
                                                .read(imagePickerProvider.notifier)
                                                .pickFromGallery();
                                            FocusScope.of(context).unfocus();
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            speech.isListening
                                                ? Icons.mic
                                                : Icons.mic_none,
                                            color: const Color(0xCC8459FE),
                                          ),
                                          onPressed: () async {
                                            ref
                                                .read(speechProvider.notifier)
                                                .startListening();

                                            await showDialog(
                                              context: context,
                                              barrierDismissible: false,
                                              builder: (context) =>
                                              const SpeechDialog(),
                                            );

                                            ref
                                                .read(speechProvider.notifier)
                                                .stopListening();
                                          },
                                        ),
                                      ],
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(width: AppDimensions.d15.w),

                      GestureDetector(
                        onTap: () {
                          final notifier = ref.read(chatProvider.notifier);
                          final state = ref.read(chatProvider);

                          if (state.editingIndex != null) {
                            notifier.editMessage(editController.text);
                          } else {
                            notifier.sendMessage(
                                messageController.text,
                                imagePicker.images,
                                context);
                          }

                          messageController.clear();
                          ref.read(imagePickerProvider.notifier).clearImages();
                        },
                        child: Container(
                          height: AppDimensions.d55.h,
                          width: AppDimensions.d50.w,
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(AppDimensions.d10.r),
                            gradient: const LinearGradient(colors: [
                              Color(0xCC8459FE),
                              Color(0xFF4F3598),
                            ]),
                          ),
                          child: Image.asset(
                            AppImages.sendButton,
                          ).paddingAll(10),
                        ),
                      )
                    ],
                  ).paddingOnly(left: 20.w, right: 20.w, bottom: 10.h),
                ),
                if(_showScrollToBottom )
                Positioned(
                  bottom: 100.h,
                  right: 25.w,
                  child: FloatingActionButton(
                    mini: true,
                    backgroundColor: AppColors.appBarColor,
                    onPressed: () {
                      if (_scrollController.hasClients) {
                        _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeOut,
                        );
                      }
                    },
                    child: const Icon(Icons.keyboard_arrow_down),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
