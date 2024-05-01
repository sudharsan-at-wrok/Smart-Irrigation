import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/features/weather/models/day_weather_model.dart';
import 'package:iitm_app/src/features/weather/controller/weather_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class DayTempGraph extends StatelessWidget {
  const DayTempGraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240.h,
      width: double.infinity.w,
      child: Padding(
        padding: EdgeInsets.all(20.h),
        child: Obx(
          () {
            final List<DayData> minuteDataList =
                Get.put(WeatherController()).dailyDataList;

            final List<double> temperatures = minuteDataList
                .map((data) => data.values.temperatureAvg ?? 0.0)
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
                        final currentDay = now.day;

                        final nextFiveDays =
                            List.generate(6, (index) => currentDay + index);

                        if (value >= 0 && value < nextFiveDays.length) {
                          final days = nextFiveDays[value.toInt()];
                          final formattedHour = DateFormat('').format(
                              DateTime(now.year, now.month, now.day, days));
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
                minY:
                    temperatures.isNotEmpty ? temperatures.reduce(min) - 2 : 0,
                maxY:
                    temperatures.isNotEmpty ? temperatures.reduce(max) + 2 : 10,
                lineBarsData: [
                  LineChartBarData(
                    spots: List.generate(
                      temperatures.length,
                      (index) => FlSpot(index.toDouble(), temperatures[index]),
                    ),
                    isCurved: true,
                    barWidth: 3,
                    color: Colors.orange,
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
