import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:velocity_x/velocity_x.dart';

class GapPlatform extends StatelessWidget {
  const GapPlatform({Key? key, this.heightIOS, this.heightAndroid}) : super(key: key);
  final double? heightIOS, heightAndroid;

  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        if(Platform.isIOS)
          Gap(heightIOS ?? 30.sp)
        else
          Gap(heightAndroid ?? 8.sp)
      ]
    );
  }
}
