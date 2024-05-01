import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/features/home/controller/home_controller.dart';
import 'package:iitm_app/src/features/home/controller/realtimedatabase_controller.dart';
import 'package:iitm_app/src/features/report/widgets/reportdata_builder.dart';

class TodayTaskRecordData extends StatefulWidget {
  const TodayTaskRecordData({super.key});

  @override
  State<TodayTaskRecordData> createState() => _TodayTaskRecordDataState();
}

class _TodayTaskRecordDataState extends State<TodayTaskRecordData> {
  bool light = false;
  String todaydate =
      '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}';
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            size: 25.sp,
          ),
        ),
        centerTitle: true,
        title: Text(
          'report1'.tr,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReportDataBuilder(),
              Padding(
                padding: EdgeInsets.only(bottom: 8.w, top: 10.h),
                child: Row(
                  children: [
                    Text(
                      'date :'.tr,
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40.w),
                      child: Text(
                        '16/03/2024',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5.w, top: 13),
                child: Row(
                  children: [
                    Text(
                      'time :'.tr,
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40.w),
                      child: Text(
                        '10:00 AM - 12:00 PM',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.w, top: 18),
                child: Text(
                  'description :'.tr,
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                ),
              ),
              Obx(() {
                String value = homeController.moistureData.value;
                return SizedBox(
                  height: 200.h,
                  width: double.infinity.w,
                  child: Text(
                    'Today, $todaydate we have used 3 liters of water for water your fields, The weather seems to be cloudy, The crops are at the moisture of $value% & there is no leaks found while watering, the motor seems to be in good condition and would not require service.',
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
                  ),
                );
              })
            ],
          ),
        )),
      ),
    );
  }
}
