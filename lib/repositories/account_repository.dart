import 'dart:io';

import 'package:dio/dio.dart';
import 'package:keepo/enums/module_enum.dart';
import 'package:keepo/helper/base_repository.dart';
import 'package:keepo/models/account/account_model.dart';
import 'package:keepo/utils/endpoint.dart';
import 'package:keepo/utils/string.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../helper/base_response.dart';
import '../models/account/profile_model.dart';

class AccountRepository extends BaseRepository {
  Future<BaseResponse> createAccountR(
    String fullName,
    String username,
    String passcode,
    String gender,
    String email,
    String phoneNumber,
    String currentDepartementWork,
    String description,
  ) async {
    final res = await post(
      createAccountUrl,
      data: {
        'full_name': fullName,
        'username': username,
        'passcode': passcode,
        'gender': gender,
        'email': email,
        'phone_number': phoneNumber,
        'current_departement_work': currentDepartementWork,
        'description': description
      },
    );
    if (res.status == 'success') {
      return BaseResponse(
        status: res.status,
        message: res.message,
        data: res.data,
        serverTime: res.serverTime,
      );
    } else {
      return BaseResponse(
        status: res.status,
        message: res.message,
        data: res.data,
        serverTime: res.serverTime,
      );
    }
  }

  Future<BaseResponse> setPasscodeR(String code) async {
    final res = await post(settingAccountUrl, data: {
      'passcode': code,
    });

    if (res.status == 'success') {
      return BaseResponse(
        status: res.status,
        message: res.message,
        data: res.data ?? '',
        serverTime: res.serverTime,
      );
    } else {
      return BaseResponse(
        status: res.status,
        message: res.message,
        data: res.data,
        serverTime: res.serverTime,
      );
    }
  }

