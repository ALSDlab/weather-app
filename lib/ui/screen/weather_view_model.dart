import 'package:flutter/cupertino.dart';
import 'package:weather_app/data/repository/weather_repository.dart';

class WeatherViewModel extends ChangeNotifier{
 WeatherRepository _repository;

 WeatherViewModel({
    required WeatherRepository repository,
  }) : _repository = repository;








}