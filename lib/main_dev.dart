import 'dart:async';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keepo/blocs/user_data_cubit/user_data_cubit.dart';
import 'package:keepo/services/socket_service.dart';
import 'package:keepo/utils/string.dart';
import 'package:keepo/utils/themes.dart';

import 'app/main.dart';

// @pragma('vm:entry-point')
// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   await Firebase.initializeApp();

//   debugPrint("Handling a background message: ${message.messageId}");
// }

// late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  // AndroidNotificationChannel androidChannel = const AndroidNotificationChannel(
  //   'high_importance_channel',
  //   'High Importance Notifications',
  //   description: 'This channel is used for important notifications',
  //   importance: Importance.max,
  // );
  // await FlutterLocalNotificationsPlugin()
  //     .resolvePlatformSpecificImplementation<
  //         AndroidFlutterLocalNotificationsPlugin>()
  //     ?.createNotificationChannel(androidChannel);

  // await EasyLocalization.ensureInitialized();
  // await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   statusBarColor: Color(0x19000000),
  //   statusBarIconBrightness: Brightness.dark,
  // ));
  // await CompositionRoot.configure();

  // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  // await FlutterDownloader.initialize(
  //     debug: true,
  //     // optional: set to false to disable printing logs to console (default: true) test bitbitbuckbuck
  //     ignoreSsl:
  //         true // option: set to false to disable working with http links (default: false)
  //     );

  FlavorConfig(
    name: "DEV",
    color: background,
    location: BannerLocation.topStart,
    variables: {
      "baseUrl": '',
      baseUrlSocketServer: '',
    },
  );

  // SocketApi.init();

  // FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
  //   debugPrint('ini message === > $message');
  //   if (message != null) {
  //     debugPrint('success');
  //   }
  // });

  // FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
  //   RemoteNotification? notif = message.notification;
  //   AndroidNotification? android = message.notification?.android;
  //   if (notif != null && android != null && !kIsWeb) {
  //     FlutterLocalNotificationsPlugin().show(
  //       notif.hashCode,
  //       notif.title,
  //       notif.body,
  //       NotificationDetails(
  //         android: AndroidNotificationDetails(
  //           androidChannel.id,
  //           androidChannel.name,
  //           channelDescription: androidChannel.description,
  //         ),
  //       ),
  //     );
  //   }
  // });

  // FirebaseMessaging.onBackgroundMessage((message) async {
  //   RemoteNotification? notif = message.notification;
  //   AndroidNotification? android = message.notification?.android;
  //   if (notif != null && android != null && !kIsWeb) {
  //     FlutterLocalNotificationsPlugin().show(
  //       notif.hashCode,
  //       notif.title,
  //       notif.body,
  //       NotificationDetails(
  //         android: AndroidNotificationDetails(
  //           androidChannel.id,
  //           androidChannel.name,
  //           channelDescription: androidChannel.description,
  //         ),
  //       ),
  //     );
  //   }
  // });

  runZonedGuarded(
    () => runApp(
      EasyLocalization(
        startLocale: const Locale('en', 'US'),
        saveLocale: true,
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('id', 'ID'),
          Locale('th', 'TH'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en', 'US'),
        child: ProviderScope(
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => UserDataCubit(),
              ),
            ],
            child: const MyApp(),
          ),
        ),
      ),
    ),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
