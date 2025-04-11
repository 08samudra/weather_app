import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_clone2/splash_screen/splash_app1.dart';
import 'package:flutter_clone2/firebase_login/auth/login_screen.dart';
import 'package:flutter_clone2/home_screen/homescreen.dart';
import 'package:flutter_clone2/splash_screen/splash_app1.dart';

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

      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashLogoApp1(),
        '/login': (context) => const LoginScreenFirebase(),
        '/home': (context) => const HomeScreenFirebase(),
      },
    );
  }
}
