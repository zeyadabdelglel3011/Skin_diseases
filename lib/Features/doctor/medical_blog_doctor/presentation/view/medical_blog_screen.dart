import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../constants.dart';
import '../../../create_blog_screen/data/provider/blog_provider.dart';


class MedicalBlogScreenDoctor extends StatelessWidget {
  const MedicalBlogScreenDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    final blogPosts = context.watch<BlogProvider>().blogPosts;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kbeigeColor,
        title: const Text(
          "Medical Vlogs",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: kbeigeColor,
      body: SafeArea(
        child: blogPosts.isEmpty
            ? const Center(
          child: Text(
            "لا يوجد تحديثات",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        )
            : SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: blogPosts
                  .map((post) => _buildBlogCard(context, post))
                  .toList(),
            ),
          ),
        ),
      ),

    );
  }

  Widget _buildBlogCard(BuildContext context, Map<String, dynamic> post) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      padding: const EdgeInsets.only(left: 30, top: 20, bottom: 10, right: 10),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(color: Color(0xffCEB395)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(post['doctorImage'], width: 60, height: 60),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(post['doctorName'],
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(CupertinoIcons.eyedropper,
                          size: 20, color: Color(0xff676666)),
                      const SizedBox(width: 10),
                      Text(post['timeEdited'],
                          style: const TextStyle(color: Color(0xff676666), fontSize: 18)),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(post['title'],
              style: TextStyle(
                  color: kprimaryColor, fontWeight: FontWeight.bold, fontSize: 25)),
          const SizedBox(height: 5),
          Text(post['content'], style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: (post['media'] as List).map<Widget>((path) {
              if (path.endsWith('.pdf')) {
                return Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey[300],
                  child: const Center(child: Icon(Icons.picture_as_pdf)),
                );
              } else if (path.endsWith('.mp4')) {
                return Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey[400],
                  child: const Center(child: Icon(Icons.videocam)),
                );
              } else {
                return Image.file(File(path), width: 300, height: 150, fit: BoxFit.cover);
              }
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSampleCard({
    required String name,
    required String image,
    required String title,
    required String time,
    required String text,
    required List<String> images,
  }) {
    return Container(
      padding: const EdgeInsets.only(left: 30.0, top: 20.0, bottom: 10.0, right: 10.0),
      width: double.infinity,
      decoration: const BoxDecoration(color: Color(0xffCEB395)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(image, width: 60, height: 60),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(CupertinoIcons.eyedropper,
                          size: 20, color: Color(0xff676666)),
                      const SizedBox(width: 10),
                      Text(time,
                          style:
                          const TextStyle(color: Color(0xff676666), fontSize: 20)),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(title,
              style: TextStyle(
                  color: kprimaryColor, fontWeight: FontWeight.bold, fontSize: 25)),
          Text(text, style: const TextStyle(fontSize: 18)),
          Row(
            children: [
              Column(
                children: [
                  Image.asset(images[0], width: 200, height: 100, fit: BoxFit.cover),
                  const SizedBox(height: 10),
                  Image.asset(images[1], width: 200, height: 100, fit: BoxFit.cover),
                ],
              ),
              const SizedBox(width: 10),
              Image.asset(images[2], width: 170, height: 215, fit: BoxFit.cover),
            ],
          ),
        ],
      ),
    );
  }
}
