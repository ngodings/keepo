import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:keepo/screen/components/custom_button/gradient_button.dart';
import 'package:keepo/screen/components/text/text_widget.dart';

import '../../../../services/navigation.dart';
import '../../../../utils/themes.dart';

class CustomConfirmationDialog extends StatelessWidget {
  const CustomConfirmationDialog(
      {super.key,
      this.onTap,
      required this.title,
      required this.buttonText,
      this.buttonColor,
      required this.desc,
      this.disableBlueShadow = false,
      this.buttonTextColor});

  final Function()? onTap;
  final String title;
  final String desc;
  final String buttonText;
  final List<Color>? buttonColor;
  final bool disableBlueShadow;
  final Color? buttonTextColor;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: CustomColor.inversePrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      insetPadding: EdgeInsets.symmetric(horizontal: 20.sp),
      child: Container(
        child: VStack(
          [
            ZStack(
              [
                TextWidget(
                  text: title,
                  textAlign: TextAlign.center,
                  color: CustomColor.onBackground,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2 / 100,
                ).centered().h8(context),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Icon(
                    Icons.close,
                    color: CustomColor.onBackground,
                  ).onTap(() => GetIt.I<NavigationServiceMain>().pop()),
                ),
              ],
            ),
            // Gap(.sp),
            TextWidget(
              text: desc,
              textAlign: TextAlign.center,
              color: c9F9F9F,
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              letterSpacing: 2 / 100,
            ).centered(),
            Gap(35.sp),
            ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor?.first ?? CustomColor.background,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.sp)),
              ),
              child: Center(
                child: TextWidget(
                  text: title,
                  textAlign: TextAlign.center,
                  color: buttonTextColor ?? Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.23,
                ),
              ),
            ).h(48.sp).pOnly(left: 20.sp, right: 20.sp),
            // GradientButton(
            //   onTap: onTap,
            //   title: buttonText,
            //   colors: const [Colors.transparent, Colors.transparent],
            //   gradientColors: buttonColor ?? gradientFincy,
            //   disableBlueShadow: disableBlueShadow,
            //   buttonTextColor: buttonTextColor,
            // ).h(48.sp).pOnly(left: 20.sp, right: 20.sp),
            Gap(8.sp)
          ],
        ).p12(),
      ).p(10.sp),
    );
  }
}
