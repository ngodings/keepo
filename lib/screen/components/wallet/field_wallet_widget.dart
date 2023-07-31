import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:velocity_x/velocity_x.dart';

import '../text/text_widget.dart';

class FieldWallet extends StatelessWidget {
  const FieldWallet({super.key, required this.title, required this.value});

  final String title, value;

  @override
  Widget build(BuildContext context) {
    return VStack([
      TextWidget(
        text: title,
        color: Colors.white.withOpacity(0.54),
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
      ),
      Gap(8.sp),
      ValueTextWidget(
        text: value,
        color: Colors.white,
        fontSize: 13.sp,
        fontWeight: FontWeight.w600,
      )
    ]);
  }
}
