import 'dart:convert';

List<TasteFlavor> tasteFlavorFromJson(String str) => List<TasteFlavor>.from(json.decode(str).map((x) => TasteFlavor.fromJson(x)));

String tasteFlavorToJson(List<TasteFlavor> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TasteFlavor {
  TasteFlavor({
    this.id,
    this.tasteId,
    this.flavorId,
  });

  int id;
  int tasteId;
  int flavorId;

  factory TasteFlavor.fromJson(Map<String, dynamic> json) => TasteFlavor(
    id: json["id"],
    tasteId: json["taste_id"],
    flavorId: json["flavor_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "taste_id": tasteId,
    "flavor_id": flavorId,
  };
}
