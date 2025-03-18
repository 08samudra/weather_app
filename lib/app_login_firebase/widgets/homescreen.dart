import 'package:flutter/material.dart';
import 'package:flutter_clone2/app_login_firebase/auth/auth_service.dart';
import 'package:flutter_clone2/app_login_firebase/auth/login_screen.dart';
import 'package:flutter_clone2/app_login_firebase/widgets/button.dart';

class HomeScreenFirebase extends StatelessWidget {
  const HomeScreenFirebase({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome User",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 20),
            CustomButton(
              label: "Sign Out",
              onPressed: () async {
                await auth.signout();
                goToLogin(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  goToLogin(BuildContext context) => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const LoginScreenFirebase()),
  );
}
