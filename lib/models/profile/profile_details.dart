// To parse this JSON data, do
//
//     final profileDetails = profileDetailsFromJson(jsonString);

import 'dart:convert';

import 'package:keepo/models/booking/booking_result.dart';

ProfileDetails profileDetailsFromJson(String str) =>
    ProfileDetails.fromJson(json.decode(str));

String profileDetailsToJson(ProfileDetails data) => json.encode(data.toJson());

class ProfileDetails {
  String? id;
  String? thumbnail;
  String? name;
  String? username;
  String? tagline;
  String? firstName;
  String? lastName;
  String? countryId;
  DateTime? dob;
  String? gender;
  String? laknatGender;
  String? height;
  String? weight;
  String? horoscope;
  String? zodiac;
  String? race;
  String? shoeSize;
  String? chestSize;
  String? waistSize;
  String? hipSize;
  List<String>? language;
  String? occupation;
  String? background;
  String? bio;
  List<String>? description;
  bool? show;
  bool? allchat;
  bool? contact;
  bool? isLike;
  bool? isFriend;
  bool? isBlock;
  bool? blocked;
  String? reason;
  List<dynamic>? contactSelected;
  bool? deleted;
  DateTime? createdAt;
  DateTime? lastEditAt;
  List<ServiceProduct>? product;
  List<String>? matching;
  List<String>? personality;
  List<String>? profession;
  List<String>? interest;
  List<VisitCity>? visitCity;
  List<VisitCity>? currentCity;
  List<String>? showMatching;
  List<Family>? family;
  List<Media>? media;
  List<Family>? friend;
  List<Experience>? experiences;
  ChatMedia? chat;
  List<FriendDescription>? friendDescription;
  List<FriendOtherDescription>? friendOtherDescription;
  List<String?>? friendMedia;
  String? member;
  Hide? hide;
  bool? kycVerified;

  ProfileDetails({
    this.id,
    this.thumbnail,
    this.name,
    this.username,
    this.tagline,
    this.firstName,
    this.lastName,
    this.countryId,
    this.dob,
    this.gender,
    this.laknatGender,
    this.height,
    this.weight,
    this.horoscope,
    this.zodiac,
    this.race,
    this.shoeSize,
    this.chestSize,
    this.waistSize,
    this.hipSize,
    this.language,
    this.occupation,
    this.background,
    this.bio,
    this.description,
    this.show,
    this.allchat,
    this.contact,
    this.isLike,
    this.isFriend,
    this.isBlock,
    this.blocked,
    this.reason,
    this.contactSelected,
    this.deleted,
    this.createdAt,
    this.lastEditAt,
    this.product,
    this.matching,
    this.showMatching,
    this.family,
    this.media,
    this.friend,
    this.experiences,
    this.chat,
    this.friendDescription,
    this.friendOtherDescription,
    this.friendMedia,
    this.member,
    this.personality,
    this.profession,
    this.interest,
    this.visitCity,
    this.currentCity,
    this.hide,
    this.kycVerified,
  });

