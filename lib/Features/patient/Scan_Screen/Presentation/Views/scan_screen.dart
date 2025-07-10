import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:graduation_project/constants.dart';
import '../../../Result_Screen/Presentation/Views/display_image_screen.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _takePicture() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  void _navigateToResultScreen() {
    if (_image != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DisplayImageScreen(imagePath: _image!.path),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select or take an image first.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbeigeColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kbeigeColor,
        centerTitle: true,
        title: const Text(
          "Scan",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Column(
              children: [
                // Image Preview
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(80),
                      width: double.infinity,
                      height: 450,
                      decoration: const BoxDecoration(
                        color: Color(0xffD1C1B2),
                      ),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.black26,
                        backgroundImage:
                        _image == null ? null : FileImage(_image!),
                        child: _image == null
                            ? const Icon(Icons.image, size: 100, color: Colors.white54)
                            : null,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 150),

                // Action Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _image = null;
                        });
                      },
                      icon: const Icon(
                        Icons.update_outlined,
                        size: 40,
                        color: Colors.black54,
                      ),
                    ),
                    GestureDetector(
                      onTap: _takePicture,
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: const Color(0xffD1C1B2),
                          border: Border.all(color: kprimaryColor, width: 5),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: _pickImage,
                      icon: const Icon(
                        Icons.image_outlined,
                        size: 40,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // Navigate Button
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: _navigateToResultScreen,
                        icon: const Icon(
                          Icons.arrow_right_alt_sharp,
                          size: 60,
                          color: kprimaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // Optional Floating Action Button (alternative to arrow)
      floatingActionButton: _image != null
          ? FloatingActionButton.extended(
        onPressed: _navigateToResultScreen,
        backgroundColor: kprimaryColor,
        label: const Text("Continue"),
        icon: const Icon(Icons.arrow_forward),
      )
          : null,
    );
  }
}
