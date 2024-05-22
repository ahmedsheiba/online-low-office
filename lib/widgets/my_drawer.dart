import 'package:flutter/material.dart';
import 'package:low_office/Screens/log_in.dart';
import 'package:low_office/Screens/profile.dart';
import 'package:low_office/Screens/setting.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: ListView(
        children: [
          const DrawerHeader(
            child: Image(
              image: AssetImage('assets/manicon.png'),
            ),
          ),
          ListTile(
              leading: const Icon(Icons.person, color: Colors.white),
              title: const Text(
                'My Profile',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfilePage(),
                  ),
                );
              }),
          ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              title: const Text(
                'Setting',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingPage(),
                  ),
                );
              }),
          ListTile(
              leading: const Icon(Icons.logout, color: Colors.white),
              title: const Text(
                'Log out',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LogInScreen(),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
