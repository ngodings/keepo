import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:keepo/features/components/custom_button/gradient_button.dart';

import '../../../utils/themes.dart';
import '../text/text_widget.dart';

class CustomConfirmDialog extends StatelessWidget {
  const CustomConfirmDialog({
    super.key,
    this.title,
    this.onTap,
    required this.textButton,
    this.customButton,
    this.widget,
  });

  final String? title, textButton;
  final Function()? onTap;
  final Widget? customButton;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
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
                    title == null
                        ? Container()
                        : Container(
                            padding: EdgeInsets.only(top: 33.sp, bottom: 7.sp),
                            width: double.infinity,
                            child: TextWidget(
                              text: title!,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.center,
                            ),
                          ),
                    Gap(8.sp),
                    widget ?? Container(),
                    Gap(2.sp),
                    customButton ??
                        GradientButton(
                          onTap: onTap,
                          colors: gradientFincy,
                          gradientColors: gradientFincy,
                          title: textButton,
                        ).py16().w(180.sp), //.h(68.sp),
                    Gap(16.sp)
                  ],
                ),
              ),
              Positioned(
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
            ],
          ),
        ],
      ),
    );
  }
}
