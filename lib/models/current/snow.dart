class Snow {
  String? oneHour;
  String? threeHour;

  Snow({this.oneHour, this.threeHour});

  factory Snow.fromJson(Map<String, dynamic> json) => Snow(
        oneHour: json['1h'] as String?,
        threeHour: json['3h'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '1h': oneHour,
        '3h': threeHour,
      };
}
