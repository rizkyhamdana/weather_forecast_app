import 'package:weather_forecast_app/data/model/city.dart';
import 'package:weather_forecast_app/data/model/forecast.dart';

abstract class AppRepository {
  Future<List<CityResponse>> getCity(String cityName);
  Future<ForecastResponse> getForecast(double lat, double long);
}
