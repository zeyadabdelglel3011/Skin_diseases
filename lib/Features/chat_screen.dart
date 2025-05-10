import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class ChatScreen extends StatefulWidget{
  const ChatScreen ({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbeigeColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 30.0,top: 60.0,bottom:20.0,right: 10.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xffD1C1B2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // margin:  const EdgeInsets.symmetric(horizontal: 20),
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
                  SizedBox(height: 25,),
                  Container(
                    margin:  const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Image.asset('images/luge.png',
                          fit: BoxFit.cover,
                          width: 60,
                          height: 60,
                        ),
                        SizedBox(width: 15,),
                        Text('Dr. Lujain Ahmed',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(width: 70,),
                        Icon(CupertinoIcons.video_camera,size: 40,),
                        SizedBox(width: 15,),
                        Icon(CupertinoIcons.phone,size: 30,),

                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.all(13),
                  decoration: BoxDecoration(
                      color: kprimaryColor,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20),bottomRight:  Radius.circular(20), )
                  ),
                  child: Text('   Hello,Dr   ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      // fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 40,),
            Container(
              margin:  const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Image.asset('images/luge.png',
                    fit: BoxFit.cover,
                    width: 60,
                    height: 60,
                  ),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Dr. Lujain Ahmed',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text('  10 min ago',
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.grey
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.all(13),
                  decoration: BoxDecoration(
                      color: Color(0xffCEB395),
                      borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomLeft: Radius.circular(30),bottomRight:  Radius.circular(20), )
                  ),
                  child: Text(' Please fill the following form  \n www.formdisease.com  ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.all(13),
                  decoration: BoxDecoration(
                      color: Color(0xffCEB395),
                      borderRadius: BorderRadius.only( topLeft: Radius.circular(25),topRight: Radius.circular(25),bottomLeft: Radius.circular(25),bottomRight:  Radius.circular(25), )
                  ),
                  child: Text(' Hello , How can i help you?    ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.all(13),
                  decoration: BoxDecoration(
                      color: kprimaryColor,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20),bottomRight:  Radius.circular(20), )
                  ),
                  child: Text('This buildup leads to scaling,\nredness, and inflammation on\nthe skins surface.It is not\ncontagious but can be\nuncomfortable. ',
                    style: TextStyle(
                      color: Colors.white,
                      // fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 40,),
            Container(
              margin:  const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Image.asset('images/luge.png',
                    fit: BoxFit.cover,
                    width: 60,
                    height: 60,
                  ),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Dr. Lujain Ahmed',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text('  10 min ago',
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.grey
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.all(13),
                  decoration: BoxDecoration(
                      color: Color(0xffCEB395),
                      borderRadius: BorderRadius.only( topLeft: Radius.circular(25),topRight: Radius.circular(25),bottomLeft: Radius.circular(25),bottomRight:  Radius.circular(25), )
                  ),
                  child: Text(' Okay, Could you send me a picture of  \n your skin?  ',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: kprimaryColor,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20),bottomRight:  Radius.circular(20), )
                  ),
                  child:Image.asset('images/dis.png',
                    fit: BoxFit.cover,
                    width: 260,
                    height: 160,
                  ),

                )
              ],
            ),
            SizedBox(height: 40,),
            Container(
              margin:  const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 20.0,top: 6,right: 10.0),
                      decoration: BoxDecoration(
                          color:  Color(0xffD1C1B2),
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: TextField(

                        decoration: InputDecoration(border: InputBorder.none,
                            hintText: "Type a message ",
                            suffixIcon: Icon(Icons.attachment_outlined)),
                      ),
                    ),
                  ),
                  // SizedBox(height: 20,),
                  GestureDetector(
                    onTap: (){
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (e)=>const ));
                    },
                    child: Container(
                      margin:  const EdgeInsets.symmetric(horizontal: 10),
                      height: 45,
                      width: 110,
                      decoration: BoxDecoration(
                        color: kprimaryColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Center(
                        child: Text("Send ",
                          textAlign: TextAlign.center,
                          style:
                          TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),),
                      ),

                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 500,),
          ],
        ),
      ),
    );
  }
}