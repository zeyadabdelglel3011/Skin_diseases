import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

const Color kprimaryColor = Color(0xFFE85729);

const Color kbeigeColor = Color(0xFFF5E9DA);


void showSnakBar(BuildContext context , String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message) ,),);
}

Future<void> createAccountUser() async {
  var auth = FirebaseAuth.instance;
  var email;
  var password;
  UserCredential user = await  auth.createUserWithEmailAndPassword(
    email: email!,
    password: password!,
  );
}