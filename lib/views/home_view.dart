import 'package:flutter/material.dart';
import 'package:flutter_open_weather/controllers/global_controller.dart';
import 'package:flutter_open_weather/widgets/air_pollution_widget.dart';
import 'package:flutter_open_weather/widgets/current_weather_widget.dart';
import 'package:flutter_open_weather/widgets/forecast_weather_widget.dart';
import 'package:flutter_open_weather/widgets/welcome_widget.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => globalController.checkLoading().isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      const WelcomeWidget(),
                      CurrentWeatherWidget(
                        current: globalController.currentData.value,
                      ),
                      ForecastWeatherWidget(
                          lists: globalController.forecastData.value),
                      AirPollutionWidget(air: globalController.airData.value),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
