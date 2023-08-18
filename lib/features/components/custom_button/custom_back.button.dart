import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:keepo/features/components/custom_button/custom_button.dart';
import 'package:keepo/services/navigation.dart';
import 'package:keepo/utils/themes.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.onPressed, this.color});
  final Function()? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      opacity: 0,
      width: 60.sp,
      onTap: onPressed ?? () => GetIt.I<NavigationServiceMain>().pop(),
      child: HStack([
        Icon(
          Icons.arrow_back_ios,
          color: color ?? CustomColor.onBackground,
          size: 18,
        ),
        Text(
          'back',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              color: color ?? CustomColor.onBackground,
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ).tr(),
      ]),
    );
  }
}
