import 'package:flutter/material.dart';
import 'package:flutter_clone2/all_data_city/home_list_city.dart';
import 'package:flutter_clone2/firebase_login/auth/auth_service.dart';
import 'package:flutter_clone2/home_screen/drawer.dart';
import 'package:flutter_clone2/home_screen/profile_page.dart';
import 'package:flutter_clone2/weather_city/weather_all.dart';

class HomeScreenFirebase extends StatelessWidget {
  HomeScreenFirebase({super.key});

  final List<Map<String, String>> _citiesData = citiesData;

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
              'cities in Indonesia',
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
                      child: CityCard(
                        cityName: cityData['name']!,
                        imagePath:
                            cityData['image'] ??
                            'assets/images/default_city.jpg',
                      ),
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
  final String imagePath;

  const CityCard({super.key, required this.cityName, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: const Color(0xff778da9),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: <Widget>[
          const Icon(Icons.location_on, color: Colors.white),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  cityName,
                  style: const TextStyle(fontSize: 18.0, color: Colors.white),
                ),
                Text(
                  'Republic of Indonesia',
                  style: TextStyle(fontSize: 14.0, color: Colors.grey[300]),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              imagePath,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.image_not_supported,
                  size: 50,
                  color: Colors.white,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
