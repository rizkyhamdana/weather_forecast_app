import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_forecast_app/config/services/call_api_service.dart';
import 'package:weather_forecast_app/config/services/injection.dart';
import 'package:weather_forecast_app/config/util/constant.dart';
import 'package:weather_forecast_app/config/util/utility.dart';
import 'package:weather_forecast_app/data/model/city.dart';
import 'package:weather_forecast_app/data/model/forecast.dart';
import 'package:weather_forecast_app/domain/repository/app_repository.dart';

@LazySingleton(as: AppRepository)
class AppRepositoryImpl implements AppRepository {
  var callService = getIt<CallApiService>();
  @override
  Future<List<CityResponse>> getCity(String cityName) async {
    try {
      var response = await callService.connect(
        Constant.getCity,
        {
          "q": cityName,
        },
        Constant.post,
      );

      return cityResponseFromJson(jsonEncode(response.data));
    } on DioException catch (e) {
      throw Exception(Utility.handleError(e));
    }
  }

  @override
  Future<ForecastResponse> getForecast(double lat, double long) async {
    try {
      var response = await callService.connect(
        Constant.getForecast,
        {
          "lat": lat,
          "lon": long,
        },
        Constant.get,
      );

      return forecastResponseFromJson(jsonEncode(response.data));
    } on DioException catch (e) {
      throw Exception(Utility.handleError(e));
    }
  }
}
