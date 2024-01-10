import 'dart:convert';

import '../dto/weather_dto.dart';
import 'package:http/http.dart' as http;

class WeatherApi {
  Future<WeatherDto> getWeatherInfo(num lat, num lng) async {
    final response = await http.get(Uri.parse(
        'https://api.open-meteo.com/v1/forecast?hourly=temperature_2m,weathercode,relativehumidity_2m,windspeed_10m,pressure_msl&latitude=$lat&longitude=$lng'));
    return WeatherDto.fromJson(jsonDecode(response.body));
  }
}
