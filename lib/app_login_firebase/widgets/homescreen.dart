import 'package:flutter/material.dart';
import 'package:flutter_clone2/app_login_firebase/auth/auth_service.dart';

class HomeScreenFirebase extends StatelessWidget {
  const HomeScreenFirebase({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            onPressed: () => authService.signout(context),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: const Center(
        child: Text("Welcome to Home!", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
