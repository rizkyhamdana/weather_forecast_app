import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_forecast_app/config/services/injection.dart';
import 'package:weather_forecast_app/config/util/preferences.dart';
import 'package:weather_forecast_app/config/util/utility.dart';
import 'package:weather_forecast_app/domain/repository/app_repository.dart';

import 'home_state.dart';

@lazySingleton
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  var appRepository = getIt<AppRepository>();

  void getCity(String city) async {
    try {
      var response = await appRepository.getCity(city);
      if (response.isNotEmpty) {
        emit(HomeLoaded(cityResponse: response.first));
      } else {
        emit(HomeEmpty());
      }
    } catch (e) {
      emit(HomeError(error: Utility.handleErrorString(e.toString())));
    }
  }

  void getForecast(double lat, double long, int days) async {
    try {
      var response = await appRepository.getForecast(lat, long, days);
      emit(HomeForecastLoaded(forecastResponse: response));
    } catch (e) {
      print(Utility.handleErrorString(e.toString()));
      emit(HomeError(error: Utility.handleErrorString(e.toString())));
    }
  }

  void getLocation() async {
    try {
      print('Masuk SINI tidak?');
      var response = await Utility.getUserLocation();
      print('Response: $response');
      if (response == true) {
        emit(LocationGet());
      } else {
        emit(LocationFailed());
      }
    } catch (e) {
      emit(LocationFailed());
    }
  }
}
