import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';





class EditProfileScreen extends StatefulWidget{
  const EditProfileScreen ({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbeigeColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
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
                    "Edit your Profile",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                    //textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20,),
                Center(
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: ClipRRect(borderRadius: BorderRadius.circular(100),child: Image.asset('images/ing.png'),),
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
                          child: Icon(LineAwesomeIcons.image,color:Colors.black,size: 25,),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                const Center(
                  child:  Text("Lujy",
                    style: TextStyle(
                      color: kprimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),),
                ),
                const Center(
                  child:  Text("Lujaina646@gmail.com",
                    style:TextStyle(
                      color:Color(0xff676666),
                      fontSize: 15,
                    ),),
                ),
                const SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Form(child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: " Name ",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: " Phone Number ",
                          prefixIcon:const Padding(
                            padding:  EdgeInsets.only(left: 20,top: 13),
                            child: Text("+20 | ",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 15,
                              ),),
                          ) ,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),

                      ),
                      const SizedBox(height: 20,),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: " Email ",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: " Date of birth ",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: " Gender ",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50,),
                      GestureDetector(
                        onTap: (){
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (e)=>const ));
                        },
                        child: Container(
                          height: 55,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: kprimaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Text("Update Profile",
                              style:
                              TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20),),
                          ),

                        ),
                      ),
                    ],
                  )),
                ),

              ],
            )
        ),
      ),

    );
  }
}