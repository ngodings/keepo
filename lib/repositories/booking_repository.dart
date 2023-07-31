import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:keepo/enums/payment/payment_channel_enum.dart';
import 'package:keepo/helper/base_repository.dart';
import 'package:keepo/helper/base_response.dart';
import 'package:keepo/models/booking/time_slot_result.dart';
import 'package:keepo/utils/endpoint.dart';
import 'package:keepo/utils/string.dart';

class BookingRepository extends BaseRepository {
  List<MultipartFile> convertFile(List<File?> images) {
    var fileName = '';
    List<MultipartFile> listFile = List<MultipartFile>.empty(growable: true);
    if (images.isNotEmpty) {
      for (int i = 0; i < images.length; i++) {
        if (images[i] != null) {
          fileName = images[i]!.path.split('/').last;

          MultipartFile.fromFile(images[i]!.path, filename: fileName)
              .then((value) {
            listFile.add(value);
          });
        }
      }
    }
    return listFile;
  }

  Future<BaseResponse> acceptTnc(bool? agreement) async {
    final res = await post(
      tncBooking,
      data: agreement == null
          ? {}
          : {
              "user_agree": true,
            },
    );

    if (res.status == 'success') {
      if (res.data['user_agree'] == true) {
        await GetIt.I<FlutterSecureStorage>()
            .write(key: tncBookingService, value: tncBookingServiceValue);
      }
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

  Future<BaseResponse> createService({
    required String name,
    required List<File?> images,
    required double price,
    required String description,
    List<TimeSlot>? timeSlot,
    required List<String> keywords,
  }) async {
    final res = await postFromData(
      serviceProductURl,
      data: {
        'images[]': convertFile(images),
        'name': name,
        'type': 'service',
        'description': description,
        'price': price,
        'time_slot[]': (timeSlot?.isNotEmpty ?? false)
            ? timeSlot!.map((e) => json.encode(e)).toList()
            : [],
        'keywords[]': keywords,
      },
    );

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

  Future<BaseResponse> editService({
    required String productId,
    required String name,
    required double price,
    required String description,
    required List<TimeSlot> timeSlot,
    required List<String> keywords,
    String? status,
  }) async {
    final res = await putFromData(
      serviceProductURl,
      data: {
        'productId': productId,
        'name': name,
        'type': 'service',
        'description': description,
        'price': price,
        'time_slot[]': timeSlot.map((e) => json.encode(e)).toList(),
        'keywords[]': keywords,
        'status': status,
      },
    );

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

  Future<BaseResponse> deletedService({
    required String productId,
  }) async {
    final res = await delete(
      serviceProductURl,
      data: {
        'productId': productId,
      },
    );

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

  Future<BaseResponse> getService() async {
    final res = await get(
      serviceProductURl,
    );

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

  Future<BaseResponse> getServicesDetail({
    String? id,
  }) async {
    final res = await get(findServicesUrl + '/$id'
        // , queryParams: {
        //   'id': id,
        // }
        );

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

  Future<BaseResponse> getOrderHistorySeller({String? status}) async {
    final res = await get(
      orderSellerHistoryUrl,
      queryParams: {
        'status': status,
      },
    );

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

  Future<BaseResponse> orderdetailSeller({
    required String accountId,
    required String orderId,
  }) async {
    final res = await post(
      orderDetailSellerUrl,
      data: {
        'accountId': accountId,
        'orderId': orderId,
      },
    );

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

  Future<BaseResponse> orderDetailBuyer({
    required String accountId,
    required String orderId,
  }) async {
    final res = await post(
      orderDetailBuyerUrl,
      data: {
        'accountId': accountId,
        'orderId': orderId,
      },
    );

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

  Future<BaseResponse> acceptOrder({
    required String accountId,
    required String orderId,
  }) async {
    final res = await post(
      orderSellerAcceptUrl,
      data: {
        'accountId': accountId,
        'orderId': orderId,
      },
    );

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

  Future<BaseResponse> rejectOrder({
    required String accountId,
    required String orderId,
  }) async {
    final res = await delete(
      orderSellerRejectUrl,
      data: {
        'accountId': accountId,
        'orderId': orderId,
      },
    );

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

  Future<BaseResponse> orderBooking({
    required String serviceId,
    required String date,
    required String timeSlot,
    // required PaymentChannelEnum paymentChannel,
  }) async {
    // debugPrint(paymentChannel.type);
    final res = await post(
      orderBookingUrl,
      data: {
        'service_id': serviceId,
        'date': date,
        'time_slot': timeSlot,
        // 'payment_channel': paymentChannel.type,
      },
    );

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

  Future<BaseResponse> orderEditSellerBooking({
    required String accountId,
    required String orderId,
    required String date,
    required String timeSlot,
  }) async {
    final res = await post(
      orderEditSellerUrl,
      data: {
        'accountId': accountId,
        'orderId': orderId,
        'date': date,
        'time_slot': timeSlot,
      },
    );

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

  Future<BaseResponse> orderEditBuyerBooking({
    required String accountId,
    required String orderId,
    required String date,
    required String timeSlot,
  }) async {
    final res = await post(
      orderEditBuyerUrl,
      data: {
        'accountId': accountId,
        'orderId': orderId,
        'date': date,
        'time_slot': timeSlot,
      },
    );

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

  Future<BaseResponse> cancelOrder({
    required String accountId,
    required String orderId,
  }) async {
    final res = await post(
      orderCancelUrl,
      data: {
        'accountId': accountId,
        'orderId': orderId,
      },
    );

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

  Future<BaseResponse> acceptRescheduleOrder({
    required String accountId,
    required String orderId,
  }) async {
    final res = await post(
      orderAcceptUrl,
      data: {
        'accountId': accountId,
        'orderId': orderId,
      },
    );

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

  Future<BaseResponse> confirmOrder({
    required String accountId,
    required String orderId,
  }) async {
    final res = await post(
      orderConfirmUrl,
      data: {
        'accountId': accountId,
        'orderId': orderId,
      },
    );

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

  Future<BaseResponse> addMedia({
    required String productId,
    required File image,
  }) async {
    final res = await postFromData(
      serviceProductMediaURl,
      data: {
        'image': await MultipartFile.fromFile(image.path,
            filename: image.path.split('/').last),
        'productId': productId,
      },
    );

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

  Future<BaseResponse> updateMedia({
    required String productId,
    required String imageId,
    required File image,
  }) async {
    final res = await putFromData(
      serviceProductMediaURl,
      data: {
        'image': await MultipartFile.fromFile(image.path,
            filename: image.path.split('/').last),
        'productId': productId,
        'mediaId': imageId,
      },
    );

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

  Future<BaseResponse> removeMedia({
    required String productId,
    required String imageId,
  }) async {
    final res = await delete(
      serviceProductMediaURl,
      data: {
        'productId': productId,
        'mediaId': imageId,
      },
    );

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

  Future<BaseResponse> sendTips({
    required String sellerId,
    required double amount,
  }) async {
    final res = await post(
      orderTippingUrl,
      data: {
        'sellerId': sellerId,
        'tipping_amount': amount,
      },
    );

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
}
