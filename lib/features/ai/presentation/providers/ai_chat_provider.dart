import 'dart:io';
import 'package:aos/Core/widgets/toast_message.dart';
import 'package:aos/features/ai/presentation/providers/ai_chat_state.dart';
import 'package:aos/features/ai/presentation/providers/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatProvider = StateNotifierProvider<ChatNotifier, ChatState>((ref) {
  return ChatNotifier();
});

class ChatSession {
  final String id;
  final String title;
  final List<ChatMessage> messages;
  final DateTime createdAt;

  ChatSession({
    required this.id,
    required this.title,
    required this.messages,
    required this.createdAt,
  });
}

class ChatNotifier extends StateNotifier<ChatState> {
  ChatNotifier() : super(ChatState(messages: []));

  final List<ChatSession> _history = [];
  List<ChatSession> get history => _history;

  /// 🔥 SEND MESSAGE
  void sendMessage(String text, List<File> images, BuildContext context) async {
    if (text.trim().isEmpty && images.isEmpty) {
      ToastHelper.show(context, "field can't be empty");
      return;
    }

    /// USER MESSAGE
    final userMessage = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text,
      isUser: true,
      images: images,
      time: TimeOfDay.now().format(context),
    );

    state = state.copyWith(
      messages: [...state.messages, userMessage],
    );

    /// TYPING
    final typingMessage = ChatMessage(
      id: "typing_${DateTime.now().millisecondsSinceEpoch}",
      text: "",
      isUser: false,
      isTyping: true,
      time: TimeOfDay.now().format(context),
    );

    state = state.copyWith(
      messages: [...state.messages, typingMessage],
    );

    await Future.delayed(const Duration(seconds: 2));

    /// REPLACE TYPING
    final updated = [...state.messages];
    final index = updated.indexWhere((m) => m.isTyping);

    if (index != -1) {
      updated[index] = ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: "AI reply for: $text",
        isUser: false,
        time: TimeOfDay.now().format(context),
      );
    }

    state = state.copyWith(messages: updated);

    /// SAVE CHAT
    _saveCurrentChat();
  }

  /// 🔥 SAVE CHAT (FIXED)
  void _saveCurrentChat() {
    if (state.messages.isEmpty) return;

    if (state.currentChatId == null) {
      final newSession = ChatSession(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: state.messages.first.text.length > 20
            ? state.messages.first.text.substring(0, 20)
            : state.messages.first.text,
        messages: List.from(state.messages),
        createdAt: DateTime.now(),
      );

      _history.insert(0, newSession);

      state = state.copyWith(currentChatId: newSession.id);
    } else {
      final index =
      _history.indexWhere((chat) => chat.id == state.currentChatId);

      if (index != -1) {
        _history[index] = ChatSession(
          id: _history[index].id,
          title: _history[index].title,
          messages: List.from(state.messages),
          createdAt: _history[index].createdAt,
        );
      }
    }
  }

  /// LOAD CHAT
  void loadChat(ChatSession session) {
    state = state.copyWith(
      messages: session.messages,
      currentChatId: session.id,
    );
  }

  /// DELETE CHAT
  void deleteChat(String id) {
    _history.removeWhere((chat) => chat.id == id);

    if (state.currentChatId == id) {
      clearChat();
    }
  }

  /// CLEAR CHAT
  void clearChat() {
    state = state.copyWith(
      messages: [],
      editingIndex: null,
      currentChatId: null,
    );
  }

  void clearAllHistory() {
    _history.clear();
    clearChat();
  }

  /// COPY
  void copyMessage(String text, BuildContext context) {
    Clipboard.setData(ClipboardData(text: text));
    ToastHelper.show(context, "Message copied");
  }

  /// EDIT
  void startEditing(int index) {
    state = state.copyWith(editingIndex: index);
  }

  void editMessage(String newText) {
    if (state.editingIndex == null) return;

    final updatedMessages = [...state.messages];
    final index = state.editingIndex!;
    final oldMessage = updatedMessages[index];

    updatedMessages[index] = ChatMessage(
      id: oldMessage.id,
      text: newText,
      isUser: oldMessage.isUser,
      images: oldMessage.images,
      time: oldMessage.time,
    );

    state = state.copyWith(
      messages: updatedMessages,
      editingIndex: null,
    );

    _saveCurrentChat();
  }

  /// DELETE MESSAGE
  void deleteMessage(String id) {
    state = state.copyWith(
      messages: state.messages.where((m) => m.id != id).toList(),
    );

    _saveCurrentChat();
  }
}