import 'dart:io';

import 'package:aos/features/ai/presentation/providers/ai_chat_state.dart';
import 'package:aos/features/ai/presentation/providers/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final chatProvider = StateNotifierProvider<ChatNotifier, ChatState>((ref) {
  return ChatNotifier();
});

class ChatNotifier extends StateNotifier<ChatState> {
  ChatNotifier() : super(ChatState(messages: []));

  void sendMessage(String text, List<File> images,BuildContext context) {
    if (text.trim().isEmpty && images.isEmpty) return;

    final updatedList = [
      ...state.messages,
      ChatMessage(
        text: text,
        isUser: true,
        images: images,
        time: TimeOfDay.now().format(context)
      ),
      ChatMessage(
        text: "AI reply for: $text",
        isUser: false,
        time: "DateTime.now()"
      ),
    ];

    state = state.copyWith(messages: updatedList);


  }}
