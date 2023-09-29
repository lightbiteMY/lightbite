import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:lightbite/models/address_model.dart';
import 'package:lightbite/services/favourite_place_api.dart';

class FavouritePlaceListProvider extends ChangeNotifier {
  List<AddressModel> _favouritePlaceList = [];

  UnmodifiableListView<AddressModel> get favouritePlaceList =>
      UnmodifiableListView(_favouritePlaceList);

  AddressApiService api = AddressApiService();

  getFavouritePlaceList() async {
    _favouritePlaceList = await api.getFavouritePlaceList();

    notifyListeners();
  }
}
