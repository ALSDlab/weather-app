import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weather_app/data/repository/weather_repository.dart';

class WeatherViewModel extends ChangeNotifier {
  final WeatherRepository _repository;

  String timeDate = '00:00 - 01/01';
  num temperature = 0.0;
  num humidity = 0;
  num windSpeed = 0.0;
  num pressure = 0.0;
  num vmoCode = 0;
  List<Location> location = [];
  String weatherText = '';
  String backgroundImg = '';

  WeatherViewModel({
    required WeatherRepository repository,
  }) : _repository = repository;

  Future<List<Location>> convertLocationToLatLng(String location) async {
    List<Location> locations =
        await locationFromAddress(localeIdentifier: 'ko_KR', location);
    return locations;
  }

  Future<void> getInfo(String location) async {
    int nowHour = DateTime.now().hour.toInt();
    final List<Location> locations = await convertLocationToLatLng(location);
    final result = await _repository.getWeather(
        locations[0].latitude, locations[0].longitude);
    timeDate = result.times[nowHour];
    temperature = result.temp[nowHour];
    humidity = result.humidity[nowHour];
    windSpeed = result.windSpeed[nowHour];
    pressure = result.pressure[nowHour];
    vmoCode = result.wmoCode[nowHour];
    weatherCodeDistribution(vmoCode);

    notifyListeners();
  }

  void weatherCodeDistribution(num vmoCode) {
    switch (vmoCode) {
      case >= 0 && <= 3:
        weatherText = 'Sunny';
        backgroundImg = '';
        break;
      case >= 4 && <= 12:
        weatherText = 'Cloudy';
        backgroundImg = '';
        break;
      case == 13:
        weatherText = 'Lightning';
        backgroundImg = '';
        break;
      case >= 14 && <= 19:
        weatherText = 'Rainy Soon';
        backgroundImg = '';
        break;
      case (>= 20 && <= 29) || (>= 50 && <= 59):
        weatherText = 'Drizzle';
        backgroundImg = '';
        break;
      case >= 30 && <= 39:
        weatherText = 'Dusty';
        backgroundImg = '';
        break;
      case >= 40 && <= 49:
        weatherText = 'Foggy';
        backgroundImg = '';
        break;
      case >= 60 && <= 69:
        weatherText = 'Rainy';
        backgroundImg = '';
        break;
      case >= 70 && <= 79:
        weatherText = 'Snowy';
        backgroundImg = '';
        break;
      case >= 80 && <= 89:
        weatherText = 'Rainy Shower';
        backgroundImg = '';
        break;
      default:
        weatherText = 'Thunder Storm';
        backgroundImg = '';
        break;
    }
  }
}
