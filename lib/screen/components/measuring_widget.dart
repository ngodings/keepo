import 'dart:async';

import 'package:flutter/material.dart';

class MeasurableWidget extends StatefulWidget {
  const MeasurableWidget({Key? key, required this.child, required this.onSized})
      : super(key: key);
  final Widget child;
  final void Function(Size size) onSized;

  @override
  @override
  State<MeasurableWidget> createState() {
    return _MeasurableWidgetState();
  }
}

class _MeasurableWidgetState extends State<MeasurableWidget> {
  bool _hasMeasured = false;

  @override
  Widget build(BuildContext context) {
    Size size = (context.findRenderObject() as RenderBox).size;
    if (size != Size.zero) {
      widget.onSized.call(size);
    } else if (!_hasMeasured) {
      // Need to build twice in order to get size
      scheduleMicrotask(() => setState(() => _hasMeasured = true));
    }
    return widget.child;
  }
}
