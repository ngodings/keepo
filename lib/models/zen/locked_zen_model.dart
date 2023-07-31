import 'package:keepo/models/transaction/transaction_status_model.dart';

class LockedZEN {
  String? available;
  List<Transaction>? transaction;

  LockedZEN({this.available, this.transaction});

  LockedZEN.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    if (json['transaction'] != null) {
      transaction = <Transaction>[];
      json['transaction'].forEach((v) {
        transaction!.add(Transaction.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['available'] = available;
    if (transaction != null) {
      data['transaction'] = transaction!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
