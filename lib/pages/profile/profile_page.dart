import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Text('John Doe'),
        ),
        SizedBox(
            width: double.infinity,
            height: 500,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
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
            )),
      ],
    );
  }
}
