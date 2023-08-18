import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:keepo/features/intro/introduction_screen.dart';
import 'package:keepo/utils/app/app_routes.dart';

import '../features/splash/home_page.dart';
import '../features/splash/splash_screen.dart';

void configureRoutes() {
  final router = GetIt.I<FluroRouter>();
  router.notFoundHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const HomePage();
    },
  );

  // On Boarding

  router.define(
    AppRoutes.introduce,
    handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      // final args = context?.arguments != null
      //     ? context?.arguments as Map<String, dynamic>
      //     : null;
      return IntroductionScreen();
    }),
    transitionType: TransitionType.fadeIn,
  );

  // router.define(
  //   AppRoutes.homePage,
  //   handler: Handler(
  //       handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  //     final args = context?.arguments != null
  //         ? context?.arguments as Map<String, dynamic>
  //         : null;
  //     return const HomePage();
  //   }),
  //   transitionType: TransitionType.fadeIn,
  // );

  // router.define(
  //   AppRoutes.splashScreen,
  //   handler: Handler(
  //     handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
  //         const SplashScreen(),
  //   ),
  //   transitionType: TransitionType.fadeIn,
  // );
}
