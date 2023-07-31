import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:keepo/utils/app_assets.dart';
import 'package:keepo/utils/themes.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton(
      {Key? key, this.onTap, this.isChecked, this.checkedColor, this.size})
      : super(key: key);
  final Function(bool?)? onTap;
  final bool? isChecked;
  final Color? checkedColor;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return RoundCheckBox(
      size: size ?? 25,
      onTap: onTap,
      isChecked: isChecked,
      animationDuration: const Duration(
        microseconds: 500,
      ),
      checkedWidget: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientFincy,
          ),
          shape: BoxShape.circle,
        ),
      ),
      checkedColor: checkedColor ?? cE7E7E7,
      border: Border.all(color: cE7E7E7, width: 2.sp),
    );
  }
}

class GoldenCheck extends StatelessWidget {
  const GoldenCheck({Key? key, required this.isChecked, this.onTap})
      : super(key: key);
  final bool isChecked;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      isChecked ? AppSvg.goldenCheckboxCheck : AppSvg.goldenCheckboxUncheck,
    ).onTap(onTap);
  }
}
