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
                padding: EdgeInsets.all(8),
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(hintText: '도시명을 입력하세요'),
                  onChanged: (value){
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
      body:  Column(
        children: [
          Text(_textController.text),
          Text(viewModel.timeDate, style: TextStyle(fontSize: 13)),
          Text('${viewModel.temperature}℃'),
          Row(
            children: [
              Icon(Icons.cloudy_snowing),
              Text(viewModel.vmoCode.toString()),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Text('Wind'),
                  Text(viewModel.windSpeed.toString(), style: TextStyle(fontSize: 20)),
                  Text('km/h'),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
