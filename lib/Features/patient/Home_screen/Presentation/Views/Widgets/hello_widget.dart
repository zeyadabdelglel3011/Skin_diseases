import 'package:flutter/material.dart';

import '../../../../../../constants.dart';


class Hello_Widget extends StatelessWidget {
  final String email;

  const Hello_Widget({super.key, required this.email});

  String? extractName(String email) {
    if (email.isEmpty || !email.contains('@')) {
      return null; // لا اسم
    }

    final namePart = email.split('@').first;
    if (namePart.isEmpty) return null;

    return namePart[0].toUpperCase() + namePart.substring(1).toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    final String? name = extractName(email);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                text: "Hello,",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                children: name != null
                    ? [
                  TextSpan(
                    text: "\n$name !",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: kprimaryColor,
                    ),
                  ),
                ]
                    : [], // لا تضف الاسم إن لم يكن موجودًا
              ),
            ),
          ],
        ),
        Row(
          children: [
            Image.asset(
              "images/vaadin_chat.png",
              width: 25,
              height: 25,
              color: Colors.black,
            ),
            Stack(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_none_outlined,
                    size: 30,
                    color: Colors.black,
                  ),
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
