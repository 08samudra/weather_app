import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_clone2/api_service/weather_data.dart';
import 'package:http/http.dart' as http;

class WeatherServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<WeatherDataApp> fetchWeather(String lat, String lon) async {
    final response = await http.get(
      Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=583a574acc2de26c2cc56061db8d8544",
      ),
    );

    try {
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        WeatherDataApp weatherData = WeatherDataApp.fromJson(json);
        await _saveWeatherDataToFirestore(weatherData);
        return weatherData;
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<void> _saveWeatherDataToFirestore(WeatherDataApp weatherData) async {
    try {
      await _firestore.collection('weather').doc(weatherData.name).set({
        'name': weatherData.name,
        'temperature': weatherData.temperature.current,
        'humidity': weatherData.humidity,
        'windSpeed': weatherData.wind.speed,
        'maxTemperature': weatherData.maxTemperature,
        'minTemperature': weatherData.minTemperature,
        'pressure': weatherData.pressure,
        'seaLevel': weatherData.seaLavel,
        'weather':
            weatherData.weather
                .map((weather) => {'main': weather.main})
                .toList(),
      });
      print('Data cuaca berhasil disimpan ke Firestore.');
    } catch (e) {
      print('Error menyimpan data cuaca ke Firestore: $e');
    }
  }
}
