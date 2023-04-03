import 'package:flutter/material.dart';
import 'package:flutter_open_weather/models/air_current.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class AirPollutionWidget extends StatelessWidget {
  final Air air;

  const AirPollutionWidget({super.key, required this.air});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 0),
          child: const Text(
            "今日空气质量",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        airGrid(),
      ],
    );
  }

  Widget airGrid() {
    const desc = ["极好", "较好", "一般", "差", "极差"];
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          SleekCircularSlider(
            min: 1,
            max: 5,
            initialValue: air.list?[0].main?.aqi?.toDouble() ?? 1,
            appearance: CircularSliderAppearance(
              customWidths: CustomSliderWidths(
                handlerSize: 0,
                trackWidth: 25,
                progressBarWidth: 25,
              ),
              infoProperties: InfoProperties(
                topLabelText: desc[(air.list?[0].main?.aqi ?? 1) - 1],
                bottomLabelText: "空气质量",
                modifier: (value) {
                  final roundedValue = value.ceil().toInt().toString();
                  return "Lv$roundedValue";
                },
                bottomLabelStyle: const TextStyle(
                  letterSpacing: 0.1,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
              animationEnabled: true,
              size: 140,
              customColors: CustomSliderColors(
                hideShadow: true,
                trackColor: const Color(0xff146C94),
                progressBarColors: [
                  const Color(0xff19A7CE),
                  const Color(0xff146C94),
                ],
              ),
            ),
          ),
          gridList(),
          const Text(
            "注：空气质量等级为1~5级  1为极好 5为极差",
            style: TextStyle(
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }

  Widget gridList() {
    return Container();
  }
}
