import 'package:weather_app/data/mapper/weather_mapper.dart';
import 'package:weather_app/data/model/weather_model.dart';
import 'package:weather_app/data/repository/weather_repository.dart';

import '../source/weather_source.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final _api = WeatherApi();

  @override
  Future<WeatherModel> getWeather(double lat, double lng) async {
    final dto = await _api.getWeatherInfo(lat, lng);
    return dto.hourly!.toModel();
  }

}