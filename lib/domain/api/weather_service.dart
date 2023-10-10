
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/domain/model/forecast_responce.dart';
import 'package:weather_app/domain/model/weather_responce.dart';

class WeatherApi {
  final String apiKey = '395f5a02af3a3d158ca9d6649c9f2795';

  Future<WeatherResponse> fetchCurrentWeather(String city) async {
    final response = await http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey'),
    );

    if (response.statusCode == 200) {
      return WeatherResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load current weather data');
    }
  }

  Future<ForecastResponse> fetchWeatherForecast(String city) async {
    final response = await http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$apiKey'),
    );

    if (response.statusCode == 200) {
      return ForecastResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather forecast data');
    }
  }
}

