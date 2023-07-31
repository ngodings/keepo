import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keepo/screen/components/text/text_widget.dart';

import '../../../utils/themes.dart';

class InfoRemitWidget extends StatelessWidget {
  const InfoRemitWidget({super.key, required this.title, required this.value});
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget(
          text: title,
          color: c9F9F9F,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          letterSpacing: 2 / 100,
        ),
        ValueTextWidget(
          text: value,
          color: c1E1E1E,
          fontSize: 13.sp,
          fontWeight: FontWeight.w700,
        )
      ],
    );
  }
}
