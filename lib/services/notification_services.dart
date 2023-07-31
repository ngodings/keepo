// import 'dart:io';
//
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get_it/get_it.dart';
// import 'package:keepo/firebase_options.dart';
// import 'package:keepo/services/navigation.dart';
// import 'package:keepo/utils/app_routes.dart';
// import 'package:clear_all_notifications/clear_all_notifications.dart';
//
// class HelperNotification {
//   // static Future initialize(
//   //     FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
//   //   var androidInitialize =
//   //       const AndroidInitializationSettings('mipmap/ic_launcher');
//   //   var iOSInitialize = const DarwinInitializationSettings(
//   //     requestSoundPermission: false,
//   //     requestBadgePermission: false,
//   //     requestAlertPermission: false,
//   //   );
//   //   var initializationsSettings =
//   //       InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
//   //   await flutterLocalNotificationsPlugin.initialize(initializationsSettings);
//   // }
//
//   static FirebaseMessaging? _firebaseMessaging;
//
//   static FirebaseMessaging get firebaseMessaging =>
//       HelperNotification._firebaseMessaging ?? FirebaseMessaging.instance;
//
//   static Future<void> initializeFirebase() async {
//     await Firebase.initializeApp(
//         options: DefaultFirebaseOptions.currentPlatform);
//     HelperNotification._firebaseMessaging = FirebaseMessaging.instance;
//     await HelperNotification.initializeLocalNotifications();
//     await HelperNotification.setupInteractedMessage();
//   }
//
//   Future<String?> getDeviceToken() async =>
//       await FirebaseMessaging.instance.getToken();
//
//   static final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//
//   static Future<void> initializeLocalNotifications() async {
//     const InitializationSettings initSettings = InitializationSettings(
//         android: AndroidInitializationSettings("mipmap/ic_launcher"),
//         iOS: DarwinInitializationSettings(
//           requestSoundPermission: false,
//           requestBadgePermission: false,
//           requestAlertPermission: false,
//         ));
//
//     /// on did receive notification response = for when app is opened via notification while in foreground on android
//     await HelperNotification._localNotificationsPlugin.initialize(initSettings);
//
//     /// need this for ios foreground notification
//     await HelperNotification.firebaseMessaging
//         .setForegroundNotificationPresentationOptions(
//       alert: false, // Required to display a heads up notification
//       badge: false, sound: false,
//     );
//   }
//
//   static NotificationDetails platformChannelSpecifics =
//       const NotificationDetails(
//     android: AndroidNotificationDetails(
//       "high_importance_channel",
//       "High Importance Notifications",
//       priority: Priority.low,
//       importance: Importance.max,
//     ),
//   );
//
//   static Future<void> setupInteractedMessage() async {
//     // Get any messages which caused the application to open from
//     // a terminated state.
//     RemoteMessage? initialMessage =
//         await FirebaseMessaging.instance.getInitialMessage();
//
//     // If the message also contains a data property with a "type" of "chat",
//     // navigate to a chat screen
//     if (initialMessage != null) {
//       _handleMessage(initialMessage);
//     }
//
//     // Also handle any interaction when the app is in the background via a
//     // Stream listener
//     FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
//   }
//
//   static void _handleMessage(RemoteMessage message) async {
//     debugPrint("DATA NOTIFICATION ${message.data}");
//     await ClearAllNotifications.clear();
//     // await Future.delayed(const Duration(milliseconds: 500));
//     // if (message.data['groupId'] == null) {
//     //   await GetIt.I<NavigationServiceMain>().pushNamed(
//     //     AppRoutes.singleChatRoom,
//     //     args: message.data,
//     //   )?.then((value) {
//     //     GetIt.I<NavigationServiceMain>().pushRemoveUntil(AppRoutes.homePage);
//     //   });
//     // } else {
//       await GetIt.I<NavigationServiceMain>().pushNamed(
//         message.data['page'] ?? AppRoutes.homePage,
//         args: message.data['pushNotificationData'],
//       )?.then((value) {
//         GetIt.I<NavigationServiceMain>().pushRemoveUntil(AppRoutes.homePage);
//       });
//       // await GetIt.I<NavigationServiceMain>().pushNamed(
//       //   AppRoutes.groupChatRoom,
//       //   args: {
//       //     'groupId': message.data['groupId'],
//       //     'groupPic': message.data['groupPic'],
//       //     'groupName': message.data['groupName'],
//       //     'createdAt': message.data['createdAt'] == null
//       //         ? null
//       //         : DateTime.parse(message.data["createdAt"]),
//       //     'creatorId': message.data['creatorId']
//       //   },
//       // )?.then((value) {
//       //   GetIt.I<NavigationServiceMain>().pushRemoveUntil(AppRoutes.homePage);
//       // });
//     // }
//   }
//
//   static Future showBigTextNotification(
//       {var id = 0,
//       required String title,
//       required String body,
//       int? delay,
//       var payload,
//       required FlutterLocalNotificationsPlugin fln}) async {
//     AndroidNotificationDetails androidPlatformChannelSpecifics =
//         const AndroidNotificationDetails(
//       'channel_title',
//       'channel_name',
//       playSound: false,
//       sound: RawResourceAndroidNotificationSound('notification'),
//       importance: Importance.max,
//       priority: Priority.defaultPriority,
//     );
//
//     var not = NotificationDetails(
//       android: androidPlatformChannelSpecifics,
//       iOS: const DarwinNotificationDetails(),
//     );
//
//     await Future.delayed(Duration(seconds: delay ?? 0));
//     await fln.show(0, title, body, not);
//   }
//
//   Future<String?> getFcmToken() async {
//     final firebaseMsg = GetIt.I<FirebaseMessaging>();
//     final fcmTokenValue = await firebaseMsg.getToken();
//
//     return fcmTokenValue;
//   }
// }

