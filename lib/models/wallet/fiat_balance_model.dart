class FiatBalanceModel {
  String? status;
  String? message;
  String? serverTime;
  FiatBalanceData? data;

  FiatBalanceModel({this.status, this.message, this.serverTime, this.data});

  FiatBalanceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    serverTime = json['server_time'];
    data = json['data'] != null ? FiatBalanceData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['server_time'] = serverTime;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class FiatBalanceData {
  TotalBalance? totalBalance;
  List<FiatBalance>? fiatBalance;

  FiatBalanceData({this.totalBalance, this.fiatBalance});

  FiatBalanceData.fromJson(Map<String, dynamic> json) {
    totalBalance = json['total_balance'] != null
        ? TotalBalance.fromJson(json['total_balance'])
        : null;
    if (json['fiat_balance'] != null) {
      fiatBalance = <FiatBalance>[];
      json['fiat_balance'].forEach((v) {
        fiatBalance?.add(FiatBalance.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (totalBalance != null) {
      data['total_balance'] = totalBalance?.toJson();
    }
    if (fiatBalance != null) {
      data['fiat_balance'] = fiatBalance?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TotalBalance {
  double? amount;
  String? currencySymbol;
  String? currencyIso;
  String? currencyName;

  TotalBalance(
      {this.amount, this.currencySymbol, this.currencyIso, this.currencyName});

  TotalBalance.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    currencySymbol = json['currency_symbol'];
    currencyIso = json['currency_iso'];
    currencyName = json['currency_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['currency_symbol'] = currencySymbol;
    data['currency_iso'] = currencyIso;
    data['currency_name'] = currencyName;
    return data;
  }
}

class FiatBalance {
  double? amount;
  String? currencySymbol;
  String? currencyIso;
  String? currency;

  FiatBalance(
      {this.amount, this.currencySymbol, this.currencyIso, this.currency});

  FiatBalance.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    currencySymbol = json['currency_symbol'];
    currencyIso = json['currency_iso'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['currency_symbol'] = currencySymbol;
    data['currency_iso'] = currencyIso;
    data['currency'] = currency;
    return data;
  }
}
