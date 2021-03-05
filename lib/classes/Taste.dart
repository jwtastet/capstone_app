import 'dart:convert';

List<Taste> tasteFromJson(String str) => List<Taste>.from(json.decode(str).map((x) => Taste.fromJson(x)));

String tasteToJson(List<Taste> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Taste {
  Taste({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory Taste.fromJson(Map<String, dynamic> json) => Taste(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}