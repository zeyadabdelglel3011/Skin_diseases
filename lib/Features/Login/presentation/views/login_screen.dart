import 'package:flutter/material.dart';
import 'package:graduation_project/Features/Forget_Password/Presentation/views/forget_pass_screen.dart';
import 'package:graduation_project/Features/Home_screen/Presentation/Views/home_screen.dart';
import 'package:graduation_project/nav_bar.dart';

import '../../../../constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Color btnColor = Colors.black ;
  void changeColor() {
    setState(() {
      btnColor = (btnColor == Colors.black) ? kprimaryColor : Colors.black;
    });
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: kbeigeColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children:
          [
            Positioned(
              right: -120,
              top: -90,
              child: Container(
                width: 400,
                height: 400,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            // white beige
            Positioned(
              right: 60,
              top: -90,
              child: Container(
                width: 400,
                height: 400,
                decoration: const BoxDecoration(
                  color: Color(0xffDAC9B6),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: -120,
              top: -90,
              child: Container(
                width: 400,
                height: 400,
                decoration: const BoxDecoration(
                  color: Color(0xffCEB395),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Padding(
            padding: const EdgeInsets.symmetric(vertical: 80,  ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin:  const EdgeInsets.symmetric(horizontal: 20),
                  // padding: EdgeInsets.symmetric(horizontal: 20),
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
                const SizedBox(height: 50,),
                Container(
                  margin:  const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text(
                    "Welcome Back !",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  margin:  const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text(
                    'Sign in-up to enjoy the best managing experience',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const SizedBox(height: 20,),

                // The white container for text form fields
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50),

                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                          padding: EdgeInsets.only(left: 25,
                            top: 25,

                          ),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                        child: Form(child: Column(
                          children: [

                            const SizedBox(height: 20,),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: "Email",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20,),
                            TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: "password",

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                  IconButton(
                                    onPressed: changeColor,
                                      icon: Icon(
                                        Icons.check_box_rounded,
                                        color: btnColor,
                                      ),
                                  ),
                                    const Text(
                                      'Remember Me ',
                                      style: TextStyle(
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 10,),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const ForgetPassScreen()),);
                                  },

                                  child: const Text(
                                    'Forget Password?',
                                    style: TextStyle(
                                      color: kprimaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),


                            const SizedBox(height: 40,),
                            Container(
                              height: 55,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: kprimaryColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const NavBar(),),);
                                },
                                child: const Center(
                                  child: Text("Create Account",style: TextStyle(color: Colors.white,
                                      fontSize: 22),),
                                ),
                              ),
                            ),


                            const SizedBox(height: 40,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 190,
                                  height: 2,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                                const Text(
                                  'or',style: TextStyle(fontSize: 16),),
                                Container(
                                  width: 190,
                                  height: 2,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10,),

                            // social media
                            Column(
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 300,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.shade400,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: GestureDetector(
                                    onTap: (){},
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.asset("images/go.png",
                                          fit: BoxFit.cover,
                                          height: 40,
                                        ),
                                        const Text(
                                          'Sign up with Google',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Container(
                                  width: 300,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.shade400,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: GestureDetector(
                                    onTap: (){},
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.asset("images/apple.png",
                                          fit: BoxFit.cover,
                                          height: 40,
                                        ),
                                        const Text(
                                          'Sign up with Apple',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Container(
                                  width: 300,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.shade400,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: GestureDetector(
                                    onTap: (){},
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.asset("images/email.png",
                                          fit: BoxFit.cover,
                                          height: 40,
                                        ),
                                        const Text(
                                          'Sign up with Email',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: changeColor,
                                      icon: Icon(
                                        Icons.check_box_rounded,
                                        color: btnColor,
                                      ),
                                    ),
                                    const Text(
                                      'I accept the privacy policy\n And agree to the terms of service',
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),


                          ],
                        ),

                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
      ],
        ),
      ),
    );

  }
}
