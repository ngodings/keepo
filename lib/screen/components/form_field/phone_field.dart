import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/themes.dart';

class PhoneFieldText extends StatelessWidget {
  const PhoneFieldText(
      {super.key, required this.input, this.onChange, this.number});

  final TextEditingController input;
  final Function(String)? onChange;
  final String? number;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 36.sp,
          width: 69.sp,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.sp), color: cF5F5F5),
          child: Row(
            children: [
              Image.asset('assets/icons/flag.png'),
              Text(
                number!,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: c4F4F4F,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        Gap(10.sp),
        SizedBox(
          width: 239.sp,
          child: TextFormField(
            controller: input,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              focusColor: const Color(0xFFCBCBCB),
              fillColor: const Color(0xFFCBCBCB),
              hintText: 'register_mobile_field'.tr(),
              hintStyle: TextStyle(
                color: textGrey,
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
            onChanged: onChange,
          ),
        ),
      ],
    );
  }
}
