import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Days extends StatefulWidget {
  const Days({
    super.key,
    required this.time,
  });
  final String time;

  @override
  State<Days> createState() => _DaysState();
}

class _DaysState extends State<Days> {
  bool selection = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 2.w,
        right: 2.w,
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selection = true;
          });
        },
        child: Container(
          height: 40.h,
          width: 68.w,
          decoration: BoxDecoration(
              color: selection == true ? Colors.green : Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(10.r))),
          child: Center(
            child: Text(
              widget.time,
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54),
            ),
          ),
        ),
      ),
    );
  }
}
