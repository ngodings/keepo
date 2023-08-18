import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:keepo/utils/app/app_lottie.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../utils/app/app_icons.dart';
import '../../utils/themes.dart';
import '../components/text/text_widget.dart';

class IntroductionScreen extends StatelessWidget {
  IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OverBoard(
        allowScroll: false,
        activeBulletColor: c4D3C77,
        pages: pages,
        showBullets: true,
        inactiveBulletColor: Colors.white,
        finishCallback: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.transparent,
            content: TextWidget(
                text: 'finish_intro',
                textAlign: TextAlign.center,
                color: Colors.black,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                letterSpacing: -2 / 100),
          ));
        },
        skipCallback: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.transparent,
            content: TextWidget(
                text: 'skip_to_jump',
                textAlign: TextAlign.center,
                color: Colors.black,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                letterSpacing: -2 / 100),
          ));
        },
        skipText: 'Jump!',
      ),
    );
  }

  final pages = [
    PageModel.withChild(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child:
                Image.asset(AppIcons.splashLogo, width: 200.0, height: 200.0),
          ),
          Gap(30.h),
          ValueTextWidget(
            text: "Embark on a 'Keepo' Adventure!",
            color: Colors.white,
            fontSize: 18.w,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.center,
          ).centered(),
          Gap(10.h),
          ValueTextWidget(
            text:
                "Unleash your creativity and join the fun! It's your turn to share wild ideas with the team. Get ready to laugh, brainstorm, and maybe even surprise yourself!",
            color: Colors.white,
            fontSize: 12.w,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
          ).centered(),
          Gap(18.h),
          Lottie.asset(AppLottie.animationParty),
        ],
      ).p12(),
      color: const Color(0xFFDFCCFB),
      doAnimateChild: true,
    ),
    PageModel.withChild(
      child: Column(
        children: [
          Gap(35.h),
          Lottie.asset(AppLottie.animation1),
          ValueTextWidget(
            text: "Crafting Memorable Things with Friends",
            color: Colors.white,
            fontSize: 20.w,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.center,
          ).centered(),
          Gap(10.h),
          ValueTextWidget(
            text:
                "Unlock the joy of creating secret cards that add an element of mystery to your gatherings. From intriguing questions to delightful dares, our app fosters warm camaraderie and unearths laughter-filled moments",
            color: Colors.white,
            fontSize: 12.w,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
          ).centered(),
          Gap(25.h),
          Padding(
            padding: EdgeInsets.only(bottom: 4.h),
            child:
                Image.asset(AppIcons.splashLogo, width: 200.0, height: 200.0),
          ),
        ],
      ).p12(),
      color: const Color(0xFFFFC6AC),
      doAnimateChild: true,
    ),
    PageModel.withChild(
      child: Column(
        children: [
          Gap(50.h),
          Lottie.asset(AppLottie.qnaCloud),
          ValueTextWidget(
            text: "Boost your game nights with our Q&A card builder app.",
            color: Colors.white,
            fontSize: 20.w,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.center,
          ).centered(),
          Gap(10.h),
          ValueTextWidget(
            text:
                "Craft unique questions to spark laughter and exciting dares that will make your gaming sessions unforgettable.",
            color: Colors.white,
            fontSize: 12.w,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
          ).centered(),
          Gap(50.h),
          Padding(
            padding: EdgeInsets.only(bottom: 4.h),
            child:
                Image.asset(AppIcons.splashLogo, width: 200.0, height: 200.0),
          ),
        ],
      ).p12(),
      color: const Color(0xFFA1CCD1),
      doAnimateChild: true,
    ),
  ];
}
