import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../utils/themes.dart';

class PopUpMenuItemWidget extends StatelessWidget {
  const PopUpMenuItemWidget({
    super.key,
    required this.icon,
    required this.label,
    this.titleColor,
    this.svgColor,
  });
  final String icon, label;
  final Color? titleColor, svgColor;

  @override
  Widget build(BuildContext context) {
    return HStack(
      [
        SvgPicture.asset(
          icon,
          color: svgColor,
        )
            .h(24.sp)
            .w(24.sp)
            .box
            .rounded
            .p8
            .color(CustomColor.onBackground.withOpacity(0.13))
            .make(),
        Gap(5.sp),
        Text(
          label,
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 13,
              color: titleColor ?? CustomColor.onBackground),
        ).tr()
      ],
      axisSize: MainAxisSize.min,
    ).pOnly(bottom: 5.sp);
  }
}
