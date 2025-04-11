import 'package:flutter/material.dart';
import 'package:flutter_clone2/firebase_login/auth/login_screen.dart';

import 'package:flutter_clone2/splash_screen/pref_handler.dart';

class SplashLogoApp1 extends StatefulWidget {
  const SplashLogoApp1({super.key});

  @override
  State<SplashLogoApp1> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashLogoApp1> {
  @override
  void initState() {
    super.initState();
    getDataUser();
  }

  void getDataUser() async {
    // get data user
    var userId = await PreferenceHandler.getId();
    print(userId);
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreenFirebase()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          "assets/images/app_image1.png",

          height: MediaQuery.of(context).size.width * 5,
          width: MediaQuery.of(context).size.width * 5,
        ),
      ),
    );
  }
}
