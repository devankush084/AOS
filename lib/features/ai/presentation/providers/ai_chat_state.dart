import 'package:aos/features/ai/presentation/providers/chat_model.dart';

class ChatState {
  final List<ChatMessage> messages;
  final int? editingIndex;

  ChatState({
    required this.messages,
    this.editingIndex,
  });

  ChatState copyWith({
    List<ChatMessage>? messages,
    int? editingIndex,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
      editingIndex: editingIndex,
    );
  }
}