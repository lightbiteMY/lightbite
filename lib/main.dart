import 'package:flutter/material.dart';
import 'package:lightbite/navigation/bottom_navbar.dart';
import 'package:lightbite/providers/notification_list_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String title = 'LightBite';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: SafeArea(
        child: ChangeNotifierProvider(
          create: (context) => NotificationListProvider(),
          child: BottomNavBar(
            title: title,
          ),
        ),
      ),
      debugShowCheckedModeBanner: true,
    );
  }
}
