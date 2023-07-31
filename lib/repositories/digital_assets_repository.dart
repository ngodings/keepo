import 'package:keepo/helper/base_repository.dart';
import 'package:keepo/models/zen/locked_zen_model.dart';
import 'package:keepo/utils/endpoint.dart';

import '../helper/base_response.dart';
import '../models/ren/digital_assets_model.dart';

class DigitalAssetsRepository extends BaseRepository {
  Future<BaseResponse> getListDigitalAssetsR() async {
    final res = await get(digitalAssetsUrl);

    if (res.status == 'success') {
      final List<DigitalAssets> data =
          List.from(res.data).map((e) => DigitalAssets.fromJson(e)).toList();
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

  Future<BaseResponse> getListLockedZENR() async {
    final res = await get(viewLockedZENUrl);

    if (res.status == 'success') {
      final data = LockedZEN.fromJson(res.data);
      // final List<DigitalAssets> data =
      //     List.from(res.data).map((e) => DigitalAssets.fromJson(e)).toList();
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
