import 'package:flutter/material.dart';
import 'package:flutter_clone2/app_1/home_screen1/list_tile.dart';

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
      backgroundColor: Color.fromRGBO(33, 161, 216, 1),
      child: Column(
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

          // sign out list tile
          MyListTile(
            icon: Icons.logout,
            text: 'S i g n O u t',
            onTap: onSignOut,
          ),
        ],
      ),
    );
  }
}
