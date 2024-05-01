import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/features/report/controller/report_controller.dart';
import 'package:iitm_app/src/features/report/function/date_formate.dart';
import 'package:iitm_app/src/features/report/widgets/time_selecting_dialog.dart';

class TaskManagement extends StatefulWidget {
  const TaskManagement({super.key});

  @override
  State<TaskManagement> createState() => _TaskManagementState();
}

class _TaskManagementState extends State<TaskManagement> {
  final ReportController reportController = Get.find();
  final TextEditingController taskTitleController = TextEditingController();
  final TextEditingController taskActivityController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  void clear() {
    taskActivityController.clear();
    taskTitleController.clear();
    descriptionController.clear();
    reportController.remaindMe.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            size: 25.sp,
          ),
        ),
        centerTitle: true,
        title: Text(
          'taskInputTitle'.tr,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10.h, bottom: 8.w),
                child: Text(
                  'taskInput1'.tr,
                  style:
                      TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                height: 50.h,
                width: double.infinity.w,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(10.r))),
                child: Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: TextField(
                    controller: taskTitleController,
                    decoration: const InputDecoration(
                        hintText: 'Write here', border: InputBorder.none),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 14.h, bottom: 8.h),
                child: Text(
                  'workActivity'.tr,
                  style:
                      TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                height: 50.h,
                width: double.infinity.w,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(10.r))),
                child: Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: TextField(
                    controller: taskActivityController,
                    decoration: const InputDecoration(
                        hintText: 'Write here', border: InputBorder.none),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 13.h),
                child: Row(
                  children: [
                    Text(
                      'date'.tr,
                      style: TextStyle(
                          fontSize: 17.sp, fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 130.w),
                      child: Text(
                        'time'.tr,
                        style: TextStyle(
                            fontSize: 17.sp, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 7.h),
                child: Row(
                  children: [
                    Container(
                      height: 48.h,
                      width: 155.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Obx(
                            () => Padding(
                              padding: EdgeInsets.only(top: 2.h, left: 5.w),
                              child: SizedBox(
                                height: 40.h,
                                width: 110.w,
                                child: Center(
                                  child: Text(reportController.date.value),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              var selectedDate = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.now()
                                      .add(const Duration(days: 7)));
                              if (selectedDate != null) {
                                reportController.date.value =
                                    formatDate(selectedDate);
                              }
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.w),
                              child: Icon(
                                Icons.calendar_today_sharp,
                                size: 20.sp,
                                color: Colors.blue,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Container(
                        height: 48.h,
                        width: 155.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Obx(
                              () => Padding(
                                padding: EdgeInsets.only(top: 2.h, left: 5.w),
                                child: SizedBox(
                                  height: 40.h,
                                  width: 110.w,
                                  child: Center(
                                    child: Text(reportController
                                            .startTime.value.isEmpty
                                        ? ""
                                        : "${reportController.startTime.value} to ${reportController.endTime.value}"),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                timeSelector(context);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(left: 5.w),
                                child: Icon(
                                  Icons.timer_outlined,
                                  size: 20.sp,
                                  color: Colors.blue,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: Container(
                  height: 50.h,
                  width: double.infinity.w,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.r))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: Text(
                            'remind'.tr,
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w400),
                          ),
                        ),
                        const Spacer(),
                        Obx(() {
                          return Padding(
                            padding: EdgeInsets.only(left: 25.w),
                            child: Switch(
                              value: reportController.remaindMe.value,
                              activeColor: Colors.red,
                              thumbColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (states) => Colors.white,
                              ),
                              onChanged: (bool value) {
                                reportController.remaindMe.value = value;
                              },
                            ),
                          );
                        })
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Text(
                  'description'.tr,
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                height: 100.h,
                width: double.infinity.w,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: TextField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                        hintText: 'Write here', border: InputBorder.none),
                  ),
                ),
              ),
              Obx(
                () {
                  return Padding(
                    padding: const EdgeInsets.only(top: 38),
                    child: GestureDetector(
                      onTap: () {
                        reportController.createNewTask(
                            taskTitleController.text,
                            taskActivityController.text,
                            reportController.date.value,
                            reportController.startTime.value,
                            reportController.endTime.value,
                            reportController.remaindMe.value,
                            descriptionController.text);
                        clear();
                      },
                      child: Container(
                        height: 55.h,
                        width: double.infinity.w,
                        decoration: BoxDecoration(
                          color: reportController.buttonColor.value,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.r),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'createButton'.tr,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        )),
      ),
    );
  }
}
