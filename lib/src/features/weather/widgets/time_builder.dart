import 'package:flutter/material.dart';
import 'package:iitm_app/src/features/weather/widgets/time.dart';

class TimeBuilder extends StatefulWidget {
  const TimeBuilder({super.key});

  @override
  State<TimeBuilder> createState() => _TimeBuilderState();
}

class _TimeBuilderState extends State<TimeBuilder> {
  final List<String> time = ['24Hours', '1Weak', '1Month'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        itemCount: 3,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Days(time: time[index]);
        },
      ),
    );
  }
}
