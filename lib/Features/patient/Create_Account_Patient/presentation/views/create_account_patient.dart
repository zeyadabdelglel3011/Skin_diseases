import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Core/Utilities/widgets/custom_text_field.dart';

import 'package:graduation_project/constants.dart';

import 'package:graduation_project/nav_bar.dart';


import '../../../../../Core/Utilities/widgets/create_account_doctor _button.dart';
import '../../../../auth/Login/presentation/views/login_screen.dart';
import '../../data/patient_auth_service.dart';

class CreateAccountPatient extends StatefulWidget {
   CreateAccountPatient({super.key});

  @override
  State<CreateAccountPatient> createState() => _CreateAccountPatientState();
}

class _CreateAccountPatientState extends State<CreateAccountPatient> {
   String? email;

   String? password;

   String? firstName;

   String? lastName;

   String? confirmPassword;

  bool isSelected = false;

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbeigeColor,
      body: SingleChildScrollView(
       scrollDirection: Axis.vertical,
        child: Stack(
          children:[
          Positioned(
          right: -140,
          top: -70,
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
          top: -70,
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
          top: -70,
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
                    'Go ahead and set up \n your account',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
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
                        padding: EdgeInsets.only(left: 20 ,
                        top: 20, bottom: 10),
                        child: Text(
                            'Create Account ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25 , vertical: 10),
                        child: Form(child: Column(
                          children: [
                            Row(


                              children: [
                                Expanded(child:CustomTextField(
                                  hintText: "First Name",
                                  onChanged: (value) => firstName = value,
                                ) ,

                                ),
                                const SizedBox(width: 20,),
                                Expanded(child:CustomTextField(
                                  hintText: "Last Name",
                                  onChanged: (value) => lastName = value,
                                ) ,

                                ),

                              ],
                            ),
                            const SizedBox(height: 20,),
                            CustomTextField(

                              hintText: "Email",
                              onChanged: (value) => email = value,

                            ),
                            const SizedBox(height: 20,),
                            CustomTextField(
                              obscureText: true,
                              hintText: "Create Password",
                              onChanged: (value) => password = value,

                            ),
                            const SizedBox(height: 20,),
                            CustomTextField(
                              hintText: "Confirm Password",
                              onChanged: (value) => confirmPassword = value,

                              obscureText: true,

                            ),
                            const SizedBox(height: 25,),
                            CreateDoctorAccountButton(
                                onTap: () async {
                                  if ([firstName, lastName, email, password, confirmPassword].any((e) => e == null || e.trim().isEmpty)) {
                                    showSnakBar(context, "Please fill all fields");
                                    return;
                                  }

                                  if (password != confirmPassword) {
                                    showSnakBar(context, "Passwords do not match");
                                    return;
                                  }

                                  try {
                                    await PatientAuthService().registerPatient(
                                      firstName: firstName!.trim(),
                                      lastName: lastName!.trim(),
                                      email: email!.trim(),
                                      password: password!,
                                      confirmPassword: confirmPassword!,
                                    );
                                    showSnakBar(context,"Account Created Successfully" ,

                                    );
                                    Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen(userType: 'patient',),));
                                  } catch (e) {
                                    showSnakBar(context, "Error: ${e.toString()}");
                                  }
                                }



                            ),
                            const SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Already have an account?',
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginScreen(userType: "patient",)),);
                                  },
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                      color: kprimaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 40,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 170,
                                  height: 2,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                                const Text(
                                  'or',style: TextStyle(fontSize: 16),),
                                Container(
                                  width: 170,
                                  height: 2,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20,),

                            //social media
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
                                    Checkbox(

                                      activeColor: kprimaryColor,
                                      value: isSelected,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isSelected = value ?? false;
                                        });
                                      },
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
