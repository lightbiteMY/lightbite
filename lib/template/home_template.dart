import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:lightbite/page/home_page.dart';

class HomeTemplate extends StatelessWidget {
  const HomeTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(230, 230, 230, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(230, 230, 230, 1),
        leading: Container(
          child: IconButton(
            icon: const CircleAvatar(child: Text('A')),
            onPressed: null,
          ),
        ),
        actions: [],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have clicked the button this many times:',
            ),
            Text(
              '1',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
