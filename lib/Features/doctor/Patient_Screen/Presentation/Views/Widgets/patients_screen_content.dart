import 'package:flutter/material.dart';

import '../../../../../../constants.dart';

import '../../../../../patient/chat_screen/presentation/view/chat_screen.dart';
import '../../../Data/models/doctor_model.dart';
import '../../../Data/services/patient_service.dart';


class PatientScreenContent extends StatefulWidget{
  const PatientScreenContent ({super.key});

  @override
  State<PatientScreenContent> createState() => _PatientScreenContentState();
}

class _PatientScreenContentState extends State<PatientScreenContent> {
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
                  PatientWidget('images/zez.png','Zeyad Abdelglel','hello doctor'),
                  const SizedBox(height: 20,),
                  PatientWidget('images/girl.png','Zeko','I have a disease..'),
                  const SizedBox(height: 20,),
                  PatientWidget('images/girl.png','Alaa Mohamed','I have a problem..'),
                  const SizedBox(height: 20,),
                  PatientWidget('images/zez.png','Adham ali','can you see my leg '),

                  const SizedBox(height: 70,),



                ],
              ),
            )
        ),
      ),
    );
  }
}
Widget PatientWidget(String image, String name,String title){
  return(
      Container(
        padding: EdgeInsets.only(left: 15.0,top: 20.0,bottom:20.0,right: 10.0 ),
        decoration:
        BoxDecoration(
          color:Color(0xffD1C1B2),
          borderRadius: BorderRadius.circular(10),
        ),
        margin:  const EdgeInsets.symmetric(horizontal: 15),
        //width: MediaQuery.of(context).size.width,
        child:  Column(
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      child: Image.asset(image,
                        width: 100,
                        height: 100,
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

                SizedBox(width: 20,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(title,
                      style: TextStyle(
                        color: Color(0xff676666),
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 30,),
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




class PatientCard extends StatelessWidget {
  final PatientModel patients;

  const PatientCard({super.key, required this.patients});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: const Color(0xffD1C1B2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Row(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage("images/Mask group.png"),
                      radius: 40,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.star_half, size: 26, color: kprimaryColor),
                        Text(
                          patients.rating.toStringAsFixed(1),
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  right: 5,
                  top: 2,
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      color: const Color(0xff8EF4BC),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    patients.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined, color: Colors.black54),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          patients.address,
                          style: const TextStyle(fontSize: 16, color: Colors.black54),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.phone_outlined, color: Colors.black54),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          patients.phone,
                          style: const TextStyle(fontSize: 16, color: Colors.black54),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.email_outlined, color: Colors.black54),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          patients.email,
                          style: const TextStyle(fontSize: 16, color: Colors.black54),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kprimaryColor,
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(userName: '', doctorId: '',)));
                      },
                      child: const Text(
                        "Start chat",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

