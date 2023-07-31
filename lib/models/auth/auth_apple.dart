class AppleSocialData {
  String? uid;
  String? displayName;
  String? email;

  AppleSocialData({
    this.uid,
    this.displayName,
    this.email,
  });

  AppleSocialData.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    displayName = json['displayName'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['displayName'] = displayName;
    data['email'] = email;

    return data;
  }
}
