import '../profile/profile_details.dart';

class Withdrawal {
  String? beneficiaryName;
  String? bankName;
  String? accountNumber;
  String? bankCode;
  String? branchCode;
  String? swiftCode;
  String? bankAddress;
  String? acceptCurrency;
  String? paynowNumber;
  String? emailAddress;
  String? paypalId;
  String? type;
  String? accountId;
  String? username;
  String? amount;
  String? currency;
  String? status;
  Transaction? transaction;
  //ProfileDetails? profile;
  String? document;
  String? id;
  String? createdAt;

  Withdrawal(
      {this.beneficiaryName,
      this.bankName,
      this.accountNumber,
      this.bankCode,
      this.branchCode,
      this.swiftCode,
      this.bankAddress,
      this.acceptCurrency,
      this.paynowNumber,
      this.emailAddress,
      this.paypalId,
      this.type,
      this.accountId,
      this.username,
      this.amount,
      this.currency,
      this.status,
      this.transaction,
      //  this.profile,
      this.document,
      this.id,
      this.createdAt});

  Withdrawal.fromJson(Map<String, dynamic> json) {
    beneficiaryName = json['beneficiary_name'];
    bankName = json['bank_name'];
    accountNumber = json['account_number'];
    bankCode = json['bank_code'];
    branchCode = json['branch_code'];
    swiftCode = json['swift_code'];
    bankAddress = json['bank_address'];
    acceptCurrency = json['accept_currency'];
    paynowNumber = json['paynow_number'];
    emailAddress = json['email_address'];
    paypalId = json['paypalId'];
    type = json['type'];
    accountId = json['accountId'];
    username = json['username'];
    amount = json['amount'];
    currency = json['currency'];
    status = json['status'];
    transaction = json['transaction'] != null
        ? Transaction.fromJson(json['transaction'])
        : null;
    // profile = json['profile'] != null
    //     ? ProfileDetails.fromJson(json['profile'])
    //     : null;
    document = json['document'];
    id = json['id'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    data['type'] = type;
    data['accountId'] = accountId;
    data['username'] = username;
    data['amount'] = amount;
    data['currency'] = currency;
    data['status'] = status;
    if (transaction != null) {
      data['transaction'] = transaction!.toJson();
    }
    // if (profile != null) {
    //   data['profile'] = profile!.toJson();
    // }
    data['document'] = document;
    data['id'] = id;
    data['createdAt'] = createdAt;
    return data;
  }
}

class Transaction {
  String? id;
  String? profileId;
  String? accountId;
  String? fullName;
  String? username;
  String? transactionDirrection;
  String? transactionType;
  String? transactionRef;
  String? paymentDetail;
  String? amount;
  String? currency;
  String? paymentMethod;
  String? paymentChannel;
  String? fees;
  String? feesCurrency;
  String? swapRate;
  String? swapAmount;
  String? swapCurrency;
  bool? isLocked;
  String? status;
  String? approvedBy;
  String? createdAt;
  String? lastEditAt;
  String? approvedAt;
  String? unlockedAt;
  String? rejectedAt;

  Transaction(
      {this.id,
      this.profileId,
      this.accountId,
      this.fullName,
      this.username,
      this.transactionDirrection,
      this.transactionType,
      this.transactionRef,
      this.paymentDetail,
      this.amount,
      this.currency,
      this.paymentMethod,
      this.paymentChannel,
      this.fees,
      this.feesCurrency,
      this.swapRate,
      this.swapAmount,
      this.swapCurrency,
      this.isLocked,
      this.status,
      this.approvedBy,
      this.createdAt,
      this.lastEditAt,
      this.approvedAt,
      this.unlockedAt,
      this.rejectedAt});

  Transaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    profileId = json['profileId'];
    accountId = json['accountId'];
    fullName = json['fullName'];
    username = json['username'];
    transactionDirrection = json['transactionDirrection'];
    transactionType = json['transactionType'];
    transactionRef = json['transactionRef'];
    paymentDetail = json['paymentDetail'];
    amount = json['amount'];
    currency = json['currency'];
    paymentMethod = json['paymentMethod'];
    paymentChannel = json['paymentChannel'];
    fees = json['fees'];
    feesCurrency = json['feesCurrency'];
    swapRate = json['swapRate'];
    swapAmount = json['swapAmount'];
    swapCurrency = json['swapCurrency'];
    isLocked = json['isLocked'];
    status = json['status'];
    approvedBy = json['approvedBy'];
    createdAt = json['createdAt'];
    lastEditAt = json['lastEditAt'];
    approvedAt = json['approvedAt'];
    unlockedAt = json['unlockedAt'];
    rejectedAt = json['rejectedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['profileId'] = profileId;
    data['accountId'] = accountId;
    data['fullName'] = fullName;
    data['username'] = username;
    data['transactionDirrection'] = transactionDirrection;
    data['transactionType'] = transactionType;
    data['transactionRef'] = transactionRef;
    data['paymentDetail'] = paymentDetail;
    data['amount'] = amount;
    data['currency'] = currency;
    data['paymentMethod'] = paymentMethod;
    data['paymentChannel'] = paymentChannel;
    data['fees'] = fees;
    data['feesCurrency'] = feesCurrency;
    data['swapRate'] = swapRate;
    data['swapAmount'] = swapAmount;
    data['swapCurrency'] = swapCurrency;
    data['isLocked'] = isLocked;
    data['status'] = status;
    data['approvedBy'] = approvedBy;
    data['createdAt'] = createdAt;
    data['lastEditAt'] = lastEditAt;
    data['approvedAt'] = approvedAt;
    data['unlockedAt'] = unlockedAt;
    data['rejectedAt'] = rejectedAt;
    return data;
  }
}

// class Profile {
//   String? id;
//   String? thumbnail;
//   String? name;
//   String? firstName;
//   String? lastName;
//   String? countryId;
//   String? dob;
//   String? gender;
//   String? username;
//   String? tagline;
//   String? height;
//   String? weight;
//   String? language;
//   String? occupation;
//   String? background;
//   String? bio;
//   String? description;
//   bool? show;
//   bool? allchat;
//   bool? contact;
//   String? contactSelected;
//   String? showMatching;
//   String? settingMatchingDetail;
//   bool? deleted;
//   bool? blocked;
//   String? reason;
//   String? createdAt;
//   String? lastEditAt;
//   String? lastEditUsernameAt;
//   String? lastSwitchingAt;

  // Profile(
  //     {this.id,
  //     this.thumbnail,
  //     this.name,
  //     this.firstName,
  //     this.lastName,
  //     this.countryId,
  //     this.dob,
  //     this.gender,
  //     this.username,
  //     this.tagline,
  //     this.height,
  //     this.weight,
  //     this.language,
  //     this.occupation,
  //     this.background,
  //     this.bio,
  //     this.description,
  //     this.show,
  //     this.allchat,
  //     this.contact,
  //     this.contactSelected,
  //     this.showMatching,
  //     this.settingMatchingDetail,
  //     this.deleted,
  //     this.blocked,
  //     this.reason,
  //     this.createdAt,
  //     this.lastEditAt,
  //     this.lastEditUsernameAt,
  //     this.lastSwitchingAt});

  // Profile.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   thumbnail = json['thumbnail'];
  //   name = json['name'];
  //   firstName = json['first_name'];
  //   lastName = json['last_name'];
  //   countryId = json['country_id'];
  //   dob = json['dob'];
  //   gender = json['gender'];
  //   username = json['username'];
  //   tagline = json['tagline'];
  //   height = json['height'];
  //   weight = json['weight'];
  //   language = json['language'];
  //   occupation = json['occupation'];
  //   background = json['background'];
  //   bio = json['bio'];
  //   description = json['description'];
  //   show = json['show'];
  //   allchat = json['allchat'];
  //   contact = json['contact'];
  //   contactSelected = json['contact_selected'];
  //   showMatching = json['show_matching'];
  //   settingMatchingDetail = json['setting_matching_detail'];
  //   deleted = json['deleted'];
  //   blocked = json['blocked'];
  //   reason = json['reason'];
  //   createdAt = json['createdAt'];
  //   lastEditAt = json['lastEditAt'];
  //   lastEditUsernameAt = json['lastEditUsernameAt'];
  //   lastSwitchingAt = json['lastSwitchingAt'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = id;
  //   data['thumbnail'] = thumbnail;
  //   data['name'] = name;
  //   data['first_name'] = firstName;
  //   data['last_name'] = lastName;
  //   data['country_id'] = countryId;
  //   data['dob'] = dob;
  //   data['gender'] = gender;
  //   data['username'] = username;
  //   data['tagline'] = tagline;
  //   data['height'] = height;
  //   data['weight'] = weight;
  //   data['language'] = language;
  //   data['occupation'] = occupation;
  //   data['background'] = background;
  //   data['bio'] = bio;
  //   data['description'] = description;
  //   data['show'] = show;
  //   data['allchat'] = allchat;
  //   data['contact'] = contact;
  //   data['contact_selected'] = contactSelected;
  //   data['show_matching'] = showMatching;
  //   data['setting_matching_detail'] = settingMatchingDetail;
  //   data['deleted'] = deleted;
  //   data['blocked'] = blocked;
  //   data['reason'] = reason;
  //   data['createdAt'] = createdAt;
  //   data['lastEditAt'] = lastEditAt;
  //   data['lastEditUsernameAt'] = lastEditUsernameAt;
  //   data['lastSwitchingAt'] = lastSwitchingAt;
  //   return data;
  // }
//}
