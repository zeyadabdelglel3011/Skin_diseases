import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';




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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 30.0,top: 60.0,bottom:20.0,right: 10.0),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
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
                const SizedBox(height: 25,),
                Container(
                  margin:  const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Image.asset('images/luge.png',
                        fit: BoxFit.cover,
                        width: 60,
                        height: 60,
                      ),
                      const SizedBox(width: 15,),
                      const Text('Dr. Lujain Ahmed',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(width: 45,),
                      const Icon(CupertinoIcons.video_camera,size: 40,),
                      const SizedBox(width: 15,),
                      const Icon(CupertinoIcons.phone,size: 30,),

                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40,),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(13),
                decoration: const BoxDecoration(
                    color: kprimaryColor,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20),bottomRight:  Radius.circular(20), )
                ),
                child: const Text('   Hello,Dr   ',
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

          const SizedBox(height: 20,),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(13),
                decoration: const BoxDecoration(
                    color: Color(0xffCEB395),
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomLeft: Radius.circular(30),bottomRight:  Radius.circular(20), )
                ),
                child: const Text(' Please fill the following form  \n www.formdisease.com  ',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),

          SizedBox(height: MediaQuery.of(context).size.height/2),
          Container(
            margin:  const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 20.0,top: 6,right: 10.0),
                    decoration: BoxDecoration(
                        color:  const Color(0xffD1C1B2),
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: const TextField(

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

        ],
      ),
    );
  }
}