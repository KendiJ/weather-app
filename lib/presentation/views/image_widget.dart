// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:weather_app/domain/model/forecast_responce.dart';

class ImageWidget extends StatelessWidget {
  final ForecastResponse response;
  final String weather;
  final double temperature;
  const ImageWidget(
      {super.key,
      required this.response,
      required this.weather,
      required this.temperature});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(response.list[0].weather[0].main == "Clouds"
                ? 'assets/images/forest_sunny.png'
                : response.list[0].weather[0].main == "Rainy"
                    ? 'assets/images/forest_rainy.png'
                    : 'assets/images/forest_cloudy.png'),
            fit: BoxFit.fitHeight),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            temperature.toString(),
            style: const TextStyle(
                fontSize: 60, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            weather,
            style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.normal,
                color: Colors.white),
          ),
          // Text(state.forecastResponce.city.name),
        ],
      ),
    );
  }
}