import 'dart:io';

class ChatMessage {
  final String text;
  final bool isUser;
  final List<File> images;
  final String time;

  ChatMessage({
    required this.text,
    required this.isUser,
    this.images = const [],
    required this.time,
  });
}