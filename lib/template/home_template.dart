import 'package:flutter/material.dart';

class HomeTemplate extends StatelessWidget {
  const HomeTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(230, 230, 230, 1),
      body: Container(
          margin: const EdgeInsets.all(10), decoration: const BoxDecoration()),
    );
  }
}
