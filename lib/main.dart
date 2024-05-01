import 'package:flutter/material.dart';
import 'package:iitm_app/src/core/dependency/injection.dart';
import 'package:iitm_app/src/re_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // Dependency initialization
  await DependencyInjection.initialise();
  final isLoggedIn = await isLoggedInState();
  //
  runApp(const RootApp(
    isLoggedIn: true,
  ));
}

Future<bool> isLoggedInState() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('loginStatus') ?? false;
}
