import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';



class PrivacyPolicyScreen extends StatefulWidget{
  const PrivacyPolicyScreen ({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbeigeColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5,),
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
                        color: Colors.black,
                      ) ,
                    ),
                  ),
                  const Center(
                    child:  Text(
                      "privacy and policy",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                      //textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    margin:  const EdgeInsets.symmetric(horizontal: 20),
                    child:const Text('Last Update: 8/11/2024',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),

                  Container(
                    margin:  const EdgeInsets.symmetric(horizontal: 20),
                    child:const Text("Data Collection",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color:  kprimaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Container(
                    margin:  const EdgeInsets.symmetric(horizontal: 20),
                    child:const Text('"We collect personal information such as your name,\n email address, and payment details when you register or\n make a purchase."\n"Our website may automatically collect non-personal \n information, including IP addresses, browser type, and \n browsing behavior."',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    margin:  const EdgeInsets.symmetric(horizontal: 20),
                    child:const Text("Use of Information ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color:  kprimaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Container(
                    margin:  const EdgeInsets.symmetric(horizontal: 20),
                    child:const Text('"Your personal information is used to process\n transactions, improve our services, and communicate\n with you."\n"We may use your data for marketing purposes, but you\n can opt out at any time."',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    margin:  const EdgeInsets.symmetric(horizontal: 20),
                    child:const Text("Data Security",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color:  kprimaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Container(
                    margin:  const EdgeInsets.symmetric(horizontal: 20),
                    child:const Text('"We implement a variety of security measures to protect\n your personal information, including encryption and\n secure servers."\n"While we strive to protect your data, no method of\n transmission over the internet is 100% secure."',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    margin:  const EdgeInsets.symmetric(horizontal: 20),
                    child:const Text("Data Sharing",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color:  kprimaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Container(
                    margin:  const EdgeInsets.symmetric(horizontal: 20),
                    child:const Text('"We do not sell, trade, or transfer your personal\n information to third parties without your consent, except\n as required by law."\n"Your data may be shared with trusted third-party\n service providers to assist in operating our website or\n conducting business."',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    margin:  const EdgeInsets.symmetric(horizontal: 20),
                    child:const Text("Cookies and Tracking",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color:  kprimaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Container(
                    margin:  const EdgeInsets.symmetric(horizontal: 20),
                    child:const Text('"Our application uses cookies to enhance your browsing\n experience and analyze site traffic."\n"You can disable cookies in your browser settings, but this\n may affect the functionality of our application',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    margin:  const EdgeInsets.symmetric(horizontal: 20),
                    child:const Text("User Rights",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color:  kprimaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Container(
                    margin:  const EdgeInsets.symmetric(horizontal: 20),
                    child:const Text('"You have the right to access, update, or delete your\n personal information at any time."\n"To exercise your rights, please contact us at [email/\ncontact form]."',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50,),

                ],
              ),
            )
        ),
      ),
    );
  }
}