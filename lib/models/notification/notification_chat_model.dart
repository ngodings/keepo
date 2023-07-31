class NotificationChat {
  String? chatId;
  String? userId;
  String? userName;
  String? userPic;
  String? message;
  String? title;
  String? page;
  String? type;

  NotificationChat(
      {this.chatId,
        this.userId,
        this.userName,
        this.userPic,
        this.message,
        this.title,
        this.page,
        this.type});

  NotificationChat.fromJson(Map<String, dynamic> json) {
    chatId = json['chatId'];
    userId = json['userId'];
    userName = json['userName'];
    userPic = json['userPic'];
    message = json['message'];
    title = json['title'];
    page = json['page'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chatId'] = chatId;
    data['userId'] = userId;
    data['userName'] = userName;
    data['userPic'] = userPic;
    data['message'] = message;
    data['title'] = title;
    data['page'] = page;
    data['type'] = type;
    return data;
  }
}
