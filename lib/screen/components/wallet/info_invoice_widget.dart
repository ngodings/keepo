import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/themes.dart';
import '../text/text_widget.dart';

class InfoInvoiceWidget extends StatelessWidget {
  const InfoInvoiceWidget(
      {super.key, required this.label, required this.value});
  final String label, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget(
          text: label,
          textAlign: TextAlign.left,
          color: CustomColor.onBackground.withOpacity(0.7),
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(
          width: Get.width / 2.2,
          child: ValueTextWidget(
            text: value,
            textAlign: TextAlign.right,
            color: CustomColor.onBackground,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            letterSpacing: -2 / 100,
          ),
        ),
      ],
    );
  }
}
