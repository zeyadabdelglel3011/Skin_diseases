import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/Features/Create_Account_Doctor/presentation/views/create_account_doctor.dart';
import 'package:graduation_project/Features/Login/presentation/views/login_screen.dart';

class CreateAccountPatient extends StatelessWidget {
  const CreateAccountPatient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbeigeColor,
      body: SingleChildScrollView(
       scrollDirection: Axis.vertical,
        child: Padding(
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
                margin:  EdgeInsets.symmetric(horizontal: 20),
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
                    Container(
                      margin: const EdgeInsets.all(20),
                      width: 450,
                      height: 60,

                      decoration: BoxDecoration(
                        color: kbeigeColor,
                        borderRadius: BorderRadius.circular(50),

                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 50,
                            width: 180,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black54,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                            ),
                            child: const Center(
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 180,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black54,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: kprimaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                            'Create Account ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Form(child: Column(
                        children: [
                          Row(


                            children: [
                              Expanded(child:TextFormField(
                                decoration: InputDecoration(
                                  labelText: "First Name",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),

                                  ),

                                ),
                              ) ,

                              ),
                              const SizedBox(width: 20,),
                              Expanded(child:TextFormField(
                                decoration: InputDecoration(
                                  labelText: "Last Name",

                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ) ,

                              ),

                            ],
                          ),
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
                              labelText: "Create password",

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20,),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "Confirm password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25,),
                          Container(
                            height: 55,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: kprimaryColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text("Create Account",style: TextStyle(color: Colors.white,
                              fontSize: 22),),
                            ),
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
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginScreen()),);
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
                                  IconButton(onPressed: (){},
                                    iconSize: 25,
                                      icon: Icon(Icons.check_box,
                                      color: kprimaryColor,
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
      ),
    );
  }
}
