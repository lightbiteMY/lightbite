import 'package:flutter/material.dart';
import 'package:lightbite/pages/home/home_page.dart';
import 'package:lightbite/providers/favourite_place_list_provider.dart';
import 'package:lightbite/providers/restaurant_list_provider.dart';
import 'package:provider/provider.dart';

const List<String> filterList = [
  "Exclusive Partners",
  "Free Delivery Available",
  "Pickup Available",
  "Order In Advance",
];

class HomeController extends StatefulWidget {
  const HomeController({super.key});

  @override
  State<HomeController> createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {
  int selectedFavouritePlaceIndex = 0;
  List<String> selectedFilterList = [...filterList];
  @override
  void initState() {
    super.initState();
    Provider.of<RestaurantListProvider>(context, listen: false)
        .getRestaurantList();
    Provider.of<FavouritePlaceListProvider>(context, listen: false)
        .getFavouritePlaceList();
  }

  void onChangeFavouritePlace(value) {
    setState(() {
      selectedFavouritePlaceIndex = value;
    });
    Navigator.of(context).pop();
  }

  void onChangeFilter(selected, option) {
    setState(() {
      if (selected) {
        return selectedFilterList.add(option);
      }
      selectedFilterList.remove(option);
      if (selectedFilterList.isEmpty) {
        selectedFilterList = [...filterList];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final restaurantListProvider = Provider.of<RestaurantListProvider>(context);
    final favouritePlaceListProvider =
        Provider.of<FavouritePlaceListProvider>(context);

    return HomePage(
      restaurants: restaurantListProvider.restaurantList,
      favouritePlaces: favouritePlaceListProvider.favouritePlaceList,
      filterList: filterList,
      selectedFilterList: selectedFilterList,
      selectedFavouritePlaceIndex: selectedFavouritePlaceIndex,
      onChangeFavouritePlace: onChangeFavouritePlace,
      onChangeFilter: onChangeFilter,
    );
  }
}
