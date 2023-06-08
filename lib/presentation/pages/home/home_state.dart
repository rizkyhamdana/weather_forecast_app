import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_forecast_app/data/model/city_response.dart';

@immutable
class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState {
  final CityResponse cityResponse;
  const HomeLoaded({required this.cityResponse});
}

class HomeError extends HomeState {
  final String error;
  const HomeError({required this.error});
}

class HomeEmpty extends HomeState {}

class LocationGet extends HomeState {}

class LocationFailed extends HomeState {}
