// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:weather_app/domain/model/forecast_responce.dart';
import 'package:weather_app/presentation/views/days_weather_view.dart';
import 'package:weather_app/presentation/views/image_widget.dart';
import 'package:weather_app/presentation/widgets/consts/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/weather_forecast_cubit_cubit.dart';

class RainyView extends StatefulWidget {
  const RainyView({super.key});

  @override
  State<StatefulWidget> createState() => _RainyView();
}

class _RainyView extends State<RainyView> {
  String weatherCondition = required.toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          AppThemes.getDynamicTheme(weatherCondition: weatherCondition),
      body: BlocConsumer<WeatherForecastCubitCubit, WeatherForecastCubitState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is WeatherForecastCubitLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is WeatherForecastCubitSuccess) {
            return Column(
              children: [
                // Text(state.forecastRes.city.name),
                ImageWidget(
                  weatherForecastCubitSuccess: state,
                ),
                Expanded(child: DaysWeatherView(
                    weatherForecastCubitSuccess: state
                ))
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}


class DayWeather {
  final String day;
  final num temperature;
  final MainEnum weather;

  DayWeather({
    required this.day,
    required this.temperature, required this.weather,
  });
}
