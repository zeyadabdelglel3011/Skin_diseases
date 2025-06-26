import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Features/Home_screen/Data/Models/hint_data.dart';
import 'package:graduation_project/Features/Home_screen/Presentation/Views/home_screen.dart';
import 'package:graduation_project/Features/Medicines_Screen/Data/models/medicineData.dart';
import 'package:graduation_project/Features/Medicines_details/Presentation/Views/widgets/medicines_details_content.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/nav_bar.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';



class MedicinesDetails extends StatefulWidget {
   const MedicinesDetails({super.key,  });

  @override
  State<MedicinesDetails> createState() => _MedicinesDetailsState();
}

class _MedicinesDetailsState extends State<MedicinesDetails> {
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
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                    },
                      icon:const Icon(Icons.arrow_back,
                        color: Colors.black,
                      ) ,
                    ),
                  ),
                  const Center(
                    child:  Text(
                      "Dovate Cream",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                      //textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin:  const EdgeInsets.symmetric(horizontal: 30),
                      child:  Image.asset('images/cream.png',
                        fit: BoxFit.cover,
                        width: 150,
                        height: 150,
                      ),
                    ),
                  ),
                  Container(
                    margin:  const EdgeInsets.symmetric(horizontal: 20),
                    child:  const Text("Available In:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color:  kprimaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.only(left: 20.0,top: 20.0,bottom:20.0,),
                    decoration:
                    BoxDecoration(
                      color:Color(0xffD1C1B2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin:  const EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery.of(context).size.width,
                    child:  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('images/elez.png',
                          fit: BoxFit.cover,
                          width: 50,
                          height: 50,
                        ),
                        const SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("Elezaby pharmacy",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(CupertinoIcons.link),
                                const SizedBox(width: 10,),
                                Text('WWW.Elezabypharamcy.com'),
                              ],

                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(CupertinoIcons.location_solid),
                                const SizedBox(width: 10,),
                                Text('Mansoura, Kanat Swez Street'),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(LineAwesomeIcons.phone_volume_solid),
                                SizedBox(width: 10,),
                                Text('19956'),
                              ],

                            ),
                          ],
                        )
                      ],
                    ),


                  ),
                  const SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.only(left: 20.0,top: 20.0,bottom:20.0,),
                    decoration:
                    BoxDecoration(
                      color:Color(0xffD1C1B2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin:  const EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery.of(context).size.width,
                    child:  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('images/elta.png',
                          fit: BoxFit.cover,
                          width: 50,
                          height: 50,
                        ),
                        const SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("Eltarshouby pharmacy",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(CupertinoIcons.link),
                                const SizedBox(width: 10,),
                                Text('WWW.Eltarshoubypharamcy.com'),
                              ],

                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(CupertinoIcons.location_solid),
                                const SizedBox(width: 10,),
                                Text('Mansoura, Kanat Swez Street'),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(LineAwesomeIcons.phone_volume_solid),
                                SizedBox(width: 10,),
                                Text('19956'),
                              ],

                            ),
                          ],
                        )
                      ],
                    ),


                  ),
                  const SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.only(left: 20.0,top: 20.0,bottom:20.0,),
                    decoration:
                    BoxDecoration(
                      color:Color(0xffD1C1B2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin:  const EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery.of(context).size.width,
                    child:  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('images/sall.png',
                          fit: BoxFit.cover,
                          width: 50,
                          height: 50,
                        ),
                        const SizedBox(width: 10,),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("Sally pharmacy",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(CupertinoIcons.link),
                                const SizedBox(width: 10,),
                                Text('WWW.Sallypharamcy.com'),
                              ],

                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(CupertinoIcons.location_solid),
                                const SizedBox(width: 10,),
                                Text('Mansoura, Kanat Swez Street'),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(LineAwesomeIcons.phone_volume_solid),
                                SizedBox(width: 10,),
                                Text('19956'),
                              ],

                            ),
                          ],
                        )
                      ],
                    ),


                  ),
                  const SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.only(left: 20.0,top: 20.0,bottom:20.0,),
                    decoration:
                    BoxDecoration(
                      color:Color(0xffD1C1B2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin:  const EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery.of(context).size.width,
                    child:  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('images/ama.png',
                          fit: BoxFit.cover,
                          width: 50,
                          height: 50,
                        ),
                        const SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("Amasha pharmacy",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(CupertinoIcons.link),
                                const SizedBox(width: 10,),
                                Text('WWW.Sallypharamcy.com'),
                              ],

                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(CupertinoIcons.location_solid),
                                const SizedBox(width: 10,),
                                Text('Mansoura, Kanat Swez Street'),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(LineAwesomeIcons.phone_volume_solid),
                                SizedBox(width: 10,),
                                Text('19956'),
                              ],

                            ),
                          ],
                        )
                      ],
                    ),


                  ),
                  const SizedBox(height: 70,),



                ],
              ),
            )
        ),
      ),
    );
  }
}
