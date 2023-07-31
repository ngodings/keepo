import 'package:keepo/enums/notification_enum.dart';
import 'package:keepo/helper/base_repository.dart';
import 'package:keepo/helper/base_response.dart';
import 'package:keepo/utils/endpoint.dart';

class NotificationRepository extends BaseRepository {
  Future<BaseResponse> getNotificationList() async {
    final res = await get(notifications);

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

  Future<BaseResponse> readNotification(
    String notificationId,
  ) async {
    final res =
        await post(notifications, data: {'notificationId': notificationId});

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

  Future<BaseResponse> deleteNotification(
    String? notificationId,
  ) async {
    final res = await post(deleteNotifications,
        data: {'notificationId': notificationId});

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

  Future<BaseResponse> deleteAllNotification() async {
    final res = await delete(deleteNotifications, data: {});

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
}
