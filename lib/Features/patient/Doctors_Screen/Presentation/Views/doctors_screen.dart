import 'package:flutter/material.dart';


import '../../../../../constants.dart';


import 'Widgets/doctors_screen_content.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({super.key, required this.imagePath, this.result});
  final String imagePath;
  final Map<String, dynamic>? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbeigeColor,
      body: DoctorsScreenContent(
        imagePath: imagePath,
        result: result,
      ),
    );
  }
}


