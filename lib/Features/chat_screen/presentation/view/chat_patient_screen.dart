import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';



class ChatPatientScreen extends StatefulWidget{
  const ChatPatientScreen ({super.key});

  @override
  State<ChatPatientScreen> createState() => _ChatPatientScreenState();
}

class _ChatPatientScreenState extends State<ChatPatientScreen> {
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
                     "Patients",
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 30,
                     ),
                     //textAlign: TextAlign.center,
                   ),
                 ),
                 const SizedBox(height: 30,),
                 PatientWidget(context),
                 const SizedBox(height: 20,),
                 PatientWidget(context),
                 const SizedBox(height: 20,),
                 PatientWidget(context),
                 const SizedBox(height: 20,),
                 PatientWidget(context),

                 const SizedBox(height: 70,),



               ],
             ),
           )
       ),
     ),
   );
  }
}
Widget PatientWidget(BuildContext context){
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
        child:  Column(
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    Image.asset('images/pati.png',
                    fit: BoxFit.cover,
                    width: 80,
                    height: 80,
                  ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white,
                        ),
                        // child:const Icon(LineAwesomeIcons.image,color:Colors.black,size: 25,),
                      ),
                    ),
                    Positioned(
                      right: 1,
                      top: 1,
                      child: Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Color(0xff26CC71),
                        ),
                        // child:const Icon(LineAwesomeIcons.image,color:Colors.black,size: 25,),
                      ),
                    ),
                  ],
                ),

                SizedBox(width: 30,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Lujy Ahmed',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text('Hello Dr.Ziad',
                      style: TextStyle(
                        color: Color(0xff676666),
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 90,),
                Column(
                 // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('12:00Pm'),
                    SizedBox(height: 20,),
                    Center(
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Color(0xff26CC71),
                        ),
                        child: Center(child: Text('2')),
                      ),
                    ),
                  ],

                ),
              ],
            ),
            const SizedBox(height: 10,),
            Column(
              children: [
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
                    width: 200,
                    decoration: BoxDecoration(
                      color: kprimaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text("Reply",
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
          ],
        ),
      ));
}