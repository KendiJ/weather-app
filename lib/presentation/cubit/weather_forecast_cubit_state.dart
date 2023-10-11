part of 'weather_forecast_cubit_cubit.dart';

@immutable
sealed class WeatherForecastCubitState {}

final class WeatherForecastCubitInitial extends WeatherForecastCubitState {}

final class WeatherForecastCubitLoading extends WeatherForecastCubitState {}

final class WeatherForecastCubitSuccess extends WeatherForecastCubitState {
  final ForecastResponse forecastRes;
  final double temperature;
  final Weather weather;
  final double tempCurrent;
  final double tempMin;
  final double tempMax;
  final List<ListElement> weatherList;

  WeatherForecastCubitSuccess({required this.forecastRes,
      required this.temperature,
      required this.weather,
      required this.weatherList,
      required this.tempCurrent,
      required this.tempMax,
      required this.tempMin
      });
}

final class WeatherForecastCubitFail extends WeatherForecastCubitState {
  final String error;

  WeatherForecastCubitFail({required this.error});
}
