import 'package:flutter/material.dart';
// import 'package:flutter_clone2/app_contact/03-11_splashlogo.dart';
import 'package:flutter_clone2/app_weather_api/13-03_weather_home.dart';
// import 'package:flutter_clone2/app_note/11-03_noteHome.dart';
// import 'package:flutter_clone2/app_quiz/03-07_splash_logo.dart';
// import 'package:flutter_clone2/02-28_login1.dart';
// import 'package:flutter_clone2/03-04_test.dart';
// import 'package:flutter_clone2/03-06_splashscreen.dart';
// import 'package:flutter_clone2/03-07_splash_logo.dart';
// import 'package:flutter_clone2/app_quiz/03-10_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: SplashLogoContact(), //app_contact
      // home: SplashLogo(), //app_quiz
      // home: NoteHome(),
      home: WeatherHome(),
    );
  }
}
