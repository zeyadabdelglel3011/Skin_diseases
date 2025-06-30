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

      if (response.statusCode != 200) {
        throw Exception('❌ Failed to load doctors: ${response.statusCode}');
      }

      final decoded = json.decode(response.body);
      print('📦 Raw doctor data: $decoded');

      // Handle both raw list and wrapped under 'view'
      final List<dynamic> data = decoded is List
          ? decoded
          : (decoded['view'] is List ? decoded['view'] : throw Exception('Unexpected doctor data format'));

      // Assign descending ratings (starting from 5.0 down by 0.1 each)
      double startRating = 5.0;
      const double step = 0.2;

      final images = [
        'images/lujy.png',
        'images/Mask group.png',
        'images/zeyad.png',
        'images/lujy.png',


      ];

      return List.generate(data.length, (index) {
        final rating = (startRating - (index * step)).clamp(0.0, 5.0);
        final profileImage = images[index % images.length];
        final doctorJson = data[index];
        doctorJson['profileImage'] = profileImage;
        return DoctorModel.fromJson(doctorJson, manualRating: rating);
      });

    } catch (e) {
      throw Exception('🚨 Error fetching doctors: $e');
    }
  }
}
