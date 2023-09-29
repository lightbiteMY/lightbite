import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:lightbite/models/restaurant_model.dart';
import 'package:lightbite/services/restaurant_api.dart';

class RestaurantListProvider extends ChangeNotifier {
  List<RestaurantModel> _restaurantList = [];

  UnmodifiableListView<RestaurantModel> get restaurantList =>
      UnmodifiableListView(_restaurantList);

  RestaurantApiService api = RestaurantApiService();

  getRestaurantList() async {
    _restaurantList = await api.getRestaurantList();

    notifyListeners();
  }
}
