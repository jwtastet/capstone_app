// To parse this JSON data, do
//
//     final prescription = prescriptionFromJson(jsonString);

import 'dart:convert';

List<Prescription> prescriptionFromJson(String str) => List<Prescription>.from(json.decode(str).map((x) => Prescription.fromJson(x)));

String prescriptionToJson(List<Prescription> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Prescription {
  Prescription({
    this.id,
    this.moodId,
    this.beverageTypeId,
    this.taste1Id,
    this.taste2Id,
    this.flavorId,
    this.beverageId,
  });

  int id;
  int moodId;
  int beverageTypeId;
  int taste1Id;
  int taste2Id;
  int flavorId;
  int beverageId;

  factory Prescription.fromJson(Map<String, dynamic> json) => Prescription(
    id: json["id"],
    moodId: json["mood_id"],
    beverageTypeId: json["beverage_type_id"],
    taste1Id: json["taste1_id"],
    taste2Id: json["taste2_id"],
    flavorId: json["flavor_id"],
    beverageId: json["beverage_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "mood_id": moodId,
    "beverage_type_id": beverageTypeId,
    "taste1_id": taste1Id,
    "taste2_id": taste2Id,
    "flavor_id": flavorId,
    "beverage_id": beverageId,
  };
}
