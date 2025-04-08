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
        child: SingleChildScrollView(
          // Tambahkan SingleChildScrollView di sini
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
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeatherAmbon()),
                  );
                },
                child: CityCard(cityName: 'Ambon'),
              ),
              ////////////////////////////////////////////////////////////////////
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeatherAceh()),
                  );
                },
                child: CityCard(cityName: 'Banda Aceh'),
              ),
              ////////////////////////////////////////////////////////////////////
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeatherLampung()),
                  );
                },
                child: CityCard(cityName: 'Bandar Lampung'),
              ),
              ////////////////////////////////////////////////////////////////////
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeatherBandung()),
                  );
                },
                child: CityCard(cityName: 'Bandung'),
              ),
              ////////////////////////////////////////////////////////////////////
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WeatherBanjarbaru(),
                    ),
                  );
                },
                child: CityCard(cityName: 'Banjarbaru'),
              ),
              ////////////////////////////////////////////////////////////////////
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeatherBengkulu()),
                  );
                },
                child: CityCard(cityName: 'Bengkulu'),
              ),
              ////////////////////////////////////////////////////////////////////
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeatherDenpasar()),
                  );
                },
                child: CityCard(cityName: 'Denpasar'),
              ),
              ////////////////////////////////////////////////////////////////////
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeatherGorontalo()),
                  );
                },
                child: CityCard(cityName: 'Gorontalo'),
              ),
              ////////////////////////////////////////////////////////////////////
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WeatherJakarta(),
                    ), // Menggunakan halaman cuaca Anda
                  );
                },
                child: CityCard(cityName: 'Jakarta'),
              ),
              ////////////////////////////////////////////////////////////////////
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeatherJambi()),
                  );
                },
                child: CityCard(cityName: 'Jambi'),
              ),
              ////////////////////////////////////////////////////////////////////
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeatherJayapura()),
                  );
                },
                child: CityCard(cityName: 'Jayapura'),
              ),
              ////////////////////////////////////////////////////////////////////
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WeatherJayawijaya(),
                    ),
                  );
                },
                child: CityCard(cityName: 'Jayawijaya'),
              ),
              ////////////////////////////////////////////////////////////////////
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeatherKendari()),
                  );
                },
                child: CityCard(cityName: 'Kendari'),
              ),
              ////////////////////////////////////////////////////////////////////
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeatherKuningan()),
                  );
                },
                child: CityCard(cityName: 'Kuningan'),
              ),
              ////////////////////////////////////////////////////////////////////
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeatherKupang()),
                  );
                },
                child: CityCard(cityName: 'Kupang'),
              ),
              ////////////////////////////////////////////////////////////////////
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeatherMakassar()),
                  );
                },
                child: CityCard(cityName: 'Makassar'),
              ),
              ////////////////////////////////////////////////////////////////////
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeatherMamuju()),
                  );
                },
                child: CityCard(cityName: 'Mamuju'),
              ),
              ////////////////////////////////////////////////////////////////////
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeatherManado()),
                  );
                },
                child: CityCard(cityName: 'Manado'),
              ),
              ////////////////////////////////////////////////////////////////////
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeatherManokwari()),
                  );
                },
                child: CityCard(cityName: 'Manokwari'),
              ),
              ////////////////////////////////////////////////////////////////////
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeatherMataram()),
                  );
                },
                child: CityCard(cityName: 'Mataram'),
              ),
              ////////////////////////////////////////////////////////////////////
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeatherMedan()),
                  );
                },
                child: CityCard(cityName: 'Medan'),
              ),
              ////////////////////////////////////////////////////////////////////
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeatherPadang()),
                  );
                },
                child: CityCard(cityName: 'Padang'),
              ),
              ////////////////////////////////////////////////////////////////////
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WeatherPalangkaRaya(),
                    ),
                  );
                },
                child: CityCard(cityName: 'Palangka Raya'),
              ),
              ////////////////////////////////////////////////////////////////////
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeatherPalembang()),
                  );
                },
                child: CityCard(cityName: 'Palembang'),
              ),
              ////////////////////////////////////////////////////////////////////
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WeatherPangkalPinang(),
                    ),
                  );
                },
                child: CityCard(cityName: 'Pangkal Pinang'),
              ),
              ////////////////////////////////////////////////////////////////////
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeatherPekanbaru()),
                  );
                },
                child: CityCard(cityName: 'Pekanbaru'),
              ),
              ////////////////////////////////////////////////////////////////////
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeatherPontianak()),
                  );
                },
                child: CityCard(cityName: 'Pontianak'),
              ),
              ////////////////////////////////////////////////////////////////////
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeatherSalor()),
                  );
                },
                child: CityCard(cityName: 'Salor'),
              ),
              ////////////////////////////////////////////////////////////////////
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeatherSamarinda()),
                  );
                },
                child: CityCard(cityName: 'Samarinda'),
              ),
              ////////////////////////////////////////////////////////////////////
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeatherSemarang()),
                  );
                },
                child: CityCard(cityName: 'Semarang'),
              ),
              ////////////////////////////////////////////////////////////////////
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeatherSerang()),
                  );
                },
                child: CityCard(cityName: 'Serang'),
              ),
              ////////////////////////////////////////////////////////////////////
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeatherSofifi()),
                  );
                },
                child: CityCard(cityName: 'Sofifi'),
              ),
              ////////////////////////////////////////////////////////////////////
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeatherSorong()),
                  );
                },
                child: CityCard(cityName: 'Sorong'),
              ),
              ////////////////////////////////////////////////////////////////////
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeatherSurabaya()),
                  );
                },
                child: CityCard(cityName: 'Surabaya'),
              ),
              ////////////////////////////////////////////////////////////////////
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeatherSurabaya()),
                  );
                },
                child: CityCard(cityName: 'Surabaya'),
              ),
              ////////////////////////////////////////////////////////////////////
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeatherSurabaya()),
                  );
                },
                child: CityCard(cityName: 'Surabaya'),
              ),
              ////////////////////////////////////////////////////////////////////
            ],
          ),
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
