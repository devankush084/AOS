import 'dart:io';

import 'package:aos/Core/widgets/toast_message.dart';
import 'package:aos/features/ai/presentation/providers/ai_chat_state.dart';
import 'package:aos/features/ai/presentation/providers/chat_model.dart';
import 'package:aos/features/ai/presentation/widgets/snackBar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatProvider = StateNotifierProvider<ChatNotifier, ChatState>((ref) {
  return ChatNotifier();
});

class ChatNotifier extends StateNotifier<ChatState> {
  ChatNotifier() : super(ChatState(messages: []));


  void sendMessage(String text, List<File> images, BuildContext context) {
    if (text.trim().isEmpty && images.isEmpty) {
      ToastHelper.show(context, "field can't be empty");
      return;
    }

    final updatedList = [
      ...state.messages,
      ChatMessage(
          text: text,
          isUser: true,
          images: images,
          time: TimeOfDay.now().format(context)),
      ChatMessage(
          text: "AI reply for: $text", isUser: false, time: "DateTime.now()"),
    ];

    state = state.copyWith(messages: updatedList);
  }

  void copyMessage(String text, BuildContext context) {
    Clipboard.setData(ClipboardData(text: text));

    ToastHelper.show(context, "Message copied");
  }

  void startEditing(int index) {
    state = state.copyWith(editingIndex: index);
  }

  void editMessage(String newText) {
    if (state.editingIndex == null) return;

    final updatedMessages = [...state.messages];
    final index = state.editingIndex!;

    final oldMessage = updatedMessages[index];

    updatedMessages[index] = ChatMessage(
      text: newText,
      isUser: oldMessage.isUser,
      images: oldMessage.images,
      time: oldMessage.time,
    );

    state = state.copyWith(
      messages: updatedMessages,
      editingIndex: null,
    );
  }




}
