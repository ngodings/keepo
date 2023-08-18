import 'package:app_popup_menu/app_popup_menu.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:keepo/utils/app_assets.dart';
import 'package:keepo/utils/themes.dart';

showPopupMenu({
  required BuildContext context,
  required Offset offset,
  required bool senderSide,
  Function()? onEdit,
  Function()? onReply,
  Function()? onCopy,
  Function()? onDelete,
  Function()? onPin,
  bool isElseThanTextType = false,
  bool removeDeleteOnSender = false,
  bool isAdminGroup = false,
  bool isUnpin = false,
}) async {
  double left = offset.dx;
  double right = offset.dx;
  double top = offset.dy;

  final replyMenu = PopupMenuItem(
    value: 2,
    onTap: onReply,
    child: buildPopupMenuItem(
      context,
      label: "Reply",
      icon: AppSvg.undo,
    ),
  );

  final deleteMenu = PopupMenuItem(
    value: 4,
    onTap: onDelete,
    child: buildPopupMenuItem(
      context,
      label: "Delete",
      icon: AppSvg.trash,
    ),
  );

  final copyMenu = PopupMenuItem(
    value: 3,
    onTap: onCopy,
    child: buildPopupMenuItem(
      context,
      label: "Copy",
      icon: AppSvg.documentGold,
    ),
  );

  final editMenu = PopupMenuItem(
    value: 1,
    onTap: onEdit,
    child: buildPopupMenuItem(
      context,
      label: "Edit",
      icon: AppSvg.editGold,
    ),
  );

  final pinMenu = PopupMenuItem(
    value: 0,
    onTap: onPin,
    child: buildPopupMenuItem(
      context,
      label: isUnpin ? "Unpin Message" : "Pin Message",
      icon: isUnpin ? AppSvg.unpin : AppSvg.pin,
    ),
  );

  List<PopupMenuEntry<int>> listPopupMenu() {
    if (isAdminGroup) {
      if (isElseThanTextType) {
        return [
          replyMenu,
          copyMenu,
          deleteMenu,
        ];
      } else {
        if (senderSide) {
          return [
            pinMenu,
            editMenu,
            replyMenu,
            copyMenu,
            deleteMenu,
          ];
        } else {
          return [
            pinMenu,
            replyMenu,
            copyMenu,
            deleteMenu,
          ];
        }
      }
    } else if (senderSide) {
      if (isElseThanTextType) {
        if (removeDeleteOnSender) {
          return [
            replyMenu,
          ];
        } else {
          return [
            replyMenu,
            deleteMenu,
          ];
        }
      } else {
        return [
          editMenu,
          replyMenu,
          copyMenu,
          deleteMenu,
        ];
      }
    } else {
      if (isElseThanTextType) {
        return [
          replyMenu,
        ];
      } else {
        return [
          replyMenu,
          copyMenu,
        ];
      }
    }
  }

  await showMenu(
    context: context,
    constraints: BoxConstraints(
      maxWidth: 180.w,
    ),
    position: RelativeRect.fromLTRB(
        senderSide ? left : 0, top + 20.sp, senderSide ? 0 : right, 0),
    items: listPopupMenu(),
    elevation: 12,
    color: CustomColor.inversePrimary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  );
}

Widget buildPopupMenuItem(context,
    {required String label, required String icon}) {
  return HStack(
    [
      Expanded(
        child: Text(
          label,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12.sp),
        ).tr(),
      ),
      Gap(8.sp),
      SvgPicture.asset(
        icon,
        width: 20.sp,
        height: 20.sp,
        color: icon == AppSvg.trash ? Colors.red : null,
      ),
    ],
  ).w(120.w);
}

class BuildItemPopupMessage extends StatelessWidget {
  const BuildItemPopupMessage({
    Key? key,
    required this.senderSide,
    this.onEdit,
    this.onReply,
    this.onCopy,
    this.onDelete,
    this.onPin,
    this.isElseThanTextType = false,
    this.removeDeleteOnSender = false,
    this.isAdminGroup = false,
    this.isUnpin = false,
  }) : super(key: key);
  final Function()? onEdit, onReply, onCopy, onDelete, onPin;
  final bool isElseThanTextType,
      removeDeleteOnSender,
      isAdminGroup,
      isUnpin,
      senderSide;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.sp,
      child: VStack(
        [
          if (isAdminGroup && !isElseThanTextType)
            buildPopupMenuItem(
              onTap: onPin,
              label: isUnpin ? "Unpin Message" : "Pin Message",
              icon: isUnpin ? AppSvg.unpin : AppSvg.pin,
            ),
          buildPopupMenuItem(
            onTap: onReply,
            label: "Reply",
            icon: AppSvg.undo,
          ),
          if (senderSide && !isElseThanTextType)
            buildPopupMenuItem(
              onTap: onEdit,
              label: "Edit",
              icon: AppSvg.editGold,
            ),
          if (!isElseThanTextType)
            buildPopupMenuItem(
              onTap: onCopy,
              label: "Copy",
              icon: AppSvg.documentGold,
            ),
          if (isAdminGroup || senderSide && !removeDeleteOnSender)
            buildPopupMenuItem(
              onTap: onDelete,
              label: "Delete",
              icon: AppSvg.trash,
            ),
        ],
      ),
    );
  }

  Widget buildPopupMenuItem(
      {required Function()? onTap,
      required String label,
      required String icon}) {
    return InkWell(
      onTap: onTap,
      child: HStack(
        [
          Expanded(
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12.sp),
            ).tr(),
          ),
          Gap(8.sp),
          SvgPicture.asset(
            icon,
            width: 20.sp,
            height: 20.sp,
            color: icon == AppSvg.trash ? Colors.red : null,
          ),
        ],
      ).h(40.h),
    );
  }
}
