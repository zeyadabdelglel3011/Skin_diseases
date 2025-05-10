import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/Features/Splash_Screens/presentation/views/second_splash_screen.dart';
import 'package:swirl_icons/swirl_icons.dart';

import '../../../../constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late AnimationController animationController ;
  late Animation<Offset> slidingAnimation ;

  @override
  void initState(){
    super.initState();
    _navigateToHome();
  }
  _navigateToHome() async{
    await Future.delayed(const Duration(milliseconds: 4000),(){
      Get.to(()=> const SecondSplashScreen(),
      transition: Transition.cupertino,
       duration: const Duration(seconds: 4),
      );
    });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbeigeColor ,
      body: Stack(
        children: [

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

            bottom: 5,
            right: 5,
            child: Image.asset('images/11.png',
              fit: BoxFit.fill,
              width: 200,
              height: 200,


            ),
          ),

          // Central logo
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "images/logooo.png",
                    fit: BoxFit.cover,
                    height: 500,
                    width: 500,
                  ),
                ),
              ),

             // RichText(
             //     text: const TextSpan(
             //       children: [
             //         TextSpan(
             //           text: "Skin",
             //           style: TextStyle(
             //             fontSize: 28,
             //             fontWeight: FontWeight.bold,
             //              color: Colors.black,
             //           ),
             //         ),
             //
             //         TextSpan(
             //           text: " Wizard",
             //           style: TextStyle(
             //             color: kprimaryColor,
             //             fontSize: 28,
             //             fontWeight: FontWeight.bold,
             //
             //           ),
             //         ),
             //       ],
             //     ),
             // ),
            ],
          ),
        ],
      ),
    );
  }
}