class KYCPersonalInfoModel {
  String? id;
  String? status;
  String? risk;
  String? individualRemark;
  String? bussinessRemark;
  String? personalFullName;
  String? personalDob;
  String? personalNationality;
  String? personalGender;
  String? personalAddress;
  String? identityType;
  String? identityNumber;
  String? identityImageFront;
  String? identityImageBack;
  String? residenceImage;
  String? selfieImage;
  String? bussinessName;
  String? bussinessCertificateImage;
  String? bussinessAddress;
  String? bussinessAddressImage;
  String? lastEditAt;
  String? createdAt;

  KYCPersonalInfoModel(
      {this.id,
        this.status,
        this.risk,
        this.individualRemark,
        this.bussinessRemark,
        this.personalFullName,
        this.personalDob,
        this.personalNationality,
        this.personalGender,
        this.personalAddress,
        this.identityType,
        this.identityNumber,
        this.identityImageFront,
        this.identityImageBack,
        this.residenceImage,
        this.selfieImage,
        this.bussinessName,
        this.bussinessCertificateImage,
        this.bussinessAddress,
        this.bussinessAddressImage,
        this.lastEditAt,
        this.createdAt});

  KYCPersonalInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    risk = json['risk'];
    individualRemark = json['individualRemark'];
    bussinessRemark = json['bussinessRemark'];
    personalFullName = json['personalFullName'];
    personalDob = json['personalDob'];
    personalNationality = json['personalNationality'];
    personalGender = json['personalGender'];
    personalAddress = json['personalAddress'];
    identityType = json['identityType'];
    identityNumber = json['identityNumber'];
    identityImageFront = json['identityImageFront'];
    identityImageBack = json['identityImageBack'];
    residenceImage = json['residenceImage'];
    selfieImage = json['selfieImage'];
    bussinessName = json['bussinessName'];
    bussinessCertificateImage = json['bussinessCertificateImage'];
    bussinessAddress = json['bussinessAddress'];
    bussinessAddressImage = json['bussinessAddressImage'];
    lastEditAt = json['lastEditAt'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['risk'] = risk;
    data['individualRemark'] = individualRemark;
    data['bussinessRemark'] = bussinessRemark;
    data['personalFullName'] = personalFullName;
    data['personalDob'] = personalDob;
    data['personalNationality'] = personalNationality;
    data['personalGender'] = personalGender;
    data['personalAddress'] = personalAddress;
    data['identityType'] = identityType;
    data['identityNumber'] = identityNumber;
    data['identityImageFront'] = identityImageFront;
    data['identityImageBack'] = identityImageBack;
    data['residenceImage'] = residenceImage;
    data['selfieImage'] = selfieImage;
    data['bussinessName'] = bussinessName;
    data['bussinessCertificateImage'] = bussinessCertificateImage;
    data['bussinessAddress'] = bussinessAddress;
    data['bussinessAddressImage'] = bussinessAddressImage;
    data['lastEditAt'] = lastEditAt;
    data['createdAt'] = createdAt;
    return data;
  }
}


class KYCBeneficiaryModel {
  String? personalFullName;
  String? personalDob;
  String? personalNationality;
  String? personalGender;
  String? personalAddress;
  String? createdAt;
  Kyc? kyc;
  String? identityType;
  String? identityNumber;
  String? identityImageFront;
  String? identityImageBack;
  String? residenceImage;
  String? selfieImage;
  String? lastEditAt;
  String? id;

  KYCBeneficiaryModel(
      {this.personalFullName,
        this.personalDob,
        this.personalNationality,
        this.personalGender,
        this.personalAddress,
        this.createdAt,
        this.kyc,
        this.identityType,
        this.identityNumber,
        this.identityImageFront,
        this.identityImageBack,
        this.residenceImage,
        this.selfieImage,
        this.lastEditAt,
        this.id});

