// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

class Welcome {
  String status;
  Data data;

  Welcome({
    required this.status,
    required this.data,
  });

  factory Welcome.fromRawJson(String str) => Welcome.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  List<Order> order;

  Data({
    required this.order,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        order: List<Order>.from(json["order"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "order": List<dynamic>.from(order.map((x) => x.toJson())),
      };
}

class Order {
  int orderId;
  DateTime createdAt;
  DateTime modifiedAt;
  String status;
  String cost;
  int userId;

  Order({
    required this.orderId,
    required this.createdAt,
    required this.modifiedAt,
    required this.status,
    required this.cost,
    required this.userId,
  });

  factory Order.fromRawJson(String str) => Order.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        orderId: json["order_id"],
        createdAt: DateTime.parse(json["created_at"]),
        modifiedAt: DateTime.parse(json["modified_at"]),
        status: json["status"],
        cost: json["cost"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "created_at": createdAt.toIso8601String(),
        "modified_at": modifiedAt.toIso8601String(),
        "status": status,
        "cost": cost,
        "user_id": userId,
      };
}
