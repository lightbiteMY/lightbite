class CoordinateModel {
  final double x;
  final double y;

  const CoordinateModel(this.x, this.y);

  factory CoordinateModel.fromJson(Map<String, dynamic> json) {
    return CoordinateModel(json["x"], json["y"]);
  }

  Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
      };
}
