import 'dart:developer';
import 'package:get/get.dart';
import 'package:iitm_app/src/features/home/controller/home_controller.dart';
import 'package:iitm_app/src/features/profile/pages/profile_page.dart';
import 'package:iitm_app/src/features/report/widgets/taskrecord_data.dart';
import 'package:iitm_app/src/features/weather/pages/weather.dart';

import 'package:speech_to_text/speech_to_text.dart';

import 'speech_controller.dart';

class VoiceController extends GetxController {
  final SpeechToText speech = SpeechToText();
  final SpeechController outputSpeech = SpeechController();
  final HomeController homeController = Get.find();
  final RxBool isListening = false.obs;
  final RxString commands = ''.obs;
  Future<void> listen() async {
    try {
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
          String speechText = "how can i help you";

          outputSpeech.speak(speechText);

          await Future.delayed(const Duration(seconds: 1));
        }
        speech.listen(onResult: (result) {
          handleVoiceCommand(result.recognizedWords.toLowerCase());
        });
      }
      isListening.value = false;
    } catch (e) {
      log("Error in voice Command: $e");
    }
  }

  void handleVoiceCommand(String command) {
    switch (command) {
      case 'weather report':
        outputSpeech.speak("showing weather report");
        Get.to(() => WeatherPage());
        break;
      case 'settings':
        outputSpeech.speak("showing setting page");
        Get.to(() => const ProfilePage());
        break;

      case 'turn on motor':
        outputSpeech.speak("turning on the motor");
        homeController.toggleSwitch(true);
        break;
      case 'turn off motor':
        outputSpeech.speak("turning off the motor");
        homeController.toggleSwitch(false);
        break;
      case 'so today report':
        outputSpeech.speak("showing todays report");
        Get.to(() => const TaskRecordData());
        break;

      default:
        print('Unrecognized command: $command');
    }
  }
}
