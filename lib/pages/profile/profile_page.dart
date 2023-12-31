import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String username;
  final String email;
  final String version;
  final String phoneNo;
  const ProfilePage({
    super.key,
    required this.username,
    required this.email,
    required this.version,
    required this.phoneNo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          username,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          email,
          style: const TextStyle(fontSize: 16),
        ),
        Text(
          phoneNo,
        ),
        const Spacer(),
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
