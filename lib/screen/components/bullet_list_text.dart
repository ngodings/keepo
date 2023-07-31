import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keepo/utils/themes.dart';

class BulletListTextWidget extends StatelessWidget {
  const BulletListTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.0,
      width: 5.0,
      margin: EdgeInsets.only(top: 6.sp, right: 8.sp),
      decoration: BoxDecoration(
        color: CustomColor.onBackground,
        shape: BoxShape.circle,
      ),
    );
  }
}
