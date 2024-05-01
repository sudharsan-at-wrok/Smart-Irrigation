import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DailyTempDetails extends StatelessWidget {
  const DailyTempDetails({
    super.key,
    required this.dailytempreport,
    required this.tempreportcontent,
  });

  final String dailytempreport, tempreportcontent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        // height: 40.h,
        width: 105.w,
        decoration: BoxDecoration(
          color: Colors.orange.shade50,
          borderRadius: BorderRadius.all(
            Radius.circular(10.r),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$dailytempreport°C",
                style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                tempreportcontent,
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
