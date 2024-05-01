import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherDialog extends StatelessWidget {
  final String weather;
  final String degree;
  final Color color;
  const WeatherDialog({
    super.key,
    required this.weather,
    required this.degree,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          weather,
          style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w500),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Text(
            '$degree°C',
            style: TextStyle(
                fontSize: 19.sp, color: color, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
