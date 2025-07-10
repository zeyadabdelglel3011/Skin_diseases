import 'dart:io';

import 'package:flutter/material.dart';
import 'chat_body.dart';

class ChatScreen extends StatelessWidget {
  final String userName;
  final String doctorId;
  final File? imageFile;
  final String? imageResult;

  const ChatScreen({
    super.key,
    required this.userName,
    required this.doctorId,
    this.imageFile,
    this.imageResult,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatBody(
        userName: userName,
        doctorId: doctorId,
        imageFile: imageFile,
        imageResult: imageResult,
      ),
    );
  }
}
