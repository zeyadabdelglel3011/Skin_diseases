import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Features/Home_screen/Presentation/Views/home_screen.dart';
import 'package:graduation_project/Features/Medicines_Screen/Presentation/Views/medicines_screen.dart';
import 'package:graduation_project/Features/Scan_Screen/Presentation/Views/scan_screen.dart';

import 'package:graduation_project/constants.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key, this.email});
  final String? email;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> selectedPage = [
      HomeScreen(email: widget.email),
      const Center(
        child: Text(
          "medical blog",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      // const MedicalBlogScreen(),
      const ScanScreen(),
      const MedicinesScreen(),
      const Center(
        child: Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
    ];

    return Scaffold(
      body: selectedPage[currentIndex],
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 60,
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () => setState(() => currentIndex = 0),
              icon: Icon(
                Icons.home_outlined,
                size: 30,
                color: currentIndex == 0 ? kprimaryColor : Colors.grey.shade400,
              ),
            ),
            IconButton(
              onPressed: () => setState(() => currentIndex = 1),
              icon: Icon(
                Icons.list_alt_outlined,
                size: 30,
                color: currentIndex == 1 ? kprimaryColor : Colors.grey.shade400,
              ),
            ),
            IconButton(
              onPressed: () => setState(() => currentIndex = 3),
              icon: Icon(
                Icons.medical_information_outlined,
                size: 30,
                color: currentIndex == 3 ? kprimaryColor : Colors.grey.shade400,
              ),
            ),
            IconButton(
              onPressed: () => setState(() => currentIndex = 4),
              icon: Icon(
                CupertinoIcons.person,
                size: 30,
                color: currentIndex == 4 ? kprimaryColor : Colors.grey.shade400,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => currentIndex = 2),
        shape: const CircleBorder(),
        backgroundColor: kprimaryColor,
        child: const Icon(
          Icons.document_scanner,
          color: Colors.white,
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
