import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/model/patient_form_model.dart';

class FormViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final form = PatientFormModel();

  void updateGender(int value) {
    form.gender = value;
    notifyListeners();
  }

  void updateDiagnosis(int value) {
    form.previousDiagnosis = value;
    notifyListeners();
  }

  void updateOccurrence(int value) {
    form.occurrence = value;
    notifyListeners();
  }

  void updateDuration(int value) {
    form.duration = value;
    notifyListeners();
  }

  void updateAffectedPart(int value) {
    form.affectedPart = value;
    notifyListeners();
  }

  void updateDateOfBirth(DateTime date) {
    form.dateOfBirth = date;
    notifyListeners();
  }

  void setImage(File image) {
    form.selectedImage = image;
    notifyListeners();
  }

  void clearForm() {
    form.clear();
    notifyListeners();
  }

  Future<void> submitForm(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    final patientId = prefs.getInt('patient_id');

    if (token == null || patientId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You are not authenticated.')),
      );
      return;
    }

    final uri = Uri.parse('http://16.171.197.241:8000/api/patient/forms/');
    final request = http.MultipartRequest('POST', uri)
      ..headers['Authorization'] = 'Bearer $token'
      ..fields['patient'] = patientId.toString()
      ..fields['name'] = form.nameController.text.trim()
      ..fields['gender'] = form.gender == 1 ? 'Female' : 'Male'
      ..fields['previous_diagnosis'] = form.previousDiagnosis == 1 ? 'Yes' : 'No'
      ..fields['diagnosis_description'] = form.diagnosisDescriptionController.text.trim()
      ..fields['condition_frequency'] = form.occurrence.toString()
      ..fields['duration'] = form.duration.toString()
      ..fields['affected_body_parts'] = jsonEncode([form.affectedPart])
      ..fields['other_affected_part'] = form.otherPartController.text.trim();

    if (form.dateOfBirth != null) {
      final dob = form.dateOfBirth!;
      final formattedDOB = '${dob.year}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}';
      request.fields['date_of_birth'] = formattedDOB;
    }

    if (form.selectedImage != null && await form.selectedImage!.exists()) {
      request.files.add(await http.MultipartFile.fromPath(
        'medication_photo',
        form.selectedImage!.path,
      ));
    }

    try {
      print("🛂 Token: $token");
      print("📤 Sending form data: ${request.fields}");
      if (form.selectedImage != null) {
        print("🖼️ Image path: ${form.selectedImage!.path}");
      }

      final response = await request.send();
      final respBody = await response.stream.bytesToString();

      print("✅ Status Code: ${response.statusCode}");
      print("📨 Response Body: $respBody");

      final isSuccess = response.statusCode == 200 || response.statusCode == 201;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(isSuccess ? 'Form submitted!' : 'Submission failed: $respBody'),
        ),
      );
    } catch (e) {
      print("❌ Exception: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An error occurred. Please try again.')),
      );
    }
  }
}
