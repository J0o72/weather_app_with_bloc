import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_app_bloc/blocs/weather_bloc/weather_states.dart';
import 'package:weather_app_bloc/models/weather_model.dart';
import 'package:weather_app_bloc/pages/search_page.dart';
import 'package:weather_app_bloc/widgets/home_default.dart';
import 'package:weather_app_bloc/widgets/home_with_weather.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    // weatherData = Provider.of<WeatherProvider>(context).weatherData;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        backgroundColor:
            BlocProvider.of<WeatherBloc>(context).weatherModel == null
                ? Colors.blue
                : BlocProvider.of<WeatherBloc>(context)
                    .weatherModel!
                    .getThemeColor(),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchPage();
              }));
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherSuccess) {
            // This is First Solution to pass weather model as argument
            // weatherData = BlocProvider.of<WeatherBloc>(context).weatherModel!;
            // return HomeWithWeather(weatherData: weatherData ,);

            // Second Solution
            return HomeWithWeather(
              weatherData: state.weatherModel,
            );
          } else if (state is WeatherFailure) {
            return const Center(
              child: Text("There is error to get weather, try later"),
            );
          } else {
            return const HomeDefault();
          }
        },
      ),
    );
  }
}
