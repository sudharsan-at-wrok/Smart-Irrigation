import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/features/profile/widgets/profile_component.dart';

class ProfileBuilder extends StatefulWidget {
  const ProfileBuilder({super.key});

  @override
  State<ProfileBuilder> createState() => _ProfileBuilderState();
}

class _ProfileBuilderState extends State<ProfileBuilder> {
  final List profilecomponentname = [
    'setting'.tr,
    'userManagement'.tr,
    'Information'.tr,
  ];

  final List profilecomponenticon = [
    Icons.settings,
    Icons.folder_shared,
    Icons.error,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: profilecomponentname.length,
        itemBuilder: (context, index) {
          return ProfileComponent(
            icons: profilecomponenticon[index],
            componentname: profilecomponentname[index],
          );
        },
      ),
    );
  }
}
