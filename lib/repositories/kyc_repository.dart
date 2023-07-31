import 'dart:io';

import 'package:dio/dio.dart';
import 'package:keepo/helper/base_repository.dart';
import 'package:keepo/helper/base_response.dart';
import 'package:keepo/models/kyc/kyc_model.dart';
import 'package:keepo/models/kyc/kyc_personal_info_model.dart';
import 'package:keepo/utils/endpoint.dart';
import 'package:path/path.dart' as p;

class KYCRepository extends BaseRepository {
  Future<BaseResponse> getKYCData() async {
    final res = await get(kycPersonalInformationUrl);

    if (res.status == 'success') {
      return BaseResponse(
        data: res.data,
        message: res.message,
        status: res.status,
        serverTime: res.serverTime,
      );
    } else {
      return BaseResponse(
        data: res.data,
        message: res.message,
        status: res.status,
        serverTime: res.serverTime,
      );
    }
  }

  Future<BaseResponse> postKYCPersonalInformation({
    required String? personalFullName,
    required String? personalDob,
    required String? personalNationality,
    required String? personalGender,
    required String? personalAddress,
  }) async {
    final res = await post(kycPersonalInformationUrl, data: {
      'personalFullName': personalFullName,
      'personalDob': personalDob,
      'personalNationality': personalNationality,
      'personalGender': personalGender,
      'personalAddress': personalAddress,
      'status': "Pending Review"
    });

    if (res.status == 'success') {
      final kycResp = KYCPersonalInfoModel.fromJson(res.data);

      return BaseResponse(
        data: kycResp,
        message: res.message,
        status: res.status,
        serverTime: res.serverTime,
      );
    } else {
      return BaseResponse(
        data: res.data,
        message: res.message,
        status: res.status,
        serverTime: res.serverTime,
      );
    }
  }

  Future<BaseResponse> postKYCIDCard({
    required String kycId,
    required String? identityType,
    required String? identityNumber,
    required File? identityImageFront,
    required File? identityImageBack,
  }) async {
    final res = await postFromData(kycPassportIDCardProofUrl, data: {
      'kycId': kycId,
      'identityType': identityType,
      'identityNumber': identityNumber,
      'identityImageFront': identityImageFront == null
          ? null
          : await MultipartFile.fromFile(
              identityImageFront.path,
              filename: p.basename(identityImageFront.path),
            ),
      'identityImageBack': identityImageBack == null
          ? null
          : await MultipartFile.fromFile(
              identityImageBack.path,
              filename: p.basename(identityImageBack.path),
            ),
    });

    if (res.status == 'success') {
      return BaseResponse(
        data: res.data,
        message: res.message,
        status: res.status,
        serverTime: res.serverTime,
      );
    } else {
      return BaseResponse(
        data: res.data,
        message: res.message,
        status: res.status,
        serverTime: res.serverTime,
      );
    }
  }

  Future<BaseResponse> postKYCSelfie({
    required String kycId,
    required File? selfieImage,
  }) async {
    final res = await postFromData(kycPersonalSelfieProofUrl, data: {
      'selfieImage': selfieImage == null
          ? null
          : await MultipartFile.fromFile(
              selfieImage.path,
              filename: p.basename(selfieImage.path),
            ),
      'kycId': kycId,
    });

    if (res.status == 'success') {
      return BaseResponse(
        data: res.data,
        message: res.message,
        status: res.status,
        serverTime: res.serverTime,
      );
    } else {
      return BaseResponse(
        data: res.data,
        message: res.message,
        status: res.status,
        serverTime: res.serverTime,
      );
    }
  }

  Future<BaseResponse> postKYCResidence({
    required String kycId,
    required File? residenceImage,
  }) async {
    final res = await postFromData(kycPersonalResidenceProofUrl, data: {
      'residenceImage': residenceImage == null
          ? null
          : await MultipartFile.fromFile(
              residenceImage.path,
              filename: p.basename(residenceImage.path),
            ),
      'kycId': kycId,
    });

    if (res.status == 'success') {
      return BaseResponse(
        data: res.data,
        message: res.message,
        status: res.status,
        serverTime: res.serverTime,
      );
    } else {
      return BaseResponse(
        data: res.data,
        message: res.message,
        status: res.status,
        serverTime: res.serverTime,
      );
    }
  }

