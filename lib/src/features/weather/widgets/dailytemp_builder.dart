import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/features/weather/widgets/dailytemp_details.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DailytempBuilder extends StatefulWidget {
  const DailytempBuilder({super.key});

  @override
  State<DailytempBuilder> createState() => _DailytempBuilderState();
}

class _DailytempBuilderState extends State<DailytempBuilder> {
  final List<String> dailytempreport = ['16', '20', '30'];

  final List<String> tempreportcontent = [
    'avgTemp'.tr,
    'minTemp'.tr,
    'maxTemp'.tr
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
          return DailyTempDetails(
            dailytempreport: dailytempreport[index],
            tempreportcontent: tempreportcontent[index],
          );
        },
      ),
    );
  }
}
