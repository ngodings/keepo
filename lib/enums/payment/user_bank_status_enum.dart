enum UserBankEnum {
  pendingApproval('Pending Approval'),
  rejected('Rejected'),
  active('Active');

  const UserBankEnum(this.type);
  final String type;
}

extension ConvertUserBank on String {
  UserBankEnum toEnum() {
    switch (this) {
      case 'Pending Approval':
        return UserBankEnum.pendingApproval;
      case 'Rejected':
        return UserBankEnum.rejected;
      default:
        return UserBankEnum.active;
    }
  }
}
