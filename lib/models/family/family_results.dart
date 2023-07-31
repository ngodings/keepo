// To parse this JSON data, do
//
//     final findFamilyModel = findFamilyModelFromJson(jsonString);

import 'dart:convert';

List<FindFamilyModel> findFamilyModelFromJson(String str) =>
    List<FindFamilyModel>.from(
        json.decode(str).map((x) => FindFamilyModel.fromJson(x)));

String findFamilyModelToJson(List<FindFamilyModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FindFamilyModel {
  FindFamilyModel({
    this.id,
    this.thumbnail,
    this.name,
    this.firstName,
    this.lastName,
    this.countryId,
    this.dob,
    this.gender,
    this.height,
    this.weight,
    this.language,
    this.occupation,
    this.show,
    this.allchat,
    this.contact,
    this.contactSelected,
    this.deleted,
    this.lastEditAt,
  });

  final String? id;
  final dynamic thumbnail;
  final dynamic name;
  final dynamic firstName;
  final dynamic lastName;
  final dynamic countryId;
  final dynamic dob;
  final dynamic gender;
  final dynamic height;
  final dynamic weight;
  final dynamic language;
  final dynamic occupation;
  final bool? show;
  final bool? allchat;
  final bool? contact;
  final dynamic contactSelected;
  final bool? deleted;
  final DateTime? lastEditAt;

  factory FindFamilyModel.fromJson(Map<String, dynamic> json) =>
      FindFamilyModel(
        id: json["id"],
        thumbnail: json["thumbnail"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        countryId: json["country_id"],
        dob: DateTime.parse(json["dob"]),
        gender: json["gender"],
        height: json["height"],
        weight: json["weight"],
        language: json["language"],
        occupation: json["occupation"],
        show: json["show"],
        allchat: json["allchat"],
        contact: json["contact"],
        contactSelected: json["contact_selected"],
        deleted: json["deleted"],
        lastEditAt: json["lastEditAt"] == null
            ? null
            : DateTime.parse(json["lastEditAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "thumbnail": thumbnail,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "country_id": countryId,
        "dob": dob!.toIso8601String(),
        "gender": gender,
        "height": height,
        "weight": weight,
        "language": language,
        "occupation": occupation,
        "show": show,
        "allchat": allchat,
        "contact": contact,
        "contact_selected": contactSelected,
        "deleted": deleted,
        "lastEditAt": lastEditAt == null ? null : lastEditAt!.toIso8601String(),
      };
}

class UsernameList {
  UsernameList({this.id, this.name, this.thumbnail});

  final String? id;
  final dynamic thumbnail;
  final String? name;

  factory UsernameList.fromJson(Map<String, dynamic> json) => UsernameList(
        id: json["id"],
        thumbnail: json["thumbnail"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "thumbnail": thumbnail,
        "name": name,
      };
}
