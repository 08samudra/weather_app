import 'package:flutter/material.dart';
import 'package:flutter_clone2/app_1/home_screen1/drawer.dart';
import 'package:flutter_clone2/app_1/app_login_firebase/auth/auth_service.dart';
import 'package:flutter_clone2/app_1/home_screen1/profile_page.dart';

class HomeScreenFirebase extends StatelessWidget {
  const HomeScreenFirebase({super.key});

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
      appBar: AppBar(title: const Text("Home")),
      drawer: MyDrawer(
        onProfileTap: goToProfilePage,
        onSignOut: () => authService.signout(context),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          top: 16.0,
          right: 16.0,
        ), // Sesuaikan padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align text to start
          children: <Widget>[
            const Text(
              'List of',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Cities',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            CityCard(cityName: 'Jakarta'),
            const SizedBox(height: 10),
            CityCard(cityName: 'Bandung'),
            const SizedBox(height: 10),
            CityCard(cityName: 'Surabaya'),
          ],
        ),
      ),
    );
  }
}

class CityCard extends StatelessWidget {
  final String cityName;

  const CityCard({required this.cityName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[300],
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
