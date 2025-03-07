import 'package:flutter/material.dart';
import 'package:flutter_clone2/02-28_login1.dart';
import 'package:flutter_clone2/03-06_splashscreen.dart';
import 'package:flutter_clone2/service/pref_handler.dart';

class SplashLogo extends StatefulWidget {
  const SplashLogo({super.key});

  @override
  State<SplashLogo> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashLogo> {
  @override
  void initState() {
    super.initState();
    getDataUser();
  }

  void getDataUser() async {
    // get data user
    var userId = await PreferenceHandler.getId();
    print(userId);
    Future.delayed(Duration(seconds: 2), () {
      if (userId != '') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(email: "", phone: ""),
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WelcomeScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          "assets/images/logo1.png",

          height: MediaQuery.of(context).size.width * 0.5,
          width: MediaQuery.of(context).size.width * 0.5,
        ),
      ),
    );
  }
}
