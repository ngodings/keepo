// To parse this JSON data, do
//
//     final advanceFiltering = advanceFilteringFromJson(jsonString);

import 'dart:convert';

List<AdvanceFiltering> advanceFilteringFromJson(String str) =>
    List<AdvanceFiltering>.from(
        json.decode(str).map((x) => AdvanceFiltering.fromJson(x)));

String advanceFilteringToJson(List<AdvanceFiltering> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdvanceFiltering {
  AdvanceFiltering({
    this.id,
    this.visiblePublic,
    this.notification,
    this.language,
    this.startAge,
    this.endAge,
    this.gender,
    this.background,
    this.subscription,
    this.height,
    this.weight,
    this.createdAt,
  });

  final String? id;
  final bool? visiblePublic;
  final bool? notification;
  final String? language;
  final String? startAge;
  final String? endAge;
  final dynamic gender;
  final String? background;
  final String? subscription;
  final String? height;
  final String? weight;
  final DateTime? createdAt;

  factory AdvanceFiltering.fromJson(Map<String, dynamic> json) =>
      AdvanceFiltering(
        id: json["id"],
        visiblePublic: json["visible_public"],
        notification: json["notification"],
        language: json["language"],
        startAge: json["start_age"],
        endAge: json["end_age"],
        gender: json["gender"],
        background: json["background"],
        subscription: json["subscription"],
        height: json["height"],
        weight: json["weight"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "visible_public": visiblePublic,
        "notification": notification,
        "language": language,
        "start_age": startAge,
        "end_age": endAge,
        "gender": gender,
        "background": background,
        "subscription": subscription,
        "height": height,
        "weight": weight,
        "createdAt": createdAt!.toIso8601String(),
      };
}
