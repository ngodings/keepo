import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:gap/gap.dart';
import 'package:keepo/features/components/text/text_widget.dart';
import 'package:keepo/utils/themes.dart';

// ignore: must_be_immutable
class BoardingWidget extends StatelessWidget {
  BoardingWidget(
      {super.key, required this.colors, this.image, this.title, this.subtitle});
  List<Color> colors;
  String? image, title, subtitle;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 4;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            // stops: const [0.5, 0.5],
            colors: colors),
      ),
      child: Center(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gap(20.h),
            TextWidget(
              text: title!,
              textAlign: TextAlign.center,
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
            Gap(6.sp),
            TextWidget(
              text: subtitle!,
              textAlign: TextAlign.center,
              color: Colors.white,
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
            ),
            Gap(60.h),
            Image.asset(image!),
            Gap(height)
          ],
        ),
      ),
    );
  }
}

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({super.key, required this.image, this.fit});
  final String image;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: CustomColor.background,
          image: DecorationImage(
            image: AssetImage(image),
            fit: fit ?? BoxFit.cover,
          )),
    );
  }
}
