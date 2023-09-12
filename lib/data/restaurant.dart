class Restaurant {
  final String name;
  final ({double x, double y}) coordinate;
  final List tags;
  final String imageUrl;

  const Restaurant(this.name, this.coordinate, this.tags, this.imageUrl);
}
