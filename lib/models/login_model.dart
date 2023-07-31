// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.profile,
    this.secretToken,
  });

  final LoginModelProfile? profile;
  final String? secretToken;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        profile: LoginModelProfile.fromJson(json["profile"]),
        secretToken: json["secret_token"],
      );

  Map<String, dynamic> toJson() => {
        "profile": profile!.toJson(),
        "secret_token": secretToken,
      };
}

class LoginModelProfile {
  LoginModelProfile({
    this.id,
    this.email,
    this.password,
    this.firstName,
    this.phoneNumber,
    this.countryId,
    this.admin,
    this.otpNumber,
    this.fcmToken,
    this.subscription,
    this.status,
    this.lastLoginAt,
    this.account,
    this.setting,
    this.profile,
    this.profileDefault,
  });

  final String? id;
  final String? email;
  final String? password;
  final dynamic firstName;
  final String? phoneNumber;
  final String? countryId;
  final bool? admin;
  final String? otpNumber;
  final String? fcmToken;
  final String? subscription;
  final String? status;
  final dynamic lastLoginAt;
  final List<AccountElement>? account;
  final List<dynamic>? setting;
  final List<ProfileElement>? profile;
  final Default? profileDefault;

  factory LoginModelProfile.fromJson(Map<String, dynamic> json) =>
      LoginModelProfile(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        firstName: json["first_name"],
        phoneNumber: json["phone_number"],
        countryId: json["country_id"],
        admin: json["admin"],
        otpNumber: json["otp_number"],
        fcmToken: json["fcm_token"],
        subscription: json["subscription"],
        status: json["status"],
        lastLoginAt: json["lastLoginAt"],
        account: List<AccountElement>.from(
            json["account"].map((x) => AccountElement.fromJson(x))),
        setting: List<dynamic>.from(json["setting"].map((x) => x)),
        profile: List<ProfileElement>.from(
            json["profile"].map((x) => ProfileElement.fromJson(x))),
        profileDefault: Default.fromJson(json["default"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
        "first_name": firstName,
        "phone_number": phoneNumber,
        "country_id": countryId,
        "admin": admin,
        "otp_number": otpNumber,
        "fcm_token": fcmToken,
        "subscription": subscription,
        "status": status,
        "lastLoginAt": lastLoginAt,
        "account": List<dynamic>.from(account!.map((x) => x.toJson())),
        "setting": List<dynamic>.from(setting!.map((x) => x)),
        "profile": List<dynamic>.from(profile!.map((x) => x.toJson())),
        "default": profileDefault!.toJson(),
      };
}

class AccountElement {
  AccountElement({
    this.id,
    this.passcode,
    this.fullname,
    this.username,
    this.email,
    this.phoneNumber,
    this.currentDepartementWork,
    this.description,
    this.deleted,
    this.lastEditAt,
  });

  final String? id;
  final String? passcode;
  final String? fullname;
  final String? username;
  final String? email;
  final String? phoneNumber;
  final dynamic currentDepartementWork;
  final dynamic description;
  final bool? deleted;
  final dynamic lastEditAt;

  factory AccountElement.fromJson(Map<String, dynamic> json) => AccountElement(
        id: json["id"],
        passcode: json["passcode"],
        fullname: json["fullname"],
        username: json["username"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        currentDepartementWork: json["current_departement_work"],
        description: json["description"],
        deleted: json["deleted"],
        lastEditAt: json["lastEditAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "passcode": passcode,
        "fullname": fullname,
        "username": username,
        "email": email,
        "phone_number": phoneNumber,
        "current_departement_work": currentDepartementWork,
        "description": description,
        "deleted": deleted,
        "lastEditAt": lastEditAt,
      };
}

class ProfileElement {
  ProfileElement({
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
    this.bio,
    this.description,
    this.show,
    this.allchat,
    this.contact,
    this.contactSelected,
    this.deleted,
    this.lastEditAt,
  });

  final String? id;
  final dynamic thumbnail;
  final String? name;
  final String? firstName;
  final String? lastName;
  final String? countryId;
  final DateTime? dob;
  final String? gender;
  final dynamic height;
  final dynamic weight;
  final dynamic language;
  final dynamic occupation;
  final dynamic background;
  final dynamic bio;
  final dynamic description;
  final bool? show;
  final bool? allchat;
  final bool? contact;
  final dynamic contactSelected;
  final bool? deleted;
  final dynamic lastEditAt;

  factory ProfileElement.fromJson(Map<String, dynamic> json) => ProfileElement(
        id: json["id"],
        thumbnail: json["thumbnail"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        countryId: json["country_id"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        gender: json["gender"],
        height: json["height"],
        weight: json["weight"],
        language: json["language"],
        occupation: json["occupation"],
        background: json["background"],
        bio: json["bio"],
        description: json["description"],
        show: json["show"],
        allchat: json["allchat"],
        contact: json["contact"],
        contactSelected: json["contact_selected"],
        deleted: json["deleted"],
        lastEditAt: json["lastEditAt"],
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
        "background": background,
        "bio": bio,
        "description": description,
        "show": show,
        "allchat": allchat,
        "contact": contact,
        "contact_selected": contactSelected,
        "deleted": deleted,
        "lastEditAt": lastEditAt,
      };
}

class Default {
  Default({
    this.account,
    this.profile,
  });

  final ProfileClass? account;
  final ProfileClass? profile;

  factory Default.fromJson(Map<String, dynamic> json) => Default(
        account: ProfileClass.fromJson(json["account"]),
        profile: ProfileClass.fromJson(json["profile"]),
      );

  Map<String, dynamic> toJson() => {
        "account": account!.toJson(),
        "profile": profile!.toJson(),
      };
}

class ProfileClass {
  ProfileClass({
    this.id,
    this.username,
  });

  final String? id;
  final String? username;

  factory ProfileClass.fromJson(Map<String, dynamic> json) => ProfileClass(
        id: json["id"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
      };
}
