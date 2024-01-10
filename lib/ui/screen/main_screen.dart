import 'package:flutter/material.dart';
import 'package:weather_app/ui/screen/weather_view_model.dart';
import 'package:provider/provider.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _textController = TextEditingController();
  bool isSearchVisible = false;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<WeatherViewModel>();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                viewModel.backgroundImg,
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3), BlendMode.darken)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppBar(
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  icon: const Icon(Icons.search, color: Colors.white),
                  onPressed: () {
                    setState(() {
                      isSearchVisible = !isSearchVisible;
                    });
                  },
                ),
                title: (isSearchVisible)
                    ? Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          controller: _textController,
                          decoration: const InputDecoration(
                            hintText: '도시명을 입력하세요',
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                          onChanged: (value) {
                            viewModel.getInfo(value);
                          },
                        ),
                      )
                    : Container(),
                actions: const [
                  Icon(
                    Icons.menu,
                    color: Colors.white,
                  )
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_textController.text,
                        style:
                            const TextStyle(fontSize: 30, color: Colors.white)),
                    Text(viewModel.timeDate,
                        style:
                            const TextStyle(fontSize: 13, color: Colors.white)),
                  ],
                ),
              ),
              // const SizedBox(height: 100),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${viewModel.temperature}℃',
                      style: const TextStyle(fontSize: 50, color: Colors.white),
                    ),
                    Row(
                      children: [
                        viewModel.weatherIcon,
                        Text(
                          viewModel.weatherText,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // const SizedBox(
              //   height: 64,
              // ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Text('Wind',
                              style: TextStyle(color: Colors.white)),
                          Text('${viewModel.windSpeed.toString()} km/h',
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white)),
                          SimpleAnimationProgressBar(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                            height: 3,
                            width: 60,
                            backgroundColor: Colors.grey,
                            foregrondColor: Colors.green,
                            ratio: viewModel.windSpeed / 100,
                            direction: Axis.horizontal,
                            curve: Curves.fastLinearToSlowEaseIn,
                            duration: Duration(seconds: 3),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Atm',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text('${viewModel.pressure.toString()} hPa',
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white)),
                          SimpleAnimationProgressBar(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                            height: 3,
                            width: 60,
                            backgroundColor: Colors.grey,
                            foregrondColor: Colors.green,
                            ratio: (viewModel.diffPressure / (1089.1 - 951.5)),
                            direction: Axis.horizontal,
                            curve: Curves.fastLinearToSlowEaseIn,
                            duration: Duration(seconds: 3),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text('Humidity',
                              style: TextStyle(color: Colors.white)),
                          Text(
                            '${viewModel.humidity.toString()} %',
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          ),
                          SimpleAnimationProgressBar(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                            height: 3,
                            width: 60,
                            backgroundColor: Colors.grey,
                            foregrondColor: Colors.green,
                            ratio: viewModel.humidity / 100,
                            direction: Axis.horizontal,
                            curve: Curves.fastLinearToSlowEaseIn,
                            duration: Duration(seconds: 3),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
