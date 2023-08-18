import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:keepo/utils/themes.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.onTap,
    required this.child,
    this.horizontalPadding,
    this.verticalPadding,
    this.opacity,
    this.height,
    this.width,
    this.pxChild,
  }) : super(key: key);
  final Function()? onTap;
  final Widget child;
  final double? horizontalPadding,
      verticalPadding,
      opacity,
      height,
      width,
      pxChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: (horizontalPadding ?? 0.sp).sp,
          vertical: (verticalPadding ?? 0).sp),
      height: (height ?? 30).sp,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.sp),
        color: CustomColor.inversePrimary.withOpacity(opacity ?? 0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8.sp),
        onTap: onTap,
        child: child.centered().px(pxChild ?? 0),
      ),
    );
  }
}
