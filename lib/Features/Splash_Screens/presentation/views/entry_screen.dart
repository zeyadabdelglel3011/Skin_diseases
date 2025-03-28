import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/Features/Create_Account_Patient/presentation/views/create_account_patient.dart';
import 'package:graduation_project/Features/Create_Account_Doctor/presentation/views/create_account_doctor.dart';

class EntryScreen extends StatelessWidget {
  const EntryScreen({super.key});

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
            child: Image.asset('images/2.png',
              fit: BoxFit.cover,
              width: 200,
              height: 200,


            ),
          ),
          Positioned(

            bottom: 1,
            right: 1,
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
                const Spacer(flex: 1,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20 , ),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>  CreateAccountPatient()),);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        color: kprimaryColor,
                        borderRadius: BorderRadius.circular(8),

                      ),
                      child: const Center(
                        child: Text(
                          'Patient',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20 , ),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const CreateAccountDoctor()),);

                    },
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        // color: Colors.orange,
                        borderRadius: BorderRadius.circular(8),
                       border: Border.all(
                         color: kprimaryColor,
                         width: 1.5,

                       ),

                      ),
                      child: const Center(
                        child: Text(
                          'Doctor',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(),

              ],
            ),
          ),
        ],
      ),
    );;
  }
}
