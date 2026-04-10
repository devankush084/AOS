import 'dart:io';
import 'dart:ui';
import 'package:aos/Core/constants/app_images.dart';
import 'package:aos/Core/utils/app_extension.dart';
import 'package:aos/config/theme/color_scheme.dart';
import 'package:aos/features/ai/presentation/providers/ai_chat_provider.dart';
import 'package:aos/features/ai/presentation/providers/image_pick_provider.dart';
import 'package:aos/features/ai/presentation/providers/text_to_speect_provider.dart';
import 'package:aos/features/ai/presentation/widgets/dialog_box.dart';
import 'package:aos/features/ai/presentation/widgets/suggestion_chip_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aos/features/ai/presentation/providers/text_to_speech_state.dart';

class AiChatScreen extends ConsumerStatefulWidget {
  const AiChatScreen({super.key});

  @override
  ConsumerState<AiChatScreen> createState() => _AiChatScreenState();
}

class _AiChatScreenState extends ConsumerState<AiChatScreen> {
  final TextEditingController messageController = TextEditingController();
  int? selectedIndex;


  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(chatProvider);
    final imagePicker = ref.watch(imagePickerProvider);
    // final speechState = ref.watch(speechProvider);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        title:
        const Text("Yana Ai tutor").bold(color: AppColors.white, size: 20),
        centerTitle: true,
        leading: const Icon(
          Icons.arrow_back,
          color: AppColors.white,
        ).paddingOnly(left: 30),
      ),
      body: Stack(
        children: [Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.white,

                AppColors.backgroundColor
              ],
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: chatState.messages.length,
                  itemBuilder: (context, index) {
                    final msg = chatState.messages[index];

                    return Align(
                      alignment:
                      msg.isUser ? Alignment.centerRight : Alignment.centerLeft,
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
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              padding: const EdgeInsets.all(12),
                              constraints: const BoxConstraints(maxWidth: 280),
                              decoration: BoxDecoration(
                                color: msg.isUser
                                    ? AppColors.chatMessageColor.withOpacity(0.8)
                                    : AppColors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: const Radius.circular(20),
                                  topRight: const Radius.circular(20),
                                  bottomLeft: msg.isUser
                                      ? const Radius.circular(20)
                                      : const Radius.circular(0),
                                  bottomRight: msg.isUser
                                      ? const Radius.circular(0)
                                      : const Radius.circular(20),
                                ),
                                border: msg.isUser
                                    ? null
                                    : Border.all(color: AppColors.borderColor),
                                boxShadow: msg.isUser
                                    ? []
                                    : [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 4,
                                    offset: const Offset(0, 4),
                                  )
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (msg.images.isNotEmpty)
                                    Wrap(
                                      spacing: 6,
                                      runSpacing: 6,
                                      children: msg.images.map<Widget>((img) {
                                        return ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.file(
                                            img,
                                            height: 120,
                                            width: 120,
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      }).toList(),
                                    ),

                                  if (msg.text.isNotEmpty) ...[
                                    if (msg.images.isNotEmpty)
                                      const SizedBox(height: 6),
                                    Text(
                                      msg.text,
                                      style: TextStyle(
                                        color: msg.isUser
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ),

                          if (selectedIndex == index && msg.isUser)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: OptionContainer(
                                onCopy: () {
                                  setState(() {
                                    selectedIndex = null;
                                  });
                                },
                                onEdit: () {
                                  setState(() {
                                    selectedIndex = null;
                                  });
                                },
                              ),
                            ),
                          if (msg.isUser)

                            Padding(
                              padding: const EdgeInsets.only(right: 8, top: 2),
                              child: Text(
                                msg.time,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),

              ),



              if (chatState.messages.isEmpty) ...[
                const SizedBox(height: 20),
                SuggestionWrap(
                  onSuggestionTap: (text){
                    ref.read(chatProvider.notifier).sendMessage(text, [],context);
                  },
                ),
                const SizedBox(height: 20),
              ],



              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.end,
              //   children: [
              //     Expanded(
              //       child: Container(
              //         decoration: BoxDecoration(
              //           color: AppColors.white,
              //           borderRadius: BorderRadius.circular(10),
              //         ),
              //         padding: const EdgeInsets.symmetric(
              //             horizontal: 10, vertical: 8),
              //         child: Column(
              //           mainAxisSize: MainAxisSize.min,
              //           children: [
              //             if (imagePicker.images.isNotEmpty)
              //               SizedBox(
              //                 height: 80,
              //                 child: ListView.builder(
              //                   scrollDirection: Axis.horizontal,
              //                   itemCount:
              //                   imagePicker.images.length,
              //                   itemBuilder: (context, index) {
              //                     final file =
              //                     imagePicker.images[index];
              //
              //                     return Stack(
              //                       children: [
              //                         Container(
              //                           margin:
              //                           const EdgeInsets.only(
              //                               right: 8),
              //                           child: ClipRRect(
              //                             borderRadius:
              //                             BorderRadius
              //                                 .circular(8),
              //                             child: Image.file(
              //                               file,
              //                               height: 70,
              //                               width: 70,
              //                               fit: BoxFit.cover,
              //                             ),
              //                           ),
              //                         ),
              //                         Positioned(
              //                           top: 0,
              //                           right: 0,
              //                           child: GestureDetector(
              //                             onTap: () => ref
              //                                 .read(
              //                                 imagePickerProvider
              //                                     .notifier)
              //                                 .removeImage(index),
              //                             child:
              //                             const CircleAvatar(
              //                               radius: 9,
              //                               backgroundColor:
              //                               Colors.black54,
              //                               child: Icon(
              //                                 Icons.close,
              //                                 size: 12,
              //                                 color: Colors.white,
              //                               ),
              //                             ),
              //                           ),
              //                         ),
              //                       ],
              //                     );
              //                   },
              //                 ),
              //               ),
              //
              //             if (imagePicker.images.isNotEmpty)
              //               const SizedBox(height: 6),
              //
              //             ConstrainedBox(
              //               constraints: const BoxConstraints(
              //                 minHeight: 40,
              //                 maxHeight: 100,
              //               ),
              //               child: TextField(
              //                 controller: messageController,
              //                 maxLines: null,
              //                 keyboardType:
              //                 TextInputType.multiline,
              //                 decoration: InputDecoration(
              //                   hintText:
              //                   "Ask Yana Ai anything about your lesson",
              //                   hintStyle: const TextStyle(
              //                     fontSize: 13,
              //                     color: AppColors.fontColor,
              //                   ),
              //                   suffixIcon: Row(
              //                     mainAxisSize:
              //                     MainAxisSize.min,
              //                     children: [
              //                       IconButton(
              //                         icon: const Icon(
              //                             Icons.attach_file,
              //                             color:
              //                             Color(0xCC8459FE)),
              //                         onPressed: () {
              //                           ref
              //                               .read(
              //                               imagePickerProvider
              //                                   .notifier)
              //                               .pickFromGallery();
              //                           FocusScope.of(context)
              //                               .unfocus();
              //                         },
              //                       ),
              //                       IconButton(
              //                         icon: const Icon(
              //                           Icons.mic,
              //                           color: Color(0xCC8459FE),
              //                         ),
              //                         onPressed: () {
              //
              //                         },
              //                       ),
              //                     ],
              //                   ),
              //                   border: InputBorder.none,
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //
              //     const SizedBox(width: 15),
              //
              //     GestureDetector(
              //       onTap: () {
              //         final text =
              //         messageController.text.trim();
              //
              //         if (text.isEmpty &&
              //             imagePicker.images.isEmpty) return;
              //
              //         final imagesToSend =
              //         List<File>.from(
              //             imagePicker.images);
              //
              //         ref
              //             .read(chatProvider.notifier)
              //             .sendMessage(
              //             text, imagesToSend,context);
              //
              //         messageController.clear();
              //         ref
              //             .read(
              //             imagePickerProvider.notifier)
              //             .clearImages();
              //       },
              //       child: Container(
              //         height: 60,
              //         width: 50,
              //         decoration: BoxDecoration(
              //           borderRadius:
              //           BorderRadius.circular(10),
              //           gradient:
              //           const LinearGradient(colors: [
              //             Color(0xCC8459FE),
              //             Color(0xFF4F3598),
              //           ]),
              //         ),
              //         child: Image.asset(
              //           AppImages.sendButton,
              //         ).paddingAll(10),
              //       ),
              //     )
              //   ],
              // ).paddingOnly(left: 20, right: 20, bottom: 20),

              Positioned(
                  left: 20,
                  right: 20,
                  bottom: 20,

                  child: _floatingInputRow(imagePicker))
            ],
          ),
        )],
      ),
    );
  }
  Widget _floatingInputRow(imagePicker) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15), // 👈 transparent
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              // TEXTFIELD + IMAGES
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    if (imagePicker.images.isNotEmpty)
                      SizedBox(
                        height: 80,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: imagePicker.images.length,
                          itemBuilder: (context, index) {
                            final file = imagePicker.images[index];

                            return Container(
                              margin: const EdgeInsets.only(right: 8),
                              child: Image.file(
                                file,
                                height: 70,
                                width: 70,
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                      ),

                    TextField(
                      controller: messageController,
                      maxLines: null,
                      decoration: const InputDecoration(
                        hintText: "Ask anything...",
                        border: InputBorder.none,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 10),

              // 🔥 SEND BUTTON (NOW FLOATING TOO)
              GestureDetector(
                onTap: () {
                  final text = messageController.text.trim();

                  if (text.isEmpty && imagePicker.images.isEmpty) return;

                  ref.read(chatProvider.notifier)
                      .sendMessage(text, imagePicker.images, context);

                  messageController.clear();
                  ref.read(imagePickerProvider.notifier).clearImages();
                },
                child: Container(
                  height: 55,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(colors: [
                      Color(0xCC8459FE),
                      Color(0xFF4F3598),
                    ]),
                  ),
                  child: Image.asset(AppImages.sendButton).paddingAll(10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}