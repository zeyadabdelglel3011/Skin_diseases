import 'dart:convert';
import 'package:http/http.dart' as http;

class ResetPasswordService {
  static const String baseUrl = "http://16.171.197.241:8000/api/auth/";

  static Future<Map<String, dynamic>> sendResetEmail(String email) async {
    final url = Uri.parse("${baseUrl}password/reset/");
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"email": email}),
    );

    if (response.statusCode == 200) {
      return {"success": true};
    } else {
      return {
        "success": false,
        "message": jsonDecode(response.body)['message'] ?? "Failed to send reset email"
      };
    }
  }

  static Future<Map<String, dynamic>> confirmReset({
    required String uid,
    required String token,
    required String newPassword,
  }) async {
    final url = Uri.parse("${baseUrl}password/reset/confirm/");
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "uid": uid,
        "token": token,
        "new_password": newPassword,
      }),
    );

    if (response.statusCode == 200) {
      return {"success": true};
    } else {
      return {
        "success": false,
        "message": jsonDecode(response.body)['message'] ?? "Failed to reset password"
      };
    }
  }
}
