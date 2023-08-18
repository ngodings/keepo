import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keepo/utils/themes.dart';

class NoBorderTextFormField extends StatefulWidget {
  const NoBorderTextFormField({
    Key? key,
    this.filled,
    this.fillColor,
    this.textEditingController,
    this.obscureText = false,
    this.textInputAction = TextInputAction.done,
    this.keyboardType = TextInputType.text,
    this.labelText,
    this.hintText,
    this.errorText,
    // this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.focusNode,
    this.nextFocusNode,
    this.isReadOnly = false,
    this.onTap,
    this.minLines,
    this.maxLines,
    this.suffixIcon,
    this.prefixIcon,
    this.underline = false,
    this.height,
    this.radius,
    this.maxLength,
    this.verticalPadding,
    this.style,
    this.hintStyle,
    this.textAlign,
    this.errorSpace,
    this.denySpace,
    this.alphanumericOnly,
    this.minLength,
    this.errorEmpty,
  }) : super(key: key);

  //
  final bool? filled;
  final Color? fillColor;
  final TextEditingController? textEditingController;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;

  //
  final String? labelText;
  final String? hintText;
  final String? errorText;

  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  // final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;

  final bool isReadOnly;
  final Function()? onTap;
  final int? minLines;
  final int? maxLines;
  final double? verticalPadding;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final bool underline;

  final double? height;
  final double? radius;

  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextAlign? textAlign;

  final int? maxLength;
  final int? minLength;
  final bool? errorEmpty;
  final bool? errorSpace;
  final bool? denySpace;
  final bool? alphanumericOnly;

  @override
  _NoBorderTextFormFieldState createState() => _NoBorderTextFormFieldState();
}

class _NoBorderTextFormFieldState extends State<NoBorderTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        // isDense: true,
        fillColor:
            widget.fillColor ?? CustomColor.inversePrimary.withOpacity(0.5),
        labelText: widget.labelText,
        hintText: widget.hintText,
        counterText: "",
        hintStyle:
            widget.hintStyle ?? TextStyle(color: Colors.grey, fontSize: 13.sp),
        errorText: widget.errorText,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon ?? _getSuffixWidget(),
        labelStyle: Theme.of(context).textTheme.bodyText1,
        contentPadding: EdgeInsets.symmetric(
            horizontal: 8.sp, vertical: widget.verticalPadding ?? 0.5),
      ),
      textAlign: widget.textAlign ?? TextAlign.start,
      obscureText: (widget.obscureText) ? !makePasswordVisible : false,
      onTap: widget.onTap,
      readOnly: widget.isReadOnly,
      controller: widget.textEditingController,
      // validator: widget.validator,
      focusNode: widget.focusNode,
      onFieldSubmitted: (data) {
        if (widget.onFieldSubmitted != null) {
          widget.onFieldSubmitted!(data);
        } else {
          FocusScope.of(context).requestFocus(widget.nextFocusNode);
        }
      },
      onChanged: widget.onChanged,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      minLines: widget.minLines,
      maxLines: widget.obscureText ? 1 : widget.maxLines,
      // maxLength: widget.maxLength ?? 100,
      enableSuggestions: false,
      autocorrect: false,
      style: widget.style,
      inputFormatters: [
        LengthLimitingTextInputFormatter(widget.maxLength),
        if (widget.denySpace == true)
          FilteringTextInputFormatter.deny(RegExp('[ ]')),
        if (widget.alphanumericOnly == true)
          FilteringTextInputFormatter.deny(RegExp(r'[\W]')),
      ],
      validator: (value) {
        return widget.errorEmpty == true && value!.isEmpty
            ? 'Cant be empty'
            : value!.length < (widget.minLength ?? 0)
                ? 'minimum ${widget.minLength} character'
                : null;
      },
    );
  }

  //check if it's password input
  bool makePasswordVisible = false;

  Widget? _getSuffixWidget() {
    if (widget.obscureText) {
      return ButtonTheme(
        minWidth: 30,
        height: 30,
        padding: const EdgeInsets.all(0),
        child: TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(0),
          ),
          onPressed: () {
            setState(() {
              makePasswordVisible = !makePasswordVisible;
            });
          },
          child: Icon(
            (!makePasswordVisible)
                ? Icons.remove_red_eye_outlined
                : Icons.remove_red_eye,
            color: Colors.grey,
          ),
        ),
      );
    } else {
      return null;
    }
  }
}
