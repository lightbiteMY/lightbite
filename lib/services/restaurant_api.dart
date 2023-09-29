import 'package:http/http.dart' as http;
import 'package:lightbite/models/restaurant_model.dart';

class RestaurantApiService {
  Future<List<RestaurantModel>> getRestaurantList() async {
    var response =
        await http.get(Uri.parse("http://localhost:3000/getRestaurantList"));

    if (response.statusCode == 200) {
      var data = response.body;
      return restaurantListModelFromJson(data);
    }
    throw Exception();
  }
}
