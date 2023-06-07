import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:weather_forecast_app/config/services/call_api_service.dart';
import 'package:weather_forecast_app/config/services/injection.dart';
import 'package:weather_forecast_app/config/util/constant.dart';
import 'package:weather_forecast_app/data/model/city_response.dart';
import 'package:weather_forecast_app/domain/repository/app_repository.dart';

@LazySingleton(as: AppRepository)
class AppRepositoryImpl implements AppRepository {
  var callService = getIt<CallApiService>();
  @override
  Future<List<CityResponse>> getCity(String cityName) async {
    final response = await callService.connect(
      '${Constant.getCity}q=$cityName',
      {},
      Constant.get,
    );
    return cityResponseFromJson(jsonEncode(response.data));
  }
}
