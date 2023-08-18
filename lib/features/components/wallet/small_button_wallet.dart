import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import '../text/text_widget.dart';

class SmallButtonWallet extends StatelessWidget {
  const SmallButtonWallet({super.key, this.onTap, required this.titleButton});
  final Function()? onTap;
  final String titleButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.13),
        borderRadius: BorderRadius.circular(8.sp),
      ),
      child: TextWidget(
        text: titleButton,
        color: Colors.white,
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
        letterSpacing: 2 / 100,
      ).p(10.sp),
    ).onTap(onTap);
  }
}
