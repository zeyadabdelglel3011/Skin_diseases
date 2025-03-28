import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class DoctorsScreenContent extends StatelessWidget {
  const DoctorsScreenContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children:
        [
          Padding(padding: const EdgeInsets.symmetric(vertical: 70 , horizontal: 25),
            child: Column(
              children: [
                Row(
      
                  children: [
                    Container(
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
                          color: Colors.black54,
                        ) ,
                      ),
                    ),
                    const SizedBox(width: 110,),
                    const Text(
                      "Doctors",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30,),
                Container(
                  width: 400,
                  height: 250,
                  decoration: BoxDecoration(
                    color: const Color(0xffD1C1B2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 20),
                    child: Row(
                      children: [
                        Stack(
                          children:
                          [
      
                            const Column(
                            children: [
      
                              CircleAvatar(
                                backgroundImage: AssetImage("images/Mask group.png",),
                                radius: 40,
                              ),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Icon(Icons.star_half,
                                  size: 26,
                                    color: kprimaryColor,
                                  ),
                                  Text(
                                    "4.8",
                                  ),
                                ],
                              ),
      
                            ],
                          ),
                            Positioned(
                              right : 5,
                              top: 2,
                              child: Container(
                                width: 15,
                                height: 15,
                                decoration: BoxDecoration(
                                  color: const Color(0xff8EF4BC),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            ],
                        ),
                        const SizedBox(width: 20,),
                         Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Dr Lujain Ahmed",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20,),
                            const Row(
      
                              children: [
                                Icon(Icons.location_on_outlined,
                                color: Colors.black54,
                                ),
                                Text(
                                  " Mansoura ,Elgeish street ",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black54
                                  ),
      
                                ),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            const Row(
      
                              children: [
                                Icon(Icons.phone_outlined,
                                  color: Colors.black54,
                                ),
                                Text(
                                  " 0155668755",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black54
                                  ),
      
                                ),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            const Row(
      
                              children: [
                                Icon(Icons.email_outlined,
                                  color: Colors.black54,
                                ),
                                Text(
                                  " lujaina646@gmail.com ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black54
                                  ),
      
                                ),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            ElevatedButton(
                              style: ButtonStyle(
                                shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),),),
                                padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 50 , ),),
                                backgroundColor: const WidgetStatePropertyAll(kprimaryColor),
                              ),
                              onPressed: (){},
                                child: const Text(
                                  "Start chat",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                            ),
      
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  width: 400,
                  height: 250,
                  decoration: BoxDecoration(
                    color: const Color(0xffD1C1B2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 20),
                    child: Row(
                      children: [
                        Stack(
                          children:
                          [
      
                            const Column(
                              children: [
      
                                CircleAvatar(
                                  backgroundImage: AssetImage("images/Mask group.png",),
                                  radius: 40,
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Icon(Icons.star_half,
                                      size: 26,
                                      color: kprimaryColor,
                                    ),
                                    Text(
                                      "4.8",
                                    ),
                                  ],
                                ),
      
                              ],
                            ),
                            Positioned(
                              right : 5,
                              top: 2,
                              child: Container(
                                width: 15,
                                height: 15,
                                decoration: BoxDecoration(
                                  color: const Color(0xff8EF4BC),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Dr Lujain Ahmed",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20,),
                            const Row(
      
                              children: [
                                Icon(Icons.location_on_outlined,
                                  color: Colors.black54,
                                ),
                                Text(
                                  " Mansoura ,Elgeish street ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black54
                                  ),
      
                                ),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            const Row(
      
                              children: [
                                Icon(Icons.phone_outlined,
                                  color: Colors.black54,
                                ),
                                Text(
                                  " 0155668755",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black54
                                  ),
      
                                ),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            const Row(
      
                              children: [
                                Icon(Icons.email_outlined,
                                  color: Colors.black54,
                                ),
                                Text(
                                  " lujaina646@gmail.com ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black54
                                  ),
      
                                ),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            ElevatedButton(
                              style: ButtonStyle(
                                shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),),),
                                padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 50 , ),),
                                backgroundColor: const WidgetStatePropertyAll(kprimaryColor),
                              ),
                              onPressed: (){},
                              child: const Text(
                                "Start chat",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
      
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  width: 400,
                  height: 250,
                  decoration: BoxDecoration(
                    color: const Color(0xffD1C1B2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 20),
                    child: Row(
                      children: [
                        Stack(
                          children:
                          [
      
                            const Column(
                              children: [
      
                                CircleAvatar(
                                  backgroundImage: AssetImage("images/Mask group.png",),
                                  radius: 40,
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Icon(Icons.star_half,
                                      size: 26,
                                      color: kprimaryColor,
                                    ),
                                    Text(
                                      "4.8",
                                    ),
                                  ],
                                ),
      
                              ],
                            ),
                            Positioned(
                              right : 5,
                              top: 2,
                              child: Container(
                                width: 15,
                                height: 15,
                                decoration: BoxDecoration(
                                  color: const Color(0xff8EF4BC),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Dr Lujain Ahmed",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20,),
                            const Row(
      
                              children: [
                                Icon(Icons.location_on_outlined,
                                  color: Colors.black54,
                                ),
                                Text(
                                  " Mansoura ,Elgeish street ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black54
                                  ),
      
                                ),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            const Row(
      
                              children: [
                                Icon(Icons.phone_outlined,
                                  color: Colors.black54,
                                ),
                                Text(
                                  " 0155668755",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black54
                                  ),
      
                                ),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            const Row(
      
                              children: [
                                Icon(Icons.email_outlined,
                                  color: Colors.black54,
                                ),
                                Text(
                                  " lujaina646@gmail.com ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black54
                                  ),
      
                                ),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            ElevatedButton(
                              style: ButtonStyle(
                                shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),),),
                                padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 50 , ),),
                                backgroundColor: const WidgetStatePropertyAll(kprimaryColor),
                              ),
                              onPressed: (){},
                              child: const Text(
                                "Start chat",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
      
                          ],
                        ),
                      ],
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