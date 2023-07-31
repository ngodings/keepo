import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:keepo/models/account/profile_model.dart';
import 'package:keepo/utils/string.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit() : super(UserDataInitial());

  Future<void> fetchLocalUserData() async {
    final userData = await GetIt.I<FlutterSecureStorage>().readAll();
    if (userData.isNotEmpty) {
      final List<ProfileList> profileList =
          List.from(jsonDecode(userData[listProfile]!))
              .map((e) => ProfileList.fromJson(e))
              .toList();
      final String? username = userData[activeUsernameProfile];
      debugPrint('ini storage username $username');
      final String? activeProfileId = userData[profileId];
      final String? activeAccountId = userData[accountId];
      final String? lastEditAt = userData[lastEdit];

      emit(FetchLocalDataUser(
        profileList: profileList,
        username: username,
        activeAccountId: activeAccountId,
        activeProfileId: activeProfileId,
        lastEdit: lastEditAt,
      ));
    }
  }
}
