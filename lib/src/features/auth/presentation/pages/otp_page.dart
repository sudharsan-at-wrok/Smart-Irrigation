import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/features/auth/controller/auth_controller.dart';
import 'package:pinput/pinput.dart';

class OTPPage extends StatelessWidget {
  final String phonenNumber;
  const OTPPage({
    super.key,
    required this.phonenNumber,
  });

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());

    TextEditingController otpController = TextEditingController();

    final Map<String, dynamic> args = Get.arguments ?? {};

    int? resendToken = args['resendToken'];

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            size: 25,
          ),
        ),
        centerTitle: true,
        title:  Text(
          'OtpTitle'.tr,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
               Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'otpDescription'.tr,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 20.h),
                child: Pinput(
                  controller: otpController,
                  length: 6,
                  showCursor: true,
                  defaultPinTheme: PinTheme(
                    width: 80.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: Colors.black38,
                      ),
                    ),
                    textStyle: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onCompleted: (value) {
                    String otp = otpController.text;
                    authController.verifyOTP(otp);
                  },
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  authController.resendOTP(phonenNumber, resendToken);
                },
                child:  Text(
                  'otpResnd'.tr,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
