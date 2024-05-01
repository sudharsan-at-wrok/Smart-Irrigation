import 'package:firebase_core/firebase_core.dart';

class Services {
  //
  static Future<void> initialiseFireBase() async {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyB7lm8XR3JabplK1JMX7tQQWBOYuO6WONo",
        appId: "1:964382089415:android:93b1baf37d17d4cde2dee2",
        messagingSenderId: "964382089415",
        projectId: "iot-smart-water-meter-19f34",
      ),
    );
  }

  //
}
