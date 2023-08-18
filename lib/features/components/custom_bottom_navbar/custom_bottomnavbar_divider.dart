import 'dart:io';
import 'dart:ui' show lerpDouble;

import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/extension/shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:keepo/features/components/custom_bottom_navbar/custom_bottom_navbar.dart';
import 'package:keepo/features/components/custom_bottom_navbar/custom_build_icon.dart';
import 'package:keepo/features/components/custom_bottom_navbar/custom_tab_item.dart';
import 'package:keepo/features/components/text/text_widget.dart';
import 'package:keepo/utils/themes.dart';

enum StyleDivider { top, bottom, all }

class CustomBottomBarDivider extends StatefulWidget {
  final List<CustomTabItem> items;

  /// view
  final Color backgroundColor;
  final List<BoxShadow>? boxShadow;
  final double? blur;

  /// item
  final int indexSelected;
  final Function(int index)? onTap;
  final EdgeInsets? paddingVertical;

  final Color color;
  final Color colorSelected;
  final List<Color> gradientColorSelected;
  final double iconSize;
  final TextStyle? titleStyle;
  final CountStyle? countStyle;

  /// enable Divider
  final StyleDivider styleDivider;

  final Duration? duration;
  final Curve? curve;
  final bool animated;
  final double? top;
  final double? bottom;
  final double? pad;
  final bool? enableShadow;

  const CustomBottomBarDivider(
      {Key? key,
      required this.items,
      required this.backgroundColor,
      this.boxShadow,
      this.blur,
      this.indexSelected = 0,
      this.onTap,
      this.paddingVertical,
      required this.color,
      required this.colorSelected,
      this.iconSize = 22,
      this.titleStyle,
      this.countStyle,
      this.styleDivider = StyleDivider.top,
      this.duration,
      this.curve,
      this.animated = true,
      this.top = 12,
      this.bottom = 12,
      this.pad = 4,
      this.enableShadow = true,
      required this.gradientColorSelected})
      : super(key: key);

  @override
  _CustomBottomBarDividerState createState() => _CustomBottomBarDividerState();
}

class _CustomBottomBarDividerState extends State<CustomBottomBarDivider> {
  double _getIndicatorPosition(int index) {
    var isLtr = Directionality.of(context) == TextDirection.ltr;
    if (isLtr) {
      return lerpDouble(-1.0, 1.0, index / (widget.items.length - 1))!;
    } else {
      return lerpDouble(1.0, -1.0, index / (widget.items.length - 1))!;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BuildLayout(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        boxShadow: widget.boxShadow ?? shadow,
      ),
      blur: widget.blur,
      child: widget.items.isNotEmpty
          ? Stack(
              clipBehavior: Clip.none,
              alignment: widget.styleDivider == StyleDivider.bottom
                  ? Alignment.bottomCenter
                  : Alignment.topCenter,
              children: <Widget>[
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: List.generate(widget.items.length, (index) {
                        return Expanded(
                          child: InkWell(
                            onTap: () => widget.onTap?.call(index),
                            child: widget.items.length > index
                                ? SizedBox(
                                    child: buildItem(
                                      context,
                                      item: widget.items[index],
                                      color: widget.color,
                                      isSelected: index == widget.indexSelected,
                                    ),
                                  )
                                : null,
                          ),
                        );
                      }),
                    ),
                  ),
                  Positioned(
                    width: width,
                    child: AnimatedAlign(
                      alignment: Alignment(
                          _getIndicatorPosition(widget.indexSelected), 0),
                      curve: widget.curve ?? Curves.ease,
                      duration: widget.animated
                          ? widget.duration ?? const Duration(milliseconds: 300)
                          : const Duration(milliseconds: 0),
                      child: SizedBox(
                        width: width / widget.items.length,
                        child: Container(
                          alignment: Alignment.center,
                          child: Container(
                            width: 25,
                            height: 4,
                            decoration: BoxDecoration(
                                // color: widget.colorSelected,
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    colors: widget.gradientColorSelected)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ])
          : null,
    );
  }

  Widget buildItem(
    BuildContext context, {
    required CustomTabItem item,
    bool isSelected = false,
    required Color color,
    CountStyle? countStyle,
  }) {
    double bottom = MediaQuery.of(context).viewPadding.bottom;

    EdgeInsets padDefault = EdgeInsets.only(
      top: widget.top!,
      bottom: widget.bottom! > 2 ? widget.bottom! + bottom : bottom,
    );
    isShadow = widget.enableShadow!;
    Color itemColor = isSelected ? widget.colorSelected : color;
    return Container(
      width: double.infinity,
      padding: Platform.isIOS ? null : padDefault,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (Platform.isIOS) Gap(12.sp),
          CustomBuildIcon(
            item: item,
            iconColor: isSelected ? null : c777777,
            iconSize: widget.iconSize,
            countStyle: countStyle,
          ),
          if (item.title is String && item.title != '') ...[
            SizedBox(height: widget.pad),
            GradientTextWidget(
              text: item.title!,
              gradient: isSelected ? goldenTwo : [c777777, c777777],
              fontSize: 11.sp,
              fontWeight: FontWeight.bold,
            ),
            // Text(
            //   item.title!,
            //   style: Theme.of(context)
            //       .textTheme
            //       .overline
            //       ?.merge(widget.titleStyle)
            //       .copyWith(color: itemColor, letterSpacing: 1),
            //   textAlign: TextAlign.center,
            // )
          ],
        ],
      ),
    );
  }
}
