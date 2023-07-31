import '../helper/base_repository.dart';
import '../helper/base_response.dart';
import '../models/zen/withdrawal_model.dart';
import '../utils/endpoint.dart';
import '../utils/string.dart';

class WithdrawRepository extends BaseRepository {
  Future<BaseResponse> requestWithdrawR({
    required String amount,
    required String bankType,
    required String bankId,
  }) async {
    final accountIdData = await secureStorage.read(key: accountId);
    final res = await post(requestWithdrawUrl, data: {
      'accountId': accountIdData,
      'amount': amount,
      'bank_type': bankType,
      'bank_id': bankId
    });
    if (res.status == 'success') {
      final data = Withdrawal.fromJson(res.data);
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
}
