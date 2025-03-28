
import 'dart:io';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../Doctors_Screen/Presentation/Views/doctors_screen.dart';

class DisplayImageScreen extends StatelessWidget {
  final String imagePath;

  const DisplayImageScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: kbeigeColor,
      body: Stack(
        children:
        [
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 15),
                  child: Row(
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
                          Navigator.pop(context);
                        },
                          icon:const Icon(Icons.arrow_back,
                            color: Colors.black54,
                          ) ,
                        ),
                      ),
                      const Text(
                        "Result",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(width: 50,),
                    ],
                  ),
                ),
                const SizedBox(height: 50,),
                Container(
                  width: 300,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: imagePath.isNotEmpty
                      ? Image.file(File(imagePath,),fit: BoxFit.cover,)
                      : const Text('No image selected'),
                ),
                const SizedBox(height: 70,),
                const Column(

                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Atomic Dermatitis 70%",
                                style: TextStyle(
                                  color: kprimaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              TextSpan(
                                text: " (Eczema)",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                        ),
                      ],
                    ),
                     SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Shingles 20% ",
                                style: TextStyle(
                                  color: kprimaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              TextSpan(
                                text: "(Herpes Zoster)",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Hives 10%",
                                style: TextStyle(
                                  color: kprimaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              TextSpan(
                                text: " (Urticaria)",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(
                  flex: 2,
                ),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(kprimaryColor),
                    padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 50 , vertical: 15),),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6),),),),
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const DoctorsScreen(),),);
                  },
                  child: const Text(
                    "Share With A Doctor",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