  ProfileDetails.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    thumbnail = json["thumbnail"];
    name = json["name"];
    tagline = json["tagline"];
    username = json["username"];
    firstName = json["first_name"];
    lastName = json["last_name"];
    countryId = json["country_id"];
    dob = json["dob"] == null ? null : DateTime.parse(json["dob"]);
    gender = json["gender"];
    laknatGender = json["laknatGender"];
    height = json["height"];
    weight = json["weight"];
    horoscope = json['horoscope'];
    zodiac = json['zodiac'];
    race = json['race'];
    shoeSize = json['shoe_size'];
    chestSize = json['chest_size'];
    waistSize = json['waist_size'];
    hipSize = json['hip_size'];
    try {
      language = json["language"] == null
          ? null
          : List<String>.from(json["language"].map((x) => x));
    } catch (e) {
      language = json["language"] == null
          ? null
          : List<String>.from(jsonDecode(json["language"]).map((x) => x));
    }
    occupation = json["occupation"];
    background = json["background"];
    bio = json["bio"];
    personality = json["personality"] == null
        ? null
        : List<String>.from(json["personality"].map((x) => x));
    profession = json["profession"] == null
        ? null
        : List<String>.from(json["profession"].map((x) => x));
    interest = json["interest"] == null
        ? null
        : List<String>.from(json["interest"].map((x) => x));
    visitCity = json["visit_city"] == null
        ? null
        : List<VisitCity>.from(
            json["visit_city"].map((x) => VisitCity.fromJson(x)));
    currentCity = json["current_city"] == null
        ? null
        : List<VisitCity>.from(
            json["current_city"].map((x) => VisitCity.fromJson(x)));
    description = json["description"] == null
        ? null
        : List<String>.from(json["description"].map((x) => x));
    show = json["show"];
    allchat = json["allchat"];
    contact = json["contact"];
    isLike = json["is_like"];
    isFriend = json["is_friend"];
    isBlock = json["is_block"];
    blocked = json["blocked"];
    reason = json["reason"];
    contactSelected = json["contact_selected"] == null
        ? null
        : List<dynamic>.from(json["contact_selected"].map((x) => x));
    deleted = json["deleted"];
    createdAt =
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]);
    lastEditAt =
        json["lastEditAt"] == null ? null : DateTime.parse(json["lastEditAt"]);
    product = json["product"] == null
        ? null
        : List<ServiceProduct>.from(
            json["product"].map((x) => ServiceProduct.fromJson(x)));
    matching = json["matching"] == null
        ? null
        : List<String>.from(json["matching"].map((x) => x));
    showMatching = json["show_matching"] == null
        ? null
        : List<String>.from(json["show_matching"].map((x) => x));
    family = json["family"] == null
        ? null
        : List<Family>.from(json["family"].map((x) => Family.fromJson(x)));
    media = json["media"] == null
        ? null
        : List<Media>.from(json["media"].map((x) => Media.fromJson(x)));
    friend = json["friend"] == null
        ? null
        : List<Family>.from(json["friend"].map((x) => Family.fromJson(x)));
    experiences = json["experiences"] == null
        ? null
        : List<Experience>.from(
            json["experiences"].map((x) => Experience.fromJson(x)));
    friendDescription = json["friend_description"] == null
        ? null
        : List<FriendDescription>.from(json["friend_description"]
            .map((x) => FriendDescription.fromJson(x)));
    friendOtherDescription = json["friend_other_description"] == null
        ? null
        : List<FriendOtherDescription>.from(json["friend_other_description"]
            .map((x) => FriendOtherDescription.fromJson(x)));
    friendMedia = json["friend_media"] == null
        ? null
        : List<String?>.from(json["friend_media"].map((x) => x));
    chat = json['chat'] != null ? ChatMedia.fromJson(json['chat']) : null;
    member = json["member"];
    hide = json['hide'] != null ? Hide.fromJson(json['hide']) : null;
    kycVerified = json['kyc_verified'];
  }

  // factory ProfileDetails.fromJson(Map<String, dynamic> json) =>
  //     ProfileDetails(
  //       id: json["id"],
  //       thumbnail: json["thumbnail"],
  //       name: json["name"],
  //       tagline: json["tagline"],
  //       username: json["username"],
  //       firstName: json["first_name"],
  //       lastName: json["last_name"],
  //       countryId: json["country_id"],
  //       dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
  //       gender: json["gender"],
  //       laknatGender: json["laknatGender"],
  //       height: json["height"],
  //       weight: json["weight"],
  //       horoscope: json['horoscope'],
  //       zodiac: json['zodiac'],
  //       race: json['race'],
  //       shoeSize: json['shoe_size'],
  //       chestSize: json['chest_size'],
  //       waistSize: json['waist_size'],
  //       hipSize: json['hip_size'],
  //       language: json["language"] == null
  //           ? null
  //           : List<String>.from(json["language"].map((x) => x)),
  //       occupation: json["occupation"],
  //       background: json["background"],
  //       bio: json["bio"],
  //       personality: json["personality"] == null
  //           ? null
  //           : List<String>.from(json["personality"].map((x) => x)),
  //       profession: json["profession"] == null
  //           ? null
  //           : List<String>.from(json["profession"].map((x) => x)),
  //       interest: json["interest"] == null
  //           ? null
  //           : List<String>.from(json["interest"].map((x) => x)),
  //       visitCity: json["visit_city"] == null
  //           ? null
  //           : List<VisitCity>.from(json["visit_city"].map(
  //             (x) => VisitCity.fromJson(x),
  //       )),
  //       currentCity: json["current_city"] == null
  //           ? null
  //           : List<VisitCity>.from(json["current_city"].map(
  //             (x) => VisitCity.fromJson(x),
  //       )),
  //       description: json["description"] == null
  //           ? null
  //           : List<String>.from(json["description"].map((x) => x)),
  //       show: json["show"],
  //       allchat: json["allchat"],
  //       contact: json["contact"],
  //       isLike: json["is_like"],
  //       isFriend: json["is_friend"],
  //       isBlock: json["is_block"],
  //       blocked: json["blocked"],
  //       reason: json["reason"],
  //       contactSelected: json["contact_selected"] == null
  //           ? null
  //           : List<dynamic>.from(json["contact_selected"].map((x) => x)),
  //       deleted: json["deleted"],
  //       createdAt: json["createdAt"] == null
  //           ? null
  //           : DateTime.parse(json["createdAt"]),
  //       lastEditAt: json["lastEditAt"] == null
  //           ? null
  //           : DateTime.parse(json["lastEditAt"]),
  //       product: json["product"] == null
  //           ? null
  //           : List<ServiceProduct>.from(json["product"].map(
  //             (x) => ServiceProduct.fromJson(x),
  //       )),
  //       matching: json["matching"] == null
  //           ? null
  //           : List<String>.from(json["matching"].map((x) => x)),
  //       showMatching: json["show_matching"] == null
  //           ? null
  //           : List<String>.from(json["show_matching"].map((x) => x)),
  //       family: json["family"] == null
  //           ? null
  //           : List<Family>.from(json["family"].map((x) => Family.fromJson(x))),
  //       media: json["media"] == null
  //           ? null
  //           : List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
  //       friend: json["friend"] == null
  //           ? null
  //           : List<Family>.from(json["friend"].map((x) => Family.fromJson(x))),
  //       experiences: json["experiences"] == null
  //           ? null
  //           : List<Experience>.from(
  //           json["experiences"].map((x) => Experience.fromJson(x))),
  //       friendDescription: json["friend_description"] == null
  //           ? null
  //           : List<FriendDescription>.from(json["friend_description"]
  //           .map((x) => FriendDescription.fromJson(x))),
  //       friendOtherDescription: json["friend_other_description"] == null
  //           ? null
  //           : List<FriendOtherDescription>.from(json["friend_other_description"]
  //           .map((x) => FriendOtherDescription.fromJson(x))),
  //       friendMedia: json["friend_media"] == null
  //           ? null
  //           : List<String?>.from(json["friend_media"].map((x) => x)),
  //       chat: json['chat'] != null ? ChatMedia.fromJson(json['chat']) : null,
  //       member: json["member"],
  //       hide: json['hide'] != null ? Hide.fromJson(json['hide']) : null,
  //     );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["thumbnail"] = thumbnail;
    data["name"] = name;
    data["username"] = username;
    data["tagline"] = tagline;
    data["first_name"] = firstName;
    data["last_name"] = lastName;
    data["country_id"] = countryId;
    data["dob"] = dob == null ? null : dob!.toIso8601String();
    data["gender"] = gender;
    data["laknatGender"] = laknatGender;
    data["description"] = description;
    data["interest"] = interest;
    data["profession"] = profession;
    data["personality"] = personality;
    data["height"] = height;
    data["weight"] = weight;
    data["language"] = language;
    data["occupation"] = occupation;
    data["background"] = background;
    data["show"] = show;
    data["allchat"] = allchat;
    data["contact"] = contact;
    data["contact_selected"] = contactSelected == null
        ? []
        : List<dynamic>.from(contactSelected!.map((x) => x));
    data["deleted"] = deleted;
    data["createdAt"] = createdAt == null ? null : createdAt!.toIso8601String();
    data["lastEditAt"] =
        lastEditAt == null ? null : lastEditAt!.toIso8601String();
    data["product"] =
        product == null ? null : List<dynamic>.from(product!.map((x) => x));
    data["matching"] =
        matching == null ? null : List<dynamic>.from(matching!.map((x) => x));
    data["show_matching"] = showMatching == null
        ? null
        : List<dynamic>.from(showMatching!.map((x) => x));
    data["family"] = family == null
        ? null
        : List<dynamic>.from(family!.map((x) => x.toJson()));
    data["media"] = media == null
        ? null
        : List<dynamic>.from(media!.map((x) => x.toJson()));
    data["friend"] = friend == null
        ? null
        : List<dynamic>.from(friend!.map((x) => x.toJson()));
    data["experiences"] = experiences == null
        ? null
        : List<dynamic>.from(experiences!.map((x) => x.toJson()));
    data["chat"] = chat;
    data["is_block"] = isBlock;
    data["is_friend"] = isFriend;
    data["is_like"] = isLike;
    data["member"] = member;
    data["hide"] = hide;
    data["kyc_verified"] = kycVerified;
    return data;
  }
