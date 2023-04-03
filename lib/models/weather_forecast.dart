import 'hour/clouds.dart';
import 'hour/main.dart';
import 'hour/rain.dart';
import 'hour/snow.dart';
import 'hour/weather.dart';
import 'hour/wind.dart';

class Lists {
  List<Forecast>? list;
  Lists({
    this.list,
  });
  factory Lists.fromJson(Map<String, dynamic> json) => Lists(
        list: (json['list'] as List<dynamic>?)
            ?.map((e) => Forecast.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
  Map<String, dynamic> toJson() => {
        'list': list?.map((e) => e.toJson()).toList(),
      };
}

class Forecast {
  List<Weather>? weather;
  Main? main;
  Clouds? clouds;
  Wind? wind;
  Rain? rain;
  Snow? snow;
  int? visibility;
  double? pop;
  String? dtTxt;
  int? dt;

  Forecast({
    this.weather,
    this.main,
    this.clouds,
    this.wind,
    this.rain,
    this.snow,
    this.visibility,
    this.pop,
    this.dtTxt,
    this.dt,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        main: json['main'] == null
            ? null
            : Main.fromJson(json['main'] as Map<String, dynamic>),
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
        clouds: json['clouds'] == null
            ? null
            : Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
        wind: json['wind'] == null
            ? null
            : Wind.fromJson(json['wind'] as Map<String, dynamic>),
        rain: json['rain'] == null
            ? null
            : Rain.fromJson(json['rain'] as Map<String, dynamic>),
        snow: json['snow'] == null
            ? null
            : Snow.fromJson(json['snow'] as Map<String, dynamic>),
        visibility: json['visibility'] as int?,
        pop: (json['pop'] as num?)?.toDouble(),
        dtTxt: json['dt_txt'] as String?,
        dt: json['dt'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'main': main?.toJson(),
        'weather': weather?.map((e) => e.toJson()).toList(),
        'clouds': clouds?.toJson(),
        'wind': wind?.toJson(),
        'rain': rain?.toJson(),
        'snow': snow?.toJson(),
        'visibility': visibility,
        'pop': pop,
        'dt_txt': dtTxt,
        'dt': dt,
      };
}
