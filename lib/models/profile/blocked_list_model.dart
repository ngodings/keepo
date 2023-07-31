import 'dart:convert';

List<BlockedUserList> blockedUserListFromJson(String str) =>
    List<BlockedUserList>.from(
        json.decode(str).map((x) => BlockedUserList.fromJson(x)));

String blockedUserListToJson(List<BlockedUserList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BlockedUserList {
  BlockedUserList({
    this.id,
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
    this.createdAt,
    this.lastEditAt,
    this.lastSwitchingAt,
    this.matching,
  });

  final String? id;
  final String? thumbnail;
  final String? name;
  final String? firstName;
  final String? lastName;
  final String? countryId;
  final DateTime? dob;
  final String? gender;
  final String? username;
  final String? tagline;
  final String? height;
  final String? weight;
  final List<String>? language;
  final String? occupation;
  final String? background;
  final String? bio;
  final List<String>? description;
  final bool? show;
  final bool? allchat;
  final bool? contact;
  final List<dynamic>? contactSelected;
  final List<dynamic>? showMatching;
  final dynamic settingMatchingDetail;
  final bool? deleted;
  final DateTime? createdAt;
  final DateTime? lastEditAt;
  final DateTime? lastSwitchingAt;
  final List<dynamic>? matching;

  factory BlockedUserList.fromJson(Map<String, dynamic> json) =>
      BlockedUserList(
        id: json["id"],
        thumbnail: json["thumbnail"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        countryId: json["country_id"],
        dob: DateTime.parse(json["dob"]),
        gender: json["gender"],
        username: json["username"],
        tagline: json["tagline"],
        height: json["height"],
        weight: json["weight"],
        language: List<String>.from(json["language"].map((x) => x)),
        occupation: json["occupation"],
        background: json["background"],
        bio: json["bio"],
        description: List<String>.from(json["description"].map((x) => x)),
        show: json["show"],
        allchat: json["allchat"],
        contact: json["contact"],
        contactSelected:
            List<dynamic>.from(json["contact_selected"].map((x) => x)),
        showMatching: List<dynamic>.from(json["show_matching"].map((x) => x)),
        settingMatchingDetail: json["setting_matching_detail"],
        deleted: json["deleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        lastEditAt: DateTime.parse(json["lastEditAt"]),
        lastSwitchingAt: DateTime.parse(json["lastSwitchingAt"]),
        matching: List<dynamic>.from(json["matching"].map((x) => x)),
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
        "username": username,
        "tagline": tagline,
        "height": height,
        "weight": weight,
        "language": List<dynamic>.from(language!.map((x) => x)),
        "occupation": occupation,
        "background": background,
        "bio": bio,
        "description": List<dynamic>.from(description!.map((x) => x)),
        "show": show,
        "allchat": allchat,
        "contact": contact,
        "contact_selected": List<dynamic>.from(contactSelected!.map((x) => x)),
        "show_matching": List<dynamic>.from(showMatching!.map((x) => x)),
        "setting_matching_detail": settingMatchingDetail,
        "deleted": deleted,
        "createdAt": createdAt!.toIso8601String(),
        "lastEditAt": lastEditAt!.toIso8601String(),
        "lastSwitchingAt": lastSwitchingAt!.toIso8601String(),
        "matching": List<dynamic>.from(matching!.map((x) => x)),
      };
}


// List<BlockedUserList> blockedUserListFromJson(String str) =>
//     List<BlockedUserList>.from(
//         json.decode(str).map((x) => BlockedUserList.fromJson(x)));

// String blockedUserListToJson(List<BlockedUserList> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class BlockedUserList {
//   BlockedUserList({
//     this.id,
//     this.thumbnail,
//     this.name,
//     this.firstName,
//     this.dob,
//     this.gender,
//     this.username,
//     this.tagline,
//     this.height,
//     this.weight,
//     this.language,
//     this.occupation,
//     this.background,
//     this.bio,
//     this.deleted,
//     this.createdAt,
//     this.lastEditAt,
//     this.lastSwitchingAt,
//   });

//   final String? id;
//   final String? thumbnail;
//   final String? name;
//   final String? firstName;
//   final DateTime? dob;
//   final String? gender;
//   final String? username;
//   final String? tagline;
//   final String? height;
//   final String? weight;
//   final String? language;
//   final String? occupation;
//   final String? background;
//   final String? bio;
//   final bool? deleted;
//   final DateTime? createdAt;
//   final DateTime? lastEditAt;
//   final DateTime? lastSwitchingAt;

//   factory BlockedUserList.fromJson(Map<String, dynamic> json) =>
//       BlockedUserList(
//         id: json["id"],
//         thumbnail: json["thumbnail"],
//         name: json["name"],
//         firstName: json["first_name"],
//         dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
//         gender: json["gender"],
//         username: json["username"],
//         tagline: json["tagline"],
//         height: json["height"],
//         weight: json["weight"],
//         language: json["language"],
//         occupation: json["occupation"],
//         background: json["background"],
//         bio: json["bio"],
//         deleted: json["deleted"],
//         createdAt: json["createdAt"] == null
//             ? null
//             : DateTime.parse(json["createdAt"]),
//         lastEditAt: json["lastEditAt"] == null
//             ? null
//             : DateTime.parse(json["lastEditAt"]),
//         lastSwitchingAt: json["lastSwitchingAt"] == null
//             ? null
//             : DateTime.parse(json["lastSwitchingAt"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "thumbnail": thumbnail,
//         "name": name,
//         "first_name": firstName,
//         "dob": dob == null ? null : dob!.toIso8601String(),
//         "gender": gender,
//         "username": username,
//         "tagline": tagline,
//         "height": height,
//         "weight": weight,
//         "language": language,
//         "occupation": occupation,
//         "background": background,
//         "bio": bio,
//         "deleted": deleted,
//         "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
//         "lastEditAt": lastEditAt == null ? null : lastEditAt!.toIso8601String(),
//         "lastSwitchingAt":
//             lastSwitchingAt == null ? null : lastSwitchingAt!.toIso8601String(),
//       };
// }
