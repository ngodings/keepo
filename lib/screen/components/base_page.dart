import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import "package:velocity_x/velocity_x.dart";
import 'package:keepo/screen/components/bg_green_coloured.dart';
import 'package:keepo/utils/themes.dart';

class BasePage extends StatefulWidget {
  const BasePage({
    Key? key,
    required this.body,
    this.isLoading = false,
    this.extendBodyBehindAppBar = false,
    this.drawerMenu,
    this.floatingActionWidget,
    this.floatingActionButtonLocation,
    this.bottomNavigationBar,
    this.centerTitle = true,
    this.activeContext,
    this.bodyBgColor,
    this.onBackPressed,
    this.appBar,
    this.resizeToAvoidBottomInset,
    this.bgColor,
    this.useGreenGradientBg = false,
  }) : super(key: key);

  final Widget body;
  final Widget? drawerMenu;
  final Widget? floatingActionWidget;
  final Widget? bottomNavigationBar;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final PreferredSizeWidget? appBar;
  final bool isLoading;
  final bool extendBodyBehindAppBar;
  final bool? centerTitle;
  final BuildContext? activeContext;
  final Color? bodyBgColor;
  final Color? bgColor;
  final bool? resizeToAvoidBottomInset;
  final Function()? onBackPressed;
  final bool useGreenGradientBg;

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: (MediaQuery.of(context).size.shortestSide) < 550
            ? const Size(360, 640)
            : const Size(600, 1024));
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: LoaderOverlay(
        useDefaultLoading: true,
        overlayWholeScreen: true,
        // overlayWidget: Center(
        //   child: Image.asset(AppImages.appLogoOnly).w(75).h(75),
        // ),
        child: Scaffold(
          backgroundColor:
              widget.useGreenGradientBg ? Colors.transparent : widget.bgColor,
          resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset ?? true,
          body: BackgroundGreenColoured(
            body: ZStack(
              [
                Scaffold(
                  extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
                  resizeToAvoidBottomInset:
                      widget.resizeToAvoidBottomInset ?? true,
                  drawerEnableOpenDragGesture: false,
                  appBar: widget.appBar,
                  backgroundColor: widget.useGreenGradientBg
                      ? Colors.transparent
                      : widget.bodyBgColor ?? CustomColor.background,
                  floatingActionButton: widget.floatingActionWidget,
                  floatingActionButtonLocation:
                      widget.floatingActionButtonLocation,
                  drawer: widget.drawerMenu,
                  bottomNavigationBar: widget.bottomNavigationBar,
                  body: widget.body,
                ),
                widget.isLoading
                    ? Positioned.fill(
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            color: Colors.black26,
                            child: const CircularProgressIndicator().centered(),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
