import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:keepo/utils/themes.dart';

class CustomPinCode extends StatelessWidget {
  const CustomPinCode({super.key});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      length: 6,
      obscureText: true,
      obscuringWidget: GradientText(
        '●',
        colors: gradientFincy,
      ),
      animationType: AnimationType.fade,
      keyboardType: TextInputType.number,
      pinTheme: PinTheme(
        inactiveColor: Colors.grey.withOpacity(0.3),
        selectedColor: Colors.grey.withOpacity(0.3),
        activeColor: Colors.grey.withOpacity(0.3),
        inactiveFillColor: Colors.grey.withOpacity(0.3),
        selectedFillColor: Colors.grey.withOpacity(0.3),
        activeFillColor: Colors.grey.withOpacity(0.3),
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(10),
        fieldHeight: 56.sp,
        fieldWidth: 45.sp,
      ),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      // controller: codeC,
      onCompleted: (v) async {},
      onChanged: (v) {},
      // beforeTextPaste: (text) {},
      appContext: context,
    );
  }
}
