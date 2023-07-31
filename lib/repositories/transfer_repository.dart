import 'package:keepo/helper/base_repository.dart';
import 'package:keepo/helper/base_response.dart';
import 'package:keepo/models/wallet/swap_model.dart';
import 'package:keepo/utils/endpoint.dart';

class Transfer extends BaseRepository {
  Future<BaseResponse> addTransferR(
    String countryId,
    String type,
    String? to,
    double amount,
  ) async {
    final res = await post(addTransferUrl, data: {
      'country_id': countryId,
      'type': type,
      'to': to,
      'amount': amount
    });

    if (res.status == 'success') {
      final transfer = Wallet.fromJson(res.data);
      return BaseResponse(
        status: res.status,
        message: res.message,
        data: transfer,
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
