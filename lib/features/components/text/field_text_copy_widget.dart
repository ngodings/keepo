import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:keepo/features/components/text/text_widget.dart';
import 'package:keepo/utils/themes.dart';

import '../../../utils/app_assets.dart';

class FieldTextCopyWidget extends StatelessWidget {
  const FieldTextCopyWidget(
      {super.key,
      required this.title,
      required this.value,
      this.onTap,
      this.textDecoration,
      this.showCopy,
      this.valueColor});

  final String title, value;
  final List<Color>? valueColor;
  final Function()? onTap;
  final TextDecoration? textDecoration;
  final bool? showCopy;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget(
          text: title,
          textAlign: TextAlign.left,
          color: CustomColor.onBackground.withOpacity(0.7),
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
        ),
        HStack([
          GradientTextWidget(
            gradient: valueColor ?? goldenTwo,
            text: value,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            letterSpacing: -2 / 100,
            decoration: textDecoration ?? TextDecoration.none,
          ),
          Gap(4.sp),
          Visibility(
            visible: showCopy == null ? false : true,
            child: SvgPicture.asset(
              AppSvg.copy,
              color: goldenTwo[1],
            ),
          )
        ]).onTap(onTap),
      ],
    );
  }
}
