import 'package:flutter/material.dart';
import 'package:keepo/models/booking/buyer_model.dart';
import 'package:keepo/models/booking/schedule_result.dart';

class OrderHistory {
  String? id;
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
  String? document;
  String? createdAt;
  Transaction? transaction;
  String? profileId;
  String? invoiceNumber;
  String? totalPrice;
  String? totalFees;
  String? totalProduct;
  String? imageAttach;
  String? shipmentId;
  String? description;
  String? lastEditAt;
  List<Product>? product;

  OrderHistory(
      {this.id,
      this.beneficiaryName,
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
      this.document,
      this.createdAt,
      this.transaction,
      this.profileId,
      this.invoiceNumber,
      this.totalPrice,
      this.totalFees,
      this.totalProduct,
      this.imageAttach,
      this.shipmentId,
      this.description,
      this.lastEditAt,
      this.product});

  OrderHistory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
    document = json['document'];
    createdAt = json['createdAt'];
    transaction = json['transaction'] != null
        ? Transaction.fromJson(json['transaction'])
        : null;
    profileId = json['profileId'];
    invoiceNumber = json['invoice_number'];
    totalPrice = json['totalPrice'];
    totalFees = json['totalFees'];
    totalProduct = json['totalProduct'];
    imageAttach = json['imageAttach'];
    shipmentId = json['shipmentId'];
    description = json['description'];
    lastEditAt = json['lastEditAt'];
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(Product.fromJson(v));
      });
    }
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
    data['type'] = type;
    data['accountId'] = accountId;
    data['username'] = username;
    data['amount'] = amount;
    data['currency'] = currency;
    data['status'] = status;
    data['document'] = document;
    data['createdAt'] = createdAt;
    if (transaction != null) {
      data['transaction'] = transaction!.toJson();
    }
    data['profileId'] = profileId;
    data['invoice_number'] = invoiceNumber;
    data['totalPrice'] = totalPrice;
    data['totalFees'] = totalFees;
    data['totalProduct'] = totalProduct;
    data['imageAttach'] = imageAttach;
    data['shipmentId'] = shipmentId;
    data['description'] = description;
    data['lastEditAt'] = lastEditAt;
    if (product != null) {
      data['product'] = product!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
// class OrderHistory {
//   String? id;
//   String? profileId;
//   String? invoiceNumber;
//   String? totalPrice;
//   String? totalFees;
//   String? totalProduct;
//   String? imageAttach;
//   String? shipmentId;
//   String? description;
//   String? status;
//   String? lastEditAt;
//   String? createdAt;
//   Transaction? transaction;
//   List<Product>? product;

//   OrderHistory(
//       {this.id,
//       this.profileId,
//       this.invoiceNumber,
//       this.totalPrice,
//       this.totalFees,
//       this.totalProduct,
//       this.imageAttach,
//       this.shipmentId,
//       this.description,
//       this.status,
//       this.lastEditAt,
//       this.createdAt,
//       this.transaction,
//       this.product});

//   OrderHistory.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     profileId = json['profileId'];
//     invoiceNumber = json['invoice_number'];
//     totalPrice = json['totalPrice'];
//     totalFees = json['totalFees'];
//     totalProduct = json['totalProduct'];
//     imageAttach = json['imageAttach'];
//     shipmentId = json['shipmentId'];
//     description = json['description'];
//     status = json['status'];
//     lastEditAt = json['lastEditAt'];
//     createdAt = json['createdAt'];
//     transaction = json['transaction'] != null
//         ? Transaction.fromJson(json['transaction'])
//         : null;
//     if (json['product'] != null) {
//       product = <Product>[];
//       json['product'].forEach((v) {
//         product!.add(Product.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['profileId'] = profileId;
//     data['invoice_number'] = invoiceNumber;
//     data['totalPrice'] = totalPrice;
//     data['totalFees'] = totalFees;
//     data['totalProduct'] = totalProduct;
//     data['imageAttach'] = imageAttach;
//     data['shipmentId'] = shipmentId;
//     data['description'] = description;
//     data['status'] = status;
//     data['lastEditAt'] = lastEditAt;
//     data['createdAt'] = createdAt;
//     if (transaction != null) {
//       data['transaction'] = transaction!.toJson();
//     }
//     if (product != null) {
//       data['product'] = product!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

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
  DateTime? createdAt;
  String? lastEditAt;
  String? approvedAt;
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
    createdAt =
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]);
    lastEditAt = json['lastEditAt'];
    approvedAt = json['approvedAt'];
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
    data['rejectedAt'] = rejectedAt;
    return data;
  }
}

