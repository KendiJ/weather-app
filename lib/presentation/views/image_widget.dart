// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:weather_app/domain/model/forecast_responce.dart';
import 'package:weather_app/presentation/cubit/weather_forecast_cubit_cubit.dart';

class ImageWidget extends StatelessWidget {
  final WeatherForecastCubitSuccess weatherForecastCubitSuccess;
  const ImageWidget(
      {super.key,
      required this.weatherForecastCubitSuccess});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(_getWeatherBanner(weatherForecastCubitSuccess.weather.main)),
            fit: BoxFit.fitHeight),
      ),
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Text(
            weatherForecastCubitSuccess.temperature.toString(),
            style: const TextStyle(
                fontSize: 60, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            weatherForecastCubitSuccess.weather.main.name,
            style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.normal,
                color: Colors.white),
          ),
          const Spacer(),
          ///
          Row(
            children: [
              // min
              Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "${weatherForecastCubitSuccess.tempMin}°",
                        style: const TextStyle(color: Colors.white),
                      ),
                      const Text(
                        "min",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )),
              //curent
              Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "${weatherForecastCubitSuccess.tempCurrent}°",
                        style: const TextStyle(color: Colors.white),
                      ),
                      const Text(
                        "current",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )),
              // max
              Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "${weatherForecastCubitSuccess.tempMax}°",
                        style: const TextStyle(color: Colors.white),
                      ),
                      const Text(
                        "max",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ))
            ],
          ),
          const Divider(color: Colors.white),
          // Text(state.forecastResponce.city.name),
        ],
      ),
    );
  }
}

String _getWeatherBanner(MainEnum weatherType) {
  switch(weatherType) {
    case MainEnum.CLOUDS:
      return "assets/images/forest_cloudy.png";
    case MainEnum.RAIN:
      return "assets/images/forest_rainy.png";
    case MainEnum.CLEAR:
      return "assets/images/forest_sunny.png";
    default:
      return "";
  }
}