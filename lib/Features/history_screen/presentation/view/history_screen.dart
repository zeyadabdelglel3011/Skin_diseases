import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../constants.dart';





class HistoryScreen extends StatefulWidget{
  const HistoryScreen ({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
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
                      "History",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                      //textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 30,),
                  HistoryWidget(context),
                  const SizedBox(height: 20,),
                  HistoryWidget(context),
                  const SizedBox(height: 20,),
                  HistoryWidget(context),
                  const SizedBox(height: 20,),
                  HistoryWidget(context),

                  const SizedBox(height: 70,),
                  GestureDetector(
                    onTap: (){
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (e)=>const ));
                    },
                    child: Container(
                      margin:  const EdgeInsets.symmetric(horizontal: 20),
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kprimaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text("Clear History",
                          style:
                          TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),),
                      ),

                    ),
                  ),
                  const SizedBox(height: 20,),

                ],
              ),
            )
        ),
      ),

    );
  }
}
Widget HistoryWidget(BuildContext context){
  return(
      Container(
        padding: EdgeInsets.only(left: 15.0,top: 20.0,bottom:20.0,right: 10.0 ),
        decoration:
        BoxDecoration(
          color:Color(0xffD1C1B2),
          borderRadius: BorderRadius.circular(10),
        ),
        margin:  const EdgeInsets.symmetric(horizontal: 15),
        width: MediaQuery.of(context).size.width,
        child:  Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(CupertinoIcons.circle_fill,color: kprimaryColor,size: 4,),
                    const SizedBox(width: 5,),
                    Text('Atopic Dermatitis 70%',
                      style:  TextStyle(
                        color:kprimaryColor ,
                        // fontSize: 20),
                      ),),
                    Text('(eczema)',)
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Icon(CupertinoIcons.circle_fill,color: kprimaryColor,size: 4,),
                    const SizedBox(width: 5,),
                    Text('Shingles 20%',
                      style:  TextStyle(
                        color:kprimaryColor ,
                        // fontSize: 20),
                      ),),
                    Text('(Herpes Zoster)'),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Icon(CupertinoIcons.circle_fill,color: kprimaryColor,size: 4,),
                    const SizedBox(width: 5,),
                    Text('Hives 10%',
                      style:  TextStyle(
                        color:kprimaryColor ,
                        // fontSize: 20),
                      ),),
                    Text('(Urticaria)'),
                  ],
                ),
                const SizedBox(height: 30,),
                Row(
                  children: [
                    Icon(LineAwesomeIcons.calendar),
                    const SizedBox(width: 5,),
                    Text('1 December 2024'),
                    const SizedBox(width: 10,),
                    Icon(LineAwesomeIcons.access_alarms),
                    const SizedBox(width: 5,),
                    Text('11:00Am'),
                  ],
                )
              ],
            ),

            Image.asset('images/dis.png',
              fit: BoxFit.cover,
              width: 130,
              height: 100,
            ),


          ],
        ),
      ));
}
