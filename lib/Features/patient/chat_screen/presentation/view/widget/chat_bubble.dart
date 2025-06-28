import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graduation_project/Features/patient/form_screen/presentation/views/form_screen.dart';
import 'package:graduation_project/constants.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.message,
    required this.isMe,
    required this.timestamp,
    this.image,
  });

  final String message;
  final bool isMe;
  final String timestamp;
  final File? image;

  @override
  Widget build(BuildContext context) {
    final lines = message.split('\n');

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: isMe ? kprimaryColor : const Color(0xffD1C1B2),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(35),
            topRight: const Radius.circular(35),
            bottomLeft: Radius.circular(isMe ? 35 : 0),
            bottomRight: Radius.circular(isMe ? 0 : 35),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                if (lines.length >= 3) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FormScreen(),
                    ),
                  );
                  print('Message tapped: $message');
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (image != null) ...[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.file(
                        image!,
                        width: 220,
                        height: 220,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                  if (message.isNotEmpty)
                    ...lines.map((line) {
                      final index = lines.indexOf(line);
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: Text(
                          line,
                          style: TextStyle(
                            fontSize: 18,
                            color: isMe ? Colors.white : Colors.black,
                            decoration: index == 2
                                ? TextDecoration.underline
                                : TextDecoration.none,
                          ),
                        ),
                      );
                    }).toList(),
                ],
              ),
            ),
            const SizedBox(height: 6),
            Text(
              timestamp,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: isMe ? Colors.white70 : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