  KYCBeneficiaryModel.fromJson(Map<String, dynamic> json) {
    personalFullName = json['personalFullName'];
    personalDob = json['personalDob'];
    personalNationality = json['personalNationality'];
    personalGender = json['personalGender'];
    personalAddress = json['personalAddress'];
    createdAt = json['createdAt'];
    kyc = json['kyc'] != null ? Kyc.fromJson(json['kyc']) : null;
    identityType = json['identityType'];
    identityNumber = json['identityNumber'];
    identityImageFront = json['identityImageFront'];
    identityImageBack = json['identityImageBack'];
    residenceImage = json['residenceImage'];
    selfieImage = json['selfieImage'];
    lastEditAt = json['lastEditAt'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['personalFullName'] = personalFullName;
    data['personalDob'] = personalDob;
    data['personalNationality'] = personalNationality;
    data['personalGender'] = personalGender;
    data['personalAddress'] = personalAddress;
    data['createdAt'] = createdAt;
    if (kyc != null) {
      data['kyc'] = kyc!.toJson();
    }
    data['identityType'] = identityType;
    data['identityNumber'] = identityNumber;
    data['identityImageFront'] = identityImageFront;
    data['identityImageBack'] = identityImageBack;
    data['residenceImage'] = residenceImage;
    data['selfieImage'] = selfieImage;
    data['lastEditAt'] = lastEditAt;
    data['id'] = id;
    return data;
  }
}

class Kyc {
  String? id;
  String? status;
  String? risk;
  String? individualRemark;
  String? bussinessRemark;
  String? personalFullName;
  String? personalDob;
  String? personalNationality;
  String? personalGender;
  String? personalAddress;
  String? identityType;
  String? identityNumber;
  String? identityImageFront;
  String? identityImageBack;
  String? residenceImage;
  String? selfieImage;
  String? bussinessName;
  String? bussinessCertificateImage;
  String? bussinessAddress;
  String? bussinessAddressImage;
  String? lastEditAt;
  String? createdAt;
  User? user;
  List<Beneficiary>? beneficiary;

  Kyc(
      {this.id,
        this.status,
        this.risk,
        this.individualRemark,
        this.bussinessRemark,
        this.personalFullName,
        this.personalDob,
        this.personalNationality,
        this.personalGender,
        this.personalAddress,
        this.identityType,
        this.identityNumber,
        this.identityImageFront,
        this.identityImageBack,
        this.residenceImage,
        this.selfieImage,
        this.bussinessName,
        this.bussinessCertificateImage,
        this.bussinessAddress,
        this.bussinessAddressImage,
        this.lastEditAt,
        this.createdAt,
        this.user,
        this.beneficiary});

