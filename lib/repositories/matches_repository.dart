import 'package:keepo/helper/base_repository.dart';
import 'package:keepo/helper/base_response.dart';
import 'package:keepo/models/match/match_profile.dart';
import 'package:keepo/utils/endpoint.dart';

class MatchesRepository extends BaseRepository {
  Future<BaseResponse> findServices({
    String? search,
    dynamic nearby,
    required int page,
    required int limit,
  }) async {
    final res = await post(findServicesUrl, data: {
      "module": 'service',
      'searchKeyword': search,
      'nearby': nearby,
      'page': page,
      'limit': limit,
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

  Future<BaseResponse> findMatch({
    String? search,
    dynamic nearby,
    required int page,
    required int limit,
  }) async {
    final res = await post(findMatchingProfileUrl, data: {
      'searchKeyword': search,
      'module': 'profile',
      'nearby': nearby,
      'page': page,
      'limit': limit,
    });

    if (res.status == 'success') {
      final List<MatchProfile> data =
          List.from(res.data).map((e) => MatchProfile.fromJson(e)).toList();
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

  Future<BaseResponse> findGroup({
    String? search,
    dynamic nearby,
    required int page,
    required int limit,
  }) async {
    final res = await post(findGroupUrl, data: {
      "module": "group",
      'searchKeyword': search,
      'nearby': nearby,
      'page': page,
      'limit': limit,
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
