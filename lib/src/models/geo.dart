import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class Geo {
  final String lat;
  final String lng;
  Geo({
    required this.lat,
    required this.lng,
  });

  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }

  String toJson() => json.encode(toMap());

  factory Geo.fromMap(Map<String, dynamic> map) {
    return Geo(
      lat: map['lat'] ?? '',
      lng: map['lng'] ?? '',
    );
  }

  factory Geo.fromJson(String json) => Geo.fromMap(jsonDecode(json));
}
