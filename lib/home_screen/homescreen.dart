import 'package:flutter/material.dart';
import 'package:flutter_clone2/firebase_login/auth/auth_service.dart';
import 'package:flutter_clone2/home_screen/drawer.dart';
import 'package:flutter_clone2/home_screen/profile_page.dart';
import 'package:flutter_clone2/weather_city/weather_all.dart';

class HomeScreenFirebase extends StatelessWidget {
  const HomeScreenFirebase({super.key});

  final List<Map<String, String>> _citiesData = const [
    {'name': 'Ambon', 'lat': '-3.6967', 'lon': '128.1783'},
    {'name': 'Banda Aceh', 'lat': '5.5577', 'lon': '95.3222'},
    {'name': 'Bandar Lampung', 'lat': '-5.429400', 'lon': '105.262500'},
    {'name': 'Bandung', 'lat': '-6.9147', 'lon': '107.6098'},
    {'name': 'Banjarbaru', 'lat': '-3.438903', 'lon': '114.830881'},
    {'name': 'Bengkulu', 'lat': '-3.8000', 'lon': '102.2667'},
    {'name': 'Denpasar', 'lat': '-8.6500', 'lon': '115.2167'},
    {'name': 'Gorontalo', 'lat': '0.5412', 'lon': '123.0597'},
    {'name': 'Jakarta', 'lat': '-6.2088', 'lon': '106.8456'},
    {'name': 'Jambi', 'lat': '-1.6000', 'lon': '103.6000'},
    {'name': 'Jayapura', 'lat': '-2.5333', 'lon': '140.7167'},
    {'name': 'Jayawijaya', 'lat': '-4.0000', 'lon': '139.0000'},
    {'name': 'Kendari', 'lat': '-3.9667', 'lon': '122.5167'},
    {'name': 'Kuningan', 'lat': '-6.9756', 'lon': '108.4842'},
    {'name': 'Kupang', 'lat': '-10.1667', 'lon': '123.5667'},
    {'name': 'Makassar', 'lat': '-5.1499', 'lon': '119.4323'},
    {'name': 'Mamuju', 'lat': '-2.6667', 'lon': '118.8667'},
    {'name': 'Manado', 'lat': '1.4833', 'lon': '124.8417'},
    {'name': 'Manokwari', 'lat': '-0.8667', 'lon': '134.0833'},
    {'name': 'Mataram', 'lat': '-8.580000', 'lon': '116.120000'},
    {'name': 'Medan', 'lat': '3.5833', 'lon': '98.6667'},
    {'name': 'Padang', 'lat': '-0.9500', 'lon': '100.3500'},
    {'name': 'Palangka Raya', 'lat': '-2.2000', 'lon': '113.9167'},
    {'name': 'Palembang', 'lat': '-2.9167', 'lon': '104.7500'},
    {'name': 'Pangkalpinang', 'lat': '-2.1167', 'lon': '106.1167'},
    {'name': 'Pekanbaru', 'lat': '0.5167', 'lon': '101.4333'},
    {'name': 'Pontianak', 'lat': '-0.0333', 'lon': '109.3333'},
    {'name': 'Salor', 'lat': '-7.666670', 'lon': '139.666670'},
    {'name': 'Samarinda', 'lat': '-0.5000', 'lon': '117.1500'},
    {'name': 'Semarang', 'lat': '-6.9667', 'lon': '110.4167'},
    {'name': 'Serang', 'lat': '-6.1167', 'lon': '106.1500'},
    {'name': 'Sorong', 'lat': '-0.8833', 'lon': '131.2500'},
    {'name': 'Surabaya', 'lat': '-7.245800', 'lon': '112.737800'},
    {'name': 'Tanjung Selor', 'lat': '2.844667', 'lon': '117.364823'},
    {'name': 'Tanjungpinang', 'lat': '0.918780', 'lon': '104.455420'},
    {'name': 'Ternate', 'lat': '0.7800', 'lon': '127.9500'},
    {'name': 'Nabire', 'lat': '-3.372232', 'lon': '135.501237'},
    {'name': 'Yogyakarta', 'lat': '-7.800457', 'lon': '110.391280'},
    // Tambahkan data kota lainnya di sini
  ];

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();

    void goToProfilePage() {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Weather App")),
      drawer: MyDrawer(
        onProfileTap: goToProfilePage,
        onSignOut: () => authService.signout(context),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'List of',
              style: TextStyle(fontSize: 20, color: Colors.grey[500]),
            ),
            const Text(
              'Cities',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _citiesData.length,
                itemBuilder: (context, index) {
                  final cityData = _citiesData[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => WeatherDetailScreen(
                                  cityName: cityData['name']!,
                                  latitude: cityData['lat']!,
                                  longitude: cityData['lon']!,
                                ),
                          ),
                        );
                      },
                      child: CityCard(cityName: cityData['name']!),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CityCard extends StatelessWidget {
  final String cityName;

  const CityCard({super.key, required this.cityName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xff778da9),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: <Widget>[
          const Icon(Icons.location_on),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(cityName, style: const TextStyle(fontSize: 18.0)),
              Text(
                'Republic of Indonesia',
                style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
