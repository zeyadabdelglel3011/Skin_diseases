import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/nav_bar.dart';

class AppBarChat extends StatelessWidget {
  final String userName;

  const AppBarChat({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return SafeArea( // This adds space at the top
      child: Container(
        height: 100,
        decoration: const BoxDecoration(
          color: Color(0xffD1C1B2),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => navigation(),
                    icon: const Icon(Icons.arrow_back_ios_new_outlined),
                  ),
                  const SizedBox(width: 16),
                  ClipOval(
                    child: Image.asset(
                      "images/lujy.png",
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF30A77A),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "Online",
                            style: GoogleFonts.nunito(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF30A77A),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigation() {
    Get.back();
  }
}
