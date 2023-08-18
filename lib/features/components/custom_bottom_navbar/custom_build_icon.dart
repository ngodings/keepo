import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keepo/features/components/custom_bottom_navbar/custom_tab_item.dart';

class CustomBuildIcon extends StatelessWidget {
  final CustomTabItem item;
  final double iconSize;
  final Color? iconColor;
  final CountStyle? countStyle;

  const CustomBuildIcon({
    Key? key,
    required this.item,
    required this.iconColor,
    this.iconSize = 22,
    this.countStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget icon = item.icon;
    if (item.count is String) {
      return SvgPicture.asset(
        item.count ?? "",
        width: 25.sp,
        height: 25.sp,
        fit: BoxFit.contain,
        color: iconColor,
      );
    }
    return icon;
  }
}
