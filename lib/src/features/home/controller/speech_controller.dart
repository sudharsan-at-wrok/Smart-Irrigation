import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

class SpeechController extends GetxController {
  final FlutterTts flutterTts = FlutterTts();

  Map? currentVoice;

  @override
  void onInit() {
    super.onInit();
    initTts();
  }

  void initTts() {
    flutterTts.getVoices.then((value) {
      flutterTts.setVolume(1);
      flutterTts.setPitch(1);
      try {
        List<Map> voices = List<Map>.from(value);
        voices = voices
            .where((voice) =>
                voice["name"].contains("ta") && voice["name"].contains("male"))
            .toList();
        print(voices);

        currentVoice = voices.first;
        setVoice(currentVoice!);
      } catch (e) {
        print(e);
      }
    });
  }

  void setVoice(Map voice) {
    flutterTts.setVoice({"name": voice["name"], "locale": voice["locale"]});
  }

  void speak(String text) {
    flutterTts.speak(text);
  }
}
