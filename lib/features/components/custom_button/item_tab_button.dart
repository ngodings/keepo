import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../utils/themes.dart';
import '../text/text_widget.dart';

class ItemTabButton extends StatelessWidget {
  const ItemTabButton(
      {super.key,
      required this.labelName,
      required this.tabController,
      this.value});
  final String labelName;
  final TabController tabController;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextWidget(
          text: labelName,
          fontSize: 13.sp,
          fontWeight: FontWeight.w700,
          color: tabController.index == 1
              ? CustomColor.onBackground
              : CustomColor.onBackground.withOpacity(0.6),
        ),
        Gap(4.sp),
        value.isNotEmptyAndNotNull
            ? Container(
                width: 32.sp,
                height: 20.sp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sp),
                  color: CustomColor.inversePrimary,
                ),
                child: GradientTextWidget(
                  gradient: goldenTwo,
                  text: value ?? '',
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600,
                ).centered(),
              )
            : Container()
      ],
    ).pOnly(left: 8.sp, right: 4.sp);
  }
}
