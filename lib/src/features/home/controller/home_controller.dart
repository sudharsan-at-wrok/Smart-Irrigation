import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:iitm_app/src/features/home/controller/realtimedatabase_controller.dart';

class HomeController extends GetxController {
  final database = FirebaseDatabase.instance.ref();
  final RealtimeDataController realtimeDataController = Get.find();

  RxBool switchButton = false.obs;
  RxString moistureData = ''.obs;
  RxString waterFlow = ''.obs;
  RxInt field1Flow = 0.obs;
  RxInt field2Flow = 0.obs;
  RxDouble average = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    ever(realtimeDataController.data, (value) {
      switchButton.value = value == 1.toString();
    });
  }

  void toggleSwitch(bool value) {
    realtimeDataController.updateData(value ? 1 : 0);
  }

  Future<void> fetchMoistureData() async {
    try {
      DatabaseReference dataRef = database.child('moistureRead');

      dataRef.onValue.listen((event) {
        var snapshot = event.snapshot;
        var value = snapshot.value;

        moistureData.value = value.toString();
      });
    } catch (e) {
      print("Error on realtime data fetch of soilmoisture $e");
    }
  }

  Future<void> fetchMotorWaterFlowData() async {
    try {
      DatabaseReference dataRef = database.child("Water_Flow/Motor_Flow");

      dataRef.onValue.listen((event) {
        var snapshot = event.snapshot;
        var value = snapshot.value;

        waterFlow.value = value.toString();
      });
    } catch (e) {
      print("Error on realtime data fetch of soilmoisture $e");
    }
  }

  Future<void> fetchFieldWaterFlowData() async {
    try {
      DatabaseReference field1 = database.child("Water_Flow/Field_1_Flow");

      field1.onValue.listen((event) {
        var snapshot = event.snapshot;
        var value = snapshot.value;

        field1Flow.value = value as int;
        print("field1:${field1Flow.value}");
      });
      DatabaseReference field2 = database.child("Water_Flow/Field_2_Flow");

      field2.onValue.listen((event) {
        var snapshot = event.snapshot;
        var value = snapshot.value;

        field2Flow.value = value as int;
        print("field2:${field2Flow.value}");
      });
      average.value = (field1Flow.value + field2Flow.value) / 2;
    } catch (e) {
      print("Error on realtime data fetch of soilmoisture $e");
    }
  }
}
