// class WeatherModel {
//   final String location;
//   final String date;
//   final String temperature;
//   final String humidity;
//   final String status;

//   WeatherModel({
//     required this.location,
//     required this.date,
//     required this.temperature,
//     required this.humidity,
//     required this.status,
//   });

//   factory WeatherModel.fromJson(Map<String, dynamic> json) {
//     return WeatherModel(
//       location: json['location'] ?? '',
//       date: json['date'] ?? '',
//       temperature: json['temperature'] ?? '',
//       humidity: json['humidity'] ?? '',
//       status: json['status'] ?? '',
//     );
//   }

//   @override
//   String toString() {
//     return 'Location: $location, Date: $date, Temperature: $temperature, Humidity: $humidity, Status: $status';
//   }
// }

// void main() {
//   // Sample JSON data representing weather information
//   Map<String, dynamic> jsonData1 = {
//     'location': 'New York',
//     'date': '2024-03-07',
//     'temperature': '68°F',
//     'humidity': '55%',
//     'status': 'Sunny',
//   };

//   Map<String, dynamic> jsonData2 = {
//     'location': 'London',
//     'date': '2024-03-07',
//     'temperature': '54°F',
//     'humidity': '75%',
//     'status': 'Cloudy',
//   };

  // Creating instances of WeatherModel from JSON data
  // WeatherModel weather1 = WeatherModel.fromJson(jsonData1);
  // WeatherModel weather2 = WeatherModel.fromJson(jsonData2);

  // Printing the weather data
  // print(weather1);
  // print(weather2);
// }
