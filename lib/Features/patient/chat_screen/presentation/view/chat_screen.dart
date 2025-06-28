import 'package:flutter/material.dart';

import 'chat_body.dart';

class ChatScreen extends StatelessWidget {
  // ChatScreen now needs to accept userName
  final String userName; // Add this field

  const ChatScreen({super.key, required this.userName}); // Update constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent, // Ensure this matches your app's background
        body: ChatBody(userName: userName), // Pass userName to ChatBody
       );
    }
}