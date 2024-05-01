import 'dart:developer';

class DayData {
  String time;
  DayValues values;

  DayData({
    required this.time,
    required this.values,
  });

  factory DayData.fromJson(Map<String, dynamic> json) {
    return DayData(
      time: json['daily'],
      values: DayValues.fromJson(json['values']),
    );
  }
}

class DayValues {
  double? temperatureAvg;
  double? temperatureMax;
  double? temperatureMin;
  double? humidityAvg;
  double? humidityMax;
  double? humidityMin;

  DayValues({
    this. temperatureAvg,
  this. temperatureMax,
  this. temperatureMin,
  this. humidityAvg,
  this. humidityMax,
  this. humidityMin
  });

  factory DayValues.fromJson(Map<String, dynamic> json) {
    try {
      return DayValues(
        temperatureAvg: json['temperatureAvg'] is int
            ? (json['temperatureAvg'] as int).toDouble()
            : json['temperatureAvg'] as double?,
            temperatureMax: json['temperatureMax'] is int
            ? (json['temperatureMax'] as int).toDouble()
            : json['temperatureMax'] as double?,
            temperatureMin: json['temperatureMin'] is int
            ? (json['temperatureMin'] as int).toDouble()
            : json['temperatureMin'] as double?,
        humidityAvg: json['humidityAvg'] is int
            ? (json['humidityAvg'] as int).toDouble()
            : json['humidityAvg'] as double?,
             humidityMax: json['humidityMax'] is int
            ? (json['humidityMax'] as int).toDouble()
            : json['humidityMax'] as double?,
             humidityMin: json['humidityMin'] is int
            ? (json['humidityMin'] as int).toDouble()
            : json['humidityMin'] as double?,
      );
    } catch (e) {
      log("error on weather model: $e");
    }
    return DayValues(
      temperatureAvg: 35.0,
      temperatureMax: 60.0,
      temperatureMin: 26.0,
      humidityAvg: 90.0,
      humidityMax: 99.0,
      humidityMin: 75.0,
      
    );
  }
}

