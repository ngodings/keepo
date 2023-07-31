import 'package:keepo/enums/payment/payment_channel_enum.dart';

class RenManualBank {
  String? items;
  String? amount;
  String? currency;
  String? renAmount;
  String? paymentChannel;
  String? status;
  List<PaymentInfo>? paymentInfo;

  RenManualBank(
      {this.items,
      this.amount,
      this.currency,
      this.renAmount,
      this.paymentChannel,
      this.status,
      this.paymentInfo});

  RenManualBank.fromJson(Map<String, dynamic> json) {
    items = json['items'];
    amount = json['amount'];
    currency = json['currency'];
    renAmount = json['ren_amount'];
    paymentChannel = json['payment_channel'];
    status = json['status'];
    if (json['payment_info'] != null) {
      paymentInfo = <PaymentInfo>[];
      json['payment_info'].forEach((v) {
        paymentInfo!.add(PaymentInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['items'] = items;
    data['amount'] = amount;
    data['currency'] = currency;
    data['ren_amount'] = renAmount;
    data['payment_channel'] = paymentChannel;
    data['status'] = status;
    if (paymentInfo != null) {
      data['payment_info'] = paymentInfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PaymentInfo {
  String? beneficiaryName;
  String? bankName;
  String? accountNumber;
  String? bankCode;
  String? branchCode;
  String? swiftCode;
  String? bankAddress;
  String? transactionReference;

  PaymentInfo(
      {this.beneficiaryName,
      this.bankName,
      this.accountNumber,
      this.bankCode,
      this.branchCode,
      this.swiftCode,
      this.bankAddress,
      this.transactionReference});

  PaymentInfo.fromJson(Map<String, dynamic> json) {
    beneficiaryName = json['beneficiary_name'];
    bankName = json['bank_name'];
    accountNumber = json['account_number'];
    bankCode = json['bank_code'];
    branchCode = json['branch_code'];
    swiftCode = json['swift_code'];
    bankAddress = json['bank_address'];
    transactionReference = json['transaction_reference'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['beneficiary_name'] = beneficiaryName;
    data['bank_name'] = bankName;
    data['account_number'] = accountNumber;
    data['bank_code'] = bankCode;
    data['branch_code'] = branchCode;
    data['swift_code'] = swiftCode;
    data['bank_address'] = bankAddress;
    data['transaction_reference'] = transactionReference;
    return data;
  }
}

class PaymentChannels {
  PaymentChannelEnum? paymentChannel;
  String? totalPrice;
  String? currency;

  PaymentChannels({
    this.paymentChannel,
    this.totalPrice,
    this.currency,
  });

  PaymentChannels.fromJson(Map<String, dynamic> json) {
    paymentChannel = ((json['payment_channel'] ?? "") as String).toEnumPC();
    totalPrice = json['total_price'].toString();
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['payment_channel'] = paymentChannel;
    data['total_price'] = totalPrice;
    data['currency'] = currency;

    return data;
  }
}
