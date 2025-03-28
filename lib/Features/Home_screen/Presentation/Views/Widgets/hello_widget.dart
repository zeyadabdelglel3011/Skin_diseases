import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class Hello_Widget extends StatelessWidget {
  const Hello_Widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          children: [
            Text.rich(
              TextSpan(
                text: "Hello,",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  TextSpan(
                    text: "\nZeyad !",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: kprimaryColor,
                    ),
                  ),

                ],
              ),

            ),
          ],
        ),
        Row(
          children: [
            Image.asset("images/vaadin_chat.png",
              width: 25,
              height: 25,
              color: Colors.black,
            ),
            Stack(
              children:[
                IconButton(onPressed: (){},
                  icon: const Icon(Icons.notifications_none_outlined , size:30 , color: Colors.black,),
                ),
                Positioned(
                  right: 12,
                  top: 10,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: kprimaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),

              ],
            ),

          ],
        ),
      ],
    );
  }
}