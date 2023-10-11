import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
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
        List<ListElement> dataToBeReturned = [];

        Map<DateTime, ListElement> mappedResponse = { for (var item in forecastResponse.list) item.dtTxt : item };

        final currentDate = DateTime.now();
        //final formattedCurrentDate = _getFormattedDate(currentDate);
        final formattedCurrentHour = _getFormattedHour(currentDate);
        int hourOfWeatherToBeDisplayed = 0;

        final listOfHours = [0, 3, 6, 9, 12, 15, 18, 21, 24];
        for (int h in listOfHours) {
          if(h - int.parse(formattedCurrentHour) > 0 && h - int.parse(formattedCurrentHour) < 3) {
            hourOfWeatherToBeDisplayed = h;
          }
        }

        mappedResponse.forEach((key, value) {
          if(key.hour == hourOfWeatherToBeDisplayed) {
            print(key);
            dataToBeReturned.add(value);
          }
        });

        final temperature = dataToBeReturned.first.main.temp;
        final weather = dataToBeReturned.first.weather.first;
        final tempCurrent = dataToBeReturned.first.main.temp;
        final tempMin = dataToBeReturned.first.main.tempMin;
        final tempMax = dataToBeReturned.first.main.tempMax;
        emit(WeatherForecastCubitSuccess(
            tempCurrent: tempCurrent,
            tempMin: tempMin,
            tempMax: tempMax,
            forecastRes: forecastResponse,
            temperature: temperature,
            weatherList: dataToBeReturned.sublist(0, dataToBeReturned.length),
            weather: weather));

      } else {
        emit(WeatherForecastCubitFail(error: "Weather not found"));
      }
    } catch (e) {
      emit(WeatherForecastCubitFail(error: e.toString()));
    }
  }

  String _getFormattedHour(DateTime date) => DateFormat.H().format(date);
}
