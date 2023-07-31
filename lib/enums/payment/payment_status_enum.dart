enum TransactionStatusEnum {
  paymentRequired('Payment Required'),
  transactionPending('Transaction Pending'),
  transactionAccepted('Transaction Accepted'),
  transactionRejected('Transaction Rejected'),
  transactionCompleted('Transaction Completed'),
  transactionFailed('Transaction Failed'),
  transactionCancelled('Transaction Cancelled'),
  transactionRefunded('Transaction Refunded'),
  all('All');

  const TransactionStatusEnum(this.type);
  final String type;
}

extension ConvertTransactionStatus on String {
  TransactionStatusEnum toEnums() {
    switch (this) {
      case 'Transaction Pending':
        return TransactionStatusEnum.transactionPending;
      case 'Transaction Accepted':
        return TransactionStatusEnum.transactionAccepted;
      case 'Transaction Rejected':
        return TransactionStatusEnum.transactionRejected;
      case 'Transaction Completed':
        return TransactionStatusEnum.transactionCompleted;
      case 'Transaction Failed':
        return TransactionStatusEnum.transactionFailed;
      case 'Transaction Cancelled':
        return TransactionStatusEnum.transactionCancelled;
      case 'Transaction Refunded':
        return TransactionStatusEnum.transactionRefunded;
      case 'All':
        return TransactionStatusEnum.all;
      default:
        return TransactionStatusEnum.paymentRequired;
    }
  }
}
