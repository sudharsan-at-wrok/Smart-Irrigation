import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:iitm_app/src/core/api/api_utils.dart';
import 'package:iitm_app/src/features/weather/models/hour_weather_model.dart.dart';

class FetchHourWeatherData {
  Future<List<HourData>> fetchHourData(double lat, double lon) async {
    try {
      var url = apiURL(lat, lon);
      
      var response = await http.get(Uri.parse(url));
      
      if (response.statusCode == 200) {
        
        var jsonResponse = jsonDecode(response.body);
        var minutelyData =
            jsonResponse['timelines']['minutely'] as List<dynamic>;
        List<HourData> minuteDataList =
            minutelyData.map((data) => HourData.fromJson(data)).toList();
        return minuteDataList;
      } else {
        throw Exception('Failed to fetch weather data');
      }
    } catch (e) {
      throw Exception("Error on weather data fetch$e");
    }
  }
}
