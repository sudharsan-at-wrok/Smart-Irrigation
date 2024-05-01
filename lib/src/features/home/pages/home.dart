import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/features/home/controller/home_controller.dart';
import 'package:iitm_app/src/features/home/controller/realtimedatabase_controller.dart';
import 'package:iitm_app/src/features/home/controller/voice_command_controller.dart';
import 'package:iitm_app/src/features/home/controller/voice_controller.dart';
import 'package:iitm_app/src/features/home/widgets/field_waterflow_container.dart';
import 'package:iitm_app/src/features/home/widgets/home_soilmoisure_container.dart';
import 'package:iitm_app/src/features/home/widgets/todaytask.dart';
import 'package:iitm_app/src/features/home/widgets/custom_text.dart';
import 'package:iitm_app/src/features/home/widgets/home_app_bar_widget.dart';
import 'package:iitm_app/src/features/home/widgets/waterflow_container.dart';
import 'package:iitm_app/src/features/home/widgets/weather_card.dart';
import 'package:iitm_app/src/features/weather/pages/weather.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final VoiceCommandController voiceCommandController =
      VoiceCommandController();
  final HomeController homeController = Get.find();
  final RealtimeDataController realtimeDataController = Get.find();
  final VoiceController voiceController = VoiceController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          voiceController.listen();
        },
        backgroundColor: Colors.blue,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.mic,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeAppBar(),
                const SizedBox(height: 13),
                CustomText(inputText: "weatherCardTitle".tr),
                const SizedBox(height: 15),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WeatherPage(),
                          ));
                    },
                    child: const WeatherCard()),
                const SizedBox(height: 15),
                Container(
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text('motorSwitch'.tr,
                            style: TextStyle(
                                fontSize: 17.sp, fontWeight: FontWeight.bold)),
                      ),
                      Obx(() {
                        return Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child: Switch(
                            value: homeController.switchButton.value,
                            activeColor: Colors.blue,
                            inactiveTrackColor: Colors.grey.shade300,
                            thumbColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (states) => Colors.white,
                            ),
                            onChanged: (bool value) {
                              homeController.toggleSwitch(value);
                            },
                          ),
                        );
                      })
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                CustomText(inputText: "todaysTask".tr),
                const SizedBox(height: 12),
                Todaytask(
                  title: 'todayTaskTitle'.tr,
                  time: '10:00 AM - 12:00 PM',
                ),
                const SizedBox(
                  height: 10,
                ),
                Todaytask(
                  title: 'todayTaskTitle2'.tr,
                  time: '4:00 PM - 6:00 PM',
                ),
                const SizedBox(height: 10),
                //
                CustomText(inputText: "reportTitle".tr),
                //
                const SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0.h),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HomeSoilMoisureContainer(),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: WaterflowContainer(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: FieldWaterflowContainer(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
