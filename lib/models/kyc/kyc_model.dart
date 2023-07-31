import 'package:easy_localization/easy_localization.dart';
import 'package:keepo/enums/status_kyc_enum.dart';

class KYCModel {
  String? id;
  StatusKYC? status;
  StatusKYC? statusBusiness;
  String? risk;
  String? individualRemark;
  String? bussinessRemark;
  bool? personalVerified;
  String? personalRemark;
  String? personalFullName;
  String? personalDob;
  String? personalNationality;
  String? personalGender;
  String? personalAddress;
  bool? identityVerified;
  String? identityRemark;
  String? identityType;
  String? identityNumber;
  String? identityImageFront;
  String? identityImageBack;
  bool? residenceVerified;
  String? residenceRemark;
  String? residenceImage;
  bool? selfieVerified;
  String? selfieRemark;
  String? selfieImage;
  bool? bussinessCertificateVerified;
  String? bussinessCertificateRemark;
  String? bussinessName;
  String? bussinessCertificateImage;
  bool? bussinessAddressVerified;
  String? bussinessAddressRemark;
  String? bussinessAddress;
  String? bussinessAddressImage;
  String? lastEditAt;
  String? createdAt;
  List<Beneficiary>? beneficiary;
  Bearer? bearer;
  String? pathFileIdentityImageFront;
  String? pathFileIdentityImageBack;
  String? pathFileImageResidence;
  String? pathFileImageSelfie;
  bool? businessIndetityVerified;
  bool? businessInformVerified;
  bool? businessBeneficiaryVerified;
  bool? businessBearerVerified;

  KYCModel({
    this.id,
    this.status,
    this.statusBusiness,
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
    this.beneficiary,
    this.bearer,
    this.pathFileIdentityImageBack,
    this.pathFileIdentityImageFront,
    this.pathFileImageResidence,
    this.pathFileImageSelfie,
    this.businessIndetityVerified,
    this.businessInformVerified,
    this.businessBearerVerified,
    this.businessBeneficiaryVerified,
  });

  KYCModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = ((json['status'] ?? "") as String).toEnum();
    statusBusiness = ((json['statusBusiness'] ?? "") as String).toEnum();
    risk = json['risk'];
    individualRemark = json['individualRemark'];
    bussinessRemark = json['bussinessRemark'];
    personalFullName = json['personalFullName'];
    try {
      personalDob = json['personalDob'] == null
          ? null
          : DateFormat('dd MMMM yyyy')
              .format(DateTime.parse(json["personalDob"]));
    } catch (e, s) {
      personalDob = json['personalDob'];
    }
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
    if (json['beneficiary'] != null) {
      beneficiary = <Beneficiary>[];
      json['beneficiary'].forEach((v) {
        beneficiary!.add(Beneficiary.fromJson(v));
      });
    }
    bearer = json['bearer'] != null ? Bearer.fromJson(json['bearer']) : null;
    pathFileIdentityImageFront = json['pathFileIdentityImageFront'];
    pathFileIdentityImageBack = json['pathFileIdentityImageBack'];
    pathFileImageResidence = json['pathFileImageResidence'];
    pathFileImageSelfie = json['pathFileImageSelfie'];
    identityRemark = json['identityRemark'];
    identityVerified = json['identityVerified'];
    personalRemark = json['personalRemark'];
    personalVerified = json['personalVerified'];
    residenceRemark = json['residenceRemark'];
    residenceVerified = json['residenceVerified'];
    selfieRemark = json['selfieRemark'];
    selfieVerified = json['selfieVerified'];
    bussinessAddressVerified = json['bussinessAddressVerified'];
    identityVerified = json['identityVerified'];
    businessIndetityVerified = json['businessIndetityVerified'];
    businessInformVerified = json['businessInformVerified'];
    businessBearerVerified = json['businessBearerVerified'];
    businessBeneficiaryVerified = json['businessBeneficiaryVerified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['statusBusiness'] = statusBusiness;
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
    if (beneficiary != null) {
      data['beneficiary'] = beneficiary!.map((v) => v.toJson()).toList();
    }
    if (bearer != null) {
      data['bearer'] = bearer!.toJson();
    }
    data['pathFileIdentityImageFront'] = pathFileIdentityImageFront;
    data['pathFileIdentityImageBack'] = pathFileIdentityImageBack;
    data['pathFileImageResidence'] = pathFileImageResidence;
    data['pathFileImageSelfie'] = pathFileImageSelfie;

    data['identityRemark'] = identityRemark;
    data['identityVerified'] = identityVerified;
    data['personalRemark'] = personalRemark;
    data['personalVerified'] = personalVerified;
    data['residenceRemark'] = residenceRemark;
    data['residenceVerified'] = residenceVerified;
    data['selfieRemark'] = selfieRemark;
    data['selfieVerified'] = selfieVerified;
    data['businessIndetityVerified'] = businessIndetityVerified;
    data['businessBearerVerified'] = businessBearerVerified;
    data['businessBeneficiaryVerified'] = businessBeneficiaryVerified;
    data['businessInformVerified'] = businessInformVerified;

    return data;
  }
}

