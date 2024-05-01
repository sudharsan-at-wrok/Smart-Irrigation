import 'dart:developer';

class HourData {
  String time;
  HourValues values;

  HourData({
    required this.time,
    required this.values,
  });

  factory HourData.fromJson(Map<String, dynamic> json) {
    return HourData(
      time: json['time'],
      values: HourValues.fromJson(json['values']),
    );
  }
}

class HourValues {
  double? temperature;
  double? humidity;

  HourValues({
    this.temperature,
    this.humidity,
  });

  factory HourValues.fromJson(Map<String, dynamic> json) {
    try {
      return HourValues(
        temperature: json['temperature'] is int
            ? (json['temperature'] as int).toDouble()
            : json['temperature'] as double?,
        humidity: json['humidity'] is int
            ? (json['humidity'] as int).toDouble()
            : json['humidity'] as double?,
      );
    } catch (e) {
      log("error on weather model: $e");
    }
    return HourValues(
      temperature: 90.0,
      humidity: 90.0,
    );
  }
}

