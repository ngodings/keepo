class Rate {
  String? currencyIso;
  String? currencySymbol;
  int? currencyAmount;

  Rate({this.currencyIso, this.currencySymbol, this.currencyAmount});

  Rate.fromJson(Map<String, dynamic> json) {
    currencyIso = json['currency_iso'];
    currencySymbol = json['currency_symbol'];
    currencyAmount = json['currency_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currency_iso'] = currencyIso;
    data['currency_symbol'] = currencySymbol;
    data['currency_amount'] = currencyAmount;
    return data;
  }
}
