import 'package:flutter/material.dart';
import 'package:ifood/service/auth/auth_service.dart';
import 'package:ifood/screens/about_screen.dart';
import 'package:ifood/screens/settings_screen.dart';
import 'package:ifood/widgets/drawer_tile.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  void logout() {
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Icon(Icons.fastfood_rounded,
                size: 64, color: Theme.of(context).colorScheme.inversePrimary),
          ),
          DrawerTile(
            title: 'HOME',
            leading: Icons.home_rounded,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          DrawerTile(
            title: 'SETTINGS',
            leading: Icons.settings_rounded,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
          ),
          DrawerTile(
            title: 'ABOUT',
            leading: Icons.info_outline_rounded,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutScreen(),
                ),
              );
            },
          ),
          DrawerTile(
            title: 'LOGOUT',
            leading: Icons.logout_rounded,
            onTap: () {
              logout();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
