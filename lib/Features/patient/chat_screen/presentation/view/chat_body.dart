import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/Features/patient/chat_screen/presentation/view/widget/app_bar_chat.dart';
import 'package:graduation_project/Features/patient/chat_screen/presentation/view/widget/chat_bubble.dart';
import 'package:graduation_project/Features/patient/chat_screen/presentation/view/widget/input_text.dart';
import '../../data/gemini_service.dart';

class ChatBody extends StatefulWidget {
  final String userName;

  const ChatBody({super.key, required this.userName});

  @override
  State<ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  final TextEditingController _messageController = TextEditingController();
  final GeminiService _geminiService = GeminiService();
  final List<Map<String, dynamic>> _messages = [];
  final ImagePicker _picker = ImagePicker();

  void _sendMessage() async {
    final message = _messageController.text.trim();
    if (message.isEmpty) return;

    setState(() {
      _messages.add({
        'text': message,
        'isMe': true,
        'timestamp': TimeOfDay.now().format(context),
        'image': null,
      });
    });
    _messageController.clear();

    try {
      final reply = await _geminiService.sendMessage(message);
      setState(() {
        _messages.add({
          'text': reply,
          'isMe': false,
          'timestamp': TimeOfDay.now().format(context),
          'image': null,
        });
      });
    } catch (e) {
      setState(() {
        _messages.add({
          'text': 'Error: ${e.toString()}',
          'isMe': false,
          'timestamp': TimeOfDay.now().format(context),
          'image': null,
        });
      });
    }
  }

  Future<void> _sendImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _messages.add({
          'text': '',
          'isMe': true,
          'timestamp': TimeOfDay.now().format(context),
          'image': File(image.path),
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: kbeigeColor),
      child: Column(
        children: [
          AppBarChat(userName: widget.userName),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: _messages.length,
              itemBuilder: (_, index) {
                final msg = _messages[index];
                return ChatBubble(
                  message: msg['text'] ?? '',
                  isMe: msg['isMe'],
                  timestamp: msg['timestamp'] ?? '',
                  image: msg['image'], // File or null
                );
              },
            ),
          ),
          InputText(
            controller: _messageController,
            onSendPressed: _sendMessage,
            onCameraPressed: _sendImage,
            onMicPressed: () {
              // You can implement recording logic here
              print('Microphone button pressed');
            },
          ),
        ],
      ),
    );
  }
}
