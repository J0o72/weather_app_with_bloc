import 'package:weather_app_bloc/models/weather_model.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {
  // Second Solution
  WeatherModel weatherModel;
  WeatherSuccess({required this.weatherModel});
}

class WeatherFailure extends WeatherState {}
