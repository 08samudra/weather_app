import 'package:flutter/material.dart';
import 'package:flutter_clone2/app_contact/03-10_home.dart';
// import 'package:flutter_clone2/app_quiz/02-28_login1.dart';
// import 'package:flutter_clone2/app_quiz/03-06_splashscreen.dart';
import 'package:flutter_clone2/service/pref_handler.dart';

class SplashLogoContact extends StatefulWidget {
  const SplashLogoContact({super.key});

  @override
  State<SplashLogoContact> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashLogoContact> {
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
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          "assets/images/phone-book.png",

          height: MediaQuery.of(context).size.width * 0.5,
          width: MediaQuery.of(context).size.width * 0.5,
        ),
      ),
    );
  }
}
