import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TaskRecordData extends StatefulWidget {
  const TaskRecordData({super.key});

  @override
  State<TaskRecordData> createState() => _TaskRecordDataState();
}

class _TaskRecordDataState extends State<TaskRecordData> {
  bool light = false;

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
          'பணி பதிவு',
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
                padding: EdgeInsets.only(top: 10.h, bottom: 7.w),
                child: Text(
                  'பணி தலைப்பு :',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.w, left: 50.w),
                child: Text(
                  'மோட்டார் 1 இயங்குகிறது',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.w, top: 10.h),
                child: Row(
                  children: [
                    Text(
                      'தேதி :',
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40.w),
                      child: Text(
                        '16/03/2024',
                        style: TextStyle(
                            fontSize: 17.sp, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5.w, top: 13),
                child: Row(
                  children: [
                    Text(
                      'நேரம் :',
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40.w),
                      child: Text(
                        '10:00 AM - 12:00 PM',
                        style: TextStyle(
                            fontSize: 17.sp, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              
              Padding(
                padding: EdgeInsets.only(bottom: 8.w, top: 18),
                child: Text(
                  'விரித்துரைத்தல் :',
                  style:
                      TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 40.w),
                child: SizedBox(
                  height: 200.h,
                  width: double.infinity.w,
                  child: Text(
                    'ஒரு பயிர் என்பது ஒரு தாவரம் அல்லது தாவர தயாரிப்பு ஆகும், இது இலாபத்திற்காக அல்லது வாழ்வாதாரத்திற்காக வளர்க்கப்பட்டு அறுவடை செய்யப்படலாம். ',
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
