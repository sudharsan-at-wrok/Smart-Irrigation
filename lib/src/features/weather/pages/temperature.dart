import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/features/weather/controller/weather_controller.dart';
import 'package:iitm_app/src/features/weather/widgets/dailytemp_builder.dart';
import 'package:iitm_app/src/features/weather/graph/temp_graphs/hour_temp_graph.dart.dart';
import 'package:iitm_app/src/features/weather/widgets/time_builder.dart';

class Temperature extends StatefulWidget {
  const Temperature({
    super.key,
  });

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  final WeatherController weatherController = Get.find();
  var tmp = 0x00B0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber,
      // backgroundColor: Colors.amber,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TimeBuilder(),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 23),
              child: Obx(() {
                // weatherController.fetchData();
                var temp =
                    weatherController.minuteDataList[0].values.temperature;
                return Text(
                  "${temp.toString()}°C",
                  style: const TextStyle(
                      fontSize: 46,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54),
                );
              })),
          Padding(
            padding: const EdgeInsets.only(left: 23),
            child: Text(
              "tempReportTitle".tr,
              style: const TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.black54),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const HourTempGraph(),
          const Padding(
            padding: EdgeInsets.only(top: 40, left: 10, right: 10),
            child: DailytempBuilder(),
          )
        ],
      ),
    );
  }
}