// {
//   "id": id,
//   "thumbnail": thumbnail,
//   "name": name,
//   "username": username,
//   "tagline": tagline,
//   "first_name": firstName,
//   "last_name": lastName,
//   "country_id": countryId,
//   "dob": dob == null ? null : dob!.toIso8601String(),
//   "gender": gender,
//   "laknatGender": laknatGender,
//   "description": description,
//   "interest": interest,
//   "profession": profession,
//   "personality": personality,
//   "height": height,
//   "weight": weight,
//   "language": language,
//   "occupation": occupation,
//   "background": background,
//   "show": show,
//   "allchat": allchat,
//   "contact": contact,
//   "contact_selected": contactSelected == null
//       ? []
//       : List<dynamic>.from(contactSelected!.map((x) => x)),
//   "deleted": deleted,
//   "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
//   "lastEditAt": lastEditAt == null ? null : lastEditAt!.toIso8601String(),
//   "product":
//   product == null ? null : List<dynamic>.from(product!.map((x) => x)),
//   "matching": matching == null
//       ? null
//       : List<dynamic>.from(matching!.map((x) => x)),
//   "show_matching": showMatching == null
//       ? null
//       : List<dynamic>.from(showMatching!.map((x) => x)),
//   "family": family == null
//       ? null
//       : List<dynamic>.from(family!.map((x) => x.toJson())),
//   "media": media == null
//       ? null
//       : List<dynamic>.from(media!.map((x) => x.toJson())),
//   "friend": friend == null
//       ? null
//       : List<dynamic>.from(friend!.map((x) => x.toJson())),
//   "experiences": experiences == null
//       ? null
//       : List<dynamic>.from(experiences!.map((x) => x.toJson())),
//   "chat": chat,
//   "is_block": isBlock,
//   "is_friend": isFriend,
//   "is_like": isLike,
//   "member": member,
//   "hide": hide,
// };
}

