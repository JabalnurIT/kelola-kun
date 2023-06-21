// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

class User {
  int? userId;
  String name;
  String username;
  int? franchiseId;

  User({
    required this.userId,
    required this.name,
    required this.username,
    required this.franchiseId,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"],
        name: json["name"],
        username: json["username"],
        franchiseId: json["franchise_id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "username": username,
        "franchise_id": franchiseId,
      };
}
