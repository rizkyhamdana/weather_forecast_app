import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_forecast_app/config/services/injection.dart';
import 'package:weather_forecast_app/data/model/city_response.dart';
import 'package:weather_forecast_app/domain/repository/app_repository.dart';

import 'state.dart';

@lazySingleton
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState().init());

  var appRepository = getIt<AppRepository>();

  Future<List<CityResponse>> getCity(String city) async {
    try {
      final response = await appRepository.getCity(city);

      HomeState().clone();

      return response;
    } catch (e) {
      return [];
    }
  }
}
