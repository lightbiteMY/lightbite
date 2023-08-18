import 'package:flutter/material.dart';
import 'package:lightbite/template/home_template.dart';
import 'package:flutter/foundation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return HomeTemplate(
      title: widget.title,
    );
  }
}
