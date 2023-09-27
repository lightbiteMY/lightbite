import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:lightbite/models/restaurant_model.dart';
import 'package:lightbite/services/api.dart';
import 'package:provider/provider.dart';

class RestaurantListProvider extends ChangeNotifier {
  List<RestaurantModel> _restaurantList = [];

  UnmodifiableListView<RestaurantModel> get restaurantList =>
      UnmodifiableListView(_restaurantList);

  ApiService api = ApiService();

  getRestaurantList() async {
    _restaurantList = await api.getRestaurantList();

    notifyListeners();
  }
}
