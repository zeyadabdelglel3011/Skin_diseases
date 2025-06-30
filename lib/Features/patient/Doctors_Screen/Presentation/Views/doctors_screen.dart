import 'package:flutter/material.dart';


import '../../../../../constants.dart';


import 'Widgets/doctors_screen_content.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kbeigeColor,
        body: DoctorsScreenContent(),
    );
  }
}


