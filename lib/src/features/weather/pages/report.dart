import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:iitm_app/src/features/weather/widgets/reportdata_builder.dart';
import 'package:iitm_app/src/features/weather/widgets/taskrecord.dart';

class Report extends StatelessWidget {
  Report({super.key});

  final List<String> recorddate = [
    '16/3/2024',
    '17/3/2024',
    '18/3/2024',
    '19/3/2024',
    '20/3/2024',
    '21/3/2024',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Report',
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: const ReportDataBuilder(),
              ),
              Text(
                'Today task',
                style: TextStyle(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Slidable(
                  endActionPane:
                      ActionPane(motion: const BehindMotion(), children: [
                    SlidableAction(
                      backgroundColor: Colors.red,
                      label: 'OFF',
                      onPressed: (context) => _onDismissed,
                    )
                  ]),
                  startActionPane:
                      ActionPane(motion: const ScrollMotion(), children: [
                    SlidableAction(
                      backgroundColor: Colors.green,
                      label: 'ON',
                      onPressed: (context) => _onDismissed,
                    )
                  ]),
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Container(
                      height: 65.h,
                      width: double.infinity.w,
                      decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.r))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 2.h, left: 8.w),
                                child: Text(
                                  'Task 1',
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 17.w),
                                child: Text(
                                  'Turn ON/OFF the motor',
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
                                      '16/3/2024',
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      '10:00 AM',
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
                          // Padding(
                          //   padding: EdgeInsets.only(right: 18.w),
                          //   child: Row(
                          //     children: [
                          //       GestureDetector(
                          //         onTap: () {},
                          //         child: Container(
                          //           height: 33.h,
                          //           width: 50.w,
                          //           decoration: BoxDecoration(
                          //               color: Colors.green,
                          //               borderRadius: BorderRadius.all(
                          //                   Radius.circular(8.r))),
                          //           child: Center(
                          //             child: Text(
                          //               'ON',
                          //               style: TextStyle(
                          //                   color: Colors.white,
                          //                   fontSize: 18.sp,
                          //                   fontWeight: FontWeight.bold),
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(
                          //         width: 5.w,
                          //       ),
                          //       GestureDetector(
                          //         onTap: () {},
                          //         child: Container(
                          //           height: 33.h,
                          //           width: 50.w,
                          //           decoration: BoxDecoration(
                          //               color: Colors.redAccent,
                          //               borderRadius: BorderRadius.all(
                          //                   Radius.circular(8.r))),
                          //           child: Center(
                          //             child: Text(
                          //               'OFF',
                          //               style: TextStyle(
                          //                   color: Colors.white,
                          //                   fontSize: 18.sp,
                          //                   fontWeight: FontWeight.bold),
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'Task Record',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 5.h,
              ),
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return TaskRecord(recorddate: recorddate[index]);
                },
              ),
            ],
          ),
        )),
      ),
    );
  }

  void _onDismissed() {}
}
