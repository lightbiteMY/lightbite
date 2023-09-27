class RestaurantModel {
  final String name;
  final ({double x, double y}) coordinate;
  final List tags;
  final String imageUrl;

  const RestaurantModel(this.name, this.coordinate, this.tags, this.imageUrl);
}
