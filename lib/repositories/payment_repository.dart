import 'dart:io';

import 'package:dio/dio.dart';
import 'package:keepo/helper/base_repository.dart';
import 'package:keepo/models/transaction/transaction_status_model.dart';
import 'package:keepo/models/transaction/user_bank_model.dart';
import 'package:keepo/utils/endpoint.dart';
import '../../../../utils/string.dart';

import '../helper/base_response.dart';

class PaymentRepository extends BaseRepository {
  Future<BaseResponse> setPaymentPin(String code) async {
    final accountIdData = await secureStorage.read(key: accountId);
    final res = await post(paymentPinUrl, data: {
      'payment_pin': code,
      'accountId': accountIdData,
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

  Future<BaseResponse> checkPaymentPin(String code) async {
    final accountIdData = await secureStorage.read(key: accountId);
    final res = await post(checkPaymentPinUrl, data: {
      'payment_pin': code,
      'accountId': accountIdData,
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

  Future<BaseResponse> requestEmailOTPR() async {
    final res = await get(requestEmailOtpUrl);

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

  Future<BaseResponse> validateEmailOTPR(String code) async {
    // final accountIdData = await secureStorage.read(key: accountId);
    final res = await post(requestEmailOtpUrl, data: {
      'otp': code,
      // 'accountId': accountIdData,
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

  Future<BaseResponse> getTransactionHistoryR({
    String? type,
  }) async {
    final res = await get(transactionHistoryUrl, queryParams: {
      'status': type,
    });

    if (res.status == 'success') {
      // final List<OrderHistory> data =
      //     List.from(res.data).map((e) => OrderHistory.fromJson(e)).toList();

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

  Future<BaseResponse> getDetailTransactionR({required String orderId}) async {
    final accountIdData = await secureStorage.read(key: accountId);
    final res = await post(transactionDetailUrl, data: {
      'accountId': accountIdData,
      'orderId': orderId,
    });

    if (res.status == 'success') {
      final data = OrderHistory.fromJson(res.data);
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

  Future<BaseResponse> getListBankInfoR() async {
    final res = await get(userBankInfoUrl);

    if (res.status == 'success') {
      final List<UserBankInfo> data =
          List.from(res.data).map((e) => UserBankInfo.fromJson(e)).toList();

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

  Future<BaseResponse> addBankInfoR({
    required String beneficiaryName,
    required String bankName,
    required String accountNumber,
    required String bankCode,
    required String branchCode,
    required String swiftCode,
    required String bankAddress,
    required String acceptCurrency,
    required String defaultPayment,
    required List<String> doc,
  }) async {
    List<MultipartFile> files = [];

    for (String path in doc) {
      File file = File(path);
      var fileName = file.path.split('/').last;
      files.add(await MultipartFile.fromFile(file.path, filename: fileName));
    }
    final res = await postFromData(userBankInfoUrl, data: {
      'type': 'Bank',
      'beneficiary_name': beneficiaryName,
      'bank_name': bankName,
      'account_number': accountNumber,
      'bank_code': bankCode,
      'branch_code': branchCode,
      'swift_code': swiftCode,
      'bank_address': bankAddress,
      'accept_currency': acceptCurrency,
      'default': defaultPayment,
      'document[]': files
    });

    if (res.status == 'success') {
      //final data = UserBankInfo.fromJson(res.data);
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

  Future<BaseResponse> updateBankInfoR({
    required String bankUserId,
    String? beneficiaryName,
    String? bankName,
    String? accountNumber,
    String? bankCode,
    String? branchCode,
    String? swiftCode,
    String? bankAddress,
    String? acceptCurrency,
    String? defaultPayment,
  }) async {
    final res = await put(userBankInfoUrl, data: {
      'type': 'Bank',
      'bankId': bankUserId,
      'beneficiary_name': beneficiaryName,
      'bank_name': bankName,
      'account_number': accountNumber,
      'bank_code': bankCode,
      'branch_code': branchCode,
      'swift_code': swiftCode,
      'bank_address': bankAddress,
      'accept_currency': acceptCurrency,
      'default': defaultPayment
    });

    if (res.status == 'success') {
      //final data = UserBankInfo.fromJson(res.data);
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

  Future<BaseResponse> deleteUserBankR({required String userBankId}) async {
    final res = await delete(userBankInfoUrl, data: {'bankId': userBankId});

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

  Future<BaseResponse> addPaypalInfoR({
    required String emailAddress,
    required String? paypalId,
    required String name,
    required String phone,
  }) async {
    final res = await postFromData(userBankInfoUrl, data: {
      'type': 'Paypal',
      'email_address': emailAddress,
      'paypalId': paypalId,
      'name': name,
      'phone_number': phone,
    });

    if (res.status == 'success') {
      //final data = UserBankInfo.fromJson(res.data);
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

  Future<BaseResponse> updatePaypalR({
    required String bankUserId,
    String? emailAddress,
    String? paypalId,
    String? acceptCurrency,
    String? name,
    String? phone,
  }) async {
    final res = await put(userBankInfoUrl, data: {
      'type': 'Paypal',
      'bankId': bankUserId,
      'name': name,
      'phone_number': phone,
      'email_address': emailAddress,
      'paypalId': paypalId,
    });

    if (res.status == 'success') {
      //final data = UserBankInfo.fromJson(res.data);
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

  Future<BaseResponse> addPaynowInfoR({
    required String beneficiaryName,
    required String paynowNumber,
    required String acceptCurrency,
    required String doc,
  }) async {
    File file = File(doc);
    var fileName = file.path.split('/').last;
    final res = await postFromData(userBankInfoUrl, data: {
      'type': 'Paynow',
      'beneficiary_name': beneficiaryName,
      'paynow_number': paynowNumber,
      'accept_currency': acceptCurrency,
      'document': await MultipartFile.fromFile(file.path, filename: fileName)
    });

    if (res.status == 'success') {
      //final data = UserBankInfo.fromJson(res.data);
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

  Future<BaseResponse> updatePaynowR({
    required String bankUserId,
    String? beneficiaryName,
    String? paynowNumber,
    String? acceptCurrency,
  }) async {
    final res = await put(userBankInfoUrl, data: {
      'type': 'Paynow',
      'bankId': bankUserId,
      'beneficiary_name': beneficiaryName,
      'paynow_number': paynowNumber,
      'accept_currency': acceptCurrency,
    });

    if (res.status == 'success') {
      //final data = UserBankInfo.fromJson(res.data);
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
