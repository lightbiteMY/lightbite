import 'package:flutter/material.dart';
import 'package:lightbite/providers/favourite_place_list_provider.dart';
import 'package:lightbite/providers/restaurant_list_provider.dart';
import 'package:lightbite/templates/home_template.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedFavouritePlace = 0;
  @override
  void initState() {
    super.initState();
    Provider.of<RestaurantListProvider>(context, listen: false)
        .getRestaurantList();
    Provider.of<FavouritePlaceListProvider>(context, listen: false)
        .getFavouritePlaceList();
  }

  void changeFavouritePlace(value) {
    setState(() {
      selectedFavouritePlace = value;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final restaurantListProvider = Provider.of<RestaurantListProvider>(context);
    final favouritePlaceListProvider =
        Provider.of<FavouritePlaceListProvider>(context);

    return HomeTemplate(
      restaurants: restaurantListProvider.restaurantList,
      favouritePlaces: favouritePlaceListProvider.favouritePlaceList,
      selectedFavouritePlace: selectedFavouritePlace,
      changeFavouritePlace: changeFavouritePlace,
    );
  }
}
