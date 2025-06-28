import 'package:flutter/material.dart';
import 'package:graduation_project/Features/Doctors_Screen/Presentation/Views/doctors_screen.dart';
import 'package:graduation_project/Features/Home_screen/Data/Models/hint_data.dart';
import 'package:graduation_project/Features/Home_screen/Data/Models/medical_blog_data.dart';
import 'package:graduation_project/Features/Home_screen/Presentation/Views/Widgets/doctors_widget.dart';
import 'package:graduation_project/Features/Home_screen/Presentation/Views/Widgets/medicines_widget.dart';
import 'package:graduation_project/Features/Medicines_Screen/Presentation/Views/medicines_screen.dart';
import 'package:graduation_project/constants.dart';
import '../../../../Medicines_Screen/Data/models/medicineData.dart';
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
              onTap: () {}, // TODO: Link to full blog list
            ),
            const SizedBox(height: 15),
            _buildHorizontalList(
              height: 350,
              itemCount: medicalData.length,
              itemBuilder: (context, index) => MedicalBlogWidget(
                title: medicalData[index].title,
                desc: medicalData[index].desc,
                pic: medicalData[index].pic,
              ),
            ),
            const SizedBox(height: 15),
            _buildSectionHeader(
              title: "Doctors",
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => DoctorsScreen()),
              ),
            ),
            const SizedBox(height: 15),
            _buildHorizontalList(
              height: 350,
              itemCount: doctorsData.length,
              itemBuilder: (context, index) => DoctorsWidget(
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
