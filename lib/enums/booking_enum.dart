enum BookingEnum {
  pending('Transaction Pending'),
  accepted('Transaction Accepted'),
  completed('Transaction Completed'),
  canceled('Transaction Canceled'),
  refunded('Transaction Refunded');

  const BookingEnum(this.type);
  final String type;
}

// Using an extension
// Enhanced enums

extension ConvertBooking on String {
  BookingEnum toEnum() {
    switch (this) {
      case 'Transaction Pending':
        return BookingEnum.pending;
      case 'Transaction Accepted':
        return BookingEnum.accepted;
      case 'Transaction Completed':
        return BookingEnum.completed;
      case 'Transaction Canceled':
        return BookingEnum.canceled;
      case 'Transaction Refunded':
        return BookingEnum.refunded;
      default:
        return BookingEnum.pending;
    }
  }
}
