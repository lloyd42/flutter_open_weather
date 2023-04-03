import 'package:flutter_open_weather/api/weather.dart';
import 'package:flutter_open_weather/models/weather_current.dart';
import 'package:flutter_open_weather/models/weather_forecast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../models/air_current.dart';

class GlobalController extends GetxController {
  final RxBool _isLoading = true.obs; // 是否加载
  final RxDouble _latitude = 0.0.obs; // 纬度
  final RxDouble _longitude = 0.0.obs; // 经度
  final touchIndex = 0.obs; // 预报列表项索引
  final currentData = Current().obs;
  final forecastData = Lists().obs;
  final airData = Air().obs;

  RxBool checkLoading() => _isLoading;
  RxDouble getLatitude() => _latitude;
  RxDouble getLongitude() => _longitude;

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
    }
    super.onInit();
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    // 检查位置服务是否开启
    if (!isServiceEnabled) {
      return Future.error("未开启位置服务");
    }
    // 位置权限状态
    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("位置权限被永久拒绝");
    } else if (locationPermission == LocationPermission.denied) {
      // 位置权限被拒绝,请求权限
      locationPermission = await Geolocator.requestPermission();
      // 请求权限再次被拒绝
      if (locationPermission == LocationPermission.denied) {
        return Future.error("位置权限被拒绝");
      }
    }
    // 获取现在的位置
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) async {
      // 更新经纬度
      _latitude.value = value.latitude;
      _longitude.value = value.longitude;
      // 请求天气
      await RequestWeather()
          .processRequestWeather(value.latitude, value.longitude)
          .then((value) {
        currentData.value = value;
      });
      await RequestWeather()
          .processRequestForecast(value.latitude, value.longitude)
          .then((value) {
        forecastData.value = value;
      });
      await RequestWeather()
          .processRequestAir(value.latitude, value.longitude)
          .then((value) {
        airData.value = value;
      });
      _isLoading.value = false;
    });
  }
}
