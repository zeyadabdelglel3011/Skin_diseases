import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';


class PredictService {
  static const String _baseUrl = "https://uniquely-oriented-squid.ngrok-free.app";
  static const String _endpoint = "/predict";

  static Future<Map<String, dynamic>?> fetchPrediction(String imagePath) async {
    final uri = Uri.parse("$_baseUrl$_endpoint");

    final request = http.MultipartRequest('POST', uri);
    request.files.add(await http.MultipartFile.fromPath('file', imagePath,
        contentType: MediaType('image', 'jpeg')));

    try {
      final streamedResponse = await request.send();
      final responseString = await streamedResponse.stream.bytesToString();

      if (streamedResponse.statusCode == 200) {

        return {responseString.trim(): 1.0};
      } else {
        print('API Error: ${streamedResponse.statusCode}');
        return null;
      }
    } catch (e) {
      print('Request Failed: $e');
      return null;
    }
  }

}
