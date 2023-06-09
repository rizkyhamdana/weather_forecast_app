import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_forecast_app/config/services/injection.dart';
import 'package:weather_forecast_app/config/util/utility.dart';
import 'package:weather_forecast_app/domain/repository/app_repository.dart';

import 'home_state.dart';

@lazySingleton
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  var appRepository = getIt<AppRepository>();

  void getCity(String city) async {
    try {
      emit(HomeLoading());
      var response = await appRepository.getCity(city);
      if (response.isNotEmpty) {
        var lat = response[0].lat;
        var lon = response[0].lon;
        var response2 = await appRepository.getForecast(lat, lon);
        emit(HomeForecastLoaded(forecastResponse: response2));
      } else {
        emit(HomeEmpty());
      }
    } catch (e) {
      emit(HomeError(error: Utility.handleErrorString(e.toString())));
    }
  }

  void getForecast(
    double lat,
    double long,
  ) async {
    try {
      emit(HomeLoading());
      var response = await appRepository.getForecast(lat, long);
      emit(HomeForecastLoaded(forecastResponse: response));
    } catch (e) {
      emit(HomeError(error: Utility.handleErrorString(e.toString())));
    }
  }
}
