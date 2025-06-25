import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../constants.dart';





class FormScreen extends StatefulWidget{
  const FormScreen ({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  int _value=1;
  int _val=1;
  int _valu=1;
  int _week=1;
  int _part=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbeigeColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('images/form.png',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: 250,
            ),
            const SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.only(left: 10.0,top: 20.0,bottom:30.0,),
              decoration:
              BoxDecoration(
                color:Color(0xffCEB395),
                borderRadius: BorderRadius.circular(10),
              ),
              margin:  const EdgeInsets.symmetric(horizontal: 15),
              width: MediaQuery.of(context).size.width,
              child: Text('Skin Disease Patient Intake Form',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 30,),
            Container(
              padding: EdgeInsets.only(left: 10.0,top: 10.0,bottom:20.0,),
              decoration:
              BoxDecoration(
                color:Color(0xffCEB395),
                borderRadius: BorderRadius.circular(10),
              ),
              margin:  const EdgeInsets.symmetric(horizontal: 15),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Type Your Name',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Icon(CupertinoIcons.staroflife_fill,color:Color(0xffD21D0F),size: 14,),
                    ],
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'your answer',
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color:Color(0xff676666)),),
                    ),
                  ),
                ],
              ),



            ),
            const SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.only(left: 10.0,top: 10.0,bottom:20.0,),
              decoration:
              BoxDecoration(
                color:Color(0xffCEB395),
                borderRadius: BorderRadius.circular(10),
              ),
              margin:  const EdgeInsets.symmetric(horizontal: 15),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Date Of Birth',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Icon(CupertinoIcons.staroflife_fill,color:Color(0xffD21D0F),size: 14,),
                    ],
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'DD/MM/YY',
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color:Color(0xff676666)),),
                    ),
                  ),
                ],
              ),



            ),
            const SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.only(left: 10.0,top: 10.0,bottom:20.0,),
              decoration:
              BoxDecoration(
                color:Color(0xffCEB395),
                borderRadius: BorderRadius.circular(10),
              ),
              margin:  const EdgeInsets.symmetric(horizontal: 15),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Gender',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Icon(CupertinoIcons.staroflife_fill,color:Color(0xffD21D0F),size: 14,),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Radio(
                          value: 1,
                          groupValue: _value,
                          onChanged: (value){
                            setState(() {
                              _value=value!;
                            });
                          }
                      ),
                      Text('Female',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      )

                    ],),
                  Row(
                    children: [
                      Radio(
                          value: 2,
                          groupValue: _value,
                          onChanged: (value){
                            setState(() {
                              _value=value!;
                            });
                          }
                      ),
                      Text('Male',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      )

                    ],
                  ),
                ],
              ),



            ),
            const SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.only(left: 10.0,top: 10.0,bottom:20.0,),
              decoration:
              BoxDecoration(
                color:Color(0xffCEB395),
                borderRadius: BorderRadius.circular(10),
              ),
              margin:  const EdgeInsets.symmetric(horizontal: 15),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Have you been diagnosed with any skin ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('conditions before? ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Icon(CupertinoIcons.staroflife_fill,color:Color(0xffD21D0F),size: 14,),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Radio(
                          value: 1,
                          groupValue: _val,
                          onChanged: (value){
                            setState(() {
                              _val=value!;
                            });
                          }
                      ),
                      Text('Yes',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      )

                    ],),
                  Row(
                    children: [
                      Radio(
                          value: 2,
                          groupValue: _val,
                          onChanged: (value){
                            setState(() {
                              _val=value!;
                            });
                          }
                      ),
                      Text('No',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'If Yes, Describe it',
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color:Color(0xff676666)),),
                    ),
                  ),
                ],
              ),



            ),
            const SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.only(left: 10.0,top: 10.0,bottom:20.0,),
              decoration:
              BoxDecoration(
                color:Color(0xffCEB395),
                borderRadius: BorderRadius.circular(10),
              ),
              margin:  const EdgeInsets.symmetric(horizontal: 15),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('How many times was the disease determined?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Icon(CupertinoIcons.staroflife_fill,color:Color(0xffD21D0F),size: 14,),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Radio(
                          value: 1,
                          groupValue: _valu,
                          onChanged: (value){
                            setState(() {
                              _valu=value!;
                            });
                          }
                      ),
                      Text('1-5',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      )

                    ],),
                  Row(
                    children: [
                      Radio(
                          value: 2,
                          groupValue: _valu,
                          onChanged: (value){
                            setState(() {
                              _valu=value!;
                            });
                          }
                      ),
                      Text('4-8',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      )

                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: 3,
                          groupValue: _valu,
                          onChanged: (value){
                            setState(() {
                              _valu=value!;
                            });
                          }
                      ),
                      Text('8-10 ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      )

                    ],
                  ),
                ],
              ),



            ),
            const SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.only(left: 10.0,top: 10.0,bottom:20.0,),
              decoration:
              BoxDecoration(
                color:Color(0xffCEB395),
                borderRadius: BorderRadius.circular(10),
              ),
              margin:  const EdgeInsets.symmetric(horizontal: 15),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('How long has this disease been present?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Icon(CupertinoIcons.staroflife_fill,color:Color(0xffD21D0F),size: 14,),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Radio(
                          value: 1,
                          groupValue: _week,
                          onChanged: (value){
                            setState(() {
                              _week=value!;
                            });
                          }
                      ),
                      Text('Less Than 1 Week',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      )

                    ],),
                  Row(
                    children: [
                      Radio(
                          value: 2,
                          groupValue: _week,
                          onChanged: (value){
                            setState(() {
                              _week=value!;
                            });
                          }
                      ),
                      Text('1-4 Weeks',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      )

                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: 3,
                          groupValue: _week,
                          onChanged: (value){
                            setState(() {
                              _week=value!;
                            });
                          }
                      ),
                      Text('1-6 Months',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      )

                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: 4,
                          groupValue: _week,
                          onChanged: (value){
                            setState(() {
                              _week=value!;
                            });
                          }
                      ),
                      Text('More Than 6 Months',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      )

                    ],
                  ),
                ],
              ),



            ),
            const SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.only(left: 10.0,top: 10.0,bottom:20.0,),
              decoration:
              BoxDecoration(
                color:Color(0xffCEB395),
                borderRadius: BorderRadius.circular(10),
              ),
              margin:  const EdgeInsets.symmetric(horizontal: 15),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Which parts of your body are affected?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Icon(CupertinoIcons.staroflife_fill,color:Color(0xffD21D0F),size: 14,),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Radio(
                          value: 1,
                          groupValue: _part,
                          onChanged: (value){
                            setState(() {
                              _part=value!;
                            });
                          }
                      ),
                      Text('Face',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      )

                    ],),
                  Row(
                    children: [
                      Radio(
                          value: 2,
                          groupValue: _part,
                          onChanged: (value){
                            setState(() {
                              _part=value!;
                            });
                          }
                      ),
                      Text('Arms',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      )

                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: 3,
                          groupValue: _part,
                          onChanged: (value){
                            setState(() {
                              _part=value!;
                            });
                          }
                      ),
                      Text('Torso',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      )

                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: 4,
                          groupValue: _part,
                          onChanged: (value){
                            setState(() {
                              _part=value!;
                            });
                          }
                      ),
                      Text('Other',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      )

                    ],
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Type Your Other Part',
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color:Color(0xff676666)),),
                    ),
                  ),
                ],
              ),



            ),
            const SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.only(left: 10.0,top: 10.0,bottom:20.0,),
              decoration:
              BoxDecoration(
                color:Color(0xffCEB395),
                borderRadius: BorderRadius.circular(10),
              ),
              margin:  const EdgeInsets.symmetric(horizontal: 15),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Please upload a clear photo of any medications\nyou are currently taking or have taken in the',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(' past.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Icon(CupertinoIcons.staroflife_fill,color:Color(0xffD21D0F),size: 14,),
                    ],
                  ),
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      padding: EdgeInsets.only(left: 10.0,top: 10.0,bottom:10.0,),
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child:
                      Row(
                        children: [
                          Icon(LineAwesomeIcons.upload_solid,color: Color(0xff676666),size: 30,),
                          const SizedBox(width: 15,),
                          Text("Upload Photo",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff676666),
                                fontSize: 20),),
                        ],
                      ),

                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40,),
            GestureDetector(
              onTap: (){
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (e)=>const ));
              },
              child: Container(
                margin:  const EdgeInsets.symmetric(horizontal: 15),
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kprimaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text("Submit",
                    style:
                    TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),),
                ),

              ),
            ),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (e)=>const FormScreen()));
              },
              child: Container(
                margin:  const EdgeInsets.symmetric(horizontal: 15),
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kprimaryColor,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text("Clear Form",
                    style:
                    TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20),),
                ),

              ),
            ),

            const SizedBox(height: 50,),


          ],
        ),
      ),
    );
  }
}