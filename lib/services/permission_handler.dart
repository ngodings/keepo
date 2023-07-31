import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:record/record.dart';
import 'package:keepo/enums/permission_enum.dart';
import 'package:keepo/services/navigation.dart';
import 'package:keepo/utils/alert_toast.dart';
import 'package:keepo/utils/app_routes.dart';
import 'package:keepo/utils/string.dart';

late Permission permission;
PermissionStatus permissionStatus = PermissionStatus.denied;

// class PermissionHandler {
//   void listenForPermission() async {
//     switch (permissionStatus) {
//       case PermissionStatus.denied:
//         requestForLocation();
//         requestForCameraPermission();
//         break;
//       case PermissionStatus.granted:
//         break;
//
//       case PermissionStatus.limited:
//         break;
//       case PermissionStatus.restricted:
//         break;
//       case PermissionStatus.permanentlyDenied:
//         break;
//     }
//   }
// }

Future<bool> requestForCameraPermission() async {
  final status = await Permission.camera.status;
  if (status.isDenied) {
    await GetIt.I<NavigationServiceMain>().pushNamed(
      AppRoutes.preAlertPermissionAccessScreen,
      args: {
        'type': PermissionEnum.camera,
        'onTap': () async {
          permissionStatus = await Permission.camera.request();
          GetIt.I<NavigationServiceMain>().pop();
        },
      },
    );

    return permissionStatus.isGranted;
  } else if (status.isGranted) {
    permissionStatus = status;
    return permissionStatus.isGranted;
  } else {
    return false;
  }
}

Future<bool> requestForGalleryPermission() async {
  final status = Platform.isAndroid
      ? await Permission.storage.status
      : await Permission.photos.status;
  debugPrint("GALLERY PERMISSION $status");
  bool galleryAccess = false;
  if (status.isDenied) {
    await GetIt.I<NavigationServiceMain>().pushNamed(
      AppRoutes.preAlertPermissionAccessScreen,
      args: {
        'type': PermissionEnum.gallery,
        'onTap': () async {
          final result = await PhotoManager.requestPermissionExtend();
          galleryAccess = result.hasAccess;
          GetIt.I<NavigationServiceMain>().pop();
        },
      },
    );

    return galleryAccess;
  } else {
    final result = await PhotoManager.requestPermissionExtend();
    return result.hasAccess;
  }
}

Future<void> requestForLocation() async {
  final status = await Permission.location.request();
  permissionStatus = status;
}

Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();

  if (!serviceEnabled) {
    showWarningTopFlash('permission_location_disabled'.tr(),
        duration: const Duration(seconds: 5));
    return Future.error(Exception('location_services_are_disabled'.tr()));
  }

  permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      showWarningTopFlash('permission_location_denied'.tr(),
          duration: const Duration(seconds: 5));
      return Future.error(Exception("location_permission_denied".tr()));
    }
  }

  if (permission == LocationPermission.deniedForever) {
    final getSavedLocal = await GetIt.I<FlutterSecureStorage>()
        .read(key: saveWhenDenyLocPermission);
    if (getSavedLocal != null &&
        getSavedLocal.isNotEmpty &&
        getSavedLocal == saved) {
      return Future.error(
          Exception('LOCATION PERMISSION DENIED, LOCAL HANDLING ALERT SAVED'));
    } else {
      await GetIt.I<FlutterSecureStorage>()
          .write(key: saveWhenDenyLocPermission, value: saved);
      showWarningTopFlash('permission_location_permanently_denied'.tr(),
          duration: const Duration(seconds: 5));
      return Future.error(
          Exception('location_permissions_are_permanently_denied'.tr()));
    }
  }

  Position position = await Geolocator.getCurrentPosition();

  return position;
}

Future getContacts() async {
  List<Contact> contacts = [];
  try {
    var status = await Permission.contacts.status;
    debugPrint("CONTACT ACCESS $status");
    if (status.isDenied) {
      await GetIt.I<NavigationServiceMain>().pushNamed(
        AppRoutes.preAlertPermissionAccessScreen,
        args: {
          'type': PermissionEnum.contact,
          'onTap': () async {
            await FlutterContacts.requestPermission();
            GetIt.I<NavigationServiceMain>().pop();
          },
        },
      );

      if (await FlutterContacts.requestPermission()) {
        return await FlutterContacts.getContacts(withProperties: true);
      } else {
        return false;
      }
    } else if (status.isGranted) {
      contacts = await FlutterContacts.getContacts(withProperties: true);
    } else if (!await FlutterContacts.requestPermission()) {
      return false;
    } else {
      return false;
    }

    // if (await FlutterContacts.requestPermission()) {
    //   contacts = await FlutterContacts.getContacts(withProperties: true);
    // } else if (!await FlutterContacts.requestPermission()) {
    //   return false;
    // }
  } catch (e) {
    debugPrint(e.toString());
  }
  return contacts;
}

Future<bool> requestRecordPermission() async {
  final record = Record();
  final status = await Permission.microphone.status;
  if (status.isDenied) {
    await GetIt.I<NavigationServiceMain>().pushNamed(
      AppRoutes.preAlertPermissionAccessScreen,
      args: {
        'type': PermissionEnum.microphone,
        'onTap': () async {
          await record.hasPermission();
          GetIt.I<NavigationServiceMain>().pop();
        },
      },
    );

    return await record.hasPermission();
  } else if (status.isGranted) {
    return true;
  } else {
    return false;
  }
}

Future requestNotificationsPermission() async {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final status = await Permission.notification.status;
  bool? result;
  debugPrint("STATUS NOTIFICATION PERMISSION $status");
  if (status.isDenied) {
    await GetIt.I<NavigationServiceMain>().pushNamed(
      AppRoutes.preAlertPermissionAccessScreen,
      args: {
        'type': PermissionEnum.notification,
        'onTap': () async {
          if (Platform.isIOS) {
            result = await flutterLocalNotificationsPlugin
                .resolvePlatformSpecificImplementation<
                    IOSFlutterLocalNotificationsPlugin>()
                ?.requestPermissions(
                  alert: true,
                  badge: true,
                  sound: true,
                );
          } else if (Platform.isAndroid) {
            result = await flutterLocalNotificationsPlugin
                .resolvePlatformSpecificImplementation<
                    AndroidFlutterLocalNotificationsPlugin>()
                ?.requestPermission();
          } else {
            result = false;
          }
          GetIt.I<NavigationServiceMain>().pop();
        },
      },
    );

    if (!(result ?? false)) {
      showWarningTopFlash('permission_notification_denied'.tr(),
          duration: const Duration(seconds: 5));
    }
    return result;
  } else if (status.isGranted) {
    return true;
  } else {
    return false;
  }
}
