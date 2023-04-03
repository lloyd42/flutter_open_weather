import 'package:flutter/material.dart';
import 'package:flutter_open_weather/models/weather_current.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final Current current;

  const CurrentWeatherWidget({super.key, required this.current});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          height: 120.0,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            color: Color(0x3019A7CE),
            // boxShadow: [
            //   BoxShadow(
            //     color: Color(0xffe8e8e8),
            //     offset: Offset(5, 5),
            //     blurRadius: 5.0,
            //     spreadRadius: 1.0,
            //   )
            // ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20.0),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "${current.main?.temp?.toStringAsFixed(1)}°",
                        style: const TextStyle(
                          fontSize: 60.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff146C94),
                        )),
                    TextSpan(
                      text: "${current.weather?[0].description}",
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ]),
                ),
              ),
              Container(
                width: 1.0,
                height: 50.0,
                color: const Color.fromARGB(255, 233, 233, 233),
              ),
              Image.network(
                "https://openweathermap.org/img/wn/${current.weather?[0].icon}@2x.png",
              )
            ],
          ),
        ),
        Container(
          margin:
              const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
          padding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            color: Color(0x3019A7CE),
            // boxShadow: [
            //   BoxShadow(
            //     color: Color(0xffe8e8e8),
            //     offset: Offset(5, 5),
            //     blurRadius: 5.0,
            //     spreadRadius: 1.0,
            //   )
            // ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image.asset(
                    "images/wind.png",
                    width: 80.0,
                    height: 80.0,
                  ),
                  Text(
                    "${current.wind?.speed}km/h",
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Color(0xff146C94),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    "images/cloud.png",
                    width: 80.0,
                    height: 80.0,
                  ),
                  Text(
                    "${current.clouds?.all}%",
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Color(0xff146C94),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    "images/humidity.png",
                    width: 80.0,
                    height: 80.0,
                  ),
                  Text(
                    "${current.main?.humidity}%",
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Color(0xff146C94),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
