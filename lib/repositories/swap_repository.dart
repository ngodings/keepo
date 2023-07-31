import 'package:keepo/helper/base_repository.dart';
import 'package:keepo/helper/base_response.dart';
import 'package:keepo/models/wallet/rate_model.dart';
import 'package:keepo/models/wallet/swap_model.dart';
import 'package:keepo/utils/endpoint.dart';

class SwapRepository extends BaseRepository {
  Future<BaseResponse> addRateR(
    String from,
    String to,
    double amount,
  ) async {
    final res = await post(
      addRateUrl,
      data: {
        'from': from,
        'to': to,
        'amount': amount,
      },
    );

    if (res.status == 'success') {
      final rate = Rate.fromJson(res.data);
      return BaseResponse(
        status: res.status,
        message: res.message,
        data: rate,
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

  Future<BaseResponse> addSwapR(
    String from,
    String to,
    double amount,
  ) async {
    final res = await post(
      addSwapUrl,
      data: {
        'from': from,
        'to': to,
        'amount': amount,
      },
    );

    if (res.status == 'success') {
      final swap = Wallet.fromJson(res.data);
      return BaseResponse(
        status: res.status,
        message: res.message,
        data: swap,
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
