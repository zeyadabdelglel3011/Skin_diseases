import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduation_project/Features/Splash_Screens/presentation/views/entry_screen.dart';

import '../../../../../constants.dart';

class StepThree extends StatelessWidget {
  const StepThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbeigeColor,
      body: Stack(
        children: [
          // Background swirl patterns
          Positioned(

            top: 5,
            left: 5,
            child: Image.asset('images/1.png',
              fit: BoxFit.cover,
              width: 200,
              height: 200,


            ),
          ),
          Positioned(

            bottom: -10,
            right: -10,
            child: Image.asset('images/22.png',
              fit: BoxFit.fill,
              width: 200,
              height: 200,


            ),
          ),

          // Central logo
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2,),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    // color: Colors.black,
                  ),
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "images/splash 3.png",
                        fit: BoxFit.cover,
                        height: 320,
                        width: 360,
                      ),



                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                const Text(
                  "Patient Safety First",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10,),
                const Text(
                  textAlign:TextAlign.center,
                  "Ensure the safest treatment with allergy checks and drug interaction alerts built into the system.",
                  style: TextStyle(

                    // fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const Spacer(flex: 1,),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: const WidgetStatePropertyAll(
                      Color(0xFFE85729),
                    ),
                    elevation: const WidgetStatePropertyAll(5),
                    minimumSize:const WidgetStatePropertyAll(Size(350, 60)) ,
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),),


                  ),
                  onPressed: (){
                    _navigateBetweenScreens();

                  },
                  child: const Text(
                    "Next",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
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
  _navigateBetweenScreens() async{
    await Future.delayed(const Duration(seconds: 1),);
    Get.to(()=> const EntryScreen(),
      transition: Transition.rightToLeftWithFade,
      duration: const Duration(seconds: 1),
    );
  }
}
