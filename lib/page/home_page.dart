import 'package:flutter/material.dart';
import 'package:lightbite/data/restaurant.dart';
import 'package:lightbite/template/home_template.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // dummy hardcoded
  String address = 'XX, JLN KAJANG 123, TAMAN ABC, 43000 KAJANG, SELANGOR.';
  List<Restaurant> restaurants = List.generate(
    20,
    (index) => Restaurant(
        'name $index',
        (x: 2.964994, y: 101.7721517),
        ['Chinese', 'FastFood', 'Healthy'],
        'https://sdsgroups.com/wp-content/uploads/2021/11/cropped-Asset-3-e1637812026983.png'),
  );

  // remove until here
  @override
  Widget build(BuildContext context) {
    return HomeTemplate(
      address: address,
      restaurants: restaurants,
    );
  }
}
