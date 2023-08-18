import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/themes.dart';
import '../text/text_widget.dart';

class TwoListWidget extends StatelessWidget {
  const TwoListWidget(
      {super.key,
      this.iconImg,
      this.row1col1,
      this.row1col2,
      this.row2col1,
      this.row2col2});
  final String? iconImg, row1col1, row1col2, row2col1, row2col2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.sp,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: 6.0,
              color: Colors.black38.withOpacity(0.1),
              offset: const Offset(0.0, 2 / 100),
              blurStyle: BlurStyle.outer),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.sp),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HStack([
            Image.asset(iconImg ?? AppIcons.cnyFlag),
            Gap(5.sp),
            VStack([
              TextWidget(
                text: row1col1 ?? '',
                textAlign: TextAlign.start,
                color: c1B4042,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
              Gap(5.sp),
              TextWidget(
                text: row1col2 ?? '',
                textAlign: TextAlign.start,
                color: c8C8C8C,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              )
            ])
          ]),
          VStack(
            [
              TextWidget(
                text: row2col1 ?? '',
                textAlign: TextAlign.start,
                color: c1B4042,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
              Gap(5.sp),
              TextWidget(
                text: row2col2 ?? '',
                textAlign: TextAlign.start,
                color: c8C8C8C,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              )
            ],
            crossAlignment: CrossAxisAlignment.end,
          )
        ],
      ).p(6.sp),
    ).pOnly(left: 16.sp, right: 16.sp);
  }
}
