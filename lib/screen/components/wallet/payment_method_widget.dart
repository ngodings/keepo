import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:velocity_x/velocity_x.dart';

import '../text/text_widget.dart';

class PaymentMethodWidget extends StatelessWidget {
  const PaymentMethodWidget(
      {super.key,
      required this.title,
      required this.desc1,
      required this.desc2,
      this.onTap});
  final String title, desc1, desc2;
  final Function()? onTap;

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                text: title,
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                letterSpacing: 2 / 100,
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 12.sp,
              )
            ],
          ),
          Gap(14.sp),
          TextWidget(
            text: desc1,
            color: Colors.white.withOpacity(0.54),
            fontSize: 11.sp,
            fontWeight: FontWeight.w500,
            letterSpacing: 2 / 100,
          ),
          Gap(1.sp),
          TextWidget(
            text: desc2,
            color: Colors.white.withOpacity(0.54),
            fontSize: 11.sp,
            fontWeight: FontWeight.w500,
            letterSpacing: 2 / 100,
          ),
        ],
      ).pOnly(left: 12.sp, right: 12.sp, top: 16.sp),
    ).pOnly(left: 10.sp, right: 10.sp).onTap(onTap);
  }
}
