import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/core/services/services.dart';
import 'package:iitm_app/src/features/auth/controller/auth_controller.dart';
import 'package:iitm_app/src/features/auth/controller/user_data_controller.dart';
import 'package:iitm_app/src/features/auth/controller/user_details_controller.dart';
import 'package:iitm_app/src/features/auth/controller/user_location_controller.dart';
import 'package:iitm_app/src/features/home/controller/home_controller.dart';
import 'package:iitm_app/src/features/home/controller/realtimedatabase_controller.dart';
import 'package:iitm_app/src/features/report/controller/report_controller.dart';
import 'package:iitm_app/src/features/weather/controller/weather_controller.dart';

class DependencyInjection {
  static Future<void> initialiseFireBase() async {
    await Services.initialiseFireBase();
  }

  static Future<void> getControllersInjection() async {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => UserDataController());
    Get.lazyPut(() => UserDetailsController());
    Get.lazyPut(() => LocationController());
    Get.lazyPut(() => WeatherController());
    Get.lazyPut(() => ReportController());
    Get.lazyPut(() => RealtimeDataController());
    Get.lazyPut(() => HomeController());
  }

  static Future<void> initialise() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initialiseFireBase();
    await getControllersInjection();
    
  }
}
