import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../../constants.dart';
import '../../data/chat_provider.dart';
import '../../data/gemini_service.dart';
import '../view/widget/app_bar_chat.dart';
import '../view/widget/chat_bubble.dart';
import '../view/widget/input_text.dart';

class ChatBody extends StatefulWidget {
  final String userName;
  final String doctorId;
  final File? imageFile;
  final String? imageResult;

  const ChatBody({
    super.key,
    required this.userName,
    required this.doctorId,
    this.imageFile,
    this.imageResult,
  });

  @override
  State<ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  final TextEditingController _messageController = TextEditingController();
  final GeminiService _geminiService = GeminiService();
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();

    // Send initial image and result as a message
    if (widget.imageFile != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final provider = Provider.of<ChatProvider>(context, listen: false);
        final time = TimeOfDay.now().format(context);

        provider.addMessage(
          widget.doctorId,
          ChatMessage(
            text: widget.imageResult ?? '',
            isMe: true,
            timestamp: time,
            image: widget.imageFile,
          ),
        );
      });
    }
  }

  Future<void> _sendMessage() async {
    final message = _messageController.text.trim();
    if (message.isEmpty) return;

    final provider = Provider.of<ChatProvider>(context, listen: false);
    final time = TimeOfDay.now().format(context);

    // Add user message
    provider.addMessage(
      widget.doctorId,
      ChatMessage(
        text: message,
        isMe: true,
        timestamp: time,
        image: null,
      ),
    );

    _messageController.clear();

    try {
      final reply = await _geminiService.sendMessage(message);

      provider.addMessage(
        widget.doctorId,
        ChatMessage(
          text: reply,
          isMe: false,
          timestamp: TimeOfDay.now().format(context),
          image: null,
        ),
      );
    } catch (e) {
      provider.addMessage(
        widget.doctorId,
        ChatMessage(
          text: 'Error: ${e.toString()}',
          isMe: false,
          timestamp: time,
          image: null,
        ),
      );
    }
  }

  Future<void> _sendImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final provider = Provider.of<ChatProvider>(context, listen: false);
      provider.addMessage(
        widget.doctorId,
        ChatMessage(
          text: '',
          isMe: true,
          timestamp: TimeOfDay.now().format(context),
          image: File(image.path),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ChatProvider>(context);
    final messages = provider.getMessagesForDoctor(widget.doctorId);

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: kbeigeColor),
      child: Column(
        children: [
          AppBarChat(userName: widget.userName),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: messages.length,
              itemBuilder: (_, index) {
                final msg = messages[index];
                return ChatBubble(
                  message: msg.text,
                  isMe: msg.isMe,
                  timestamp: msg.timestamp,
                  image: msg.image,
                );
              },
            ),
          ),

          InputText(
            controller: _messageController,
            onSendPressed: _sendMessage,
            onCameraPressed: _sendImage,
            onMicPressed: () {
              print('Microphone button pressed');
            },
          ),
        ],
      ),
    );
  }
}
