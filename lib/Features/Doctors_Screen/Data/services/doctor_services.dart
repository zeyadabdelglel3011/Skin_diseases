import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../models/doctor_model.dart';

class DoctorService {
  static const String _baseUrl = 'http://16.171.197.241:8000/api/patient/doctors/';

  Future<List<DoctorModel>> fetchDoctors() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token'); // Get saved token

    if (token == null) {
      throw Exception('No token found. Please log in again.');
    }

    final response = await http.get(
      Uri.parse(_baseUrl),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      print('📦 Raw doctor data: $body');

      final List<dynamic> data;
      if (body is List) {
        data = body;
      } else if (body['data'] is List) {
        data = body['data'];
      } else {
        throw Exception('Unexpected doctor data format');
      }

      return data.map((json) => DoctorModel.fromJson(json)).toList();
    } else {
      throw Exception('❌ Failed to load doctors: ${response.statusCode}');
    }
  }
}
