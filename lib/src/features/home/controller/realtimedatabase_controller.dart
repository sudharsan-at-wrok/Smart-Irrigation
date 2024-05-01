import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class RealtimeDataController extends GetxController {
  final _database = FirebaseDatabase.instance.ref();

  RxString data = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() {
    try {
      DatabaseReference dataRef = _database.child('Motor_Controller/Motor_Status');

      dataRef.onValue.listen((event) {
        var snapshot = event.snapshot;
        var value = snapshot.value;

       
        data.value = value.toString();
      });
    } catch (e) {
      print("Error on realtime data fetch $e");
    }
  }

  void updateData(var newData) {
    DatabaseReference dataRef = _database.child('Motor_Controller/Motor_Status');
    dataRef.set(newData);
  }
}


