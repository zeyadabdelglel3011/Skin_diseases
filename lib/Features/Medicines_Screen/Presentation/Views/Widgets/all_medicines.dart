import 'package:flutter/material.dart';
import 'package:graduation_project/Features/Medicines_Screen/Data/models/medicineData.dart';

import '../../../../../constants.dart';
import '../../../../Medicines_details/Presentation/Views/medicines_details.dart';

class AllMedicines extends StatelessWidget {
  const AllMedicines({super.key, required this.pic, required this.title, required this.desc});

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
                left: 13,
                child: ElevatedButton(

                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  MedicinesDetails( ),),);
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
