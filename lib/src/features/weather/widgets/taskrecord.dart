import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskRecord extends StatefulWidget {
  const TaskRecord({super.key, required this.recorddate});

  final String recorddate;
  @override
  State<TaskRecord> createState() => _TaskRecordState();
}

class _TaskRecordState extends State<TaskRecord> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListTile(
        onTap: () {},
        selected: true,
        selectedTileColor: Colors.blue.shade50,
        title: Text(
          'மோட்டாரை ஆன்/ஆஃப் செய்யவும்',
          style: TextStyle(
              color: Colors.black87,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400),
        ),
        subtitle: Row(
          children: [
            Text(
              widget.recorddate,
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              width: 12.w,
            ),
            Text(
              '10:00 - 12:00',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        trailing: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Container(
            height: 40,
            width: 100,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Center(
              child: Text(
                'முடிந்தது',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
