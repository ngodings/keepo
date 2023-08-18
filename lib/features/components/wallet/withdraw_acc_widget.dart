import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:keepo/utils/app_assets.dart';

import '../../../utils/themes.dart';
import '../text/text_widget.dart';

class WithdrawAccountWidget extends StatelessWidget {
  const WithdrawAccountWidget({
    super.key,
    this.onTap,
    required this.title,
    required this.text,
    required this.verified,
    this.verify,
  });

  final Function()? onTap, verify;
  final String title, text;
  final bool verified;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0.sp),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.grey.withOpacity(0.5), Colors.grey.withOpacity(0.5)],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VStack([
            HStack([
              ValueTextWidget(
                text: title,
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                letterSpacing: 2 / 100,
              ),
              Gap(6.sp),
              verified
                  ? HStack([
                      Image.asset(AppIcons.verified),
                      Gap(4.sp),
                      ValueTextWidget(
                        text: 'Verified',
                        color: c88FFFD,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2 / 100,
                      )
                    ]).onTap(verify)
                  : ValueTextWidget(
                      text: 'Verify now',
                      color: c8DC8FF,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2 / 100,
                    ).onTap(verify)
            ]),
            Gap(12.sp),
            ValueTextWidget(
              text: text,
              color: Colors.white.withOpacity(0.5),
              fontSize: 11.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: 2 / 100,
            ),
          ]),
          TextWidget(
            text: 'remove',
            color: Colors.white,
            fontSize: 11.sp,
            fontWeight: FontWeight.w700,
            letterSpacing: 2 / 100,
          ).onTap(() {})
        ],
      ).p(16.sp),
    ).h(81.sp).w(357.sp).pOnly(left: 10.sp, right: 10.sp);
  }
}
