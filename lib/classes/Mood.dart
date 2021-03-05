import 'dart:convert';

List<Mood> moodFromJson(String str) => List<Mood>.from(json.decode(str).map((x) => Mood.fromJson(x)));

String moodToJson(List<Mood> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Mood {
  Mood({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory Mood.fromJson(Map<String, dynamic> json) => Mood(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}