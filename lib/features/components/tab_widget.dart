import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keepo/features/components/text/text_widget.dart';

import '../../utils/themes.dart';

class TabWidgetBackUp extends StatefulWidget {
  const TabWidgetBackUp(
      {Key? key, required this.bodies, required this.logoWidgets})
      : super(key: key);
  final List<Widget> bodies;
  final Map<int, Widget> logoWidgets;

  @override
  State<TabWidgetBackUp> createState() => _TabWidgetBackUpState();
}

class _TabWidgetBackUpState extends State<TabWidgetBackUp> {
  int? theriGroupVakue = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Row(
              children: <Widget>[
                const SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: CupertinoSegmentedControl(
                    selectedColor: Colors.white,
                    unselectedColor: const Color(0xFF9690ae),
                    borderColor: const Color(0xFF9690ae),
                    groupValue: theriGroupVakue,
                    onValueChanged: (changeFromGroupValue) {
                      setState(() {
                        theriGroupVakue = changeFromGroupValue as int?;
                      });
                    },
                    children: widget.logoWidgets,
                  ),
                ),
                const SizedBox(
                  width: 15.0,
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding:
              EdgeInsets.only(top: 5.w, bottom: 14.w, left: 10.w, right: 10.w),
          child: widget.bodies[theriGroupVakue!],
        )
      ],
    );
  }
}

class TabWidget extends StatefulWidget {
  const TabWidget({Key? key, required this.bodies, required this.logoWidgets})
      : super(key: key);
  final List<Widget> bodies;
  final Map<int, Widget> logoWidgets;

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int? theriGroupVakue = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            CupertinoSegmentedControl(
              selectedColor: Colors.transparent,
              unselectedColor: Colors.transparent,
              borderColor: Colors.transparent,
              pressedColor: Colors.blue[50],
              groupValue: theriGroupVakue,
              onValueChanged: (changeFromGroupValue) {
                setState(() {
                  theriGroupVakue = changeFromGroupValue as int?;
                });
              },
              children: widget.logoWidgets,
            ),
          ],
        ),
        Padding(
          padding:
              EdgeInsets.only(top: 5.w, bottom: 30.w, left: 10.w, right: 10.w),
          child: widget.bodies[theriGroupVakue!],
        )
      ],
    );
  }
}
