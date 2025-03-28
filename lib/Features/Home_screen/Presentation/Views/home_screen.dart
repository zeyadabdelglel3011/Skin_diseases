import 'package:flutter/material.dart';
import 'package:graduation_project/Features/Home_screen/Presentation/Views/Widgets/home_screen_content.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: kbeigeColor,
      body: HomeScreenContent(),

    );
  }
}
