import 'package:keepo/enums/payment/payment_channel_enum.dart';
import 'package:keepo/utils/app_assets.dart';

class RegexFile {
  RegExp regexVideo() {
    Pattern pattern = r'^.*.(mp4|webm|ogg|mov)$';
    final regex = RegExp('$pattern');
    return regex;
  }
}

class PaymentService {
  String getPaymentLogo(String tier) {
    String paymentLogo = AppImages.maybankLogo;
    switch (tier.toEnumPC()) {
      case PaymentChannelEnum.manualBankTransfer:
        paymentLogo = AppImages.swiftLogo;
        break;
      case PaymentChannelEnum.paypal:
        paymentLogo = AppImages.paypalLogo;
        break;
      case PaymentChannelEnum.stripeCC:
        paymentLogo = AppImages.stripeLogo;
        break;
      case PaymentChannelEnum.paynow:
        paymentLogo = AppImages.paynowLogo;
        break;
      case PaymentChannelEnum.alipay:
        paymentLogo = AppImages.alipayLogo;
        break;
      case PaymentChannelEnum.shopeePay:
        paymentLogo = AppImages.shopeepayLogo;
        break;
      case PaymentChannelEnum.renBalance:
        paymentLogo = AppImages.successRenIcon;
        break;
      case PaymentChannelEnum.zenBalance:
        paymentLogo = AppImages.successRenIcon;
        break;
      case PaymentChannelEnum.grabPay:
        paymentLogo = AppImages.grabpayLogo;
        break;
      case PaymentChannelEnum.weChatPay:
        paymentLogo = AppImages.wechatpayLogo;
        break;
      default:
        paymentLogo = AppIcons.jewelBasic;
        break;
    }

    return paymentLogo;
  }
}
