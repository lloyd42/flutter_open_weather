import 'package:flutter/material.dart';
import 'package:flutter_open_weather/views/home_view.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: HomeView(),
      title: "天气",
      debugShowCheckedModeBanner: false,
    );
  }
}
