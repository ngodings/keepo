import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:keepo/features/components/text/text_widget.dart';
import 'package:keepo/utils/themes.dart';

import '../../services/navigation.dart';
import '../../utils/app_routes.dart';

class ResetPasscodeWidget extends StatelessWidget {
  const ResetPasscodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientTextWidget(
      gradient: gradientFincy,
      text: 'reset_passcode',
      fontSize: 13.sp,
      fontWeight: FontWeight.w600,
    ).centered().onTap(() => GetIt.I<NavigationServiceMain>().pushNamed(
          AppRoutes.termsWebView,
          args: {'url': 'https://keepo.ai/'},
        ));
  }
}
