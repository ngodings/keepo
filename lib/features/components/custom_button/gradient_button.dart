import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:keepo/features/components/text/text_widget.dart';

// ignore: must_be_immutable
class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    this.title,
    this.onTap,
    this.colors,
    this.gradientColors,
    this.radius = 8,
    this.disableBlueShadow = false,
    this.buttonTextColor,
    this.sizeFont,
    this.isLoading,
  });

  final String? title;
  final Function()? onTap;
  final List<Color>? colors;
  final List<Color>? gradientColors;
  final double radius;
  final double? sizeFont;
  final bool disableBlueShadow;
  final Color? buttonTextColor;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (isLoading ?? false) ? () {} : onTap,
      child: Container(
        height: 42.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          boxShadow: disableBlueShadow
              ? null
              : [
                  BoxShadow(
                    color: Colors.blue.withAlpha(50),
                    blurRadius: 20,
                    spreadRadius: 5,
                    offset: const Offset(0, 10),
                  )
                ],
          gradient: LinearGradient(colors: gradientColors!),
        ),
        child: Container(
          height: 45.h,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            // boxShadow: const [
            //   BoxShadow(
            //       blurRadius: 10.0,
            //       color: Color(0xFF62CDCB),
            //       offset: Offset(0.0, 5 / 100),
            //       blurStyle: BlurStyle.outer),
            // ],
            gradient: LinearGradient(colors: colors!),
          ),
          child: Center(
            child: (isLoading ?? false)
                ? SizedBox(
                    width: 20.sp,
                    height: 20.sp,
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : TextWidget(
                    text: title!,
                    textAlign: TextAlign.center,
                    color: buttonTextColor ?? Colors.white,
                    fontSize: sizeFont ?? 16.sp,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.23),
          ),
        ),
      ),
    );
  }
}