  Future<BaseResponse> postKYCBusinessCertificate({
    required String kycId,
    required String businessCertificateName,
    required File? businessCertificateImage,
  }) async {
    final res = await postFromData(kycBusinessCertificateUrl, data: {
      'bussinessCertificateImage': businessCertificateImage == null
          ? null
          : await MultipartFile.fromFile(
              businessCertificateImage.path,
              filename: p.basename(businessCertificateImage.path),
            ),
      'kycId': kycId,
      'bussinessName': businessCertificateName,
    });

    if (res.status == 'success') {
      return BaseResponse(
        data: res.data,
        message: res.message,
        status: res.status,
        serverTime: res.serverTime,
      );
    } else {
      return BaseResponse(
        data: res.data,
        message: res.message,
        status: res.status,
        serverTime: res.serverTime,
      );
    }
  }

  Future<BaseResponse> postKYCBusinessAddress({
    required String kycId,
    required String businessAddressName,
    required File? businessAddressImage,
  }) async {
    final res = await postFromData(kycBusinessAddressUrl, data: {
      'bussinessAddressImage': businessAddressImage == null
          ? null
          : await MultipartFile.fromFile(
              businessAddressImage.path,
              filename: p.basename(businessAddressImage.path),
            ),
      'kycId': kycId,
      'bussinessAddress': businessAddressName,
      "status": "Pending Submission"
    });

    if (res.status == 'success') {
      return BaseResponse(
        data: res.data,
        message: res.message,
        status: res.status,
        serverTime: res.serverTime,
      );
    } else {
      return BaseResponse(
        data: res.data,
        message: res.message,
        status: res.status,
        serverTime: res.serverTime,
      );
    }
  }

  Future<BaseResponse> postKYCBeneficiaryPersonalInformation({
    required String kycId,
    String? beneficiaryId,
    required String? personalFullName,
    required String? personalDob,
    required String? personalNationality,
    required String? personalGender,
    required String? personalAddress,
  }) async {
    final res = await post(kycBusinessBeneficiaryPersonalInfoUrl, data: {
      'kycId': kycId,
      'beneficiaryId': beneficiaryId,
      'personalFullName': personalFullName,
      'personalDob': personalDob,
      'personalNationality': personalNationality,
      'personalGender': personalGender,
      'personalAddress': personalAddress,
    });

    if (res.status == 'success') {
      return BaseResponse(
        data: res.data,
        message: res.message,
        status: res.status,
        serverTime: res.serverTime,
      );
    } else {
      return BaseResponse(
        data: res.data,
        message: res.message,
        status: res.status,
        serverTime: res.serverTime,
      );
    }
  }

  Future<BaseResponse> postKYCBeneficiaryIDCard({
    required String kycId,
    String? beneficiaryId,
    required String? identityType,
    required String? identityNumber,
    required File? identityImageFront,
    required File? identityImageBack,
  }) async {
    final res =
        await postFromData(kycBusinessBeneficiaryIDCardPassportUrl, data: {
      'kycId': kycId,
      'beneficiaryId': beneficiaryId,
      'identityType': identityType,
      'identityNumber': identityNumber,
      'identityImageFront': identityImageFront == null
          ? null
          : await MultipartFile.fromFile(
              identityImageFront.path,
              filename: p.basename(identityImageFront.path),
            ),
      'identityImageBack': identityImageBack == null
          ? null
          : await MultipartFile.fromFile(
              identityImageBack.path,
              filename: p.basename(identityImageBack.path),
            ),
    });

    if (res.status == 'success') {
      return BaseResponse(
        data: res.data,
        message: res.message,
        status: res.status,
        serverTime: res.serverTime,
      );
    } else {
      return BaseResponse(
        data: res.data,
        message: res.message,
        status: res.status,
        serverTime: res.serverTime,
      );
    }
  }

