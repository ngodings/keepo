// To parse this JSON data, do
//
//     final friendList = friendListFromJson(jsonString);

import 'dart:convert';

import 'package:keepo/models/profile/profile_details.dart';

List<Friend> friendListFromJson(String str) =>
    List<Friend>.from(json.decode(str).map((x) => Friend.fromJson(x)));

String friendListToJson(List<Friend> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Friend {
  Friend(
      {this.id,
      this.name,
      this.firstName,
      this.phoneNumber,
      this.pic,
      this.description,
      this.related,
      this.status,
      this.lastEditAt,
      this.profileId,
      this.age,
      this.gender,
      this.language,
      this.experience,
      this.profiles});

  String? id;
  dynamic name;
  dynamic firstName;
  dynamic phoneNumber;
  dynamic pic;
  dynamic description;
  dynamic related;
  String? status;
  dynamic lastEditAt;
  String? profileId;
  int? age;
  String? gender;
  List<dynamic>? language;
  List<dynamic>? experience;
  Profiles? profiles;

  Friend.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    firstName = json["first_name"];
    phoneNumber = json["phone_number"];
    pic = json["pic"];
    description = json["description"];
    related = json["related"];
    status = json["status"];
    lastEditAt = json["lastEditAt"];
    profileId = json['profileId'];
    age = json["age"];
    gender = json["gender"];
    try {
      language = json["language"] == null
          ? null
          : List<String>.from(json["language"].map((x) => x));
    } catch (e) {
      language = json["language"] == null
          ? null
          : List<String>.from(jsonDecode(json["language"]).map((x) => x));
    }
    experience = json["experience"] == null
        ? null
        : List<dynamic>.from(json["experience"].map((x) => x));
    profiles =
        json['profiles'] != null ? Profiles.fromJson(json['profiles']) : null;
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone_number": phoneNumber,
        "pic": pic,
        "description": description,
        "related": related,
        "status": status,
        "lastEditAt": lastEditAt,
        'profileId': profileId,
        "age": age,
        "gender": gender,
        "language": List<dynamic>.from(language!.map((x) => x)),
      };
}

class Profiles {
  String? id;
  String? thumbnail;
  String? name;
  String? firstName;
  String? lastName;
  String? countryId;
  String? dob;
  String? gender;
  String? username;
  String? tagline;
  String? height;
  String? weight;
  List<String>? language;
  String? occupation;
  String? background;
  String? bio;
  String? description;
  bool? show;
  bool? allchat;
  bool? contact;
  String? contactSelected;
  String? showMatching;
  String? settingMatchingDetail;
  bool? deleted;
  bool? blocked;
  String? reason;
  String? createdAt;
  String? lastEditAt;
  String? lastEditUsernameAt;
  String? lastSwitchingAt;

  Profiles(
      {this.id,
      this.thumbnail,
      this.name,
      this.firstName,
      this.lastName,
      this.countryId,
      this.dob,
      this.gender,
      this.username,
      this.tagline,
      this.height,
      this.weight,
      this.language,
      this.occupation,
      this.background,
      this.bio,
      this.description,
      this.show,
      this.allchat,
      this.contact,
      this.contactSelected,
      this.showMatching,
      this.settingMatchingDetail,
      this.deleted,
      this.blocked,
      this.reason,
      this.createdAt,
      this.lastEditAt,
      this.lastEditUsernameAt,
      this.lastSwitchingAt});

  Profiles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    thumbnail = json['thumbnail'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    countryId = json['country_id'];
    dob = json['dob'];
    gender = json['gender'];
    username = json['username'];
    tagline = json['tagline'];
    height = json['height'];
    weight = json['weight'];
    try {
      language = json["language"] == null
          ? null
          : List<String>.from(json["language"].map((x) => x));
    } catch (e) {
      language = json["language"] == null
          ? null
          : List<String>.from(jsonDecode(json["language"]).map((x) => x));
    }
    occupation = json['occupation'];
    background = json['background'];
    bio = json['bio'];
    description = json['description'];
    show = json['show'];
    allchat = json['allchat'];
    contact = json['contact'];
    contactSelected = json['contact_selected'];
    showMatching = json['show_matching'];
    settingMatchingDetail = json['setting_matching_detail'];
    deleted = json['deleted'];
    blocked = json['blocked'];
    reason = json['reason'];
    createdAt = json['createdAt'];
    lastEditAt = json['lastEditAt'];
    lastEditUsernameAt = json['lastEditUsernameAt'];
    lastSwitchingAt = json['lastSwitchingAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['thumbnail'] = thumbnail;
    data['name'] = name;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['country_id'] = countryId;
    data['dob'] = dob;
    data['gender'] = gender;
    data['username'] = username;
    data['tagline'] = tagline;
    data['height'] = height;
    data['weight'] = weight;
    data['language'] = language;
    data['occupation'] = occupation;
    data['background'] = background;
    data['bio'] = bio;
    data['description'] = description;
    data['show'] = show;
    data['allchat'] = allchat;
    data['contact'] = contact;
    data['contact_selected'] = contactSelected;
    data['show_matching'] = showMatching;
    data['setting_matching_detail'] = settingMatchingDetail;
    data['deleted'] = deleted;
    data['blocked'] = blocked;
    data['reason'] = reason;
    data['createdAt'] = createdAt;
    data['lastEditAt'] = lastEditAt;
    data['lastEditUsernameAt'] = lastEditUsernameAt;
    data['lastSwitchingAt'] = lastSwitchingAt;
    return data;
  }
}
