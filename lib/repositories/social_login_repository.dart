import 'package:keepo/helper/base_response.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:keepo/models/social_login/social_login.dart';

import '../helper/base_repository.dart';
import '../utils/endpoint.dart';
import '../utils/string.dart';

class SocialLoginRepository extends BaseRepository {
  Future<BaseResponse> getSocialLoginR() async {
    final res = await get(socialUrl);
    if (res.status == 'success') {
      final List<SocialLogin> data =
          List.from(res.data).map((e) => SocialLogin.fromJson(e)).toList();
      return BaseResponse(
        status: res.status,
        message: res.message,
        data: data,
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

  Future<BaseResponse> connectSocialAccountR(
      {required dynamic data, required String provider}) async {
    final res = await post(
      connectSocialUrl,
      data: {
        'social_provider': provider,
        'social_data': data,
      },
    );
    GetIt.I<FlutterSecureStorage>()
        .write(key: serverTime, value: res.serverTime);
    GetIt.I<FlutterSecureStorage>().write(key: socialProvider, value: provider);

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

  Future<BaseResponse> disconnectSocialAccountR(
      {required String socialId}) async {
    final res = await post(
      disconnectSocialUrl,
      data: {
        'socialId': socialId,
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

  Future<BaseResponse> replaceSocialAccountR({
    required dynamic data,
    required String provider,
    required String socialId,
  }) async {
    final res = await post(
      replaceSocialUrl,
      data: {
        'socialId': socialId,
        'social_provider': provider,
        'social_data': data,
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
