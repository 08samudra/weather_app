import 'package:flutter/material.dart';
import 'package:flutter_clone2/api_service/api_weather_services.dart';
import 'package:flutter_clone2/api_service/weather_data.dart';
// import 'package:flutter_clone2/app_1/api_service/weather_services.dart';
import 'package:intl/intl.dart';

class WeatherDetailScreen extends StatefulWidget {
  final String cityName;
  final String latitude;
  final String longitude;

  const WeatherDetailScreen({
    super.key,
    required this.cityName,
    required this.latitude,
    required this.longitude,
  });

  @override
  State<WeatherDetailScreen> createState() => _WeatherDetailScreenState();
}

class _WeatherDetailScreenState extends State<WeatherDetailScreen> {
  final WeatherServices _weatherService = WeatherServices();
  WeatherDataApp? _weatherData;
  bool _isLoading = false;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchWeatherData();
  }

  Future<void> _fetchWeatherData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });
    try {
      final weather = await _weatherService.fetchWeather(
        widget.latitude,
        widget.longitude,
      );
      setState(() {
        _weatherData = weather;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
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
        return "assets/images/cloudy.png";
    }
  }

  Widget weatherInfoCard({required String title, required String value}) {
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

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('EEEE d MMMM').format(DateTime.now());
    String formattedTime = DateFormat('hh:mm a').format(DateTime.now());
    String weatherCondition =
        _weatherData?.weather.isNotEmpty == true
            ? _weatherData!.weather[0].main
            : 'Clouds';
    String imagePath = getWeatherImagePath(weatherCondition);

    return Scaffold(
      backgroundColor: const Color(0xff778da9),
      appBar: AppBar(
        title: Text('Weather in ${widget.cityName}'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 2));
          return _fetchWeatherData();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(15, 45, 15, 10),
          child: Center(
            child:
                _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : _errorMessage.isNotEmpty
                    ? Text(
                      'Error: $_errorMessage',
                      style: const TextStyle(color: Colors.white),
                    )
                    : _weatherData != null
                    ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _weatherData!.name,
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${_weatherData!.temperature.current.toStringAsFixed(2)}°C",
                          style: const TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (_weatherData!.weather.isNotEmpty)
                          Text(
                            _weatherData!.weather[0].main,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        const SizedBox(height: 10),
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
                        const SizedBox(height: 5),
                        Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(imagePath),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          height: 250,
                          decoration: BoxDecoration(
                            color: const Color(0xff415a77),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 30,
                              horizontal: 10,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.wind_power,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(height: 5),
                                        weatherInfoCard(
                                          title: "Wind",
                                          value:
                                              "${_weatherData!.wind.speed}km/h",
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.trending_up,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(height: 5),
                                        weatherInfoCard(
                                          title: "Max",
                                          value:
                                              "${_weatherData!.maxTemperature.toStringAsFixed(2)}°C",
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.trending_down,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(height: 5),
                                        weatherInfoCard(
                                          title: "Min",
                                          value:
                                              "${_weatherData!.minTemperature.toStringAsFixed(2)}°C",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Divider(color: Colors.white30),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.water_drop,
                                          color: Colors.amber,
                                        ),
                                        const SizedBox(height: 5),
                                        weatherInfoCard(
                                          title: "Humidity",
                                          value: "${_weatherData!.humidity}%",
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.air,
                                          color: Colors.amber,
                                        ),
                                        const SizedBox(height: 5),
                                        weatherInfoCard(
                                          title: "Pressure",
                                          value: "${_weatherData!.pressure}hPa",
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.leaderboard,
                                          color: Colors.amber,
                                        ),
                                        const SizedBox(height: 5),
                                        weatherInfoCard(
                                          title: "Sea-Level",
                                          value: "${_weatherData!.seaLavel}m",
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
                    )
                    : const Text(
                      'No weather data available.',
                      style: TextStyle(color: Colors.white),
                    ),
          ),
        ),
      ),
    );
  }
}
