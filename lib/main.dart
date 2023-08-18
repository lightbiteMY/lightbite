import 'package:flutter/material.dart';
import 'package:lightbite/navigation/bottom_navbar.dart';
import 'package:lightbite/page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String titleText = 'LightBite';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: titleText,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: const BottomNavBar(),
      routes: {
        '/home': (context) => HomePage(title: titleText),
        // '/notification': (context) =>
        // '/profile': (context) =>
      },
      debugShowCheckedModeBanner: true,
    );
  }
}
