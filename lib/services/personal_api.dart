import 'package:http/http.dart' as http;
import 'package:lightbite/models/address_model.dart';

class PersonalApiService {
  Future<List<AddressModel>> getFavouritePlaceList() async {
    var response = await http.get(
        Uri.parse("http://localhost:3000/personal/v1/getFavouritePlaceList"));

    if (response.statusCode == 200) {
      var data = response.body;
      return favouritePlaceListModelFromJson(data);
    }
    throw Exception();
  }
}