class Product {
  String? id;
  int? quantity;
  String? fee;
  String? bokingDate;
  String? bokingTime;
  String? productId;
  String? sellerProfileId;
  String? sellerUsername;
  String? sellerName;
  String? sellerThumbnail;
  String? name;
  String? price;
  String? description;
  List<String>? keywords;
  // List<ImageResult>? images;
  List<String>? images;
  String? createdAt;
  OrderHistory? order;
  List<Schedule>? schedule;
  BuyerModel? buyer;
  Transaction? transaction;
  Earning? earning;

  Product({
    this.id,
    this.quantity,
    this.fee,
    this.bokingDate,
    this.bokingTime,
    this.productId,
    this.sellerProfileId,
    this.sellerUsername,
    this.sellerName,
    this.sellerThumbnail,
    this.name,
    this.price,
    this.description,
    this.keywords,
    this.images,
    this.createdAt,
    this.order,
    this.schedule,
    this.buyer,
    this.transaction,
    this.earning,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    fee = json['fee'];
    bokingDate = json['boking_date'];
    bokingTime = json['boking_time'];
    productId = json['productId'];
    sellerProfileId = json['sellerProfileId'];
    sellerUsername = json['sellerUsername'];
    sellerName = json['sellerName'];
    sellerThumbnail = json['sellerThumbnail'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    keywords = json['keywords'] == null
        ? null
        : json['keywords'] is String
            ? [] //json['keywords']
            : List<String>.from(json['keywords'].map((e) => e));
    images = json['images'] == null
        ? null
        : json['images'] is String
            ? json['images']
            : List<String>.from(json['images'].map((e) => e));
    // : List<String>.from(
    //     json['images'].map((e) => ImageResult.fromJson(e).url));

    createdAt = json['createdAt'];
    order = json['order'] == null ? null : OrderHistory.fromJson(json['order']);
    schedule = json['schedule'] == null
        ? null
        : List.from(json['schedule'].map((e) => Schedule.fromJson(e)));
    buyer = json['buyer'] == null ? null : BuyerModel.fromJson(json['buyer']);
    transaction = json['transaction'] != null
        ? Transaction.fromJson(json['transaction'])
        : null;
    // earning =
    //     json['earning'] is int ? json['earning'].toDouble() : json['earning'];
    try {
      earning =
          json['earning'] == null ? null : Earning.fromJson(json['earning']);
    } catch (e) {
      debugPrint(e.toString());
      earning = null;
      // json['earning'] is int ? json['earning'].toDouble() : json['earning'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quantity'] = quantity;
    data['fee'] = fee;
    data['boking_date'] = bokingDate;
    data['boking_time'] = bokingTime;
    data['productId'] = productId;
    data['sellerProfileId'] = sellerProfileId;
    data['sellerUsername'] = sellerUsername;
    data['sellerName'] = sellerName;
    data['sellerThumbnail'] = sellerThumbnail;
    data['name'] = name;
    data['price'] = price;
    data['description'] = description;
    data['keywords'] = keywords;
    data['images'] = images;
    data['createdAt'] = createdAt;
    data['order'] = order?.toJson();
    data['buyer'] = buyer?.toJson();
    data['transactin'] = transaction?.toJson();
    data['earning'] = earning?.toJson();
    return data;
  }
}

class Earning {
  double? earningFee;
  double? earningAmount;
  String? earningCurrency;

  Earning({
    this.earningFee,
    this.earningAmount,
    this.earningCurrency,
  });

  Earning.fromJson(Map<String, dynamic> json) {
    earningFee = json['earning_fee'] == null
        ? null
        : json['earning_fee'] is int
            ? json['earning_fee'].toDouble()
            : json['earning_fee'];
    earningAmount = json['earning_fee'] == null
        ? null
        : json['earning_amount'] is int
            ? json['earning_amount'].toDouble()
            : json['earning_amount'];
    earningCurrency = json['earning_currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['earning_fee'] = earningFee;
    data['earning_amount'] = earningAmount;
    data['earning_currency'] = earningCurrency;
    return data;
  }
}
