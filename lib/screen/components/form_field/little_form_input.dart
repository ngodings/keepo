import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormFieldByAWord extends StatelessWidget {
  const FormFieldByAWord(
      {super.key,
      required this.input,
      required this.hintText,
      required this.inputType,
      this.onChange});
  final TextEditingController input;
  final String hintText;
  final TextInputType inputType;
  final Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30.sp,
      child: TextFormField(
        textAlign: TextAlign.center,
        controller: input,
        keyboardType: TextInputType.datetime,
        decoration: InputDecoration(
          focusColor: const Color(0xFFCBCBCB),
          fillColor: const Color(0xFFCBCBCB),
          hintText: hintText,
          hintStyle: TextStyle(
            color: const Color(0xFFCBCBCB),
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFCBCBCB)),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFCBCBCB)),
          ),
        ),
        style: TextStyle(
          color: const Color(0xFF3D3D3D),
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
        onChanged: onChange!,
      ),
    );
  }
}
