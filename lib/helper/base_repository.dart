import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:retry/retry.dart';
import 'package:keepo/helper/base_response.dart';
import 'package:keepo/helper/exception.dart';
import 'package:keepo/services/set_secure_storage_data.dart';
import 'package:keepo/utils/string.dart';

class BaseRepository {
  final Dio dio = GetIt.I<Dio>();
  final FlutterSecureStorage secureStorage = GetIt.I<FlutterSecureStorage>();

  Future<BaseResponse> login(
    String api, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await retry(
        () => dio.post(
          api,
          data: json.encode(data),
          queryParameters: queryParameters,
          options: Options(responseType: ResponseType.json),
        ),
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );
      if (response.data['data'] != null) {
        //save data important
        SetSecureStorageData.setLogin(response);
      }

      if (response.data == 'success') {
        return BaseResponse(
          status: response.data['status'],
          serverTime: response.data['server_time'],
          message: response.data['message'],
          data: response.data['data'],
        );
      } else {
        return BaseResponse(
          status: response.data['status'],
          serverTime: response.data['server_time'],
          message: response.data['message'],
          data: response.data['data'],
        );
      }
    } on DioError catch (e) {
      return ExceptionHelper(e).catchException();
    }
  }

  Future<BaseResponse> postNoHeader(
    String api, {
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await retry(
        () => dio.post(
          api,
          data: json.encode(data),
          options: Options(
            responseType: ResponseType.json,
          ),
        ),
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );

      return BaseResponse(
        status: response.data['status'],
        serverTime: response.data['server_time'],
        message: response.data['message'],
        data: response.data['data'],
      );
    } on DioError catch (e) {
      return ExceptionHelper(e).catchException();
    }
  }

  Future<BaseResponse> post(
    String api, {
    Map<String, dynamic>? data,
  }) async {
    try {
      final token = await secureStorage.read(key: tokenUser);

      final Map<String, dynamic> headers = {};
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
        headers['X-keepo-Version'] = versionApp;
      }

      final response = await retry(
        () => dio.post(
          api,
          data: json.encode(data),
          options: Options(
            responseType: ResponseType.json,
            headers: headers,
          ),
        ),
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );

      if (response.statusCode == 200) {
        return BaseResponse(
          status: response.data['status'],
          serverTime: response.data['server_time'],
          message: response.data['message'],
          data: response.data['data'],
        );
      } else {
        return BaseResponse(
          status: response.data['status'],
          serverTime: response.data['server_time'],
          message: response.data['message'],
          data: response.data['data'],
        );
      }
    } on DioError catch (e) {
      return ExceptionHelper(e).catchException();
    }
  }

  Future<BaseResponse> postNone(String api) async {
    try {
      final token = await secureStorage.read(key: tokenUser);

      final Map<String, dynamic> headers = {};
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
        headers['X-keepo-Version'] = versionApp;
      }

      final response = await retry(
        () => dio.post(
          api,
          options: Options(
            responseType: ResponseType.json,
            headers: headers,
          ),
        ),
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );

      if (response.statusCode == 200) {
        return BaseResponse(
          status: response.data['status'],
          serverTime: response.data['server_time'],
          message: response.data['message'],
          data: response.data['data'],
        );
      } else {
        return BaseResponse(
          status: response.data['status'],
          serverTime: response.data['server_time'],
          message: response.data['message'],
          data: response.data['data'],
        );
      }
    } on DioError catch (e) {
      return ExceptionHelper(e).catchException();
    }
  }

  Future<BaseResponse> postFromData(
    String api, {
    Map<String, dynamic>? data,
    ProgressCallback? onSendProgress,
  }) async {
    try {
      final token = await secureStorage.read(key: tokenUser);

      final Map<String, dynamic> headers = {};
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
        headers['Content-Type'] =
            'multipart/form-data; boundary=<calculated when request is sent>';
        headers['X-keepo-Version'] = versionApp;
      }
      debugPrint(
          "FORM DATA ==> ${FormData.fromMap(data!).fields}, FILES => ${FormData.fromMap(data).files.map((e) => e.value.filename).toList()}");

      final response = await retry(
        () => dio.post(
          api,
          data: FormData.fromMap(data!),
          options: Options(
            responseType: ResponseType.json,
            headers: headers,
          ),
          onSendProgress: onSendProgress,
        ),
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );

      if (response.statusCode == 200) {
        return BaseResponse(
          status: response.data['status'],
          serverTime: response.data['server_time'],
          message: response.data['message'],
          data: response.data['data'],
        );
      } else {
        return BaseResponse(
          status: response.data['status'],
          serverTime: response.data['server_time'],
          message: response.data['message'],
          data: response.data['data'],
        );
      }
    } on DioError catch (e) {
      return ExceptionHelper(e).catchException();
    }
  }

  Future<BaseResponse> putFromData(
    String api, {
    dynamic data,
  }) async {
    try {
      final token = await secureStorage.read(key: tokenUser);

      final Map<String, dynamic> headers = {};
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
        headers['X-keepo-Version'] = versionApp;
      }

      // debugPrint('ini form data ${FormData.fromMap(data)}');

      debugPrint(
          "FORM DATA ==> ${FormData.fromMap(data).fields}, FILES => ${FormData.fromMap(data).fields}");

      final response = await retry(
        () => dio.put(
          api,
          data: FormData.fromMap(data),
          options: Options(
            responseType: ResponseType.json,
            headers: headers,
          ),
        ),
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );

      if (response.statusCode == 200) {
        return BaseResponse(
          status: response.data['status'],
          serverTime: response.data['server_time'],
          message: response.data['message'],
          data: response.data['data'],
        );
      } else {
        return BaseResponse(
          status: response.data['status'],
          serverTime: response.data['server_time'],
          message: response.data['message'],
          data: response.data['data'],
        );
      }
    } on DioError catch (e) {
      return ExceptionHelper(e).catchException();
    }
  }

  Future<BaseResponse> get(
    String api, {
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final token = await secureStorage.read(key: tokenUser);

      final Map<String, dynamic> headers = {};
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
        headers['X-keepo-Version'] = versionApp;
      }

      final response = await retry(
        () => dio.get(
          api,
          queryParameters: queryParams,
          options: Options(
            responseType: ResponseType.json,
            headers: headers,
          ),
        ),
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );

      if (response.statusCode == 200) {
        return BaseResponse(
          status: response.data['status'],
          serverTime: response.data['server_time'],
          message: response.data['message'],
          data: response.data['data'],
        );
      } else {
        return BaseResponse(
          status: response.data['status'],
          serverTime: response.data['server_time'],
          message: response.data['message'],
          data: response.data['data'],
        );
      }
    } on DioError catch (e) {
      return ExceptionHelper(e).catchException();
    }
  }

  Future<BaseResponse> put(
    String api, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final token = await secureStorage.read(key: tokenUser);

      final Map<String, dynamic> headers = {};
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
        headers['X-keepo-Version'] = versionApp;
      }

      final response = await retry(
        () => dio.put(
          api,
          data: json.encode(data),
          queryParameters: queryParameters,
          options: Options(headers: headers),
        ),
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );

      if (response.statusCode == 200) {
        return BaseResponse(
          status: response.data['status'],
          serverTime: response.data['server_time'],
          message: response.data['message'],
          data: response.data['data'],
        );
      } else {
        return BaseResponse(
          status: response.data['status'],
          serverTime: response.data['server_time'],
          message: response.data['message'],
          data: response.data['data'],
        );
      }
    } on DioError catch (e) {
      return ExceptionHelper(e).catchException();
    }
  }

  Future<BaseResponse> delete(
    String api, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final token = await secureStorage.read(key: tokenUser);

      final Map<String, dynamic> headers = {};
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
        headers['X-keepo-Version'] = versionApp;
      }

      final response = await retry(
        () => dio.delete(
          api,
          data: json.encode(data),
          queryParameters: queryParameters,
          options: Options(
            headers: headers,
          ),
        ),
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );

      if (response.statusCode == 200) {
        return BaseResponse(
          status: response.data['status'],
          serverTime: response.data['server_time'],
          message: response.data['message'],
          data: response.data['data'],
        );
      } else {
        return BaseResponse(
          status: response.data['status'],
          serverTime: response.data['server_time'],
          message: response.data['message'],
          data: response.data['data'],
        );
      }
    } on DioError catch (e) {
      return ExceptionHelper(e).catchException();
    }
  }

  Future<BaseResponse> deleteAll(String api) async {
    try {
      final token = await secureStorage.read(key: tokenUser);

      final Map<String, dynamic> headers = {};
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
        headers['X-keepo-Version'] = versionApp;
      }

      final response = await retry(
        () => dio.delete(
          api,
          options: Options(
            headers: headers,
          ),
        ),
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );

      if (response.statusCode == 200) {
        return BaseResponse(
          status: response.data['status'],
          serverTime: response.data['server_time'],
          message: response.data['message'],
          data: response.data['data'],
        );
      } else {
        return BaseResponse(
          status: response.data['status'],
          serverTime: response.data['server_time'],
          message: response.data['message'],
          data: response.data['data'],
        );
      }
    } on DioError catch (e) {
      return ExceptionHelper(e).catchException();
    }
  }
}
