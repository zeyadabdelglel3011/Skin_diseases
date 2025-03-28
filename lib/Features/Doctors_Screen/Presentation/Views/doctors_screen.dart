import 'package:flutter/material.dart';
import 'package:graduation_project/Features/Doctors_Screen/Presentation/Views/Widgets/doctors_screen_content.dart';

import '../../../../constants.dart';
import '../../../Home_screen/Presentation/Views/Widgets/doctors_widget.dart';

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


