import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';

class InputText extends StatelessWidget {
  const InputText({
    super.key,
    required this.controller,
    required this.onSendPressed,
    required this.onCameraPressed,
    required this.onMicPressed,
  });

  final TextEditingController controller;
  final VoidCallback onSendPressed;
  final VoidCallback onCameraPressed;
  final VoidCallback onMicPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.15),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              minLines: 1,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'Type a message...',
                hintStyle: TextStyle(color: Colors.black54),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.add_a_photo_outlined, color: Colors.black),
            onPressed: onCameraPressed,
            tooltip: 'Send Image',
          ),
          IconButton(
            icon: const Icon(Icons.mic_none_outlined, color: Colors.black),
            onPressed: onMicPressed,
            tooltip: 'Send Voice',
          ),
          IconButton(
            icon: const Icon(Icons.send, color: kprimaryColor),
            onPressed: onSendPressed,
            tooltip: 'Send Text',
          ),
        ],
      ),
    );
  }
}
