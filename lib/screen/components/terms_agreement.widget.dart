import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:keepo/screen/components/text/text_widget.dart';
import 'package:keepo/utils/themes.dart';

class TermsAgreementWidget extends StatelessWidget {
  const TermsAgreementWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HStack(
      [
        VStack(
          [
            HStack([
              TextWidget(
                text: 'by_signing_in_or_registering,_you_agree_to_our',
                color: CustomColor.onBackground.withOpacity(0.5),
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ]),
            Gap(1.sp),
            HStack(
              [
                TextWidget(
                  text: 'terms_of_service',
                  color: Colors.blue,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ).onTap(() async {
                  await launchUrl(
                      Uri.parse('https://keepo.ai/terms-of-service/'));
                }),
                ' and '
                    .text
                    .color(CustomColor.onBackground.withOpacity(0.5))
                    .fontWeight(FontWeight.w500)
                    .size(12.sp)
                    .make(),
                TextWidget(
                  text: 'privacy_policy',
                  color: Colors.blue,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ).onTap(() async {
                  await launchUrl(Uri.parse('https://keepo.ai/privacy/'));
                }),
              ],
            ),
          ],
          alignment: MainAxisAlignment.center,
          crossAlignment: CrossAxisAlignment.center,
        ),
      ],
      alignment: MainAxisAlignment.center,
      crossAlignment: CrossAxisAlignment.center,
    );
  }
}
