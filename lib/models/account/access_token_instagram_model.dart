
class AccessTokenInstagram {
  AccessTokenInstagram({
    this.accessToken,
    this.userId,
  });

  String? accessToken;
  double? userId;

  factory AccessTokenInstagram.fromJson(Map<String, dynamic> json) => AccessTokenInstagram(
    accessToken: json["access_token"],
    userId: json["user_id"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "user_id": userId,
  };
}
