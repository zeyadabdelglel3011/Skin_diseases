import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../constants.dart';
import 'widgets/custom_form_section.dart';
import 'widgets/upload_photo_row.dart';

class FormFields extends StatefulWidget {
  const FormFields({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  State<FormFields> createState() => _FormFieldsState();
}

class _FormFieldsState extends State<FormFields> {
  final nameController = TextEditingController();
  final diagnosisDescriptionController = TextEditingController();
  final otherPartController = TextEditingController();

  DateTime? dateOfBirth;
  int gender = 0;
  int previousDiagnosis = 0;
  int occurrence = 0;
  int duration = 0;
  int affectedPart = 0;
  File? selectedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Image without text
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'images/zzx.png',
                fit: BoxFit.cover,
                height: 250,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 30),

            _textInput("Type Your Name", controller: nameController),
            const SizedBox(height: 20),

            CustomFormSection(
              title: 'Date of Birth',
              isRequired: true,
              child: InkWell(
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2000, 1, 1),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null) {
                    setState(() {
                      dateOfBirth = picked;
                    });
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    dateOfBirth != null
                        ? '${dateOfBirth!.day.toString().padLeft(2, '0')}/'
                        '${dateOfBirth!.month.toString().padLeft(2, '0')}/'
                        '${dateOfBirth!.year}'
                        : 'Select Date',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),

            CustomFormSection(
              title: 'Gender',
              isRequired: true,
              child: _radioGroup(
                value: gender,
                labels: const ['Female', 'Male'],
                onChanged: (val) => setState(() => gender = val),
              ),
            ),

            CustomFormSection(
              title: 'Have you been diagnosed with any skin conditions before?',
              isRequired: true,
              child: Column(
                children: [
                  _radioGroup(
                    value: previousDiagnosis,
                    labels: const ['Yes', 'No'],
                    onChanged: (val) => setState(() => previousDiagnosis = val),
                  ),
                  TextFormField(
                    controller: diagnosisDescriptionController,
                    decoration: const InputDecoration(labelText: 'If Yes, describe it'),
                  ),
                ],
              ),
            ),

            CustomFormSection(
              title: 'How many times was the disease determined?',
              isRequired: true,
              child: _radioGroup(
                value: occurrence,
                labels: const ['1–5', '4–8', '8–10'],
                onChanged: (val) => setState(() => occurrence = val),
              ),
            ),

            CustomFormSection(
              title: 'How long has this disease been present?',
              isRequired: true,
              child: _radioGroup(
                value: duration,
                labels: const ['< 1 Week', '1–4 Weeks', '1–6 Months', '> 6 Months'],
                onChanged: (val) => setState(() => duration = val),
              ),
            ),

            CustomFormSection(
              title: 'Which parts of your body are affected?',
              isRequired: true,
              child: Column(
                children: [
                  _radioGroup(
                    value: affectedPart,
                    labels: const ['Face', 'Arms', 'Torso', 'Other'],
                    onChanged: (val) => setState(() => affectedPart = val),
                  ),
                  TextFormField(
                    controller: otherPartController,
                    decoration: const InputDecoration(labelText: 'Other part (if any)'),
                  ),
                ],
              ),
            ),

            CustomFormSection(
              title: 'Upload a clear photo of any medications',
              subtitle: 'Past or current',
              isRequired: true,
              child: UploadPhotoRow(
                selectedImage: selectedImage,
                onTap: _pickImage,
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _textInput(String label, {required TextEditingController controller}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xffCEB395),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          TextFormField(
            controller: controller,
            validator: (val) => val == null || val.isEmpty ? 'This field is required' : null,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: 'Your answer',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _radioGroup({
    required int value,
    required List<String> labels,
    required Function(int) onChanged,
  }) {
    return Column(
      children: List.generate(labels.length, (i) {
        return Row(
          children: [
            Radio<int>(
              fillColor:  WidgetStatePropertyAll(kprimaryColor),
              value: i + 1,
              groupValue: value,
              onChanged: (val) => onChanged(val!),
            ),
            Text(labels[i], style: const TextStyle(fontSize: 15)),
          ],
        );
      }),
    );
  }
}
