import 'dart:convert';

List<BeverageType> beverageTypeFromJson(String str) => List<BeverageType>.from(json.decode(str).map((x) => BeverageType.fromJson(x)));

String beverageTypeToJson(List<BeverageType> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BeverageType {
  BeverageType({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory BeverageType.fromJson(Map<String, dynamic> json) => BeverageType(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}