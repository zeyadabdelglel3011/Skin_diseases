import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Features/doctor/Medicines_Screen_doctor/Presentation/Views/medicines_screen.dart';

import 'package:graduation_project/constants.dart';
import 'package:graduation_project/Features/doctor/Home_screen_doctor/Presentation/Views/home_screen.dart';
import 'package:graduation_project/Features/doctor/create_blog_screen/presentation/view/creat_blog_screen.dart';
import 'package:graduation_project/Features/doctor/profile_doctor/presentation/view/profile_doctor_screen.dart';
import '../patient/Medicines_Screen/Presentation/Views/medicines_screen.dart';
import '../patient/medical_blog/presentation/view/medical_blog_screen.dart';

class NavBarDoctor extends StatefulWidget {
  final String? email;
  final String? name;
  final int index;

  const NavBarDoctor({
    super.key,
    this.email,
    this.name,
    this.index = 0,
  });

  @override
  State<NavBarDoctor> createState() => _NavBarDoctorState();
}

class _NavBarDoctorState extends State<NavBarDoctor> {
  late int currentIndex;
  late List<Widget> selectedPages;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.index;

    selectedPages = [
      HomeScreenDoctor(email: widget.email ?? ""),
      const MedicalBlogScreen(),
      const CreateBlogScreen(),
      const MedicinesScreenDoctor(),
      ProfileDoctorScreen(email: widget.email ?? ""),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: selectedPages[currentIndex],
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
            const SizedBox(width: 40), // Space for FAB
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
          Icons.add,
          color: Colors.white,
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
