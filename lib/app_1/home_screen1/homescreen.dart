import 'package:flutter/material.dart';
import 'package:flutter_clone2/app_1/home_screen1/drawer.dart';
import 'package:flutter_clone2/app_1/app_login_firebase/auth/auth_service.dart';
import 'package:flutter_clone2/app_1/home_screen1/profile_page.dart';

class HomeScreenFirebase extends StatelessWidget {
  const HomeScreenFirebase({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();

    void goToProfilePage() {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      drawer: MyDrawer(
        onProfileTap: goToProfilePage,
        onSignOut:
            () => authService.signout(context), // Pindahkan Sign Out ke Drawer
      ),
      body: const Center(
        child: Text("Welcome to Home!", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
