class WeatherDto {
  num? latitude;
  num? longitude;
  num? generationtimeMs;
  num? utcOffsetSeconds;
  String? timezone;
  String? timezoneAbbreviation;
  num? elevation;
  HourlyUnits? hourlyUnits;
  Hourly? hourly;

  WeatherDto(
      {this.latitude,
        this.longitude,
        this.generationtimeMs,
        this.utcOffsetSeconds,
        this.timezone,
        this.timezoneAbbreviation,
        this.elevation,
        this.hourlyUnits,
        this.hourly});

  WeatherDto.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    generationtimeMs = json['generationtime_ms'];
    utcOffsetSeconds = json['utc_offset_seconds'];
    timezone = json['timezone'];
    timezoneAbbreviation = json['timezone_abbreviation'];
    elevation = json['elevation'];
    hourlyUnits = json['hourly_units'] != null
        ? HourlyUnits.fromJson(json['hourly_units'])
        : null;
    hourly =
    json['hourly'] != null ? Hourly.fromJson(json['hourly']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['generationtime_ms'] = generationtimeMs;
    data['utc_offset_seconds'] = utcOffsetSeconds;
    data['timezone'] = timezone;
    data['timezone_abbreviation'] = timezoneAbbreviation;
    data['elevation'] = elevation;
    if (hourlyUnits != null) {
      data['hourly_units'] = hourlyUnits!.toJson();
    }
    if (hourly != null) {
      data['hourly'] = hourly!.toJson();
    }
    return data;
  }
}

class HourlyUnits {
  String? time;
  String? temperature2m;
  String? weathercode;
  String? relativehumidity2m;
  String? windspeed10m;
  String? pressureMsl;

  HourlyUnits(
      {this.time,
        this.temperature2m,
        this.weathercode,
        this.relativehumidity2m,
        this.windspeed10m,
        this.pressureMsl});

  HourlyUnits.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    temperature2m = json['temperature_2m'];
    weathercode = json['weathercode'];
    relativehumidity2m = json['relativehumidity_2m'];
    windspeed10m = json['windspeed_10m'];
    pressureMsl = json['pressure_msl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['temperature_2m'] = temperature2m;
    data['weathercode'] = weathercode;
    data['relativehumidity_2m'] = relativehumidity2m;
    data['windspeed_10m'] = windspeed10m;
    data['pressure_msl'] = pressureMsl;
    return data;
  }
}

class Hourly {
  List<String>? time;
  List<num>? temperature2m;
  List<num>? weathercode;
  List<num>? relativehumidity2m;
  List<num>? windspeed10m;
  List<num>? pressureMsl;

  Hourly(
      {this.time,
        this.temperature2m,
        this.weathercode,
        this.relativehumidity2m,
        this.windspeed10m,
        this.pressureMsl});

  Hourly.fromJson(Map<String, dynamic> json) {
    time = json['time'].cast<String>();
    temperature2m = json['temperature_2m'].cast<num>();
    weathercode = json['weathercode'].cast<num>();
    relativehumidity2m = json['relativehumidity_2m'].cast<num>();
    windspeed10m = json['windspeed_10m'].cast<num>();
    pressureMsl = json['pressure_msl'].cast<num>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['temperature_2m'] = temperature2m;
    data['weathercode'] = weathercode;
    data['relativehumidity_2m'] = relativehumidity2m;
    data['windspeed_10m'] = windspeed10m;
    data['pressure_msl'] = pressureMsl;
    return data;
  }
}