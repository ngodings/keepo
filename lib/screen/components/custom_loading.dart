import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keepo/utils/themes.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({Key? key, this.value, this.blurBg}) : super(key: key);
  final double? value;
  final bool? blurBg;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
          child: Container(
            width: 200.0,
            height: 200.0,
            decoration: BoxDecoration(
                color: blurBg == true
                    ? CustomColor.inversePrimary.withOpacity(0.2)
                    : Colors.transparent),
            child: Center(
              child: SizedBox(
                height: 20.sp,
                width: 20.sp,
                child: CircularProgressIndicator(
                  value: value,
                ),
              ),
            ),
          ),
        ),
      ),
    );
    Center(
      child: SizedBox(
        height: 28.sp,
        width: 28.sp,
        child: CircularProgressIndicator(
          value: value,
        ),
      ),
    );
  }
}
