import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/route_manager.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../utils/themes.dart';
import '../text/text_widget.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    super.key,
    required this.title,
    required this.desc,
    this.onTap,
    this.acc,
    this.no,
    this.noButton,
    this.closeButton,
  });

  final String title, desc;
  final String? acc, no;
  final Function()? onTap, noButton, closeButton;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 26.w),
                padding: EdgeInsets.symmetric(vertical: 26.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: selectedColor,
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 24, bottom: 8),
                      width: double.infinity,
                      child: TextWidget(
                        text: title,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Gap(10.sp),
                    SizedBox(
                      child: TextWidget(
                        text: desc,
                        color: Colors.grey,
                        textAlign: TextAlign.center,
                      ),
                    ).p12(),
                    // Container(
                    //   padding: const EdgeInsets.all(0),
                    //   width: Get.width * 0.86,
                    //   child: ValueTextWidget(
                    //     text: desc,
                    //     color: Colors.grey,
                    //     textAlign: TextAlign.center,

                    //   ),
                    // ),

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
                      child: ValueTextWidget(
                        // text: 'Unfavorite ${item.name}',
                        text: acc ?? 'confirm_delete'.tr(),
                        color: Colors.red.shade200,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ).py12(),
                    ).py16(),
                    // Gap(16.sp),
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
                  onPressed: closeButton ?? () => Get.back(),
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
