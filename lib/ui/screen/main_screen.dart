import 'package:flutter/material.dart';
import 'package:weather_app/ui/screen/weather_view_model.dart';
import 'package:provider/provider.dart';

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

      appBar: AppBar(
        backgroundColor: Colors.grey,
        leading: IconButton(
          icon: const Icon(Icons.search),
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
                  controller: _textController,
                  decoration: const InputDecoration(hintText: '도시명을 입력하세요'),
                  onChanged: (value) {
                    viewModel.getInfo(value);
                  },
                ),
              )
            : Container(),
        actions: const [
          Icon(
            Icons.menu,
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://images.unsplash.com/photo-1505322101000-19457cff32ba?q=80&w=1500&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_textController.text,
                  style: const TextStyle(fontSize: 30, color: Colors.white)),
              Text(viewModel.timeDate,
                  style: const TextStyle(fontSize: 13, color: Colors.white)),
              const SizedBox(height: 100),
              Text(
                '${viewModel.temperature}℃',
                style: const TextStyle(fontSize: 50, color: Colors.white),
              ),
              Row(
                children: [
                  const Icon(Icons.cloudy_snowing, color: Colors.white),
                  Text(
                    viewModel.vmoCode.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 64,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Text('Wind', style: TextStyle(color: Colors.white)),
                      Text(viewModel.windSpeed.toString(),
                          style: const TextStyle(fontSize: 20, color: Colors.white)),
                      const Text('km/h'),
                    ],
                  ),
                  Column(
                    children: [
                      const Text('Atm', style: TextStyle(color: Colors.white),),
                      Text(viewModel.pressure.toString(),
                          style: const TextStyle(fontSize: 20, color: Colors.white)),
                      const Text('hPa'),
                    ],
                  ),
                  Column(
                    children: [
                      const Text('Humidity', style: TextStyle(color: Colors.white)),
                      Text(viewModel.humidity.toString(),
                          style: const TextStyle(fontSize: 20, color: Colors.white)),
                      const Text('%'),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
