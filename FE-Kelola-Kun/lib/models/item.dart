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
  List<Item> item;

  Data({
    required this.item,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        item: List<Item>.from(json["item"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "item": List<dynamic>.from(item.map((x) => x.toJson())),
      };
}

class Item {
  int itemId;
  String name;
  String weight;
  String price;
  int categoryId;

  Item({
    required this.itemId,
    required this.name,
    required this.weight,
    required this.price,
    required this.categoryId,
  });

  factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        itemId: json["item_id"],
        name: json["name"],
        weight: json["weight"],
        price: json["price"],
        categoryId: json["category_id"],
      );

  Map<String, dynamic> toJson() => {
        "item_id": itemId,
        "name": name,
        "weight": weight,
        "price": price,
        "category_id": categoryId,
      };
}
