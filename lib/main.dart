import 'dart:async';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keepo/blocs/user_data_cubit/user_data_cubit.dart';
import 'package:keepo/services/socket_service.dart';
import 'package:keepo/utils/string.dart';
import 'package:keepo/utils/themes.dart';

import 'app/main.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  debugPrint("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0x19000000),
    statusBarIconBrightness: Brightness.dark,
  ));

  // await CompositionRoot.configure();

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  // FlutterError.onError = (details) {
  //   log(details.exceptionAsString(), stackTrace: details.stack);
  // };

  await Firebase.initializeApp();

  await FlutterDownloader.initialize(
      debug:
          true, // optional: set to false to disable printing logs to console (default: true)
      ignoreSsl:
          true // option: set to false to disable working with http links (default: false)
      );

  FlavorConfig(
    name: "MAIN",
    color: background,
    location: BannerLocation.topStart,
    variables: {
      "baseUrl": "",
      baseUrlSocketServer: "",
    },
  );

  SocketApi.init();

  runZonedGuarded(
    () => runApp(
      EasyLocalization(
        startLocale: const Locale('en', 'US'),
        supportedLocales: const [Locale('en', 'US'), Locale('id', 'ID')],
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
