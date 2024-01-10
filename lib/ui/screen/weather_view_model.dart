import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weather_app/data/repository/weather_repository.dart';

class WeatherViewModel extends ChangeNotifier {
  WeatherRepository _repository;

  String timeDate = '00:00 - 01/01';
  double temperature = 0.0;
  int humidity = 0;
  double windSpeed = 0.0;
  double pressure = 0.0;
  int vmoCode = 0;


  WeatherViewModel({
    required WeatherRepository repository,
  }) : _repository = repository;

  Future getInfo() {

  }

  Future<List<Location>> convertLocationToLatLng(String location) async {
    List<Location> locations = await locationFromAddress(location);
    return locations;
  }
}
