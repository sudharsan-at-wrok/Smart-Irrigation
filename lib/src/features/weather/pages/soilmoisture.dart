import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/features/weather/widgets/soilmoisture_graph.dart';
import 'package:iitm_app/src/features/weather/widgets/time_builder.dart';

class SoilMoisture extends StatefulWidget {
  const SoilMoisture({super.key});

  @override
  State<SoilMoisture> createState() => _SoilMoistureState();
}

class _SoilMoistureState extends State<SoilMoisture> {
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
                Text(
                  "11.52%",
                  style: TextStyle(
                      fontSize: 44.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(0, 213, 130, 1)),
                ),
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
            child: const Text(
              "Soil Moisture",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SoilMoistureGraph(),
          Padding(
            padding: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
            child: const DailySoilBuilder(),
          )
        ],
      ),
    );
  }
}

class DailysoilDetails extends StatelessWidget {
  const DailysoilDetails({
    super.key,
    required this.dailysoilreport,
    required this.soilreportcontent,
  });

  final String dailysoilreport, soilreportcontent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 40.h,
        width: 105.w,
        decoration: BoxDecoration(
            color: Colors.green.shade50,
            borderRadius: BorderRadius.all(Radius.circular(10.r))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dailysoilreport,
                style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                soilreportcontent,
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

class DailySoilBuilder extends StatefulWidget {
  const DailySoilBuilder({super.key});

  @override
  State<DailySoilBuilder> createState() => _DailysoilBuilderState();
}

class _DailysoilBuilderState extends State<DailySoilBuilder> {
  final List<String> dailysoilpreport = ['16%', '20%', '30%'];

  final List<String> soilreportcontent = ['avgMoisture'.tr, 'minMoisture'.tr, 'maxMoisture'.tr];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76.h,
      width: double.infinity.w,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return DailysoilDetails(
              dailysoilreport: dailysoilpreport[index],
              soilreportcontent: soilreportcontent[index]);
        },
      ),
    );
  }
}
