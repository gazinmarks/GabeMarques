import 'dart:convert';
import 'package:api_users_crud/src/models/user.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<List<User>> findAll() async {
    final userResult =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (userResult.statusCode != 200) {
      throw Exception();
    }

    final userData = jsonDecode(userResult.body);

    return userData.map<User>((user) => User.fromMap(user)).toList();
  }

  Future<User> findById(int id) async {
    final userResult = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users?$id='));

    if (userResult.statusCode != 200) {
      throw Exception();
    }

    if (userResult.body == '{}') {
      throw Exception();
    }

    return User.fromJson(userResult.body);
  }

  Future<void> insert(User user) async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
      body: user.toJson(),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception();
    }
  }

  Future<void> update(User user) async {
    final response = await http.put(
      Uri.parse('https://jsonplaceholder.typicode.com/users/${user.id}'),
      body: user.toJson(),
      headers: {'Content-Type': 'appication/json'},
    );

    if (response.statusCode != 200) {
      throw Exception();
    }
  }

  Future<void> deleteById(int id) async {
    final response = await http
        .delete(Uri.parse('https://jsonplaceholder.typicode.com/users/$id'));

    if(response.statusCode != 200) {
      throw Exception();
    }    
  }
}
