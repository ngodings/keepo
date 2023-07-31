class UserBankInfo {
  String? id;
  String? beneficiaryName;
  String? bankName;
  String? name;
  String? phoneNumber;
  String? accountNumber;
  String? bankCode;
  String? branchCode;
  String? swiftCode;
  String? bankAddress;
  String? acceptCurrency;
  String? paynowNumber;
  String? emailAddress;
  String? paypalId;
  List<String>? document;
  String? type;
  String? status;
  bool? defaultPayment;
  bool? deleted;
  String? lastEditAt;
  String? createdAt;

  UserBankInfo({
    this.id,
    this.beneficiaryName,
    this.bankName,
    this.name,
    this.phoneNumber,
    this.accountNumber,
    this.bankCode,
    this.branchCode,
    this.swiftCode,
    this.bankAddress,
    this.acceptCurrency,
    this.paynowNumber,
    this.emailAddress,
    this.paypalId,
    this.document,
    this.type,
    this.status,
    this.defaultPayment,
    this.deleted,
    this.lastEditAt,
    this.createdAt,
  });

  UserBankInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    beneficiaryName = json['beneficiary_name'];
    bankName = json['bank_name'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    accountNumber = json['account_number'];
    bankCode = json['bank_code'];
    branchCode = json['branch_code'];
    swiftCode = json['swift_code'];
    bankAddress = json['bank_address'];
    acceptCurrency = json['accept_currency'];
    paynowNumber = json['paynow_number'];
    emailAddress = json['email_address'];
    paypalId = json['paypalId'];
    document = json["document"] == null
        ? null
        : List<String>.from(json["document"].map((x) => x));
    type = json['type'];
    status = json['status'];
    defaultPayment = json['default'];
    deleted = json['deleted'];
    lastEditAt = json['lastEditAt'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['beneficiary_name'] = beneficiaryName;
    data['bank_name'] = bankName;
    data['account_number'] = accountNumber;
    data['bank_code'] = bankCode;
    data['branch_code'] = branchCode;
    data['swift_code'] = swiftCode;
    data['bank_address'] = bankAddress;
    data['accept_currency'] = acceptCurrency;
    data['paynow_number'] = paynowNumber;
    data['email_address'] = emailAddress;
    data['paypalId'] = paypalId;
    data['document'] = document;
    data['type'] = type;
    data['status'] = status;
    data['default'] = defaultPayment;
    data['deleted'] = deleted;
    data['lastEditAt'] = lastEditAt;
    data['createdAt'] = createdAt;
    return data;
  }
}
