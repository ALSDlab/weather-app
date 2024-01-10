class WeatherModel{
List<String> times;
List<num> temp;
List<num> wmoCode;
List<num> humidity;
List<num> windSpeed;
List<num> pressure;

//<editor-fold desc="Data Methods">
  WeatherModel({
    required this.times,
    required this.temp,
    required this.wmoCode,
    required this.humidity,
    required this.windSpeed,
    required this.pressure,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WeatherModel &&
          runtimeType == other.runtimeType &&
          times == other.times &&
          temp == other.temp &&
          wmoCode == other.wmoCode &&
          humidity == other.humidity &&
          windSpeed == other.windSpeed &&
          pressure == other.pressure);

  @override
  int get hashCode =>
      times.hashCode ^
      temp.hashCode ^
      wmoCode.hashCode ^
      humidity.hashCode ^
      windSpeed.hashCode ^
      pressure.hashCode;

  @override
  String toString() {
    return 'WeatherModel{ times: $times, temp: $temp, wmoCode: $wmoCode, humidity: $humidity, windSpeed: $windSpeed, pressure: $pressure,}';
  }

  WeatherModel copyWith({
    List<String>? times,
    List<num>? temp,
    List<num>? wmoCode,
    List<num>? humidity,
    List<num>? windSpeed,
    List<num>? pressure,
  }) {
    return WeatherModel(
      times: times ?? this.times,
      temp: temp ?? this.temp,
      wmoCode: wmoCode ?? this.wmoCode,
      humidity: humidity ?? this.humidity,
      windSpeed: windSpeed ?? this.windSpeed,
      pressure: pressure ?? this.pressure,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'times': times,
      'temp': temp,
      'wmoCode': wmoCode,
      'humidity': humidity,
      'windSpeed': windSpeed,
      'pressure': pressure,
    };
  }

  factory WeatherModel.fromJson(Map<String, dynamic> map) {
    return WeatherModel(
      times: map['times'] as List<String>,
      temp: map['temp'] as List<num>,
      wmoCode: map['wmoCode'] as List<num>,
      humidity: map['humidity'] as List<num>,
      windSpeed: map['windSpeed'] as List<num>,
      pressure: map['pressure'] as List<num>,
    );
  }

//</editor-fold>
}