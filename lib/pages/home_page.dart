import 'package:flutter/material.dart';
import 'package:lightbite/providers/restaurant_list_provider.dart';
import 'package:lightbite/models/address.dart';
import 'package:lightbite/templates/home_template.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Address address;
  String defaultInstruction = 'Please Set Your Address';

  @override
  void initState() {
    super.initState();
    Provider.of<RestaurantListProvider>(context, listen: false)
        .getRestaurantList();
  }

  @override
  Widget build(BuildContext context) {
    final restaurantListProvider = Provider.of<RestaurantListProvider>(context);
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
      restaurants: restaurantListProvider.restaurantList,
    );
  }
}
