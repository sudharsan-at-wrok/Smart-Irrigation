import 'package:get/get.dart';
import 'package:iitm_app/src/features/home/controller/speech_controller.dart';
import 'package:speech_to_text/speech_to_text.dart';

class VoiceCommandController extends GetxController {
  final SpeechToText speech = SpeechToText();
  final SpeechController outputSpeech = SpeechController();
  final RxBool isListening = false.obs;
  final RxBool hear = false.obs;
  final RxString text = ''.obs;
  final RxString firstName = ''.obs;
  final RxString lastName = ''.obs;
  final RxString email = ''.obs;

  Future<void> listen(String ttsText) async {
    if (isListening.value == false) {
      print("i am working");
      bool available = await speech.initialize(
        onStatus: (status) {
          print('status: $status');
        },
        onError: (error) {
          print('error: $error');
        },
      );

      if (available) {
        isListening.value = true;
      }

      voiceCommand(ttsText);
    }
    isListening.value = false;
  }

  Future<void> voiceCommand(String inputText) async {
    outputSpeech.speak(inputText);

    await Future.delayed(const Duration(seconds: 2));

    await speech.listen(
      onResult: (result) {
        if (inputText.contains("Enter your first name")) {
          firstName.value = result.recognizedWords;
          print(firstName.value);
        } else if (inputText.contains("Enter your last name")) {
          lastName.value = result.recognizedWords;
          print(lastName.value);
        } else if (inputText.contains("Enter your email address")) {
          email.value = result.recognizedWords.toLowerCase();
          print(text.value);
        }
      },
      
    );
  }
}
