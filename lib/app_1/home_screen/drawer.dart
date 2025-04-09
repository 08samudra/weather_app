import 'package:flutter/material.dart';
import 'package:flutter_clone2/app_1/firebase_login/widgets/list_tile.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? onProfileTap;
  final void Function()? onSignOut;
  const MyDrawer({
    super.key,
    required this.onProfileTap,
    required this.onSignOut,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0XFF778da9),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Icon(Icons.person, color: Colors.white, size: 64),
              ),

              //home list tile
              MyListTile(
                icon: Icons.home,
                text: 'H o m e',
                onTap: () => Navigator.pop(context),
              ),

              //profile list tile
              MyListTile(
                icon: Icons.person,
                text: 'P r o f i l e',
                onTap: onProfileTap,
              ),
            ],
          ),

          // sign out list tile
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              icon: Icons.logout,
              text: 'L o g o u t',
              onTap: onSignOut,
            ),
          ),
        ],
      ),
    );
  }
}
