import 'package:flutter/material.dart';
import 'package:graduation_project/Features/Medicines_Screen/Data/models/medicineData.dart';
import 'package:graduation_project/Features/Medicines_Screen/Presentation/Views/medicines_screen.dart';
import 'package:graduation_project/constants.dart';

class MedicinesDetailsContent extends StatelessWidget {
  const MedicinesDetailsContent({super.key, });



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbeigeColor,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15 , horizontal: 25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: kprimaryColor,
                        ),
                      ),
                      child: IconButton(onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MedicinesScreen(),) ,);
                      },
                        icon:const Icon(Icons.arrow_back,
                          color: Colors.black54,
                        ) ,
                      ),
                    ),
                     Text(
                      "",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),

                    ),
                    const SizedBox(width: 50,),
                  ],
                ),
              ],
            ),
          ),
      ),
    );
  }
}
