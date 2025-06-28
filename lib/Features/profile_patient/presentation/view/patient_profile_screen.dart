import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Features/Home_screen/Presentation/Views/home_screen.dart';
import 'package:graduation_project/Features/Medicines_Screen/Presentation/Views/medicines_screen.dart';
import '../../../../constants.dart';
import '../../../edit_profile_patient/presentation/view/edit_profile_screen.dart';
import '../../../history_screen/presentation/view/history_screen.dart';
import '../../../notification_screen.dart';
import 'package:graduation_project/Features/privacy_policy_screen/presentation/views/privacy_policy_screen.dart';

import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'package:path/path.dart';

class PatientProfileScreen extends StatelessWidget{
  const PatientProfileScreen ({super.key, required this.email});


  final String email;


  String? extractName(String email) {
    if (email.isEmpty || !email.contains('@')) {
      return null; // لا اسم
    }

    final namePart = email.split('@').first;
    if (namePart.isEmpty) return null;

    return namePart[0].toUpperCase() + namePart.substring(1).toLowerCase();
  }
  @override
  Widget build(BuildContext context) {
    final String? name = extractName(email);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kbeigeColor,
        title:  const Text(
          "Profile",
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: ClipRRect(borderRadius: BorderRadius.circular(100),
                          child: Image.asset('images/ing.png'),),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: kprimaryColor.withOpacity(0.5),
                          ),
                          child:const Icon(LineAwesomeIcons.image,color:Colors.black,size: 25,),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Center(
                  child: Text(
                    name!,
                    style: TextStyle(
                      color: kprimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),

                Center(
                  child:  Text(email,
                    style:TextStyle(
                      color:Color(0xff676666),
                      fontSize: 15,
                    ),),
                ),
                const SizedBox(height: 50,),

                ProfileMenuWidget("Edit Your Profile",LineAwesomeIcons.user_edit_solid,(){Navigator.push(context, MaterialPageRoute(builder: (e)=>EditProfileScreen(name: name, email: email)));},true),
                const SizedBox(height: 10,),
                ProfileMenuWidget("History",LineAwesomeIcons.history_solid,(){Navigator.push(context, MaterialPageRoute(builder: (e)=>const HistoryScreen()));},true),
                const SizedBox(height: 10,),
                ProfileMenuWidget("Privacy And Policy",LineAwesomeIcons.shield_alt_solid,(){Navigator.push(context, MaterialPageRoute(builder: (e)=>const PrivacyPolicyScreen()));},true),
                const SizedBox(height: 10,),
                ProfileMenuWidget("Notification Settings",CupertinoIcons.bell,(){Navigator.push(context, MaterialPageRoute(builder: (e)=>const NotificationScreen()));},true),
                const SizedBox(height: 10,),
               // ProfileMenuWidget("Logout",CupertinoIcons.square_arrow_left,(){showDialogFun();},false),


              ],
            )
        ),
      ),
    );

  }
}
Widget ProfileMenuWidget(String title,IconData icon,VoidCallback onTap,bool endIcon){
  return ListTile(
    onTap: onTap,
    leading: Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: kprimaryColor,
      ),
      child: Icon(icon,color:Colors.white),
    ),
    title: Text(title,
      style:TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color:Colors.black ) ,),
    trailing:endIcon? Icon(CupertinoIcons.chevron_forward,size: 18.0,color: Colors.black,):null,
  );
}
// showDialogFun(){
//   return showDialog(
//       context: context,
//       builder: (context){
//         return Container(
//           padding: EdgeInsets.only(top: 300.0),
//           child: Center(
//             child: Material(
//               type: MaterialType.transparency,
//               child: Container(
//                 margin:  const EdgeInsets.symmetric(horizontal: 10),
//                 decoration:BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: kbeigeColor,
//                 ) ,
//                 //padding: EdgeInsets.all(15),
//                 width: MediaQuery.of(context).size.width ,
//                 height: 455,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children:<Widget> [
//                     Image.asset('images/dot1.png',
//                       width: 200,
//                       height: 150,
//                     ),
//                     Center(
//                       child: Text('Logout',
//                         style:TextStyle(
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold,
//                             color:kprimaryColor ) ,),
//                     ),
//                     Center(
//                       child: Text('are you sure you want to log out?',
//                         style:TextStyle(
//                           fontSize: 23,
//                         ) ,),
//                     ),
//                     const SizedBox(height: 40,),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         GestureDetector(
//                           onTap: (){
//                             // Navigator.push(
//                             //     context,
//                             //     MaterialPageRoute(
//                             //         builder: (e)=>const FormScreen()));
//                           },
//                           child: Container(
//                             margin:  const EdgeInsets.symmetric(horizontal: 15),
//                             height: 55,
//                             width: 150,
//                             decoration: BoxDecoration(
//                               border: Border.all(
//                                 color: kprimaryColor,
//                                 width: 1.5,
//                               ),
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: const Center(
//                               child: Text("Cancel",
//                                 style:
//                                 TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.black,
//                                     fontSize: 23),),
//                             ),
//
//                           ),
//                         ),
//                         const SizedBox(width: 10,),
//                         GestureDetector(
//                           onTap: (){
//                             // Navigator.push(
//                             //     context,
//                             //     MaterialPageRoute(
//                             //         builder: (e)=>const ));
//                           },
//                           child: Container(
//                             margin:  const EdgeInsets.symmetric(horizontal: 15),
//                             height: 55,
//                             width: 150,
//                             decoration: BoxDecoration(
//                               color: kprimaryColor,
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: const Center(
//                               child: Text("Yes",
//                                 style:
//                                 TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white,
//                                     fontSize: 23),),
//                             ),
//
//                           ),
//                         ),
//
//
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Image.asset('images/dot2.png',
//                           width: 200,
//                           height: 130,
//                         ),
//                       ],
//                     ),
//
//
//
//
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       }
//   );
//
// }