class Experience {
  Experience({
    this.id,
    this.jobTitle,
    this.companyName,
    this.status,
    this.image,
    this.startDate,
    this.endDate,
    this.lastEditAt,
  });

  final String? id;
  final String? jobTitle;
  final String? companyName;
  final String? status;
  final String? image;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? lastEditAt;

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        id: json["id"],
        jobTitle: json["job_title"],
        companyName: json["company_name"],
        status: json["status"],
        image: json["image"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        lastEditAt: json["lastEditAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "job_title": jobTitle,
        "company_name": companyName,
        "status": status,
        "image": image,
        "start_date": startDate,
        "end_date": endDate,
        "lastEditAt": lastEditAt,
      };
}

class Family {
  Family({
    this.id,
    this.name,
    this.phoneNumber,
    this.pic,
    this.description,
    this.related,
    this.username,
    this.status,
    this.lastEditAt,
  });

  final String? id;
  final String? name;
  final String? phoneNumber;
  final dynamic pic;
  final dynamic description;
  final String? related;
  final String? username;
  final String? status;
  final dynamic lastEditAt;

  factory Family.fromJson(Map<String, dynamic> json) => Family(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        phoneNumber: json["phone_number"],
        pic: json["pic"],
        description: json["description"],
        related: json["related"],
        status: json["status"],
        lastEditAt: json["lastEditAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone_number": phoneNumber,
        "pic": pic,
        "description": description,
        "related": related,
        "status": status,
        "lastEditAt": lastEditAt,
      };
}

class Media {
  Media({
    this.id,
    this.name,
    this.url,
    this.lastEditAt,
    this.createdAt,
    this.isDefault,
  });

