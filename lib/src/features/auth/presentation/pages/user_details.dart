import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/features/application_page/pages/application_page.dart';
import 'package:iitm_app/src/features/auth/controller/user_details_controller.dart';
import 'package:iitm_app/src/features/auth/presentation/widgets/custom_button.dart';
import 'package:iitm_app/src/features/auth/presentation/widgets/custom_title.dart';
import 'package:iitm_app/src/features/auth/presentation/widgets/custom_user_detail.dart';
import 'package:iitm_app/src/features/auth/presentation/widgets/expansion.dart';
import 'package:iitm_app/src/features/auth/presentation/widgets/landsize_custom_textfield.dart';
import 'package:iitm_app/src/features/auth/presentation/widgets/user_location_container.dart';
import 'package:iitm_app/src/features/auth/controller/user_location_controller.dart';
import 'package:iitm_app/src/features/home/controller/voice_command_controller.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final LocationController locationController = Get.find();
  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController landSizeController = TextEditingController();

  final TextEditingController userLocationController = TextEditingController();
  final VoiceCommandController voiceCommandController =
      VoiceCommandController();

  void texfieldClear() {
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    landSizeController.clear();
    userLocationController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final UserDetailsController userDetailsController = Get.put(
      UserDetailsController(),
    );

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            size: 25.sp,
          ),
        ),
        centerTitle: true,
        title: Text(
          'userTitle'.tr,
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() {
                  firstNameController.text =
                      voiceCommandController.firstName.value;

                  return CustomUserDetailForm(
                    fieldName: "firstName".tr,
                    controller: firstNameController,
                    icon: const Icon(
                      Icons.person,
                    ),
                    secondIcon: const Icon(
                      Icons.mic,
                      color: Colors.blue,
                    ),
                    function: () {
                      voiceCommandController.listen(
                        "Enter your first name",
                      );
                    },
                  );
                }),
                Obx(() {
                  lastNameController.text =
                      voiceCommandController.lastName.value;

                  return CustomUserDetailForm(
                    fieldName: "lastName".tr,
                    controller: lastNameController,
                    icon: const Icon(
                      Icons.person,
                    ),
                    secondIcon: const Icon(
                      Icons.mic,
                      color: Colors.blue,
                    ),
                    function: () {
                      voiceCommandController.listen(
                        "Enter your last name",
                      );
                    },
                  );
                }),
                Obx(() {
                  String inputText = voiceCommandController.email.value;
                  emailController.text = inputText;
                  return CustomUserDetailForm(
                      fieldName: "email".tr,
                      controller: emailController,
                      icon: const Icon(
                        Icons.email,
                      ),
                      secondIcon: const Icon(
                        Icons.mic,
                        color: Colors.blue,
                      ),
                      function: () {
                        voiceCommandController.listen(
                          "Enter your email address",
                        );
                      });
                }),
                CustomTitle(title: "cropName".tr),
                Padding(
                  padding: EdgeInsets.only(top: 5.h, bottom: 10.h),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Theme(
                      data: ThemeData(
                        dividerColor: Colors.transparent,
                      ),
                      child: ExpansionTile(
                        initiallyExpanded: false,
                        title: GetBuilder<UserDetailsController>(
                          builder: (value) {
                            return Text(value.cropSelectedName);
                          },
                        ),
                        children: [
                          ListTile(
                            onTap: () {
                              userDetailsController
                                  .updateCropSelectedUnit('paddy'.tr);
                            },
                            title: Text('paddy'.tr),
                          ),
                          ListTile(
                            onTap: () {
                              userDetailsController
                                  .updateCropSelectedUnit('wheat'.tr);
                            },
                            title: Text('wheat'.tr),
                          ),
                          ListTile(
                            onTap: () {
                              userDetailsController
                                  .updateCropSelectedUnit('peas'.tr);
                            },
                            title: Text('peas'.tr),
                          ),
                          ListTile(
                            onTap: () {
                              userDetailsController
                                  .updateCropSelectedUnit('kidneyBeans'.tr);
                            },
                            title: Text('kidneyBeans'.tr),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 5.h),
                      child: SizedBox(
                        width: 190.w,
                        child: LandsizeCustomTextField(
                          controller: landSizeController,
                          fieldName: "landDetails".tr,
                          icon: const Icon(
                            Icons.landscape,
                          ),
                        ),
                      ),
                    ),
                    MyDropdown(),
                  ],
                ),
                const UserLocationContainer(),
                Obx(() {
                  locationController.getCurrentLocation();
                  String address = locationController.address.value;
                  double lat = locationController.latitude.value;
                  double lon = locationController.longitude.value;

                  return Padding(
                    padding: EdgeInsets.only(top: 15.h),
                    child: CustomElevatedButton(
                      fieldName: "submitButton".tr,
                      onPressed: () {
                        log("demo longitude: $lon");
                        log("demo latitude: $lat");
                        log("demo address: $address");
                        userDetailsController.createUserDocument(
                          firstNameController.text,
                          lastNameController.text,
                          emailController.text,
                          userDetailsController.cropSelectedName,
                          landSizeController.text,
                          userDetailsController.selectedUnit,
                          address,
                          lat,
                          lon,
                          true,
                        );

                        texfieldClear();

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const ApplicationPage(),
                          ),
                        );
                      },
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
