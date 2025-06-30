import 'dart:io';
import 'package:flutter/material.dart';

class ChatMessage {
  final String text;
  final bool isMe;
  final String timestamp;
  final File? image;

  ChatMessage({
    required this.text,
    required this.isMe,
    required this.timestamp,
    this.image,
  });
}

class ChatProvider extends ChangeNotifier {
  final Map<String, List<ChatMessage>> _doctorMessages = {};

  List<ChatMessage> getMessagesForDoctor(String doctorId) {
    return _doctorMessages[doctorId] ?? [];
  }

  void addMessage(String doctorId, ChatMessage message) {
    _doctorMessages.putIfAbsent(doctorId, () => []);
    _doctorMessages[doctorId]!.add(message);
    notifyListeners();
  }

  void clearMessages(String doctorId) {
    _doctorMessages.remove(doctorId);
    notifyListeners();
  }
}
