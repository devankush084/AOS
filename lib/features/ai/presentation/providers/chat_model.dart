import 'dart:io';

class ChatMessage {
  final String id;
  final String text;
  final bool isUser;
  final List<File> images;
  final String time;
  final bool isTyping; // ✅ ADD THIS

  ChatMessage({
    required this.id,
    required this.text,
    required this.isUser,
    this.images = const [],
    required this.time,
    this.isTyping = false, // ✅ DEFAULT VALUE
  });
}