enum ChatEnum {
  single('Single'),
  group('Group');

  const ChatEnum(this.type);
  final String type;
}

extension ConvertChat on String {
  ChatEnum toEnum() {
    switch (this) {
      case 'Single':
        return ChatEnum.single;
      case 'Group':
        return ChatEnum.group;
      default:
        return ChatEnum.single;
    }
  }
}
