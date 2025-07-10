import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Features/doctor/Home_screen_doctor/Presentation/Views/Widgets/patient_widget.dart';

import 'package:graduation_project/constants.dart';
import 'package:graduation_project/nav_bar.dart';
import '../../../../../doctor/Home_screen_doctor/Data/Models/hint_data.dart';
import '../../../../../doctor/Home_screen_doctor/Data/Models/medical_blog_data.dart';
import '../../../../../doctor/Home_screen_doctor/Presentation/Views/Widgets/medicines_widget.dart';
import '../../../../../doctor/create_blog_screen/data/provider/blog_provider.dart';
import '../../../../Doctors_Screen/Presentation/Views/doctors_screen.dart';
import '../../../../Medicines_Screen/Data/models/medicineData.dart';
import '../../../../Medicines_Screen/Presentation/Views/medicines_screen.dart';
import 'app_hints_widget.dart';
import 'hello_widget.dart';
import 'medical_blog_widget.dart';

class HomeScreenContent extends StatefulWidget {
  final String email;

  const HomeScreenContent({super.key, required this.email});

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  @override
  Widget build(BuildContext context) {

    final blogPosts = context.watch<BlogProvider>().blogPosts;
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: Column(
          children: [
            Hello_Widget(email: widget.email),
            const SizedBox(height: 25),
            _buildHintsList(),
            const SizedBox(height: 15),
            _buildSectionHeader(
              title: "Medical Blog",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> NavBar(index: 1,)));
              }, // TODO: Link to full blog list
            ),
            const SizedBox(height: 15),
            blogPosts.isEmpty
                ? Center(
              child: Text(
                "No recent updates",
                style: TextStyle(color: Colors.grey.shade600),
              ),
            )
                : _buildHorizontalList(
              height: 350,
              itemCount: blogPosts.length.clamp(0, 5), // limit to latest 5
              itemBuilder: (context, index) {
                final post = blogPosts[index];
                return MedicalBlogWidget(
                  title: post['title'],
                  desc: post['content'],
                  pic: post['doctorImage'],

                );
              },
            ),
            const SizedBox(height: 15),
            _buildSectionHeader(
              title: "Doctors",
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const DoctorsScreen(imagePath: '', result: {},)),
              ),
            ),
            const SizedBox(height: 15),
            _buildHorizontalList(
              height: 350,
              itemCount: doctorsData.length,
              itemBuilder: (context, index) => PatientWidget(
                title: doctorsData[index].title,
                desc: doctorsData[index].desc,
                pic: doctorsData[index].pic,
              ),
            ),
            const SizedBox(height: 15),
            _buildSectionHeader(
              title: "Medicines",
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const NavBar(index: 3)),
              ),
            ),
            const SizedBox(height: 15),
            _buildHorizontalList(
              height: 280,
              itemCount: medicinesData.length,
              itemBuilder: (context, index) => MedicinesWidget(
                title: medicinesData[index].title,
                desc: medicinesData[index].desc,
                pic: medicinesData[index].pic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHintsList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: hintData.length,
      separatorBuilder: (context, index) => const SizedBox(height: 15),
      itemBuilder: (context, index) => AppHintsWidget(
        title: hintData[index].title,
        desc: hintData[index].desc,
        pic: hintData[index].pic,
      ),
    );
  }

  Widget _buildSectionHeader({required String title, required VoidCallback onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: kprimaryColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            TextButton(
              onPressed: onTap,
              child: const Text(
                "See All",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                ),
              ),
            ),
            const Icon(Icons.chevron_right, size: 22),
          ],
        ),
      ],
    );
  }

  Widget _buildHorizontalList({
    required double height,
    required int itemCount,
    required IndexedWidgetBuilder itemBuilder,
  }) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: itemBuilder,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
      ),
    );
  }
}