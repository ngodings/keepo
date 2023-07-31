enum KYCIdentityEnum {
  idCard('ID Card'),
  passport('Passport');

  const KYCIdentityEnum(this.type);
  final String type;
}

extension ConvertKYCIdentity on String {
  KYCIdentityEnum toEnum() {
    switch (this) {
      case 'ID Card':
        return KYCIdentityEnum.idCard;
      case 'Passport':
        return KYCIdentityEnum.passport;
      default:
        return KYCIdentityEnum.idCard;
    }
  }
}
