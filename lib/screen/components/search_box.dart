import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keepo/screen/components/form_field/no_border.form_field.dart';
import 'package:keepo/utils/app_assets.dart';
import 'package:keepo/utils/themes.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key, required this.onChange}) : super(key: key);
  final Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    return NoBorderTextFormField(
      prefixIcon: SvgPicture.asset(
        AppIcons.search,
        fit: BoxFit.scaleDown,
      ),
      hintText: "search".tr(),
      fillColor: CustomColor.inversePrimary.withOpacity(0.7),
      onChanged: onChange,
    );
  }
}
