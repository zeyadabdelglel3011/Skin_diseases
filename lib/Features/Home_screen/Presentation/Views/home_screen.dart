import 'package:flutter/material.dart';
import 'package:graduation_project/Features/Home_screen/Presentation/Views/Widgets/home_screen_content.dart';
import 'package:graduation_project/constants.dart';
// import 'package:graduation_project/nav_bar.dart'; // Uncomment if needed

class HomeScreen extends StatelessWidget {
  final String? email;

  const HomeScreen({super.key, this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbeigeColor,
      body: HomeScreenContent(
        email: email ?? '',
      ),
      // bottomNavigationBar: NavBar(), // Uncomment if using a bottom nav bar
    );
  }
}
