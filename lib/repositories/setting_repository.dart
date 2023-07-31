import 'package:keepo/helper/base_repository.dart';
import 'package:keepo/models/friends/friend_list.dart';
import 'package:keepo/models/profile/profile_details.dart';

import '../helper/base_response.dart';
import '../utils/endpoint.dart';

class SettingRepository extends BaseRepository {
  Future<BaseResponse> getReferalAccountR() async {
    final res = await get(referalAccountUrl);

    if (res.status == 'success') {
      final List<ProfileDetails> data =
          List.from(res.data).map((e) => ProfileDetails.fromJson(e)).toList();

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
