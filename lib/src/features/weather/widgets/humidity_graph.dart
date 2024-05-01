import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/features/weather/models/hour_weather_model.dart.dart';
import 'package:iitm_app/src/features/weather/controller/weather_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class HumidityGraph extends StatelessWidget {
  const HumidityGraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240.h,
      width: double.infinity.w,
      child: Padding(
        padding: EdgeInsets.all(20.h),
        child: Obx(
          () {
            final List<HourData> minuteDataList =
                Get.put(WeatherController()).minuteDataList;

            final List<double> humidity = minuteDataList
                .map((data) => data.values.humidity ?? 0.0)
                .toList();

            return LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        final now = DateTime.now();
                        final currentHour = now.hour;

                        final nextFiveHours =
                            List.generate(6, (index) => currentHour + index);

                        if (value >= 0 && value < nextFiveHours.length) {
                          final hour = nextFiveHours[value.toInt()];
                          final formattedHour = DateFormat('ha').format(
                              DateTime(now.year, now.month, now.day, hour));
                          return Text(formattedHour);
                        } else {
                          return const Text("");
                        }
                      },
                      interval: 1,
                    ),
                  ),
                  leftTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: const Color(0xff37434d), width: 0),
                ),
                minX: 0,
                maxX: 5,
                minY: humidity.isNotEmpty ? humidity.reduce(min) - 2 : 0,
                maxY: humidity.isNotEmpty ? humidity.reduce(max) + 2 : 10,
                lineBarsData: [
                  LineChartBarData(
                    spots: List.generate(
                      humidity.length,
                      (index) => FlSpot(index.toDouble(), humidity[index]),
                    ),
                    isCurved: true,
                    barWidth: 3,
                    color: Colors.blue,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
