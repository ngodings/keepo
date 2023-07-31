class RenStripeCC {
  String? paymentID;
  String? items;
  double? amount;
  String? currency;
  String? paymentChannel;
  String? status;
  String? endPoint;

  RenStripeCC(
      {this.paymentID,
      this.items,
      this.amount,
      this.currency,
      this.paymentChannel,
      this.status,
      this.endPoint});

  RenStripeCC.fromJson(Map<String, dynamic> json) {
    paymentID = json['orderId'];
    items = json['items'];
    amount = double.parse(json['amount'].toString());
    currency = json['currency'];
    paymentChannel = json['payment_channel'];
    status = json['status'];
    endPoint = json['end_point'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orderId'] = paymentID;
    data['items'] = items;
    data['amount'] = amount;
    data['currency'] = currency;
    data['payment_channel'] = paymentChannel;
    data['status'] = status;
    data['end_point'] = endPoint;
    return data;
  }
}
