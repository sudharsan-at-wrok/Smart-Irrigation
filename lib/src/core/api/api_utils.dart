import 'package:iitm_app/src/core/api/api_key.dart';

String apiURL(var lat, var lon) {
  String url;

  url =
      "https://api.tomorrow.io/v4/weather/forecast?location=$lat,$lon&apikey=$apiKey";
  return url;
}
