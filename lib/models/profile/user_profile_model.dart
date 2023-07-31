import 'dart:convert';

class UserProfileM {
  String? id;
  String? thumbnail;
  String? name;
  String? firstName;
  String? lastName;
  String? countryId;
  String? dob;
  String? gender;
  String? height;
  String? weight;
  List<String>? language;
  String? occupation;
  String? background;
  bool? show;
  bool? allchat;
  bool? contact;
  String? contactSelected;
  bool? deleted;
  dynamic lastEditAt;

  UserProfileM({
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
    this.background,
    this.show,
    this.allchat,
    this.contact,
    this.contactSelected,
    this.deleted,
    this.lastEditAt,
  });

  UserProfileM.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    thumbnail = json['thumbnail'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    countryId = json['country_id'];
    dob = json['dob'];
    gender = json['gender'];
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
    show = json['show'];
    allchat = json['allchat'];
    contact = json['contact'];
    contactSelected = json['contact_selected'];
    deleted = json['deleted'];
    lastEditAt = json['lastEditAt'];
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
    data['height'] = height;
    data['weight'] = weight;
    data['language'] = language;
    data['occupation'] = occupation;
    data['background'] = background;
    data['show'] = show;
    data['allchat'] = allchat;
    data['contact'] = contact;
    data['contact_selected'] = contactSelected;
    data['deleted'] = deleted;
    data['lastEditAt'] = lastEditAt;

    return data;
  }
}

class UserAccountM {
  String? id;
  String? passcode;
  String? fullname;
  String? username;
  String? email;
  String? phoneNumber;
  String? currentDepartementWork;
  String? description;
  bool? deleted;
  String? lastEditAt;

  UserAccountM(
      {this.id,
      this.passcode,
      this.fullname,
      this.username,
      this.email,
      this.phoneNumber,
      this.currentDepartementWork,
      this.description,
      this.deleted,
      this.lastEditAt});

  UserAccountM.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    passcode = json['passcode'];
    fullname = json['fullname'];
    username = json['username'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    currentDepartementWork = json['current_departement_work'];
    description = json['description'];
    deleted = json['deleted'];
    lastEditAt = json['lastEditAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['passcode'] = passcode;
    data['fullname'] = fullname;
    data['username'] = username;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['current_departement_work'] = currentDepartementWork;
    data['description'] = description;
    data['deleted'] = deleted;
    data['lastEditAt'] = lastEditAt;
    return data;
  }
}
