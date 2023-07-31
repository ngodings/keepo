class Fiat {
  String? currency;
  int? balance;

  Fiat({String? currency, int? balance}) {
    if (currency != null) {
      this.currency = currency;
    }
    if (balance != null) {
      this.balance = balance;
    }
  }

  Fiat.fromJson(Map<String, dynamic> json) {
    currency = json['currency'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currency'] = currency;
    data['balance'] = balance;
    return data;
  }
}
