import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:keepo/features/components/text/text_widget.dart';

import '../../../utils/themes.dart';

class InformationDialog extends StatelessWidget {
  const InformationDialog({super.key, required this.title, required this.desc});
  final String title, desc;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 26),
            padding: const EdgeInsets.symmetric(vertical: 12),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: selectedColor,
            ),
            child: VStack([
              Gap(8.sp),
              SizedBox(
                width: double.infinity,
                child: TextWidget(
                  text: title,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                child: TextWidget(
                  text: desc,
                  color: CustomColor.onBackground.withOpacity(0.6),
                  textAlign: TextAlign.center,
                  fontSize: 14.sp,
                ),
              ).p20().centered(),
            ]),
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
    );
  }
}
