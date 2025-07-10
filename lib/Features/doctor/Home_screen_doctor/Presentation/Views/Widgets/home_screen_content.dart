import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:graduation_project/Features/doctor/Patient_Screen/Presentation/Views/patients_screen.dart';
import 'package:graduation_project/constants.dart';
import '../../../../../patient/Doctors_Screen/Presentation/Views/doctors_screen.dart';
import '../../../../../patient/Medicines_Screen/Data/models/medicineData.dart';
import '../../../../../patient/Medicines_Screen/Presentation/Views/medicines_screen.dart';
import '../../../../create_blog_screen/data/provider/blog_provider.dart';
import '../../../../medical_blog_doctor/presentation/view/medical_blog_screen.dart';
import '../../../Data/Models/hint_data.dart';
import '../../../Data/Models/medical_blog_data.dart';


import 'app_hints_widget.dart';
import 'patient_widget.dart';
import 'hello_widget.dart';
import 'medical_blog_widget.dart';
import 'medicines_widget.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hello_Widget(email: widget.email),
            const SizedBox(height: 25),

            // Hints Section
            _buildHintsList(),
            const SizedBox(height: 15),

            // Medical Blog Section
            _buildSectionHeader(
              title: "Medical Blog for doctor",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MedicalBlogScreenDoctor()),
                );
              },
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

            const SizedBox(height: 25),

            // Patients Section
            _buildSectionHeader(
              title: "Patients",
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => PatientsScreen()),
              ),
            ),
            const SizedBox(height: 15),
            _buildHorizontalList(
              height: 350,
              itemCount: patientsData.length,
              itemBuilder: (context, index) => PatientWidget(
                title: patientsData[index].title,
                desc: patientsData[index].desc,
                pic: patientsData[index].pic,
              ),
            ),
            const SizedBox(height: 25),

            // Medicines Section
            _buildSectionHeader(
              title: "Medicines",
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MedicinesScreen()),
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
