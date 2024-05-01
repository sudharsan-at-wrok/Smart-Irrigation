import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/features/weather/controller/weather_controller.dart';

import 'package:iitm_app/src/features/weather/widgets/humidity_graph.dart';
import 'package:iitm_app/src/features/weather/widgets/time_builder.dart';

class Humidity extends StatefulWidget {
  const Humidity({super.key});

  @override
  State<Humidity> createState() => _HumidityState();
}

class _HumidityState extends State<Humidity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: const TimeBuilder(),
          ),
          Padding(
            padding: EdgeInsets.only(left: 23.w),
            child: Row(
              children: [
                GetBuilder<WeatherController>(builder: (controller) {
                  return Text(
                    "${controller.minuteDataList[0].values.humidity.toString()}%",
                    style: TextStyle(
                        fontSize: 44.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue.shade500),
                  );
                }),
                SizedBox(
                  width: 10.w,
                ),
                Icon(
                  Icons.info_outline_rounded,
                  size: 35.sp,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 23.w),
            child: Text(
              "humdityTitle".tr,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const HumidityGraph(),
          Padding(
            padding: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
            child: const DailyHumidityBuilder(),
          )
        ],
      ),
    );
  }
}

class DailyHumidityDetails extends StatelessWidget {
  const DailyHumidityDetails({
    super.key,
    required this.dailyhumidityreport,
    required this.humidityreportcontent,
  });

  final String dailyhumidityreport, humidityreportcontent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        // height: 40.h,
        width: 105.w,
        decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.all(Radius.circular(10.r))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dailyhumidityreport,
                style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                humidityreportcontent,
                style: TextStyle(
                  fontSize: 9.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DailyHumidityBuilder extends StatefulWidget {
  const DailyHumidityBuilder({super.key});

  @override
  State<DailyHumidityBuilder> createState() => _DailysoilBuilderState();
}

class _DailysoilBuilderState extends State<DailyHumidityBuilder> {
  final List<String> dailysoilreport = ['16%', '20%', '30%'];

  final List<String> soilreportcontent = [
    'avgHumidity'.tr,
    'minHumidity'.tr,
    'maxHumidity'.tr,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 77.h,
      width: double.infinity.w,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return DailyHumidityDetails(
              dailyhumidityreport: dailysoilreport[index],
              humidityreportcontent: soilreportcontent[index]);
        },
      ),
    );
  }
}
