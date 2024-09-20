import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/blocs/weather_bloc/weather_states.dart';
import 'package:weather_app_bloc/models/weather_model.dart';
import 'package:weather_app_bloc/services/weather_service.dart';

class WeatherBloc extends Cubit<WeatherState> {
  WeatherBloc(this.weatherService) : super(WeatherInitial());

  WeatherService weatherService;
  WeatherModel? weatherModel;
  String? cityName;

  void getWeather({required String cityName}) async {
    emit(WeatherLoading());
    try {
      cityName = cityName;
      weatherModel = await weatherService.getWeatherDate(cityName: cityName);
      emit(WeatherSuccess(weatherModel: weatherModel!));
    } on Exception catch (e) {
      emit(WeatherFailure());
    }
  }
}
