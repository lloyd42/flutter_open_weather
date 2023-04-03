import 'dart:convert';
import 'package:flutter_open_weather/models/weather_current.dart';
import 'package:flutter_open_weather/models/weather_forecast.dart';
import 'package:http/http.dart' as http;

import '../models/air_current.dart';
import 'api_key.dart';

class RequestWeather {
  Current? current;
  Lists? forecast;
  Air? air;
  // 处理请求
  Future<Current> processRequestWeather(lat, lon) async {
    var response = await http.get(Uri.parse(apiUrl(lat, lon)));
    var jsonString = jsonDecode(response.body);
    current = Current.fromJson(jsonString);
    return current!;
  }

  Future<Lists> processRequestForecast(lat, lon) async {
    var response = await http.get(Uri.parse(apiUrl2(lat, lon)));
    var jsonString = jsonDecode(response.body);
    forecast = Lists.fromJson(jsonString);
    return forecast!;
  }

  Future<Air> processRequestAir(lat, lon) async {
    var response = await http.get(Uri.parse(apiUrl3(lat, lon)));
    var jsonString = jsonDecode(response.body);
    air = Air.fromJson(jsonString);
    return air!;
  }
}

String apiUrl(lat, lon) {
  String url = "";
  url =
      "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&mode=&units=metric&lang=zh_cn";

  return url;
}

String apiUrl2(lat, lon) {
  String url = "";
  url =
      "https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=$apiKey&mode=&units=metric&lang=zh_cn&cnt=8";

  return url;
}

String apiUrl3(lat, lon) {
  String url = "";
  url =
      "https://api.openweathermap.org/data/2.5/air_pollution?lat=$lat&lon=$lon&appid=$apiKey";

  return url;
}