  Future<BaseResponse> getAccountGlobal() async {
    final res = await get(getAccountUrl);

    if (res.status == 'success') {
      final data = AccountData.fromJson(res.data);

      return BaseResponse(
        data: data,
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

  Future<BaseResponse> getListAccountAndProfile() async {
    final res = await get(getProfile);

    if (res.status == 'success') {
      final data = ProfileDataAccountM.fromJson(res.data['profile']);
      return BaseResponse(
        data: data,
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

  Future<BaseResponse> editAccountR(
    String? accountId,
    String? fullName,
    String? username,
    String? passcode,
    String? email,
    String? phoneNumber,
    String? currentDepartementWork,
    String? description,
  ) async {
    final res = await put(editAccountUrl, data: {
      'accountId': accountId,
      'full_name': fullName,
      'username': username,
      'passcode': passcode,
      'email': email,
      'phone_number': phoneNumber,
      'current_departement_work': currentDepartementWork,
      'description': description
    });
    if (res.status == 'success') {
      return BaseResponse(
        status: res.status,
        message: res.message,
        data: res.data,
        serverTime: res.serverTime,
      );
    } else {
      return BaseResponse(
        status: res.status,
        message: res.message,
        data: res.data,
        serverTime: res.serverTime,
      );
    }
  }

  Future<BaseResponse> deleteAccountR(
    String accountId,
  ) async {
    final res = await delete(deleteAccountUrl, data: {
      'accountId': accountId,
    });

    if (res.status == 'success') {
      return BaseResponse(
        status: res.status,
        message: res.message,
        data: res.data,
        serverTime: res.serverTime,
      );
    } else {
      return BaseResponse(
        status: res.status,
        message: res.message,
        data: res.data,
        serverTime: res.serverTime,
      );
    }
  }

  Future<BaseResponse> switchAccountOrProfile({
    String? accountId,
    String? passcode,
    String? profileId,
  }) async {
    final res = await post(switchingUrl, data: {
      'accountId': accountId,
      'passcode': passcode,
      'profileId': profileId
    });
    // final res = await get(switchingUrl, queryParams: {
    //   'accountId': accountId,
    //   'passcode': passcode,
    //   'profileId': profileId
    // });

    if (res.status == 'success') {
      // if (res.data['secret_token'] != null) {
      //   GetIt.I<FlutterSecureStorage>().delete(key: tokenUser);
      //   GetIt.I<FlutterSecureStorage>()
      //       .write(key: tokenUser, value: res.data['secret_token']);
      // }
      // print(res.data['secret_token']);

      return BaseResponse(
        status: res.status,
        message: res.message,
        data: res.data,
        serverTime: res.serverTime,
      );
    } else {
      return BaseResponse(
        status: res.status,
        message: res.message,
        data: res.data,
        serverTime: res.serverTime,
      );
    }
  }

  Future<BaseResponse> checkPasscodeR(String passcode) async {
    final res = await post(
      checkPasscodeUrl,
      data: {
        'passcode': passcode,
      },
    );

    if (res.status == 'success') {
      return BaseResponse(
        status: res.status,
        message: res.message,
        data: res.data,
        serverTime: res.serverTime,
      );
    } else {
      return BaseResponse(
        status: res.status,
        message: res.message,
        data: res.data,
        serverTime: res.serverTime,
      );
    }
  }

  Future<BaseResponse> checkEmailOTPR(String otp) async {
    final res = await post(
      emailOtpUrl,
      data: {
        'otp': otp,
      },
    );

    if (res.status == 'success') {
      return BaseResponse(
        status: res.status,
        message: res.message,
        data: res.data,
        serverTime: res.serverTime,
      );
    } else {
      return BaseResponse(
        status: res.status,
        message: res.message,
        data: res.data,
        serverTime: res.serverTime,
      );
    }
  }

  Future<BaseResponse> report({
    required ModuleEnum type,
    required String id,
    required String profileId,
    required String reason,
    String? images,
  }) async {
    File file = File(images ?? '');
    var fileName = file.path.split('/').last;
    final res = await postFromData(reportUrl, data: {
      'type': type.type,
      '${type.type.toLowerCase()}Id': id,
      'profileId': profileId,
      'reason': reason,
      'images': images == null
          ? null
          : await MultipartFile.fromFile(file.path, filename: fileName)
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

  Future<BaseResponse> changeAddPhoneR({
    String? phone,
    String? countryId,
  }) async {
    final readAccountId =
        await GetIt.I<FlutterSecureStorage>().read(key: accountId);
    final res = await post(
      changeAddPhoneUrl,
      data: {
        "accId": readAccountId,
        "phone_number": phone,
        "country_id": countryId,
      },
    );

    if (res.status == 'success') {
      return BaseResponse(
        status: res.status,
        message: res.message,
        data: res.data,
        serverTime: res.serverTime,
      );
    } else {
      return BaseResponse(
        status: res.status,
        message: res.message,
        data: res.data,
        serverTime: res.serverTime,
      );
    }
  }

  Future<BaseResponse> verifPhoneR({
    required String phone,
    required String countryId,
  }) async {
    final readAccountId =
        await GetIt.I<FlutterSecureStorage>().read(key: accountId);
    final res = await post(
      verifPhoneUrl,
      data: {
        "accId": readAccountId,
        "phone_number": phone,
        "country_id": countryId,
      },
    );

    if (res.status == 'success') {
      return BaseResponse(
        status: res.status,
        message: res.message,
        data: res.data,
        serverTime: res.serverTime,
      );
    } else {
      return BaseResponse(
        status: res.status,
        message: res.message,
        data: res.data,
        serverTime: res.serverTime,
      );
    }
  }

  Future<BaseResponse> verifOTPPhoneR({
    required String phone,
    required String countryId,
    required String otp,
  }) async {
    final readAccountId =
        await GetIt.I<FlutterSecureStorage>().read(key: accountId);
    final res = await post(
      changeAddPhoneUrl,
      data: {
        "accId": readAccountId,
        "phone_number": phone,
        "country_id": countryId,
        "otp_number": otp
      },
    );

    if (res.status == 'success') {
      return BaseResponse(
        status: res.status,
        message: res.message,
        data: res.data,
        serverTime: res.serverTime,
      );
    } else {
      return BaseResponse(
        status: res.status,
        message: res.message,
        data: res.data,
        serverTime: res.serverTime,
      );
    }
  }
}
