import 'package:easy_localization/easy_localization.dart';
import 'package:flash/flash.dart' hide Toast;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:keepo/utils/app_assets.dart';
import 'package:keepo/utils/extensions.dart';
import 'package:keepo/utils/themes.dart';

import '../services/navigation.dart';

void showToastError(String message) {
  Fluttertoast.showToast(
    msg: message.capitalize.tr(),
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.grey.withOpacity(0.7),
    textColor: Colors.white,
    fontSize: 14.0,
  );
}

void showToastWarning(String message) {
  Fluttertoast.showToast(
    msg: message.capitalize.tr(),
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.yellow,
    textColor: Colors.black,
    fontSize: 14.0,
  );
}

void showToastSuccess(String message) {
  Fluttertoast.showToast(
    msg: message.capitalize.tr(),
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.grey,
    textColor: Colors.white,
    fontSize: 14.0,
  );
}

void showSuccessTopFlash(String message) {
  final context =
      GetIt.I<NavigationServiceMain>().navigatorKey.currentState!.context;
  // context.showFlashBar(
  //   icon: Icon(
  //     Icons.check_circle,
  //     color: Colors.white,
  //     size: 24.sp,
  //   ).pOnly(left: 18.sp, right: 10.sp),
  //   content: Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       Expanded(
  //         child: Text(
  //           message,
  //           maxLines: 2,
  //           overflow: TextOverflow.ellipsis,
  //           style: TextStyle(
  //               color: Colors.white,
  //               fontSize: 12.sp,
  //               fontWeight: FontWeight.w500),
  //         ),
  //       ),
  //       // ).tr(),
  //       Icon(
  //         Icons.close,
  //         color: Colors.white,
  //         size: 24.sp,
  //       ).onTap(() {
  //         // GetIt.I<NavigationServiceMain>().pop();
  //       }),
  //     ],
  //   ),
  //   duration: const Duration(milliseconds: 1500),
  //   position: FlashPosition.top,
  //   backgroundColor: c1F9E9C,
  // );
}

void showWarningTopFlash(String message, {Duration? duration}) {
  final context =
      GetIt.I<NavigationServiceMain>().navigatorKey.currentState!.context;
  // context.showFlashBar(
  //   icon: SvgPicture.asset(
  //     AppSvg.infoCircle,
  //     color: Colors.white,
  //   ).pOnly(left: 18.sp, right: 10.sp),
  //   content: Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       SizedBox(
  //         width: MediaQuery.of(context).size.width - 150,
  //         child: Text(
  //           message,
  //           // textAlign: TextAlign.justify,
  //           style: TextStyle(
  //               color: Colors.white,
  //               fontSize: 12.sp,
  //               fontWeight: FontWeight.w500),
  //         ).tr(),
  //       ),
  //       Icon(
  //         Icons.close,
  //         color: Colors.white,
  //         size: 24.sp,
  //       ).onTap(() {}),
  //     ],
  //   ),
  //   duration: duration ?? const Duration(milliseconds: 2500),
  //   position: FlashPosition.top,
  //   backgroundColor: CustomColor.error,
  // );
}

void showTopError(String message) {
  final context =
      GetIt.I<NavigationServiceMain>().navigatorKey.currentState!.context;
  // context.showFlashBar(
  //   content: Center(
  //     child: Text(
  //       message,
  //       style: const TextStyle(
  //         color: Colors.white,
  //         fontWeight: FontWeight.w500,
  //         fontSize: 14,
  //       ),
  //     ).tr(),
  //   ),
  //   duration: const Duration(milliseconds: 1500),
  //   position: FlashPosition.top,
  //   backgroundColor: error,
  // );
}
