import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_app_bloc/models/weather_model.dart';
import 'package:weather_app_bloc/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  String? cityName;

  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: TextField(
            onSubmitted: (data) async {
              cityName = data;

              BlocProvider.of<WeatherBloc>(context)
                  .getWeather(cityName: cityName!);

              BlocProvider.of<WeatherBloc>(context).cityName = cityName;

              Navigator.pop(context);
            },
            decoration: InputDecoration(
              hintText: "Type a city",
              border: OutlineInputBorder(),
              suffixIcon: GestureDetector(
                onTap: () async {
                  BlocProvider.of<WeatherBloc>(context)
                      .getWeather(cityName: cityName!);

                  Navigator.pop(context);
                },
                child: Icon(Icons.search),
              ),
              label: Text("Search"),
            ),
          ),
        ),
      ),
    );
  }
}