import 'dart:convert';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:keepo/firebase_options.dart';
import 'package:keepo/models/chat/chat_list_model.dart';
import 'package:keepo/services/navigation.dart';
import 'package:keepo/utils/app_routes.dart';
import 'package:clear_all_notifications/clear_all_notifications.dart';

class HelperNotification {
  // static Future initialize(
  //     FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
  //   var androidInitialize =
  //       const AndroidInitializationSettings('mipmap/ic_launcher');
  //   var iOSInitialize = const DarwinInitializationSettings(
  //     requestSoundPermission: false,
  //     requestBadgePermission: false,
  //     requestAlertPermission: false,
  //   );
  //   var initializationsSettings =
  //       InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
  //   await flutterLocalNotificationsPlugin.initialize(initializationsSettings);
  // }

  // static final HelperNotification _instance = HelperNotification._internal();
  //
  // factory HelperNotification() {
  //   return _instance;
  // }
  //
  // HelperNotification._internal();

  static FirebaseMessaging? _firebaseMessaging;

  static FirebaseMessaging get firebaseMessaging =>
      HelperNotification._firebaseMessaging ?? FirebaseMessaging.instance;

  static Future<void> initializeFirebase() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    HelperNotification._firebaseMessaging = FirebaseMessaging.instance;
    await HelperNotification.initializeLocalNotifications();
    await HelperNotification.setupInteractedMessage();
  }

  Future<String?> getDeviceToken() async =>
      await FirebaseMessaging.instance.getToken();

  static final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initializeLocalNotifications() async {
    const InitializationSettings initSettings = InitializationSettings(
      android: AndroidInitializationSettings("mipmap/ic_launcher"),
      iOS: DarwinInitializationSettings(
        requestSoundPermission: false,
        requestBadgePermission: false,
        requestAlertPermission: false,
      ),
    );

    /// on did receive notification response = for when app is opened via notification while in foreground on android
    await HelperNotification._localNotificationsPlugin.initialize(initSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);

    /// need this for ios foreground notification
    await HelperNotification.firebaseMessaging
        .setForegroundNotificationPresentationOptions(
      alert: false, // Required to display a heads up notification
      badge: false, sound: false,
    );
  }

  static NotificationDetails platformChannelSpecifics =
      const NotificationDetails(
    android: AndroidNotificationDetails(
      'channel_title',
      'channel_name',
      playSound: false,
      sound: RawResourceAndroidNotificationSound('notification'),
      importance: Importance.max,
      priority: Priority.defaultPriority,
    ),
  );

  static Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);

    FirebaseMessaging.onMessage.listen((event) async {
      debugPrint("NOTIF DATA LISTEN ${event.data}");

      if (event.data['type'] == "Chat" || event.data['type'] == "GroupChat") {
        await ClearAllNotifications.clear();
        // await HelperNotification.firebaseMessaging
        //     .setForegroundNotificationPresentationOptions(
        //   alert: false, // Required to display a heads up notification
        //   badge: false,
        //   sound: false,
        // );
      } else {
        HelperNotification.showBigTextNotification(
          title: event.data['title'],
          body: event.data['message'],
          fln: GetIt.I<FlutterLocalNotificationsPlugin>(),
          payload: jsonEncode(event.data),
        );
      }
    });
  }

  static void _handleMessage(RemoteMessage message) async {
    debugPrint("DATA NOTIFICATION ${message.data}");
    await ClearAllNotifications.clear();
    if (message.data['type'] == "GroupChat") {
      final chat =
          Chat.fromJson(jsonDecode(message.data['push_notification_data']));
      await GetIt.I<NavigationServiceMain>().pushRemoveUntil(
        AppRoutes.groupChatRoom,
        args: {
          'groupId': chat.groupId,
          'groupPic': chat.groupImage,
          'groupName': chat.groupName,
          'createdAt': chat.createdAt,
          'creatorId': chat.selfId,
        },
      )?.then((value) =>
          GetIt.I<NavigationServiceMain>().pushNamed(AppRoutes.homePage));
    } else {
      await GetIt.I<NavigationServiceMain>()
          .pushRemoveUntil(
            message.data['page'] ?? AppRoutes.homePage,
            args: jsonDecode(message.data['push_notification_data']),
          )
          ?.then((value) =>
              GetIt.I<NavigationServiceMain>().pushNamed(AppRoutes.homePage));
    }
  }

  static void onDidReceiveNotificationResponse(
      NotificationResponse resp) async {
    debugPrint("DATA NOTIFICATION LOCAL ${resp.payload}");
    if (resp.payload.isNotEmptyAndNotNull) {
      final decodeData = await jsonDecode(resp.payload!);

      await ClearAllNotifications.clear();
      GetIt.I<NavigationServiceMain>().pushNamed(
        decodeData['page'] ?? AppRoutes.homePage,
        args: jsonDecode(
          decodeData['push_notification_data'],
        ),
      );
    }
  }

  static Future showBigTextNotification(
      {var id = 0,
      required String title,
      required String body,
      int? delay,
      var payload,
      required FlutterLocalNotificationsPlugin fln}) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        const AndroidNotificationDetails(
      'channel_title',
      'channel_name',
      playSound: false,
      sound: RawResourceAndroidNotificationSound('notification'),
      importance: Importance.max,
      priority: Priority.defaultPriority,
    );

    var not = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: const DarwinNotificationDetails(),
    );

    await Future.delayed(Duration(seconds: delay ?? 0));
    await fln.show(0, title, body, not, payload: payload);
  }

  Future<String?> getFcmToken() async {
    try {
      // await FirebaseMessaging.instance.deleteToken();
      final firebaseMsg = GetIt.I<FirebaseMessaging>();
      await firebaseMsg.getAPNSToken();
      final fcmTokenValue = await firebaseMsg.getToken();

      return fcmTokenValue;
    } catch (e) {
      return '';
    }
  }
}
