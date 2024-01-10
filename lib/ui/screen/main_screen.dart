import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.search),
        actions: [
          Icon(Icons.menu,)
        ],
      ),
      body: Column(
        children: [
          Text('Warsaw'),
          Text('시간 날짜', style: TextStyle(fontSize: 13)),
          Text('-5℃'),
          Row(
            children: [
              Icon(Icons.cloudy_snowing),
              Text('Snowing'),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Text('Wind'),
                  Text('13', style: TextStyle(fontSize: 20)),
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
