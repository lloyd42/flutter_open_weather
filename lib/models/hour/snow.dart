class Snow {
  double? threeHour;

  Snow({this.threeHour});

  factory Snow.fromJson(Map<String, dynamic> json) => Snow(
        threeHour: (json['3h'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        '3h': threeHour,
      };
}
