import 'package:keepo/models/account/profile_model.dart';

import '../settings_model.dart';
import '../wallet/wallet_model.dart';

class Profile {
  String? fullName;
  String? email;
  String? phoneNumber;
  String? countryId;
  String? dob;
  List<String>? gender;
  List<Wallet>? wallet;
  Settings? settings;

  Profile(
      {String? fullName,
      String? email,
      String? phoneNumber,
      String? countryId,
      String? dob,
      List<String>? gender,
      List<Wallet>? wallet,
      Settings? settings}) {
    if (fullName != null) {
      this.fullName = fullName;
    }
    if (email != null) {
      this.email = email;
    }
    if (phoneNumber != null) {
      this.phoneNumber = phoneNumber;
    }
    if (countryId != null) {
      this.countryId = countryId;
    }
    if (dob != null) {
      this.dob = dob;
    }
    if (gender != null) {
      this.gender = gender;
    }
    if (wallet != null) {
      this.wallet = wallet;
    }
    if (settings != null) {
      this.settings = settings;
    }
  }

  Profile.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    countryId = json['country_id'];
    dob = json['dob'];
    gender = json['gender'].cast<String>();
    if (json['wallet'] != null) {
      wallet = <Wallet>[];
      json['wallet'].forEach((v) {
        wallet!.add(Wallet.fromJson(v));
      });
    }
    settings =
        json['settings'] != null ? Settings.fromJson(json['settings']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['full_name'] = fullName;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['country_id'] = countryId;
    data['dob'] = dob;
    data['gender'] = gender;
    if (wallet != null) {
      data['wallet'] = wallet!.map((v) => v.toJson()).toList();
    }
    if (settings != null) {
      data['settings'] = settings!.toJson();
    }
    return data;
  }
}

class ProfileTemp {
  String? firstName;
  String? lastName;
  String? email;
  String? dob;
  String? countryId;
  String? phoneNumber;
  String? gender;
  String? fcmToken;
  String? password;
  Wallet? wallet;

  ProfileTemp({
    this.firstName,
    this.lastName,
    this.email,
    this.dob,
    this.countryId,
    this.phoneNumber,
    this.gender,
    this.fcmToken,
    this.password,
    this.wallet,
  });

  ProfileTemp.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    dob = json['dob'];
    countryId = json['country_id'];
    phoneNumber = json['phone_number'];
    gender = json['gender'];
    fcmToken = json['fcm_token'];
    password = json['password'];
    wallet = json['wallet'] != null ? Wallet.fromJson(json['wallet']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['dob'] = dob;
    data['country_id'] = countryId;
    data['phone_number'] = phoneNumber;
    data['gender'] = gender;
    data['fcm_token'] = fcmToken;
    data['password'] = password;
    if (wallet != null) {
      data['wallet'] = wallet!.toJson();
    }

    return data;
  }
}

class DetailProfile {
  String? id;
  String? passcode;
  String? fullname;
  String? username;
  String? email;
  String? paymentPin;
  String? phoneNumber;
  String? lastEmailVerificationAt;
  // String? currentDepartementWork;
  // String? description;
  bool? deleted;
  // String? lastEditAt;
  // List<ProfileList>? profile;

  DetailProfile({
    this.id,
    this.passcode,
    this.fullname,
    this.username,
    this.email,
    this.paymentPin,
    this.phoneNumber,
    this.lastEmailVerificationAt,
    // this.currentDepartementWork,
    // this.description,
    this.deleted,
    // this.lastEditAt,
    // this.profile
  });

  DetailProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    passcode = json['passcode'];
    fullname = json['fullname'];
    username = json['username'];
    email = json['email'];
    paymentPin = json['payment_pin'];
    phoneNumber = json['phone_number'];
    lastEmailVerificationAt = json['lastEmailVerificationAt'];
    // currentDepartementWork = json['current_departement_work'];
    // description = json['description'];
    deleted = json['deleted'];
    // lastEditAt = json['lastEditAt'];
    // if (json['profile'] != null) {
    //   profile = <ProfileList>[];
    //   json['profile'].forEach((v) {
    //     profile!.add(ProfileList.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['passcode'] = passcode;
    data['fullname'] = fullname;
    data['username'] = username;
    data['email'] = email;
    data['payment_pin'] = paymentPin;
    data['phone_number'] = phoneNumber;
    data['lastEmailVerificationAt'] = lastEmailVerificationAt;
    // data['current_departement_work'] = currentDepartementWork;
    // data['description'] = description;
    data['deleted'] = deleted;
    //data['lastEditAt'] = lastEditAt;
    // if (profile != null) {
    //   data['profile'] = profile!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

// class DetailProfileData {
//   String? id;
//   String? name;
//   String? firstName;
//   String? lastName;
//   String? countryId;
//   String? dob;
//   String? gender;
//   bool? deleted;
//   String? lastEditAt;

//   DetailProfileData(
//       {this.id,
//       this.name,
//       this.firstName,
//       this.lastName,
//       this.countryId,
//       this.dob,
//       this.gender,
//       this.deleted,
//       this.lastEditAt});

//   DetailProfileData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     countryId = json['country_id'];
//     dob = json['dob'];
//     gender = json['gender'];
//     deleted = json['deleted'];
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
//     data['deleted'] = deleted;
//     data['lastEditAt'] = lastEditAt;
//     return data;
//   }
// }
