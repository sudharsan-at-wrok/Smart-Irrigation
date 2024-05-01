import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iitm_app/src/features/report/widgets/todaytask_record_data.dart';

class TodayTaskContainer extends StatelessWidget {
  final String taskTitle, taskActivity, date, time;

  const TodayTaskContainer({
    super.key,
    required this.taskTitle,
    required this.taskActivity,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: GestureDetector(
        onTap: () {
          Get.to(const TodayTaskRecordData());
        },
        child: Container(
          height: 65.h,
          width: double.infinity.w,
          decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.all(Radius.circular(10.r))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 2.h, left: 8.w),
                    child: Text(
                      taskTitle,
                      style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 17.w),
                    child: Text(
                      taskActivity,
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 17.w),
                    child: Row(
                      children: [
                        Text(
                          date,
                          style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          time,
                          style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
