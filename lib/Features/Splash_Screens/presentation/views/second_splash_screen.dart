import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduation_project/Features/Splash_Screens/presentation/views/entry_screen.dart';
import 'package:graduation_project/Features/Splash_Screens/presentation/views/widgets/on_boarding_screens.dart';


import '../../../../constants.dart';

class SecondSplashScreen extends StatefulWidget {
  const SecondSplashScreen({super.key});

  @override
  State<SecondSplashScreen> createState() => _SecondSplashScreenState();
}

class _SecondSplashScreenState extends State<SecondSplashScreen> with SingleTickerProviderStateMixin
{
  late AnimationController animationController ;
  late Animation<Offset> slidingAnimation ;

  @override
  void initState(){
    super.initState();
    animationController = AnimationController(
      vsync: this , duration: const Duration(seconds: 2),
    );
    slidingAnimation = Tween<Offset>(begin: const Offset(0, 2) , end: Offset.zero ).animate(animationController);

    animationController.forward();

   // _navigateToEntry();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();


  }



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

            bottom: 5,
            right: 5,
            child: Image.asset('images/11.png',
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
                const Spacer(flex: 3,),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "images/logooo.png",
                    fit: BoxFit.cover,
                    height: 400,
                    width: 400,
                  ),
                ),
                const SizedBox(height: 20,),
                SlideTransition(
                  position: slidingAnimation,
                  child: const Text(
                    "Welcome!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                SlideTransition(

                  position:  slidingAnimation,
                  child: const Text(
                    textAlign:TextAlign.center,
                   "Skin diseases encompass a wide range of \n conditions that affect the skin, ranging from mild \n to severe",
                    style: TextStyle(

                      // fontWeight: FontWeight.bold,
                      fontSize: 18,
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
                    minimumSize:const WidgetStatePropertyAll(Size(400, 70)) ,
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),),


                  ),
                  onPressed: (){
                    _navigateBetweenScreens();
                  },
                    child: const Text(
                      "Get Started",
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
    Get.to(()=> const OnBoardingScreens(),
    transition: Transition.rightToLeftWithFade,
      duration: const Duration(seconds: 1),
    );
  }
}
