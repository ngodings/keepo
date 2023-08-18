import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../utils/themes.dart';
import '../text/text_widget.dart';

class OnceConfirmDialog extends StatelessWidget {
  const OnceConfirmDialog(
      {super.key,
      required this.title,
      required this.desc,
      this.onTap,
      required this.textButton,
      this.customButton,
      this.customDesc,
      this.hideCloseButton});

  final String title, desc, textButton;
  final Function()? onTap;
  final Widget? customButton;
  final Widget? customDesc;
  final bool? hideCloseButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 26.sp),
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: selectedColor,
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 33.sp, bottom: 7.sp),
                    width: double.infinity,
                    child: TextWidget(
                      text: title,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Gap(8.sp),
                  customDesc ??
                      TextWidget(
                        text: desc,
                        color: Colors.grey,
                        textAlign: TextAlign.center,
                      ).pOnly(left: 2.sp, right: 2.sp),
                  Gap(2.sp),
                  customButton ??
                      ElevatedButton(
                        onPressed: onTap,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          foregroundColor: Colors.grey.withOpacity(0.2),
                          backgroundColor: Colors.grey.withOpacity(0.2),
                          elevation: 0,
                        ),
                        child: TextWidget(
                          text: textButton,
                          color: Colors.red.shade200,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ).py16().w(180.sp).h(68.sp),
                  Gap(16.sp)
                ],
              ),
            ),
            Visibility(
              visible: hideCloseButton == true ? false : true,
              child: Positioned(
                right: 16,
                top: 0,
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: const CircleBorder(),
                  ),
                  onPressed: () => Get.back(),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      gradient: RadialGradient(
                        colors: [
                          Colors.white,
                          selectedColor,
                        ],
                        stops: [
                          0.6,
                          0.8,
                        ],
                      ),
                    ),
                    child: const Icon(
                      Icons.cancel_rounded,
                      size: 36,
                      color: selectedColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
