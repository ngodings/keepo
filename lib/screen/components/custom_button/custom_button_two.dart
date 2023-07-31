import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:keepo/screen/components/text/text_widget.dart';
import 'package:keepo/utils/themes.dart';

class CustomButtonTwo extends StatelessWidget {
  const CustomButtonTwo(
      {Key? key,
      required this.child,
      this.onTap,
      this.backgroundColor,
      this.colors,
      this.sizeText,
      this.radius = 10})
      : super(key: key);
  final Widget child;
  final double? sizeText, radius;
  final Function()? onTap;
  final List<Color>? colors;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        Positioned.fill(
          // top: 1.2.sp,
          // left: 1.2.sp,
          // right: 1.2.sp,
          // bottom: 1.2.sp,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular((radius ?? 0).sp),
              splashColor: CustomColor.background.withOpacity(0.5),
              onTap: onTap,
            ),
          ),
        ),
      ],
    );
  }
}
