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
    print(locations);
    final result = await _repository.getWeather(
        locations[0].latitude, locations[0].longitude);
    timeDate = result.times[nowHour];
    temperature = result.temp[nowHour];
    humidity = result.humidity[nowHour];
    windSpeed = result.windSpeed[nowHour];
    pressure = result.pressure[nowHour];
    vmoCode = result.wmoCode[nowHour];
    notifyListeners();
  }
}
