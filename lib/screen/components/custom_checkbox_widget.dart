import 'package:flutter/material.dart';

import '../../../../utils/themes.dart';

class CustomCheckboxWidget extends StatelessWidget {
  const CustomCheckboxWidget({
    super.key,
    required this.onChange,
    required this.value,
    this.title,
    this.subtitle,
    this.isMultiple,
    this.disabled = false
  });
  final Function(bool?) onChange;
  final bool value;
  final String? title;
  final String? subtitle;
  final bool? isMultiple;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26,
      width: 26,
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          isMultiple == true ? 4 : 50,
        ),
        border: Border.all(
          color: blueFinc,
          style: BorderStyle.solid,
        ),
      ),
      child: Checkbox(
        onChanged: disabled ? null : onChange,
        checkColor: blueFinc.withOpacity(disabled ? 0.3 : 1),
        activeColor: blueFinc.withOpacity(disabled ? 0.3 : 1),
        fillColor: MaterialStateProperty.all(blueFinc.withOpacity(disabled ? 0.3 : 1)),
        side: BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            isMultiple == true ? 4 : 50,
          ),
          side: BorderSide.none,
        ),
        value: disabled ? true : value,
      ),
    );
  }
}
