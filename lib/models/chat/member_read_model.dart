class MemberRead {
  String? userId;
  String? timestamp;

  MemberRead({this.userId, this.timestamp});

  MemberRead.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['timestamp'] = timestamp;
    return data;
  }
}
