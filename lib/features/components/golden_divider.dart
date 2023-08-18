import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:keepo/features/components/text/text_widget.dart';
import 'package:keepo/utils/themes.dart';

class GoldenDivider extends StatelessWidget {
  const GoldenDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sp,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.elliptical(10000, 100),
        ),
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            goldenTwo.last,
            goldenTwo.last,
            Colors.transparent
          ],
        ),
      ),
    );
  }
}

class GoldenDividerWithText extends StatelessWidget {
  const GoldenDividerWithText({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.sp,
      child: Stack(
        children: [
          const Center(child: GoldenDivider()),
          Center(
            child: Container(
              height: 20.sp,
              padding: EdgeInsets.symmetric(
                horizontal: 8.sp,
              ),
              color: CustomColor.background,
              child: GradientTextWidget(
                gradient: goldenTwo,
                text: text,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EllipticalDivider extends StatelessWidget {
  const EllipticalDivider({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.sp,
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 1.sp,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.transparent,
                      Colors.white,
                    ],
                  ),
                ),
              ),
              Container(
                height: 1.sp,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Colors.transparent,
                      Colors.white,
                    ],
                  ),
                ),
              ),
            ],
          ).expand(),
          TextWidget(
            text: text,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ).px4(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 1.sp,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.transparent,
                      Colors.white,
                    ],
                  ),
                ),
              ),
              Container(
                height: 1.sp,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: [
                      Colors.transparent,
                      Colors.white,
                    ],
                  ),
                ),
              ),
            ],
          ).expand(),
        ],
      ),
    );
  }
}
