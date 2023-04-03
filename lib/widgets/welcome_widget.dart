import 'package:flutter/material.dart';
import 'package:flutter_open_weather/controllers/global_controller.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class WelcomeWidget extends StatefulWidget {
  const WelcomeWidget({super.key});

  @override
  State<WelcomeWidget> createState() => _WelcomeWidgetState();
}

class _WelcomeWidgetState extends State<WelcomeWidget> {
  String city = "";
  String dateTime = "";
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    getAddress(globalController.getLatitude().value,
        globalController.getLongitude().value);
    // 日期本地化功能初始化
    initializeDateFormatting('zh_cn', null);
    dateTime = DateFormat("yMMMMEEEEd", "zh_cn").format(DateTime.now());
    super.initState();
  }

  getAddress(latitude, longitude) async {
    List<Placemark> placeMark =
        await placemarkFromCoordinates(latitude, longitude);
    Placemark place = placeMark[0];
    setState(() {
      city = '${place.locality} ${place.subLocality}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.topLeft,
          child: Text(
            city,
            style: const TextStyle(
              fontSize: 30,
              height: 2,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          alignment: Alignment.topLeft,
          child: Text(
            dateTime,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
              height: 1.5,
            ),
          ),
        )
      ],
    );
  }
}
