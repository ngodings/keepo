import 'dart:convert';

import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:keepo/enums/message_enum.dart';
import 'package:keepo/models/friends/friend_list.dart';
import 'package:keepo/models/profile/profile_details.dart';
import 'package:keepo/models/transaction/transaction_status_model.dart';

class MessageData {
  int? lastPage;
  List<Message>? messages;

  MessageData({this.lastPage, this.messages});

  MessageData.fromJson(Map<String, dynamic> json) {
    lastPage = json['last_page'];
    if (json['data'] != null) {
      messages = <Message>[];
      json['data'].forEach((v) {
        messages!.add(Message.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['last_page'] = lastPage;
    if (messages != null) {
      data['data'] = messages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Message {
  String? userId;
  String? selfId;
  String? groupId;
  String? sender;
  String? senderPic;
  String? receiver;
  String? receiverPic;
  dynamic messageId;
  MessageEnum? type;
  String? status;
  bool? ticket;
  String? message;
  String? timestamp;
  bool? read;
  MessageFile? messageFile;
  MessageContact? messageContact;
  MessageFriendContact? messageFriendContact;
  MessageLocation? messageLocation;
  MessageReply? messageReply;
  CreatedGroupMessage? createdGroupMessage;
  OrderHistory? orderHistory;
  JoinLeaveGroupMsg? joinLeaveGroupMsg;
  bool? deleted;
  DateTime? createdAt;
  DateTime? lastEditedAt;

  Message({
    this.selfId,
    this.groupId,
    this.userId,
    this.messageId,
    this.receiver,
    this.receiverPic,
    this.sender,
    this.senderPic,
    this.status,
    this.ticket,
    this.type,
    this.message,
    this.timestamp,
    this.read,
    this.messageFile,
    this.messageContact,
    this.messageFriendContact,
    this.messageLocation,
    this.createdGroupMessage,
    this.orderHistory,
    this.joinLeaveGroupMsg,
    this.deleted,
    this.createdAt,
    this.lastEditedAt,
  });

  Message.fromJson(Map<String, dynamic> json) {
    selfId = json['selfId'];
    userId = json['userId'];
    messageId = json['id'];
    sender = json['sender'];
    receiver = json['receiver'];
    receiverPic = json['receiver_pic'];
    senderPic = json['sender_pic'];
    status = json['status'];
    ticket = json['ticket'];
    type = ((json['type'] ?? "text") as String).toEnum();
    timestamp = json['timestamp'];
    if (json['type'] == 'image' ||
        json['type'] == 'video' ||
        json['type'] == 'file' ||
        json['type'] == 'audio') {
      messageFile = json['message'] != null
          ? MessageFile.fromJson(jsonDecode(json['message']))
          : null;
    } else if (json['type'] == 'contact') {
      messageContact = json['message'] != null
          ? MessageContact.fromJson(jsonDecode(json['message']))
          : null;
    } else if (json['type'] == 'friendContact') {
      messageFriendContact = json['message'] != null
          ? MessageFriendContact.fromJson(jsonDecode(json['message']))
          : null;
    } else if (json['type'] == 'location') {
      messageLocation = json['message'] != null
          ? MessageLocation.fromJson(jsonDecode(json['message']))
          : null;
    } else if (json['type'] == 'reply') {
      messageReply = json['message'] != null
          ? MessageReply.fromJson(jsonDecode(json['message']))
          : null;
    } else if (json['type'] == 'createdGroup') {
      createdGroupMessage = json['message'] != null
          ? CreatedGroupMessage.fromJson(jsonDecode(json['message']))
          : null;
    } else if (json['type'] == 'transaction' || json['type'] == 'tips') {
      orderHistory = json['message'] != null
          ? OrderHistory.fromJson(jsonDecode(json['message']))
          : null;
    } else if (json['type'] == 'joinLeaveGroupMsg') {
      joinLeaveGroupMsg = json['message'] != null
          ? JoinLeaveGroupMsg.fromJson(jsonDecode(json['message']))
          : null;
    } else {
      message = json['message'];
    }
    read = json['read'];
    createdAt =
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]);
    lastEditedAt =
        json["lastEditAt"] == null ? null : DateTime.parse(json["lastEditAt"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = messageId;
    data['selfId'] = selfId;
    data['sender'] = sender;
    data['sender_pic'] = senderPic;
    data['userId'] = userId;
    data['receiver'] = receiver;
    data['receiver_pic'] = receiverPic;
    data['type'] = type != null ? type!.type : null;
    data['message'] = message;
    data['status'] = status;
    data['ticket'] = ticket;
    data['read'] = read;
    data['lastEditAt'] = lastEditedAt;
    data['createdAt'] = createdAt;
    return data;
  }
}

class MessageFile {
  String? name;
  String? fileUrl;
  String? fileMime;
  String? size;
  String? msgChat;

  MessageFile(
      {this.name, this.fileUrl, this.fileMime, this.size, this.msgChat});

  MessageFile.fromJson(Map<String, dynamic> json) {
    name = json['file_name'];
    fileUrl = json['file_url'];
    fileMime = json['file_mime'];
    size = json['size'];
    msgChat = json['msgChat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['file_name'] = name;
    data['file_url'] = fileUrl;
    data['file_mime'] = fileMime;
    data['size'] = size;
    data['msgChat'] = msgChat;
    return data;
  }
}

class MessageContact {
  Contact? contact;
  String? id;
  String? displayName;
  List<ContactNumber>? number;

  MessageContact({this.contact, this.id, this.displayName, this.number});

  MessageContact.fromJson(Map<String, dynamic> json) {
    contact = Contact.fromJson(json['contact']);
    id = json['id'];
    displayName = json['displayName'];
    if (json['number'] != null) {
      number = <ContactNumber>[];
      jsonDecode(json['number']).forEach((v) {
        number!.add(ContactNumber.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['contact'] = contact?.toJson();
    data['id'] = id;
    data['displayName'] = displayName;
    if (number != null) {
      data['number'] = number!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MessageFriendContact {
  Friend? friend;
  String? name;

  MessageFriendContact({this.friend, this.name});

  MessageFriendContact.fromJson(Map<String, dynamic> json) {
    friend = json['friend'] == null ? null : Friend.fromJson(json['friend']);
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['friend'] = friend?.toJson();
    data['name'] = name;
    return data;
  }
}

class ContactNumber {
  String? number;
  String? normalizedNumber;
  String? label;
  String? customLabel;
  bool? isPrimary;

  ContactNumber(
      {this.number,
      this.normalizedNumber,
      this.label,
      this.customLabel,
      this.isPrimary});

  ContactNumber.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    normalizedNumber = json['normalizedNumber'];
    label = json['label'];
    customLabel = json['customLabel'];
    isPrimary = json['isPrimary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    data['normalizedNumber'] = normalizedNumber;
    data['label'] = label;
    data['customLabel'] = customLabel;
    data['isPrimary'] = isPrimary;
    return data;
  }
}

class MessageLocation {
  double? latitude;
  double? longitude;
  String? name;
  String? street;

  MessageLocation({this.longitude, this.latitude, this.name, this.street});

  MessageLocation.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    name = json['name'];
    street = json['street'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['name'] = name;
    data['street'] = street;
    return data;
  }
}

class MessageReply {
  String? replyText;
  String? message;
  String? idMessage;
  String? messageUser;

  MessageReply(
      {this.message, this.replyText, this.idMessage, this.messageUser});

  MessageReply.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    replyText = json['replyText'];
    idMessage = json['idMessage'];
    messageUser = json['messageUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['replyText'] = replyText;
    data['message'] = message;
    data['idMessage'] = idMessage;
    data['messageUser'] = messageUser;
    return data;
  }
}

class JoinLeaveGroupMsg {
  String? profileId;
  String? name;
  String? type;

  JoinLeaveGroupMsg({
    this.profileId,
    this.name,
    this.type,
  });

  JoinLeaveGroupMsg.fromJson(Map<String, dynamic> json) {
    profileId = json['profileId'];
    name = json['name'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['type'] = type;
    data['profileId'] = profileId;
    return data;
  }
}

class CreatedGroupMessage {
  String? groupName;
  DateTime? dateCreated;
  String? creatorId;
  List<ProfileDetails>? firstAddedParticipant;

  CreatedGroupMessage(
      {this.dateCreated,
      this.creatorId,
      this.firstAddedParticipant,
      this.groupName});

  CreatedGroupMessage.fromJson(Map<String, dynamic> json) {
    groupName = json['groupName'];
    dateCreated = json["dateCreated"] == null
        ? null
        : DateTime.parse(json["dateCreated"]);
    creatorId = json['creatorId'];
    firstAddedParticipant = json['firstAddedParticipant'] == null
        ? null
        : (json['firstAddedParticipant'] as List<dynamic>)
            .map((e) => ProfileDetails.fromJson(e))
            .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['groupName'] = groupName;
    data['dateCreated'] = dateCreated?.toIso8601String();
    data['creatorId'] = creatorId;
    if (firstAddedParticipant != null) {
      data['firstAddedParticipant'] =
          firstAddedParticipant!.map((v) => v.toJson()).toList();
    }
    // data['firstAddedParticipant'] = firstAddedParticipant == null ? null : firstAddedParticipant!.map((v) => v.toJson()).toList();
    return data;
  }
}
