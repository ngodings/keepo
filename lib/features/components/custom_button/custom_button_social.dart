import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/themes.dart';
import '../text/text_widget.dart';

class CustomButtonSocial extends StatelessWidget {
  const CustomButtonSocial({
    Key? key,
    this.onTap,
    this.icon,
    this.width,
    this.height,
    this.opacity,
    this.horizontalPadding,
    this.verticalPadding,
  }) : super(key: key);
  final Function()? onTap;
  final String? icon;
  final double? horizontalPadding, verticalPadding, opacity, height, width;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: (horizontalPadding ?? 0.sp).sp,
            vertical: (verticalPadding ?? 0).sp),
        height: (height ?? 40).sp,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.sp),
          color: CustomColor.onBackground.withOpacity(0.1),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(8.sp),
          onTap: onTap,
          child: Center(
            child: SvgPicture.asset(icon!).centered(),
          ),
        ),
      ),
    );
  }
}

class CustomBottonSocialLogin extends StatelessWidget {
  const CustomBottonSocialLogin(
      {super.key,
      this.onTap,
      required this.icon,
      required this.text,
      this.iconWidget});
  final Function()? onTap;
  final String icon, text;
  final Widget? iconWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.sp),
        color: CustomColor.onBackground.withOpacity(0.05),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(6.sp),
        onTap: onTap,
        child: HStack([
          iconWidget ??
              SvgPicture.asset(
                icon,
                height: 20.h,
              ),
          //Gap(14.w),
          TextWidget(
            text: text,
            fontSize: 13.sp,
            fontWeight: FontWeight.w700,
          ).expand()
        ]).p20(),
      ),
    ).pOnly(bottom: 12.h);
  }
}
