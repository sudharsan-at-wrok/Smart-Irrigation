// import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceController extends GetxController {
  RxString firstName = ''.obs;
  RxBool loginStatus = false.obs;
  RxString lastname = ''.obs;
  RxString email = ''.obs;
  RxString address = ''.obs;
  RxString plantType = ''.obs;
  RxString landSize = ''.obs;
  RxString landUnit = ''.obs;
  RxDouble lat = 0.0.obs;
  RxDouble lon = 0.0.obs;
  final SharedPreferences pref =
      SharedPreferences.getInstance() as SharedPreferences;

}
