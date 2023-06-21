import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/order.dart';
import 'models/user.dart';

class ApiService {
  // Uri url = Uri();
  static String baseUrl({String url = ''}) {
    return 'http://127.0.0.1:8000/api/${url}';
  }

  static String bearerToken = '';

  User userLogin =
      User(franchiseId: null, name: '', userId: null, username: '');

  Future<String> login(String username, String password) async {
    try {
      // debugPrint(baseUrl(url: 'user/login'));
      final response = await http.post(
          Uri.parse(
            baseUrl(url: 'user/login'),
          ),
          body: jsonEncode(<String, String>{
            'username': username,
            'password': password,
          }),
          headers: {"Content-Type": "application/json"});
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        Map data = json.decode(response.body);
        debugPrint('response body: ${response.body}');
        debugPrint('data: ${data}');
        User user = User.fromJson(data["user"]);
        debugPrint(
            'user: ${user.name}, ${user.userId}, ${user.username}, ${user.franchiseId}');
        // userLogin = await getUser(user.userId!);
        if (user.userId != null) {
          bearerToken = data['access_token'];
          debugPrint(bearerToken);
        }
        // debugPrint(userLogin.toString());
        return data['message'];
      } else {
        // debugPrint(response.body);
        return 'status code: ${response.statusCode.toString()}';
      }
    } catch (e) {
      debugPrint(e.toString());
      return 'error: ${e.toString()}';
    }
  }

  Future<User> getUser(int id) async {
    try {
      final response = await http.get(
          Uri(
            path: baseUrl(url: 'user/select/$id'),
          ),
          headers: {
            "Content-Type": "application/json",
            'Authorization': 'Bearer $bearerToken'
          });

      if (response.statusCode == 200) {
        Map data = json.decode(response.body);
        User user = User.fromJson(data["user"][0]);

        return user;
      } else {
        print(response.body);
        return User(franchiseId: null, name: '', userId: null, username: '');
      }
    } catch (e) {
      print(e);
      return User(franchiseId: null, name: '', userId: null, username: '');
    }
  }

  Future<List<Order>> getOrder() async {
    try {
      final response = await http.get(
        Uri.parse(
          baseUrl(url: 'order/index'),
        ),
        headers: {
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        Map data = json.decode(response.body);
        List<Order> order = data["order"];

        return order;
      } else {
        print(response.body);
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
