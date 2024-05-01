import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/features/home/widgets/custom_text.dart';
import 'package:iitm_app/src/features/weather/controller/weather_controller.dart';
import 'package:iitm_app/src/features/weather/pages/humidity.dart';
import 'package:iitm_app/src/features/weather/pages/soilmoisture.dart';
import 'package:iitm_app/src/features/weather/pages/temperature.dart';
import 'package:iitm_app/src/features/weather/widgets/app_bar.dart';

class WeatherPage extends StatefulWidget {
   WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage>
    with TickerProviderStateMixin {
  late TabController tabController;
  final WeatherController weatherController = WeatherController();
  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: WeatherAppBar(),
            ),
             Divider(
              thickness: 0.2,
              color: Colors.grey,
            ),
             SizedBox(
              height: 10,
            ),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: CustomText(inputText: "weatherPageTitle".tr),
            ),
            TabBar(
              padding:  EdgeInsets.all(10),
              labelColor: Colors.black,
              indicatorColor: _tabColor(tabController),
              controller: tabController,
              tabs:  [
                Tab(text: 'temperature'.tr),
                Tab(
                  text: 'soilmoisture'.tr,
                ),
                Tab(
                  text: 'weatherCardHumidity'.tr,
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children:  [
                  Temperature(),
                  SoilMoisture(),
                  Humidity(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _tabColor(TabController controller) {
    print("Controller index: ${controller.index}");
    if (controller.index == 0) {
      print("Returning red");
      return Colors.red;
    } else if (controller.index == 1) {
      print("Returning green");
      return Colors.green;
    } else if (controller.index == 2) {
      print("Returning blue");
      return Colors.blue;
    } else {
      print("Returning black");
      return Colors.black;
    }
  }
}
