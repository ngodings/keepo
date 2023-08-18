import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:velocity_x/velocity_x.dart';
import 'package:keepo/features/components/base_page.dart';
import 'package:keepo/features/components/text/text_widget.dart';

import '../../repositories/main_repository.dart';
import '../../utils/app/app_icons.dart';

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

    return BasePage(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          // image: const DecorationImage(
          //   image: AssetImage(AppImages.bgSplash),
          //   fit: BoxFit.fill,
          // ),
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
                child:
                    //Icon(Icons.card_giftcard)
                    // SvgPicture.asset(AppSvg.keepo)
                    Image.asset(AppIcons.splashLogo),
              ).centered().expand(),
              TextWidget(
                      text: 'slogan',
                      textAlign: TextAlign.center,
                      color: Colors.black,
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
