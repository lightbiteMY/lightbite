import 'dart:convert';

import 'package:lightbite/models/coordinate_model.dart';

List<RestaurantModel> restaurantListModelFromJson(String data) =>
    List<RestaurantModel>.from(
        json.decode(data).map((x) => RestaurantModel.fromJson(x)));

class RestaurantModel {
  final String name;
  final CoordinateModel coordinate;
  final List foodTags;
  final List platformTags;
  final String imageUrl;

  const RestaurantModel(this.name, this.coordinate, this.foodTags,
      this.platformTags, this.imageUrl);

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      RestaurantModel(
        json["name"],
        CoordinateModel.fromJson(json["coordinate"]),
        json["foodTags"],
        json["platformTags"],
        json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "coordinate": coordinate,
        "foodTags": foodTags,
        "platformTags": platformTags,
        "imageUrl": imageUrl,
      };
}
