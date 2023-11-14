import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String username;
  final String email;
  final String version;
  const ProfilePage({
    super.key,
    required this.username,
    required this.email,
    required this.version,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(username),
        Text(email),
        const Divider(),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Account'),
                  trailing: Icon(Icons.chevron_right),
                ),
                const ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  trailing: Icon(Icons.chevron_right),
                ),
                const ListTile(
                  leading: Icon(Icons.history),
                  title: Text('Order History'),
                  trailing: Icon(Icons.chevron_right),
                ),
                const ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Sign Out'),
                ),
                Text('Version: v$version'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
