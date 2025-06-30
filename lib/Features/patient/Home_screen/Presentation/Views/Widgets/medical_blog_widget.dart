import 'package:flutter/material.dart';

import '../../../../../../constants.dart';


class MedicalBlogWidget extends StatelessWidget {
  const MedicalBlogWidget({
    super.key, required this.pic, required this.desc, required this.title,
  });
  final String pic , desc , title ;

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
                  const SizedBox(height: 30,),


                ],
              ),
                Positioned(
                  width: 150,
                 bottom: 10,
                  left: 14,
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
      ),
    );
  }
}

