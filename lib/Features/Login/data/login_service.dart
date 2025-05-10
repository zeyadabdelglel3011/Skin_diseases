import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  static const String _loginUrl = 'http://16.171.197.241:8000/api/auth/login/';
  static const String _tokenKey = 'auth_token';

  static Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(_loginUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      print('📡 Status: ${response.statusCode}');
      print('📨 Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);

        final accessToken = body['access'];
        if (accessToken != null && accessToken is String) {
          print('✅ Access token received: $accessToken');

          final prefs = await SharedPreferences.getInstance();
          await prefs.setString(_tokenKey, accessToken);
          print('📦 Access token saved to SharedPreferences');

          return {'success': true, 'token': accessToken};
        } else {
          print('⚠️ Access token missing or invalid in response');
          return {
            'success': false,
            'message': 'Access token missing in response',
          };
        }
      } else {
        final body = jsonDecode(response.body);
        return {
          'success': false,
          'message': body['detail']?.toString() ?? 'Invalid credentials',
        };
      }
    } catch (e) {
      print('❌ Login error: $e');
      return {
        'success': false,
        'message': 'Network error. Please try again.',
      };
    }
  }

}
