import 'package:flutter/material.dart';
import 'package:keepo/utils/themes.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField(
      {Key? key,
      this.filled,
      this.fillColor,
      this.textEditingController,
      this.obscureText = false,
      this.textInputAction = TextInputAction.done,
      this.keyboardType = TextInputType.text,
      this.labelText,
      this.hintText,
      this.errorText,
      this.validator,
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
      this.border})
      : super(key: key);

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
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;

  final bool isReadOnly;
  final Function()? onTap;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final double? verticalPadding;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final bool underline;

  final double? height;
  final double? radius;

  final InputBorder? border;

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        // isDense: true,
        fillColor: widget.fillColor ?? cF6F7FB,
        labelText: widget.labelText,
        hintText: widget.hintText,
        counterText: "",
        hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
        errorText: widget.errorText,
        enabledBorder: widget.border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: cD6D6D6, width: 0.0),
            ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: error, width: 0.0),
        ),
        focusedBorder: widget.border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: cD6D6D6, width: 0.0),
            ),
        border: widget.border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: cD6D6D6, width: 0.0),
            ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon ?? _getSuffixWidget(),
        labelStyle: Theme.of(context).textTheme.bodyText1,
        contentPadding: EdgeInsets.symmetric(
            horizontal: 10, vertical: widget.verticalPadding ?? 0.5),
      ),
      obscureText: (widget.obscureText) ? !makePasswordVisible : false,
      onTap: widget.onTap,
      readOnly: widget.isReadOnly,
      controller: widget.textEditingController,
      validator: widget.validator,
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
      maxLength: widget.maxLength ?? 100,
      enableSuggestions: false,
      autocorrect: false,
    );
  }

  //check if it's password input
  bool makePasswordVisible = false;
  Widget? _getSuffixWidget() {
    if (widget.obscureText) {
      return ButtonTheme(
        minWidth: 30,
        height: 30,
        padding: EdgeInsets.all(0),
        child: TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.all(0),
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
