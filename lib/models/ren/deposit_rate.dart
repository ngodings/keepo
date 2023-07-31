class DepositRate {
  String? from;
  String? to;
  String? rate;

  DepositRate({this.from, this.to, this.rate});

  DepositRate.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['from'] = from;
    data['to'] = to;
    data['rate'] = rate;
    return data;
  }
}
