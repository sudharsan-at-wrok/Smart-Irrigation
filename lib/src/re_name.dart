import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:iitm_app/src/core/routes/app_routes.dart';
import 'package:iitm_app/src/core/routes/routes.dart';
import 'package:iitm_app/src/features/localization_string.dart';

class RootApp extends StatelessWidget {
  final bool isLoggedIn;

  const RootApp({required this.isLoggedIn, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          translations: LocalizationString(),
          locale: const Locale('en', 'US'),
          debugShowCheckedModeBanner: false,
          routes: AppRoutes.getRoutes(),
          initialRoute:
              isLoggedIn ? AppRouteNames.navBarRoute : AppRouteNames.loginRoute,
        );
      },
    );
  }
}
