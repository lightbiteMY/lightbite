import 'dart:convert';

List<RestaurantModel> restaurantListModelFromJson(String data) =>
    List<RestaurantModel>.from(json.decode(data).map((x) => RestaurantModel));

class RestaurantModel {
  final String name;
  final ({double x, double y}) coordinate;
  final List tags;
  final String imageUrl;

  const RestaurantModel(this.name, this.coordinate, this.tags, this.imageUrl);

  // RestaurantModel.fromJson(Map<String, dynamic> json) {
  //   name = json["name"];
  //   coordinate = json["coordinate"];
  //   tags = json["tags"];
  //   imageUrl = json["imageUrl"];
  // }

  // Map<String, dynamic> toJson() => {
  //       "name": name,
  //       "coordinate": coordinate,
  //       "tags": tags,
  //       "imageUrl": imageUrl,
  //     };
}
