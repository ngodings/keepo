import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../utils/themes.dart';
import '../text/text_widget.dart';

class AccountFormWidget extends StatelessWidget {
  const AccountFormWidget({
    super.key,
    required this.controller,
    required this.title,
    required this.hintText,
    required this.icon,
  });
  final TextEditingController controller;
  final String title, hintText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: 56.sp,
      decoration: BoxDecoration(
        color: CustomColor.background,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 50.0,
            offset: const Offset(0.75, 0.75),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HStack([
            Icon(
              icon,
              color: CustomColor.onBackground,
            ),
            Gap(12.sp),
            ValueTextWidget(
              text: title,
              color: CustomColor.onBackground,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
          ]),
          SizedBox(
            width: size.width / 2.2,
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
                hintStyle: TextStyle(
                  color: CustomColor.onBackground.withOpacity(0.5),
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
