import 'package:flutter/material.dart';
import 'package:flutter_open_weather/controllers/global_controller.dart';
import 'package:flutter_open_weather/models/weather_forecast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ForecastWeatherWidget extends StatelessWidget {
  final Lists lists;

  const ForecastWeatherWidget({super.key, required this.lists});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 0),
          child: const Text(
            "未来24小时预报",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        forecastList(),
      ],
    );
  }

  Widget forecastList() {
    final GlobalController globalController =
        Get.put(GlobalController(), permanent: true);

    return Container(
      height: 165.0,
      margin: const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: lists.list?.length,
        itemBuilder: (BuildContext context, int index) {
          return Obx((() => GestureDetector(
                onTap: () {
                  globalController.touchIndex.value = index;
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 5),
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 20, left: 20, right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: globalController.touchIndex.value == index
                        ? const Color(0xff146C94)
                        : const Color(0x3019A7CE),
                  ),
                  child: ForcastItem(
                    index: index,
                    time: lists.list?[index].dt,
                    temp: lists.list?[index].main?.temp,
                    icon: lists.list?[index].weather?[0].icon,
                  ),
                ),
              )));
        },
      ),
    );
  }
}

class ForcastItem extends StatelessWidget {
  int index;
  int? time;
  double? temp;
  String? icon;

  String getTime(final timeStamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String t = DateFormat("jm").format(time);
    return t;
  }

  ForcastItem({
    super.key,
    required this.time,
    required this.temp,
    required this.icon,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final GlobalController globalController =
        Get.put(GlobalController(), permanent: true);

    return Obx((() => Column(
          children: [
            Text(
              getTime(time!),
              style: TextStyle(
                color: globalController.touchIndex.value == index
                    ? const Color(0xff19A7CE)
                    : const Color(0xff146C94),
                fontSize: 16,
              ),
            ),
            Image.network(
              "https://openweathermap.org/img/wn/$icon@2x.png",
              height: 80.0,
              width: 80.0,
              errorBuilder: (context, error, stackTrace) {
                return const CircularProgressIndicator();
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            ),
            Text(
              "${temp?.toStringAsFixed(1)}°",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        )));
  }
}
