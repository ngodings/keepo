import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../utils/themes.dart';
import '../text/text_widget.dart';

class WalletFieldForm extends StatelessWidget {
  const WalletFieldForm({
    super.key,
    required this.controller,
    required this.title,
    required this.hintText,
    this.space,
  });
  final TextEditingController controller;
  final String title, hintText;
  final double? space;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 56.sp,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 50.0,
            offset: const Offset(0.75, 0.75),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextWidget(
            text: title,
            color: textBlack,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(
            width: size.width / 2,
            child: TextFormField(
              controller: controller,
              textAlign: TextAlign.end,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: textGrey,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ).pOnly(right: 12.sp),
        ],
      ).pOnly(
        left: 18.sp,
      ),
    );
  }
}

class WalletFormWidget extends StatelessWidget {
  const WalletFormWidget({
    super.key,
    required this.controller,
    required this.title,
    required this.space,
    required this.content,
  });
  final TextEditingController controller;
  final String title;
  final double space;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 56.sp,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 50.0,
            offset: const Offset(0.75, 0.75),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextWidget(
            text: title,
            color: textBlack,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
        ],
      ).pOnly(
        left: 18.sp,
      ),
    );
  }
}
