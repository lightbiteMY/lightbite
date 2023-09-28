class Coordinate {
  final double x;
  final double y;

  const Coordinate(this.x, this.y);

  factory Coordinate.fromJson(Map<String, dynamic> json) {
    return Coordinate(json["x"], json["y"]);
  }

  Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
      };
}
