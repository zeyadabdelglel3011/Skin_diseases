import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Features/Home_screen/Presentation/Views/home_screen.dart';

import '../constants.dart';





class MedicalBlogScreen extends StatefulWidget{
  const MedicalBlogScreen ({super.key});

  @override
  State<MedicalBlogScreen> createState() => _MedicalBlogScreenState();
}

class _MedicalBlogScreenState extends State<MedicalBlogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kbeigeColor,
        title:  const Text(
          "Medical Vlogs",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),

        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
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
                    padding: EdgeInsets.only(left: 30.0,top: 20.0,bottom:10.0,right: 10.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color:Color(0xffCEB395),
                    ),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // margin:  const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Image.asset('images/docg.png',
                                fit: BoxFit.cover,
                                width: 60,
                                height: 60,
                              ),
                              SizedBox(width: 15,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Dr. Lujain Ahmed',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    children: [
                                      Icon(CupertinoIcons.eyedropper,size: 20,color: Color(0xff676666),),
                                      SizedBox(width: 10,),
                                      Text('Last edited 4 hours ago',
                                        style: TextStyle(
                                          color: Color(0xff676666),
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),

                                ],
                              ),



                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text('Monkeypox',
                          style: TextStyle(
                            color: kprimaryColor ,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),

                        Text(' Is a viral disease caused by the monkeypox \nvirus, which is related to smallpox but generally \nless severe. It spreads through close contact \nwith infected humans or animals, including\nrespiratory droplets, bodily fluids, or \ncontaminated materials. Symptoms typically \nbegin with fever, headache, muscle aches, and \nswollen lymph nodes, followed by a distinctive ',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Row(
                          children: [
                            Text('rash that....',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Text('See more',
                              style: TextStyle(
                                color: Color(0xff676666),
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Column(
                              children: [
                                Image.asset('images/dis1.png',
                                  fit: BoxFit.cover,
                                  width: 200,
                                  height: 100,
                                ),
                                SizedBox(height: 10,),
                                Image.asset('images/dis2.png',
                                  fit: BoxFit.cover,
                                  width: 200,
                                  height: 100,
                                ),
                              ],
                            ),
                            const SizedBox(width: 10,),
                            Image.asset('images/dis1.png',
                              fit: BoxFit.cover,
                              width: 180,
                              height: 215,
                            ),

                          ],
                        ),

                      ],
                    ) ,
                  ),
                  SizedBox(height: 25,),
                  Container(
                    padding: EdgeInsets.only(left: 30.0,top: 20.0,bottom:10.0,right: 10.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color:Color(0xffCEB395),
                    ),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // margin:  const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Image.asset('images/doc.png',
                                fit: BoxFit.cover,
                                width: 60,
                                height: 60,
                              ),
                              SizedBox(width: 15,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Dr Ziad Henry',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    children: [
                                      Icon(CupertinoIcons.eyedropper,size: 20,color: Color(0xff676666),),
                                      SizedBox(width: 10,),
                                      Text('Last edited 4 hours ago',
                                        style: TextStyle(
                                          color: Color(0xff676666),
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),

                                ],
                              ),



                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text('Seborrheic Dermatitis',
                          style: TextStyle(
                            color: kprimaryColor ,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),

                        Text('Is a common, chronic skin condition that \nprimarily affects areas of the body with a high \nconcentration of oil glands, such as the scalp,\nface, and upper chest. It is characterized by \nred, inflamed skin covered with greasy or flaky \nwhite or yellowish scales. The exact cause is \nnot fully understood, but it is believed to be \nlinked to an overgrowth of a yeast \ncalled Malassezia on the skin, an \noverproduction of oil (sebum), and an ',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Row(
                          children: [
                            Text('inflammatory. Factors like stress ....',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Text('See more',
                              style: TextStyle(
                                color: Color(0xff676666),
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Column(
                              children: [
                                Image.asset('images/dis3.png',
                                  fit: BoxFit.cover,
                                  width: 200,
                                  height: 100,
                                ),
                                SizedBox(height: 10,),
                                Image.asset('images/dis4.png',
                                  fit: BoxFit.cover,
                                  width: 200,
                                  height: 100,
                                ),
                              ],
                            ),
                            const SizedBox(width: 10,),
                            Image.asset('images/dis3.png',
                              fit: BoxFit.cover,
                              width: 180,
                              height: 215,
                            ),

                          ],
                        ),

                      ],
                    ) ,
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}