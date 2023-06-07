import 'package:weather_forecast_app/data/model/city_response.dart';

abstract class AppRepository {
  Future<List<CityResponse>> getCity(String cityName);
}
