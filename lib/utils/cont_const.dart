import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keepo/utils/themes.dart';

import 'app_assets.dart';

var boxProfile = BoxDecoration(
  color: CustomColor.inversePrimary.withOpacity(0.3),
  borderRadius: BorderRadius.circular(16.sp),
  boxShadow: <BoxShadow>[
    BoxShadow(
      color: CustomColor.surface,
      blurRadius: 50.0,
      offset: const Offset(0.75, 0.75),
    ),
  ],
);

var contProfile = BoxDecoration(
  color: CustomColor.background.withOpacity(0.2),
  borderRadius: BorderRadius.circular(16.sp),
);

var boxNewProfile = BoxDecoration(
  color: CustomColor.inversePrimary.withOpacity(0.2),
  borderRadius: BorderRadius.circular(16.sp),
  boxShadow: <BoxShadow>[
    BoxShadow(
      color: CustomColor.onBackground.withOpacity(0.02),
      blurRadius: 20.0,
      offset: const Offset(0.1, 0.1),
    ),
  ],
);

boxCustomRadius(double radius) => BoxDecoration(
      color: CustomColor.inversePrimary.withOpacity(0.2),
      borderRadius: BorderRadius.circular(radius),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: CustomColor.onBackground.withOpacity(0.02),
          blurRadius: 20.0,
          offset: const Offset(0.1, 0.1),
        ),
      ],
    );

var boxRenCoins = BoxDecoration(
  color: const Color(0xFF0E191F).withOpacity(0.74),
  borderRadius: BorderRadius.circular(14.sp),
);

var boxKYC = BoxDecoration(
  color: const Color(0xFF1A232A),
  borderRadius: BorderRadius.circular(14.sp),
);

var boxUploadIdentityCard = BoxDecoration(
  color: const Color(0xFF2E373C),
  borderRadius: BorderRadius.circular(14.sp),
);

var boxCoins = BoxDecoration(
  color: const Color(0xFF0E191F),
  borderRadius: BorderRadius.circular(10.sp),
);

var boxProfileGradient = BoxDecoration(
  gradient: LinearGradient(colors: [
    CustomColor.background,
    const Color(0xFF0E191F),
    const Color(0xFF0D2C32),
    const Color(0xFF0D2C32),
  ], end: Alignment.topRight),
);

var boxCities = BoxDecoration(
  color: c141F24,
  borderRadius: BorderRadius.circular(14.sp),
);
