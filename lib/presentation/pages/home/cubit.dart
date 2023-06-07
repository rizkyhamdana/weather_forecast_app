import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_forecast_app/config/services/injection.dart';
import 'package:weather_forecast_app/config/util/utility.dart';
import 'package:weather_forecast_app/data/model/city_response.dart';
import 'package:weather_forecast_app/domain/repository/app_repository.dart';

import 'state.dart';

@lazySingleton
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState().init());

  var appRepository = getIt<AppRepository>();

  void getCity(String city) async {
    try {
      await appRepository.getCity(city);
      emit(state.loaded());
    } catch (e) {
      emit(state.withError(Utility.handleErrorString(e.toString())));
    }
  }
}
