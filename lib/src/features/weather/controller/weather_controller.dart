import 'dart:developer';
import 'package:get/get.dart';
import 'package:iitm_app/src/core/api/api_fetch_hour_data.dart.dart';
import 'package:iitm_app/src/features/auth/controller/user_data_controller.dart';
import 'package:iitm_app/src/features/weather/models/day_weather_model.dart';
import 'package:iitm_app/src/features/weather/models/hour_weather_model.dart.dart';

class WeatherController extends GetxController {
  final UserDataController userDataContrller = Get.find();

  final minuteDataList = <HourData>[].obs;
  final dailyDataList = <DayData>[].obs;

  @override
  void onInit() {
    super.onInit();
    userDataContrller.getUserDetails();
    fetchHourData();
    // fetchDailyData();
  }

  void fetchHourData() async {
    try {
      await userDataContrller.getUserDetails();

      var data = await FetchHourWeatherData().fetchHourData(
        userDataContrller.userDetails[0].latitude!,
        userDataContrller.userDetails[0].longitude!,
      );

      minuteDataList.assignAll(data);
    } catch (e) {
      log("Error fetching hour weather data: $e");
    }
  }

  // void fetchDailyData() async {
  //   try {
  //     await userDataContrller.getUserDetails();

  //     var data = await FetchDayWeatherData().fetchDayData(
  //       userDataContrller.userDetails[0].latitude!,
  //       userDataContrller.userDetails[0].longitude!,
  //     );

  //     dailyDataList.assignAll(data);
  //   } catch (e) {
  //     log("Error fetching Daily weather data: $e");
  //   }
  // }
}
