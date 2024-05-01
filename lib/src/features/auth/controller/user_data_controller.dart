import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/features/auth/model/userdetails_model.dart';

class UserDataController extends GetxController {
  //
  final userDetails = <UserDetailModel>[].obs;

  //
  Future<void> getUserDetails() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    try {
      final DocumentReference documentReference =
          firestore.collection("users").doc(user!.uid);

      //
      final DocumentSnapshot document = await documentReference.get();
      log(document.data().toString());
      //
      if (document.exists) {
        userDetails.add(
            UserDetailModel.fromJson(document.data() as Map<String, dynamic>));

        

        update();

        //
      }
    } catch (e) {
      log("Error on fetch user Data :$e");
    }
  }
}
