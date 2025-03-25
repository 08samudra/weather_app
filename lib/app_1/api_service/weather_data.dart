class WeatherDataApp {
  final String name;
  final Temperature temperature;

  final int humidity;
  final Wind wind;
  final double maxTemperature;
  final double minTemperature;
  final int pressure;
  final int seaLavel;
  final List<WeatherInfo> weather;

  WeatherDataApp({
    required this.name,
    required this.temperature,
    required this.humidity,
    required this.wind,
    required this.maxTemperature,
    required this.minTemperature,
    required this.pressure,
    required this.seaLavel,
    required this.weather,
  });

  factory WeatherDataApp.fromJson(Map<String, dynamic> json) {
    return WeatherDataApp(
      name: json['name'],
      temperature: Temperature.fromJson(json['main']['temp']),
      humidity: json['main']['humidity'],
      wind: Wind.fromJson(json['wind']),
      maxTemperature: (json['main']['temp_max'] - 273.15),
      minTemperature: (json['main']['temp_min'] - 273.15),
      pressure: json['main']['pressure'],
      seaLavel: json['main']['sea_level'] ?? 0,
      weather: List<WeatherInfo>.from(
        json['weather'].map((weather) => WeatherInfo.fromJson(weather)),
      ),
    );
  }
}

class WeatherInfo {
  final String main;

  WeatherInfo({required this.main});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    return WeatherInfo(main: json['main']);
  }
}

class Temperature {
  final double current;

  Temperature({required this.current});

  factory Temperature.fromJson(double current) {
    return Temperature(current: current - 273.15);
  }
}

class Wind {
  final double speed;

  Wind({required this.speed});

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(speed: json['speed']);
  }
}
