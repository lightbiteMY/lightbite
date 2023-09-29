import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:lightbite/models/address_model.dart';
import 'package:lightbite/services/favourite_address_api.dart';

class FavouriteAddressListProvider extends ChangeNotifier {
  List<AddressModel> _favouriteAddressList = [];

  UnmodifiableListView<AddressModel> get favouriteAddressList =>
      UnmodifiableListView(_favouriteAddressList);

  AddressApiService api = AddressApiService();

  getFavouriteAddressList() async {
    _favouriteAddressList = await api.getFavouriteAddressList();

    notifyListeners();
  }
}
