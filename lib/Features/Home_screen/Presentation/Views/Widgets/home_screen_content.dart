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
      // scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25 , vertical: 15),
          child: Column(
            children: [
               Hello_Widget(email: widget.email,),
              const SizedBox(height: 25,),
              // vertical
              ListView.separated(
                separatorBuilder: (context , index)=> const SizedBox(height: 15,),
                shrinkWrap: true,
                physics:  const NeverScrollableScrollPhysics(),
                itemCount: hintData.length,
                  itemBuilder: (context , index) =>
                      AppHintsWidget(

                        title: hintData[index].title,
                        desc: hintData[index].desc,
                        pic:hintData[index].pic ,
                  ),
              ),
              const SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Medical Blog",
                    style: TextStyle(
                      color: kprimaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(

                    children: [
                      TextButton(onPressed: (){},
                        child: const Text(
                          "See All",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.chevron_right,
                        size: 22,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15,),
               // horizontal
               SizedBox(
                 height: 350,
                 child: ListView.separated(
                   shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                     itemBuilder: (context , index) =>
                         MedicalBlogWidget(
                       pic: medicalData[index].pic,
                           desc: medicalData[index].desc,
                           title: medicalData[index].title,),
                     separatorBuilder: (context , index)=> const SizedBox(width: 10,),
                     itemCount: medicalData.length,
                 ),
               ),
              const SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Doctors",
                    style: TextStyle(
                      color: kprimaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(

                    children: [
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorsScreen(), ),);
                      },
                        child: const Text(
                          "See All",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.chevron_right,
                        size: 22,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15,),
             SizedBox(
                height: 350,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context , index) =>
                      DoctorsWidget(
                        pic: doctorsData[index].pic,
                        desc: doctorsData[index].desc,
                        title: doctorsData[index].title,),
                  separatorBuilder: (context , index)=> const SizedBox(width: 10,),
                  itemCount: doctorsData.length,
                ),
              ),
              const SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Medicines",
                    style: TextStyle(
                      color: kprimaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(

                    children: [
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context ) => const MedicinesScreen() ),);
                      },
                        child: const Text(
                          "See All",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.chevron_right,
                        size: 22,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15,),
              SizedBox(
                height: 280,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context , index) =>
                      MedicinesWidget(
                        pic: medicinesData[index].pic,
                        desc: medicinesData[index].desc,
                        title: medicinesData[index].title,),
                  separatorBuilder: (context , index)=> const SizedBox(width: 10,),
                  itemCount: medicinesData.length,
                ),
              ),


            ],
          ),
        ),
      ) ,
    );
  }
}






