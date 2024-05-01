import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomUserDetailForm extends StatelessWidget {
  const CustomUserDetailForm({
    super.key,
    required this.fieldName,
    required this.controller,
    required this.icon,
    required this.secondIcon,
    required this.function,
  });

  final String fieldName;
  final TextEditingController controller;
  final Widget icon;
  final Widget secondIcon;
  final void Function() function;

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
          Row(
            children: [
              Expanded(
                child: TextField(
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
                      borderSide: const BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  keyboardType: fieldName == "Email Address"
                      ? TextInputType.emailAddress
                      : TextInputType.text,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.5.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  textInputAction: TextInputAction.done,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              GestureDetector(
                onTap: function,
                child: Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: secondIcon,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
