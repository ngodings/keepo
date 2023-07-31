class BankModel {
  String? status;
  String? message;
  String? serverTime;
  BankData? data;

  BankModel({this.status, this.message, this.serverTime, this.data});

  BankModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    serverTime = json['server_time'];
    data = json['data'] != null ? BankData.fromJson(json['data']) : null;
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

class BankData {
  List<Country>? country;
  List<UserBank>? userBank;
  DepositBank? depositBank;

  BankData({this.country, this.userBank, this.depositBank});

  BankData.fromJson(Map<String, dynamic> json) {
    if (json['country'] != null) {
      country = <Country>[];
      json['country'].forEach((v) {
        country?.add(Country.fromJson(v));
      });
    }
    if (json['user_bank'] != null) {
      userBank = <UserBank>[];
      json['user_bank'].forEach((v) {
        userBank?.add(UserBank.fromJson(v));
      });
    }
    depositBank = json['deposit_bank'] != null
        ? DepositBank.fromJson(json['deposit_bank'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (country != null) {
      data['country'] = country?.map((v) => v.toJson()).toList();
    }
    if (userBank != null) {
      data['user_bank'] = userBank?.map((v) => v.toJson()).toList();
    }
    if (depositBank != null) {
      data['deposit_bank'] = depositBank?.toJson();
    }
    return data;
  }
}

class Country {
  String? sId;
  String? countryName;
  String? currencyIso;
  String? currencySymbol;

  Country({this.sId, this.countryName, this.currencyIso, this.currencySymbol});

  Country.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    countryName = json['country_name'];
    currencyIso = json['currency_iso'];
    currencySymbol = json['currency_symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['country_name'] = countryName;
    data['currency_iso'] = currencyIso;
    data['currency_symbol'] = currencySymbol;
    return data;
  }
}

class UserBank {
  String? sId;
  String? bankName;
  String? bankBeneficiary;
  String? bankAddress;
  String? bankAccount;
  String? swiftCode;
  String? currencyIso;

  UserBank(
      {this.sId,
      this.bankName,
      this.bankBeneficiary,
      this.bankAddress,
      this.bankAccount,
      this.swiftCode,
      this.currencyIso});

  UserBank.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    bankName = json['bank_name'];
    bankBeneficiary = json['bank_beneficiary'];
    bankAddress = json['bank_address'];
    bankAccount = json['bank_account'];
    swiftCode = json['swift_code'];
    currencyIso = json['currency_iso'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['bank_name'] = bankName;
    data['bank_beneficiary'] = bankBeneficiary;
    data['bank_address'] = bankAddress;
    data['bank_account'] = bankAccount;
    data['swift_code'] = swiftCode;
    data['currency_iso'] = currencyIso;
    return data;
  }
}

class DepositBank {
  String? bank;
  String? bankBeneficiary;
  String? bankAccount;
  String? swiftCode;
  String? depositId;

  DepositBank(
      {this.bank,
      this.bankBeneficiary,
      this.bankAccount,
      this.swiftCode,
      this.depositId});

  DepositBank.fromJson(Map<String, dynamic> json) {
    bank = json['bank'];
    bankBeneficiary = json['bank_beneficiary'];
    bankAccount = json['bank_account'];
    swiftCode = json['swift_code'];
    depositId = json['deposit_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bank'] = bank;
    data['bank_beneficiary'] = bankBeneficiary;
    data['bank_account'] = bankAccount;
    data['swift_code'] = swiftCode;
    data['deposit_id'] = depositId;
    return data;
  }
}
