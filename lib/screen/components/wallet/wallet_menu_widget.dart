import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:keepo/screen/components/text/text_widget.dart';

import '../../../utils/themes.dart';

class WalletMenuWidget extends StatelessWidget {
  const WalletMenuWidget(
      {super.key,
      this.onClick,
      required this.colors,
      required this.icon,
      required this.text,
      this.textColor});
  final Function()? onClick;
  final List<Color> colors;
  final String icon, text;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        InkWell(
          onTap: onClick,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: colors),
              borderRadius: BorderRadius.circular(10.sp),
            ),
            child: Image.asset(icon),
          ).h(36).w(36),
        ),
        Gap(10.sp),
        TextWidget(
          text: text,
          textAlign: TextAlign.center,
          color: textColor ?? c323233,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          letterSpacing: 2 / 100,
        )
      ],
      alignment: MainAxisAlignment.center,
      crossAlignment: CrossAxisAlignment.center,
    );
  }
}
