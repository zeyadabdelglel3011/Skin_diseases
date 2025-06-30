import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


import 'package:graduation_project/Features/Splash_Screens/presentation/views/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';


import 'package:graduation_project/nav_bar.dart';
import 'package:provider/provider.dart';




import 'Features/patient/Scan_Screen/Data/provider/scan_provider.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ✅ REQUIRED
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(create)=> ScanProvider() ),
      ],
      child: const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home:
        //ProfileDoctorScreen(),
        //MedicinesDetails(),
        SplashScreen(),
      ),
    );

  }
}
