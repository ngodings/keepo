import 'package:keepo/models/friends_model.dart';

class Socials {
  String? order;
  String? page;
  List<Friends>? friends;

  Socials({String? order, String? page, List<Friends>? friends}) {
    if (order != null) {
      this.order = order;
    }
    if (page != null) {
      this.page = page;
    }
    if (friends != null) {
      this.friends = friends;
    }
  }

  Socials.fromJson(Map<String, dynamic> json) {
    order = json['order'];
    page = json['page'];
    if (json['friends'] != null) {
      friends = <Friends>[];
      json['friends'].forEach((v) {
        friends!.add(Friends.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order'] = order;
    data['page'] = page;
    if (friends != null) {
      data['friends'] = friends!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
