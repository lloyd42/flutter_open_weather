import 'components.dart';
import 'main.dart';

class Lists {
  Main? main;
  Components? components;
  int? dt;

  Lists({this.main, this.components, this.dt});

  factory Lists.fromJson(Map<String, dynamic> json) => Lists(
        main: json['main'] == null
            ? null
            : Main.fromJson(json['main'] as Map<String, dynamic>),
        components: json['components'] == null
            ? null
            : Components.fromJson(json['components'] as Map<String, dynamic>),
        dt: json['dt'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'main': main?.toJson(),
        'components': components?.toJson(),
        'dt': dt,
      };
}
