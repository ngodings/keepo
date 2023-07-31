import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/themes.dart';

class FormSearchWidget extends StatelessWidget {
  const FormSearchWidget({
    super.key,
    this.controller,
    this.initialValue,
    this.onChanged,
    this.onFieldSubmitted,
    required this.hintText,
    this.suffix,
  });
  final TextEditingController? controller;
  final String? initialValue;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final Widget? suffix;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [
        LengthLimitingTextInputFormatter(100),
      ],
      controller: controller,
      initialValue: initialValue,
      textInputAction: TextInputAction.search,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        filled: true,
        fillColor: inputbg,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        prefixIcon: SvgPicture.asset(
          AppIcons.search,
          color: Colors.white,
          fit: BoxFit.scaleDown,
        ),
        suffixIcon: suffix,
        hintText: hintText.tr(),
      ),
    );
  }
}
