class Wallet {
  String? countryId;
  String? balance;

  Wallet({
    this.countryId,
    this.balance,
  });

  Wallet.fromJson(Map<String, dynamic> json) {
    countryId = json['country_id'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country_id'] = countryId;
    data['balance'] = balance;

    return data;
  }
}
