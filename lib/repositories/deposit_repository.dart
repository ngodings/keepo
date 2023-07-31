import 'package:keepo/helper/base_response.dart';
import 'package:keepo/models/wallet/bank_model.dart';
import 'package:keepo/utils/endpoint.dart';

import '../helper/base_repository.dart';

class DepositRepository extends BaseRepository {
  Future<BaseResponse> addBankAccountR(
    String bankName,
    String bankBeneficiary,
    String bankAddress,
    String bankAccount,
    String swiftCode,
    String currencyIso,
    String bankStatement,
  ) async {
    final res = await post(
      addBankAccountUrl,
      data: {
        'bank_name': bankName,
        'bank_beneficiary': bankBeneficiary,
        'bank_address': bankAddress,
        'swift_code': swiftCode,
        'currency_iso': currencyIso,
        'bank_statement': bankStatement,
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

  Future<BaseResponse> getDepositInfoR(String currencyIso) async {
    final res = await get(
      getDepositInfoUrl,
      queryParams: {'currency_iso': currencyIso},
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

  Future<BaseResponse> addDepositInfoR(String currencyIso) async {
    final res = await post(
      addDepositInfoUrl,
      data: {
        'current_iso': currencyIso,
      },
    );

    if (res.status == 'success') {
      final depositInfo = BankData.fromJson(res.data);
      return BaseResponse(
        status: res.status,
        message: res.message,
        data: depositInfo,
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

  Future<BaseResponse> addDepositFiatCurrencyR(
    String countryId,
    String bankId,
    String receipt,
  ) async {
    final res = await post(addDepositFiatCurrencyUrl, data: {
      'country_id': countryId,
      'bank_id': bankId,
      'receipt': receipt,
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
}
