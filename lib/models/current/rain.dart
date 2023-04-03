class Rain {
  String? oneHour;
  String? threeHour;

  Rain({this.oneHour, this.threeHour});

  factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        oneHour: json['1h'] as String?,
        threeHour: json['3h'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '1h': oneHour,
        '3h': threeHour,
      };
}
