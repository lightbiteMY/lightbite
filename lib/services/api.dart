import 'package:http/http.dart' as http;
import 'package:lightbite/models/restaurant_model.dart';

class ApiService {
  Future<List<RestaurantModel>> getRestaurantList() async {
    var response =
        await http.get(Uri.parse("https://localhost/getRestaurantList"));

    if (response.statusCode == 200) {
      // var data = response.body;
      const data =
          '[{"name": "SDS", "coordinate":{x: 2.964994, y: 101.7721517}, "tags":["Chinese", "FastFood", "Healthy"], "imageUrl":"https://sdsgroups.com/wp-content/uploads/2021/11/cropped-Asset-3-e1637812026983.png"}]';
      return restaurantListModelFromJson(data);
    }
    throw Exception();
  }
}
