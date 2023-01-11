// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'address.dart';
import 'company.dart';

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'address': address.toMap(),
      'phone': phone,
      'website': website,
      'company': company.toMap(),
    };
  }

  String toJson() => jsonEncode(toMap());

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      address: Address.fromMap(map['address'] ?? <String, dynamic>{}),
      phone: map['phone'] ?? '',
      website: map['website'] ?? '',
      company: Company.fromMap(map['company'] ?? <String, dynamic>{}),
    );
  }

  factory User.fromJson(String json) => User.fromMap(jsonDecode(json));
}
