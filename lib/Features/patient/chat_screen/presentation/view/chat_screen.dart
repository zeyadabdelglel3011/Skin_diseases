import 'package:flutter/material.dart';
import 'chat_body.dart';

class ChatScreen extends StatelessWidget {
  final String userName;
  final String doctorId;

  const ChatScreen({
    super.key,
    required this.userName,
    required this.doctorId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ChatBody(
        userName: userName,
        doctorId: doctorId,
      ),
    );
  }
}
