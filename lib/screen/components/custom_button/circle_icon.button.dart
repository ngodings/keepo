import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  final Widget child;
  final Function()? onpressed;
  final List<Color>? gradientColors;
  final List<double>? gradientStops;

  const CircleIconButton({
    required this.child,
    required this.onpressed,
    this.gradientColors,
    this.gradientStops,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // ignore: prefer_const_literals_to_create_immutables
        boxShadow: [
          const BoxShadow(
              color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0),
        ],
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: gradientStops ?? [0.0, 1.0],
          colors: gradientColors ??
              [
                Colors.deepPurple.shade400,
                Colors.deepPurple.shade200,
              ],
        ),
        shape: BoxShape.circle,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          minimumSize: const Size(50, 50),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          elevation: 0,
        ),
        onPressed: onpressed,
        child: child,
      ),
    );
  }
}
