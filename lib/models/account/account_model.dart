class AccountData {
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
  List<ProfileData>? profile;

  AccountData(
      {this.id,
      this.passcode,
      this.fullname,
      this.username,
      this.email,
      this.phoneNumber,
      this.currentDepartementWork,
      this.description,
      this.deleted,
      this.lastEditAt,
      this.profile});

  AccountData.fromJson(Map<String, dynamic> json) {
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
    if (json['profile'] != null) {
      profile = <ProfileData>[];
      json['profile'].forEach((v) {
        profile!.add(ProfileData.fromJson(v));
      });
    }
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
    if (profile != null) {
      data['profile'] = profile!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProfileData {
  String? id;
  String? name;
  String? firstName;
  String? lastName;
  String? countryId;
  String? dob;
  String? gender;
  String? accountId;
  bool? deleted;
  String? lastEditAt;

  ProfileData(
      {this.id,
      this.name,
      this.firstName,
      this.lastName,
      this.countryId,
      this.dob,
      this.gender,
      this.accountId,
      this.deleted,
      this.lastEditAt});

  ProfileData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    countryId = json['country_id'];
    dob = json['dob'];
    gender = json['gender'];
    accountId = json['accountId'];
    deleted = json['deleted'];
    lastEditAt = json['lastEditAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['country_id'] = countryId;
    data['dob'] = dob;
    data['gender'] = gender;
    data['accountId'] = accountId;
    data['deleted'] = deleted;
    data['lastEditAt'] = lastEditAt;
    return data;
  }
}



// class ProfileData {
//   String? id;
//   String? name;
//   String? firstName;
//   String? lastName;
//   String? countryId;
//   String? dob;
//   String? gender;
//   String? lastEditAt;

//   ProfileData(
//       {this.id,
//       this.name,
//       this.firstName,
//       this.lastName,
//       this.countryId,
//       this.dob,
//       this.gender,
//       this.lastEditAt});

//   ProfileData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     countryId = json['country_id'];
//     dob = json['dob'];
//     gender = json['gender'];
//     lastEditAt = json['lastEditAt'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['first_name'] = firstName;
//     data['last_name'] = lastName;
//     data['country_id'] = countryId;
//     data['dob'] = dob;
//     data['gender'] = gender;
//     data['lastEditAt'] = lastEditAt;
//     return data;
//   }
// }

// class AccountData {
//   String? id;
//   String? passcode;
//   String? fullname;
//   String? username;
//   String? email;
//   String? phoneNumber;
//   bool? deleted;
//   String? lastEditAt;

//   AccountData(
//       {this.id,
//       this.passcode,
//       this.fullname,
//       this.username,
//       this.email,
//       this.phoneNumber,
//       this.deleted,
//       this.lastEditAt});

//   AccountData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     passcode = json['passcode'];
//     fullname = json['fullname'];
//     username = json['username'];
//     email = json['email'];
//     phoneNumber = json['phone_number'];
//     deleted = json['deleted'];
//     lastEditAt = json['lastEditAt'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['passcode'] = passcode;
//     data['fullname'] = fullname;
//     data['username'] = username;
//     data['email'] = email;
//     data['phone_number'] = phoneNumber;
//     data['deleted'] = deleted;
//     data['lastEditAt'] = lastEditAt;
//     return data;
//   }
// }

