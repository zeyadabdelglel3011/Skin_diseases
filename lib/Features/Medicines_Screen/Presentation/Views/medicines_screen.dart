import 'package:flutter/material.dart';

import 'package:graduation_project/Features/Home_screen/Presentation/Views/home_screen.dart';
import 'package:graduation_project/Features/Medicines_Screen/Presentation/Views/Widgets/all_medicines.dart';
import 'package:graduation_project/constants.dart';

import '../../Data/models/medicineData.dart';

class MedicinesScreen extends StatelessWidget {
  const MedicinesScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: kbeigeColor,
        title:  const Text(
          "Medicines",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),

        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: kbeigeColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25 , vertical: 15),
            child: Column(
              children: [


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 320,
                    height: 45,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "search for medicine....",
                        prefixIcon: const Icon(Icons.search , color: Colors.black,),
                        contentPadding: const EdgeInsets.symmetric(vertical: 10),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),

                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: kprimaryColor,
                            width: 1.5,
                          ),
                        ),
                        focusedBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: kprimaryColor,
                            width: 1.5,
                          ),
                        ),

                      ),
                    ),
                  ),
                  Container(
                    width:45,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: kprimaryColor,
                        width: 1.5,
                      ),
                    ),
                    child: const Icon(Icons.filter_alt_outlined,


                    ),
                  ),
                ],
              ),
                const SizedBox(height: 25,),
                SizedBox(
                  height:800,
                  child: GridView.builder(
                    itemCount: medicinesData.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 , mainAxisSpacing: 15 , crossAxisSpacing: 15),
                      itemBuilder: (context , index) => AllMedicines
                        (pic: medicinesData[index].pic, title:  medicinesData[index].title, desc:  medicinesData[index].desc)
                  ),
                ),
              ],
            ),
          ),
      ),
        ),
    );
  }
}
