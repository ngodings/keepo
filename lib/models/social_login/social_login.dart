class SocialLogin {
  String? id;
  String? socialProvider;
  SocialData? socialData;
  String? createdAt;

  SocialLogin({this.id, this.socialProvider, this.socialData, this.createdAt});

  SocialLogin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    socialProvider = json['social_provider'];
    socialData = json['social_data'] != null
        ? SocialData.fromJson(json['social_data'])
        : null;
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['social_provider'] = socialProvider;
    if (socialData != null) {
      data['social_data'] = socialData!.toJson();
    }
    data['createdAt'] = createdAt;
    return data;
  }
}

class SocialData {
  int? id;
  String? name;
  String? email;
  Picture? picture;
  String? uid;
  String? displayName;
  String? photoUrl;

  SocialData(
      {this.id,
      this.name,
      this.email,
      this.picture,
      this.uid,
      this.displayName,
      this.photoUrl});

  SocialData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    picture =
        json['picture'] != null ? Picture.fromJson(json['picture']) : null;
    uid = json['uid'];
    displayName = json['displayName'];
    photoUrl = json['photoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    if (picture != null) {
      data['picture'] = picture!.toJson();
    }
    data['uid'] = uid;
    data['displayName'] = displayName;
    data['photoUrl'] = photoUrl;
    return data;
  }
}

class Picture {
  DataUrl? data;

  Picture({this.data});

  Picture.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? DataUrl.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataUrl {
  String? url;

  DataUrl({this.url});

  DataUrl.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    return data;
  }
}
