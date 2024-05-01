import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/features/home/controller/home_controller.dart';

class WaterflowContainer extends StatelessWidget {
  const WaterflowContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
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
            Row(
              children: [
                Obx(() {
                  homeController.fetchMotorWaterFlowData();
                  String value = homeController.waterFlow.value.toString();
                  return Text(
                    value,
                    style:
                        TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                  );
                }),
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 5),
                  child: Text(
                    'L/min',
                    style:
                        TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                'titleMotorFlow'.tr,
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
