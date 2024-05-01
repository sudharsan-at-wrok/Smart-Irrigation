import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HumidityGraphs extends StatelessWidget {
  const HumidityGraphs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 244.h,
      width: double.infinity.w,
      child: Padding(
        padding: EdgeInsets.all(20.h),
        child: LineChart(
          LineChartData(
            gridData: const FlGridData(show: false),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      // Customize this function to return your time labels based on the indices
                      switch (value.toInt()) {
                        case 0:
                          return Padding(
                            padding: EdgeInsets.only(left: 20.w),
                            child: const Text('12 AM'),
                          );
                        case 1:
                          return const Text('1');
                        case 2:
                          return const Text('2:00');
                        case 3:
                          return const Text('3:00');
                        case 4:
                          return const Text('4:00');
                        case 5:
                          return const Text('5:00');
                        case 6:
                          return const Text('6:00');
                        case 7:
                          return const Text('7:00');
                        case 8:
                          return const Text('8:00');
                        case 9:
                          return const Text('9:00');
                        case 10:
                          return const Text('10:00');
                        case 12:
                          return const Text('11:00');
                        case 13:
                          return const Text('12 PM');
                        case 14:
                          return const SizedBox(width: 50, child: Text('1 PM'));
                        case 15:
                          return const Text('2:00');
                        case 16:
                          return const Text('4:00');
                        // Add more cases as needed
                        default:
                          return const Text('0');
                      }
                    },
                    interval: 2),
              ),
              leftTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: const Color(0xff37434d), width: 0),
            ),
            minX: 0,
            maxX: 8,
            minY: 0,
            maxY: 8,
            lineBarsData: [
              LineChartBarData(
                spots: [
                  const FlSpot(0, 5),
                  const FlSpot(2, 6),
                  const FlSpot(4, 4),
                  const FlSpot(6, 5),
                  const FlSpot(8, 3),
                ],
                isCurved: true,
                barWidth: 3,
                color: Colors.blue,
                dotData: const FlDotData(show: false),
                belowBarData: BarAreaData(show: false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
