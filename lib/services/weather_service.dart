import 'package:location/location.dart';

class WeatherService {
  static Future<dynamic> getWeather() async {
    const String key = '';
    LocationData location = await Location().getLocation();
  }
}
