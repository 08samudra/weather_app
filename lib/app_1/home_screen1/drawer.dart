import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromRGBO(33, 161, 216, 1),
      child: Column(
        children: [
          DrawerHeader(
            child: Icon(Icons.person, color: Colors.white, size: 64),
          ),
        ],
      ),
    );
  }
}
