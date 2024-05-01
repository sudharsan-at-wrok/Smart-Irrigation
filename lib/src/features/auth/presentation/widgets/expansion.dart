import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/features/auth/controller/user_details_controller.dart';
import 'package:iitm_app/src/features/auth/presentation/widgets/custom_title.dart';

class MyDropdown extends StatelessWidget {
  final UserDetailsController controller = Get.put(UserDetailsController());

  MyDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitle(title: "landUnit".tr),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 39.h,
          width: 120.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: GetBuilder<UserDetailsController>(
                  builder: (values) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      values.selectedUnit,
                    ),
                  ),
                ),
              ),
              PopupMenuButton<String>(
                color: Colors.white,
                icon: const Icon(Icons.keyboard_arrow_down),
                onSelected: (String item) {
                  controller.updateSelectedUnit(item);
                },
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    value: "cent".tr,
                    child: Text("cent".tr),
                  ),
                  PopupMenuItem(
                    value: "sqft".tr,
                    child: Text("sqft".tr),
                  ),
                  PopupMenuItem(
                    value: "acres".tr,
                    child: Text("acres".tr),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
