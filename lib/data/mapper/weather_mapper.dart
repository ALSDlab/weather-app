import '../dto/weather_dto.dart';
import '../model/weather_model.dart';

extension DtotoModel on Hourly {
  WeatherModel toModel() {
    return WeatherModel(
        times: time ?? [],
        temp: temperature2m ?? [],
        wmoCode: weathercode ?? [],
        humidity: relativehumidity2m ?? [],
        windSpeed: windspeed10m ?? [],
        pressure: pressureMsl ?? []);
  }
}
