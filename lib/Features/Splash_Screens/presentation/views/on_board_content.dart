import 'package:flutter/material.dart';

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.pic,
    required this.title,
    required this.text,
  });

  final String pic, title, text;

  @override
  Widget build(BuildContext context) {
    return Stack(

      children:[

        Center(
        child: Column(
          children: [

            Expanded(
              child: Image.asset(
                pic,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    ],
    );
  }
}