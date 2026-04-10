import 'package:aos/features/ai/presentation/providers/ai_chat_provider.dart';
import 'package:aos/features/ai/presentation/providers/chat_model.dart';

class ChatState {
  final List<ChatMessage> messages;

  ChatState({required this.messages});

  ChatState copyWith({List<ChatMessage>? messages}) {
    return ChatState(
      messages: messages ?? this.messages,
    );
  }
}