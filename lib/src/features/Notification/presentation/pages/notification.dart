import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iitm_app/src/features/Notification/entities/entities.dart';
import 'package:iitm_app/src/features/Notification/presentation/widgets/notification_card.dart';

class NotificationPage extends StatelessWidget {
  NotificationPage({super.key});
  final List<NotificationEntities> tempNotification = [
    NotificationEntities(
      title: "There is a leak in the pipe",
      content: "The water was stopped due to a leak in the pipe",
      date: "02-04-2024",
      alert: true,
    ),
    NotificationEntities(
      title: "Motor is running",
      content: "The motor is operated manually",
      date: '31-03-2024',
      alert: false,
    ),
    NotificationEntities(
      title: "Motor is switched off",
      content: "The motor is switched off manually",
      date: '31-03-2024',
      alert: false,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: notificationAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                notificationWidget(
                  tempNotification,
                ),
              ],
            ),
          ),
        ));
  }

  Column notificationWidget(List<NotificationEntities> notificationEntities) {
    // Get today's date
    DateTime now = DateTime.now();
    print("todays date : ${now.day}-${now.month}-${now.year}");
    // Filter today's and previous notifications
    List<NotificationEntities> todayNotification = notificationEntities
        .where((element) =>
            element.date == "0${now.day}-0${now.month}-${now.year}")
        .toList();
    List<NotificationEntities> previousNotification = notificationEntities
        .where((element) =>
            element.date != "0${now.day}-0${now.month}-${now.year}")
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (todayNotification.isNotEmpty) ...[
          SizedBox(
            child: Text(
              "Today",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
            ),
          ),
          for (var i = 0; i < todayNotification.length; i++)
            notificationCardWidget(
                todayNotification[i].title,
                todayNotification[i].content,
                todayNotification[i].date,
                todayNotification[i].alert),
        ],
        SizedBox(
          child: Text(
            "Previous",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
          ),
        ),
        for (var i = 0; i < previousNotification.length; i++)
          notificationCardWidget(
              previousNotification[i].title,
              previousNotification[i].content,
              previousNotification[i].date,
              previousNotification[i].alert),
      ],
    );
  }
}
