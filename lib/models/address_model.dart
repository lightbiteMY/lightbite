import 'package:lightbite/models/coordinate_model.dart';

class Address {
  final String? name;
  final String? line1;
  final String? line2;
  final String? line3;
  final String? line4;
  final String? city;
  final String? postcode;
  final String? state;
  final Coordinate? coordinate;

  const Address(
    this.name,
    this.line1,
    this.line2,
    this.line3,
    this.line4,
    this.city,
    this.postcode,
    this.state,
    this.coordinate,
  );

  Map<String, dynamic> toJson() => {
        'name': name,
        'line1': line1,
        'line2': line2,
        'line3': line3,
        'line4': line4,
        'city': city,
        'postcode': postcode,
        'state': state,
        'coordinate': coordinate,
      };

  operator [](String field) => toJson()[field];

  String? get getFullAddress {
    if (name == null) return null;
    return '$line1, ${line2 ?? ''}, ${line3 ?? ''}, $city, $postcode, $state';
  }

  String? get getName => name;
}
