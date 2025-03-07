import 'package:flutter/material.dart';
// import 'package:flutter_clone2/02-28_login1.dart';
// import 'package:flutter_clone2/03-04_test.dart';
import 'package:flutter_clone2/03-06_splashscreen.dart';
import 'package:flutter_clone2/03-07_splash_logo.dart';
// import 'package:ppkd_b_1/views/auth/login_screen.dart';
// import 'package:ppkd_b_1/views/main/homepage.dart';
// import 'package:ppkd_b_1/views/main/main_screen.dart';
// import 'package:ppkd_b_1/views/auth/login_screen.dart';

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
      // home: LoginScreen(),
      // home: testfigma(),
      home: SplashLogo(),
    );
  }
}
