import 'package:http/http.dart' as http;

class WeatherService {
  fetchWeather() async {
    final respone = await http.get(
      Uri.parse(
      "https://api.openweathermap.org/data/2.5/weather?lat=-6.200000&lon=106.816666&appid=583a574acc2de26c2cc56061db8d8544"),
      try {
        if(respone.statusCode == 200){
          var json = jsonDecode(respone.body);
          return WeatherData.fromJson(json);
        }
      } catch (e) {
        print(e.toString());
      }
    );
  }
}
