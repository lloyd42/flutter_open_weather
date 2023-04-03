class Rain {
  double? threeHour;
  Rain({this.threeHour});

  factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        threeHour: (json['3h'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        '3h': threeHour,
      };
}
