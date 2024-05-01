import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;

class ReportController extends GetxController {
  final Rx<Color?> buttonColor = Colors.blue.obs;

  final RxString taskTitle = "".obs;
  final RxString taskActivity = "".obs;
  final RxString date = "".obs;
  final RxString startTime = "".obs;
  final RxString endTime = "".obs;
  final RxBool remaindMe = false.obs;
  final RxString description = "".obs;
 




  Future<void> createNewTask(
    String taskTitle,
    String taskActivity,
    String date,
    String startTime,
    String endTime,
    bool remaindMe,
    String description,
  ) async {
    try {
      User? user = auth.currentUser;
      if (user != null) {
        CollectionReference tasks = firestore.collection('tasks');

        DocumentSnapshot docSnapshot = await tasks.doc(user.uid).get();

        if (docSnapshot.exists) {
          List<dynamic> currentTasks =
              (docSnapshot.data() as Map<String, dynamic>)['tasks'] ?? [];

          currentTasks.add({
            'taskTitle': taskTitle,
            'taskActivity': taskActivity,
            'date': date,
            'startTime': startTime,
            'endTime': endTime,
            'remaindMe': remaindMe,
            'description': description,
          });

          await tasks.doc(user.uid).update({'tasks': currentTasks});
        } else {
          await tasks.doc(user.uid).set({
            'tasks': [
              {
                'taskTitle': taskTitle,
                'taskActivity': taskActivity,
                'date': date,
                'startTime': startTime,
                'endTime': endTime,
                'remaindMe': remaindMe,
                'description': description,
              }
            ]
          });
        }
      } else {
        Get.snackbar(
          "Error",
          "User not authenticated. Unable to create new task.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Failure",
        "Error creating new task: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
