import 'package:flutter/material.dart';
import 'package:iitm_app/src/features/Notification/presentation/pages/notification.dart';
import 'package:iitm_app/src/features/application_page/pages/application_page.dart';
import 'package:iitm_app/src/features/auth/presentation/pages/login_page.dart';
import 'package:iitm_app/src/features/auth/presentation/pages/mobile_number.dart';
import 'package:iitm_app/src/features/auth/presentation/widgets/expansion.dart';
import 'package:iitm_app/src/core/routes/app_routes.dart';
import 'package:iitm_app/src/features/voice_assistent.dart/tts_voice.dart';
import 'package:iitm_app/src/features/home/pages/home.dart';
import 'package:iitm_app/src/features/auth/presentation/pages/user_details.dart';
import 'package:iitm_app/src/features/report/pages/report.dart';
import 'package:iitm_app/src/features/voice_assistent.dart/voice_command.dart';
import 'package:iitm_app/src/features/voice_assistent.dart/voice_to_text.dart';
import 'package:iitm_app/src/features/weather/pages/weather.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> getRoutes() => <String, WidgetBuilder>{
        AppRouteNames.navBarRoute: (context) => const ApplicationPage(),
        AppRouteNames.loginRoute: (context) => const LoginPage(),
        AppRouteNames.homeRoute: (context) =>  HomePage(),
        AppRouteNames.userDetailsroute: (context) => const UserDetails(),
        AppRouteNames.phoneNumberRoute: (context) => const PhoneNumber(),
        AppRouteNames.expansionDetails: (context) => MyDropdown(),
        AppRouteNames.weatherPageRoute: (context) =>  WeatherPage(),
        AppRouteNames.reportroute: (context) => ReportPage(),
        AppRouteNames.voice: (context) => const VoiceTest(),
        AppRouteNames.voicetotext: (context) => const VoiceToText(),
        AppRouteNames.voicecommand: (context) => const VoiceCommand(),
        AppRouteNames.notification: (context) => NotificationPage(),
      };
}
