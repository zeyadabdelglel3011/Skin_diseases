import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class ChatAudioRecorder {
  FlutterSoundRecorder? _recorder;
  bool _isRecorderInitialized = false;

  Future<void> init() async {
    _recorder = FlutterSoundRecorder();

    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw Exception('Microphone permission not granted');
    }

    await _recorder!.openRecorder();
    _isRecorderInitialized = true;
  }

  Future<String> startRecording() async {
    if (!_isRecorderInitialized) await init();

    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/voice_message_${DateTime.now().millisecondsSinceEpoch}.aac';

    await _recorder!.startRecorder(toFile: path);
    return path;
  }

  Future<String?> stopRecording() async {
    return await _recorder!.stopRecorder();
  }

  void dispose() {
    _recorder?.closeRecorder();
  }

  bool get isRecording => _recorder?.isRecording ?? false;
}
