import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/di/di_setup.dart';
import 'package:weather_app/ui/screen/main_screen.dart';
import 'package:weather_app/ui/screen/weather_view_model.dart';

void main() {
  diSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ChangeNotifierProvider(
          create: (_) => getIt<WeatherViewModel>(),
          child: MainScreen(),
        ));
  }
}
