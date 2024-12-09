import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduation_project/Features/Splash_Screens/presentation/views/widgets/step_three.dart';

import '../../../../../constants.dart';

class StepTwo extends StatelessWidget {
  const StepTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbeigeColor,
      body: Stack(
        children: [
          // Background swirl patterns
          Opacity(
            opacity: .5,
            child: Positioned(

              top: 5,
              left: 5,
              child: Image.asset('images/1.png',
                fit: BoxFit.cover,
                width: 200,
                height: 200,


              ),
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
                        "images/splash2.png",
                        fit: BoxFit.cover,
                        height: 320,
                        width: 360,
                      ),



                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                const Text(
                  "Personalized Treatment Plans",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10,),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    textAlign:TextAlign.center,
                    "Create and adjust care plans tailored to each patient's unique needs and skin conditions.",
                    style: TextStyle(

                      // fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black54,
                    ),
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
    Get.to(()=> const StepThree(),
      transition: Transition.rightToLeftWithFade,
      duration: const Duration(seconds: 1),
    );
  }
}
