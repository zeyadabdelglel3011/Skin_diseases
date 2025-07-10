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
    try {
      final response = await PredictService.fetchPrediction(widget.imagePath);
      setState(() {
        result = response;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        result = null;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to fetch prediction.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbeigeColor,
      body: SafeArea(
        child: Column(
          children: [
            // AppBar Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildBackButton(context),
                  const Text(
                    "Result",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  const SizedBox(width: 50),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Image Container
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
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
                borderRadius: BorderRadius.circular(20),
                child: Image.file(File(widget.imagePath), fit: BoxFit.cover),
              )
                  : const Center(child: Text('No image selected')),
            ),

            const SizedBox(height: 30),

            // Result Section
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : result != null && result!.isNotEmpty
                  ? ListView.builder(
                itemCount: result!.length,
                itemBuilder: (context, index) {
                  final entry = result!.entries.elementAt(index);
                  final value = double.tryParse(entry.value.toString()) ?? 0.0;
                  final percentage = (value * 100).toInt();

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24),
                    child: Column(
                      children: [
                        Text(
                          entry.key,
                          style: const TextStyle(
                            color: kprimaryColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 6),
                        LinearProgressIndicator(
                          value: value.clamp(0.0, 1.0),
                          backgroundColor: Colors.grey[300],
                          color: kprimaryColor,
                          minHeight: 10,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "$percentage%",
                          style: const TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                },
              )
                  : const Center(child: Text("No results found")),
            ),

            const SizedBox(height: 10),

            // Share Button
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kprimaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onPressed: () {
                  if (result != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DoctorsScreen(
                          imagePath: widget.imagePath,
                          result: result,
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please wait for results to load.")),
                    );
                  }

                  Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorsScreen(
                              imagePath: widget.imagePath,
                              result: result,
                            ),
                          ),
                        );

                },
                child: const Text(
                  "Share With A Doctor",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: kprimaryColor),
      ),
      child: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back, color: Colors.black54),
      ),
    );
  }
}