  final String? id;
  final dynamic name;
  final bool? isDefault;
  final String? url;
  final dynamic lastEditAt;
  final DateTime? createdAt;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        isDefault: json["isDefault"],
        lastEditAt: json["lastEditAt"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
        "lastEditAt": lastEditAt,
      };
}

class Matching {
  Matching({
    this.id,
    this.jobs,
  });

  final String? id;
  final String? jobs;

  factory Matching.fromJson(Map<String, dynamic> json) => Matching(
        id: json["id"],
        jobs: json["jobs"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "jobs": jobs,
      };
}

class ChatMedia {
  List<String>? media;
  List<FileAudioChat>? file;
  List<FileAudioChat>? audio;
  List<String?>? link;

  ChatMedia({this.media, this.file, this.audio, this.link});

  ChatMedia.fromJson(Map<String, dynamic> json) {
    media = json['media'].cast<String>();
    if (json['file'] != null) {
      file = <FileAudioChat>[];
      json['file'].forEach((v) {
        file!.add(FileAudioChat.fromJson(v));
      });
    }
    if (json['audio'] != null) {
      audio = <FileAudioChat>[];
      json['audio'].forEach((v) {
        audio!.add(FileAudioChat.fromJson(v));
      });
    }
    link = json['link'].cast<String?>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['media'] = media;
    if (file != null) {
      data['file'] = file!.map((v) => v.toJson()).toList();
    }
    if (audio != null) {
      data['audio'] = audio!.map((v) => v.toJson()).toList();
    }
    data['link'] = link;
    return data;
  }
}

class FileAudioChat {
  String? url;
  String? size;
  DateTime? date;
  String? name;

  FileAudioChat({this.url, this.size, this.date, this.name});

  FileAudioChat.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    size = json['size'];
    date = json["date"] == null ? null : DateTime.parse(json["date"]);
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['size'] = size;
    data['date'] = date?.toIso8601String();
    data['name'] = name;
    return data;
  }
}

class FriendDescription {
  String? name;
  String? description;

  FriendDescription({this.name, this.description});

  FriendDescription.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['desc'] = description;
    return data;
  }
}

class FriendOtherDescription {
  String? title;
  String? desc;

  FriendOtherDescription({this.title, this.desc});

  FriendOtherDescription.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['desc'] = desc;
    return data;
  }
}

class VisitCity {
  String? country;
  String? city;

  VisitCity({this.country, this.city});

  VisitCity.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = country;
    data['city'] = city;
    return data;
  }
}

class Hide {
  String? height;
  String? weight;
  String? waist;
  String? hip;

  Hide({this.height, this.hip, this.waist, this.weight});

  Hide.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    weight = json['weight'];
    waist = json['waist_size'];
    hip = json['hip_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['height'] = height;
    data['weight'] = weight;
    data['waist_size'] = waist;
    data['hip_size'] = hip;
    return data;
  }
}
