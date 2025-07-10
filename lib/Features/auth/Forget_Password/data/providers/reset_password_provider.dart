import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ResetPasswordProvider extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;

  Future<bool> resetPassword({
    required String uid,
    required String token,
    required String newPassword,
  }) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    final url = Uri.parse('http://16.171.197.241:8000/api/auth/password/reset/confirm/');

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

      isLoading = false;
      notifyListeners();

      if (response.statusCode == 200) {
        return true;
      } else {
        final data = jsonDecode(response.body);
        errorMessage = data['detail'] ?? 'Password reset failed';
        return false;
      }
    } catch (e) {
      isLoading = false;
      errorMessage = 'Something went wrong. Please try again.';
      notifyListeners();
      return false;
    }
  }
}
