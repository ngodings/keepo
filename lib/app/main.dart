import 'package:clear_all_notifications/clear_all_notifications.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:keepo/app/routes.dart';
import 'package:keepo/services/notification_services.dart';

import '../features/splash/splash_screen.dart';
import '../services/dio_service.dart';
import '../services/navigation.dart';
import '../utils/themes.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    //  HelperNotification.initializeFirebase();
    DIService.initialize();
    configureRoutes();
    // HelperNotification.initialize(FlutterLocalNotificationsPlugin());
    // clearNotification();
  }

  // void clearNotification() async {
  //   await ClearAllNotifications.clear();
  // }

  @override
  Widget build(BuildContext context) {
    final serviceLocator = GetIt.instance;
    return ScreenUtilInit(
      // designSize: const Size(360, 640),
      builder: (context, widget) => GlobalLoaderOverlay(
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          navigatorObservers: [
            SentryNavigatorObserver(),
          ],
          locale: context.locale,
          navigatorKey: serviceLocator<NavigationServiceMain>().navigatorKey,
          onGenerateRoute: serviceLocator<FluroRouter>().generator,
          themeMode: ThemeMode.dark,
          //  themeMode: currentTheme.currentTheme(),
          theme: ThemeData(
            fontFamily: GoogleFonts.inter().fontFamily,
            colorScheme: lightTheme,
            primaryColor: lightTheme.primary,
            secondaryHeaderColor: lightTheme.secondary,
            backgroundColor: lightTheme.background,
            scaffoldBackgroundColor: lightTheme.background,
            brightness: lightTheme.brightness,
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          darkTheme: ThemeData(
            colorScheme: darkTheme,
            primaryColor: darkTheme.primary,
            secondaryHeaderColor: darkTheme.secondary,
            backgroundColor: darkTheme.background,
            scaffoldBackgroundColor: darkTheme.background,
            brightness: darkTheme.brightness,
          ),
          home: const Splash(),
        ),
      ),
    );
  }
}
