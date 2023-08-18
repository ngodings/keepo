import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:keepo/services/permission_handler.dart';
import 'package:keepo/services/set_secure_storage_data.dart';
import 'package:keepo/services/socket_service.dart';

import 'package:keepo/utils/string.dart';

import '../services/dio_service.dart';
import '../services/navigation.dart';
import '../utils/app/app_routes.dart';

class MainRepository {
  MainRepository() {
    _init();
  }
}

_init() async {
  await Future.delayed(const Duration(seconds: 1));
  GetIt.I<NavigationServiceMain>().pushRemoveUntil(AppRoutes.introduce);
}

Future<bool> setConfig(String lang) async {
  // await _setupLocalNotification();
  // await initUniLinks();
  // await initDynamicLinks();
  // getDynamicLinkData();
  //await getBannedWordsData();

  // await FirebaseMessaging.instance.requestPermission(
  //   alert: true,
  //   announcement: false,
  //   badge: true,
  //   carPlay: false,
  //   criticalAlert: false,
  //   provisional: false,
  //   sound: true,
  // );
  // await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
  //   alert: true,
  //   badge: true,
  //   sound: true,
  // );
  //await _setupFCM();
  Dio dio = _setupDio(lang);
  DIService.initializeConfig(dio);

  return await _isLoggedIn();
}

Future _isLoggedIn() async {
  final prefs = await SharedPreferences.getInstance();
  final secureStorage = GetIt.I<FlutterSecureStorage>();

  if (prefs.getBool('first_run') ?? true) {
    await secureStorage.deleteAll();

    prefs.setBool('first_run', false);

    return false;
  } else {
    final token = await secureStorage.read(key: tokenUser);
    return token != null;
  }
}

Dio _setupDio(String lang) {
  BaseOptions options = BaseOptions(
      baseUrl: FlavorConfig.instance.variables["baseUrl"],
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout:
          const Duration(seconds: 10), // const Duration(seconds: 10)
      sendTimeout: const Duration(seconds: 10),
      headers: {
        'accept': 'application/json',
        'X-Localization': lang,
      });

  Dio dio = Dio(options);

  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (HttpClient client) {
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  };

  dio.interceptors.add(LogInterceptor(
    responseBody: true,
    error: true,
    request: true,
    requestBody: true,
  ));

  return dio;
}

// Future initUniLinks() async {
//   StreamSubscription? sub;
//   final username =
//       await GetIt.I<FlutterSecureStorage>().read(key: activeUsernameProfile);
//   debugPrint('ini username $username');

//   sub = linkStream.listen((String? link) {
//     if (link != null) {
//       // var uri = Uri.parse(link);

//       if (link.isNotEmpty) {
//         String uri = link.split("/invite/")[1];
//         debugPrint('ini uri $link');
//         if (username == uri) {
//           GetIt.I<NavigationServiceMain>()
//               .pushRemoveUntil(AppRoutes.homePage, args: {'index': 3});
//         } else {
//           debugPrint('ini parameter ======= > $uri');
//           GetIt.I<NavigationServiceMain>().pushNamed(AppRoutes.completeProfile,
//               args: {
//                 'profileId': null,
//                 'notSelfProfile': true,
//                 'inContact': false,
//                 'username': uri
//               });
//         }
//       }
//     }
//   });
//   debugPrint(sub.toString());
// }

void signOut() async {
  final result =
      await GetIt.I<FlutterSecureStorage>().read(key: dialCodeStorage);
  await GetIt.I<FlutterSecureStorage>().deleteAll();
  // await GetIt.I<NavigationServiceMain>()
  //     .pushRemoveUntil(AppRoutes.login, args: {'initialCode': result ?? ''});
}

// NEED CLEAN CODE SOOOOOOOOOOOOOOOOOOOOON

/// Create a [AndroidNotificationChannel] for heads up notifications
AndroidNotificationChannel androidChannel = const AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications',
  description: 'This channel is used for important notifications', // title
  // 'This channel is used for important notifications.', // description
  importance: Importance.max,
  enableVibration: true,
  playSound: true,
);

// Future _setupLocalNotification() async {
//   const AndroidInitializationSettings initializationSettingsAndroid =
//       AndroidInitializationSettings('@mipmap/ic_launcher');
//   const IOSInitializationSettings initializationSettingsIOS =
//       IOSInitializationSettings();

//   InitializationSettings initializationSettings = const InitializationSettings(
//       android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

//   await GetIt.I<FlutterLocalNotificationsPlugin>().initialize(
//       initializationSettings,
//       onSelectNotification: _selectNotification);

//   if (Platform.isAndroid) {
//     await GetIt.I<FlutterLocalNotificationsPlugin>()
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()!
//         .createNotificationChannel(androidChannel);
//   }
// }

// Future _selectNotification(String? payload) async {
//   if (payload != null) {
//     if (kDebugMode) {
//       print('notification payload: $payload');
//     }

//     return GetIt.I<NavigationServiceMain>()
//         .pushReplacementNamed(AppRoutes.homePage);
//   }
// }

// _setupFCM() {
//   FirebaseMessaging.onBackgroundMessage(backgroundMsgHandler);
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//     RemoteNotification? notification = message.notification;
//     AndroidNotification? android = message.notification?.android;

//     debugPrint('Message data ============> ${message.data}');
//     if (notification != null && android != null) {
//       debugPrint('Got a message whilst in the foreground!');
//       await GetIt.I<FlutterLocalNotificationsPlugin>().show(
//           notification.hashCode,
//           notification.title,
//           notification.body,
//           NotificationDetails(
//             android: AndroidNotificationDetails(
//                 androidChannel.id, androidChannel.name),
//           ));
//     }
//   });
// }

// Future<dynamic> backgroundMsgHandler(RemoteMessage msg) async {
//   //use package firebase core
//   await Firebase.initializeApp();
// }


