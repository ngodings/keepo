import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:velocity_x/velocity_x.dart';
import 'package:keepo/screen/components/base_page.dart';
import 'package:keepo/screen/components/text/text_widget.dart';
import 'package:keepo/utils/app_assets.dart';
import 'package:keepo/utils/themes.dart';

import '../../repositories/main_repository.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => const Splash(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final height = MediaQuery.of(context).size.height * 0.30;
    final gaps = MediaQuery.of(context).size.height * 0.35;
    return Scaffold(
      backgroundColor: CustomColor.background,
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          color: CustomColor.background,
          image: const DecorationImage(
            image: AssetImage(AppImages.bgSplash),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            right: 30.sp,
            left: 30.sp,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Gap(gaps),
              Image.asset(AppImages.splashLogo),
              Gap(35.sp),
              Gap(height - 20),
              TextWidget(
                text: 'product_by',
                textAlign: TextAlign.center,
                color: CustomColor.onBackground,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                letterSpacing: -2 / 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => MainRepository(),
      lazy: false,
      child: const _Splash(),
    );
  }
}

class _Splash extends StatelessWidget {
  const _Splash({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // Timer(
    //   const Duration(seconds: 7),
    //   () {},
    // );
    // final height = MediaQuery.of(context).size.height * 0.30;
    // final gaps = MediaQuery.of(context).size.height * 0.35;
    return BasePage(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          color: CustomColor.background,
          image: const DecorationImage(
            image: AssetImage(AppImages.bgSplash),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            right: 30.sp,
            left: 30.sp,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                      height: 177.sp,
                      width: 177.sp,
                      child: Icon(Icons.card_giftcard)
                      // SvgPicture.asset(AppSvg.keepo)
                      // Image.asset(AppImages.splashLogo),
                      )
                  .centered()
                  .expand(),
              TextWidget(
                      text: 'product_by',
                      textAlign: TextAlign.center,
                      color: CustomColor.onBackground,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -2 / 100)
                  .pOnly(bottom: 20.sp),
            ],
          ),
        ),
      ),
    );
  }
}
