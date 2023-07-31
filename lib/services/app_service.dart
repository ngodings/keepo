// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:flutter_sms/flutter_sms.dart';
// import 'package:get_it/get_it.dart';
// import 'package:singleton/singleton.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:url_launcher/url_launcher.dart';

// class AppService {
//   //

//   static AppService? _instance;

//   static AppService? get instance {
//     if (_instance == null) {
//       _instance = AppService._();
//     }

//     return _instance;
//   }

//   /// Factory method that reuse same instance automatically
//   // factory AppService() => Singleton.lazy(() => AppService._()).instance;

//   /// Private constructor
//   AppService._() {}

//   final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
//   BehaviorSubject<int> homePageIndex = BehaviorSubject<int>();



//   static void openSmsService(String text, {String? number}) async {
//     if (Platform.isAndroid) {
//       final Uri smsLaunchUri = Uri(
//         scheme: 'sms',
//         path: number,
//         queryParameters: <String, String>{
//           'body': text,
//         },
//       );

//       if (await launchUrl(smsLaunchUri)) {
//         // showSuccessTopFlash("launching sms app");
//         debugPrint("SUCCESS LAUNCHING SMS");
//       } else {
//         //app is not opened
//       }
//     } else if (Platform.isIOS) {
//       await sendSMS(message: text, recipients: number != null ? [number] : [], sendDirect: true)
//               .catchError((onError) {
//         debugPrint("$onError");
//       });
//     } else {
//       throw StateError('unknown platform');
//     }
//   }
// }
