import 'package:flutter/material.dart';
import 'package:flutter_clone2/app_1/api_service/pekanbaru.dart';
import 'package:flutter_clone2/app_1/api_service/weather_data.dart';
import 'package:intl/intl.dart';

class WeatherPekanbaru extends StatefulWidget {
  const WeatherPekanbaru({super.key});

  @override
  State<WeatherPekanbaru> createState() => _WeatherPekanbaruState();
}

class _WeatherPekanbaruState extends State<WeatherPekanbaru> {
  late WeatherDataApp weatherInfo;
  bool isLoading = false;

  Future<void> myWeather() async {
    setState(() {
      isLoading = false;
    });
    try {
      WeatherDataApp value = await WeatherServicesPekanbaru().fetchWeather();

      setState(() {
        weatherInfo = value;
        isLoading = true;
      });
    } catch (e) {
      print("Error fetching weather: $e");
      setState(() {
        isLoading = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load weather data: $e')),
      );
    }
  }

  @override
  void initState() {
    weatherInfo = WeatherDataApp(
      name: '',
      temperature: Temperature(current: 0.0),
      humidity: 0,
      wind: Wind(speed: 0.0),
      maxTemperature: 0,
      minTemperature: 0,
      pressure: 0,
      seaLavel: 0,
      weather: [],
    );
    myWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('EEEE d MMMM').format(DateTime.now());
    String formattedTime = DateFormat('hh:mm a').format(DateTime.now());
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 108, 170),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 2));
          return myWeather();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 55, 15, 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child:
                      isLoading
                          ? WeatherDetail(
                            weather: weatherInfo,
                            formattedDate: formattedDate,
                            formattedTime: formattedTime,
                          )
                          : const CircularProgressIndicator(
                            color: Colors.white,
                          ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String getWeatherImagePath(String weatherCondition) {
  switch (weatherCondition.toLowerCase()) {
    case 'clear':
      return "assets/images/clear.png";
    case 'clouds':
      return "assets/images/cloudy.png";
    case 'rain':
      return "assets/images/rain.png";
    case 'thunderstorm':
      return "assets/images/thunderstorm.png";
    case 'drizzle':
      return "assets/images/drizzle.png";
    case 'snow':
      return "assets/images/snow.png";
    default:
      return "assets/images/cloudy.png"; // Gambar default
  }
}

class WeatherDetail extends StatelessWidget {
  final WeatherDataApp weather;
  final String formattedDate;
  final String formattedTime;
  const WeatherDetail({
    super.key,
    required this.weather,
    required this.formattedDate,
    required this.formattedTime,
  });

  @override
  Widget build(BuildContext context) {
    String weatherCondition =
        weather.weather.isNotEmpty
            ? weather.weather[0].main
            : 'Clouds'; // Kondisi cuaca default
    String imagePath = getWeatherImagePath(weatherCondition);
    return Column(
      children: [
        // for current address name
        Text(
          weather.name,
          style: const TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        // for current temperature of my location
        Text(
          "${weather.temperature.current.toStringAsFixed(2)}°C",
          style: const TextStyle(
            fontSize: 40,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        // fpr weather condition
        if (weather.weather.isNotEmpty)
          Text(
            weather.weather[0].main,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        const SizedBox(height: 30),
        // for current date and time
        Text(
          formattedDate,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          formattedTime,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(imagePath)),
          ),
        ),
        const SizedBox(height: 30),
        // for more weather detail
        Container(
          height: 250,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 28, 119, 238),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.wind_power, color: Colors.white),
                        const SizedBox(height: 5),
                        weatherInfoCard(
                          title: "Wind",
                          value: "${weather.wind.speed}km/h",
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.trending_up, color: Colors.white),
                        const SizedBox(height: 5),
                        weatherInfoCard(
                          title: "Max",
                          value:
                              "${weather.maxTemperature.toStringAsFixed(2)}°C",
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.trending_down, color: Colors.white),
                        const SizedBox(height: 5),
                        weatherInfoCard(
                          title: "Min",
                          value:
                              "${weather.minTemperature.toStringAsFixed(2)}°C",
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.water_drop, color: Colors.amber),
                        const SizedBox(height: 5),
                        weatherInfoCard(
                          title: "Humidity",
                          value: "${weather.humidity}%",
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.air, color: Colors.amber),
                        const SizedBox(height: 5),
                        weatherInfoCard(
                          title: "Pressure",
                          value: "${weather.pressure}hPa",
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.leaderboard, color: Colors.amber),
                        const SizedBox(height: 5),
                        weatherInfoCard(
                          title: "Sea-Level",
                          value: "${weather.seaLavel}m",
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column weatherInfoCard({required String title, required String value}) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
