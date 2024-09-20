import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_app_bloc/models/weather_model.dart';

class HomeWithWeather extends StatelessWidget {
  const HomeWithWeather({
    super.key,
    required this.weatherData,
  });

  final WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            weatherData!.getThemeColor(),
            weatherData!.getThemeColor()[300]!,
            weatherData!.getThemeColor()[100]!
          ])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 2,
          ),
          Text(
            BlocProvider.of<WeatherBloc>(context).cityName!,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Update at ${weatherData!.date.hour}:${weatherData!.date.minute}",
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
          ),
          const Spacer(
            flex: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(weatherData!.getIconWeatherState()),
              Text(
                weatherData!.temp.toInt().toString(),
                style: const TextStyle(
                  fontSize: 40,
                ),
              ),
              Column(
                children: [
                  Text("max : ${weatherData!.maxTemp.toInt()}"),
                  Text("min : ${weatherData!.minTemp.toInt()}"),
                ],
              )
            ],
          ),
          const Spacer(
            flex: 1,
          ),
          Text(
            weatherData!.weatherStateName,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(
            flex: 4,
          ),
        ],
      ),
    );
  }
}