  Future<BaseResponse> postKYCBeneficiarySelfie({
    required String kycId,
    String? beneficiaryId,
    required File? selfieImage,
  }) async {
    final res = await postFromData(kycBusinessBeneficiarySelfieUrl, data: {
      'selfieImage': selfieImage == null
          ? null
          : await MultipartFile.fromFile(
              selfieImage.path,
              filename: p.basename(selfieImage.path),
            ),
      'kycId': kycId,
      'beneficiaryId': beneficiaryId
    });

    if (res.status == 'success') {
      return BaseResponse(
        data: res.data,
        message: res.message,
        status: res.status,
        serverTime: res.serverTime,
      );
    } else {
      return BaseResponse(
        data: res.data,
        message: res.message,
        status: res.status,
        serverTime: res.serverTime,
      );
    }
  }

  Future<BaseResponse> postKYCBeneficiaryResidence({
    required String kycId,
    String? beneficiaryId,
    required File? residenceImage,
  }) async {
    final res =
        await postFromData(kycBusinessBeneficiaryProofResidenceUrl, data: {
      'residenceImage': residenceImage == null
          ? null
          : await MultipartFile.fromFile(
              residenceImage.path,
              filename: p.basename(residenceImage.path),
            ),
      'kycId': kycId,
      'beneficiaryId': beneficiaryId
    });

    if (res.status == 'success') {
      return BaseResponse(
        data: res.data,
        message: res.message,
        status: res.status,
        serverTime: res.serverTime,
      );
    } else {
      return BaseResponse(
        data: res.data,
        message: res.message,
        status: res.status,
        serverTime: res.serverTime,
      );
    }
  }

  Future<BaseResponse> postKYCBearerPersonalInformation({
    String? kycId,
    required String? personalFullName,
    required String? personalDob,
    required String? personalNationality,
    required String? personalGender,
    required String? personalAddress,
  }) async {
    final res = await post(kycBusinessBearerPersonalInfoUrl, data: {
      'kycId': kycId,
      'personalFullName': personalFullName,
      'personalDob': personalDob,
      'personalNationality': personalNationality,
      'personalGender': personalGender,
      'personalAddress': personalAddress,
      'status': "Pending Review"
    });

    if (res.status == 'success') {
      // final kycResp = KYCPersonalInfoModel.fromJson(res.data);

      return BaseResponse(
        data: res.data,
        message: res.message,
        status: res.status,
        serverTime: res.serverTime,
      );
    } else {
      return BaseResponse(
        data: res.data,
        message: res.message,
        status: res.status,
        serverTime: res.serverTime,
      );
    }
  }

  Future<BaseResponse> postKYCBearerIDCard({
    required String kycId,
    required String bearerId,
    required String? identityType,
    required String? identityNumber,
    required File? identityImageFront,
    required File? identityImageBack,
  }) async {
    final res = await postFromData(kycBusinessBearerIDCardPassportUrl, data: {
      'kycId': kycId,
      'bearerId': bearerId,
      'identityType': identityType,
      'identityNumber': identityNumber,
      'identityImageFront': identityImageFront == null
          ? null
          : await MultipartFile.fromFile(
              identityImageFront.path,
              filename: p.basename(identityImageFront.path),
            ),
      'identityImageBack': identityImageBack == null
          ? null
          : await MultipartFile.fromFile(
              identityImageBack.path,
              filename: p.basename(identityImageBack.path),
            ),
    });

    if (res.status == 'success') {
      return BaseResponse(
        data: res.data,
        message: res.message,
        status: res.status,
        serverTime: res.serverTime,
      );
    } else {
      return BaseResponse(
        data: res.data,
        message: res.message,
        status: res.status,
        serverTime: res.serverTime,
      );
    }
  }

  Future<BaseResponse> postKYCBearerSelfie({
    required String kycId,
    required String bearerId,
    required File? selfieImage,
  }) async {
    final res = await postFromData(kycBusinessBearerSelfieUrl, data: {
      'selfieImage': selfieImage == null
          ? null
          : await MultipartFile.fromFile(
              selfieImage.path,
              filename: p.basename(selfieImage.path),
            ),
      'kycId': kycId,
      'bearerId': bearerId
    });

    if (res.status == 'success') {
      return BaseResponse(
        data: res.data,
        message: res.message,
        status: res.status,
        serverTime: res.serverTime,
      );
    } else {
      return BaseResponse(
        data: res.data,
        message: res.message,
        status: res.status,
        serverTime: res.serverTime,
      );
    }
  }

