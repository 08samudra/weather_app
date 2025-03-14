// import 'package:flutter/material.dart';
// import 'package:flutter_clone2/Service/13-03_service.dart';
// import 'package:flutter_clone2/app_weather_api/13-03_weather_home.dart';
// import 'package:flutter_clone2/app_weather_api/14-03_weather_data.dart';
// import 'package:intl/intl.dart';

// class CuacaHome extends StatefulWidget {
//   const CuacaHome({super.key});

//   @override
//   State<CuacaHome> createStatte() => _CuacaHomeState();
// }

// class _CuacaHomeState extends State<CuacaHome> {
//   late CuacaHome weatherInfo;
//   bool isLoading = false;
//   myWeather() {
//     isLoading = false;
//     WeatherServices().fetchWeather().then((value) {
//       setState(() {
//         weatherInfo = value;
//         isLoading = true;
//       });
//     });
//   }

//   @override
//   void initState() {
//     weatherInfo = WeatherData(
//       name: '',
//       temperature: Temperature(current: 0.0),
//       humidity: 0,
//       wind: Wind(speed: 0.0),
//       maxTemperature: 0,
//       minTemperature: 0,
//       pressure: 0,
//       seaLavel: 0,
//       weather: [],
//     );
//     myWeather();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     String formatteDate = DateFormat('EEEE d MMMM yyyy').format(DateTime.now());
//     String formattedTime = DateFormat('hh:mm a').format(DateTime.now());
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 35, 42, 240),
//       body: Padding(
//         padding: const EdgeInsets.all(15),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Center(
//               child:
//                   isLoading
//                       ? WeatherDetail(
//                         weather: weatherInfo,
//                         formattedDate: formatteDate,
//                         formattedTime: formattedTime,
//                       )
//                       : const CircularProgressIndicator(color: Colors.white),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
