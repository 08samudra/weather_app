import 'package:flutter/material.dart';
import 'package:flutter_clone2/firebase_login/auth/auth_service.dart';
import 'package:flutter_clone2/firebase_login/auth/signup_screen.dart';
import 'package:flutter_clone2/firebase_login/widgets/button.dart';
import 'package:flutter_clone2/firebase_login/widgets/textfield.dart';

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
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const Spacer(),
            // Tambahkan gambar di sini
            Image.asset(
              'assets/images/thunderstorm.png', // Ganti dengan path gambar Anda
              height: 150,
              color: (Colors.black), // Sesuaikan tinggi gambar sesuai keinginan
            ),
            const SizedBox(
              height: 30,
            ), // Tambahkan sedikit ruang antara gambar dan teks
            const Text(
              "Weather",
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
            const SizedBox(height: 10),
            CustomButton2(
              label: "",
              onPressed: () => _auth.loginWithGoogle(context),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account? "),
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

  _login() async {
    final user = await _auth.loginUserWithEmailAndPassword(
      _email.text,
      _password.text,
    );

    if (user != null) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }
}
