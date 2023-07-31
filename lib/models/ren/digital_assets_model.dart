class DigitalAssets {
  String? name;
  String? balance;
  String? currency;

  DigitalAssets({this.name, this.balance, this.currency});

  DigitalAssets.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    balance = json['balance'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['balance'] = balance;
    data['currency'] = currency;
    return data;
  }
}
