class Register {
  String? fullName;
  String? password;
  String? email;
  String? dob;
  String? gender;
  String? countryId;
  String? phoneNumber;
  String? fcmToken;

  Register(
      {this.fullName,
      this.password,
      this.email,
      this.dob,
      this.gender,
      this.countryId,
      this.phoneNumber,
      this.fcmToken});

  Register.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    password = json['password'];
    email = json['email'];
    dob = json['dob'];
    gender = json['gender'];
    countryId = json['country_id'];
    phoneNumber = json['phone_number'];
    fcmToken = json['fcm_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['full_name'] = fullName;
    data['password'] = password;
    data['email'] = email;
    data['dob'] = dob;
    data['gender'] = gender;
    data['country_id'] = countryId;
    data['phone_number'] = phoneNumber;

    data['fcm_token'] = fcmToken;

    return data;
  }
}
