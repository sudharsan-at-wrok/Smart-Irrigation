import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LandsizeCustomTextField extends StatelessWidget {
  const LandsizeCustomTextField({
    super.key,
    required this.fieldName,
    required this.controller,
    required this.icon,
  });

  final String fieldName;
  final TextEditingController controller;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.h, bottom: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            fieldName,
            style: TextStyle(
              fontSize: 15.5.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 5.h),
          TextField(
            minLines: 1,
            controller: controller,
            decoration: InputDecoration(
              prefixIcon: icon,
              prefixIconColor: Colors.blue,
              hintText: fieldName == "Land Details"
                  ? "Land Size"
                  : "Enter $fieldName",
              contentPadding: EdgeInsets.all(10.r),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                ),
              ),
            ),
            keyboardType: fieldName == "Land Details"
                ? TextInputType.number
                : TextInputType.text,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.5.sp,
              fontWeight: FontWeight.w500,
            ),
            textInputAction: TextInputAction.done,
          ),
        ],
      ),
    );
  }
}
