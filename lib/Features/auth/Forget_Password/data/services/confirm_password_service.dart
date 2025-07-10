import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String _baseUrl = 'http://16.171.197.241:8000/api/auth';

  /// Resets password using provided UID, token, and new password.
  ///
  /// Returns:
  /// - `{'success': true}` if reset was successful
  /// - `{'success': false, 'message': 'error message'}` on failure
  static Future<Map<String, dynamic>> resetPassword({
    required String uid,
    required String token,
    required String newPassword,
  }) async {
    final url = Uri.parse('$_baseUrl/password/reset/confirm/');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'uid': uid,
          'token': token,
          'new_password': newPassword,
        }),
      );

      if (response.statusCode == 200) {
        return {'success': true};
      } else {
        // Handle error response from backend
        final Map<String, dynamic> data = jsonDecode(response.body);
        return {
          'success': false,
          'message': data['detail'] ?? 'Password reset failed. Please try again.',
        };
      }
    } catch (e) {
      // Handle network or decoding errors
      return {
        'success': false,
        'message': 'Network error. Please check your connection and try again.',
      };
    }
  }
}
