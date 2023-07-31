import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:keepo/utils/themes.dart';

import 'gradient_text_widget.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key,
      required this.text,
      this.textAlign,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.letterSpacing,
      this.decoration,
      this.overflow,
      this.textStyle});

  final String text;
  final TextAlign? textAlign;
  final Color? color;
  final double? fontSize;
  final TextDecoration? decoration;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final TextOverflow? overflow;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      style: GoogleFonts.inter(
        textStyle: TextStyle(
          color: color ?? CustomColor.onBackground,
          fontSize: fontSize ?? 12.sp,
          fontWeight: fontWeight ?? FontWeight.w400,
          decoration: decoration ?? TextDecoration.none,
          letterSpacing: letterSpacing ?? 0,
        ),
      ),
      overflow: overflow,
    ).tr();
  }
}

class ValueTextWidget extends StatelessWidget {
  const ValueTextWidget(
      {super.key,
      required this.text,
      this.textAlign,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.letterSpacing,
      this.decoration,
      this.maxLines,
      this.overflow});

  final String text;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final TextOverflow? overflow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      overflow: overflow,
      maxLines: maxLines,
      style: GoogleFonts.inter(
        textStyle: TextStyle(
          color: color ?? CustomColor.onBackground,
          fontSize: fontSize ?? 12.sp,
          fontWeight: fontWeight ?? FontWeight.w400,
          decoration: decoration ?? TextDecoration.none,
          letterSpacing: letterSpacing ?? 0,
        ),
      ),
    );
  }
}

class GradientTextWidget extends StatelessWidget {
  const GradientTextWidget({
    super.key,
    required this.text,
    this.textAlign,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
    required this.gradient,
    this.decoration,
    this.maxLines,
  });

  final String text;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final List<Color> gradient;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return CustomGradientText(
      text.tr(),
      textAlign: textAlign ?? TextAlign.center,
      style: GoogleFonts.inter(
        textStyle: TextStyle(
          decoration: decoration ?? TextDecoration.none,
          fontSize: fontSize,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing ?? 0,
        ),
      ),
      colors: gradient,
      maxLines: maxLines,
    );
  }
}

class ValueGradientTextWidget extends StatelessWidget {
  const ValueGradientTextWidget({
    super.key,
    required this.text,
    this.textAlign,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
    required this.gradient,
    this.decoration,
    this.maxLines,
  });

  final String text;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final List<Color> gradient;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return CustomGradientText(
      text,
      textAlign: textAlign ?? TextAlign.center,
      style: GoogleFonts.inter(
        textStyle: TextStyle(
          decoration: decoration ?? TextDecoration.none,
          fontSize: fontSize,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing ?? 0,
        ),
      ),
      colors: gradient,
      maxLines: maxLines,
    );
  }
}

class GradientTextBorderWidget extends StatelessWidget {
  const GradientTextBorderWidget({
    super.key,
    required this.text,
    this.textAlign,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
    required this.gradient,
    this.decoration,
    this.bgColor,
  });

  final String text;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final List<Color> gradient;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.sp),
        color: bgColor ?? const Color(0xFF273037),
        border: GradientBoxBorder(
          gradient: LinearGradient(colors: gradient),
        ),
      ),
      child: GradientTextWidget(
        text: text,
        gradient: gradient,
        decoration: decoration,
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        textAlign: textAlign,
      ).px12().py8(),
    );
  }
}
