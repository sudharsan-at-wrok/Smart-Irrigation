import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/features/Notification/presentation/pages/notification.dart';
import 'package:iitm_app/src/features/auth/controller/user_data_controller.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final UserDataController userDataController = Get.find();
    final hour = DateTime.now().hour;

    String greeting = _getGreeting(hour);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 208,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Image.network(
                    "https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/man-user-circle-icon.png",
                    fit: BoxFit.contain,
                    height: 40,
                    width: 40,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      greeting,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    Obx(() {
                      userDataController.getUserDetails();
                      String name =
                          userDataController.userDetails[0].firstName!;
                      return SizedBox(
                        width: 160,
                        child: Text(
                          name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),
          NotificationIconCustom(onTap: () {
            Get.to(() => NotificationPage());
          },),
        ],
      ),
    );
  }

  String _getGreeting(int hour) {
    if (hour < 12) {
      return 'greeting1'.tr;
    } else if (hour < 17) {
      return 'greeting2'.tr;
    } else {
      return 'greeting3'.tr;
    }
  }
}

class NotificationIconCustom extends StatelessWidget {
  const NotificationIconCustom(
      {Key? key, required this.onTap, this.height, this.width})
      : super(key: key);
  final void Function() onTap;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Image.asset(
            'assets/icons/notification-50.png',
            height: height ?? 25,
            width: width ?? 25,
          ),
          Positioned(
            top: 2,
            right: 3,
            child: Container(
              height: 8,
              width: 8,
              decoration: const BoxDecoration(
                color: Colors.redAccent,
                shape: BoxShape.circle,
              ),
            ),
          )
        ],
      ),
    );
  }
}
