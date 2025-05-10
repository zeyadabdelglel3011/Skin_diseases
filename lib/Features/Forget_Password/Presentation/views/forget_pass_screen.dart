import 'package:flutter/material.dart';

import '../../../../constants.dart';


class ForgetPassScreen extends StatelessWidget {
  const ForgetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: kbeigeColor,

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children:[
            // white
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
                    "Forget Password",
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
                    'Please enter your email to reset the password',
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
                          "Your Email",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
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





                            const SizedBox(height: 60,),
                            GestureDetector(
                              onTap: (){
                               // Navigator.push(context, MaterialPageRoute(builder: (context)=> ResetPasswordCodeScreen()));
                              },
                              child: Container(
                                height: 55,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: kprimaryColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Center(
                                  child: Text("Reset Password",style: TextStyle(color: Colors.white,
                                      fontSize: 22),),
                                ),
                              ),
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
