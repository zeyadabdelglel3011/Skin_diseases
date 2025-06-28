import 'package:flutter/material.dart';
import 'package:graduation_project/Features/doctor/Medicines_details_doctor/Presentation/Views/medicines_details_doctor.dart';

import '../../../../../../constants.dart';
import '../../../../../patient/Medicines_details/Presentation/Views/medicines_details.dart';


class AllMedicinesDoctor extends StatelessWidget {
  const AllMedicinesDoctor({super.key, required this.pic, required this.title, required this.desc});

  final String pic , title , desc ;



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        width: 250,
        height: 400,
        decoration: BoxDecoration(
          color: const Color(0xffD1C1B2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            children:[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    pic , width: 230,
                    height: 80,
                    fit: BoxFit.fill,
                    alignment: Alignment.center,

                  ),
                  const SizedBox(height: 10,),
                  Text(
                    title ,
                    style: const TextStyle(
                      fontSize: 16 ,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10,),




                ],
              ),
              Positioned(
                width: 150,
                bottom: -5,
                left: 6,
                child: ElevatedButton(

                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MedicinesDetailsDoctor(
                          title: title,
                          imagePath: pic,
                        ),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: const WidgetStatePropertyAll(kprimaryColor),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius:BorderRadius.circular(8),  ), ),
                    minimumSize: const WidgetStatePropertyAll(
                      Size.fromHeight(32),
                    ),



                  ),
                  child: const Text(
                    "View Details",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
