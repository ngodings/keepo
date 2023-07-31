import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/src/media_type.dart';
import 'package:mime/mime.dart';
import 'package:keepo/helper/base_repository.dart';
import 'package:keepo/helper/base_response.dart';
import 'package:keepo/utils/endpoint.dart';

class ChatRepository extends BaseRepository {
  Future<BaseResponse> newMessageR(String phoneNumber) async {
    final res = await post(
      newMessage,
      data: {
        'phone_number': phoneNumber,
      },
    );

    return BaseResponse(
      status: res.status,
      message: res.message,
      data: res.data,
      serverTime: res.serverTime,
    );
  }

  Future<BaseResponse> mediaUploadR(
      {required List<File?> file, required bool compress}) async {
    var listToMultipart = [];
    for (var i in file) {
      listToMultipart.add(await MultipartFile.fromFile(i!.path,
          filename: i.path.split('/').last,
          contentType: MediaType(lookupMimeType(i.path)!.split("/")[0],
              lookupMimeType(i.path)!.split("/")[1])));
    }

    final res = await postFromData(
      uploadMedia,
      data: {
        'file[]': listToMultipart,
        'compress': compress,
      },
    );

    return BaseResponse(
      status: res.status,
      message: res.message,
      data: res.data,
      serverTime: res.serverTime,
    );
  }

  Future<BaseResponse> getGroupChatMedia({
    required String chatId,
    required String? type,
    int? limit,
    required int page,
  }) async {
    final res = await post(
      groupChatMediaUrl,
      data: {
        'chatId': chatId,
        'type': type,
        'limit': limit,
        'page': page,
      },
    );

    return BaseResponse(
      status: res.status,
      message: res.message,
      data: res.data,
      serverTime: res.serverTime,
    );
  }

  Future<BaseResponse> editGroupLink({
    required String groupId,
    required String? slug,
  }) async {
    final res = await post(
      editGroupLinkUrl,
      data: {
        'groupId': groupId,
        'slug': slug,
      },
    );

    return BaseResponse(
      status: res.status,
      message: res.message,
      data: res.data,
      serverTime: res.serverTime,
    );
  }

  Future<BaseResponse> findGroup({
    String? groupId,
    String? slug,
  }) async {
    final res = await post(
      findGroupChat,
      data: {
        'groupId': groupId,
        'slug': slug,
      },
    );

    return BaseResponse(
      status: res.status,
      message: res.message,
      data: res.data,
      serverTime: res.serverTime,
    );
  }
}
