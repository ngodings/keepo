import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class OptionFieldWidget extends StatelessWidget {
  const OptionFieldWidget({
    super.key,
    this.colors,
    this.text,
    this.textColors,
    required this.radius,
    this.innerColors,
  });
  final List<Color>? colors, textColors, innerColors;
  final String? text;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: colors!),
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(
            color: const Color(0xFFF5F5F5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: innerColors ??
                      [
                        const Color(0xFFF5F5F5),
                        const Color(0xFFF5F5F5),
                      ]),
              borderRadius: BorderRadius.circular(radius),
              border: Border.all(
                color: const Color(0xFFF5F5F5),
              ),
            ),
            child: Center(
              child: GradientText(
                text!,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                colors: textColors!,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
