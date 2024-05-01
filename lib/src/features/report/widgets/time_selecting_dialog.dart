import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/features/auth/presentation/widgets/custom_button.dart';
import 'package:iitm_app/src/features/auth/presentation/widgets/custom_textfield.dart';
import 'package:iitm_app/src/features/auth/presentation/widgets/custom_title.dart';
import 'package:iitm_app/src/features/report/controller/report_controller.dart';

Future timeSelector(BuildContext context) {
  final ReportController reportController = Get.find();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  return showDialog(
    useSafeArea: true,
    context: context,
    builder: (context) {
      return Dialog(
        child: Container(
          height: 310.h,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    const CustomTitle(title: "Select Time Interval"),
                  ],
                ),
                Divider(
                  color: Colors.grey[200],
                ),
                CustomTextField(
                  fieldName: "Start Time",
                  controller: startTimeController,
                  icon: const Icon(Icons.timelapse_sharp),
                ),
                CustomTextField(
                  fieldName: "End Time",
                  controller: endTimeController,
                  icon: const Icon(Icons.timelapse_sharp),
                ),
                CustomElevatedButton(
                  onPressed: () {
                    reportController.startTime.value = startTimeController.text;
                    reportController.endTime.value = endTimeController.text;
                    Get.back();
                  },
                  fieldName: "Submit",
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
