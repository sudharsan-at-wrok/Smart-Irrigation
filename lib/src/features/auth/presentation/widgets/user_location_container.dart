import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/features/auth/presentation/widgets/custom_title.dart';
import 'package:iitm_app/src/features/auth/controller/user_location_controller.dart';

class UserLocationContainer extends StatelessWidget {
  const UserLocationContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController locationTextController =
        TextEditingController();
    final LocationController locationController = LocationController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitle(title: "yourAddress".tr),
        SizedBox(
          height: 5.h,
        ),
        Obx(() {
          String location = locationController.address.value;
          locationTextController.text = location;
          locationController.address.value = locationTextController.text;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextField(
                  minLines: 1,
                  controller: locationTextController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.location_on),
                    prefixIconColor: Colors.blue,
                    hintText: "address".tr,
                    contentPadding: EdgeInsets.all(10.r),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.5.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  textInputAction: TextInputAction.done,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              GestureDetector(
                onTap: () {
                  locationController.getCurrentLocation();
                },
                child: Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.my_location,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}
