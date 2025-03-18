import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_clone2/app_login_firebase/auth/auth_service.dart';
import 'package:flutter_clone2/app_login_firebase/auth/signup_screen.dart';
import 'package:flutter_clone2/app_login_firebase/widgets/button.dart';
import 'package:flutter_clone2/app_login_firebase/widgets/homescreen.dart';
import 'package:flutter_clone2/app_login_firebase/widgets/textfield.dart';
import 'package:flutter_clone2/app_weather_api/13-03_weather_home.dart';

class LoginScreenFirebase extends StatefulWidget {
  const LoginScreenFirebase({super.key});

  @override
  State<LoginScreenFirebase> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreenFirebase> {
  final _auth = AuthService();

  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const Spacer(),
            const Text(
              "Login",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 50),
            CustomTextField(
              hint: "Enter Email",
              label: "Email",
              controller: _email,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              hint: "Enter Password",
              label: "Password",
              isPassword: true,
              controller: _password,
            ),
            const SizedBox(height: 30),
            CustomButton(label: "Login", onPressed: _login),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account? "),
                InkWell(
                  onTap: () => goToSignup(context),
                  child: const Text(
                    "Signup",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  goToSignup(BuildContext context) => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const SignupScreen()),
  );

  goToHome(BuildContext context) => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => WeatherHome()),
  );

  _login() async {
    final user = await _auth.loginUserWithEmailAndPassword(
      _email.text,
      _password.text,
    );

    if (user != null) {
      log("User Logged In");
      goToHome(context);
    }
  }
}
