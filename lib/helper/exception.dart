import 'dart:io';

import 'package:dio/dio.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../utils/alert_toast.dart';
import '../utils/endpoint.dart';
import '../utils/string.dart';
import 'base_response.dart';

class ExceptionHelper<T> {
  final DioError e;
  ExceptionHelper(this.e);

  Future<BaseResponse<T>> catchException() async {
    String message = '';
    // ignore: unused_local_variable
    int statusCode = 0;

    await Sentry.captureException(e, stackTrace: e.stackTrace);

    switch (e.type) {
      case DioErrorType.connectionTimeout:
        message = kConnectionTimeout;
        statusCode = 500;
        break;
      case DioErrorType.sendTimeout:
        message = kConnectionTimeout;
        statusCode = 500;

        break;
      case DioErrorType.receiveTimeout:
        message = kConnectionTimeout;
        statusCode = 500;

        break;
      case DioErrorType.connectionError:
        if (e.response == null) {
          return BaseResponse(
            message: kErrorCantReachServer,
          );
        }

        final eResponse = e.response!;
        showWarningTopFlash(eResponse.data['message'].toString());
        final statusCode = eResponse.statusCode;
        message = eResponse.data['message'].toString();

        if (statusCode == 422) {
          message = eResponse.data['message'].toString();
          showWarningTopFlash(message);
        } else if (statusCode == 401) {
          message = eResponse.data['message'].toString();

          showWarningTopFlash(message);
          if (eResponse.requestOptions.path == registerUrl) {
            return BaseResponse(
              message: message,
              data: eResponse.data,
            );
          }
        } else {
          message = eResponse.data['message'].toString();
          showWarningTopFlash(message);
          // tak tambahi
          return BaseResponse(
            message: message,
            data: eResponse.data,
          );
        }

        break;
      case DioErrorType.cancel:
        message = kErrorException;
        statusCode = 500;

        break;
      case DioExceptionType.badCertificate:
      case DioExceptionType.badResponse:
      case DioExceptionType.unknown:
    }

    return BaseResponse(
      message: message,
      data:
          e.response?.data['message'] ?? e.response?.data['message'].toString(),
    );
  }
}
