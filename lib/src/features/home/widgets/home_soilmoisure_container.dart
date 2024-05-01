import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iitm_app/src/features/home/controller/home_controller.dart';

class HomeSoilMoisureContainer extends StatelessWidget {
  const HomeSoilMoisureContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController realtimeDataController = Get.find();
    return Container(
      height: 76.h,
      width: 100.w,
      decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.all(Radius.circular(10.r))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              realtimeDataController.fetchMoistureData();
              String value = realtimeDataController.moistureData.value;
              return Text(
                "$value %",
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              );
            }),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                'titleMoisture'.tr,
                style: TextStyle(
                  fontSize: 12.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
