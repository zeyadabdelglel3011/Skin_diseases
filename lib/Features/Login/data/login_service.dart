import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginService {
  static Future<Map<String, dynamic>> login(String email, String password) async {
    const url = 'http://10.0.2.2:8000/accounts/login/';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        return {
          'success': true,
          'token': jsonDecode(response.body)['token'],
        };
      } else {
        final body = jsonDecode(response.body);
        return {
          'success': false,
          'message': body['detail']?.toString() ?? 'Invalid credentials',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Network error. Please try again.',
      };
    }
  }
}
