import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;


class UserDetailsController extends GetxController {
  String selectedUnit = 'அலகு'; // Initial value for the selected unit
  String cropSelectedName = 'பயிர் பெயர்';

  final RxString firstName = ''.obs;
  final RxString lastName = ''.obs;
  final RxString email = ''.obs;
  final RxString cropName = ''.obs;
  final RxString landSize = '0'.obs;
  final RxString unit = ''.obs;
  final RxString address = ''.obs;
  final RxDouble latitude = 0.0.obs;
  final RxDouble longitude = 0.0.obs;

  void updateSelectedUnit(String item) {
    selectedUnit = item;
    update();
  }

  void updateCropSelectedUnit(String cropName) {
    cropSelectedName = cropName;
    update();
  }

  Future<void> createUserDocument(
    String firstName,
    String lastName,
    String email,
    String cropName,
    String landSize,
    String unit,
    String address,
    double latitude,
    double longitude,
    bool loginStatus,
  ) async {
    try {
      User? user = auth.currentUser;
      if (user != null) {
        CollectionReference users = firestore.collection('users');

        await users.doc(user.uid).set({
          'firstName': firstName,
          'lastName': lastName,
          'userEmail': email,
          'cropName': cropName,
          'landSize': landSize,
          'unit': unit,
          'address': address,
          'latitdue': latitude,
          'longitude': longitude,
        });

        await storeUserCredentials(
        firstName,
        lastName,
        email,
        cropName,
        landSize,
        unit,
        address,
        latitude,
        longitude,
        loginStatus,
      );

      print("User document created successfully.");
      } else {
        Get.snackbar(
          "Error",
          "User is not authenticated",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Failure",
        "Error creating user document: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
  Future<void> storeUserCredentials(
  String firstName,
  String lastName,
  String email,
  String cropName,
  String landSize,
  String unit,
  String address,
  double latitude,
  double longitude,
  bool loginStatus,
) async {
  SharedPreferences prefs =await
    SharedPreferences.getInstance() ;
  try {
     
    await prefs.setBool('loginStatus', loginStatus);
    await prefs.setString('firstName', firstName);
    await prefs.setString('lastName', lastName);
    await prefs.setString('email', email);
    await prefs.setString('address', address);
    await prefs.setString('plantType', cropName);
    await prefs.setString('landSize', landSize);
    await prefs.setString('landunit', unit);
    await prefs.setDouble('latitude', latitude);
    await prefs.setDouble('longitude', longitude);

    print("User credentials stored in SharedPreferences.");
  } catch (e) {
    log("Error storing user credentials in SharedPreferences: $e");
  }
}
}
