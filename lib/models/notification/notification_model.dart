import 'package:keepo/enums/notification_enum.dart';

class NotificationModel {
  List<NotificationItem>? notificationChat;
  List<NotificationItem>? notificationBooking;
  List<NotificationItem>? notificationPayment;
  List<NotificationItem>? notificationWithdraw;
  List<NotificationItem>? notificationKyc;

  NotificationModel({
    this.notificationChat,
    this.notificationBooking,
    this.notificationPayment,
    this.notificationWithdraw,
    this.notificationKyc,
  });

  NotificationModel.fromJson(Map<String, dynamic> json) {
    if (json['notificationChat'] != null) {
      notificationChat = <NotificationItem>[];
      json['notificationChat'].forEach((v) {
        notificationChat!.add(NotificationItem.fromJson(v));
      });
    }
    if (json['notificationBooking'] != null) {
      notificationBooking = <NotificationItem>[];
      json['notificationBooking'].forEach((v) {
        notificationBooking!.add(NotificationItem.fromJson(v));
      });
    }
    if (json['notificationPayment'] != null) {
      notificationPayment = <NotificationItem>[];
      json['notificationPayment'].forEach((v) {
        notificationPayment!.add(NotificationItem.fromJson(v));
      });
    }
    if (json['notificationWithdraw'] != null) {
      notificationWithdraw = <NotificationItem>[];
      json['notificationWithdraw'].forEach((v) {
        notificationWithdraw!.add(NotificationItem.fromJson(v));
      });
    }
    if (json['notificationKyc'] != null) {
      notificationKyc = <NotificationItem>[];
      json['notificationKyc'].forEach((v) {
        notificationKyc!.add(NotificationItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (notificationChat != null) {
      data['notificationChat'] =
          notificationChat!.map((v) => v.toJson()).toList();
    }
    if (notificationBooking != null) {
      data['notificationBooking'] =
          notificationBooking!.map((v) => v.toJson()).toList();
    }
    if (notificationPayment != null) {
      data['notificationPayment'] =
          notificationPayment!.map((v) => v.toJson()).toList();
    }
    if (notificationWithdraw != null) {
      data['notificationWithdraw'] =
          notificationWithdraw!.map((v) => v.toJson()).toList();
    }
    if (notificationKyc != null) {
      data['notificationKyc'] =
          notificationKyc!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NotificationItem {
  String? id;
  NotificationEnum? type;
  String? sender;
  String? title;
  String? message;
  String? status;
  String? pushNotification;
  String? pushNotificationData;
  String? fcmToken;
  String? page;
  DateTime? createdAt;

  NotificationItem(
      {this.id,
      this.type,
      this.sender,
      this.title,
      this.message,
      this.status,
      this.pushNotification,
      this.pushNotificationData,
      this.fcmToken,
      this.page,
      this.createdAt});

  NotificationItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = ((json['type'] ?? "") as String).toEnum();
    sender = json['sender'];
    title = json['title'];
    message = json['message'];
    status = json['status'];
    pushNotification = json['push_notification'];
    pushNotificationData = json['push_notification_data'];
    fcmToken = json['fcmToken'];
    page = json['page'];
    createdAt =
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['sender'] = sender;
    data['title'] = title;
    data['message'] = message;
    data['status'] = status;
    data['push_notification'] = pushNotification;
    data['push_notification_data'] = pushNotificationData;
    data['fcmToken'] = fcmToken;
    data['page'] = page;
    data['createdAt'] = createdAt;
    return data;
  }
}

class NotificationReadStatus {
  String? id;
  String? status;

  NotificationReadStatus({this.status, this.id});

  NotificationReadStatus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    return data;
  }
}
