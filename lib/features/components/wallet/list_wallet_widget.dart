import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../utils/themes.dart';
import '../text/text_widget.dart';

class ThreeRowList extends StatelessWidget {
  const ThreeRowList(
      {super.key,
      this.icon,
      this.row1col1,
      this.row1col2,
      this.row2col1,
      this.row2col2,
      this.row3col1,
      this.row3col2});
  final String? icon,
      row1col1,
      row1col2,
      row2col1,
      row2col2,
      row3col1,
      row3col2;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        top: 14.sp,
        bottom: 14.sp,
      ),
      child: HStack(
        [
          Image.asset(icon!),
          Gap(10.sp),
          VStack(
            [
              ValueTextWidget(
                text: row1col1!,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                letterSpacing: -23 / 100,
                color: c00135C,
              ),
              TextWidget(
                text: row1col2!,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                letterSpacing: -23 / 100,
                color: c99A0BE,
              ),
            ],
          ),
          Gap(size.width / 8),
          VStack(
            [
              ValueTextWidget(
                text: row2col1!,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                letterSpacing: -23 / 100,
                color: c00135C,
              ),
              ValueTextWidget(
                text: row2col2!,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                letterSpacing: -23 / 100,
                color: c99A0BE,
              ),
            ],
            alignment: MainAxisAlignment.end,
            crossAlignment: CrossAxisAlignment.end,
          ),
          Gap(size.width / 8),
          VStack(
            [
              ValueTextWidget(
                text: row3col1!,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                letterSpacing: -23 / 100,
                color: c00135C,
              ),
              ValueTextWidget(
                text: row3col2!,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                letterSpacing: -23 / 100,
                color: c99A0BE,
              ),
            ],
            alignment: MainAxisAlignment.end,
            crossAlignment: CrossAxisAlignment.end,
          ),
        ],
        alignment: MainAxisAlignment.center,
        crossAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}