  Kyc.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    risk = json['risk'];
    individualRemark = json['individualRemark'];
    bussinessRemark = json['bussinessRemark'];
    personalFullName = json['personalFullName'];
    personalDob = json['personalDob'];
    personalNationality = json['personalNationality'];
    personalGender = json['personalGender'];
    personalAddress = json['personalAddress'];
    identityType = json['identityType'];
    identityNumber = json['identityNumber'];
    identityImageFront = json['identityImageFront'];
    identityImageBack = json['identityImageBack'];
    residenceImage = json['residenceImage'];
    selfieImage = json['selfieImage'];
    bussinessName = json['bussinessName'];
    bussinessCertificateImage = json['bussinessCertificateImage'];
    bussinessAddress = json['bussinessAddress'];
    bussinessAddressImage = json['bussinessAddressImage'];
    lastEditAt = json['lastEditAt'];
    createdAt = json['createdAt'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['beneficiary'] != String) {
      beneficiary = <Beneficiary>[];
      json['beneficiary'].forEach((v) {
        beneficiary!.add(Beneficiary.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['risk'] = risk;
    data['individualRemark'] = individualRemark;
    data['bussinessRemark'] = bussinessRemark;
    data['personalFullName'] = personalFullName;
    data['personalDob'] = personalDob;
    data['personalNationality'] = personalNationality;
    data['personalGender'] = personalGender;
    data['personalAddress'] = personalAddress;
    data['identityType'] = identityType;
    data['identityNumber'] = identityNumber;
    data['identityImageFront'] = identityImageFront;
    data['identityImageBack'] = identityImageBack;
    data['residenceImage'] = residenceImage;
    data['selfieImage'] = selfieImage;
    data['bussinessName'] = bussinessName;
    data['bussinessCertificateImage'] = bussinessCertificateImage;
    data['bussinessAddress'] = bussinessAddress;
    data['bussinessAddressImage'] = bussinessAddressImage;
    data['lastEditAt'] = lastEditAt;
    data['createdAt'] = createdAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (beneficiary != null) {
      data['beneficiary'] = beneficiary!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  String? id;
  String? email;
  String? lastEmailVerificationAt;
  String? firstName;
  String? phoneNumber;
  String? countryId;
  bool? admin;
  String? subscription;
  String? status;
  bool? deleted;
  String? latitude;
  String? longitude;
  String? lastLoginAt;
  String? lastOTPSend;
  String? createdAt;
  String? lastActiveAt;

  User(
      {this.id,
        this.email,
        this.lastEmailVerificationAt,
        this.firstName,
        this.phoneNumber,
        this.countryId,
        this.admin,
        this.subscription,
        this.status,
        this.deleted,
        this.latitude,
        this.longitude,
        this.lastLoginAt,
        this.lastOTPSend,
        this.createdAt,
        this.lastActiveAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    lastEmailVerificationAt = json['lastEmailVerificationAt'];
    firstName = json['first_name'];
    phoneNumber = json['phone_number'];
    countryId = json['country_id'];
    admin = json['admin'];
    subscription = json['subscription'];
    status = json['status'];
    deleted = json['deleted'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    lastLoginAt = json['lastLoginAt'];
    lastOTPSend = json['lastOTPSend'];
    createdAt = json['createdAt'];
    lastActiveAt = json['lastActiveAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['lastEmailVerificationAt'] = lastEmailVerificationAt;
    data['first_name'] = firstName;
    data['phone_number'] = phoneNumber;
    data['country_id'] = countryId;
    data['admin'] = admin;
    data['subscription'] = subscription;
    data['status'] = status;
    data['deleted'] = deleted;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['lastLoginAt'] = lastLoginAt;
    data['lastOTPSend'] = lastOTPSend;
    data['createdAt'] = createdAt;
    data['lastActiveAt'] = lastActiveAt;
    return data;
  }
}

class Beneficiary {
  String? id;
  String? personalFullName;
  String? personalDob;
  String? personalNationality;
  String? personalGender;
  String? personalAddress;
  String? identityType;
  String? identityNumber;
  String? identityImageFront;
  String? identityImageBack;
  String? residenceImage;
  String? selfieImage;
  String? lastEditAt;
  String? createdAt;

  Beneficiary(
      {this.id,
        this.personalFullName,
        this.personalDob,
        this.personalNationality,
        this.personalGender,
        this.personalAddress,
        this.identityType,
        this.identityNumber,
        this.identityImageFront,
        this.identityImageBack,
        this.residenceImage,
        this.selfieImage,
        this.lastEditAt,
        this.createdAt});

  Beneficiary.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    personalFullName = json['personalFullName'];
    personalDob = json['personalDob'];
    personalNationality = json['personalNationality'];
    personalGender = json['personalGender'];
    personalAddress = json['personalAddress'];
    identityType = json['identityType'];
    identityNumber = json['identityNumber'];
    identityImageFront = json['identityImageFront'];
    identityImageBack = json['identityImageBack'];
    residenceImage = json['residenceImage'];
    selfieImage = json['selfieImage'];
    lastEditAt = json['lastEditAt'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['personalFullName'] = personalFullName;
    data['personalDob'] = personalDob;
    data['personalNationality'] = personalNationality;
    data['personalGender'] = personalGender;
    data['personalAddress'] = personalAddress;
    data['identityType'] = identityType;
    data['identityNumber'] = identityNumber;
    data['identityImageFront'] = identityImageFront;
    data['identityImageBack'] = identityImageBack;
    data['residenceImage'] = residenceImage;
    data['selfieImage'] = selfieImage;
    data['lastEditAt'] = lastEditAt;
    data['createdAt'] = createdAt;
    return data;
  }
}
