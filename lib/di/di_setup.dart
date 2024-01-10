import 'package:get_it/get_it.dart';
import 'package:weather_app/ui/screen/weather_view_model.dart';

import '../data/repository/weather_repository.dart';
import '../data/repository/weather_repository_impl.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<WeatherRepository>(WeatherRepositoryImpl());
  getIt.registerFactory<WeatherViewModel>(
      () => WeatherViewModel(repository: getIt<WeatherRepository>()));
}
