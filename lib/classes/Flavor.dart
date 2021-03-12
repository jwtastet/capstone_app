import 'dart:convert';

List<Flavor> flavorFromJson(String str) => List<Flavor>.from(json.decode(str).map((x) => Flavor.fromJson(x)));

String flavorToJson(List<Flavor> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Flavor {
  Flavor({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory Flavor.fromJson(Map<String, dynamic> json) => Flavor(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}