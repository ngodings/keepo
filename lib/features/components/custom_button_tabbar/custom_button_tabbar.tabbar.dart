import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keepo/utils/cont_const.dart';
import 'package:keepo/utils/themes.dart';

class CustomButtonTabBar extends StatelessWidget {
  const CustomButtonTabBar(
      {Key? key,
      this.tabController,
      required this.tabs,
      this.height,
      this.contentPadding,
      this.buttonMargin})
      : super(key: key);
  final TabController? tabController;
  final List<Widget> tabs;
  final double? height;
  final EdgeInsets? contentPadding, buttonMargin;

  @override
  Widget build(BuildContext context) {
    return ButtonsTabBar(
      height: height ?? 52.sp,
      buttonMargin: buttonMargin ?? const EdgeInsets.all(4),
      contentPadding: contentPadding ??
          EdgeInsets.only(left: 5.sp, right: 5.sp, top: 4.sp, bottom: 4.sp),
      controller: tabController,
      // unselectedBackgroundColor: Colors.transparent,
      decoration: BoxDecoration(
        color: CustomColor.onBackground.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16.sp),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: CustomColor.onBackground.withOpacity(0.02),
            blurRadius: 20.0,
            offset: const Offset(0.1, 0.1),
          ),
        ],
      ),
      unselectedDecoration: boxNewProfile,
      labelStyle: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w700,
        color: CustomColor.onBackground,
      ),
      // backgroundColor: Colors.transparent,
      unselectedLabelStyle: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
        color: CustomColor.onBackground.withOpacity(0.7),
      ),
      onTap: (p0) {
        // print(p0);
      },
      splashColor: CustomColor.onBackground.withOpacity(0.01),
      tabs: tabs,
    );
  }
}
