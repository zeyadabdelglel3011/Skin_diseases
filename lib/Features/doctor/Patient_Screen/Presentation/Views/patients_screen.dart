import 'package:flutter/material.dart';


import '../../../../../constants.dart';


import 'Widgets/patients_screen_content.dart';

class PatientsScreen extends StatelessWidget {
  const PatientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kbeigeColor,
        body: PatientScreenContent()
    );
  }
}


