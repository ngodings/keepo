import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:keepo/features/components/text/text_widget.dart';
import 'package:keepo/utils/themes.dart';

class CustomButtonGradientBorder extends StatelessWidget {
  const CustomButtonGradientBorder(
      {Key? key,
      this.width = 218,
      this.height = 42,
      this.radius = 8,
      required this.textButton,
      this.onTap,
      this.backgroundColor,
      this.colors,
      this.sizeText})
      : super(key: key);
  final double width, height, radius;
  final String textButton;
  final double? sizeText;
  final Function()? onTap;
  final List<Color>? colors;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: width.sp,
          height: height.sp,
          decoration: BoxDecoration(
            border: GradientBoxBorder(
              gradient: LinearGradient(colors: colors ?? goldenTwo),
            ),
            color: backgroundColor,
            borderRadius: BorderRadius.circular(radius.sp),
          ),
          child: SizedBox(
            width: width.sp,
            child: TextWidget(
              text: textButton,
              fontSize: sizeText ?? 16.sp,
              letterSpacing: -23 / 100,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.center,
            ).centered(),
          ),
        ),
        Positioned.fill(
          top: 1.2.sp,
          left: 1.2.sp,
          right: 1.2.sp,
          bottom: 1.2.sp,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(radius.sp),
              splashColor: CustomColor.background.withOpacity(0.5),
              onTap: onTap,
            ),
          ),
        ),
      ],
    );
  }
}
