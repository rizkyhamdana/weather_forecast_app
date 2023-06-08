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

  getLocation() async {
    try {
      var response = await Utility.getUserLocation();

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
