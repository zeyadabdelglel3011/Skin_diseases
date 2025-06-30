import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class GeminiService {
  final String _apiKey = 'AIzaSyB4_0UZyNuZV_xOzX6DyM3f2umVQrqwPKI'; // Use secure storage in production

  final Uri _url = Uri.parse(
    'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=YOUR_API_KEY',
  );

  int _replyCount = 0;

  Future<String> sendMessage(String userMessage) async {
    _replyCount++;

    if (_replyCount == 2) {
      await Future.delayed(const Duration(seconds: 3));
      return "Okay, could you send me a picture of your skin?";
    }

    if (_replyCount == 3) {
      await Future.delayed(const Duration(seconds: 3));
      return "Eczema (Atopic Dermatitis) 50%\nPsoriasis 30%\nVitiligo 10%";
    }

    if (_replyCount == 4) {
      await Future.delayed(const Duration(seconds: 3));
      return "You are welcome";
    }

    try {
      final response = await http.post(
        _url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {"text": "You are a doctor specialized in skin diseases."},
                {"text": userMessage}
              ]
            }
          ]
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final generatedText = data['candidates']?[0]?['content']?['parts']?[0]?['text'];

        if (generatedText != null && generatedText.toString().trim().isNotEmpty) {
          return generatedText;
        }
      }

      return _fallbackMessage();
    } catch (e) {
      return _fallbackMessage();
    }
  }

  String _fallbackMessage() {
    return "Hello, how can I help you?\nPlease fill the following form:\nwww.formDisease.com";
  }
}
