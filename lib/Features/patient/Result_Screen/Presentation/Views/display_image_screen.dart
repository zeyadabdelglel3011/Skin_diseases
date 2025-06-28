import 'dart:io';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../Doctors_Screen/Presentation/Views/doctors_screen.dart';
import '../../Data/predict_service.dart';

class DisplayImageScreen extends StatefulWidget {
  final String imagePath;

  const DisplayImageScreen({super.key, required this.imagePath});

  @override
  State<DisplayImageScreen> createState() => _DisplayImageScreenState();
}

class _DisplayImageScreenState extends State<DisplayImageScreen> {
  Map<String, dynamic>? result;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPrediction();
  }

  Future<void> fetchPrediction() async {
    final response = await PredictService.fetchPrediction(widget.imagePath);
    setState(() {
      result = response;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbeigeColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: kprimaryColor),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back, color: Colors.black54),
                    ),
                  ),
                  const Text(
                    "Result",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  const SizedBox(width: 50),
                ],
              ),
            ),

            const SizedBox(height: 30),

           //image
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), // Adding border radius here
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: widget.imagePath.isNotEmpty
                  ? ClipRRect(
                borderRadius: BorderRadius.circular(20), // Rounding the image
                child: Image.file(File(widget.imagePath), fit: BoxFit.cover),
              )
                  : const Text('No image selected'),
            ),

            const Spacer(),


            isLoading
                ? const CircularProgressIndicator()
                : result != null
                ? Column(
              children: result!.entries.map((entry) {
                final rawValue = double.tryParse(entry.value.toString()) ?? 0;
                final displayPercentage = (rawValue * 100).toInt();

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "${entry.key} ",
                              style: const TextStyle(
                                color: kprimaryColor,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              }).toList(),




            )
                : const Text("No results"),

            const Spacer(),

            // Button
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(kprimaryColor),
                padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 50, vertical: 15)),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DoctorsScreen()),
                );
              },
              child: const Text(
                "Share With A Doctor",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),

            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
