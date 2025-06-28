import 'dart:io';
import 'package:flutter/material.dart';

class PatientFormModel {
  final nameController = TextEditingController();
  final diagnosisDescriptionController = TextEditingController();
  final otherPartController = TextEditingController();
  DateTime? dateOfBirth;

  int gender = 1;
  int previousDiagnosis = 1;
  int occurrence = 1;
  int duration = 1;
  int affectedPart = 1;

  File? selectedImage;

  void clear() {
    nameController.clear();
    diagnosisDescriptionController.clear();
    otherPartController.clear();
    gender = 1;
    previousDiagnosis = 1;
    occurrence = 1;
    duration = 1;
    affectedPart = 1;
    selectedImage = null;
  }
}
