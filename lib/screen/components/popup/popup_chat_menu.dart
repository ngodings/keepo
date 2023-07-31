import 'package:app_popup_menu/app_popup_menu.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:keepo/models/profile/profile_details.dart';
import 'package:keepo/services/navigation.dart';
import 'package:keepo/utils/app_assets.dart';
import 'package:keepo/utils/app_routes.dart';
import 'package:keepo/utils/themes.dart';

class PopupChatMenu extends StatelessWidget {
  const PopupChatMenu({
    Key? key,
    this.profileDetails,
  }) : super(key: key);
  final ProfileDetails? profileDetails;

  @override
  Widget build(BuildContext context) {
    return AppPopupMenu<int>(
      menuItems: [
        PopupMenuItem(
          value: 1,
          child: buildPopupMenuItem(
            context,
            label: "new_message",
            icon: AppSvg.messageAdd,
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: buildPopupMenuItem(
            context,
            label: "create_group",
            icon: AppSvg.people,
          ),
        ),
        PopupMenuItem(
          value: 3,
          child: buildPopupMenuItem(
            context,
            label: "scan_qr",
            icon: AppSvg.scan,
          ),
        ),
        PopupMenuItem(
          value: 4,
          child: buildPopupMenuItem(
            context,
            label: "my_qr",
            icon: AppSvg.scanBarcode,
          ),
        ),
      ],
      onSelected: (int value) {
        if (value == 1) {
          GetIt.I<NavigationServiceMain>().pushNamed(AppRoutes.newMessage);
        } else if (value == 2) {
          GetIt.I<NavigationServiceMain>()
              .pushNamed(AppRoutes.groupInformationHandling);
        } else if (value == 3) {
          GetIt.I<NavigationServiceMain>().pushNamed(
            AppRoutes.scanQrCode,
            args: {'profileDetails': profileDetails},
          );
        } else if (value == 4) {
          GetIt.I<NavigationServiceMain>().pushNamed(
            AppRoutes.myQrCode,
            args: {'profileDetails': profileDetails},
          );
        }
        // InheritedData.of(appMenu02.context!)?.data = value;
        // ScaffoldMessenger.of(appMenu02.context!).showSnackBar(
        //   SnackBar(
        //     content: Text('appMenu02 option: $value'),
        //   ),
        // );
      },
      onCanceled: () {
        // ScaffoldMessenger.of(appMenu02.context!).showSnackBar(
        //   const SnackBar(
        //     content: Text('appMenu02: Nothing selected.'),
        //   ),
        // );
      },
      elevation: 12,
      padding: EdgeInsets.zero,
      color: CustomColor.inversePrimary,
      tooltip: "",
      icon: SvgPicture.asset(
        AppSvg.addCircle,
        width: 24.sp,
        height: 24.sp,
      ),
      offset: Offset(0, 45.sp),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}

Widget buildPopupMenuItem(context,
    {required String label, required String icon}) {
  return HStack(
    [
      SvgPicture.asset(
        icon,
        width: 21.sp,
        height: 21.sp,
      ).box.rounded.p8.color(CustomColor.inverseSurface).make(),
      Gap(8.sp),
      Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
      ).tr()
    ],
  );
}
