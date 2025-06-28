import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../constants.dart';



class PatientWidget extends StatelessWidget {
  const PatientWidget({super.key, required this.pic, required this.title, required this.desc});

  final String pic , title , desc ;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        child: Container(
          width: 200,
          height: 330,
          decoration: BoxDecoration(
            color: const Color(0xffD1C1B2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              children:[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      pic , width: 220,
                      height: 110,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,

                    ),
                    const SizedBox(height: 10,),
                    Text(
                      title ,
                      style: const TextStyle(
                        fontSize: 14 ,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      desc,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600,

                      ),
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      children: [
                        Icon(CupertinoIcons.clock ,
                        color: Colors.grey.shade600,
                          size: 14,
                        ),
                        const SizedBox(width: 10,),
                        Text(
                          "saturday-wednesday ,\n9:00am to 5:00pm",
                          style:  TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade600,

                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Container(
                          padding: const EdgeInsets.only(top: 5),
                          width: 180,
                          height: 25,
                          decoration: BoxDecoration(
                            color: kprimaryColor,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: kprimaryColor,
                            ),
                          ),
                          child: const Text(
                            textAlign: TextAlign.center,
                            "Chat",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),




                  ],
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
