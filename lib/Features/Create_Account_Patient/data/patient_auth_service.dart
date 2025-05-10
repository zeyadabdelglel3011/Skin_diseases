import 'dart:convert';
import 'package:http/http.dart' as http;

class PatientAuthService {
  static const String _baseUrl = 'http://10.0.2.2:8000/api/accounts/register/patient/';


  Future<void> registerPatient({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    final url = Uri.parse(_baseUrl);
    final requestBody = {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "password": password,
      "confirm_password": confirmPassword,
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
        print("✅ Account created successfully");
      } else {

        print("❌ Registration failed: ${response.statusCode}");
        print("🔎 Headers: ${response.headers}");
        print("🔎 Response body: ${response.body}");


        try {
          final errorData = jsonDecode(response.body);
          throw Exception('Registration failed: ${errorData.toString()}');
        } catch (_) {
          throw Exception('Registration failed with unknown error: ${response.body}');
        }
      }
    } catch (e) {
      print("❗ Exception during registration: $e");
      rethrow;
    }
  }
}
