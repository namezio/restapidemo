import 'dart:convert';

import 'package:http/http.dart' as http;
import '../model/users.dart';

class UserApi {
  static Future<List<Users>> fetchUsers() async {
    const url = 'https://randomuser.me/api/?results=50';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final result = json['results'] as List<dynamic>;
    final users = result.map((e) {
      return Users.fromMap(e);
    }).toList();
    return users;
  }
}
