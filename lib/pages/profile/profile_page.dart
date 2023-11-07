import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            CircleAvatar(
              child: Icon(Icons.settings),
            ),
            CircleAvatar(
              child: Text('A'),
            )
          ],
        ),
        SizedBox(
          height: 500,
          child: Column(
            children: const [
              ListTile(
                title: Text('Settings'),
              ),
              ListTile(
                title: Text('History'),
              )
            ],
          ),
        ),
      ],
    );
  }
}
