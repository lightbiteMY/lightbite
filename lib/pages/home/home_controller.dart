import 'package:flutter/material.dart';
import 'package:lightbite/pages/home/home_page.dart';
import 'package:lightbite/providers/favourite_place_list_provider.dart';
import 'package:lightbite/providers/restaurant_list_provider.dart';
import 'package:provider/provider.dart';

class HomeController extends StatefulWidget {
  const HomeController({super.key});

  @override
  State<HomeController> createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {
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

    return HomePage(
      restaurants: restaurantListProvider.restaurantList,
      favouritePlaces: favouritePlaceListProvider.favouritePlaceList,
      selectedFavouritePlace: selectedFavouritePlace,
      changeFavouritePlace: changeFavouritePlace,
    );
  }
}
