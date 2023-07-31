import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../screen/page/home_page.dart';
import '../screen/page/splash_screen.dart';
import '../utils/app_routes.dart';

void configureRoutes() {
  final router = GetIt.I<FluroRouter>();
  router.notFoundHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const HomePage();
    },
  );

  // On Boarding
  router.define(
    AppRoutes.homePage,
    handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      final args = context?.arguments != null
          ? context?.arguments as Map<String, dynamic>
          : null;
      return HomePage();
    }),
    transitionType: TransitionType.fadeIn,
  );

  router.define(
    AppRoutes.splashScreen,
    handler: Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          const SplashScreen(),
    ),
    transitionType: TransitionType.fadeIn,
  );
}
