class GoogleSocialData {
  String? uid;
  String? displayName;
  String? email;
  String? photoUrl;

  GoogleSocialData({this.uid, this.displayName, this.email, this.photoUrl});

  GoogleSocialData.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    displayName = json['displayName'];
    email = json['email'];
    photoUrl = json['photoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['displayName'] = displayName;
    data['email'] = email;
    data['photoUrl'] = photoUrl;
    return data;
  }
}
