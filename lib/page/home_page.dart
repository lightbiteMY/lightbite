import 'package:flutter/material.dart';
import 'package:lightbite/data/address.dart';
import 'package:lightbite/data/restaurant.dart';
import 'package:lightbite/template/home_template.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // dummy hardcoded
  late Address address;
  String defaultInstruction = 'Please Set Your Address';
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
    address =
        const Address(null, null, null, null, null, null, null, null, null);
    // address = const Address(
    //   'Home',
    //   '21',
    //   'JLN 1',
    //   'TAMAN 3',
    //   null,
    //   'KAJANG',
    //   '43000',
    //   'SELANGOR',
    //   (x: 10.0, y: 20.0),
    // );
    return HomeTemplate(
      address: address.getFullAddress ?? defaultInstruction,
      restaurants: restaurants,
    );
  }
}
