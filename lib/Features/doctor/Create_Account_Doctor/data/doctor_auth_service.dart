import 'dart:convert';
import 'package:http/http.dart' as http;

class DoctorAuthService {
  static const String _baseUrl = 'http://16.171.197.241:8000/api/auth/register/doctor/';

  Future<void> registerDoctor({
    required String firstName,
    required String lastName,
    required String idNumber,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    final url = Uri.parse(_baseUrl);
    final requestBody = {
      "first_name": firstName,
      "last_name": lastName,
      "id_number": idNumber,
      "email": email,
      "password": password,
      "password2": confirmPassword,
    };

    print("🔍 Sending POST to $url");
    print("📦 Request body: ${jsonEncode(requestBody)}");

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 201) {
        print("✅ Doctor account created successfully");
      } else {
        print("❌ Registration failed: ${response.statusCode}");
        print("🔎 Response body: ${response.body}");

        final errorData = jsonDecode(response.body);
        throw Exception('Registration failed: ${errorData.toString()}');
      }
    } catch (e) {
      print("❗ Exception during registration: $e");
      rethrow;
    }
  }
}
