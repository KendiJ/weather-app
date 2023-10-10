part of 'weather_forecast_cubit_cubit.dart';

@immutable
sealed class WeatherForecastCubitState {}

final class WeatherForecastCubitInitial extends WeatherForecastCubitState {}

final class WeatherForecastCubitLoading extends WeatherForecastCubitState {}

final class WeatherForecastCubitSuccess extends WeatherForecastCubitState {
  final ForecastResponse forecastRes;
  final double temperature;
  final String weather;

  WeatherForecastCubitSuccess(
      {required this.forecastRes, required this.temperature, required this.weather,});
}

final class WeatherForecastCubitFail extends WeatherForecastCubitState {
  final String error;

  WeatherForecastCubitFail({required this.error});
}
