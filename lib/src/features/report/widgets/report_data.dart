import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReportData extends StatelessWidget {
  const ReportData({
    Key? key,
    required this.dailyreport,
    required this.dailyreportcontent,
    required this.reportcolor,
  }) : super(key: key);

  final String dailyreport, dailyreportcontent;
  final Color reportcolor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.w),
      child: Container(
        height: 40.h,
        width: 105.w,
        decoration: BoxDecoration(
          color: reportcolor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$dailyreport${getUnit()}',
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w500),
              ),
              Text(
                dailyreportcontent,
                style: TextStyle(fontSize: 10.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getUnit() {
    if (dailyreportcontent == 'வெப்ப நிலை') {
      return '°C';
    } else if (dailyreportcontent == 'மண் ஈரம்') {
      return '%';
    } else {
      return '%';
    }
  }
}
