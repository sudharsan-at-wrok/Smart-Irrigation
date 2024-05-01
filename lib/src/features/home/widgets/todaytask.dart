import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/features/home/widgets/todaytask_dialog.dart';
import 'package:iitm_app/src/features/home/widgets/weather_dialog.dart';
import 'package:iitm_app/src/features/report/function/date_formate.dart';
import 'package:iitm_app/src/features/report/pages/taskinput.dart';

class Todaytask extends StatelessWidget {
  final String title, time;
  const Todaytask({
    super.key,
    required this.title,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              actions: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.to(const TaskManagement());
                        },
                        child: Text(
                          'Modify',
                          style: TextStyle(fontSize: 18.sp),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 160),
                      child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Text(
                            'OK',
                            style: TextStyle(fontSize: 18.sp),
                          )),
                    ),
                  ],
                ),
              ],
              backgroundColor: Colors.white,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    formatDate(DateTime.now()),
                    style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54),
                  ),
                  Divider(
                    thickness: 0.3.h,
                  ),
                  const WeatherDialog(
                    weather: 'Weather',
                    degree: '30',
                    color: Colors.orange,
                  ),
                  const WeatherDialog(
                    weather: 'Soil Moisure',
                    degree: '28',
                    color: Colors.green,
                  ),
                  const WeatherDialog(
                    weather: 'Humidity',
                    degree: '11.24',
                    color: Colors.blue,
                  ),
                  Divider(
                    thickness: 0.3.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Text(
                      'Today Task',
                      style: TextStyle(
                          fontSize: 21.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.h),
                    child: const TodayTaskDialog(
                      number: '1',
                      time: '10:00 AM -12:00 PM',
                    ),
                  ),
                  Divider(
                    thickness: 0.3.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.h),
                    child: const TodayTaskDialog(
                      number: '1',
                      time: '4:00 PM -6:00 PM',
                    ),
                  ),
                  const Divider(
                    thickness: 0.3,
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Container(
        height: 60.h,
        width: double.infinity.w,
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 17.w, top: 7),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 17.w, top: 5),
                child: Row(
                  children: [
                    Text(
                      'Duration :',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
