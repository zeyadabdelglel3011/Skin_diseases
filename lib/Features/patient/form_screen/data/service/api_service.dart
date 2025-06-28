import 'dart:io';
import 'package:http/http.dart' as http;
import '../../../../auth/Forget_Password/data/services/confirm_password_service.dart';
import '../model/patient_form_model.dart';

class ApiService {
  static Future<String> submitForm(PatientFormModel form) async {
    final token = await AuthService.getToken();
    if (token == null) return 'Not authenticated. Please log in.';

    final uri = Uri.parse('http://16.171.197.241:8000/api/patient/forms/');
    final request = http.MultipartRequest('POST', uri);

    request.headers['Authorization'] = 'Bearer $token';

    request.fields['name'] = form.nameController.text.trim();
    request.fields['gender'] = form.gender == 1 ? 'Female' : 'Male';
    request.fields['previous_diagnosis'] = form.previousDiagnosis == 1 ? 'Yes' : 'No';
    request.fields['diagnosis_description'] = form.diagnosisDescriptionController.text.trim();
    request.fields['disease_occurrence'] = form.occurrence.toString();
    request.fields['disease_duration'] = form.duration.toString();
    request.fields['affected_part'] = form.affectedPart.toString();
    request.fields['other_affected_part'] = form.otherPartController.text.trim();

    if (form.selectedImage != null && await form.selectedImage!.exists()) {
      request.files.add(await http.MultipartFile.fromPath(
        'medication_photo',
        form.selectedImage!.path,
      ));
    }

    try {
      print("Token: $token");
      print("Submitting form with fields:");
      request.fields.forEach((key, value) {
        print('$key: "$value"');
      });
      if (form.selectedImage != null) {
        print('Image path: ${form.selectedImage!.path}');
      }

      final response = await request.send();
      final respBody = await response.stream.bytesToString();

      print("Status Code: ${response.statusCode}");
      print("Response Body: $respBody");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return 'Form submitted!';
      } else {
        return 'Submission failed: ${response.statusCode} - $respBody';
      }
    } catch (e) {
      print("Exception: $e");
      return 'An error occurred: $e';
    }
  }
}
