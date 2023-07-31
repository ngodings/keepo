import 'package:keepo/helper/base_repository.dart';
import 'package:keepo/helper/base_response.dart';
import 'package:keepo/models/wallet/fiat_balance_model.dart';
import 'package:keepo/utils/endpoint.dart';

class WalletRepository extends BaseRepository {
  Future<BaseResponse> getFiatBalanceR() async {
    final res = await get(fiatBalanceUrl);

    if (res.status == 'success') {
      final fiatBalance = FiatBalanceModel.fromJson(res.data);

      return BaseResponse(
        status: res.status,
        message: res.message,
        data: fiatBalance,
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
