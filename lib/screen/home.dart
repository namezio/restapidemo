import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:restapidemo/services/user_api.dart';

import '../model/user_name.dart';
import '../model/users.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Users> users = [];

  @override
  void initState(){
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API CALL'),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            final email = user.email;
            final name = user.name;
            return ListTile(
              title: Text(user.fullname),
              subtitle: Text(user.location.country),
            );
          }),
    );
  }

  Future<void> fetchUsers() async{
    final response = await UserApi.fetchUsers();
    setState(() {
      users =response;
    });
  }

  // Future<void> fetchUsers() async {
  //   const url = 'https://randomuser.me/api/?results=50';
  //   final uri = Uri.parse(url);
  //   final response = await http.get(uri);
  //   final body = response.body;
  //   final json = jsonDecode(body);
  //   final result = json['results'] as List<dynamic>;
  //   final transformed = result.map((e) {
  //     final name = Username(
  //         title: e['name']['title'],
  //         first: e['name']['first'],
  //         last: e['name']['last']);
  //     return Users(
  //         gender: e['gender'],
  //         email: e['email'],
  //         phone: e['phone'],
  //         cell: e['cell'],
  //         nat: e['nat'],
  //         name: name);
  //   }).toList();
  //   setState(() {
  //     users = transformed;
  //   });
  //   print('fetchusers completed');
  // }
}