class Beneficiary {
  String? id;
  bool? personalVerified;
  String? personalRemark;
  String? personalFullName;
  String? personalDob;
  String? personalNationality;
  String? personalGender;
  String? personalAddress;
  bool? identityVerified;
  String? identityRemark;
  String? identityType;
  String? identityNumber;
  String? identityImageFront;
  String? identityImageBack;
  bool? residenceVerified;
  String? residenceRemark;
  String? residenceImage;
  bool? selfieVerified;
  String? selfieRemark;
  String? selfieImage;
  String? lastEditAt;
  String? createdAt;

  Beneficiary({
    this.id,
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
    this.createdAt,
    this.identityRemark,
    this.identityVerified,
    this.personalRemark,
    this.personalVerified,
    this.residenceRemark,
    this.residenceVerified,
    this.selfieRemark,
    this.selfieVerified,
  });

  Beneficiary.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    personalFullName = json['personalFullName'];
    try {
      personalDob = json['personalDob'] == null
          ? null
          : DateFormat('dd MMMM yyyy')
              .format(DateTime.parse(json["personalDob"]));
    } catch (e, s) {
      personalDob = json['personalDob'];
    }
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
    identityRemark = json['identityRemark'];
    identityVerified = json['identityVerified'];
    personalRemark = json['personalRemark'];
    personalVerified = json['personalVerified'];
    residenceRemark = json['residenceRemark'];
    residenceVerified = json['residenceVerified'];
    selfieRemark = json['selfieRemark'];
    selfieVerified = json['selfieVerified'];
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
    data['identityRemark'] = identityRemark;
    data['identityVerified'] = identityVerified;
    data['personalRemark'] = personalRemark;
    data['personalVerified'] = personalVerified;
    data['residenceRemark'] = residenceRemark;
    data['residenceVerified'] = residenceVerified;
    data['selfieRemark'] = selfieRemark;
    data['selfieVerified'] = selfieVerified;
    return data;
  }
}

class Bearer {
  String? id;
  bool? personalVerified;
  String? personalRemark;
  String? personalFullName;
  String? personalDob;
  String? personalNationality;
  String? personalGender;
  String? personalAddress;
  bool? identityVerified;
  String? identityRemark;
  String? identityType;
  String? identityNumber;
  String? identityImageFront;
  String? identityImageBack;
  bool? residenceVerified;
  String? residenceRemark;
  String? residenceImage;
  bool? selfieVerified;
  String? selfieRemark;
  String? selfieImage;
  String? lastEditAt;
  String? createdAt;

  Bearer({
    this.id,
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
    this.createdAt,
    this.identityRemark,
    this.identityVerified,
    this.personalRemark,
    this.personalVerified,
    this.residenceRemark,
    this.residenceVerified,
    this.selfieRemark,
    this.selfieVerified,
  });

  Bearer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    personalFullName = json['personalFullName'];
    try {
      personalDob = json['personalDob'] == null
          ? null
          : DateFormat('dd MMMM yyyy')
              .format(DateTime.parse(json["personalDob"]));
    } catch (e, s) {
      personalDob = json['personalDob'];
    }
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
    identityRemark = json['identityRemark'];
    identityVerified = json['identityVerified'];
    personalRemark = json['personalRemark'];
    personalVerified = json['personalVerified'];
    residenceRemark = json['residenceRemark'];
    residenceVerified = json['residenceVerified'];
    selfieRemark = json['selfieRemark'];
    selfieVerified = json['selfieVerified'];
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
    data['identityRemark'] = identityRemark;
    data['identityVerified'] = identityVerified;
    data['personalRemark'] = personalRemark;
    data['personalVerified'] = personalVerified;
    data['residenceRemark'] = residenceRemark;
    data['residenceVerified'] = residenceVerified;
    data['selfieRemark'] = selfieRemark;
    data['selfieVerified'] = selfieVerified;
    return data;
  }
}
