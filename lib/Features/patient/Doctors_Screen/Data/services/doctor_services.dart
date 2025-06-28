import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../models/doctor_model.dart';

class DoctorService {
  static const String _baseUrl = 'http://16.171.197.241:8000/api/patient/doctors/';

  Future<List<DoctorModel>> fetchDoctors() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');

    if (token == null) {
      throw Exception('No token found. Please log in again.');
    }

    try {
      final response = await http.get(
        Uri.parse(_baseUrl),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final decoded = json.decode(response.body);
        print('📦 Raw doctor data: $decoded');

        // Support both direct List and wrapped list under 'view'
        final List<dynamic> data;
        if (decoded is List) {
          data = decoded;
        } else if (decoded['view'] is List) {
          data = decoded['view'];
        } else {
          throw Exception('Unexpected doctor data format');
        }

        // Convert to List<DoctorModel>
        return data.map((item) => DoctorModel.fromJson(item)).toList();
      } else {
        throw Exception('❌ Failed to load doctors: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('🚨 Error fetching doctors: $e');
    }
  }
}
