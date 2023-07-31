import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:keepo/helper/base_repository.dart';
import 'package:keepo/helper/base_response.dart';
import 'package:keepo/models/company_model.dart';
import 'package:keepo/models/profile/user_profile_model.dart';
import 'package:keepo/services/socket_service.dart';
import 'package:keepo/utils/app_routes.dart';
import 'package:keepo/utils/endpoint.dart';
import 'package:keepo/utils/string.dart';

import '../models/auth/auth_apple.dart';
import '../models/auth/auth_facebook.dart';
import '../models/auth/auth_google.dart';
import '../models/terms_privacy_model.dart';
import '../services/navigation.dart';
import '../services/notification_services.dart';

class AuthRepository extends BaseRepository {
  // final _storage = GetStorage();
  Future<BaseResponse> loginR(String countryId, String username,
      String password, String fcmToken) async {
    final res = await login(
      loginUrl,
      data: {
        'country_id': countryId,
        'username': username,
        'password': password,
        'fcm_token': fcmToken,
      },
    );
    if (res.status == 'success') {
      final user = UserProfileM.fromJson(res.data);

      GetIt.I<FlutterSecureStorage>()
          .write(key: serverTime, value: res.serverTime);

      // GetIt.I<UserService>().setUser = user;

      return BaseResponse(
        status: res.status,
        message: res.message,
        data: user,
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

  Future<BaseResponse> loginFacebookR({required FacebookLogin data}) async {
    final res = await login(
      loginUrl,
      data: {
        'social_provider': 'facebook',
        'social_data': data,
        'fcm_token': await HelperNotification().getFcmToken()
      },
    );
    GetIt.I<FlutterSecureStorage>()
        .write(key: serverTime, value: res.serverTime);
    GetIt.I<FlutterSecureStorage>()
        .write(key: socialProvider, value: 'facebook');
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

  Future<BaseResponse> loginGoogleR({required GoogleSocialData data}) async {
    final res = await login(
      loginUrl,
      data: {
        'social_provider': 'google',
        'social_data': data,
        'fcm_token': await HelperNotification().getFcmToken()
      },
    );
    GetIt.I<FlutterSecureStorage>()
        .write(key: serverTime, value: res.serverTime);
    GetIt.I<FlutterSecureStorage>().write(key: socialProvider, value: 'google');

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

  Future<BaseResponse> loginAppleR({required AppleSocialData data}) async {
    final res = await login(
      loginUrl,
      data: {
        'social_provider': 'apple',
        'social_data': data,
        'fcm_token': await HelperNotification().getFcmToken()
      },
    );
    GetIt.I<FlutterSecureStorage>()
        .write(key: serverTime, value: res.serverTime);
    GetIt.I<FlutterSecureStorage>().write(key: socialProvider, value: 'apple');

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

  Future<BaseResponse> getPrivacyR(String url) async {
    final res = await get(url);

    if (res.status == 'success') {
      final data = TermsPrivacy.fromJson(res.data);
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

  Future<BaseResponse> deleteUserR(
      String username, String password, String reason) async {
    final res = await post(
      deleteUserUrl,
      data: {'username': username, 'password': password, 'reason': reason},
    );
    if (res.status == 'success') {
      await GetIt.I<FlutterSecureStorage>().deleteAll();
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

  Future<BaseResponse> deleteAccountR(String reason) async {
    final readAccountId =
        await GetIt.I<FlutterSecureStorage>().read(key: accountId);
    final res = await delete(
      deleteAccountUrl,
      data: {'accountId': readAccountId, 'reason': reason},
    );
    if (res.status == 'success') {
      await GetIt.I<FlutterSecureStorage>().deleteAll();
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

  Future<BaseResponse> kycR(
    String permit,
    patner,
    patnerSelfie,
    directors,
    letterOfRepresemt,
  ) async {
    final res = await login(
      kycUrl,
      data: {
        'permit': permit,
        'patner': patner,
        'patner_selfie': patnerSelfie,
        'directors': directors,
        'letter_of_represent': letterOfRepresemt,
      },
    );

    if (res.status == 'success') {
      final company = Company.fromJson(res.data['company']);
      return BaseResponse(
        status: res.status,
        message: res.message,
        data: company,
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

  Future<BaseResponse> sendOTPMobileR(
      String countryId, String phoneNumber, String long, String lat) async {
    final res = await postNoHeader(
      sendOtpUrl,
      data: {
        'country_id': countryId,
        'phone_number': phoneNumber,
        "latitude": lat,
        "longitude": long
      },
    );

    if (res.status == 'success') {
      return BaseResponse(
          status: res.status,
          message: res.message,
          data: res.data,
          serverTime: res.serverTime);
    } else {
      return BaseResponse(
          status: res.status,
          message: res.message,
          data: res.data,
          serverTime: res.serverTime);
    }
  }

  Future<BaseResponse> sendOTPEmailR() async {
    final res = await get(
      requestEmailOtpForDeleteUrl,
    );

    if (res.status == 'success') {
      return BaseResponse(
          status: res.status,
          message: res.message,
          data: res.data,
          serverTime: res.serverTime);
    } else {
      return BaseResponse(
          status: res.status,
          message: res.message,
          data: res.data,
          serverTime: res.serverTime);
    }
  }

  Future<BaseResponse> validateEmailOTPR(String code) async {
    final res = await post(checkEmailOtpForDeleteUrl, data: {
      'otp': code,
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

  Future<BaseResponse> verificationR(
    String countryId,
    fullName,
    address,
    photoAddress,
    photoWithId,
  ) async {
    final res = await postNoHeader(
      verificationUrl,
      data: {
        'country_id': countryId,
        'full_name': fullName,
        'address': address,
        'photo_address': photoAddress,
        'photo_with_id': photoWithId
      },
    );

    if (res.status == 'success') {
      return BaseResponse(
          status: res.status,
          message: res.message,
          data: res.data,
          serverTime: res.serverTime);
    } else {
      return BaseResponse(
          status: res.status,
          message: res.message,
          data: res.data,
          serverTime: res.serverTime);
    }
  }

  Future<BaseResponse> registerR(String fullName, password, email, gender, dob,
      countryId, phoneNumber) async {
    final firebaseMsg = GetIt.I<FirebaseMessaging>();
    final fcmToken = await firebaseMsg.getToken();

    final res = await postNoHeader(
      registerUrl,
      data: {
        'full_name': fullName,
        'password': password,
        'email': email,
        'dob': dob,
        'gender': gender,
        'country_id': countryId,
        'phone_number': phoneNumber,
        'fcm_token': fcmToken
      },
    );

    if (res.status == 'success') {
      //final user = Profile.fromJson(res.data['profile']);

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

  Future<BaseResponse> logout() async {
    final res = await put(editAccountUrl, data: {});
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
    // final res = await post(logoutUrl, data: {});
    // if (res.status == 'success') {
    //   //final user = Profile.fromJson(res.data['profile']);
    //   await signOut();
    //   return BaseResponse(
    //     status: res.status,
    //     message: res.message,
    //     data: res.data,
    //     serverTime: res.serverTime,
    //   );
    // } else {
    //   showWarningTopFlash("Failed to logout");
    //   return BaseResponse(
    //     status: res.status,
    //     message: res.message,
    //     data: res.data,
    //     serverTime: res.serverTime,
    //   );
    // }
  }

  Future<void> signOut() async {
    final Socket socket = SocketApi.socket;
    final result =
        await GetIt.I<FlutterSecureStorage>().read(key: dialCodeStorage);
    debugPrint('ini dial code $dialCodeStorage');
    final loc = await GetIt.I<FlutterSecureStorage>()
        .read(key: saveWhenDenyLocPermission);
    await GetIt.I<FlutterSecureStorage>().deleteAll();
    await GetIt.I<FlutterSecureStorage>()
        .write(key: saveWhenDenyLocPermission, value: loc);
    await GoogleSignIn().signOut();
    socket.off(getContactListListen);

    // await DefaultCacheManager().emptyCache();

    await GetIt.I<NavigationServiceMain>()
        .pushRemoveUntil(AppRoutes.login, args: {'initialCode': result ?? ''});
  }

  Future<BaseResponse?> getTokenR() async {
    const String clientId = "538520988420871";
    const String clientSecret = "bbb23694129df132945e4d602b49e7a2";
    const String redirectUrl = "https://keepo.ai/login-instagram-success";
    const String scope = 'user_profile,user_media';

    final res = await post(
        "https://api.instagram.com/oauth/authorize?client_id=$clientId&redirect_uri=$redirectUrl&scope=$scope&response_type=code",
        data: {
          "client_id": clientId,
          "client_secret": clientSecret,
          "grant_type": "authorized_code",
          'redirect_url': redirectUrl,
        });

    if (res.status == 'success') {
      final token = jsonDecode(res.data)['access_token'];
      return token;
    } else {
      BaseResponse(
        message: res.message,
        status: res.status,
      );
    }
    return null;
  }
}
