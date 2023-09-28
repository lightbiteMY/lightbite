import 'dart:convert';

import 'package:lightbite/models/coordinate_model.dart';

List<RestaurantModel> restaurantListModelFromJson(String data) =>
    List<RestaurantModel>.from(
        json.decode(data).map((x) => RestaurantModel.fromJson(x)));

class RestaurantModel {
  final String name;
  final Coordinate coordinate;
  final List tags;
  final String imageUrl;

  const RestaurantModel(this.name, this.coordinate, this.tags, this.imageUrl);

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      RestaurantModel(
        json["name"],
        Coordinate.fromJson(json["coordinate"]),
        json["tags"],
        json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "coordinate": coordinate,
        "tags": tags,
        "imageUrl": imageUrl,
      };
}
