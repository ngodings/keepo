import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:keepo/helper/base_response.dart';
import 'package:keepo/features/components/country_list/support/code_countries_en.dart';
import 'package:keepo/services/permission_handler.dart';
import 'package:keepo/utils/string.dart';

class SetSecureStorageData {
  static void setSwitchingProfile(
      {required String idProfile,
      required String username,
      required String thumbnail}) {
    GetIt.I<FlutterSecureStorage>()
      ..write(
        key: profileId,
        value: idProfile,
      )
      ..write(
        key: activeUsernameProfile,
        value: username,
      )
      ..write(key: profileThumbnail, value: thumbnail);
  }

  static void setLogin(Response<dynamic> response) {
    GetIt.I<FlutterSecureStorage>()
      ..write(key: tokenUser, value: response.data['data']['token'])
      ..write(key: profileId, value: response.data['data']['id'])
      ..write(key: accountId, value: response.data['data']['account']['id'])
      ..write(
          key: paymentPin,
          value: response.data['data']['account']['payment_pin'])
      ..write(
          key: passcodeAccount,
          value: response.data['data']['account']['passcode'])
      ..write(
          key: listProfile,
          value: jsonEncode(response.data['data']['account']['profile']))
      ..write(
          key: listAccount,
          value: jsonEncode(response.data['data']['accounts']))
      ..write(key: lastEdit, value: response.data['data']['lastEditAt'])
      ..write(key: activeUsernameProfile, value: response.data['data']['name'])
      ..write(
          key: activeUsernameAccount,
          value: response.data['data']['account']['fullname'])
      ..write(key: profileThumbnail, value: response.data['data']['thumbnail'])
      ..write(
          key: statusKYCVerifed,
          value: response.data['data']['kyc_verified'] != null
              ? response.data['data']['kyc_verified'].toString()
              : response.data['data']['kyc_verified'])
      ..write(
          key: emailAccount, value: response.data['data']['account']['email']);

    // GetIt.I<FlutterSecureStorage>().write(
    //     key: statusAccountUser,
    //     value: response.data['data']['profile']['status']);
  }

  static void setEditProfile(BaseResponse<dynamic> res) {
    debugPrint("SWITCHED TO ==> ${res.data['id']} - ${res.data['name']} <==");
    GetIt.I<FlutterSecureStorage>()
      ..write(key: activeUsernameProfile, value: res.data['name'])
      ..write(key: profileId, value: res.data['id'])
      ..write(
          key: profileThumbnail,
          value: res.data['thumbnail'] ??
              'https://d2v9ipibika81v.cloudfront.net/uploads/sites/210/Profile-Icon.png')
      ..write(
          key: listProfile, value: jsonEncode(res.data['account']['profile']))
      ..write(key: lastEdit, value: res.data['lastEditAt']);
  }

  // static void saveFriends(List<String>? data) {
  //   GetIt.I<FlutterSecureStorage>().write(key: friendList, value: data == null ? null : jsonEncode(data));
  // }

  Future<String> setCurrentLocation() async {
    Position position = await determinePosition();
    String initialCode = "";

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    for (var i in countriesEnglish) {
      if (i['code'] == '${placemarks.first.isoCountryCode}') {
        initialCode = i['dial_code'];
        GetIt.I<FlutterSecureStorage>()
            .write(key: dialCodeStorage, value: i['dial_code']);
      }
    }

    return initialCode;
  }

  static void setKYCWholeData(data) {
    GetIt.I<FlutterSecureStorage>().write(key: savingKYCData, value: data);
  }

  static void setKYCIndividualData(data) {
    GetIt.I<FlutterSecureStorage>()
        .write(key: savingKYCIndividualData, value: data);
  }

  static void setKYCBusinessData(data) {
    GetIt.I<FlutterSecureStorage>()
        .write(key: savingKYCBusinessData, value: data);
  }

  static void setKYCBeneficiariesData(data) {
    GetIt.I<FlutterSecureStorage>()
        .write(key: savingKYCBeneficiariesData, value: data);
  }

  static void setKYCBearerData(data) {
    GetIt.I<FlutterSecureStorage>()
        .write(key: savingKYCBearerData, value: data);
  }

  static void setKYCIDData(data) {
    GetIt.I<FlutterSecureStorage>().write(key: kycId, value: data);
  }
}

class GetSecureStorage {
  Future<String?>? getProfileId() async {
    return await GetIt.I<FlutterSecureStorage>().read(key: profileId);
  }

  Future<String?>? getAccountId() async {
    return await GetIt.I<FlutterSecureStorage>().read(key: accountId);
  }
}
