import 'package:http/http.dart' as http;
import 'package:lightbite/models/address_model.dart';

class AddressApiService {
  Future<List<AddressModel>> getFavouriteAddressList() async {
    var response = await http.get(
        Uri.parse("http://localhost:3000/personal/v1/getFavouriteAddressList"));

    if (response.statusCode == 200) {
      var data = response.body;
      return favouriteAddressListModelFromJson(data);
    }
    throw Exception();
  }
}
