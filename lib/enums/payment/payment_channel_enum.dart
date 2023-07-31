enum PaymentChannelEnum {
  manualBankTransfer('Bank Transfer'),
  stripeCC('Credit Card'),
  shopeePay('Shopee Pay'),
  alipay('Ali Pay'),
  paynow('PayNow Qr'),
  renBalance('Ren Balance'),
  zenBalance('Zen Balance'),
  paypal('PayPal'),
  grabPay('Grab Pay'),
  weChatPay('Wechat Pay');

  const PaymentChannelEnum(this.type);
  final String type;
}

extension ConvertPaymentChannel on String {
  PaymentChannelEnum toEnumPC() {
    switch (this) {
      case 'Credit Card':
        return PaymentChannelEnum.stripeCC;
      case 'Shopee Pay':
        return PaymentChannelEnum.shopeePay;
      case 'PayPal':
        return PaymentChannelEnum.paypal;
      case 'Grab Pay':
        return PaymentChannelEnum.grabPay;
      case 'Wechat Pay':
        return PaymentChannelEnum.weChatPay;
      case 'Ali Pay':
        return PaymentChannelEnum.alipay;
      case 'PayNow QR':
        return PaymentChannelEnum.paynow;
      case 'Ren Balance':
        return PaymentChannelEnum.renBalance;
      case 'Zen Balance':
        return PaymentChannelEnum.zenBalance;
      default:
        return PaymentChannelEnum.manualBankTransfer;
    }
  }
}
