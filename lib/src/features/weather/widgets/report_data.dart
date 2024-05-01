import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReportData extends StatelessWidget {
  const ReportData({
    super.key,
    required this.dailyreport,
    required this.dailyreportcontent,
    required this.reportcolor,
  });

  final String dailyreport, dailyreportcontent;
  final Color reportcolor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 40.h,
        width: 105.w,
        decoration: BoxDecoration(
            color: reportcolor,
            borderRadius: BorderRadius.all(Radius.circular(10.r))),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dailyreport,
                style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                dailyreportcontent,
                style: TextStyle(
                  fontSize: 9.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
