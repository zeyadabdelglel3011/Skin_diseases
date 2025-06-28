import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graduation_project/Features/patient/form_screen/presentation/views/widgets/custom_form_section.dart';
import 'package:graduation_project/Features/patient/form_screen/presentation/views/widgets/upload_photo_row.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../view_model/form_view_model.dart';


class FormFields extends StatelessWidget {
  const FormFields({super.key, required FormViewModel viewModel});

  Future<void> _pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      Provider.of<FormViewModel>(context, listen: false).setImage(File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<FormViewModel>(context);
    final form = viewModel.form;

    return Form(
      key: viewModel.formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('images/zzx.png', fit: BoxFit.cover, height: 250, width: double.infinity),
            const SizedBox(height: 20),
            _titleSection(),
            const SizedBox(height: 30),
            _textInput('Type Your Name', controller: form.nameController),
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
                    viewModel.updateDateOfBirth(picked);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    viewModel.form.dateOfBirth != null
                        ? '${viewModel.form.dateOfBirth!.day.toString().padLeft(2, '0')}/'
                        '${viewModel.form.dateOfBirth!.month.toString().padLeft(2, '0')}/'
                        '${viewModel.form.dateOfBirth!.year.toString().substring(2)}'
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
                context,
                value: form.gender,
                labels: const ['Female', 'Male'],
                onChanged: viewModel.updateGender,
              ),
            ),
            CustomFormSection(
              title: 'Have you been diagnosed with any skin conditions before?',
              isRequired: true,
              child: Column(
                children: [
                  _radioGroup(
                    context,
                    value: form.previousDiagnosis,
                    labels: const ['Yes', 'No'],
                    onChanged: viewModel.updateDiagnosis,
                  ),
                  TextFormField(
                    controller: form.diagnosisDescriptionController,
                    decoration: const InputDecoration(labelText: 'If Yes, Describe it'),
                  ),
                ],
              ),
            ),
            CustomFormSection(
              title: 'How many times was the disease determined?',
              isRequired: true,
              child: _radioGroup(
                context,
                value: form.occurrence,
                labels: const ['1-5', '4-8', '8-10'],
                onChanged: viewModel.updateOccurrence,
              ),
            ),
            CustomFormSection(
              title: 'How long has this disease been present?',
              isRequired: true,
              child: _radioGroup(
                context,
                value: form.duration,
                labels: const ['< 1 Week', '1-4 Weeks', '1-6 Months', '> 6 Months'],
                onChanged: viewModel.updateDuration,
              ),
            ),
            CustomFormSection(
              title: 'Which parts of your body are affected?',
              isRequired: true,
              child: Column(
                children: [
                  _radioGroup(
                    context,
                    value: form.affectedPart,
                    labels: const ['Face', 'Arms', 'Torso', 'Other'],
                    onChanged: viewModel.updateAffectedPart,
                  ),
                  TextFormField(
                    controller: form.otherPartController,
                    decoration: const InputDecoration(labelText: 'Other part'),
                  ),
                ],
              ),
            ),
            CustomFormSection(
              title: 'Upload a clear photo of any medications',
              subtitle: 'past or current',
              isRequired: true,
              child: UploadPhotoRow(
                selectedImage: form.selectedImage,
                onTap: () => _pickImage(context),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  await viewModel.submitForm(context);
                },
                child: const Text('Submit'),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _radioGroup(
      BuildContext context, {
        required int value,
        required List<String> labels,
        required Function(int) onChanged,
      }) {
    return Column(
      children: List.generate(labels.length, (i) {
        return Row(
          children: [
            Radio<int>(
              value: i + 1,
              groupValue: value,
              onChanged: (v) => onChanged(v!),
            ),
            Text(labels[i], style: const TextStyle(fontSize: 15)),
          ],
        );
      }),
    );
  }

  Widget _titleSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: const Color(0xffCEB395),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Text(
        'Skin Disease Patient Intake Form',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _textInput(String label, {required TextEditingController controller}) {
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 10, bottom: 20),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: const Color(0xffCEB395),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          TextFormField(
            controller: controller,
            validator: (val) => val == null || val.isEmpty ? 'This field is required' : null,
            decoration: const InputDecoration(labelText: 'Your answer'),
          ),
        ],
      ),
    );
  }
}
