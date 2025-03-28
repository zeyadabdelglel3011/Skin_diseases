import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class MedicinesWidget extends StatelessWidget {
  const MedicinesWidget({super.key, required this.pic, required this.title, required this.desc});

  final String pic , title , desc ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        width: 250,
        height: 400,
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
                    pic , width: 230,
                    height: 100,
                    fit: BoxFit.fill,
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
                  const SizedBox(height: 30,),


                ],
              ),
              Positioned(
                width: 150,
                bottom: 5,
                left: 35,
                child: ElevatedButton(

                  onPressed: (){},
                  style: ButtonStyle(
                    backgroundColor: const WidgetStatePropertyAll(kprimaryColor),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius:BorderRadius.circular(8),  ), ),
                    minimumSize: const WidgetStatePropertyAll(
                      Size.fromHeight(32),
                    ),



                  ),
                  child: const Text(
                    "View Details",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
