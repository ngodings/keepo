class GroupResult {
  String? id;
  String? groupImage;
  String? groupName;
  String? groupId;
  int? participant;
  String? description;
  List<String>? keywords;
  String? status;
  bool? deleted;
  String? lastEditAt;
  DateTime? createdAt;
  String? creatorProfile;

  GroupResult({
    this.id,
    this.groupImage,
    this.groupName,
    this.groupId,
    this.participant,
    this.description,
    this.keywords,
    this.status,
    this.deleted,
    this.lastEditAt,
    this.createdAt,
    this.creatorProfile,
  });

  GroupResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupImage = json['groupimage'];
    groupName = json['groupname'];
    groupId = json['groupId'];
    participant = json['participant'];
    description = json['description'];
    keywords = json["keywords"] == null
        ? null
        : List<String>.from(json["keywords"].map((x) => x));
    status = json['status'];
    deleted = json['deleted'];
    lastEditAt = json['lastEditAt'];
    createdAt =
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]);
    creatorProfile = json['creatorProfile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['groupname'] = groupName;
    data['groupimage'] = groupImage;
    data['groupId'] = groupId;
    data['participant'] = participant;
    data['description'] = description;
    data['keywords'] = keywords;
    data['status'] = status;
    data['deleted'] = deleted;
    data['lastEditAt'] = lastEditAt;
    data['createdAt'] = createdAt;
    data['creatorProfile'] = creatorProfile;
    return data;
  }
}
