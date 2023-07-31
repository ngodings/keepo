class MatchProfile {
  MatchProfile({
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
    this.interest,
    this.profession,
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
    this.lastSwitchingAt,
    this.matching,
    this.distance,
    this.phoneNumber,
    this.isLike,
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
  final String? description;
  final List<String>? profession;
  final List<String>? interest;
  final bool? show;
  final bool? allchat;
  final bool? contact;
  final String? contactSelected;
  final String? showMatching;
  final String? settingMatchingDetail;
  final bool? deleted;
  final bool? blocked;
  final String? reason;
  final DateTime? createdAt;
  final DateTime? lastEditAt;
  final DateTime? lastSwitchingAt;
  final List<String>? matching;
  final double? distance;
  final String? phoneNumber;
  final bool? isLike;

  factory MatchProfile.fromJson(Map<String, dynamic> json) => MatchProfile(
        id: json["id"],
        thumbnail: json["thumbnail"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        countryId: json["country_id"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        gender: json["gender"],
        username: json["username"],
        tagline: json["tagline"],
        height: json["height"],
        weight: json["weight"],
        // language: json["language"] == null
        //     ? null
        //     : List.from(json["language"].map((e) => e)),
        occupation: json["occupation"],
        background: json["background"],
        bio: json["bio"],
        description: json["description"] == null
            ? null
            : json["description"] is List<dynamic>
                ? json["description"].toString()
                : json["description"],
        profession: json["profession"] == null
            ? null
            : List<String>.from(json["profession"].map((x) => x)),
        interest: json["interest"] == null
            ? null
            : List<String>.from(json["interest"].map((x) => x)),
        show: json["show"],
        allchat: json["allchat"],
        contact: json["contact"],
        contactSelected: json["contact_selected"],
        showMatching: json["show_matching"],
        settingMatchingDetail: json["setting_matching_detail"],
        deleted: json["deleted"],
        blocked: json["blocked"],
        reason: json["reason"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        lastEditAt: json["lastEditAt"] == null
            ? null
            : DateTime.parse(json["lastEditAt"]),
        lastSwitchingAt: json["lastEditAt"] == null
            ? null
            : DateTime.parse(json["lastEditAt"]),
        matching: json["matching"] == null ? null : List.from(json["matching"]),
        distance: json["distance"] is int
            ? json["distance"].toDouble()
            : json["distance"],
        phoneNumber: json["phone_number"],
        isLike: json["is_like"],
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
        "language": language,
        "occupation": occupation,
        "background": background,
        "show": show,
        "allchat": allchat,
        "contact": contact,
        "contact_selected": contactSelected,
        "show_matching": showMatching,
        "setting_matching_detail": settingMatchingDetail,
        "deleted": deleted,
        "blocked": blocked,
        "reason": reason,
        "createdAt": createdAt!.toIso8601String(),
        "lastEditAt": lastEditAt!.toIso8601String(),
        "lastSwitchingAt": lastSwitchingAt!.toIso8601String(),
        "matching": matching,
        "distance": distance,
        "phone_number": phoneNumber,
        "is_like": isLike,
      };
}
