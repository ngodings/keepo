enum PaymentMethodEnum {
  stripe('Stripe'),
  paypal('Paypal'),
  paynow('PayNow'),
  manual('Manual'),
  oxypay('OxPay'),
  balance('Account');

  const PaymentMethodEnum(this.type);
  final String type;
}

extension ConvertPaymentMethod on String {
  PaymentMethodEnum toEnum() {
    switch (this) {
      case 'Stripe':
        return PaymentMethodEnum.stripe;
      case 'Paypal':
        return PaymentMethodEnum.paypal;
      case 'PayNow':
        return PaymentMethodEnum.paynow;
      case 'OxPay':
        return PaymentMethodEnum.oxypay;
      case 'Account':
        return PaymentMethodEnum.balance;
      default:
        return PaymentMethodEnum.manual;
    }
  }
}
