import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/features/auth/presentation/pages/mobile_number.dart';
import 'package:iitm_app/src/features/auth/presentation/widgets/custom_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(10.h),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: Container(
                height: 280.h,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://th.bing.com/th/id/OIP.7ZDCSqMH3nG447A6fYzksgAAAA?rs=1&pid=ImgDetMain'),
                      fit: BoxFit.fill),
                ),
              ),
            ),

            //
            Padding(
              padding: EdgeInsets.only(top: 30.h, left: 15.w, right: 15.w),
              child: Center(
                child: Text(
                  'appName'.tr,
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Center(
                child: Text(
                  'appDescription'.tr,
                  style: TextStyle(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: const Text(
                'நீரின்றி அமையாது உலகெனின் யார்யார்க்கும் வான்இன்று அமையாது ஒழுக்கு',
                style: TextStyle(
                    color: Colors.black45, fontWeight: FontWeight.w500),
              ),
            ),
            const Spacer(),
            //
            Padding(
              padding: EdgeInsets.only(top: 5.h, bottom: 15.h),
              child: CustomElevatedButton(
                fieldName: "startButton".tr,
                onPressed: () {
                  Get.to(() => PhoneNumber());
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
