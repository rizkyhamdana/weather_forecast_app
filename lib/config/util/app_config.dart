import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather_forecast_app/config/util/constant.dart';

class AppConfig extends InheritedWidget {
  const AppConfig({
    super.key,
    required Widget child,
  }) : super(child: child);

  static String currentUrl = 'https://openweathermap.org/api';

  static bool isDebug = true;

  static Duration connectTimeout = const Duration(seconds: 100);
  static Duration receiveTimeout = const Duration(seconds: 100);

  static void log(String message) {
    if (kDebugMode) {
      print(Constant.appName + (" : ") + message);
    }
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
