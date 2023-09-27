import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:lightbite/data/restaurant_model.dart';

class RestaurantList extends ChangeNotifier {
  final List<RestaurantModel> _restaurantList = [];

  UnmodifiableListView<RestaurantModel> get RestaurantList => UnmodifiableListView(_restaurantList);

}
