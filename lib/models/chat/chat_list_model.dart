import 'dart:convert';

import 'package:keepo/enums/chat_enum.dart';
import 'package:keepo/models/chat/group_model.dart';

class Chat {
  String? id;
  String? groupId;
  String? selfId;
  String? sender;
  String? senderPic;
  String? senderIndicator;
  bool? senderDeleted;
  String? userId;
  String? receiver;
  String? receiverPic;
  String? receiverIndicator;
  bool? receiverDeleted;
  String? groupName;
  String? groupImage;
  String? description;
  List<String>? keywords;
  ChatEnum? type;
  String? status;
  String? rooms;
  String? unread;
  bool? deleted;
  DateTime? lastEditAt;
  DateTime? createdAt;
  String? lastMessage;
  bool? joined;
  GroupModel? group;

  Chat({
    this.id,
    this.groupId,
    this.selfId,
    this.sender,
    this.senderPic,
    this.senderIndicator,
    this.userId,
    this.receiver,
    this.receiverPic,
    this.receiverIndicator,
    this.groupName,
    this.description,
    this.keywords,
    this.type,
    this.status,
    this.rooms,
    this.unread,
    this.deleted,
    this.lastEditAt,
    this.createdAt,
    this.groupImage,
    this.receiverDeleted,
    this.senderDeleted,
    this.lastMessage,
    this.joined,
    this.group,
  });

  Chat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupId = json['groupId'];
    selfId = json['selfId'];
    sender = json['sender'];
    senderPic = json['sender_pic'];
    senderIndicator = json['sender_indicator'];
    senderDeleted = json['sender_deleted'];
    userId = json['userId'];
    receiver = json['receiver'];
    receiverPic = json['receiver_pic'];
    receiverIndicator = json['receiver_indicator'];
    receiverDeleted = json['receiver_deleted'];
    groupName = json['groupname'];
    groupImage = json['groupimage'];
    description = json['description'];
    keywords = json["keywords"] == null || json['keywords'].isEmpty
        ? null
        : List<String>.from(jsonDecode(json["keywords"]).map((x) => x));
    type = ((json['type'] ?? "single") as String).toEnum();
    status = json['status'];
    rooms = json['rooms'];
    unread = json['unread'];
    deleted = json['deleted'];
    createdAt =
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]);
    lastEditAt =
        json["lastEditAt"] == null ? null : DateTime.parse(json["lastEditAt"]);
    lastMessage = json['lastMessage'];
    joined = json['joined'];
    group = json['group'] == null ? null : GroupModel.fromJson(json['group']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['groupId'] = groupId;
    data['selfId'] = selfId;
    data['sender'] = sender;
    data['sender_pic'] = senderPic;
    data['sender_indicator'] = senderIndicator;
    data['userId'] = userId;
    data['receiver'] = receiver;
    data['receiver_pic'] = receiverPic;
    data['receiver_indicator'] = receiverIndicator;
    data['groupname'] = groupName;
    data['description'] = description;
    data['keywords'] = keywords;
    data['type'] = type;
    data['status'] = status;
    data['rooms'] = rooms;
    data['unread'] = unread;
    data['deleted'] = deleted;
    data['lastEditAt'] = lastEditAt;
    data['createdAt'] = createdAt;
    data['lastMessage'] = lastMessage;
    data['joined'] = joined;
    data['group'] = group;
    return data;
  }
}
