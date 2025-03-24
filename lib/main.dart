import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone2/app_1/splash_screen1/splash_app1.dart';
import 'package:flutter_clone2/app_1/app_login_firebase/auth/login_screen.dart';
import 'package:flutter_clone2/app_1/home_screen1/homescreen.dart';
// import 'package:flutter_clone2/app_weather_api/13-03_weather_home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

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
      // home: WeatherHome(),
      // home: LoginScreenFirebase(),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashLogoApp1(),
        '/login': (context) => const LoginScreenFirebase(),
        '/home': (context) => const HomeScreenFirebase(),
      },
    );
  }
}
