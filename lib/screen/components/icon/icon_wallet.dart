import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/themes.dart';

class CircleIcon extends StatelessWidget {
  const CircleIcon({
    super.key,
    required this.icon,
  });
  final String icon;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: CustomColor.onBackground.withOpacity(0.06),
      radius: 20.sp,
      child: SvgPicture.asset(icon).p(8.sp),
    );
  }
}
