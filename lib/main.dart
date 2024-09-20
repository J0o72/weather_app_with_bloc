import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_bloc/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_app_bloc/pages/home_page.dart';
import 'package:weather_app_bloc/services/weather_service.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) {
        return WeatherBloc(WeatherService());
      },
      child: const WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // theme: ThemeData(
      //   primarySwatch:
      //       BlocProvider.of<WeatherBloc>(context).weatherModel == null
      //           ? Colors.blue
      //           : BlocProvider.of<WeatherBloc>(context)
      //               .weatherModel!
      //               .getThemeColor(),
      // ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
