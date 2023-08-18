import 'package:flutter/material.dart';
import 'package:keepo/utils/themes.dart';

class BackgroundGreenColoured extends StatelessWidget {
  const BackgroundGreenColoured({Key? key, required this.body})
      : super(key: key);
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: CustomColor.background,
          ),
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [
                const Color(0xFF07484C),
                CustomColor.background.withOpacity(0.1),
              ],
              center: Alignment.topRight,
              radius: 1.6,
            ),
          ),
        ),
        body
      ],
    );
  }
}
