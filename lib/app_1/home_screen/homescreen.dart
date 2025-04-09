import 'package:flutter/material.dart';
import 'package:flutter_clone2/app_1/weather_city/weather_ambon.dart';
import 'package:flutter_clone2/app_1/weather_city/weather_banda_aceh.dart';
import 'package:flutter_clone2/app_1/weather_city/weather_bandar_lampung.dart';
import 'package:flutter_clone2/app_1/weather_city/weather_bandung.dart';
import 'package:flutter_clone2/app_1/weather_city/weather_banjarbaru.dart';
import 'package:flutter_clone2/app_1/weather_city/weather_bengkulu.dart';
import 'package:flutter_clone2/app_1/weather_city/weather_denpasar.dart';
import 'package:flutter_clone2/app_1/weather_city/weather_gorontalo.dart';
import 'package:flutter_clone2/app_1/weather_city/weather_jakarta.dart';
import 'package:flutter_clone2/app_1/home_screen/drawer.dart';
import 'package:flutter_clone2/app_1/firebase_login/auth/auth_service.dart';
import 'package:flutter_clone2/app_1/home_screen/profile_page.dart';
import 'package:flutter_clone2/app_1/weather_city/weather_jambi.dart';
import 'package:flutter_clone2/app_1/weather_city/weather_jayapura.dart';
import 'package:flutter_clone2/app_1/weather_city/weather_jayawijaya.dart';
import 'package:flutter_clone2/app_1/weather_city/weather_kendari.dart';
import 'package:flutter_clone2/app_1/weather_city/weather_kuningan.dart';
import 'package:flutter_clone2/app_1/weather_city/weather_kupang.dart';
import 'package:flutter_clone2/app_1/weather_city/weather_makassar.dart';
import 'package:flutter_clone2/app_1/weather_city/weather_mamuju.dart';
import 'package:flutter_clone2/app_1/weather_city/weather_manado.dart';
import 'package:flutter_clone2/app_1/weather_city/weather_manokwari.dart';
import 'package:flutter_clone2/app_1/weather_city/weather_mataram.dart';
import 'package:flutter_clone2/app_1/weather_city/weather_medan.dart';
import 'package:flutter_clone2/app_1/weather_city/weather_padang.dart';
import 'package:flutter_clone2/app_1/weather_city/weather_palangka_raya.dart';
import 'package:flutter_clone2/app_1/weather_city/weather_palembang.dart';
import 'package:flutter_clone2/app_1/weather_city/weather_pangkal_pinang.dart';
import 'package:flutter_clone2/app_1/weather_city/weather_pekanbaru.dart';
import 'package:flutter_clone2/app_1/weather_city/weather_pontianak.dart';
import 'package:flutter_clone2/app_1/weather_city/weather_salor.dart';
import 'package:flutter_clone2/app_1/weather_city/weather_samarinda.dart';
import 'package:flutter_clone2/app_1/weather_city/weather_semarang.dart';
import 'package:flutter_clone2/app_1/weather_city/weather_serang.dart';
import 'package:flutter_clone2/app_1/weather_city/weather_sofifi.dart';
import 'package:flutter_clone2/app_1/weather_city/weather_sorong.dart';
import 'package:flutter_clone2/app_1/weather_city/weather_surabaya.dart'; // Import halaman cuaca Anda

class HomeScreenFirebase extends StatelessWidget {
  const HomeScreenFirebase({super.key});

  final List<Map<String, dynamic>> _cities = const [
    {'name': 'Ambon', 'widget': WeatherAmbon()},
    {'name': 'Banda Aceh', 'widget': WeatherAceh()},
    {'name': 'Bandar Lampung', 'widget': WeatherLampung()},
    {'name': 'Bandung', 'widget': WeatherBandung()},
    {'name': 'Banjarbaru', 'widget': WeatherBanjarbaru()},
    {'name': 'Bengkulu', 'widget': WeatherBengkulu()},
    {'name': 'Denpasar', 'widget': WeatherDenpasar()},
    {'name': 'Gorontalo', 'widget': WeatherGorontalo()},
    {'name': 'Jakarta', 'widget': WeatherJakarta()},
    {'name': 'Jambi', 'widget': WeatherJambi()},
    {'name': 'Jayapura', 'widget': WeatherJayapura()},
    {'name': 'Jayawijaya', 'widget': WeatherJayawijaya()},
    {'name': 'Kendari', 'widget': WeatherKendari()},
    {'name': 'Kuningan', 'widget': WeatherKuningan()},
    {'name': 'Kupang', 'widget': WeatherKupang()},
    {'name': 'Makassar', 'widget': WeatherMakassar()},
    {'name': 'Mamuju', 'widget': WeatherMamuju()},
    {'name': 'Manado', 'widget': WeatherManado()},
    {'name': 'Manokwari', 'widget': WeatherManokwari()},
    {'name': 'Mataram', 'widget': WeatherMataram()},
    {'name': 'Medan', 'widget': WeatherMedan()},
    {'name': 'Padang', 'widget': WeatherPadang()},
    {'name': 'Palangka Raya', 'widget': WeatherPalangkaRaya()},
    {'name': 'Palembang', 'widget': WeatherPalembang()},
    {'name': 'Pangkal Pinang', 'widget': WeatherPangkalPinang()},
    {'name': 'Pekanbaru', 'widget': WeatherPekanbaru()},
    {'name': 'Pontianak', 'widget': WeatherPontianak()},
    {'name': 'Salor', 'widget': WeatherSalor()},
    {'name': 'Samarinda', 'widget': WeatherSamarinda()},
    {'name': 'Semarang', 'widget': WeatherSemarang()},
    {'name': 'Serang', 'widget': WeatherSerang()},
    {'name': 'Sofifi', 'widget': WeatherSofifi()},
    {'name': 'Sorong', 'widget': WeatherSorong()},
    {'name': 'Surabaya', 'widget': WeatherSurabaya()},
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
                itemCount: _cities.length,
                itemBuilder: (context, index) {
                  final city = _cities[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => city['widget'],
                          ),
                        );
                      },
                      child: CityCard(cityName: city['name']),
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

  const CityCard({required this.cityName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xffe0e1dd),
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
