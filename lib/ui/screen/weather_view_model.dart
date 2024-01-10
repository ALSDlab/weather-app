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
  String backgroundImg = 'https://images.unsplash.com/photo-1698623891445-1311641ef663?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';

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
        backgroundImg = 'https://images.unsplash.com/photo-1698623891445-1311641ef663?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
        break;
      case >= 4 && <= 12:
        weatherText = 'Cloudy';
        backgroundImg = 'https://images.unsplash.com/photo-1532178910-7815d6919875?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
        break;
      case == 13:
        weatherText = 'Lightning';
        backgroundImg = 'https://images.unsplash.com/photo-1429552077091-836152271555?q=80&w=1885&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
        break;
      case >= 14 && <= 19:
        weatherText = 'Rainy Soon';
        backgroundImg = 'https://images.unsplash.com/photo-1567688993206-43c34131b21f?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
        break;
      case (>= 20 && <= 29) || (>= 50 && <= 59):
        weatherText = 'Drizzle';
        backgroundImg = 'https://images.unsplash.com/photo-1567688993206-43c34131b21f?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
        break;
      case >= 30 && <= 39:
        weatherText = 'Dusty';
        backgroundImg = 'https://images.unsplash.com/photo-1545134969-8debd725b007?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
        break;
      case >= 40 && <= 49:
        weatherText = 'Foggy';
        backgroundImg = 'https://images.unsplash.com/photo-1531762901554-db903966e2d0?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
        break;
      case >= 60 && <= 69:
        weatherText = 'Rainy';
        backgroundImg = 'https://images.unsplash.com/photo-1567688993206-43c34131b21f?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
        break;
      case >= 70 && <= 79:
        weatherText = 'Snowy';
        backgroundImg = 'https://images.unsplash.com/photo-1505322101000-19457cff32ba?q=80&w=1500&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
        break;
      case >= 80 && <= 89:
        weatherText = 'Rainy Shower';
        backgroundImg = 'https://images.unsplash.com/photo-1567688993206-43c34131b21f?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
        break;
      default:
        weatherText = 'Thunder Storm';
        backgroundImg = 'https://cdn.pixabay.com/photo/2023/01/19/23/22/ai-generated-7730401_1280.jpg';
        break;
    }
  }
}
