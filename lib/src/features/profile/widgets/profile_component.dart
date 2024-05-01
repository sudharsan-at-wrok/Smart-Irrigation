import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iitm_app/src/features/auth/presentation/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileComponent extends StatelessWidget {
  const ProfileComponent({
    super.key,
    required this.icons,
    required this.componentname,
  });
  final IconData icons;
  final String componentname;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            // SharedPreferences preferences =
            //     await SharedPreferences.getInstance();
            // preferences.setBool('loginStatus', false);
            // Get.to(() => const LoginPage());
          },
          leading: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Icon(
              icons,
              color: Colors.blue,
            ),
          ),
          title: Text(
            componentname,
            style: const TextStyle(
                fontWeight: FontWeight.w600, color: Colors.black87),
          ),
          trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 15,
              )),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
