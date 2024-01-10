import '../model/weather_model.dart';

abstract interface class WeatherRepository {
  Future<WeatherModel> getWeather(num lat, num lng);
}