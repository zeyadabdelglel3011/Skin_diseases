import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Features/doctor/nav_bar_doctor.dart';
import 'package:graduation_project/constants.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../../nav_bar.dart';


class MedicinesDetailsDoctor extends StatelessWidget {
  final String title;
  final String imagePath;

  const MedicinesDetailsDoctor({
    super.key,
    required this.title,
    required this.imagePath,
  });

  final List<Map<String, String>> pharmacies = const [
    {
      "name": "Elezaby pharmacy",
      "image": "images/elez.png",
      "url": "www.elezabypharamcy.com",
      "location": "Mansoura, Kanat Swez Street",
      "phone": "19956"
    },
    {
      "name": "Eltarshouby pharmacy",
      "image": "images/elta.png",
      "url": "www.eltarshoubypharamcy.com",
      "location": "Mansoura, Kanat Swez Street",
      "phone": "19956"
    },
    {
      "name": "Sally pharmacy",
      "image": "images/sall.png",
      "url": "www.sallypharamcy.com",
      "location": "Mansoura, Kanat Swez Street",
      "phone": "19956"
    },
    {
      "name": "Amasha pharmacy",
      "image": "images/ama.png",
      "url": "www.amashapharamcy.com",
      "location": "Mansoura, Kanat Swez Street",
      "phone": "19956"
    },
  ];

  Widget buildPharmacyCard(Map<String, String> data) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xffD1C1B2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            data["image"]!,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data["name"]!,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(CupertinoIcons.link),
                    const SizedBox(width: 10),
                    Flexible(child: Text(data["url"]!)),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(CupertinoIcons.location_solid),
                    const SizedBox(width: 10),
                    Flexible(child: Text(data["location"]!)),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(LineAwesomeIcons.phone_volume_solid),
                    const SizedBox(width: 10),
                    Text(data["phone"]!),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbeigeColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: kprimaryColor),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NavBarDoctor(index: 3),
                      ),
                    );
                  },
                  icon: const Icon(Icons.arrow_back, color: Colors.black54),
                ),
              ),

              const SizedBox(height: 10),

              // Dynamic Title
              Center(
                child: Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),

              const SizedBox(height: 10),

              // Dynamic Image
              Center(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.fill,
                  width: 250,
                  height: 200,
                ),
              ),

              const SizedBox(height: 20),

              // Available In Text
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Available In:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: kprimaryColor,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Pharmacies
              ...pharmacies.map(buildPharmacyCard).toList(),

              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }
}
