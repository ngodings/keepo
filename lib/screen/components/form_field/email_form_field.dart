import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../utils/themes.dart';

class EmailFormField extends StatelessWidget {
  const EmailFormField({
    super.key,
    required this.hintText,
    required this.label,
    this.onChange,
    this.controller,
    this.keyboardType,
    this.enabledBorder,
    this.focusedBorder,
    this.border,
    this.readOnly,
    this.align,
    this.suffix,
    this.maxLength,
    this.minLength,
    this.errorEmpty,
    this.errorSymbol,
    this.errorSpace,
    this.alphanumericOnly,
    this.denySpace,
    this.onSaved,
    this.onFieldSubmitted,
    this.onTap,
    this.initialValue,
    this.contentPadding,
    this.suffixIcon,
    this.hintTextHeight,
    this.maxLine,
    this.onEditingComplete,
    this.autoValidate,
    this.focusNode,
    this.hintTextStyle,
    this.labelStyle,
    this.inputStyle,
    this.suffixStyle,
    this.borderOpacity,
  });

  final TextEditingController? controller;
  final String? initialValue;
  final String hintText, label;
  final Function(String)? onChange, onFieldSubmitted;
  final Function(String?)? onSaved;
  final Function()? onTap;
  final Function()? onEditingComplete;
  final TextInputType? keyboardType;
  final InputBorder? enabledBorder, focusedBorder, border;
  final bool? readOnly;
  final TextAlign? align;
  final EdgeInsets? contentPadding;
  final Widget? suffixIcon;
  final double? hintTextHeight;
  final double? borderOpacity;

  final String? suffix;
  final int? maxLength;
  final int? minLength;
  final int? maxLine;
  final bool? errorEmpty;
  final bool? errorSymbol;
  final bool? errorSpace;
  final bool? denySpace;
  final bool? alphanumericOnly;
  final AutovalidateMode? autoValidate;
  final FocusNode? focusNode;

  final TextStyle? hintTextStyle, labelStyle, inputStyle, suffixStyle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      inputFormatters: [
        LengthLimitingTextInputFormatter(100),
        FilteringTextInputFormatter.allow(
          RegExp(
            r"[\w]+(\.[\w]+)*(@{0,1})([\w]+)*(\.[\w]+)*(\.)*(\w+)*",
          ),
        ),
        FilteringTextInputFormatter.deny(RegExp(r"[\W _]{2,}")),
      ],
      validator: (value) {
        return value!.isEmpty
            ? 'cant_be_empty'.tr()
            : value.length < 4
                ? '${'minimum'.tr()} 4 ${'characters'.tr()}'
                : value.length > 100
                    ? '${'maximum'.tr()} 100 ${'characters'.tr()}'
                    // : !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    //         .hasMatch(value)
                    : !RegExp(r'^\w+(\.\w+)*@(\w+)(\.\w+)*(\.\w{2,})$')
                            .hasMatch(value)
                        ? 'invalid_format_email'.tr()
                        : null;
      },
      autovalidateMode: autoValidate ?? AutovalidateMode.onUserInteraction,
      controller: controller,
      initialValue: initialValue,
      textAlign: align ?? TextAlign.start,
      readOnly: readOnly ?? false,
      maxLines: maxLine == 0 ? null : 1,
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        isDense: true,
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: label.tr(),
        prefix: Visibility(
          visible: suffix == null ? false : true,
          child: GradientText(
            colors: goldenTwo,
            suffix ?? '',
            style: suffixStyle ??
                TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        suffixIcon: suffixIcon,
        labelStyle: labelStyle ??
            TextStyle(
              color: CustomColor.onBackground.withOpacity(0.8),
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              // height: 5
            ),
        focusColor: const Color(0xFFCBCBCB),
        fillColor: const Color(0xFFCBCBCB),
        hintText: hintText.tr(),
        hintStyle: hintTextStyle ??
            TextStyle(
              color: CustomColor.onBackground.withOpacity(0.5),
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              height: hintTextHeight ?? 1.6.sp,
            ),
        border: readOnly == true
            ? UnderlineInputBorder(
                borderSide: BorderSide(
                    color: CustomColor.onBackground
                        .withOpacity(borderOpacity ?? 0.1)),
              )
            : null,
        enabledBorder: readOnly == true
            ? UnderlineInputBorder(
                borderSide: BorderSide(
                    color: CustomColor.onBackground
                        .withOpacity(borderOpacity ?? 0.1)),
              )
            : enabledBorder ??
                UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: CustomColor.onBackground.withOpacity(0.09)),
                ),
        focusedBorder: readOnly == true
            ? UnderlineInputBorder(
                borderSide: BorderSide(
                    color: CustomColor.onBackground
                        .withOpacity(borderOpacity ?? 0.1)),
              )
            : focusedBorder ??
                UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: CustomColor.onBackground.withOpacity(0.3)),
                ),
        contentPadding: contentPadding ?? EdgeInsets.symmetric(vertical: 8.sp),
      ),
      style: inputStyle ??
          TextStyle(
            color: CustomColor.onBackground,
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
          ),
      onChanged: onChange ?? (text) {},
      onSaved: onSaved ?? (text) {},
      onFieldSubmitted: onFieldSubmitted ?? (value) {},
      onTap: onTap,
      onEditingComplete: onEditingComplete,
    );
  }
}
