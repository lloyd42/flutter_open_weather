import 'current/clouds.dart';
import 'current/main.dart';
import 'current/rain.dart';
import 'current/snow.dart';
import 'current/weather.dart';
import 'current/wind.dart';

class Current {
  List<Weather>? weather;
  Main? main;
  int? visibility;
  Wind? wind;
  Clouds? clouds;
  Rain? rain;
  Snow? snow;

  Current({
    this.weather,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.rain,
    this.snow,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
        main: json['main'] == null
            ? null
            : Main.fromJson(json['main'] as Map<String, dynamic>),
        visibility: json['visibility'] as int?,
        wind: json['wind'] == null
            ? null
            : Wind.fromJson(json['wind'] as Map<String, dynamic>),
        clouds: json['clouds'] == null
            ? null
            : Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
        rain: json['rain'] == null
            ? null
            : Rain.fromJson(json['rain'] as Map<String, dynamic>),
        snow: json['snow'] == null
            ? null
            : Snow.fromJson(json['snow'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'weather': weather?.map((e) => e.toJson()).toList(),
        'main': main?.toJson(),
        'visibility': visibility,
        'wind': wind?.toJson(),
        'clouds': clouds?.toJson(),
        'rain': rain?.toJson(),
        'snow': snow?.toJson(),
      };
}
