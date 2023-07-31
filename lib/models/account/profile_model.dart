class ProfileDataAccountM {
  String? id;
  String? email;
  String? password;
  String? firstName;
  String? phoneNumber;
  String? countryId;
  bool? admin;
  String? otpNumber;
  String? fcmToken;
  String? lastLoginAt;
  List<AccountList>? accountList;
  List<ProfileList>? profileList;
  int? age;
  DefaultAccountAndProfile? defaultM;

  ProfileDataAccountM({
    this.id,
    this.email,
    this.password,
    this.firstName,
    this.phoneNumber,
    this.countryId,
    this.admin,
    this.otpNumber,
    this.fcmToken,
    this.lastLoginAt,
    this.accountList,
    this.profileList,
    this.age,
    this.defaultM,
  });

  ProfileDataAccountM.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    firstName = json['first_name'];
    phoneNumber = json['phone_number'];
    countryId = json['country_id'];
    admin = json['admin'];
    otpNumber = json['otp_number'];
    fcmToken = json['fcm_token'];
    lastLoginAt = json['lastLoginAt'];
    if (json['account'] != null) {
      accountList = <AccountList>[];
      json['account'].forEach((v) {
        accountList!.add(AccountList.fromJson(v));
      });
    }
    if (json['profile'] != null) {
      profileList = <ProfileList>[];
      json['profile'].forEach((v) {
        profileList!.add(ProfileList.fromJson(v));
      });
    }
    age = json['age'];
    defaultM = json['default'] != null
        ? DefaultAccountAndProfile.fromJson(json['default'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['password'] = password;
    data['first_name'] = firstName;
    data['phone_number'] = phoneNumber;
    data['country_id'] = countryId;
    data['admin'] = admin;
    data['otp_number'] = otpNumber;
    data['fcm_token'] = fcmToken;
    data['lastLoginAt'] = lastLoginAt;
    if (accountList != null) {
      data['account'] = accountList!.map((v) => v.toJson()).toList();
    }
    if (profileList != null) {
      data['profile'] = profileList!.map((v) => v.toJson()).toList();
    }
    data['age'] = age;
    data['default'] = defaultM;
    return data;
  }
}

class AccountList {
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

  AccountList(
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

  AccountList.fromJson(Map<String, dynamic> json) {
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

class ProfileList {
  ProfileList({
    this.id,
    this.name,
    this.firstName,
    this.lastName,
    this.countryId,
    this.dob,
    this.gender,
    this.deleted,
    this.lastEditAt,
  });

  final String? id;
  final String? name;
  final String? firstName;
  final String? lastName;
  final dynamic countryId;
  final dynamic dob;
  final String? gender;
  final bool? deleted;
  final dynamic lastEditAt;

  factory ProfileList.fromJson(Map<String, dynamic> json) => ProfileList(
        id: json["id"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        countryId: json["country_id"],
        dob: json["dob"],
        gender: json["gender"],
        deleted: json["deleted"],
        lastEditAt: json["lastEditAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "country_id": countryId,
        "dob": dob,
        "gender": gender,
        "deleted": deleted,
        "lastEditAt": lastEditAt,
      };
}

class DefaultAccountAndProfile {
  DefaultAccount? account;
  DefaultProfile? profile;

  DefaultAccountAndProfile({this.account, this.profile});

  DefaultAccountAndProfile.fromJson(Map<String, dynamic> json) {
    account = json['account'] != null
        ? DefaultAccount.fromJson(json['account'])
        : null;
    profile = json['profile'] != null
        ? DefaultProfile.fromJson(json['profile'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (account != null) {
      data['account'] = account!.toJson();
    }
    if (profile != null) {
      data['profile'] = profile!.toJson();
    }
    return data;
  }
}

class DefaultAccount {
  String? id;
  String? username;

  DefaultAccount({this.id, this.username});

  DefaultAccount.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    return data;
  }
}

class DefaultProfile {
  String? id;
  String? username;

  DefaultProfile({this.id, this.username});

  DefaultProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    return data;
  }
}
