enum MessageEnum {
  text('text'),
  file('file'),
  image('image'),
  video('video'),
  audio('audio'),
  location('location'),
  contact('contact'),
  friendContact('friendContact'),
  transfer('transfer'),
  receive('receive'),
  deleted('deleted'),
  reply('reply'),
  link('link'),
  transaction('transaction'),
  tips('tips'),
  other('other'),
  joinLeaveGroupMsg('joinLeaveGroupMsg'),
  createdGroup('createdGroup');

  const MessageEnum(this.type);
  final String type;
}

// Using an extension
// Enhanced enums

extension ConvertMessage on String {
  MessageEnum toEnum() {
    switch (this) {
      case 'text':
        return MessageEnum.text;
      case 'file':
        return MessageEnum.file;
      case 'image':
        return MessageEnum.image;
      case 'video':
        return MessageEnum.video;
      case 'audio':
        return MessageEnum.audio;
      case 'location':
        return MessageEnum.location;
      case 'contact':
        return MessageEnum.contact;
      case 'transfer':
        return MessageEnum.transfer;
      case 'receive':
        return MessageEnum.receive;
      case 'deleted':
        return MessageEnum.deleted;
      case 'reply':
        return MessageEnum.reply;
      case 'link':
        return MessageEnum.link;
      case 'createdGroup':
        return MessageEnum.createdGroup;
      case 'friendContact':
        return MessageEnum.friendContact;
      case 'transaction':
        return MessageEnum.transaction;
      case 'tips':
        return MessageEnum.tips;
      case 'joinLeaveGroupMsg':
        return MessageEnum.joinLeaveGroupMsg;
      case 'other':
        return MessageEnum.other;
      default:
        return MessageEnum.other;
    }
  }
}
