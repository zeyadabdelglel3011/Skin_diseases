import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';





class NotificationScreen extends StatefulWidget{
  const NotificationScreen  ({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool _isOn = false;
  var isSwitchon=true;

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
                      "Notification Settings",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                      //textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 50,),
                  Container(
                    margin:  const EdgeInsets.symmetric(horizontal: 20),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("General Notification",
                          style: TextStyle(
                            fontSize: 27,
                            color:  kprimaryColor,
                          ),
                        ),
                        CupertinoSwitch(
                            activeColor:kprimaryColor ,
                            thumbColor: kprimaryColor ,
                         //   inactiveTrackColor:Color(0xffFFFFFF),
                            //activeTrackColor: ,
                            value: isSwitchon, onChanged: (value){
                          setState(() {
                            isSwitchon=value;
                          });
                        })

                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    margin:  const EdgeInsets.symmetric(horizontal: 20),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Email Notification",
                          style: TextStyle(
                            fontSize: 27,
                            color:  kprimaryColor,
                          ),),
                        CupertinoSwitch(
                            activeColor:kprimaryColor ,
                            thumbColor: kprimaryColor ,
                           // inactiveTrackColor:Color(0xffFFFFFF),
                            value:_isOn,
                            onChanged: (bool ? newValue){
                              setState(() {
                                _isOn=newValue!;
                              });
                            })
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