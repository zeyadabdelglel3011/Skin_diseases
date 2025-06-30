import 'package:flutter/material.dart';


class AppHintsWidget extends StatelessWidget {
  const AppHintsWidget({
    super.key, required this.pic, required this.title, required this.desc,
  });

  final String pic, title, desc;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(

        child: Container(
        width: MediaQuery.of(context).size.width-30,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xffD1C1B2),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Text(
                    desc,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 10,
                      color: Colors.grey.shade600,
                    ),
                  ),

                ],
              ),
              Image.asset(pic,
                width: 80, height: 90,
              ),
            ],
          ),
        ),

                ),
      ),
    );
  }
}