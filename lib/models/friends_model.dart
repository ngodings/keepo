class Friends {
  String? userId;
  String? username;
  String? lastLogin;
  String? imageUrl;

  Friends(
      {String? userId, String? username, String? lastLogin, String? imageUrl}) {
    if (userId != null) {
      userId = userId;
    }
    if (username != null) {
      username = username;
    }
    if (lastLogin != null) {
      lastLogin = lastLogin;
    }
    if (imageUrl != null) {
      imageUrl = imageUrl;
    }
  }

  Friends.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    username = json['username'];
    lastLogin = json['last_login'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['username'] = username;
    data['last_login'] = lastLogin;
    data['image_url'] = imageUrl;
    return data;
  }
}
