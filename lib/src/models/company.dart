// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'catchPhrase': catchPhrase,
      'bs': bs,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(
      name: map['name'] ?? '',
      catchPhrase: map['catchPhrase'] ?? '',
      bs: map['bs'] ?? '',
    );
  }

  factory Company.fromJson(String json) => Company.fromMap(jsonDecode(json));
}
