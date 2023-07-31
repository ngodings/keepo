class GroupModel {
  String? id;
  String? userId;
  String? slug;
  String? status;
  bool? deleted;
  DateTime? lastEditAt;
  DateTime? createdAt;

  GroupModel({
    this.id,
    this.userId,
    this.slug,
    this.status,
    this.deleted,
    this.lastEditAt,
    this.createdAt,
  });

  GroupModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['groupId'];
    slug = json['slug'];
    status = json['status'];
    deleted = json['deleted'];
    createdAt =
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]);
    lastEditAt =
        json["lastEditAt"] == null ? null : DateTime.parse(json["lastEditAt"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['groupId'] = userId;
    data['slug'] = slug;
    data['status'] = status;
    data['deleted'] = deleted;
    data['lastEditAt'] = lastEditAt;
    data['createdAt'] = createdAt;
    return data;
  }
}
