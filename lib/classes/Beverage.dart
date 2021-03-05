import 'dart:convert';

List<Beverage> beverageFromJson(String str) => List<Beverage>.from(json.decode(str).map((x) => Beverage.fromJson(x)));

String beverageToJson(List<Beverage> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Beverage {
  Beverage({
    this.id,
    this.name,
    this.ingredients,
    this.description,
    this.imageUrl,
  });

  int id;
  String name;
  String ingredients;
  String description;
  String imageUrl;

  factory Beverage.fromJson(Map<String, dynamic> json) => Beverage(
    id: json["id"],
    name: json["name"],
    ingredients: json["ingredients"],
    description: json["description"],
    imageUrl: json["image_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "ingredients": ingredients,
    "description": description,
    "image_url": imageUrl,
  };
}