enum TierListEnum {
  basic('Basic'),
  sapphire('Sapphire'),
  ruby('Ruby'),
  pearl('Pearl'),
  emerald('Emerald'),
  gold('Gold'),
  diamond('Diamond');

  const TierListEnum(this.type);
  final String type;
}

extension ConvertTierList on String {
  TierListEnum toEnum() {
    switch (this) {
      case 'Sapphire':
        return TierListEnum.sapphire;
      case 'Ruby':
        return TierListEnum.ruby;
      case 'Pearl':
        return TierListEnum.pearl;
      case 'Emerald':
        return TierListEnum.emerald;
      case 'Gold':
        return TierListEnum.gold;
      case 'Diamond':
        return TierListEnum.diamond;
      default:
        return TierListEnum.basic;
    }
  }
}
