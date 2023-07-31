class Crypto {
  String? walletNumber;
  String? token;
  int? balance;

  Crypto({String? walletNumber, String? token, int? balance}) {
    if (walletNumber != null) {
      this.walletNumber = walletNumber;
    }
    if (token != null) {
      this.token = token;
    }
    if (balance != null) {
      this.balance = balance;
    }
  }

  Crypto.fromJson(Map<String, dynamic> json) {
    walletNumber = json['wallet_number'];
    token = json['token'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['wallet_number'] = walletNumber;
    data['token'] = token;
    data['balance'] = balance;
    return data;
  }
}
