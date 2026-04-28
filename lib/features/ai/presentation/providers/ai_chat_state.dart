import 'package:aos/features/ai/presentation/providers/chat_model.dart';

class ChatState {
  final List<ChatMessage> messages;
  final int? editingIndex;
  final String? currentChatId;
  ChatState({
    required this.messages,
    this.editingIndex,
    this.currentChatId,
  });

  ChatState copyWith({
    List<ChatMessage>? messages,
    int? editingIndex,
    String? currentChatId,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
      editingIndex: editingIndex ?? this.editingIndex,
      currentChatId: currentChatId ?? this.currentChatId,
    );
  }
}