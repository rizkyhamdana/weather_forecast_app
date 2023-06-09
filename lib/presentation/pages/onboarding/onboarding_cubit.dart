import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_forecast_app/config/util/utility.dart';
import 'package:weather_forecast_app/presentation/pages/onboarding/onboarding_state.dart';

@lazySingleton
class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  void getLocation() async {
    try {
      emit(LocationLoading());
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
