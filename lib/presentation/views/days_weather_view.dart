import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/domain/model/forecast_responce.dart';
import 'package:weather_app/presentation/cubit/weather_forecast_cubit_cubit.dart';
import 'package:weather_app/presentation/views/weather_home_view.dart';

class DaysWeatherView extends StatelessWidget {
  final WeatherForecastCubitSuccess weatherForecastCubitSuccess;
  const DaysWeatherView({super.key, required this.weatherForecastCubitSuccess});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title
        ...weatherForecastCubitSuccess.weatherList.map<Widget>((weatherData) {
          return _weatherListTile(
            DayWeather(
              day: DateFormat.E().format(weatherData.dtTxt),
              weather: weatherData.weather.first.main,
              temperature: weatherData.main.temp
            )
          );
        }).toList(),
        /*...<DayWeather>[
          DayWeather(day: "Monday", temperature: 23),
          DayWeather(day: "Tuesday", temperature: 23),
          DayWeather(day: "Wednesday", temperature: 23),
          DayWeather(day: "Thursday", temperature: 23),
          DayWeather(day: "Friday", temperature: 23),
          DayWeather(day: "Saturday", temperature: 23),
          DayWeather(day: "Sunday", temperature: 23),
        ]
            .map(
              (e) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      e.day,
                      style: const TextStyle(color: Colors.white),
                    )),
                    const Expanded(
                      child: Icon(
                        Icons.sunny,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 60),
                    Text(
                      "${e.temperature} °",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            )
            .toList(),*/
      ],
    );
  }
}

Widget _weatherListTile(final DayWeather dayWeather) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Expanded(
            child: Text(
              dayWeather.day,
              style: const TextStyle(color: Colors.white),
            )),
         Expanded(
          flex: 2,
          child: Icon(
            dayWeather.weather == MainEnum.CLEAR ? Icons.sunny : dayWeather.weather == MainEnum.RAIN ? Icons.shower : Icons.cloud,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 60),
        Text(
          "${dayWeather.temperature.toStringAsFixed(2)}°",
          style: const TextStyle(color: Colors.white),
        ),
      ],
    ),
  );
}