enum NotificationEnum {
  all('ALL'),
  unread('Unread'),
  chat('Chat'),
  matches('Matches'),
  booking('Booking'),
  payment('Payment'),
  withdraw('Withdraw'),
  kyc('KYC'),
  announcement('Announcement');

  const NotificationEnum(this.type);
  final String type;
}

// Using an extension
// Enhanced enums

extension ConvertKYCStatus on String {
  NotificationEnum toEnum() {
    switch (this) {
      case 'ALL':
        return NotificationEnum.all;
      case 'Unread':
        return NotificationEnum.unread;
      case 'Chat':
        return NotificationEnum.chat;
      case 'Matches':
        return NotificationEnum.matches;
      case 'Announcement':
        return NotificationEnum.announcement;
      case 'Booking':
        return NotificationEnum.booking;
      case 'Payment':
        return NotificationEnum.payment;
      case 'Withdraw':
        return NotificationEnum.withdraw;
      case 'KYC':
        return NotificationEnum.kyc;
      default:
        return NotificationEnum.all;
    }
  }
}
