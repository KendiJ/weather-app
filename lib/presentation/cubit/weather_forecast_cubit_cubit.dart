import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/domain/model/forecast_responce.dart';
import 'package:weather_app/domain/api/weather_service.dart';

part 'weather_forecast_cubit_state.dart';

class WeatherForecastCubitCubit extends Cubit<WeatherForecastCubitState> {
  WeatherForecastCubitCubit() : super(WeatherForecastCubitInitial());
  getWeatherForecast() async {
    emit(WeatherForecastCubitLoading());
    try {
      ForecastResponse forecastResponse =
          await WeatherApi().fetchWeatherForecast('Nairobi');
      if (forecastResponse.list.isNotEmpty) {
        final temperature = forecastResponse.list.first.main.temp;
        final weather = forecastResponse.list.first.weather.first.main.name;

        emit(WeatherForecastCubitSuccess(
            forecastRes: forecastResponse,
            temperature: temperature,
            weather: weather));
      } else {
        emit(WeatherForecastCubitFail(error: "Weather not found"));
      }
    } catch (e) {
      emit(WeatherForecastCubitFail(error: e.toString()));
    }
  }
}
