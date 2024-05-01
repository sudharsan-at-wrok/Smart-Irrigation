import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:iitm_app/src/core/api/api_utils.dart';
import 'package:iitm_app/src/features/weather/models/day_weather_model.dart';

class FetchDayWeatherData {
  Future<List<DayData>> fetchDayData(double lat, double lon) async {
    try {
      var url = apiURL(lat, lon);
      
      var response = await http.get(Uri.parse(url));
      
      if (response.statusCode == 200) {
        
        var jsonResponse = jsonDecode(response.body);
        var dailyData =
            jsonResponse['timelines']['daily'] as List<dynamic>;
        List<DayData> dayDataList =
            dailyData.map((data) => DayData.fromJson(data)).toList();
        return dayDataList;
      } else {
        throw Exception('Failed to fetch weather data');
      }
    } catch (e) {
      throw Exception("Error on weather data fetch$e");
    }
  }
}