  Future<BaseResponse> postKYCBearerResidence({
    required String kycId,
    required String bearerId,
    required File? residenceImage,
  }) async {
    final res = await postFromData(kycBusinessBearerProofResidenceUrl, data: {
      'residenceImage': residenceImage == null
          ? null
          : await MultipartFile.fromFile(
              residenceImage.path,
              filename: p.basename(residenceImage.path),
            ),
      'kycId': kycId,
      'bearerId': bearerId
    });

    if (res.status == 'success') {
      return BaseResponse(
        data: res.data,
        message: res.message,
        status: res.status,
        serverTime: res.serverTime,
      );
    } else {
      return BaseResponse(
        data: res.data,
        message: res.message,
        status: res.status,
        serverTime: res.serverTime,
      );
    }
  }

  Future<BaseResponse> postBeneficiariesArray({
    required List<String> kycId,
    required List<String?> beneficiariesId,
    required List<String> personalFullName,
    required List<String> personalDob,
    required List<String> personalNationality,
    required List<String> personalGender,
    required List<String> personalAddress,
    required List<File?> residenceImage,
    required List<File?> selfieImage,
    required List<String> identityType,
    required List<String> identityNumber,
    required List<File?> identityImageFront,
    required List<File?>? identityImageBack,
  }) async {
    var listFrontIdToMultipart = [];
    var listBackIdToMultipart = [];
    var listSelfieToMultipart = [];
    var listResidenceImageToMultipart = [];
    for (var i in identityImageFront) {
      listFrontIdToMultipart.add(i == null
          ? null
          : await MultipartFile.fromFile(
              i.path,
              filename: i.path.split('/').last,
            ));
    }
    for (var i in identityImageBack ?? []) {
      listBackIdToMultipart.add(i == null
          ? null
          : await MultipartFile.fromFile(
              i!.path,
              filename: i.path.split('/').last,
            ));
    }
    for (var i in selfieImage) {
      listSelfieToMultipart.add(i == null
          ? null
          : await MultipartFile.fromFile(
              i.path,
              filename: i.path.split('/').last,
            ));
    }
    for (var i in residenceImage) {
      listResidenceImageToMultipart.add(i == null
          ? null
          : await MultipartFile.fromFile(
              i.path,
              filename: i.path.split('/').last,
            ));
    }

    final res = await postFromData(kycBusinessBeneficiaryArray, data: {
      'kycId[]': kycId,
      'beneficiaryId[]': beneficiariesId,
      'personalFullName[]': personalFullName,
      'personalDob[]': personalDob,
      'personalNationality[]': personalNationality,
      'personalGender[]': personalGender,
      'personalAddress[]': personalAddress,
      'identityType[]': identityType,
      'identityNumber[]': identityNumber,
      'identityImageFront[]': listFrontIdToMultipart,
      'identityImageBack[]': listBackIdToMultipart,
      'residenceImage[]': listResidenceImageToMultipart,
      'selfieImage[]': listSelfieToMultipart,
    });

    if (res.status == 'success') {
      return BaseResponse(
        data: res.data,
        message: res.message,
        status: res.status,
        serverTime: res.serverTime,
      );
    } else {
      return BaseResponse(
        data: res.data,
        message: res.message,
        status: res.status,
        serverTime: res.serverTime,
      );
    }
  }

  Future<BaseResponse> deleteKYCBeneficiary({
    required String? kycId,
    required String? beneficiaryId,
  }) async {
    final res = await delete(kycBusinessBeneficiaryDelete, data: {
      'kycId': kycId,
      'beneficiaryId': beneficiaryId,
    });

    if (res.status == 'success') {
      return BaseResponse(
        data: res.data,
        message: res.message,
        status: res.status,
        serverTime: res.serverTime,
      );
    } else {
      return BaseResponse(
        data: res.data,
        message: res.message,
        status: res.status,
        serverTime: res.serverTime,
      );
    }
  }
}
